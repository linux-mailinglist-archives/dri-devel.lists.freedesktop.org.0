Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC437577BD0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1A9A9E3C;
	Mon, 18 Jul 2022 06:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D78A9D99;
 Mon, 18 Jul 2022 06:39:30 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id d4so5550328ilc.8;
 Sun, 17 Jul 2022 23:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H1xuCGeY8Sir917dDYr7SPlwJzEye6l0obwn9tK3MZ8=;
 b=I5mQXve6DLZL5MXFW1wEwbkcB4buLA3ilZozWw9NRVyr7gUGvPtBNfntmTp37RtYmf
 cLpiFeuOM7otD4mRdN97dc40WOjcwWdUAxA853jZBvJnyWBAp2fYxmZLkHsxwfDohMmY
 7v3uUKJGuhHTcw3DVYXotysxWZj0UcJlDYAu/ZjfVE52fceQ77X7FcYkrREZCOqaV8B6
 tBcDoEhuhI/TttSLtsfavc5K8XFPTfOvns12kjJYXy9Kv81UCKkIuCPPbrQ96tAID3Ur
 AwuqLBkDX7s9jis9DMAbnjq2HJwsFJIBWZqjMYDfyjdOwKf7DsbDZgVxy5ukSjhlWSaI
 Z47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1xuCGeY8Sir917dDYr7SPlwJzEye6l0obwn9tK3MZ8=;
 b=XghWG23x7Uu+7gW6pNIVn8xbql12TqHK75tOcII3JUi9U9rdFbf5nvpN9eTuRO7rMK
 QGIgTnS4n+uJOkJbhh5QowbWhYKubKLVZ38zmkoWf1CuFFxJZkBwar3aDuTy/66Qtpn5
 t1ZdW2A8a17+EggTZy1nBl53PgVe/GWMkvYxQBJWWqtmTUrMATOzPBJGcR8X0aZHFi9o
 vuGZ/Jsx+spNQBANTqN6LsssOEgc3R/8p22B0aPUETMW1MxxifYJlxeQGbniJSIAMY3i
 R7hdKWkS+N+TEK0j10P5uOIThZv2lalTe6z953+0Ir51Fqni1cvT0TggOuo9brUgd2yR
 H0Gg==
X-Gm-Message-State: AJIora9nxrUztgd4rNWFNK1jQG1ZA+iFWEQ8hvYjd4RB97wUWHmm0NZV
 zUBlmuVYrVLwZWXYQFjGWLfc4jnoYI0=
X-Google-Smtp-Source: AGRyM1tPvqJvcd2mEyY29eIkNWUdTXU4pzYiAn9mpxHZb9KiNf1F0tRSINUD1nfY5Td0oLpzcJFGOw==
X-Received: by 2002:a92:c549:0:b0:2dc:949f:5514 with SMTP id
 a9-20020a92c549000000b002dc949f5514mr12401125ilj.301.1658126370443; 
 Sun, 17 Jul 2022 23:39:30 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 40/41] nouveau-dbg: fixup lost prdbgs
Date: Mon, 18 Jul 2022 00:36:40 -0600
Message-Id: <20220718063641.9179-57-jim.cromie@gmail.com>
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

