Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7508C8A9D7D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B306A113D23;
	Thu, 18 Apr 2024 14:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmY7Jq8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C728A10FA4D;
 Thu, 18 Apr 2024 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713451647; x=1744987647;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=l1HIy3FJpQ3J5hbmOiUwQefqWzbiC86Fv5XfCvkeVdE=;
 b=QmY7Jq8jDdzYw4zZpcTakUsoCTHhE0G+XkibM9ZVjyeS7OH9a05DOPER
 XpWPDzmyvsvRWBQCM7zJoAVHbp0TpTNZV0uN3DafS+TjIEm3WcRISAIp0
 gZhkXm2l+G2pfFaL7Tw+HontnBBHa5NS5nPwIS41m+l2qWJmge4kuxkP0
 Djp6Hv3SEKG1ZTM0u2x2BOahv0Alt/SEhJMEwLdlHf5g4EwK2AcjeeaIb
 8YdSnceK0pYUDnlaG31O5HGa1YfDI9pxzJxvGXRq5kBnX4UBAHQuN2w9q
 tu1R+rF/aJGGLbEQqU2yktj2FNEP/xKrNEC/oy/CqF3GmuEMsF7uzVdBh Q==;
X-CSE-ConnectionGUID: +CaYqlR+QB2Ru+y+AOQvpw==
X-CSE-MsgGUID: 8HEqFWhMR6KEgo38njxDpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19562198"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="19562198"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:47:26 -0700
X-CSE-ConnectionGUID: EznitMQjRJCox3ECFus2MQ==
X-CSE-MsgGUID: nerWkFksSva5bR4W+AuhGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23050115"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:47:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda
 <andrzej.hajda@intel.com>, Maxime Ripard <mripard@kernel.org>, Jacek
 Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, Huang Rui <ray.huang@amd.com>, Zack Rusin
 <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/print: drop include debugfs.h and include
 where needed
In-Reply-To: <CAN6tsi5PEc+KOQV9zNLZ_3c-8XyjEtx8+EkSHkB8epu4N_aMZg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240418101247.2642864-1-jani.nikula@intel.com>
 <CAN6tsi5PEc+KOQV9zNLZ_3c-8XyjEtx8+EkSHkB8epu4N_aMZg@mail.gmail.com>
Date: Thu, 18 Apr 2024 17:47:15 +0300
Message-ID: <87ttjywwwc.fsf@intel.com>
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

On Thu, 18 Apr 2024, Robert Foss <rfoss@kernel.org> wrote:
> I'm seeing build errors for drivers/gpu/drm/bridge/ite-it6505.c, is
> this expected?

No, but it's possible my configs didn't catch all configs. :(

BR,
Jani.


-- 
Jani Nikula, Intel
