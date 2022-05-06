Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D487F51D6E8
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 13:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6436C10E58B;
	Fri,  6 May 2022 11:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9223210E58B;
 Fri,  6 May 2022 11:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651837378; x=1683373378;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XNUv4hG8GHjKI3EZJ2ZBJjhioFet5H9j+RkAeU4say8=;
 b=Fr3+OuuuXjBXfLBSMnmaTPCI2xmyinu9gxxJC78J7nrJcR5HyuVVN7Ms
 t7BjRsSkgU9EI4m6muDJ6qjOiFTT2DOxTXd2ge2qxFUcyVThkTnFUWmtc
 khXwPKofZBd5FRj+77kjPcEgQMcqklW2coYVChTUf446rzjGyh6tKhJPY
 KJrkTK4zobC5JhE1Kd0n5OUlJuZ/X47k5ZALFNwRTuI1w6VXkInJ7JjBg
 CachYq8oV9/i/dVBG+8fzA7ENxYJhWK10RQJeVMJ1kq+b5slcsPxyuS1x
 vHSS5X0eca3Ew9IBd47nQnCJJvxakSusbT7CdworlsR8OVd1BTdD567cx w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293652111"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293652111"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 04:42:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="735623941"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 04:42:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?= <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org
Subject: amdgpu sparse warnings (was: Re: =?utf-8?Q?=E2=9C=97?=
 Fi.CI.SPARSE: warning for drm/edid: introduce struct drm_edid)
In-Reply-To: <165183552881.18818.4314029635057951024@emeril.freedesktop.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1651830938.git.jani.nikula@intel.com>
 <165183552881.18818.4314029635057951024@emeril.freedesktop.org>
Date: Fri, 06 May 2022 14:42:51 +0300
Message-ID: <871qx6lwec.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hey, do you ever run sparse on your driver? Whenever our CI ends up
recompiling amdgpu, there's quite the spew. See below.

You're not alone, but, sorry to say, the _Static_assert() from
amdgv_sriovmsg.h has been pretty obnoxious for quite some time now.

First, I don't think you should be using _Static_assert() directly;
there's an in-kernel static_assert() wrapper. However, it's the #pragma
pack(push, 1) and #pragma pack(pop) pair that sparse does not
understand, leaves the structs unpacked, and leads to warnings.


BR,
Jani.



On Fri, 06 May 2022, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: drm/edid: introduce struct drm_edid
> URL   : https://patchwork.freedesktop.org/series/103665/
> State : warning
>
> == Summary ==
>
> Error: dim sparse failed
> Sparse version: v0.6.2
> Fast mode used, each commit won't be checked separately.
> -
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1449:25: error: incompatible types in comparison expression (different address spaces):
> +drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1449:25:    struct dma_fence *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1449:25:    struct dma_fence [noderef] __rcu *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1450:17: error: incompatible types in comparison expression (different address spaces):
> +drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1450:17:    struct dma_fence *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1450:17:    struct dma_fence [noderef] __rcu *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1509:17: error: incompatible types in comparison expression (different address spaces):
> +drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1509:17:    struct dma_fence *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1509:17:    struct dma_fence [noderef] __rcu *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:353:16: error: incompatible types in comparison expression (different type sizes):
> +drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:353:16:    unsigned long *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:353:16:    unsigned long long *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:295:25: error: incompatible types in comparison expression (different address spaces):
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:295:25:    struct dma_fence *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:295:25:    struct dma_fence [noderef] __rcu *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:296:17: error: incompatible types in comparison expression (different address spaces):
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:296:17:    struct dma_fence *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:296:17:    struct dma_fence [noderef] __rcu *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:345:17: error: incompatible types in comparison expression (different address spaces):
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:345:17:    struct dma_fence *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:345:17:    struct dma_fence [noderef] __rcu *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:596:23: error: incompatible types in comparison expression (different address spaces):
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:596:23:    struct dma_fence *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:596:23:    struct dma_fence [noderef] __rcu *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:598:25: error: incompatible types in comparison expression (different address spaces):
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:598:25:    struct dma_fence *
> +drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:598:25:    struct dma_fence [noderef] __rcu *
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:314:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:318:49: error: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1048:9: error: incompatible types in conditional expression (different base types):
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1048:9:    int
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1048:9:    void
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:675:17: error: incompatible types in conditional expression (different base types):
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:675:17:    int
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:675:17:    void
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:923:9: error: incompatible types in conditional expression (different base types):
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:923:9:    int
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:923:9:    void
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:955:9: error: incompatible types in conditional expression (different base types):
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:955:9:    int
> +drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:955:9:    void
> +drivers/gpu/drm/ast/ast_dp.c:278:66: warning: cast truncates bits from constant value (ffffffffffffff00 becomes 0)
> +drivers/gpu/drm/ast/ast_dp.c:280:66: warning: cast truncates bits from constant value (ffffffffffffff00 becomes 0)
> +drivers/gpu/drm/ast/ast_dp.c:281:66: warning: cast truncates bits from constant value (ffffffffffffff00 becomes 0)
> +drivers/gpu/drm/ast/ast_dp.c:37:46: warning: cast truncates bits from constant value (ffffffffffffff00 becomes 0)
> +drivers/gpu/drm/ast/ast_drv.c:42:5: warning: symbol 'ast_modeset' was not declared. Should it be static?
> +drivers/gpu/drm/ast/ast_mode.c:678:16:    expected unsigned char [noderef] [usertype] __iomem *dstxor
> +drivers/gpu/drm/ast/ast_mode.c:678:16:    got unsigned char [usertype] *
> +drivers/gpu/drm/ast/ast_mode.c:678:16: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/ast/ast_mode.c:678:19: warning: cast removes address space '__iomem' of expression
> +drivers/gpu/drm/drm_drv.c:426:6: warning: context imbalance in 'drm_dev_enter' - different lock contexts for basic block
> +drivers/gpu/drm/drm_drv.c:70:1: warning: symbol '__srcu_struct_drm_unplug_srcu' was not declared. Should it be static?
> +drivers/gpu/drm/gma500/framebuffer.c:268:9:    expected void *
> +drivers/gpu/drm/gma500/framebuffer.c:268:9:    expected void const *
> +drivers/gpu/drm/gma500/framebuffer.c:268:9:    expected void const *
> +drivers/gpu/drm/gma500/framebuffer.c:268:9:    got unsigned char [noderef] [usertype] __iomem *
> +drivers/gpu/drm/gma500/framebuffer.c:268:9:    got unsigned char [noderef] [usertype] __iomem *
> +drivers/gpu/drm/gma500/framebuffer.c:268:9:    got unsigned char [noderef] [usertype] __iomem *
> +drivers/gpu/drm/gma500/framebuffer.c:268:9: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/gma500/framebuffer.c:268:9: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/gma500/framebuffer.c:268:9: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/gma500/gma_display.c:402:25:    expected void *tmp_dst
> +drivers/gpu/drm/gma500/gma_display.c:402:25:    got unsigned char [noderef] [usertype] __iomem *
> +drivers/gpu/drm/gma500/gma_display.c:402:25: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/gma500/intel_bios.c:548:42:    expected void const *const p
> +drivers/gpu/drm/gma500/intel_bios.c:548:42:    got unsigned char [noderef] [usertype] __iomem *
> +drivers/gpu/drm/gma500/intel_bios.c:548:42: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/gma500/intel_bios.c:549:40: warning: cast removes address space '__iomem' of expression
> +drivers/gpu/drm/gma500/intel_bios.c:559:24: warning: cast removes address space '__iomem' of expression
> +drivers/gpu/drm/gma500/mmu.c:306:26: warning: context imbalance in 'psb_mmu_pt_alloc_map_lock' - wrong count at exit
> +drivers/gpu/drm/gma500/mmu.c:346:26: warning: context imbalance in 'psb_mmu_pt_map_lock' - wrong count at exit
> +drivers/gpu/drm/gma500/mmu.c:379:28: warning: context imbalance in 'psb_mmu_pt_unmap_unlock' - unexpected unlock
> +drivers/gpu/drm/gma500/oaktrail_crtc.c:661:30: warning: symbol 'mrst_clock_funcs' was not declared. Should it be static?
> +drivers/gpu/drm/gma500/opregion.c:298:25:    expected void volatile [noderef] __iomem *addr
> +drivers/gpu/drm/gma500/opregion.c:298:25:    got struct opregion_header *header
> +drivers/gpu/drm/gma500/opregion.c:298:25: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/gma500/opregion.c:328:20:    expected void const *const p
> +drivers/gpu/drm/gma500/opregion.c:328:20:    got void [noderef] __iomem *[assigned] base
> +drivers/gpu/drm/gma500/opregion.c:328:20: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/gma500/opregion.c:334:26:    expected struct opregion_header *header
> +drivers/gpu/drm/gma500/opregion.c:334:26:    got void [noderef] __iomem *[assigned] base
> +drivers/gpu/drm/gma500/opregion.c:334:26: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/gma500/opregion.c:335:23:    expected void *vbt
> +drivers/gpu/drm/gma500/opregion.c:335:23:    got void [noderef] __iomem *
> +drivers/gpu/drm/gma500/opregion.c:335:23: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/gma500/opregion.c:342:32:    expected struct opregion_acpi *acpi
> +drivers/gpu/drm/gma500/opregion.c:342:32:    got void [noderef] __iomem *
> +drivers/gpu/drm/gma500/opregion.c:342:32: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/gma500/opregion.c:347:32:    expected struct opregion_asle *asle
> +drivers/gpu/drm/gma500/opregion.c:347:32:    got void [noderef] __iomem *
> +drivers/gpu/drm/gma500/opregion.c:347:32: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/gma500/psb_intel_display.c:434:30: warning: symbol 'psb_clock_funcs' was not declared. Should it be static?
> +drivers/gpu/drm/i2c/tda998x_drv.c:1712:50:    expected restricted __be32 const [usertype] *p
> +drivers/gpu/drm/i2c/tda998x_drv.c:1712:50:    got unsigned int const [usertype] *
> +drivers/gpu/drm/i2c/tda998x_drv.c:1712:50: warning: incorrect type in argument 1 (different base types)
> +drivers/gpu/drm/i2c/tda998x_drv.c:1713:52:    expected restricted __be32 const [usertype] *p
> +drivers/gpu/drm/i2c/tda998x_drv.c:1713:52:    got unsigned int const [usertype] *
> +drivers/gpu/drm/i2c/tda998x_drv.c:1713:52: warning: incorrect type in argument 1 (different base types)
> +drivers/gpu/drm/i915/display/intel_display_power.c:2431:34:    int enum port
> +drivers/gpu/drm/i915/display/intel_display_power.c:2431:34:    unsigned int enum intel_display_power_domain
> +drivers/gpu/drm/i915/display/intel_display_power.c:2431:34: warning: mixing different enum types:
> +drivers/gpu/drm/i915/display/intel_display_power.c:2442:37:    int enum port
> +drivers/gpu/drm/i915/display/intel_display_power.c:2442:37:    unsigned int enum intel_display_power_domain
> +drivers/gpu/drm/i915/display/intel_display_power.c:2442:37: warning: mixing different enum types:
> +drivers/gpu/drm/i915/display/intel_display_power.c:2468:43:    unsigned int enum aux_ch
> +drivers/gpu/drm/i915/display/intel_display_power.c:2468:43:    unsigned int enum intel_display_power_domain
> +drivers/gpu/drm/i915/display/intel_display_power.c:2468:43: warning: mixing different enum types:
> +drivers/gpu/drm/i915/display/intel_display_power.c:2479:35:    unsigned int enum aux_ch
> +drivers/gpu/drm/i915/display/intel_display_power.c:2479:35:    unsigned int enum intel_display_power_domain
> +drivers/gpu/drm/i915/display/intel_display_power.c:2479:35: warning: mixing different enum types:
> +drivers/gpu/drm/mgag200/mgag200_drv.c:23:5: warning: symbol 'mgag200_modeset' was not declared. Should it be static?
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:135:34: warning: cast removes address space '__iomem' of expression
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:198:34: warning: cast removes address space '__iomem' of expression
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:204:27:    expected unsigned int [usertype] *cur
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:204:27:    got void [noderef] __iomem *ptr
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:204:27: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:217:19:    expected unsigned int [usertype] *bgn
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:217:19:    got void [noderef] __iomem *ptr
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:217:19: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:258:19:    expected unsigned int [usertype] *ptr
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:258:19:    got void [noderef] __iomem *ptr
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:258:19: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:262:25:    expected unsigned int [usertype] *bgn
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:262:25:    got void [noderef] __iomem *ptr
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:262:25: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/nouveau/dispnv50/disp.c:2693:1: warning: symbol 'nv50_display_create' was not declared. Should it be static?
> +drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:40:9: warning: dubious: !x & y
> +drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:282:9: warning: dubious: !x & y
> +drivers/gpu/drm/qxl/qxl_kms.c:168:19:    expected struct qxl_rom *rom
> +drivers/gpu/drm/qxl/qxl_kms.c:168:19:    got void [noderef] __iomem *
> +drivers/gpu/drm/qxl/qxl_kms.c:168:19: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/qxl/qxl_kms.c:186:26:    expected struct qxl_ram_header *ram_header
> +drivers/gpu/drm/qxl/qxl_kms.c:186:26:    got void [noderef] __iomem *
> +drivers/gpu/drm/qxl/qxl_kms.c:186:26: warning: incorrect type in assignment (different address spaces)
> +drivers/gpu/drm/qxl/qxl_kms.c:275:21:    expected void volatile [noderef] __iomem *addr
> +drivers/gpu/drm/qxl/qxl_kms.c:275:21:    got struct qxl_ram_header *ram_header
> +drivers/gpu/drm/qxl/qxl_kms.c:275:21: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/qxl/qxl_kms.c:279:21:    expected void volatile [noderef] __iomem *addr
> +drivers/gpu/drm/qxl/qxl_kms.c:279:21:    got struct qxl_rom *rom
> +drivers/gpu/drm/qxl/qxl_kms.c:279:21: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/qxl/qxl_kms.c:323:21:    expected void volatile [noderef] __iomem *addr
> +drivers/gpu/drm/qxl/qxl_kms.c:323:21:    got struct qxl_ram_header *ram_header
> +drivers/gpu/drm/qxl/qxl_kms.c:323:21: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/qxl/qxl_kms.c:324:21:    expected void volatile [noderef] __iomem *addr
> +drivers/gpu/drm/qxl/qxl_kms.c:324:21:    got struct qxl_rom *rom
> +drivers/gpu/drm/qxl/qxl_kms.c:324:21: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/qxl/qxl_kms.c:36:5: warning: symbol 'qxl_log_level' was not declared. Should it be static?
> +drivers/gpu/drm/qxl/qxl_object.c:178:29: warning: cast removes address space '__iomem' of expression
> +drivers/gpu/drm/qxl/qxl_object.c:223:40:    expected void *
> +drivers/gpu/drm/qxl/qxl_object.c:223:40:    got void [noderef] __iomem *
> +drivers/gpu/drm/qxl/qxl_object.c:223:40: warning: incorrect type in return expression (different address spaces)
> +drivers/gpu/drm/qxl/qxl_object.c:273:33:    expected void [noderef] __iomem *vaddr
> +drivers/gpu/drm/qxl/qxl_object.c:273:33:    got void *pmap
> +drivers/gpu/drm/qxl/qxl_object.c:273:33: warning: incorrect type in argument 1 (different address spaces)
> +drivers/gpu/drm/radeon/atombios_crtc.c:313:23:    expected unsigned short [addressable] [usertype] usH_Size
> +drivers/gpu/drm/radeon/atombios_crtc.c:313:23:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:313:23: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:314:32:    expected unsigned short [addressable] [usertype] usH_Blanking_Time
> +drivers/gpu/drm/radeon/atombios_crtc.c:314:32:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:314:32: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:316:23:    expected unsigned short [addressable] [usertype] usV_Size
> +drivers/gpu/drm/radeon/atombios_crtc.c:316:23:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:316:23: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:317:32:    expected unsigned short [addressable] [usertype] usV_Blanking_Time
> +drivers/gpu/drm/radeon/atombios_crtc.c:317:32:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:317:32: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:319:29:    expected unsigned short [addressable] [usertype] usH_SyncOffset
> +drivers/gpu/drm/radeon/atombios_crtc.c:319:29:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:319:29: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:321:28:    expected unsigned short [addressable] [usertype] usH_SyncWidth
> +drivers/gpu/drm/radeon/atombios_crtc.c:321:28:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:321:28: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:323:29:    expected unsigned short [addressable] [usertype] usV_SyncOffset
> +drivers/gpu/drm/radeon/atombios_crtc.c:323:29:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:323:29: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:325:28:    expected unsigned short [addressable] [usertype] usV_SyncWidth
> +drivers/gpu/drm/radeon/atombios_crtc.c:325:28:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:325:28: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:343:39:    expected unsigned short [addressable] [assigned] [usertype] usAccess
> +drivers/gpu/drm/radeon/atombios_crtc.c:343:39:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:343:39: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:360:24:    expected unsigned short [addressable] [usertype] usH_Total
> +drivers/gpu/drm/radeon/atombios_crtc.c:360:24:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:360:24: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:361:23:    expected unsigned short [addressable] [usertype] usH_Disp
> +drivers/gpu/drm/radeon/atombios_crtc.c:361:23:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:361:23: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:362:28:    expected unsigned short [addressable] [usertype] usH_SyncStart
> +drivers/gpu/drm/radeon/atombios_crtc.c:362:28:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:362:28: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:363:28:    expected unsigned short [addressable] [usertype] usH_SyncWidth
> +drivers/gpu/drm/radeon/atombios_crtc.c:363:28:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:363:28: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:365:24:    expected unsigned short [addressable] [usertype] usV_Total
> +drivers/gpu/drm/radeon/atombios_crtc.c:365:24:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:365:24: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:366:23:    expected unsigned short [addressable] [usertype] usV_Disp
> +drivers/gpu/drm/radeon/atombios_crtc.c:366:23:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:366:23: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:367:28:    expected unsigned short [addressable] [usertype] usV_SyncStart
> +drivers/gpu/drm/radeon/atombios_crtc.c:367:28:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:367:28: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:368:28:    expected unsigned short [addressable] [usertype] usV_SyncWidth
> +drivers/gpu/drm/radeon/atombios_crtc.c:368:28:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:368:28: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:389:39:    expected unsigned short [addressable] [assigned] [usertype] usAccess
> +drivers/gpu/drm/radeon/atombios_crtc.c:389:39:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:389:39: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:481:52:    expected unsigned short [addressable] [usertype] usSpreadSpectrumAmountFrac
> +drivers/gpu/drm/radeon/atombios_crtc.c:481:52:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:481:52: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:496:48:    expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumAmount
> +drivers/gpu/drm/radeon/atombios_crtc.c:496:48:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:496:48: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:497:46:    expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumStep
> +drivers/gpu/drm/radeon/atombios_crtc.c:497:46:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:497:46: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:500:52:    expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumPercentage
> +drivers/gpu/drm/radeon/atombios_crtc.c:500:52:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:500:52: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:515:48:    expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumAmount
> +drivers/gpu/drm/radeon/atombios_crtc.c:515:48:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:515:48: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:516:46:    expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumStep
> +drivers/gpu/drm/radeon/atombios_crtc.c:516:46:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:516:46: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:519:52:    expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumPercentage
> +drivers/gpu/drm/radeon/atombios_crtc.c:519:52:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:519:52: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:532:59:    expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumPercentage
> +drivers/gpu/drm/radeon/atombios_crtc.c:532:59:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:532:59: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:543:57:    expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumPercentage
> +drivers/gpu/drm/radeon/atombios_crtc.c:543:57:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:543:57: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:55:36:    expected unsigned short [addressable] [assigned] [usertype] usOverscanTop
> +drivers/gpu/drm/radeon/atombios_crtc.c:55:36:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:55:36: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:56:39:    expected unsigned short [addressable] [assigned] [usertype] usOverscanBottom
> +drivers/gpu/drm/radeon/atombios_crtc.c:56:39:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:56:39: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:57:37:    expected unsigned short [addressable] [assigned] [usertype] usOverscanLeft
> +drivers/gpu/drm/radeon/atombios_crtc.c:57:37:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:57:37: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:58:38:    expected unsigned short [addressable] [assigned] [usertype] usOverscanRight
> +drivers/gpu/drm/radeon/atombios_crtc.c:58:38:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:58:38: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:65:45:    expected unsigned short [addressable] [assigned] [usertype] usOverscanLeft
> +drivers/gpu/drm/radeon/atombios_crtc.c:65:45:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:65:45: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:66:46:    expected unsigned short [addressable] [assigned] [usertype] usOverscanRight
> +drivers/gpu/drm/radeon/atombios_crtc.c:66:46:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:66:46: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:68:44:    expected unsigned short [addressable] [assigned] [usertype] usOverscanTop
> +drivers/gpu/drm/radeon/atombios_crtc.c:68:44:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:68:44: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:694:54:    expected unsigned short [addressable] [usertype] usPixelClock
> +drivers/gpu/drm/radeon/atombios_crtc.c:694:54:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:694:54: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:69:47:    expected unsigned short [addressable] [assigned] [usertype] usOverscanBottom
> +drivers/gpu/drm/radeon/atombios_crtc.c:69:47:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:69:47: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:703:50: warning: cast to restricted __le16
> +drivers/gpu/drm/radeon/atombios_crtc.c:706:61:    expected unsigned short [addressable] [assigned] [usertype] usPixelClock
> +drivers/gpu/drm/radeon/atombios_crtc.c:706:61:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:706:61: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:717:69:    expected unsigned short [addressable] [assigned] [usertype] usPixelClock
> +drivers/gpu/drm/radeon/atombios_crtc.c:717:69:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:717:69: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:736:50: warning: cast to restricted __le32
> +drivers/gpu/drm/radeon/atombios_crtc.c:74:38:    expected unsigned short [addressable] [assigned] [usertype] usOverscanRight
> +drivers/gpu/drm/radeon/atombios_crtc.c:74:38:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:74:38: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:75:37:    expected unsigned short [addressable] [assigned] [usertype] usOverscanLeft
> +drivers/gpu/drm/radeon/atombios_crtc.c:75:37:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:75:37: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:76:39:    expected unsigned short [addressable] [assigned] [usertype] usOverscanBottom
> +drivers/gpu/drm/radeon/atombios_crtc.c:76:39:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:76:39: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:77:36:    expected unsigned short [addressable] [assigned] [usertype] usOverscanTop
> +drivers/gpu/drm/radeon/atombios_crtc.c:77:36:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:77:36: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:795:46:    expected unsigned short [addressable] [assigned] [usertype] usPixelClock
> +drivers/gpu/drm/radeon/atombios_crtc.c:795:46:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:795:46: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:802:50:    expected unsigned int [addressable] [assigned] [usertype] ulDispEngClkFreq
> +drivers/gpu/drm/radeon/atombios_crtc.c:802:50:    got restricted __le32 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:802:50: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:854:46:    expected unsigned short [addressable] [usertype] usPixelClock
> +drivers/gpu/drm/radeon/atombios_crtc.c:854:46:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:854:46: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:855:42:    expected unsigned short [addressable] [usertype] usRefDiv
> +drivers/gpu/drm/radeon/atombios_crtc.c:855:42:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:855:42: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:856:41:    expected unsigned short [addressable] [usertype] usFbDiv
> +drivers/gpu/drm/radeon/atombios_crtc.c:856:41:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:856:41: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:864:46:    expected unsigned short [addressable] [assigned] [usertype] usPixelClock
> +drivers/gpu/drm/radeon/atombios_crtc.c:864:46:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:864:46: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:865:42:    expected unsigned short [addressable] [assigned] [usertype] usRefDiv
> +drivers/gpu/drm/radeon/atombios_crtc.c:865:42:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:865:42: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:866:41:    expected unsigned short [addressable] [assigned] [usertype] usFbDiv
> +drivers/gpu/drm/radeon/atombios_crtc.c:866:41:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:866:41: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:874:46:    expected unsigned short [addressable] [assigned] [usertype] usPixelClock
> +drivers/gpu/drm/radeon/atombios_crtc.c:874:46:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:874:46: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:875:42:    expected unsigned short [addressable] [assigned] [usertype] usRefDiv
> +drivers/gpu/drm/radeon/atombios_crtc.c:875:42:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:875:42: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:876:41:    expected unsigned short [addressable] [assigned] [usertype] usFbDiv
> +drivers/gpu/drm/radeon/atombios_crtc.c:876:41:    got restricted __le16 [usertype]
> +drivers/gpu/drm/radeon/atombios_crtc.c:876:41: warning: incorrect type in assignment (different base types)
> +drivers/gpu/drm/radeon/atombios_crtc.c:891:46:    expected unsigned sh
>
>

-- 
Jani Nikula, Intel Open Source Graphics Center
