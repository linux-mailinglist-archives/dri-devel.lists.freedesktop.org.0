Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4E8725D6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 18:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF56310E575;
	Tue,  5 Mar 2024 17:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEKLb6qB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A79D10E24E;
 Tue,  5 Mar 2024 17:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709660598; x=1741196598;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=46bmXm5NdVzXD7aj/PEr900sAqVkl2XKclSLE1UzPj8=;
 b=XEKLb6qBhJtcYXEHA+WL9hUv7fI6aHSuxqDUo9BiPWgIoV+7winE3fqw
 wdNLszz9CF2GMunUIU/N253ZLQQTVU+8PjIeUjYsPvryGX6E5Ye8OJ7Na
 oPdfQ3B1N0FLxmiGGAz/3drOTEkCmSsbLSguItpFWFiZ3EWhSocoJylZs
 KrYCaCRhKTm6I3EPOnqeygNbpKboGutDenEtdVxE0ev6fUwwCKan6M+RG
 Kv6fl4RuFa02LzoH1Z/DOTvnlKWHFchL4CQyTI2VlRP/I6bejhrau3tXo
 b4iun6gdbvw9fXXbCivAgY+J4xeUNtgwp7601i/X3vpKfB6aIzq9rPSmM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15372085"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="15372085"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:43:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9316216"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:43:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Danilo
 Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>,
 Xinhui.Pan@amd.com, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Sui Jingfeng <sui.jingfeng@linux.dev>, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND v3 0/2] drm: enable W=1 warnings by default across the
 subsystem
In-Reply-To: <0df557af4aaceeb1ef85ee3c74169ee9@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709629403.git.jani.nikula@intel.com>
 <0df557af4aaceeb1ef85ee3c74169ee9@kernel.org>
Date: Tue, 05 Mar 2024 19:43:07 +0200
Message-ID: <8734t41sno.fsf@intel.com>
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

On Tue, 05 Mar 2024, "Maxime Ripard" <mripard@kernel.org> wrote:
> On Tue, 5 Mar 2024 11:07:34 +0200, Jani Nikula wrote:
>> Resend of [1] with an intent to merge after the CI results come in. This
>> is aiming for v6.10, so we'll have maximal time to find all the issues
>> my configs didn't catch.
>> 
>> I built this on x86-64 (both gcc and clang), arm and arm64, and
>> 
>> [ ... ]
>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks everyone for acks and reviews, pushed to drm-misc-next.

BR,
Jani.


-- 
Jani Nikula, Intel
