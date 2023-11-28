Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8219F7FBEBF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EED410E09F;
	Tue, 28 Nov 2023 15:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98E410E09F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 15:58:45 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A4FAF66072A4;
 Tue, 28 Nov 2023 15:58:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701187124;
 bh=qKg+0kItlTCpweu6Y5xQqPzAWvuJlNaeaejzIKJ28Dg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XWVg3YkGDfWrtWOdFm/SBJQ4e9Qp5Z8kOC5dkCJ3pSk1k5+4/qjGrEu8kUYLMvh4l
 xv3hlcuKNsQvQjZW3WFQhVia8GKQdfFgWcu0Hd3ld0y61X8+EFoGkgPWPdTq71Wd+r
 4YadFR2odKA8nfENYJmP1JpQX2FmbN4BVXqfF5swc2lRYxzLikCACP2/T03Vk9jc/c
 KqGyz7kF+EiclMThelviUAbk34kJpibaONcWXPTM15xD+03OIo2WmxOLkKPYn62+sc
 NL5CtL2r9R38d0/CxcUcR/yJlKzgqyym/2CFlksa0RDupXu3xffXoGpmYYPZkILnSF
 CYn+HU4rVLG9A==
Date: Tue, 28 Nov 2023 16:58:40 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 3/3] drm/panfrost: Synchronize and disable interrupts
 before powering off
Message-ID: <20231128165840.383b30c2@collabora.com>
In-Reply-To: <34b7ae7d-c4d3-4d94-a1e9-62d3d4fc6b9a@collabora.com>
References: <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
 <20231128124510.391007-4-angelogioacchino.delregno@collabora.com>
 <20231128150612.17f6a095@collabora.com>
 <6c14d90f-f9e1-4af7-877e-f000b7fa1e08@collabora.com>
 <20231128163808.094a8afa@collabora.com>
 <34b7ae7d-c4d3-4d94-a1e9-62d3d4fc6b9a@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023 16:42:25 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> >>  
> >>>>    	panfrost_device_reset(pfdev);
> >>>>    	panfrost_devfreq_resume(pfdev);
> >>>>    
> >>>> @@ -421,6 +422,9 @@ static int panfrost_device_runtime_suspend(struct device *dev)
> >>>>    		return -EBUSY;
> >>>>    
> >>>>    	panfrost_devfreq_suspend(pfdev);
> >>>> +	panfrost_job_suspend_irq(pfdev);
> >>>> +	panfrost_mmu_suspend_irq(pfdev);
> >>>> +	panfrost_gpu_suspend_irq(pfdev);
> >>>>    	panfrost_gpu_power_off(pfdev);
> >>>>    
> >>>>    	return 0;
> >>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> >>>> index 54a8aad54259..29f89f2d3679 100644
> >>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> >>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> >>>> @@ -25,6 +25,12 @@ struct panfrost_perfcnt;
> >>>>    #define NUM_JOB_SLOTS 3
> >>>>    #define MAX_PM_DOMAINS 5
> >>>>    
> >>>> +enum panfrost_drv_comp_bits {
> >>>> +	PANFROST_COMP_BIT_MMU,
> >>>> +	PANFROST_COMP_BIT_JOB,
> >>>> +	PANFROST_COMP_BIT_MAX
> >>>> +};
> >>>> +
> >>>>    /**
> >>>>     * enum panfrost_gpu_pm - Supported kernel power management features
> >>>>     * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
> >>>> @@ -109,6 +115,7 @@ struct panfrost_device {
> >>>>    
> >>>>    	struct panfrost_features features;
> >>>>    	const struct panfrost_compatible *comp;
> >>>> +	DECLARE_BITMAP(is_suspending, PANFROST_COMP_BIT_MAX);  
> >>>
> >>> nit: Maybe s/is_suspending/suspended_irqs/, given the state remains
> >>> until the device is resumed.  
> >>
> >> If we keep the `is_suspending` name, we can use this one more generically in
> >> case we ever need to, what do you think?  
> > 
> > I'm lost. Why would we want to reserve a name for something we don't
> > know about? My comment was mostly relating to the fact this bitmap
> > doesn't reflect the is_suspending state, but rather is_suspended,
> > because it remains set until the device is resumed. And we actually want
> > it to reflect the is_suspended state, so we can catch interrupts that
> > are not for us without reading regs in the hard irq handler, when the
> > GPU is suspended.  
> 
> `is_suspended` (fun story: that's the first name I gave it) looks good to me,
> the doubt I raised was about calling it `suspended_irqs` instead, as I would
> prefer to keep names "more generic", but that's just personal preference at
> this point anyway.

Ah, sure, is_suspended is fine.

