Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D9B4951C5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C8710E4EF;
	Thu, 20 Jan 2022 15:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CB710E4E9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:48:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id j2so30423592edj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 07:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Bf+aPX+mUMycYg4Pnh8QdB/etAdn0UYI9odfp2ic0RU=;
 b=VuHmjh0SAY/OibGfI272b2yxxqa4fWVJoHrJXAIVhmI2uq7mgBCjhYultf0nE+HSv9
 XM59BOs42OGYgfIzLdRlVeX7FzHjat1ZIG3kRpD6fkWw/D3BFLhtWwkbrzlHfFp7+oF7
 jJozod36Z8nRN0FbLHkTEacY4JArvixbnLcdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Bf+aPX+mUMycYg4Pnh8QdB/etAdn0UYI9odfp2ic0RU=;
 b=vJqbbLKQ5BaCZtl/b82FQ0KGjLiI5XcPo7an4DB8rteg7qeQnyg5QhRi23p+Jsetu4
 KzAl4h9t/OUocvQE1UcUyqVXXj1Ez7ykfJ3s6hVwPiSthb5Blw8jN6KzYhOqZmooa5cj
 om2mUoVK6Zqb3RFPqEQ7PKDaCe08Hiy2a7Nrz4lyAc+uyQPTWNQANb0hK8JNSgFZ/qOV
 QS5zgckJDQKSAK47uTgTZW/yODdbGg8iXNZIAV4OkTuCkWm0ePp7zhmpIG3IbbRpyY+c
 hf5qa+EZlYP8v2iGQEr+PnQKzqMwd9cpKzDNe0I0/X6D8fTMrzqglEAY7nCFhB27B4T6
 4d7A==
X-Gm-Message-State: AOAM531oDovZacWOaTYGtgZKmP+w1jpL3TUg9HNR7EliMuhTl1niu0PM
 OU6CQd+0DLgxLTRdxGmmIUViJQ==
X-Google-Smtp-Source: ABdhPJzhMjhzCED4OmXlcjcUzvJnwaTB8+5wMXtz4qIarfHZTG8xg7ac5tSmz+CD+nIsB34bqh7XKQ==
X-Received: by 2002:a17:907:ea4:: with SMTP id
 ho36mr2995567ejc.140.1642693732656; 
 Thu, 20 Jan 2022 07:48:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm1144874ejb.31.2022.01.20.07.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 07:48:52 -0800 (PST)
Date: Thu, 20 Jan 2022 16:48:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH 0/7] DRM kmap() fixes and kmap_local_page()
 conversions
Message-ID: <YemEYndwyP6BHwMx@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Ira Weiny <ira.weiny@intel.com>, David Airlie <airlied@linux.ie>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20220119165356.GD209936@iweiny-DESK2.sc.intel.com>
 <YehJRt+JngIsj+Gd@phenom.ffwll.local>
 <20220119235542.GF209936@iweiny-DESK2.sc.intel.com>
 <fb71af05-a889-8f6e-031b-426b58a64f00@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb71af05-a889-8f6e-031b-426b58a64f00@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Ira Weiny <ira.weiny@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 09:16:35AM +0100, Christian König wrote:
> Am 20.01.22 um 00:55 schrieb Ira Weiny:
> > On Wed, Jan 19, 2022 at 06:24:22PM +0100, Daniel Vetter wrote:
> > > On Wed, Jan 19, 2022 at 08:53:56AM -0800, Ira Weiny wrote:
> > > > On Fri, Dec 10, 2021 at 03:23:57PM -0800, 'Ira Weiny' wrote:
> > > > > From: Ira Weiny <ira.weiny@intel.com>
> > > > > 
> > > > > This series starts by converting the last easy kmap() uses to
> > > > > kmap_local_page().
> > > > > 
> > > > > There is one more call to kmap() wrapped in ttm_bo_kmap_ttm().  Unfortunately,
> > > > > ttm_bo_kmap_ttm() is called in a number of different ways including some which
> > > > > are not thread local.  I have a patch to convert that call.  However, it is not
> > > > > straight forward so it is not included in this series.
> > > > > 
> > > > > The final 2 patches fix bugs found while working on the ttm_bo_kmap_ttm()
> > > > > conversion.
> > > > Gentile ping on this series?  Will it make this merge window?
> > > I think this fell through the cracks and so no. Note that generally we
> > > feature-freeze drm tree around -rc6 anyway for the upcoming merge window,
> > > so you were cutting this all a bit close anyway.
> > Ok, No problem.  I just had not heard if this was picked up or not.
> > 
> > > Also looks like the ttm
> > > kmap caching question didn't get resolved?
> > I'm sorry I thought it was resolve for this series.  Christian said the patches
> > in this series were "a good bug fix" even if not strictly necessary.[1]  Beyond
> > this series I was discussing where to go from here, and is it possible to go
> > further with more changes.[2]  At the moment I don't think I will.
> > 
> > Christian did I misunderstand?  I can drop patch 6 and 7 if they are not proper
> > bug fixes or at least clarifications to the code.
> 
> Yeah, it is indeed a correct cleanup. I would just *not* put a CC stable on
> it because it doesn't really fix anything.

Ok can you pls get the amd/radeon ones stuffed into alex' tree? Or do we
want to put all the ttm ones into drm-misc instead?
-Daniel

> 
> Christian.
> 
> > 
> > Ira
> > 
> > [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2Fc3b173ea-6509-ebbe-b5f9-eeb29f1ce57e%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C5e0192210d4640adb88b08d9dba734b1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637782333459591089%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=4p7jCB6pB4nlcUtLWh6K2Sso9X%2BsRSK7mcD8UavzztQ%3D&amp;reserved=0
> > [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20211215210949.GW3538886%40iweiny-DESK2.sc.intel.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C5e0192210d4640adb88b08d9dba734b1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637782333459591089%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=6%2BGfSKshg8Xr%2FXJshiU28yHzbg2HcVisVJLDU6tVUT4%3D&amp;reserved=0
> > 
> > > Anyway if patches are stuck resend with RESEND and if people still don't
> > > pick them up poke me and I'll apply as fallback.
> > > 
> > > Cheers, Daniel
> > > 
> > > > Thanks,
> > > > Ira
> > > > 
> > > > > 
> > > > > Ira Weiny (7):
> > > > > drm/i915: Replace kmap() with kmap_local_page()
> > > > > drm/amd: Replace kmap() with kmap_local_page()
> > > > > drm/gma: Remove calls to kmap()
> > > > > drm/radeon: Replace kmap() with kmap_local_page()
> > > > > drm/msm: Alter comment to use kmap_local_page()
> > > > > drm/amdgpu: Ensure kunmap is called on error
> > > > > drm/radeon: Ensure kunmap is called on error
> > > > > 
> > > > > drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
> > > > > drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
> > > > > drivers/gpu/drm/gma500/gma_display.c | 6 ++----
> > > > > drivers/gpu/drm/gma500/mmu.c | 8 ++++----
> > > > > drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 4 ++--
> > > > > drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
> > > > > drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 4 ++--
> > > > > drivers/gpu/drm/i915/gt/shmem_utils.c | 4 ++--
> > > > > drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
> > > > > drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
> > > > > drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
> > > > > drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
> > > > > drivers/gpu/drm/radeon/radeon_uvd.c | 1 +
> > > > > 13 files changed, 32 insertions(+), 32 deletions(-)
> > > > > 
> > > > > --
> > > > > 2.31.1
> > > > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C5e0192210d4640adb88b08d9dba734b1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637782333459591089%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=NLqm91HCdllhW%2BrQ8aHMLXhYGkOJrYffpjsIJZWaFBc%3D&amp;reserved=0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
