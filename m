Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58648C46FB4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2BA10E3CC;
	Mon, 10 Nov 2025 13:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsZQcLin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29BE10E29F;
 Mon, 10 Nov 2025 13:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762782146; x=1794318146;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GQczp+bmtgkSPK1r3KQkisA0pPkBXYqJAGaQTNc9Uf4=;
 b=RsZQcLinWU5N5eZZ0G++2kBVy0hzsqnkiXPDnnfQrabb2LImumyo+Mat
 cK88oE+X1FLNAzPbjPYG0wRAuRg5ap4JY8TNg6nUyPKJDCQMVYdHnnqRk
 gLHYAc8Udp8nIc5AK47E96g/hMS4huZ7kShagxysIxhsQv9MlwvIR89U8
 Xn9FPPjb4hFtA9qsIEGIJb4BpadgKQrbGGjmPBf2OG6rJgKtfS6yvRhXy
 oNzJ8tr/iO/nWyLw80d3KqUXFl5SolCio4GCCz/IuaDbKh0woS9fddys8
 3owOLTyrmc/NjlQ2l1lWM/oeZJxio6/8pHyeONFYW/lqUBaIW60RU0ew4 A==;
X-CSE-ConnectionGUID: T460kdQyQzOtu0soHrWILA==
X-CSE-MsgGUID: z18CGiwuTiKeoPyu8ajl/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75123676"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="75123676"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 05:42:25 -0800
X-CSE-ConnectionGUID: lh9G0KYvRBG8vumlivK8ZQ==
X-CSE-MsgGUID: 6VfLljQHQtSeQm3D6sdyVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="219333066"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 05:42:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 2/6] drm/atomic: use drm_crtc_vblank_waitqueue()
In-Reply-To: <b85b321f-9ce7-4c1e-910b-01a5265009ef@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762513240.git.jani.nikula@intel.com>
 <1097348197acea9110da8baebbbc189890d01660.1762513240.git.jani.nikula@intel.com>
 <29b1cc39-7868-4b15-bac6-7dc97869dbdb@suse.de>
 <a605efb1745f0d2c96ff986fed7bdeeb6226b7ad@intel.com>
 <b85b321f-9ce7-4c1e-910b-01a5265009ef@suse.de>
Date: Mon, 10 Nov 2025 15:42:21 +0200
Message-ID: <aaa452c4842b74d0d2a975bf28bda79fda83de10@intel.com>
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

On Mon, 10 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Please also merge the rest of the series. These patches are an 
> improvement to open-coding the access to the fields.

Fair. Thanks, pushed now.

BR,
Jani.


-- 
Jani Nikula, Intel
