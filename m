Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734D18CE2FC
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 11:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A88E10E1E6;
	Fri, 24 May 2024 09:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqryNQYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C7710E1E6;
 Fri, 24 May 2024 09:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716541639; x=1748077639;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Rdxy52CknPfn2K6B1fUq0eTIM1EjVHuABUJyVwPSQOE=;
 b=fqryNQYRqSqNrpcEFogv3Ot3o/7tTFepyg3CnFHxPbGbqYCYKbduXuqf
 oU92XskW6CaKknlR2T3pUapm5BIlV0a7wQ71sp3pQA3HteUwoZw5P/8XD
 zGHXPNY5TV+SW0Ny6Vyzkt6nJzJvFHxJvtioP4L5Hag8sHTD8lPlyfzXk
 +9v2kWXgalBVneNSa0EdTqY4Ica7D0zDIVjaqUf5vAehm6PYNKZ0DzlNQ
 ZaS89jKd3mXkYGfHljOLTGXGQcvJEHG6nCka26PDMZl7VwOMKLVeY8+i7
 JW1Ts8xBc6eQJgetNIVg59+DkZzNyGlaAwqyRJk2E5FxMMe0QiYjSs2gV w==;
X-CSE-ConnectionGUID: 6MUzlyyLRSKxX3ixaqAtkg==
X-CSE-MsgGUID: ryzAx/bpQfeSXzUwil+CnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="24320695"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="24320695"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 02:07:18 -0700
X-CSE-ConnectionGUID: phUukf5zRtmPZ1ADWSnpeA==
X-CSE-MsgGUID: jaqfYA8xQe6Rrm5GRsylbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="33840722"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 02:07:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 1/4] drm/amdgpu: fix -Wformat-truncation warning in
 amdgpu_gfx_kiq_init_ring()
In-Reply-To: <CADnq5_MDPH-WxpucjQpKsCAk8mKa75upbcGN3KJo_dqKts4kTg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1716479340.git.jani.nikula@intel.com>
 <4b9ca4a1bd8e77f2d9b912b4af5d4fbdec13e801.1716479340.git.jani.nikula@intel.com>
 <CADnq5_MDPH-WxpucjQpKsCAk8mKa75upbcGN3KJo_dqKts4kTg@mail.gmail.com>
Date: Fri, 24 May 2024 12:07:12 +0300
Message-ID: <87h6eno9xb.fsf@intel.com>
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

On Thu, 23 May 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
> Already fixed with this patch:
> https://patchwork.freedesktop.org/patch/594864/

Great, thanks!

BR,
Jani.



-- 
Jani Nikula, Intel
