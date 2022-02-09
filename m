Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6984AEDD4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362DC10E660;
	Wed,  9 Feb 2022 09:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FD710E35A;
 Wed,  9 Feb 2022 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644398377; x=1675934377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lw+t0ymKc5gweSXGRCzsCZroyd/waMXDaOSv5aYUXXQ=;
 b=EQUUCXY7ImvmgTMbXg5wr2LESwn+XmCJYrs4Dl0+hUNJYe6y6+Tevlt3
 /ugGJ5QNS7aQr5Wn4CDyV2UHXWzF9LUbptOH6kArmuIMIkiwjRrJbW44U
 Nx4OoIL/p/57b/mQ1phpT5IOf1kMVQfBTiQdVl9PkHFeQBDGSzpMSta4r
 q/42yFLaGf0rVAl5bGTiKDjmX89omFJlrULzbyal8c7050Ttnqyjncpjh
 7i8hZ0H4d9RYdoEwQqp80kixT7RjByRmbATzOOaEDCjsWdI+UFs/jqWlh
 yJ0Q4lA+Nfq7OojeoEWtbc2SYg8IOwp+UjQYK3XIWVak8cfDzS3M793Rh Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249110820"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="249110820"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 01:19:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="541015555"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 09 Feb 2022 01:19:29 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 11:19:28 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/atomic: Don't pollute crtc_state->mode_blob with
 error pointers
Date: Wed,  9 Feb 2022 11:19:27 +0200
Message-Id: <20220209091928.14766-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: fuyufan <fuyufan@huawei.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make sure we don't assign an error pointer to crtc_state->mode_blob
as that will break all kinds of places that assume either NULL or a
valid pointer (eg. drm_property_blob_put()).

Reported-by: fuyufan <fuyufan@huawei.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9781722519c3..54d62fdb4ef9 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -76,15 +76,17 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
 	state->mode_blob = NULL;
 
 	if (mode) {
+		struct drm_property_blob *blob;
+
 		drm_mode_convert_to_umode(&umode, mode);
-		state->mode_blob =
-			drm_property_create_blob(state->crtc->dev,
-						 sizeof(umode),
-						 &umode);
-		if (IS_ERR(state->mode_blob))
-			return PTR_ERR(state->mode_blob);
+		blob = drm_property_create_blob(crtc->dev,
+						sizeof(umode), &umode);
+		if (IS_ERR(blob))
+			return PTR_ERR(blob);
 
 		drm_mode_copy(&state->mode, mode);
+
+		state->mode_blob = blob;
 		state->enable = true;
 		drm_dbg_atomic(crtc->dev,
 			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
-- 
2.34.1

