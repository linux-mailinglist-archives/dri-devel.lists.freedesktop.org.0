Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159F41771C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 16:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBC26EE29;
	Fri, 24 Sep 2021 14:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08116EE29
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:53:48 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id a7so6664303plm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ALjz8wrBXPr8FWbSlYV+271EeBonEE1NQvNWCXZyYXs=;
 b=nU21q28NCQgtsfejxXOFTM47wEQL+kmN01CzpueLTr8oirBWfJwuTVEmSGdmJP3HKb
 Nuxi5DInsCllpkCG3LeZjkOLKA/QPepPyjFdt4pJ+v4IXRcEV6H0GN3wreDXnqjGzGhn
 lnZt41mJEogEkrGTwAzAUsDxul3caOB/+4zp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ALjz8wrBXPr8FWbSlYV+271EeBonEE1NQvNWCXZyYXs=;
 b=nVnCt+XreQoGOJSVkVa4BE01YZAIFnDkGR8JqZKyJXPgQ/+fSG95D1jQUhgc6S+FNx
 GH2ihzvnYDJVkU/jU2ZMIMsH4MKIMbeQqEIMJBFjnHPhdNCDwyh/0gBO1J3nYQNo7vuA
 BpLikvjWHLyMwmxXxzcZoADwTJ0CCaSLOXZQMgVhIpuDAvlMgYWOKIelWGEpnx+PKy2n
 Fd3CWE4rNWrPlaUo4a54SCbbzAfPa/g+E+F94I+TsFJaO5qPyg9n9q89eNB3G0CeEdFt
 aB7KbSG6lY3Dn0FcAV21HJLF8SpvvWFsI22DblKZmvNCJhjf5niVF8+lJ3gou5gmZgrN
 jCsg==
X-Gm-Message-State: AOAM531kOI6kwxK6z9EM29oPgAtAsliVCqVsCBc53rMNwssGtjJ6Kq+z
 v464OC8CuSklAQXhWh8E8laXGshQ1Q4w+w==
X-Google-Smtp-Source: ABdhPJxuioR5dP73NT+cBDAvr0wEzUFY03cfpo7frwd1WpKOQvwQBLzeDSNG4JcvPj++iKmuQagGbg==
X-Received: by 2002:a17:902:e88d:b0:13b:8ed2:9f42 with SMTP id
 w13-20020a170902e88d00b0013b8ed29f42mr9532326plg.67.1632495228085; 
 Fri, 24 Sep 2021 07:53:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:4de4:f47f:9d40:cc05])
 by smtp.gmail.com with ESMTPSA id y13sm12023005pjr.1.2021.09.24.07.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 07:53:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: a.hajda@samsung.com, smyakam@microsoft.com, jani.nikula@linux.intel.com,
 linus.walleij@linaro.org, stanislav.lisovskiy@intel.com,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/edid: Fix EDID quirk compile error on older compilers
Date: Fri, 24 Sep 2021 07:53:21 -0700
Message-Id: <20210924075317.1.I1e58d74d501613f1fe7585958f451160d11b8a98@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
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

Apparently some compilers [1] cannot handle doing math on dereferenced
string constants at compile time. This has led to reports [2] of
compile errors like:

  In file included from drivers/gpu/drm/drm_edid.c:42:0:
  ./include/drm/drm_edid.h:525:2: error: initializer element is not constant
    ((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \

Go back to the syntax I used in v4 of the patch series [3] that added
this code instead of what landed (v5). This syntax is slightly uglier
but should be much more compatible with varied compilers.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18
[2] https://lore.kernel.org/r/874kaabdt5.fsf@intel.com/
[3] https://lore.kernel.org/r/20210909135838.v4.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid/

Fixes: d9f91a10c3e8 ("drm/edid: Allow querying/working with the panel ID from the EDID")
Reported-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Reported-by: Srikanth Myakam <smyakam@microsoft.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_edid.c        | 121 +++++++++++++++---------------
 drivers/gpu/drm/panel/panel-edp.c |  23 +++---
 include/drm/drm_edid.h            |  14 ++--
 3 files changed, 81 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 53b342c058be..9b19eee0e1b4 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -100,9 +100,10 @@ struct detailed_mode_closure {
 #define LEVEL_GTF2	2
 #define LEVEL_CVT	3
 
-#define EDID_QUIRK(vend, product_id, _quirks) \
+#define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quirks) \
 { \
-	.panel_id = drm_edid_encode_panel_id(vend, product_id), \
+	.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
+					     product_id), \
 	.quirks = _quirks \
 }
 
@@ -111,116 +112,116 @@ static const struct edid_quirk {
 	u32 quirks;
 } edid_quirk_list[] = {
 	/* Acer AL1706 */
-	EDID_QUIRK("ACR", 44358, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('A', 'C', 'R', 44358, EDID_QUIRK_PREFER_LARGE_60),
 	/* Acer F51 */
-	EDID_QUIRK("API", 0x7602, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('A', 'P', 'I', 0x7602, EDID_QUIRK_PREFER_LARGE_60),
 
 	/* AEO model 0 reports 8 bpc, but is a 6 bpc panel */
-	EDID_QUIRK("AEO", 0, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('A', 'E', 'O', 0, EDID_QUIRK_FORCE_6BPC),
 
 	/* BOE model on HP Pavilion 15-n233sl reports 8 bpc, but is a 6 bpc panel */
-	EDID_QUIRK("BOE", 0x78b, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('B', 'O', 'E', 0x78b, EDID_QUIRK_FORCE_6BPC),
 
 	/* CPT panel of Asus UX303LA reports 8 bpc, but is a 6 bpc panel */
-	EDID_QUIRK("CPT", 0x17df, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('C', 'P', 'T', 0x17df, EDID_QUIRK_FORCE_6BPC),
 
 	/* SDC panel of Lenovo B50-80 reports 8 bpc, but is a 6 bpc panel */
-	EDID_QUIRK("SDC", 0x3652, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('S', 'D', 'C', 0x3652, EDID_QUIRK_FORCE_6BPC),
 
 	/* BOE model 0x0771 reports 8 bpc, but is a 6 bpc panel */
-	EDID_QUIRK("BOE", 0x0771, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('B', 'O', 'E', 0x0771, EDID_QUIRK_FORCE_6BPC),
 
 	/* Belinea 10 15 55 */
-	EDID_QUIRK("MAX", 1516, EDID_QUIRK_PREFER_LARGE_60),
-	EDID_QUIRK("MAX", 0x77e, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('M', 'A', 'X', 1516, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('M', 'A', 'X', 0x77e, EDID_QUIRK_PREFER_LARGE_60),
 
 	/* Envision Peripherals, Inc. EN-7100e */
-	EDID_QUIRK("EPI", 59264, EDID_QUIRK_135_CLOCK_TOO_HIGH),
+	EDID_QUIRK('E', 'P', 'I', 59264, EDID_QUIRK_135_CLOCK_TOO_HIGH),
 	/* Envision EN2028 */
-	EDID_QUIRK("EPI", 8232, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('E', 'P', 'I', 8232, EDID_QUIRK_PREFER_LARGE_60),
 
 	/* Funai Electronics PM36B */
-	EDID_QUIRK("FCM", 13600, EDID_QUIRK_PREFER_LARGE_75 |
+	EDID_QUIRK('F', 'C', 'M', 13600, EDID_QUIRK_PREFER_LARGE_75 |
 				       EDID_QUIRK_DETAILED_IN_CM),
 
 	/* LGD panel of HP zBook 17 G2, eDP 10 bpc, but reports unknown bpc */
-	EDID_QUIRK("LGD", 764, EDID_QUIRK_FORCE_10BPC),
+	EDID_QUIRK('L', 'G', 'D', 764, EDID_QUIRK_FORCE_10BPC),
 
 	/* LG Philips LCD LP154W01-A5 */
-	EDID_QUIRK("LPL", 0, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
-	EDID_QUIRK("LPL", 0x2a00, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
+	EDID_QUIRK('L', 'P', 'L', 0, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
+	EDID_QUIRK('L', 'P', 'L', 0x2a00, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
 
 	/* Samsung SyncMaster 205BW.  Note: irony */
-	EDID_QUIRK("SAM", 541, EDID_QUIRK_DETAILED_SYNC_PP),
+	EDID_QUIRK('S', 'A', 'M', 541, EDID_QUIRK_DETAILED_SYNC_PP),
 	/* Samsung SyncMaster 22[5-6]BW */
-	EDID_QUIRK("SAM", 596, EDID_QUIRK_PREFER_LARGE_60),
-	EDID_QUIRK("SAM", 638, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
 
 	/* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc */
-	EDID_QUIRK("SNY", 0x2541, EDID_QUIRK_FORCE_12BPC),
+	EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
 
 	/* ViewSonic VA2026w */
-	EDID_QUIRK("VSC", 5020, EDID_QUIRK_FORCE_REDUCED_BLANKING),
+	EDID_QUIRK('V', 'S', 'C', 5020, EDID_QUIRK_FORCE_REDUCED_BLANKING),
 
 	/* Medion MD 30217 PG */
-	EDID_QUIRK("MED", 0x7b8, EDID_QUIRK_PREFER_LARGE_75),
+	EDID_QUIRK('M', 'E', 'D', 0x7b8, EDID_QUIRK_PREFER_LARGE_75),
 
 	/* Lenovo G50 */
-	EDID_QUIRK("SDC", 18514, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('S', 'D', 'C', 18514, EDID_QUIRK_FORCE_6BPC),
 
 	/* Panel in Samsung NP700G7A-S01PL notebook reports 6bpc */
-	EDID_QUIRK("SEC", 0xd033, EDID_QUIRK_FORCE_8BPC),
+	EDID_QUIRK('S', 'E', 'C', 0xd033, EDID_QUIRK_FORCE_8BPC),
 
 	/* Rotel RSX-1058 forwards sink's EDID but only does HDMI 1.1*/
-	EDID_QUIRK("ETR", 13896, EDID_QUIRK_FORCE_8BPC),
+	EDID_QUIRK('E', 'T', 'R', 13896, EDID_QUIRK_FORCE_8BPC),
 
 	/* Valve Index Headset */
-	EDID_QUIRK("VLV", 0x91a8, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91b0, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91b1, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91b2, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91b3, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91b4, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91b5, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91b6, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91b7, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91b8, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91b9, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91ba, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91bb, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91bc, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91bd, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91be, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("VLV", 0x91bf, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91a8, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91b0, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91b1, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91b2, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91b3, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91b4, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91b5, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91b6, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91b7, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91b8, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91b9, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91ba, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91bb, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91bc, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91bd, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
 
 	/* HTC Vive and Vive Pro VR Headsets */
-	EDID_QUIRK("HVR", 0xaa01, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("HVR", 0xaa02, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
 
 	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
-	EDID_QUIRK("OVR", 0x0001, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("OVR", 0x0003, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("OVR", 0x0004, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("OVR", 0x0012, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('O', 'V', 'R', 0x0001, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('O', 'V', 'R', 0x0003, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('O', 'V', 'R', 0x0004, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('O', 'V', 'R', 0x0012, EDID_QUIRK_NON_DESKTOP),
 
 	/* Windows Mixed Reality Headsets */
-	EDID_QUIRK("ACR", 0x7fce, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("HPN", 0x3515, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("LEN", 0x0408, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("LEN", 0xb800, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("FUJ", 0x1970, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("DEL", 0x7fce, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("SEC", 0x144a, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK("AUS", 0xc102, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('A', 'C', 'R', 0x7fce, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('H', 'P', 'N', 0x3515, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('L', 'E', 'N', 0x0408, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('L', 'E', 'N', 0xb800, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('F', 'U', 'J', 0x1970, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('D', 'E', 'L', 0x7fce, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('A', 'U', 'S', 0xc102, EDID_QUIRK_NON_DESKTOP),
 
 	/* Sony PlayStation VR Headset */
-	EDID_QUIRK("SNY", 0x0704, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('S', 'N', 'Y', 0x0704, EDID_QUIRK_NON_DESKTOP),
 
 	/* Sensics VR Headsets */
-	EDID_QUIRK("SEN", 0x1019, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('S', 'E', 'N', 0x1019, EDID_QUIRK_NON_DESKTOP),
 
 	/* OSVR HDK and HDK2 VR Headsets */
-	EDID_QUIRK("SVR", 0x1019, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
 };
 
 /*
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 4c37c4f6d26c..fc03046de134 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1745,10 +1745,11 @@ static const struct panel_delay delay_200_500_e50 = {
 	.enable = 50,
 };
 
-#define EDP_PANEL_ENTRY(vend, product_id, _delay, _name) \
+#define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.name = _name, \
-	.panel_id = drm_edid_encode_panel_id(vend, product_id), \
+	.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
+					     product_id), \
 	.delay = _delay \
 }
 
@@ -1760,19 +1761,19 @@ static const struct panel_delay delay_200_500_e50 = {
  * Sort first by vendor, then by product ID.
  */
 static const struct edp_panel_entry edp_panels[] = {
-	EDP_PANEL_ENTRY("AUO", 0x405c, &auo_b116xak01.delay, "B116XAK01"),
-	EDP_PANEL_ENTRY("AUO", 0x615c, &delay_200_500_e50, "B116XAN06.1"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 
-	EDP_PANEL_ENTRY("BOE", 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
-	EDP_PANEL_ENTRY("BOE", 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
-	EDP_PANEL_ENTRY("BOE", 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
-	EDP_PANEL_ENTRY("BOE", 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
 
-	EDP_PANEL_ENTRY("CMN", 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 
-	EDP_PANEL_ENTRY("KDB", 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
+	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
 
-	EDP_PANEL_ENTRY("SHP", 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
 
 	{ /* sentinal */ }
 };
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index ccc80cb7f86a..4d17cd04fff7 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -510,21 +510,23 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
 
 /**
  * drm_edid_encode_panel_id - Encode an ID for matching against drm_edid_get_panel_id()
- * @vend: 3-character vendor string
+ * @vend_chr_0: First character of the vendor string.
+ * @vend_chr_2: Second character of the vendor string.
+ * @vend_chr_3: Third character of the vendor string.
  * @product_id: The 16-bit product ID.
  *
  * This is a macro so that it can be calculated at compile time and used
  * as an initializer.
  *
  * For instance:
- *   drm_edid_encode_panel_id("BOE", 0x2d08) => 0x09e52d08
+ *   drm_edid_encode_panel_id('B', 'O', 'E', 0x2d08) => 0x09e52d08
  *
  * Return: a 32-bit ID per panel.
  */
-#define drm_edid_encode_panel_id(vend, product_id) \
-	((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \
-	 (((u32)((vend)[1]) - '@') & 0x1f) << 21 | \
-	 (((u32)((vend)[2]) - '@') & 0x1f) << 16 | \
+#define drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, product_id) \
+	((((u32)(vend_chr_0) - '@') & 0x1f) << 26 | \
+	 (((u32)(vend_chr_1) - '@') & 0x1f) << 21 | \
+	 (((u32)(vend_chr_2) - '@') & 0x1f) << 16 | \
 	 ((product_id) & 0xffff))
 
 /**
-- 
2.33.0.685.g46640cef36-goog

