Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39985B91E4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B634A10E1D7;
	Thu, 15 Sep 2022 00:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8412610E1D7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 00:46:06 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id
 x13-20020a170902ec8d00b00177f0fa642cso11483497plg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 17:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=o0TKZg1V+iwVMAhcvK219IOXYb7az/U83DvEghII4Dw=;
 b=ixIlbiWjYVB7lleKcOS25U/195trOCFFYYTNY2ArRn6K/NXN4jKkbx8xqVv40XOYwc
 gzOAoHFIZ5nYNTfyaobW0eR/pRWG25686m9JNJWBrr+6XN1RIF81EpUMZ2WjcMFCwhSm
 8Gb5q+USrZHuvbc4jRv89+/+mSkgNgiHosn5pQFsAnbd1C2Dv7ogkJvH1mC5lGrL+dPr
 bnDcostykRNUl2cropFFiaYmIcz4a5CirfMwmfwgNqHM/EqMlJz/pmNv4Ugl2f1MNawE
 jIGBZhIlX4HrU621pf9P/4CGXhHLBZxK7w0Dp2p+dDVn1hB+Jl5575zzcLF/aRyRy4zu
 UhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=o0TKZg1V+iwVMAhcvK219IOXYb7az/U83DvEghII4Dw=;
 b=kaW6Q08iyeLSbumaaAtDCzQaj5wkztc6LHUGlDlfnBEfrqDH20E0ho6sHzdLxJKUMt
 0IQfPQsRZ4Hrk3ad8rhHg6Dshx6hph2MvuX5v16ov+BVgLeotcLR9TW/ssfO9a1zLw2n
 Kc99pxERx3W375BfDESrut6a/X8Ab2Q4l+RKYlnOTY1JLIaCoF6YHeXmi7o/IFOoCO3y
 lvFIHVangg4tC0uYTXFMiWFunaom4SKzJ0fgmLFqv0FehbH/ks8r5NU1BSRpJhcAjXXz
 NIHDZDHuppHCbQr/sYTs8iFB8QWclwp0lQtLnyTl3zA/ZcRTWK3z3vMITYXDlQ27XJfh
 c0kg==
X-Gm-Message-State: ACrzQf0iCm3yMY/pdj3+9D88g6Sgo8/UVe0qKp6rsIwr5bIJ/gdQk0Ou
 ZSai0q/g/eJ1XVUchWzIeZ6KZ9Nq0moTUvU=
X-Google-Smtp-Source: AMsMyM7cpjC0UvYeAkGaQWcCbIFCVaxS58PZrp3VQQ5nzbzNbiesGmVdHmcPLBDxn84TmNTXrfnoS9iOMdHYeok=
X-Received: from pceballos.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:128c])
 (user=pceballos job=sendgmr) by 2002:a17:90a:5aa2:b0:200:30aa:c773 with SMTP
 id n31-20020a17090a5aa200b0020030aac773mr7466200pji.182.1663202766080; Wed,
 14 Sep 2022 17:46:06 -0700 (PDT)
Date: Thu, 15 Sep 2022 00:46:01 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220915004601.320198-1-pceballos@google.com>
Subject: [PATCH] drm/i915/display/lspcon: Increase LSPCON mode settle timeout
From: Pablo Ceballos <pceballos@google.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Pablo Ceballos <pceballos@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some devices the Parade PS175 takes more than 400ms to settle in PCON
mode.

Signed-off-by: Pablo Ceballos <pceballos@google.com>
---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index 15d59de8810e..b4cbade13ee5 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -166,7 +166,7 @@ static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
 	drm_dbg_kms(&i915->drm, "Waiting for LSPCON mode %s to settle\n",
 		    lspcon_mode_name(mode));
 
-	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode, 400);
+	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode, 800);
 	if (current_mode != mode)
 		drm_err(&i915->drm, "LSPCON mode hasn't settled\n");
 
-- 
2.37.2.789.g6183377224-goog

