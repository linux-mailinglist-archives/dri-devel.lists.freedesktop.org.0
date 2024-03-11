Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AE58784C9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 17:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C1110EE13;
	Mon, 11 Mar 2024 16:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCDFA10EE13
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 16:17:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C22EAFEC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 09:18:18 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BBBD63F762
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 09:17:41 -0700 (PDT)
Date: Mon, 11 Mar 2024 16:17:38 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] Revert "drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue"
Message-ID: <Ze8uovqU4lSmmx51@e110455-lin.cambridge.arm.com>
References: <20240311111619.249776-1-jani.nikula@intel.com>
 <20240311124826.44cc69ba@collabora.com> <87cys1t299.fsf@intel.com>
 <20240311125445.4bab1712@collabora.com> <87a5n5t0mt.fsf@intel.com>
 <Ze8YJhmZgruRfNBo@e110455-lin.cambridge.arm.com>
 <871q8gu8lh.fsf@intel.com>
 <Ze8k2Mbmw4IaGgv8@e110455-lin.cambridge.arm.com>
 <87y1aosr38.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1aosr38.fsf@intel.com>
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

On Mon, Mar 11, 2024 at 05:52:59PM +0200, Jani Nikula wrote:
> On Mon, 11 Mar 2024, Liviu Dudau <liviu.dudau@arm.com> wrote:
> > On Mon, Mar 11, 2024 at 04:49:30PM +0200, Jani Nikula wrote:
> >> On Mon, 11 Mar 2024, Liviu Dudau <liviu.dudau@arm.com> wrote:
> >> > So with this revert we're OK with an undefined symbol if !CONFIG_PM, but we're not happy
> >> > with a recursive dependency that is only triggered for COMPILE_TEST? I would've thought
> >> > IOMMU_SUPPORT options is a better one.
> >> 
> >> It's a real config.
> >> 
> >> # CONFIG_COMPILE_TEST is not set
> >
> > So I can select CONFIG_ARM64 and CONFIG_X86_LOCAL_APIC at the same time? DRM_PANTHOR depends on ARM || ARM64
> > and X86_LOCAL_APIC depends on X86_64. At some moment the recursive dependency detector should've stopped as
> > there are no common dependencies between DRM_PANTHOR and X86_LOCAL_APIC and going further just triggers false
> > positives. I'm curious how you've created your config now.
> 
> The thing is, I don't have *any* of the dependencies ARM || ARM64 ||
> COMPILE_TEST set in the config that triggered this. I don't have
> DRM_PANTHOR set. But make olddefconfig detects a circular dependency
> nonetheless.
> 
> It's possible the issue is in kconfig. I don't know. But not being able
> to even dodge the warning makes it a show stopper. I wouldn't even know
> what to change in the config.

Understood, thanks for clarifying the condition under which you've discovered
the issue. I assumed (appologies!) that you were generating or using a crafted
.config for testing new drivers.

Reverting is then a better option for olddefconfig case, thanks for the patch
and the quick merge.

Best regards,
Liviu

> 
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
