Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FD93AD6F6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 05:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470296EB0C;
	Sat, 19 Jun 2021 03:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTP id 31D826EB0C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 03:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=TiTHf
 5QkrBI813AjEkIUzLOaotHjQyVGsD/vMhq6Ouk=; b=c2JNHE2Nq/BOkiiXKXUSW
 aH/puZNXwmq51LcDk9rBu1YuLtO4Ljw2yIl1/PfcRF5CpZVCMYFS5C+VVGLN8bUH
 kUwNsg3p4WnmqpuqShya7pPv2oN48LfIqNwTtFO4MmVEDlsfcy5wC2l2Zx/MX0+x
 9JvtWIjJNVYd9E6+c5+V0w=
Received: from localhost (unknown [218.17.89.111])
 by smtp13 (Coremail) with SMTP id EcCowACnspIcYs1gZ7aE8Q--.27344S2;
 Sat, 19 Jun 2021 11:18:53 +0800 (CST)
Date: Sat, 19 Jun 2021 11:18:52 +0800
From: Chunyou Tang <tangchunyou@163.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2] drm/panfrost:report the full raw fault information
 instead
Message-ID: <20210619111852.00003e52@163.com>
In-Reply-To: <2dcbb36a-b550-4c9d-cff8-73ca4b5abb11@arm.com>
References: <20210617062054.1864-1-tangchunyou@163.com>
 <2dcbb36a-b550-4c9d-cff8-73ca4b5abb11@arm.com>
Organization: icube
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.16.6; i586-pc-mingw32msvc)
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowACnspIcYs1gZ7aE8Q--.27344S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1rGrW5ZryrtFW8Kr1ftFb_yoW5JF4kpr
 WqyFWayr92ya42va4DKa1Y9Fy3Z3W5trykGFn8Crs0vanFvF45G34vya40vr1rXr4kJay7
 twsrAFW3ua1UZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jD-B_UUUUU=
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiHh62UVSIvTBmDwAAsf
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 ChunyouTang <tangchunyou@icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steve,
	1,Now I know how to write the subject
	2,the low 8 bits is the exception type in spec.

and you can see prnfrost_exception_name()

switch (exception_code) {
                /* Non-Fault Status code */
case 0x00: return "NOT_STARTED/IDLE/OK";
case 0x01: return "DONE";
case 0x02: return "INTERRUPTED";
case 0x03: return "STOPPED";
case 0x04: return "TERMINATED";
case 0x08: return "ACTIVE";
........
........
case 0xD8: return "ACCESS_FLAG";
case 0xD9 ... 0xDF: return "ACCESS_FLAG";
case 0xE0 ... 0xE7: return "ADDRESS_SIZE_FAULT";
case 0xE8 ... 0xEF: return "MEMORY_ATTRIBUTES_FAULT";
}
return "UNKNOWN";
}

the exception_code in case is only 8 bits,so if fault_status
in panfrost_gpu_irq_handler() don't & 0xFF,it can't get correct
exception reason,it will be always UNKNOWN.

ÓÚ Fri, 18 Jun 2021 13:43:24 +0100
Steven Price <steven.price@arm.com> Ð´µÀ:

> On 17/06/2021 07:20, ChunyouTang wrote:
> > From: ChunyouTang <tangchunyou@icubecorp.cn>
> > 
> > of the low 8 bits.
> 
> Please don't split the subject like this. The first line of the commit
> should be a (very short) summary of the patch. Then a blank line and
> then a longer description of what the purpose of the patch is and why
> it's needed.
> 
> Also you previously had this as part of a series (the first part
> adding the "& 0xFF" in the panfrost_exception_name() call). I'm not
> sure we need two patches for the single line, but as it stands this
> patch doesn't apply.
> 
> Also I'm still not receiving any emails from you directly (only via
> the list), so it's possible I might have missed something you sent.
> 
> Steve
> 
> > 
> > Signed-off-by: ChunyouTang <tangchunyou@icubecorp.cn>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> > b/drivers/gpu/drm/panfrost/panfrost_gpu.c index
> > 1fffb6a0b24f..d2d287bbf4e7 100644 ---
> > a/drivers/gpu/drm/panfrost/panfrost_gpu.c +++
> > b/drivers/gpu/drm/panfrost/panfrost_gpu.c @@ -33,7 +33,7 @@ static
> > irqreturn_t panfrost_gpu_irq_handler(int irq, void *data) address
> > |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO); 
> >  		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at
> > 0x%016llx\n",
> > -			 fault_status & 0xFF,
> > panfrost_exception_name(pfdev, fault_status & 0xFF),
> > +			 fault_status,
> > panfrost_exception_name(pfdev, fault_status & 0xFF), address);
> >  
> >  		if (state & GPU_IRQ_MULTIPLE_FAULT)
> > 


