Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFE93AEEA3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 18:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315C26E212;
	Mon, 21 Jun 2021 16:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A626E212
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 16:30:26 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A82FD8296B;
 Mon, 21 Jun 2021 18:30:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624293025;
 bh=sMD/Dw3KvDZVBVwV2cBVZ7Dcj2PUSETEfhJqn/J/Q1U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=H3p4adeOKNk5zUF2f/Ywe9IygAKRmdVfVS7iXmLYNzDFEOzxLgajyMmQHU7e4Mm9f
 nMcYpSFGgQX23Jgy7bw5cdSYNtLRmJE+On6Xr8iTM12aeQfe9bupukpxNAKpVoQkw8
 UvU7beWKOxikdqV3DE6s3ZIKgnPI/Va4H+EpXHvuVtLKfPWhTPu33cgfJDyZsH5d5r
 mgqX26oIFHGm2HP/QtxE2XmdBCtGinJxPq0JdrsKVtAbYZe16Z99WpakVWVXdV5Me5
 VlkyqZqqtJtbLGCxwakDcEW4PLcSwut+J9F0Dr3wx+Xs7Pizllx0FiJoFy2BpZkj/n
 oldj64qvGKHCA==
Subject: Re: [PATCH] drm: mxsfb: Clear FIFO_CLEAR bit
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20210620224946.189524-1-marex@denx.de>
 <be290a3283ecadeb9269bd00e85adac99434eb82.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <85372867-2b5b-e97f-aa04-ed976db1eddb@denx.de>
Date: Mon, 21 Jun 2021 18:30:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <be290a3283ecadeb9269bd00e85adac99434eb82.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, ch@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/21/21 2:14 PM, Lucas Stach wrote:

[...]

>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> index 98d8ba0bae84..22cb749fc9bc 100644
>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> @@ -241,6 +241,9 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>>   
>>   	/* Clear the FIFOs */
>>   	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
>> +	readl(mxsfb->base + LCDC_CTRL1);
> 
> Do you really need those readbacks? As both writes are targeting the
> same slave interface, the memory barrier in the clear write should push
> the set write.

What would push the clear write then ? We can drop one of the readl()s, 
but not the last one.
