Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425D0CAD8CB
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 16:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C34810E2C6;
	Mon,  8 Dec 2025 15:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSvy8L2d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B965A10E0F8;
 Mon,  8 Dec 2025 15:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765207125; x=1796743125;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vtbCP0So9dg8wp3/8nIemhY3agwH5kWIiXFupDiqAjU=;
 b=iSvy8L2drBiQLNYTTQdZAcu+yw203TMm/E+AzazckvTqPXvnca/VlAuZ
 SYYrpoxUOPUwlT7bMacCQ4mRzDK8TGl03ABCPWRaDyKMIroM/YtsykDJH
 5MIoqZTmg3diWGxlKKR1luPPw/SlMyMhp9QZ42WIB2uawLdQ7hlGorY5s
 V9Ds0QqJx4QN/JmC1cIQe5lfZa3uhT8+ZJ2XuyYODrMAU+OVFKgrBF2sN
 Uf9Bz8zkw3DAvA6eBd93mdmyzdgy6qn0cagOCgXNjVyGGItsKcomeBhsH
 wff4JGtZxNTZJ7dM4Q9CKSC9V7W4VKIZVG8ELvV2B8lPhNPbKavNdPnpc Q==;
X-CSE-ConnectionGUID: KPE/8VDtTQeRMZ+K2aY98g==
X-CSE-MsgGUID: j47PwWcRQJiHhbQ8d2BAxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77832357"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="77832357"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 07:18:44 -0800
X-CSE-ConnectionGUID: KhUq0OVaQQGbIq9kw3pIRA==
X-CSE-MsgGUID: VRPcS6l6QxW+Bg745+YVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="233327070"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.125])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 07:18:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 00/25] drm/vblank: refactoring and cleanups
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1764933891.git.jani.nikula@intel.com>
Date: Mon, 08 Dec 2025 17:18:39 +0200
Message-ID: <8fc6032b934906a4bb0858de0d4b50105bc0f77f@intel.com>
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

On Fri, 05 Dec 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> v3 of [1], just a resend to dri-devel, which I forgot to add, and
> Thomas' R-b's, which I also forgot to add, in v2.
>
> Fingers crossed I don't fumble it this time.

Yeah well, didn't fumble as such, but kunit breaks all over the place
with this. There are so many places that subtly call the interfaces when
there are no vblanks.

I tried to fix it, but looks like the only sane way is to add
drm_dev_has_vblank(dev) checks at the highest level functions and return
early. Back to the drawing board a bit. Maybe I'll send some of the
early patches separately.

BR,
Jani.

-- 
Jani Nikula, Intel
