Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0897E513B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 08:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E5A10E70E;
	Wed,  8 Nov 2023 07:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAAC10E70C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 07:40:27 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso10956266a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699429225; x=1700034025; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wqb/Bv6eFY0SfyqqO+nQ1BCDEH1GYhSIKxO8FXfbD68=;
 b=TA/rsNXCy/Brug1GgDUtsUKv87fiaMJHs9YyXmWQMESMiBveD6CkWll1Hv9ilkmlcd
 HnKYOO1L0LCYPhpUG9K5Saq0iBUlh5On1QLWcbDEMrf8gQlulHZiRDIcosvip7R7/bd6
 /UZGEsHrRbbUK4J1/NwwejaWx9u6t2mEdOrT/KOTZeRu8lfrGh5fegOZ+PrWqFwLPbMN
 5R7rcF4bkMxe00IoafyENGIh88pAsdRW+WcDGVvIQuiFD6jgsdPArZJeHL8RRd22/fEJ
 gfMAfvRdo5c4w2rOvszmZx90lRTSZjxfcwIqk8wl3iBFDVuTJNFpyg0zRVUnGDfSkd9o
 Dn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699429225; x=1700034025;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wqb/Bv6eFY0SfyqqO+nQ1BCDEH1GYhSIKxO8FXfbD68=;
 b=HnhHa7pGqOvDGzvDZas47oRgTeRuoaQKO9AGbxX2Ao0gkEOFsbTeS4CNEWd/gSmv6l
 Hp16xTuZ8MwPYdTPFfcukrIdKs1S9uGh3IBj5oOfR+4sLUrAmCHpNHvDWdPuVatPEzwf
 2fFK2D1GeWQh292fHlvOtT5RcxEgIFfuME5ocUVxXzsGD3IIkRh/lYZiWxHecLeCtrBC
 ii514/lpMR008wUd/NpyM3+pZd2sO3yBigMS7URahasJaFaQ8viKZOhDMoErQgD5pTMg
 OqvMTUmNpwJHSyvZz+eSe6Nh1P2KLusOZbhwFUAeMnIp9qgPba96QzxbamrO5ewjGT6h
 TjDg==
X-Gm-Message-State: AOJu0YxTks7xxLCmvi07qbeCHLd/xwmDoUsf/4kOHbEnSq52ajadn9ao
 VCFTt4o6a65/ELqrN9b9B53Crw==
X-Google-Smtp-Source: AGHT+IGgCTJibXogk7f/4/pdPf+5XlJkJU4UH+dwwDJR8NpmONM63voWpi/OW1oA26bDGwpm+aZ6MQ==
X-Received: by 2002:a17:907:720c:b0:9e2:92b5:f234 with SMTP id
 dr12-20020a170907720c00b009e292b5f234mr729929ejc.39.1699429225572; 
 Tue, 07 Nov 2023 23:40:25 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 a27-20020a1709063a5b00b009c6a4a5ac80sm586737ejf.169.2023.11.07.23.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 23:40:24 -0800 (PST)
Date: Wed, 8 Nov 2023 10:40:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>
Subject: [PATCH] nouveau/gsp/r535: Fix a NULL vs error pointer bug
Message-ID: <f71996d9-d1cb-45ea-a4b2-2dfc21312d8c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The r535_gsp_cmdq_get() function returns error pointers but this code
checks for NULL.  Also we need to propagate the error pointer back to
the callers in r535_gsp_rpc_get().  Returning NULL will lead to a NULL
pointer dereference.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index e31f9641114b..f8409e2f9fef 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -689,8 +689,8 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 	struct nvfw_gsp_rpc *rpc;
 
 	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + argc, sizeof(u64)));
-	if (!rpc)
-		return NULL;
+	if (IS_ERR(rpc))
+		return ERR_CAST(rpc);
 
 	rpc->header_version = 0x03000000;
 	rpc->signature = ('C' << 24) | ('P' << 16) | ('R' << 8) | 'V';
-- 
2.39.2

