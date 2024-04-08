Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC58689BC6E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC5311214D;
	Mon,  8 Apr 2024 09:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJcePju8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334411123B7;
 Mon,  8 Apr 2024 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712570254; x=1744106254;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i7vJDeBtWo/Ou+kqa0iug9VmU2LgfFDgiKXdOwEporA=;
 b=bJcePju8qBOsPk1fmsy1U8rAlB4I/kkcSH+8JNJBgvHm47crh6FTt2tX
 k8+a1poKDYzRbxHNchtpsaLjviDnjLWO3O8vmQy8sQb9JuXoIvrIMmvrw
 1cdTcPqpC61YFw/BqhnKwbISzt8KKcZU2+AL6emCW3Bq4l5DBUZt29XHG
 r4H4lrtcWQe6epTs6MQdRTzRbvwSLwrCHK+zmuKpFVwtzKGVpN6eZ4qGk
 p3hIiNTA22mYOv54FUtqcWEf1g96ce8sPxSfSirCNWfxiSBviH/dQurGE
 +XW/U7gWuOuvuE7zvThVIX466Lm5K5IcoD8gUNpmUKrsL2ZqzUxxncQMj A==;
X-CSE-ConnectionGUID: OYEsRnyOQWWxrjrKye6FXQ==
X-CSE-MsgGUID: EPG7rJUCSra+nEULxcvxSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7705073"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7705073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:57:34 -0700
X-CSE-ConnectionGUID: aW2IKeTQR2GbuJmLvGRk+A==
X-CSE-MsgGUID: E8meANszRvmsKTmThmpvHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19960303"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:57:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Aishwarya TCV
 <aishwarya.tcv@arm.com>
Subject: Re: [PATCH] drm/msm: convert all pixel format logging to use %p4cc
In-Reply-To: <CAA8EJpr9cEv6Yi1q+8u-+mU2V3yp=C9rtpnCu+pyouozukYQ=g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240405092907.2334007-1-jani.nikula@intel.com>
 <eondf5x3wz3nccxpnqxtb7gtvf3k5u3bz4qwhn3gbcy5pj73ku@fue4tej3xgnq>
 <87frvwb7i5.fsf@intel.com>
 <CAA8EJpr9cEv6Yi1q+8u-+mU2V3yp=C9rtpnCu+pyouozukYQ=g@mail.gmail.com>
Date: Mon, 08 Apr 2024 12:57:27 +0300
Message-ID: <87sezw9ny0.fsf@intel.com>
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

On Mon, 08 Apr 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Mon, 8 Apr 2024 at 11:09, Jani Nikula <jani.nikula@intel.com> wrote:
>> Thanks! Do you take this via the msm tree?
>
> Yes, I will

Forgot to mention, there's a Tested-by at [1].

Tested-by: Aishwarya TCV <aishwarya.tcv@arm.com>

[1] https://lore.kernel.org/r/157e69d4-850f-40d2-84ff-d25dd2c122b4@arm.com

-- 
Jani Nikula, Intel
