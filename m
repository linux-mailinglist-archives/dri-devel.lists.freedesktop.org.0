Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E557BA71
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3828F49E;
	Wed, 20 Jul 2022 15:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE0A8F4EC;
 Wed, 20 Jul 2022 15:33:40 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id u20so14552361iob.8;
 Wed, 20 Jul 2022 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H1xuCGeY8Sir917dDYr7SPlwJzEye6l0obwn9tK3MZ8=;
 b=AphFbxHA/POkgQ/in/xVsl+sXruxFE+iod39lwrIO07RGuyMNj4FcUirExOcEsPU2D
 O2B6KKqqeXMOcR1N8YHPXBodnxKs048fx+bKS26JilfqpGSIuMcZqcXAHLOoYOnasSMR
 4vOveuqhDuM8mneUJbQft+CSGSmVV+Q5HPHnY6Azo3uMLAuYn3BuqBCMMjw7jbZlSmJD
 zdbOTEcCEGBLOfDbfZjwwV780ixbuKJ4YezOMQ8wT72IqYZqtEDpPU7SDTxHm2LNecfO
 0eLFoYFwAeluhFRPD8mq+nyqiDAHCaygzhOxZcPbRHD6A2dgbcx7n9Kif3Ri07rwdsNj
 Fe7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1xuCGeY8Sir917dDYr7SPlwJzEye6l0obwn9tK3MZ8=;
 b=d+39LZbRghuzSH4znkPzt2+/s3D7CBAVHJe28VDRk4ElyFQB7plccyd02t7qJkhbod
 Mxqsi9wY5z81KW2YJ8tx646aeSk6PPmih350+eXdb2i7PY9uSkQy4BZvM8kRE721owwh
 pCHyvPIck3LxT6YtGNYJqTqYNbj6OIyHNIq3FErUL+TP2FSbhJQxJ+Q9h54W/PmoMaWS
 aBHTf0Y5D0wQoROtHAi1G7XDB8nuBQeWIJeRRW34MzyEqhFwX1kXrHXdDaFgJC+ak+dd
 qNeUqwABQ1+eKjWeG+5mvxJAKS08fGKLfmOnI+Z+hhzEKn2b5HrSH5Mo61kFEnIg7JXM
 KYmw==
X-Gm-Message-State: AJIora9Wu/YEJAWf4LdavvkBsnJBb/tht49C7dNX/Ys4r7+gH2aJdnIk
 Fezh7skE171iIp6LOCv/E5KHwMMsF0EVJA==
X-Google-Smtp-Source: AGRyM1ujekS9Z83Nco8lVrnZi3IvcyNutF9W4sRrnTZ3egKAWjGkiHZz3e9WKb6VSpcWNRHsMLqpNQ==
X-Received: by 2002:a02:9384:0:b0:33f:4f23:f268 with SMTP id
 z4-20020a029384000000b0033f4f23f268mr19315045jah.213.1658331219656; 
 Wed, 20 Jul 2022 08:33:39 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 40/41] nouveau-dbg: fixup lost prdbgs
Date: Wed, 20 Jul 2022 09:32:32 -0600
Message-Id: <20220720153233.144129-41-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

Undo the 1-line change that reduced count of prdbgs from 632 to 119.

ie: s/NV_SUBDEV_DBG_##l/NV_DBG_##l/

So heres what happened: new symbol is 15 (or 10), and fails this macro
test, so gets compiled out, and the dev_dbg is excluded.

        if (CONFIG_NOUVEAU_DEBUG >= (l) && _subdev->debug >= (l))       \
                dev_dbg(_subdev->device->dev, "%s: "f, _subdev->name, ##a); \

I could hack this, by hardcoding in (l + #base), but base is pretty
distant to just toss into the macro.  At least, the base-ref should be
a macro(&classmap) properly exposing it.

OTOH, the whole CONFIG_NOUVEAU_DEBUG check could be reworked; given
that trace is minumum recommended, theres not that many callsites
elided (SPAM only iirc) at compile-time, and dyndbg means keeping them
has "zero" run=cost (and 56 bytes per).  So this config item doesnt do
much when DRM_USE_DYNAMIC_DEBUG=y.

So this is a useful place to stop and take another look around, try to
guess which trail to take..

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
index bf9c69f4fc3e..d5f6ca05d5fa 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -66,7 +66,7 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
 	if (CONFIG_NOUVEAU_DEBUG >= (l) && _subdev->debug >= (l))	\
 		dev_dbg(_subdev->device->dev, "%s: "f, _subdev->name, ##a); \
 } while(0)
-#define nvkm_drmdbg_(s,l,f,a...) nvkm_drmdbg__((s), NV_SUBDEV_DBG_##l, dbg, f, ##a)
+#define nvkm_drmdbg_(s,l,f,a...) nvkm_drmdbg__((s), NV_DBG_##l, dbg, f, ##a)
 #define nvkm_debug(s,f,a...) nvkm_drmdbg_((s), DEBUG, f, ##a)
 #define nvkm_trace(s,f,a...) nvkm_drmdbg_((s), TRACE, f, ##a)
 #define nvkm_spam(s,f,a...)  nvkm_drmdbg_((s),  SPAM, f, ##a)
-- 
2.36.1

