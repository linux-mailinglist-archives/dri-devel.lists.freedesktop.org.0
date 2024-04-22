Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6EB8ACF02
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF75112B32;
	Mon, 22 Apr 2024 14:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F385C112B13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:58:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mol@pengutronix.de>)
 id 1ryuBV-0004mi-PP; Mon, 22 Apr 2024 15:58:17 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mol@pengutronix.de>)
 id 1ryuBU-00Dhch-1z; Mon, 22 Apr 2024 15:58:16 +0200
Received: from mol by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mol@pengutronix.de>) id 1ryuBT-0089hS-37;
 Mon, 22 Apr 2024 15:58:15 +0200
Date: Mon, 22 Apr 2024 15:58:15 +0200
From: Michael Olbrich <m.olbrich@pengutronix.de>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: graphics@pengutronix.de
Subject: Reliably selecting non-CEA modes on Intel graphics (and maybe others)
Message-ID: <ZiZs94-ZP1n98RZu@pengutronix.de>
Mail-Followup-To: dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, graphics@pengutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Mon, 22 Apr 2024 14:10:02 +0000
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

Hi,

In short: I have a HDMI monitor attached to Intel graphics. I'm trying to
set a non-CEA mode but the driver always maps it to the corresponding CEA
mode.

More specifically, the monitor has two 1920x1080@60 modes in the EDID:
1. The CEA mode with VIC 16
2. A custom DTD mode with exactly the same timings (this is the preferred
   mode).

From a userspace perspective, the two modes are mostly identical, except
for the 16:9 aspect ratio flag in the CEA mode and the preferred type in
the other.

I want to select the second (preferred) mode, but that does not seem
possible:
intel_hdmi_compute_avi_infoframe() tries to determine which VIC should be
added to the avi infoframe and if limited or full range is used.
It uses various DRM helpers here but in the end drm_match_cea_mode() is
called. And here lies the problem:
The mode provided by the userspace has explicitly no aspect ratio. But
here, it is interpreted as "the aspect ration is undefined". So matching
ignored the aspect ratio and the CEA mode with VIC 16 is found and limited
range is used.

The commit that introduces this fuzzy matching
357768cc9e3fdacf6551da0ae1483bc87dbcb4e8 ("drm/edid: Fix cea mode aspect
ratio handling") made sense at the time. The capability
DRM_CLIENT_CAP_ASPECT_RATIO that exposes aspect ratios to userspace was
introduced later in the same merge request, from what I can tell
7595bda2fb4378ccbb8db1d0e8de56d15ea7f7fa ("drm: Add DRM client cap for
aspect-ratio").

Am I missing something here, or is it just not possible to select the
non-CEA mode right now? In my specific example, the selected CEA mode is
actually supported by the monitor, but as far as I can tell, the CEA mode
is used even if the monitor does not support it at all.

I've only tested this on Intel, but I assume that other drivers that use
the same helpers have the same problem.

So how can this be fixed? I've considered matching the aspect ratio based
on the DRM_CLIENT_CAP_ASPECT_RATIO capability, but I'm not sure if that is
valid. The documentation is limited and I found nothing that describes what
the userspace should do here.
Or would a new capability make sense here? Or something entirely different?
I'm not sure how I should proceed here. Any help would be appreciated.

Regards,
Michael

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
