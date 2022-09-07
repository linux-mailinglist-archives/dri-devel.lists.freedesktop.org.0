Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42FC5B0807
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 17:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E2510E7A5;
	Wed,  7 Sep 2022 15:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990DD10E7A3;
 Wed,  7 Sep 2022 15:08:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4321B81DED;
 Wed,  7 Sep 2022 15:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C37C433D7;
 Wed,  7 Sep 2022 15:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662563319;
 bh=Mx0jPGtZh9KvHJBXC3DHP2hFP5jcs+G6XteAFAWh5CM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oblWhgsO9Emx5t58TgoBHwCAfEnh9f3kgA3t8244JcZe//QinXf9lm0yHywCt0zdx
 BCQad5AvvhmDGmJbdVs5KE0D532+jb0IFykXbujP2bvqem4jFzXKV0UZSPG12naGxS
 k3nzgVSEyUrhVPJP6b4wNHVFZbeEx0LD4062s2yQ=
Date: Wed, 7 Sep 2022 17:08:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v6 00/57] DYNDBG: opt-in class'd debug for modules, use
 in drm.
Message-ID: <Yxiz9HsBusNAad3Z@kroah.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 04, 2022 at 03:40:37PM -0600, Jim Cromie wrote:
> hi Greg, Jason, DRM-folk, Steven,
> 
> If Im not too late for linux-next in this cycle, heres V6.  Diffs are minor:
> 
>  - rebased onto e47eb90a0a9a (tag: next-20220901, linux-next/master)
>    gets past Kconfig conflict, same for drm-tip.
>  - uint debug_level, not ulong.  to fit nouveau.
>  - -1 on param-read-back, to match prev write val.
>  - added back tracefs parts, missing from -V5
>    updated for tracing/events: Add __vstring() and __assign_vstr() helper macros
>    no decorations-lite in TP_printk, do it right later.
>  - commit-msg tweaks
> 
> Theres also new RFC stuff with the potential to reduce the size of the
> __dyndbgs section by 20%.  Not ready for prime time, or linux-next,
> but I hope compelling.
> 
> FEATURE DESCRIPTION
> 
> dyndbg provides DECLARE_DYNAMIC_DEBUG_CLASSMAP() which allows module
> authors to declare "good" class-names, of 4 types.
> 
>   DYNAMIC_DEBUG_CLASSMAP(drm_debug_classes,
>   			DD_CLASS_TYPE_DISJOINT_BITS, offset,
>                         "DRM_UT_CORE",
>                         "DRM_UT_DRIVER",
>                         "DRM_UT_KMS",
>                         "DRM_UT_PRIME",
>                         "DRM_UT_ATOMIC",
>                         "DRM_UT_VBL",
>                         "DRM_UT_STATE",
>                         "DRM_UT_LEASE",
>                         "DRM_UT_DP",
>                         "DRM_UT_DRMRES");
> 
> That usage authorizes dyndbg to set class'd pr_debugs accordingly:
> 
>   echo class DRM_UT_CORE +p > /proc/dynamic_debug/control
>   echo class DRM_UT_KMS  +p > /proc/dynamic_debug/control
> 
> Because the DRM modules declare the same classes, they each authorize
> dyndbg with the same classnames, which allows dyndbg to effect changes
> to its selected class'd prdbgs.
> 
> Opting in by using the macro effectively privatizes the limited
> 63-classes available per module; only modules which share classnames
> must coordinate their use of the common range, and they can
> independently use the remaining id-space.
> 
> Other dyndbg filtering pertains too, so single sites can be selected.
> 
> 
> 4 DD_CLASS_TYPE_*_*s determine 2 behaviors:
> 
>   DISJOINT	bits are independent, like drm.debug categories
>   LEVELs	3>2, turns on level-2, like nouveau debug-levels
>   NUM/BITS	numeric input, bitmap if disjoint, else 0-32.
>   NAMES		accept proper names, like DRM_UT_CORE
> 
> Dyndbg provides param-callbacks which enforce those behaviors:
> 
>   # DISJOINT_BITS
>   echo 0x03 > /sys/module/drm/parameters/debug
> 
>   # LEVEL_NUM
>   echo 3 > /sys/module/drm/nouveau/debug-mumble*
> 
>   # DISJOINT_NAMES
>   echo +DRM_UT_CORE,+DRM_UT_KMS,-DRM_UT_DRIVER > /sys/module/drm/parameters/debug_categories
> 
>   # LEVEL_NAMES
>   echo NV_TRACE > /sys/module/nouveau/parameters/debug-mumble*
> 
> That design choice is allowed cuz verbosity is always attached to a
> (user visible) interface, and theres no reason not to put the
> implementation there (in the callback).  It also considerably
> simplifies things; ddebug_change can treat class_id's as disjoint,
> period.
> 

I've applied the first 21 patches in this series to my
driver-core-testing branch, and if 0-day doesn't blow up on it, I'll
move it to my -next branch tomorrow and it will get a wider testing
range in the linux-next releases.

Feel free to rebase the rest of the series on top of my tree and
resubmit after addressing Daniel's comments.

thanks,

greg k-h
