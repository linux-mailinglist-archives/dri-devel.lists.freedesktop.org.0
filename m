Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615D414E951
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6426FA93;
	Fri, 31 Jan 2020 08:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1236F90D;
 Thu, 30 Jan 2020 08:32:56 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so2978806wrq.0;
 Thu, 30 Jan 2020 00:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mqV0fT/ncaD/YJHsfmzv5rFTbuhd1bc0cBkD/akkLbo=;
 b=TsnposRa7WGz3pW9s2iNyMfXZFQ1Yemb7dUagN7tNileYwzO4ngKM8x9lbcBfEy+ox
 fqJGQCO79zE7Ow5Imb+HH84PJDERG0tRbUpqxyhcDCZAd5ktHP9tVVDxBo2jqyYJxa2d
 KJTKbFs3FIMLb65xysD+yOwNcZOikrWla8ivKYQHQvh1dXC30pF9afNnj5R9gUa5zU3B
 RJk30F98m9B3X/5UbewtUVosa3oBst9khOvtS2rFrruQkgivziULa+zCUqzI+nGpx1FK
 hAOfam2aaau3RFaaj9mI6px6DuJPlEVhxXnneitWEpjtyfEvJWj96OPQ9Uk3LclNkEMp
 7eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mqV0fT/ncaD/YJHsfmzv5rFTbuhd1bc0cBkD/akkLbo=;
 b=DhGI64bPFoqoaf+FoVyaVocbixPavYAOmac0bN8UXKFUgriGBgVMr0cuQskAyU43hB
 5GUt0XpnWxJtP7/w7G7lr5QwbqPE4kYGuLKyhIg9IwQG9basQHLm4MqlGHQnxCnVZhYY
 VJhzKVxgEoIU0YDhtw0jdPJFZzEF7xuLNQd2kPpwzOtb56gOCwSdX8Csj0T7aYF6xMey
 yJWNQaICRmSIiyoh/7xea4CjPxe5AqqY611U2FPEbXVvVtIciAj5KxK6fKAPYqjAL3Qi
 0W0CTUELzAOyoVVbj8Jk7hWq1OIKFK6SyLFIjMFFbawVjRKQnAR1oz7qRNwHCHn9I1AY
 ISNA==
X-Gm-Message-State: APjAAAV+lE0cuNK/b2WSN47CXIotyjC2bwoikHAnbkh5WVljJrSjYWt7
 rMMbkNDA7GRDz8gipRVBUOY=
X-Google-Smtp-Source: APXvYqzhWu4jNdP+y3/zt5zjD4vcBLtUfg0SjJ1rRRzk5YdW7N5GNjD0DKCK/Ymul9yo9ED2ueahHw==
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr3829899wrs.287.1580373175435; 
 Thu, 30 Jan 2020 00:32:55 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:32:54 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 06/12] drm/i915/tc: automatic conversion to drm_device based
 logging macros.
Date: Thu, 30 Jan 2020 11:32:23 +0300
Message-Id: <20200130083229.12889-7-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130083229.12889-1-wambui.karugax@gmail.com>
References: <20200130083229.12889-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converts most uses of the printk based logging macros to the struct
drm_device based logging macros in i915/display/intel_tc.c using the
following coccinelle script that matches based on the existence of a
struct drm_i915_private device:
@@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_tc.c | 33 ++++++++++++++-----------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 7773169b7331..01508e447836 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -181,8 +181,9 @@ static u32 tc_port_live_status_mask(struct intel_digital_port *dig_port)
 				PORT_TX_DFLEXDPSP(dig_port->tc_phy_fia));
 
 	if (val == 0xffffffff) {
-		DRM_DEBUG_KMS("Port %s: PHY in TCCOLD, nothing connected\n",
-			      dig_port->tc_port_name);
+		drm_dbg_kms(&i915->drm,
+			    "Port %s: PHY in TCCOLD, nothing connected\n",
+			    dig_port->tc_port_name);
 		return mask;
 	}
 
@@ -210,8 +211,9 @@ static bool icl_tc_phy_status_complete(struct intel_digital_port *dig_port)
 	val = intel_uncore_read(uncore,
 				PORT_TX_DFLEXDPPMS(dig_port->tc_phy_fia));
 	if (val == 0xffffffff) {
-		DRM_DEBUG_KMS("Port %s: PHY in TCCOLD, assuming not complete\n",
-			      dig_port->tc_port_name);
+		drm_dbg_kms(&i915->drm,
+			    "Port %s: PHY in TCCOLD, assuming not complete\n",
+			    dig_port->tc_port_name);
 		return false;
 	}
 
@@ -228,8 +230,9 @@ static bool icl_tc_phy_set_safe_mode(struct intel_digital_port *dig_port,
 	val = intel_uncore_read(uncore,
 				PORT_TX_DFLEXDPCSSS(dig_port->tc_phy_fia));
 	if (val == 0xffffffff) {
-		DRM_DEBUG_KMS("Port %s: PHY in TCCOLD, can't set safe-mode to %s\n",
-			      dig_port->tc_port_name,
+		drm_dbg_kms(&i915->drm,
+			    "Port %s: PHY in TCCOLD, can't set safe-mode to %s\n",
+			    dig_port->tc_port_name,
 			      enableddisabled(enable));
 
 		return false;
@@ -243,8 +246,9 @@ static bool icl_tc_phy_set_safe_mode(struct intel_digital_port *dig_port,
 			   PORT_TX_DFLEXDPCSSS(dig_port->tc_phy_fia), val);
 
 	if (enable && wait_for(!icl_tc_phy_status_complete(dig_port), 10))
-		DRM_DEBUG_KMS("Port %s: PHY complete clear timed out\n",
-			      dig_port->tc_port_name);
+		drm_dbg_kms(&i915->drm,
+			    "Port %s: PHY complete clear timed out\n",
+			    dig_port->tc_port_name);
 
 	return true;
 }
@@ -258,8 +262,9 @@ static bool icl_tc_phy_is_in_safe_mode(struct intel_digital_port *dig_port)
 	val = intel_uncore_read(uncore,
 				PORT_TX_DFLEXDPCSSS(dig_port->tc_phy_fia));
 	if (val == 0xffffffff) {
-		DRM_DEBUG_KMS("Port %s: PHY in TCCOLD, assume safe mode\n",
-			      dig_port->tc_port_name);
+		drm_dbg_kms(&i915->drm,
+			    "Port %s: PHY in TCCOLD, assume safe mode\n",
+			    dig_port->tc_port_name);
 		return true;
 	}
 
@@ -415,10 +420,10 @@ static void intel_tc_port_reset_mode(struct intel_digital_port *dig_port,
 	icl_tc_phy_disconnect(dig_port);
 	icl_tc_phy_connect(dig_port, required_lanes);
 
-	DRM_DEBUG_KMS("Port %s: TC port mode reset (%s -> %s)\n",
-		      dig_port->tc_port_name,
-		      tc_port_mode_name(old_tc_mode),
-		      tc_port_mode_name(dig_port->tc_mode));
+	drm_dbg_kms(&i915->drm, "Port %s: TC port mode reset (%s -> %s)\n",
+		    dig_port->tc_port_name,
+		    tc_port_mode_name(old_tc_mode),
+		    tc_port_mode_name(dig_port->tc_mode));
 }
 
 static void
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
