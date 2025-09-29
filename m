Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01EFBA8D15
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 12:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBE010E285;
	Mon, 29 Sep 2025 10:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Du5Hf/zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50DF10E081;
 Mon, 29 Sep 2025 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759140478; x=1790676478;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GPOrVnGuARiWqPXdkN37TfZhz0nVPuXntw8f612RF1o=;
 b=Du5Hf/zd+4H9OERkD/QVyVnQ0QpbofJeIgnGytQhgCFGD9giuxQ/T1On
 ufJw3SsUgT9nDMSqvAOy3lcShjWpI6xG8U8a3IryhXUbaEK70nhl7meDU
 HUfTyFJYTJ63l0C0vXmbI2y1Lvs1bgn/CoM/avsb+LqwbVZRrIGPbmkNP
 MmnH1tY6X1T81+T3KPYZ/cIBxQxS0MD+X1YWMZXOkbS64+pqcJYXqC8hA
 ICNjd3vc2rFvxscAGLD6/YgLH7v6l64uhMLYWvJOBn7eKJlNodCmIdG5S
 apgUwxtrBrxh6pUsfra2uy2TiGhmmAqnPaau4btoeBTv3QR1UMzjnDBbk w==;
X-CSE-ConnectionGUID: miJARHksS2S1uZTXjb+ZRA==
X-CSE-MsgGUID: ljvWlsR2S5uoW0N9PnzkcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61424370"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61424370"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:07:58 -0700
X-CSE-ConnectionGUID: vRXF/efATfCY2U2BaQPLKA==
X-CSE-MsgGUID: Sho9jXkPQjm48CttLMRyRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177795506"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:07:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/{i915,xe}: driver agnostic drm to display pointer
 chase
In-Reply-To: <hc7bxiipjuejnl4rvppynwybqht2exgbtjrm6howstq3sbailj@6kjknuwggn7v>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250926111032.1188876-1-jani.nikula@intel.com>
 <vxxrpnasd5qfoof4coi3rw4pu3pbnau42u3lywc5dd52nma5sx@r5coda25idn4>
 <20562bfd487f43278df768822cc44317f0ca6f79@intel.com>
 <hc7bxiipjuejnl4rvppynwybqht2exgbtjrm6howstq3sbailj@6kjknuwggn7v>
Date: Mon, 29 Sep 2025 13:07:52 +0300
Message-ID: <07c18d19231baae7875f4e0f39c697dfdb8f1638@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Sep 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> I missed the fact that all the other type conversions also use 
> the drm -> display. So yes, inlining that would be good.

The downside is having to include drm/intel/display_member.h and by
proxy thus drm/drm_device.h pretty much everywhere. Maybe that's fine,
I'll look into it.

>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks, pushed to din.

BR,
Jani.


-- 
Jani Nikula, Intel
