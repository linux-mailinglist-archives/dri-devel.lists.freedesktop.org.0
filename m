Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB756577BD5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A21A9E61;
	Mon, 18 Jul 2022 06:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF2CA9D8F;
 Mon, 18 Jul 2022 06:39:25 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id c17so4570824ilq.5;
 Sun, 17 Jul 2022 23:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lEFIF5GoWE1UTRATT+4gA8bv8m3k9i8OgJ89ctlQDpw=;
 b=caEtY8053FszvRRdXfTLwLpw86fcWg1XIDwA/Fvw82dl7uRb8OcqEJj/Tx1ZOkpOCS
 iM8G7P0eOhymjLWssYzwfivJKlUeI7RECVqQG86KnYvafWVpBSOAxJCXN+TMNpRDgxxX
 JJKh8SaZza3hzHU0pFIc+PA019FiZK1H997uz2oPt7mexGCKFAGbMLXZr/0zz9GAjH/o
 9fHqEpyz90RaorNW1/srLnOpYHJclaEh3apFA0zIP0rHlwJUyxh629mEUBJ2NZBQcGrD
 p3zQncO729LarCPjUTQLwynr+0717ONoq+He6wARkQaXN6hsCqEkGK2DixPdtBAEW2ZP
 quLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lEFIF5GoWE1UTRATT+4gA8bv8m3k9i8OgJ89ctlQDpw=;
 b=0HkgRlk/lN7fwKYhEW0Q98UcAInek8x2ERe6NGSXS+7qhmS8nxrT6JVQgihKKwDthz
 Uhh7YJ6HpsyoLU7AFKqActJRN5685VtserhReEd5aeQKhidYJUhBh1BTYB0+UIRTnb3j
 KJLqK+98XV2A4vZ0SyGGhUMqHVXLE8eJO4ScEx5K9Dn+eRg51etJCbjbfxllRFAL/eoI
 V/7xTEzFan6NUoXaE9gnUURNMYmWIjgYLSFg3hF2Pyqkvy1tfadRzdNocSXGHevI0HfA
 WtEZSAP950NR8dGFwSCCDXleujiLXdAIWjoPimKqzYj2YathNRQj00ZUnFzjAsec8Km8
 axvA==
X-Gm-Message-State: AJIora+BAVV6JPq5MhaVHanOHuRX3cXafF51Q0ncFkrq6bCxBEwkCfnG
 FZ4XSM2mdBvSuKwEpQPUq5g=
X-Google-Smtp-Source: AGRyM1uwoAqZX87jb3BUEcFF9+GhiTdc5e4Kdqa+dfRXLPOq91Y7quGAlLMAbMQAXFpTcTMP+s4YFQ==
X-Received: by 2002:a92:c543:0:b0:2dc:ce60:6f57 with SMTP id
 a3-20020a92c543000000b002dcce606f57mr5025439ilj.288.1658126365060; 
 Sun, 17 Jul 2022 23:39:25 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 38/39] nouveau-dbg: fixup lost prdbgs
Date: Mon, 18 Jul 2022 00:36:36 -0600
Message-Id: <20220718063641.9179-53-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Undo the 1-line change that reduced count of prdbgs from 632 to 119.

ie: s/NV_SUBDEV_DBG_##l/NV_DBG_##l/

So heres what happened: new symbol is 15 (or 10), and fails this macro
test, so gets compiled out, and the dev_dbg is excluded.

        if (CONFIG_NOUVEAU_DEBUG >= (l) && _subdev->debug >= (l))       \
                dev_dbg(_subdev->device->dev, "%s: "f, _subdev->name, ##a); \

I could hack this, by doing (l + base), but base is pretty distant.

OTOH, the whole CONFIG_NOUVEAU_DEBUG check could be reworked; given
that trace is minumum recommended, theres not that many callsites
elided (SPAM only iirc) at compile-time, and dyndbg means keeping them
has "zero" run=cost (and 56 bytes per).  So this config item doesnt do
much when DRM_USE_DYNAMIC_DEBUG=y.

So this is a useful place to stop and look around, try to guess which
trail to take..

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

