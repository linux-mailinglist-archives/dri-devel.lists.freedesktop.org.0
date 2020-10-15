Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A328F5E9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 17:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F436ED67;
	Thu, 15 Oct 2020 15:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2BA6ED67
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 15:33:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b8so4078811wrn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=JHfVR15DmgNgHjEYT1vHwaXoRgLm3lEWzxDvCcdq+eU=;
 b=YEzGkNPjcWsWogVWz3QWffFRGWZD9E6EKg864hpltYi9b25EGfehPGSZVBj1A+HMl1
 j79R9ryf8zrnmqi0v/SQKYh1CmueM5n9KdXPS6jZ8h7VxeCUl0XNMmKQbHYbqdoAcoSQ
 sYr1eA+AINxBZHMZawO8PinHCVnFYxphvWYxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=JHfVR15DmgNgHjEYT1vHwaXoRgLm3lEWzxDvCcdq+eU=;
 b=cZFubKM+N+SZL6fJYfEwN5OY9SoT0G7/mVPZ+Z2YWClDKAdTgmBXkrTDrQNIK1JJX6
 3QRYD8IKO2VlPaolJ1QUYRJZaNvI8ScOZaQktW/hEWTCayfVFPb9hi7ogbDJQq4X1TtO
 sWCn0uB5+Hb/Smn/ZFWAE0CtjUUoJUAT/ItcM2pZROPzlhITnUDTVXtri0tMZIapty0L
 3rLeYS0fKFDSqJwlL930adE/bODThom8WeTHEZ6wn6G6+6csay1q5LUBzkjbV3ZaBOSh
 027bnNHgqInMfMY6mSdcNya9aYKcUS2gOSanr4p0cJC6MzJajlicMJgadtXvepJ+N0R+
 L8xA==
X-Gm-Message-State: AOAM530PLwqjPVsqiA3jzrAZbOuUkoiu8L+6bFwr/KbsTQ6VGUtzvX8d
 GYbKXnoamXQiOdpQSWJGWaBdPg==
X-Google-Smtp-Source: ABdhPJxZCtmOKvSHGMFu6M0SWndoPtrJKa9skPbxfjCh46ReSVVuskA1W6sLt8/JDmwyo0CIUMDZFQ==
X-Received: by 2002:adf:82ab:: with SMTP id 40mr4957151wrc.420.1602776017257; 
 Thu, 15 Oct 2020 08:33:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j101sm5918352wrj.9.2020.10.15.08.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 08:33:36 -0700 (PDT)
Date: Thu, 15 Oct 2020 17:33:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201015153334.GF438822@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 iommu@lists.linux-foundation.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
References: <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org>
 <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
 <20201015065532.GA15371@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015065532.GA15371@infradead.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 iommu@lists.linux-foundation.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 07:55:32AM +0100, Christoph Hellwig wrote:
> On Tue, Oct 13, 2020 at 02:42:38PM +0100, Robin Murphy wrote:
> > I still think this situation would be best handled with a variant of
> > dma_ops_bypass that also guarantees to bypass SWIOTLB, and can be set
> > automatically when attaching to an unmanaged IOMMU domain.
> 
> dma_ops_bypass should mostly do the right thing as-is.  swiotlb bouncing
> is triggered of two things:
> 
>  1) the dma_mask.  This is under control of the driver, and obviously
>     if it is too small for a legit reason we can't just proceed

Somewhat related, but is there a way to tell the dma-api to fail instead
of falling back to swiotlb? In many case for gpu drivers it's much better
if we fall back to dma_alloc_coherent and manage the copying ourselves
instead of abstracting this away in the dma-api. Currently that's "solved"
rather pessimistically by always allocating from dma_alloc_coherent if
swiotlb could be in the picture (at least for ttm based drivers, i915 just
falls over).
-Daniel

>  2) force_dma_unencrypted() - we'd need to do an opt-out here, either
>     by a flag or by being smart and looking for an attached iommu on
>     the device
> 
> > That way the
> > device driver can make DMA API calls in the appropriate places that do the
> > right thing either way, and only needs logic to decide whether to use the
> > returned DMA addresses directly or ignore them if it knows they're
> > overridden by its own IOMMU mapping.
> 
> I'd be happy to review patches for this.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
