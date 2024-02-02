Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE58464DA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 01:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD88810E892;
	Fri,  2 Feb 2024 00:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XgFSjzuI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBEC10E892
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 00:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706832376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWeEpOjnd5XR5GA8djVQgJirmJEiUeSVgCsgc4wxAGk=;
 b=XgFSjzuIn8/rKq8KdPmd5312FAhZ80ix9tYvKrbIfR8tvI23pXjfVPRmop2/JfchyzNhKR
 i6UdQX0SIlXPl9xMwlACrPmL7THB6ts6xi10euW0l5wOOQC6P+I8JKpEUN26H+wSqwpXfP
 HypER/o2zl/GnAOORWz3defAfgk5nnA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-L_lPIp_bOYilp3mJyioVwA-1; Thu, 01 Feb 2024 19:06:14 -0500
X-MC-Unique: L_lPIp_bOYilp3mJyioVwA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a31ffe314c5so74568766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Feb 2024 16:06:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706832373; x=1707437173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWeEpOjnd5XR5GA8djVQgJirmJEiUeSVgCsgc4wxAGk=;
 b=M5uegqdPx0fisgFU+bGquWp2lT3uERi43GUV0qBoofrXpoTrSUgj5S1T0DzZTJcUAz
 iPTVeI3yggYdlC/Xqzer1X7DcZIatxuClW6OP0kqJZkUIPh0qAaahtfyc4WG7Y95N8aQ
 eGzvhfZEKvI3XLYfrmrMMPwxog25iL+w5xryerdlk2gPkkFKOJKeCVWsDvUfY5ZG2uci
 k9W7psTi2M7X5LrW4YedHQr7ernE9Vwrm4gUllr7P4CxYeXlaW6ThfCtksd6KgR+uEts
 CMRuajZWYISAvcRV38gHBtTO7smNU8ebYGpCFLRIGxB9ZVMNRra7nro4dTH7q1k/CvVe
 WpSw==
X-Gm-Message-State: AOJu0YyccS5VeOq/wZjWtBF3OhJxwWa5y+BeHKZ7TPNszc/0PMJAOkw1
 iDC4SHd1k8mLF40XMmOUklK+UcuG6hGlgx8N/TOMnBxx63QOVuj7qnhfdL/ToYnFtPRcBtP2DfP
 GVd9KLXAWs53L2AJZn7U+6sAkgVuVfSDMEwPPxRCvQVY/eYF46hjyuhzHP18UKbm6/qkgDMYSmA
 ==
X-Received: by 2002:a17:907:6d23:b0:a35:d35e:1b04 with SMTP id
 sa35-20020a1709076d2300b00a35d35e1b04mr543886ejc.34.1706832373268; 
 Thu, 01 Feb 2024 16:06:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu3D/R3OvpVaQZRhAAgcMc6mpfFjKLIsb7SB4KrNzJoPBw3KqVlhmfy5q24YLP83Pl/uH9mw==
X-Received: by 2002:a17:907:6d23:b0:a35:d35e:1b04 with SMTP id
 sa35-20020a1709076d2300b00a35d35e1b04mr543876ejc.34.1706832372995; 
 Thu, 01 Feb 2024 16:06:12 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWF6xaps3yxj+lk07FJ/E/SdbqRKOLq/tgIVqzROs0+q8lFxqw96xYur6f3X+tXEkeC7KpFtPSLPJjCtJnhRm/9XF9wjnFvibhAlsKUL67KDu+BG60N/h+COAa8/gH1LqJPHpeg0eXiVL4aYlbNF5vl0htEIZC5ND9IYll42q8XlMnhCXJ33E/NgLMMNKgwetACKxRrddokbDY=
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ld4-20020a1709079c0400b00a3634a461f9sm280359ejc.109.2024.02.01.16.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 16:06:12 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Cc: lyude@redhat.com, kherbst@redhat.com, airlied@gmail.com, ttabi@nvidia.com,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 2/2] drm/nouveau: omit to create schedulers using the legacy
 uAPI
Date: Fri,  2 Feb 2024 01:05:51 +0100
Message-ID: <20240202000606.3526-2-dakr@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202000606.3526-1-dakr@redhat.com>
References: <20240202000606.3526-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Omit to create scheduler instances when using the legacy uAPI. When
using the legacy NOUVEAU_GEM_PUSHBUF ioctl no scheduler instance is
required, hence omit creating scheduler instances in
nouveau_abi16_ioctl_channel_alloc().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index ca4b5ab3e59e..d1bb8151a1df 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -339,10 +339,16 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (ret)
 		goto done;
 
-	ret = nouveau_sched_create(&chan->sched, drm, drm->sched_wq,
-				   chan->chan->dma.ib_max);
-	if (ret)
-		goto done;
+	/* If we're not using the VM_BIND uAPI, we don't need a scheduler.
+	 *
+	 * The client lock is already acquired by nouveau_abi16_get().
+	 */
+	if (nouveau_cli_uvmm(cli)) {
+		ret = nouveau_sched_create(&chan->sched, drm, drm->sched_wq,
+					   chan->chan->dma.ib_max);
+		if (ret)
+			goto done;
+	}
 
 	init->channel = chan->chan->chid;
 
-- 
2.43.0

