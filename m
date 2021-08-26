Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 644713F8759
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1726E826;
	Thu, 26 Aug 2021 12:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5396E826;
 Thu, 26 Aug 2021 12:25:14 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 42B9822173;
 Thu, 26 Aug 2021 14:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1629980713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NO66SlcglsAtwRHk9/RoqD9t2fjAjr5n+D4doJAgl5U=;
 b=RPf4yBTyHCR/f40J/p1KVngoIVbiRdrufuVB8ya8cXbAK1HB39/fWGtfcaT5s37EXf8Zrg
 OKVuCAYfmfhF+qZYpvjy1YwskTazm8YWB1dHhYBmLci6H0vjhs/vKV4V1HWYvBLansDQCe
 VeGpb9YQIjfkWgwyhE1Ss/AhyMkSebk=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Aug 2021 14:25:13 +0200
From: Michael Walle <michael@walle.cc>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Lukas F . Hartmann" <lukas@mntre.com>, Marek
 Vasut <marek.vasut@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/etnaviv: use a 32 bit mask as coherent DMA mask
In-Reply-To: <20210826121917.GS22278@shell.armlinux.org.uk>
References: <20210826121006.685257-1-michael@walle.cc>
 <20210826121006.685257-4-michael@walle.cc>
 <20210826121917.GS22278@shell.armlinux.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0f67c2a847963ee13ad02762866c94bf@walle.cc>
X-Sender: michael@walle.cc
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-08-26 14:19, schrieb Russell King (Oracle):
> On Thu, Aug 26, 2021 at 02:10:06PM +0200, Michael Walle wrote:
>> -	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
>> -	pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
>> +	/*
>> +	 * PTA and MTLB can have 40 bit base addresses, but
>> +	 * unfortunately, an entry in the MTLB can only point to a
>> +	 * 32 bit base address of a STLB. Moreover, to initialize the
>> +	 * MMU we need a command buffer with a 32 bit address because
>> +	 * without an MMU there is only an indentity mapping between
>> +	 * the internal 32 bit addresses and the bus addresses.
>> +	 *
>> +	 * To make things easy, we set the dma_coherent_mask to 32
>> +	 * bit to make sure we are allocating the command buffers and
>> +	 * TLBs in the lower 4 GiB address space.
>> +	 */
>> +	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
>> +	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {
>> +		dev_dbg(&pdev->dev, "No suitable DMA available\n");
>> +		return -ENODEV;
>> +	}
> 
> This makes no sense. In the previous patch, you initialised
> pdev->dev.dma_mask ot point at the coherent mask, implying that
> it wasn't already set - for which dma_coerce_mask_and_coherent()
> should be used. Now you're just calling dma_set_mask(), which will
> fail if pdev->dev.dma_mask hasn't already been set to point at
> something.
> 
> If it's already been initialised to point at something, then you
> shouldn't be overwriting it in the driver, and you should've used
> dma_set_mask_and_coherent() in your previous patch.
> 
> Confused.

Mh, I see that moving these two lines was a bad idea. See commit
message in patch 2/3:
> Also move the dma mask assignemnts to probe() to keep all DMA related
> settings together.

The actual fix in patch 2/3 is the move of the of_dma_configure()
not the dma_mask assignments.

-michael
