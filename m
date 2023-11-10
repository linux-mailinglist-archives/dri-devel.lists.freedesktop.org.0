Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943797E8373
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC21A10E25C;
	Fri, 10 Nov 2023 20:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C4110E247
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:08:47 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-daa2684f67eso1952211276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699646927; x=1700251727;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IAkJ89LUqtxG0K+MSJnco+XQD27u+TKLaVoOcPh4bOc=;
 b=EL6Qpr9y33R3ArrggROnIHaKG/JUQatULnKQ2yvNLwocjjt3z+VTUnPS2qCJN4haSY
 gU3bB9pwyxl1O8VSswZkffyNGo6vA33nM0iRTik4A3MpuNU6QPxYyP1N51easiblsm2W
 J5nW5OMbAE67ZkjhtvPrKoS92SfuDHizVr72YOem+VGneDlokEjNF6dESG/aqIKZRCyP
 0xiPP+fNvPc3JeR/ZhxvecVyLDs/ee3U6/rTlmdFVR2kaxyWzeUiBKbjC9E6solan7+n
 U+aItmJ+r2pSm2mk6gAv+eiuUbzWSddDBc77nI/xFEut9/uPRzApWPpiBaaI2iKwCvS4
 vYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699646927; x=1700251727;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IAkJ89LUqtxG0K+MSJnco+XQD27u+TKLaVoOcPh4bOc=;
 b=hAmRJZy38txXyfx/dxBMp0JMExyRaQJ4TQ+j0ESzQeiqeam125IxrKDwXahaVlvKGk
 p0QPdS665UF28FgPHM+QJbq2dyoeal+QlwJBXKUsvmt7ln7R5Pv4T8+wTP4DaUkONmkE
 rl9A9mDKHI21s2DosawksBaPXv40CB81+EXe836TA+uZhcb5qRUn+BHIdHCGr/eIfEK9
 29E5KiZzto4RPw0y+AbWIsxGCKkjO4swsPV7BZJmcNqvKHWV/d5TJ086NajZwl9p8k8P
 NHYA7G9gXQoS3bM0Wio4DxIZkvNnhbJkeD1ASyaYQynR+BgDta2Z08x4HU9ZaqMoUAHJ
 tcuw==
X-Gm-Message-State: AOJu0YylHgqZ7NNuIafKpCf9oDpjDM2f/zqFsXTqQNwE9aWnfEzc0dUc
 ThfVC1D5wopcoRAsx6ppg7GbrcMJIhIx/w==
X-Google-Smtp-Source: AGHT+IG2qICxw/Ih6W1d00Yw7wl6gZh00iMH2vxhyvW4HtVTUR9T6SIeeV3AzuFmY7j3gx/bERyrecNPMvP5+g==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:18d:b0:d89:42d7:e72d with SMTP
 id t13-20020a056902018d00b00d8942d7e72dmr141489ybh.3.1699646927074; Fri, 10
 Nov 2023 12:08:47 -0800 (PST)
Date: Sat, 11 Nov 2023 04:08:28 +0800
In-Reply-To: <20231110200830.1832556-1-davidgow@google.com>
Mime-Version: 1.0
References: <20231110200830.1832556-1-davidgow@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231110200830.1832556-3-davidgow@google.com>
Subject: [PATCH 3/3] drm/vc4: tests: Use KUNIT_DEFINE_ACTION_WRAPPER
From: David Gow <davidgow@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>,
 dlatypov@google.com, 
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
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
Cc: linux-kselftest@vger.kernel.org, David Gow <davidgow@google.com>,
 Emma Anholt <emma@anholt.net>, Benjamin Berg <benjamin.berg@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-hardening@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to pass functions to kunit_add_action(), they need to be of the
kunit_action_t type. While casting the function pointer can work, it
will break control-flow integrity.

vc4_mock already defines such a wrapper for drm_dev_unregister(), but it
involves less boilerplate to use the new macro, so replace the manual
implementation.

Signed-off-by: David Gow <davidgow@google.com>
---

This patch should be a no-op, just moving to use a standard macro to
implement these wrappers rather than hand-coding them.

Let me know if you'd prefer to take these in separately via the drm
trees, or if you're okay with having this whole series go via
kselftest/kunit.

Cheers,
-- David

---
 drivers/gpu/drm/vc4/tests/vc4_mock.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index 63ca46f4cb35..becb3dbaa548 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -153,12 +153,9 @@ static int __build_mock(struct kunit *test, struct drm_device *drm,
 	return 0;
 }
 
-static void kunit_action_drm_dev_unregister(void *ptr)
-{
-	struct drm_device *drm = ptr;
-
-	drm_dev_unregister(drm);
-}
+KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_drm_dev_unregister,
+			    drm_dev_unregister,
+			    struct drm_device *);
 
 static struct vc4_dev *__mock_device(struct kunit *test, bool is_vc5)
 {
-- 
2.42.0.869.gea05f2083d-goog

