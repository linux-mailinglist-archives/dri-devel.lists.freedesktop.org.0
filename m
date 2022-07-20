Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A9757BA7E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCAC8F5E6;
	Wed, 20 Jul 2022 15:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095DF8F49E;
 Wed, 20 Jul 2022 15:33:38 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id z132so14582445iof.0;
 Wed, 20 Jul 2022 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4h3uY9TThXC1PV4gG3mzVW2/VJmh8sYmlsiKmbk1ueg=;
 b=ktqzcnAaa9mi3wGJuwlnwnZPNB5z2eRFFeUD1QBZ5Wf/9/s/dVMsmMVoKbtz2faQcA
 x5HW9DUdsRn6VNBBsZb10kbvhfo01wsbMaJDb77NseTqPG5hQESBQzoY8/PQ3AYzdcMK
 CoeQjEj+R6O10X9Go5Fp+Ak4Hf7b3hOJYSfDJJUOXqk/pUptJqjBUwUN/wkpCxHW76tg
 VNMKdNK9s1FBzcjfVgrup7gpRBDNbjQBCQIO0/rxorFmTpEaDPAmkC0Gft9cZJEoXC0s
 +p9EpM5lnTzTcEEojcjs2+OccwmeQn8eayFWVxf2X5LtzXyH/ftcQg3gvocYwxYJmFE1
 lxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4h3uY9TThXC1PV4gG3mzVW2/VJmh8sYmlsiKmbk1ueg=;
 b=24609kb0HuILncj7WW5NkMWXmqmpEN1CmV25HL71MlgTwhsNUmUiiuPUriPPn3LnAy
 sb8M6bxhjglbgLrfWDWUAn5F9EmHnjzO4ktZSy2WmOybGj/L49JQGubNWEET3zq3ARd5
 Oz0S0LrDV0eAtUJ8V3qb06C9bqHngxk5F77PwrpV+DBeblwkoDoiHi5w2qx1DAexXo2c
 hN90A9QjNSBPsLyVm3joB1dfHSA8/ZpbzsqsEBmdwpyDKwYqAnZ/C9SWdZ7m7AvpKXA3
 B4SYuQhMqXp/M73p1C9dS09jjVuTqn1eWzISCTTXkGenpFt2u5O5PCRGjFEpm3WmSbM1
 uuEQ==
X-Gm-Message-State: AJIora9B2CBsVD/lve2vy9bTDY3ky02NOzCHumRAg7QDqVIv747YvPlO
 NurHP5bHMdYUZbFzDoWeZuLPIaXg+erQYw==
X-Google-Smtp-Source: AGRyM1t73bbdkUWk1IQy2dUY49UX1qKkX1blAVJHG7u56STZBUG/ej401qC/q+c2hp3BRXRmLaDYqA==
X-Received: by 2002:a05:6638:2410:b0:33f:8518:659b with SMTP id
 z16-20020a056638241000b0033f8518659bmr19054477jat.253.1658331217599; 
 Wed, 20 Jul 2022 08:33:37 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 38/41] nouveau-dyndbg: alter DEBUG, TRACE,
 SPAM levels to use dyndbg
Date: Wed, 20 Jul 2022 09:32:30 -0600
Message-Id: <20220720153233.144129-39-jim.cromie@gmail.com>
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

clone the nvkm_printk,_,__ macro ladder into nvkm_drmdbg,_,__.
And alter debug, trace, spam macros to use the renamed ladder.

This *sets-up* to remove the _subdev->debug >= (l) condition from the
__ macro, once the bitmap-param is wired up correctly (pointing at the
right state-bit-vector), and figured into dyndbg's jump-label
enablement.

Also, with DYNDBG=y, sites will be off, until enabled by >control, or
by #define DEBUG at compile time.

Starting with this as a model:

    static struct ddebug_classes_bitmap_param drm_trace_bitmap = {
	.bits = &__drm_trace,
	.flags = "T",
	.map = &drm_trace_classes,
    };
    module_param_cb(tracecats, &param_ops_dyndbg_classes, &drm_trace_bitmap,..

We basically need to clone that, but ref a different .bits:
	.bits = &_subdev->debug,
	while respecting the _subdev's lifecycle.
	hints welcomed.

no functional changes. (other than dyndbg's default-off)

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
index 065d07ccea87..b9c2afab321f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -59,9 +59,17 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
 #define nvkm_error(s,f,a...) nvkm_printk((s), ERROR,    err, f, ##a)
 #define nvkm_warn(s,f,a...)  nvkm_printk((s),  WARN, notice, f, ##a)
 #define nvkm_info(s,f,a...)  nvkm_printk((s),  INFO,   info, f, ##a)
-#define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,    dbg, f, ##a)
-#define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,    dbg, f, ##a)
-#define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
+
+#define nvkm_drmdbg__(s,l,p,f,a...) do {				\
+	const struct nvkm_subdev *_subdev = (s);			\
+	if (CONFIG_NOUVEAU_DEBUG >= (l) && _subdev->debug >= (l))	\
+		dev_dbg(_subdev->device->dev, "%s: "f, _subdev->name, ##a); \
+} while(0)
+#define nvkm_drmdbg_(s,l,f,a...) nvkm_drmdbg__((s), NV_DBG_##l, dbg, f, ##a)
+#define nvkm_debug(s,f,a...) nvkm_drmdbg_((s), DEBUG, f, ##a)
+#define nvkm_trace(s,f,a...) nvkm_drmdbg_((s), TRACE, f, ##a)
+#define nvkm_spam(s,f,a...)  nvkm_drmdbg_((s),  SPAM, f, ##a)
 
 #define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR, err_ratelimited, f, ##a)
+
 #endif
-- 
2.36.1

