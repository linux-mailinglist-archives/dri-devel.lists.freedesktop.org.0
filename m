Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9C180C8D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBBC6E8F8;
	Tue, 10 Mar 2020 23:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492336E2E1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 14:12:47 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0CFAA23ECA;
 Tue, 10 Mar 2020 15:12:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1583849565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEWql192yhW7vtj33Ar2ueUuqZzJlfD7KDs4yhM6yuY=;
 b=PQ+UEguI+6SdYnqx6Rtn22RYead+fBmeyqt/n8R9DqO///TzSh9elzyIUB3fkJAb0eDZkH
 LWEdFzv03wvcW/kGvWMN7I+dWJRmr4aT5cBkoKjGHrgK+MmtC/QZH3j6F5n8VhXFi9rds0
 nYmd9aodavlaShm5p5AGAcONE0ELWCI=
MIME-Version: 1.0
Date: Tue, 10 Mar 2020 15:12:45 +0100
From: Michael Walle <michael@walle.cc>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH] spi: spi-fsl-dspi: fix DMA mapping
In-Reply-To: <CA+h21hqMoPhbq8YG0UeV1kP0iXApYsJvb9MZjPGX54dm2U-KnQ@mail.gmail.com>
References: <20200310073313.21277-1-michael@walle.cc>
 <4beb5200a76f2d817be7276444543de4@walle.cc>
 <ea6ffa30ddc2459d07935e5e61a41172@walle.cc>
 <CA+h21hqMoPhbq8YG0UeV1kP0iXApYsJvb9MZjPGX54dm2U-KnQ@mail.gmail.com>
Message-ID: <76923af394f334337a3cac125c270087@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: /
X-Spam-Status: No, score=-0.10
X-Rspamd-Server: web
X-Spam-Score: -0.10
X-Rspamd-Queue-Id: 0CFAA23ECA
X-Spamd-Result: default: False [-0.10 / 15.00]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 NEURAL_HAM(-0.00)[-0.597]; FREEMAIL_TO(0.00)[gmail.com];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2020-03-10 14:02, schrieb Vladimir Oltean:
> On Tue, 10 Mar 2020 at 10:12, Michael Walle <michael@walle.cc> wrote:
>> 
>> Am 2020-03-10 08:40, schrieb Michael Walle:
>> > Am 2020-03-10 08:33, schrieb Michael Walle:
>> >> Use the correct device to request the DMA mapping. Otherwise the IOMMU
>> >> doesn't get the mapping and it will generate a page fault.
>> >>
>> >> The error messages look like:
>> >> [    3.008452] arm-smmu 5000000.iommu: Unhandled context fault:
>> >> fsr=0x402, iova=0xf9800000, fsynr=0x3f0022, cbfrsynra=0x828, cb=8
>> >> [    3.020123] arm-smmu 5000000.iommu: Unhandled context fault:
>> >> fsr=0x402, iova=0xf9800000, fsynr=0x3f0022, cbfrsynra=0x828, cb=8
>> >>
>> >> This was tested on a custom board with a LS1028A SoC.
>> >
>> > Oh fu.. please disregard this patch. DMA mapping still isn't working.
>> > Somehow I missed that the transfer mode was turned back to its default
>> > XSPI mode.
>> 
>> Damn. I need more coffee.. this patch IS working. Only the first probe
>> fails due to EPROBE_DEFER.
>> 
>> [    2.539706] fsl-dspi 2120000.spi: rx dma channel not available 
>> (-517)
>> [    2.546200] fsl-dspi 2120000.spi: can't get dma channels
>> [    3.622774] spi-nor spi1.0: w25q128fw (16384 Kbytes)
>> 
>> -michael
> 
> I'm testing LS1028A with IOMMU_DEFAULT_PASSTHROUGH=y and I didn't have
> time to change my setup now. I've also sent a v3 to my patch series
> which is going to conflict with this one, sorry.

No worries, its easy enough to rebase.

> I would have picked
> your patch up with my series but I didn't have the right environment
> to test it.

I'll resend a v2 once your series is working.

-michael
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
