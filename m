Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145CF9A0FF9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 18:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8492410E114;
	Wed, 16 Oct 2024 16:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="cH8xcVPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1284E10E114
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 16:44:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729097044; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KaLJhY2x2InqoZkfO7V8PKBnIjfMnc/m/C1+rd8yCGKFAuV3VV1lNLD4FhvCYfZayeinL9h29fzswP6yM9iD+Svmg5jzEDPBcoT6D4Onn+x/dW1iQpaUwVoKvN+PxUfH4U6VHEqgKJ8hSoG6GVoqOukDgSeY6BGk/SxmzxM00K0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729097044;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=E6uPqykNee58PqlLG7URU7ixNKBWZqWVJSo5nXew2es=; 
 b=EZ31NDYe5lIJZqtueZNrvUbXFw5Qp7t1Xsr224kTLms1CTHOT3p8lCLRydAj3kDQcKVuxvDyxAawYY+3bdCY2YkGo8jwQPrvABuEjGkJl9ecYuqcMJe+tB+lkmTWxonEPGCO7mDtOtl1nTEXLVbIqhclZCvAg+R4gHPFZWVMRKk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729097044; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=E6uPqykNee58PqlLG7URU7ixNKBWZqWVJSo5nXew2es=;
 b=cH8xcVPpTFTWKAjsmZzdPjYS6pWPSs9VTtGvmL2phPJvHA33ABDfp31yF+/JSnSE
 aJ9AEs2We3dkQXWGdKM7RnHHO9R5VtWYDeudTO1VmDcHc9TnmbQm4t06BcqecGDow3W
 Fd+DHNvzuP6mSXuvrysN/j/rREFdynfCr5tDTq88=
Received: by mx.zohomail.com with SMTPS id 1729097043765679.2832689445722;
 Wed, 16 Oct 2024 09:44:03 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:43:59 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 9/9] drm/panfrost: Explicitly clean up panfrost fence
Message-ID: <3mkdo37kvulmticy7g5siwk3skvbg33fnrioolcgofgbakbnph@3dyq77kiotig>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
 <20241014233758.994861-9-adrian.larumbe@collabora.com>
 <94be6c2a-47fd-4157-b5d8-307040eaa3b7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94be6c2a-47fd-4157-b5d8-307040eaa3b7@amd.com>
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

On 16.10.2024 15:12, Christian König wrote:
> Am 15.10.24 um 01:31 schrieb Adrián Larumbe:
> > Doesn't make any functional difference because generic dma_fence is the
> > first panfrost_fence structure member, but I guess it doesn't hurt either.
> 
> As discussed with Sima we want to push into the exactly opposite direction
> because that requires that the panfrost module stays loaded as long as fences
> are around.

Does that mean in future commits the struct dma_fence_ops' .release pointer will be
done with altogether?

> So clearly a NAK to this one here. Rather document on the structure that the
> dma_fence structure must be the first member.
> 
> Regards,
> Christian.
> 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >   drivers/gpu/drm/panfrost/panfrost_job.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 5d83c6a148ec..fa219f719bdc 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -85,9 +85,15 @@ static const char *panfrost_fence_get_timeline_name(struct dma_fence *fence)
> >   	}
> >   }
> > +static void panfrost_fence_release(struct dma_fence *fence)
> > +{
> > +	kfree(to_panfrost_fence(fence));
> > +}
> > +
> >   static const struct dma_fence_ops panfrost_fence_ops = {
> >   	.get_driver_name = panfrost_fence_get_driver_name,
> >   	.get_timeline_name = panfrost_fence_get_timeline_name,
> > +	.release = panfrost_fence_release,
> >   };
> >   static struct dma_fence *panfrost_fence_create(struct panfrost_device *pfdev, int js_num)
