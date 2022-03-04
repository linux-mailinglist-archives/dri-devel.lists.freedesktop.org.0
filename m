Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDA04CDDC9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 21:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3041136E2;
	Fri,  4 Mar 2022 20:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22901136DE;
 Fri,  4 Mar 2022 20:21:09 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so2177527pjb.5; 
 Fri, 04 Mar 2022 12:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C/syT7Y2eY46OVXh3uLQ0pEOp4t9Olrz81IvOtIGubc=;
 b=pBy/DWvZZiL+PVlFab76MNRYthBkf+JTWT0dnBB/J3HJUFg4iD/+Yn5TktceeTcFIa
 rUlXjyCodpdMxp/d9oixBNacs/pdnoxKNEjh6wBDPRAmT19PSBevFgAp3INjyiookgfh
 MbpvsZW2XIzbwQLswzB2S973dM5KNgFodXbEwzDrWFasTU4PzgD8pK9G5Z698OtsiDVJ
 ymhTaqmCBEFrplXlUYM/3WhinFrbzz3JsH/nEamX+L8+Qcc5IGaxh9MnEtYxGwEyKmf3
 Axr6ltVJD8yozzNVIRtTbF1qohzE1uf0Jdi017er2CCS0uBVjYh1Z5YmyzTt4PU12YXg
 qifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C/syT7Y2eY46OVXh3uLQ0pEOp4t9Olrz81IvOtIGubc=;
 b=p4SjSDsUS2kS21COxcGNPVPx92V/aFPWDewSdKWn+2/l39FG9vUYyKfA0zfOCrl2Dh
 yO4SwZY8RsezHzqsbV/7C/+BUXkSFzA8RI8ycKIv2zXkbRu7OGw+H0eK2B4yP6mFK+tq
 rne55xkBolhaTNv7qXSTS2SVOsBPan7eXEtm3eNX71+3WlzknsmkueShpiksA2Uq7Kz7
 gopjNMe7ft2Txw6gn4GsasZZSrMaSMTRlKz7YSe9K7YEgIfNORV6pzVG7prLs+yviHa/
 sDbZgNoUM6IrYKheccPpaVLje8zDXoFhVva5EoZH6ehqiYB3834w7zXKEDwadqsTZNZO
 g5VA==
X-Gm-Message-State: AOAM5315JdyvWx2Zmm5Oht7aAnkUiHTlh5pfifDJOf2AAYZCvrxi8XfH
 apQ3xo843hh6GuGGfTo1V6NmdURnLGc=
X-Google-Smtp-Source: ABdhPJw0l7sG4pT7XOonU9d1+7+hi2g1s/G+O0WZFo9stDIm1EKxnhjv4E/nEpUN6639n1X7lB0o5Q==
X-Received: by 2002:a17:903:1c3:b0:151:a54b:95f4 with SMTP id
 e3-20020a17090301c300b00151a54b95f4mr110414plh.10.1646425268705; 
 Fri, 04 Mar 2022 12:21:08 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a63504f000000b0037425262293sm5051165pgl.43.2022.03.04.12.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:21:07 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix dirtyfb refcounting
Date: Fri,  4 Mar 2022 12:21:45 -0800
Message-Id: <20220304202146.845566-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

refcount_t complains about 0->1 transitions, which isn't *quite* what we
wanted.  So use dirtyfb==1 to mean that the fb is not connected to any
output that requires dirtyfb flushing, so that we can keep the underflow
and overflow checking.

Fixes: 9e4dde28e9cd ("drm/msm: Avoid dirtyfb stalls on video mode displays (v2)")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 96b379a08327..7137492fe78e 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -37,7 +37,7 @@ static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
 	/* If this fb is not used on any display requiring pixel data to be
 	 * flushed, then skip dirtyfb
 	 */
-	if (refcount_read(&msm_fb->dirtyfb) == 0)
+	if (refcount_read(&msm_fb->dirtyfb) == 1)
 		return 0;
 
 	return drm_atomic_helper_dirtyfb(fb, file_priv, flags, color,
@@ -221,6 +221,8 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 		goto fail;
 	}
 
+	refcount_set(&msm_fb->dirtyfb, 1);
+
 	drm_dbg_state(dev, "create: FB ID: %d (%p)", fb->base.id, fb);
 
 	return fb;
-- 
2.35.1

