Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AA29054FA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F1C10E86D;
	Wed, 12 Jun 2024 14:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bp0DfYeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28A910E86D;
 Wed, 12 Jun 2024 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718201951; x=1749737951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CouY0ZgYDtH5IAa9rKLNW22UZQjmUVigX30l9hMVayo=;
 b=Bp0DfYeAD91ZpDMf9ekmRs/qu3K6ByJodhGaqlmMkrmz/YEGjhzF37uq
 YZasFM2b+bpGhFONT3I+EWYbAg2dnaXYpdq6z8zNbNqo5KFIgv6JbFfwt
 rLtSmIpp44tWJ+6rpTlqUrvdvj7iRgwxzpmsrhje+tjv7uVn1wTfDrjYk
 oU4BJzFd3mBzq/cbyD+VsSNRI8e3ui4o8wKXiLXci9zbGw3AuCzVD/3Bz
 Nh3S4FwgFG4ERBbShoO+Kjwq3xhKrJbS4wjAthoBQPGJ0KoOMqYMQnTam
 y7sP8ONiFhUERQkHz3kc4V5VflWh6MmpZ8tPE3P/s/uRMly2ulcA5jxGb g==;
X-CSE-ConnectionGUID: By4JeN5ySJalwpLhfnQ1qA==
X-CSE-MsgGUID: Q0sSpWceSCOmHWrtrinelw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25600427"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="25600427"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:19:11 -0700
X-CSE-ConnectionGUID: dr162fluRuSUlt7cEByU8Q==
X-CSE-MsgGUID: IvZ+lUnzSMOYM0T5XDjIFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39760191"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 07:19:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 17:19:07 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH 2/2] drm/doc: Document that userspace should utilize CRTCs
 bottom up
Date: Wed, 12 Jun 2024 17:19:03 +0300
Message-ID: <20240612141903.17219-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612141903.17219-1-ville.syrjala@linux.intel.com>
References: <20240612141903.17219-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

At leat on Intel GPUs it is best to allocate CRTCs bottom up
as it will generally lead to lower power consumption. Recommend
userspace does so.

Not sure if this is strictly the best order for other hardware,
but drivers could always rearrange the CRTC list into some kind
of priority order to make it work. Should that turn out to be
insufficient we might need some kind of more complex priority
scheme.

Probably the ideal solution would be to have the driver be
responsible for resource allocation entirely. Ie. the CRTCs
visible via uapi would be virtual and the driver could make
the final choice on which hardware CRTC to use for each.
Unfortunately the kms uapi is geared towards exposing hardware
directly. Eg. when CRTCs are non-uniform in hardware there is
no good way to expose their capabilities. The virtual CRTCs
would more or less either have to expose a superset or a subset
of the capabilities across all hardware CRTCs. Also the
crtc->encoder->connector routing information exposed in the
uapi is all about the actual hardware signal routing. I think
robust virtualized CRTCs would require some new form of uapi
where userspace could declare ahead of time which features
wants on the CRTC (even if not enabling all of them from
the start), and the driver would then have enough information
to make the optimal choice.

Cc: Simon Ser <contact@emersion.fr>
Cc: Daniel Stone <daniels@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/uapi/drm/drm_mode.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index fe5e210396b2..aa90f11950d6 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -386,6 +386,9 @@ struct drm_mode_get_encoder {
 
 	/**
 	 * @possible_crtcs: Bitmask of CRTCs compatible with the encoder.
+	 * If multiple CRTCs are possible userspace should generally try
+	 * to utilize CRTCs bottom up as that may result in lower power
+	 * consumption on some systems.
 	 * CRTCs are created and they receive an index, which corresponds
 	 * to their position in the bitmask. Bit N corresponds to
 	 * :ref:`CRTC index<crtc_index>` N.
-- 
2.44.2

