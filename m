Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5D5C1F613
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 10:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AB510E8EC;
	Thu, 30 Oct 2025 09:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JaeSjNpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4376910E8FA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761817693; x=1793353693;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ebOkeb7fxZTrz/OPkH20h6r0CxV5A7mfKGATB6/yINM=;
 b=JaeSjNpIKSPEdZfNd8hp0flsMo22If7D8xeNOCOToUjNtPgJkfQjJD7X
 GD/CzT7OJ9UbbUzIwarHofKUfYFF7i30k1FunAMUzothtX3fW2wUuTJNI
 F05PMbtUPgg8RPGyHisvb3nCyodQRdx6h2yti5ALQm2aCBvx3eTcAXQWW
 UhujsRJYNF0wrw0iafcq6MGepl6LGaxhi7hOJakb92ql0N7K7E6UzUmPy
 w/J4f6CoJzp/jB1PjtST1APj6c6jdSm8/QdrQEoILOIndtpi8YstUKHyd
 jkOeoPfdDeNasyxpfMdYIITJhLEyBtol8bUBbIlWq6oqK4e/yy+QeGT+C A==;
X-CSE-ConnectionGUID: O/bVpTG9SReSj5ELxaA3Mw==
X-CSE-MsgGUID: Ed/8wmRWRGaMKJe/K1MvZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67815096"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="67815096"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 02:48:13 -0700
X-CSE-ConnectionGUID: ZDaYvyR+TOmXAeN/5d+Waw==
X-CSE-MsgGUID: X3rgFlSLS5GAnqeM2c8tnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="186653866"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.223])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 02:48:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Doug Anderson <dianders@chromium.org>, Ajye Huang
 <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, jazhan@google.com
Subject: Re: [PATCH v1 1/2] drm/panel-edp: Add override bpc quirk for
 generic edp
In-Reply-To: <CAD=FV=X9hUxsrJ6o5yP0-bprfKgyQzZJnQRwQVYRo6G0yKWhCg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
 <20251029081048.162374-2-ajye_huang@compal.corp-partner.google.com>
 <CAD=FV=X9hUxsrJ6o5yP0-bprfKgyQzZJnQRwQVYRo6G0yKWhCg@mail.gmail.com>
Date: Thu, 30 Oct 2025 11:48:06 +0200
Message-ID: <3ad3ee47f29f7b6479ec19b8fb61eee443a17264@intel.com>
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

On Wed, 29 Oct 2025, Doug Anderson <dianders@chromium.org> wrote:
> At first I was thinking that the quirks in "drm_edid.c" were probably
> just for "DP" display, but then I just realized that they probably
> also are for "eDP" panels. Specifically I think Intel hardware doesn't
> use panel-edp.c so I think the only place quirks could get applied (if
> an eDP panel was also used on Intel hardware) was from "drm_edid.c".
>
> Any chance you could confirm if EDID_QUIRK_FORCE_6BPC works for you?
>
> Does anyone else CCed have an opinion of which they like better?

No strong opinions, but obviously having it in drm_edid.c would be more
generic. Until you encounter panels where you need to force something
other than 6 bpc, when it stops being generic and becomes an
obstacle. ;)

BR,
Jani.

-- 
Jani Nikula, Intel
