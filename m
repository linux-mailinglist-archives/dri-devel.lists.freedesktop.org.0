Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D413A2C7B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 15:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD886E090;
	Thu, 10 Jun 2021 13:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 511826E090
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=pxC9E
 nxMVqs3LNT5sCWptjPiO5xu1I0lUTky1QGVIPY=; b=Kh8KROiIp4LmblfzwQlLs
 1c0TY2psTDLStnV0z1F7u5W3/O+zNLxFAmF4rkaiJtMNRYYoo22OaMZ2QajWKdQg
 4NBk9e87gt4n8ASRkoGTQPn/6bDkG2p5cFgxjQpyDXQcbfSOxUGrQXN80d/s20I5
 LX31UBlCM8NAHPXs585vhk=
Received: from localhost (unknown [218.17.89.111])
 by smtp12 (Coremail) with SMTP id EMCowAD30zpzDsJgPWKXwQ--.45531S2;
 Thu, 10 Jun 2021 21:07:12 +0800 (CST)
Date: Thu, 10 Jun 2021 21:06:59 +0800
From: Chunyou Tang <tangchunyou@163.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] modified: gpu/drm/panfrost/panfrost_gpu.c
Message-ID: <20210610210659.00003155@163.com>
In-Reply-To: <78a2488a-71d5-548a-e221-7786f788509c@arm.com>
References: <20210609063850.2060-1-tangchunyou@163.com>
 <78a2488a-71d5-548a-e221-7786f788509c@arm.com>
Organization: icube
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.16.6; i586-pc-mingw32msvc)
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowAD30zpzDsJgPWKXwQ--.45531S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFyfZr4kKFyDXw48Cr1kuFg_yoW5Gr4fpF
 yDAFyYyF9YqF1jqa1q93WxKFy5uay8Ja4kW3WDCrZ0yFsIqFn8KwsrKa409FyUurW8Zw12
 va1xAry7Wa15Z3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jTZX5UUUUU=
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiHgCtUVSIvHe1SgAAsK
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
Cc: tangchunyou <tangchunyou@163.icubecorp.cn>, tomeu.vizoso@collabora.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 tangchunyou@icubecorp.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

> > The GPU exception fault status register(0x3C),the low 8 bit is the
> > EXCEPTION_TYPE.We can see the description at P3-78 in spec.

	You can see the spec
	<arm_heimdall_technical_reference_manual_100612_0001_00_en.pdf>.

> However this change is correct - panfrost_exception_name() should be
> taking only the lower 8 bits. Even better though would be to to report
> the full raw fault information as well as the high bits can contain
> useful information:
> 
> 	dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
> 		 fault_status,
> 		 panfrost_exception_name(pfdev, fault_status & 0xFF),
> 		 address);

So I change it according to what you said?

ÓÚ Thu, 10 Jun 2021 11:41:52 +0100
Steven Price <steven.price@arm.com> Ð´µÀ:

> The subject should have the prefix "drm/panfrost" and should mention
> what the patch is changing (not just the filename).
> 
> On 09/06/2021 07:38, ChunyouTang wrote:
> > From: tangchunyou <tangchunyou@163.icubecorp.cn>
> > 
> > The GPU exception fault status register(0x3C),the low 8 bit is the
> > EXCEPTION_TYPE.We can see the description at P3-78 in spec.
> 
> Nit: When referring to a spec it's always good to mention the name -
> I'm not sure which specification you found this in.
> 
> > 
> > Signed-off-by: tangchunyou <tangchunyou@163.icubecorp.cn>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> > b/drivers/gpu/drm/panfrost/panfrost_gpu.c index
> > 2aae636f1cf5..1fffb6a0b24f 100644 ---
> > a/drivers/gpu/drm/panfrost/panfrost_gpu.c +++
> > b/drivers/gpu/drm/panfrost/panfrost_gpu.c @@ -33,7 +33,7 @@ static
> > irqreturn_t panfrost_gpu_irq_handler(int irq, void *data) address
> > |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO); 
> >  		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at
> > 0x%016llx\n",
> > -			 fault_status & 0xFF,
> > panfrost_exception_name(pfdev, fault_status),
> > +			 fault_status & 0xFF,
> > panfrost_exception_name(pfdev, fault_status & 0xFF),
> 
> However this change is correct - panfrost_exception_name() should be
> taking only the lower 8 bits. Even better though would be to to report
> the full raw fault information as well as the high bits can contain
> useful information:
> 
> 	dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
> 		 fault_status,
> 		 panfrost_exception_name(pfdev, fault_status & 0xFF),
> 		 address);
> 
> Thanks,
> 
> Steve
> 
> >  			 address);
> >  
> >  		if (state & GPU_IRQ_MULTIPLE_FAULT)
> > 


