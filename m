Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5738B60AE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 19:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D653710FCEB;
	Mon, 29 Apr 2024 17:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cm5m/pEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A88D10EB98
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 17:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714413216; x=1745949216;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=sm1Ki+nat4ukQF2KI9rmslFKKP2ZZPhPo085WLRx/sY=;
 b=Cm5m/pEzfjCny2eTUKCRHM61v+uzr6IiL7vomstZFOp6YVUGOc/X8z8T
 J1GxOX69iAQuGdL6+5ZZsrvIEsTJGLOWv4RQQd86mw583lvsj7ONSvaXl
 LbSyjSSMbWGpcxmfVYQ2QZsLoiU0JQ9xSz+PFg0nEfjm9qakVlg94b2ua
 QP2XC0hiiTL8fFrjFU1kbmr4Rje+fQv/+7+m9HbmaurJKPN25Mub0/SbW
 usNyZZ1Uue82GC5TSUuqBAr9a4z2BDt1e0zN7/zvQHEfcIWp42ckn8lgt
 C8+E6N19Qy7oBerKwLSMxmXyzpgGwog2Fx87FdfGfigk3Bd19sbtwhL3O w==;
X-CSE-ConnectionGUID: Nn/I+s6gRo+EXkZOKgTfhw==
X-CSE-MsgGUID: ClJAiC7RTh+UvT4/Omu0tA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9964175"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="9964175"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 10:53:19 -0700
X-CSE-ConnectionGUID: Xh9hH/+pQxypBt2JYuk6zA==
X-CSE-MsgGUID: Hnw8jZe5RnOqR2S4OjOP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="57064546"
Received: from mziotti-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.252.49.213])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 10:53:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: deprecate driver date
In-Reply-To: <c6f1677d-6fdd-4a64-9072-5ecf6dae1966@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240429164336.1406480-1-jani.nikula@intel.com>
 <c6f1677d-6fdd-4a64-9072-5ecf6dae1966@amd.com>
Date: Mon, 29 Apr 2024 20:53:15 +0300
Message-ID: <87v8402gz8.fsf@intel.com>
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

On Mon, 29 Apr 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> On 4/29/24 12:43, Jani Nikula wrote:
>> The driver date serves no useful purpose, because it's hardly ever
>> updated. The information is misleading at best.
>> 
>> As described in Documentation/gpu/drm-internals.rst:
>> 
>>    The driver date, formatted as YYYYMMDD, is meant to identify the date
>>    of the latest modification to the driver. However, as most drivers
>>    fail to update it, its value is mostly useless. The DRM core prints it
>>    to the kernel log at initialization time and passes it to userspace
>>    through the DRM_IOCTL_VERSION ioctl.
>> 
>> Stop printing the driver date at init, and start returning the empty
>> string "" as driver date through the DRM_IOCTL_VERSION ioctl.
>> 
>> The driver date initialization in drivers and the struct drm_driver date
>> member can be removed in follow-up.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> I would prefer if it was dropped entirely in this patch, but if you feel
> that would require too much back and forth, I'm okay with what is
> currently proposed.

I can if that's what people prefer, but decided to start with this for
the inevitable discussion before putting in the effort. ;)

> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Thanks,
Jani.


-- 
Jani Nikula, Intel
