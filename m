Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63036773526
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 01:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B3C10E09E;
	Mon,  7 Aug 2023 23:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1710E05D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 23:42:23 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6bd046bfcf3so147789a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 16:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1691451742; x=1692056542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=exahAx3UtC771XJQhTOePU8WzrM/7XKaoMPzCG324YI=;
 b=umVNIck24tWPX4rQUWK2ii4ddmmztjputJwk7JJaFK3oBno9GBDWFisBiwz+hd04Nf
 sjNzrqcIXHhEQHDpYHP6RUEcGB6TPPSD6c+89X4AFSkM+XMD+sps+TY9uhxL6zJ27GWu
 tCZCubKQkTn3cGIITLBjW4Qaw8fXMk7JjqahfX9alDlf7mGi+Tfiz0dPI+zwGkhKm/0n
 InioUGV/FwmIRbARhTWYFYe+jcMZ2HdZAswzlFei4EdwmgpVIwUEWWqqnIKa5kq/pG09
 9h7kDmWSGjom4GQj8l2FAR2cJvtNZQunY2oMHDR0ulX01eNmGJVjV7+OKA/Ore0GLELO
 qu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691451742; x=1692056542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=exahAx3UtC771XJQhTOePU8WzrM/7XKaoMPzCG324YI=;
 b=Mp+oHek6LuDZJjahY0RzBoUT3E+Zgo1Ag0UiVNbsBC9EX2dj3VE6+rFxi3ohMiYX21
 /TJFOMG2O78uSxoW0Px4EetPSKJeq7A/caESO59UENJOQNy4oLA7bViFtsboYc8d4/KO
 I8gJccu6xhB1BeX1tf97p6A3T16KpGMZoAwHmj01GmK9jsOnUr4hcBq5s8AK1eq5CjTG
 i38lrk/FJtUCViIVhZNv4twZkCB0EftdQm+/1fMQRCj6sRLQlkz8UdmWZA7xKik5/mG8
 FxxNqQiFs5INGY4+v6KJxcFbYLVxamYb8lCtr9Xf7XwQZv01DWRJjbDKmbxEeoDaKFRO
 SLzA==
X-Gm-Message-State: AOJu0YymJ6Y7mNOKx2jT1B7Ye1d7saU38HPyzh+nKlndWEqQbQTT94My
 MNw8p4Eq2kElpfl2QMdMzP2aaouM5lWTJ0S00JE=
X-Google-Smtp-Source: AGHT+IH6yfqEDWnRq9wlcyEXdE7yhU7H+ouWNNYNdDBVq7M4C9kmpe74YKaKFNYshrLjYK+CUXVBKA==
X-Received: by 2002:a9d:6841:0:b0:6b9:70c9:e1c8 with SMTP id
 c1-20020a9d6841000000b006b970c9e1c8mr11228624oto.5.1691451741884; 
 Mon, 07 Aug 2023 16:42:21 -0700 (PDT)
Received: from animal.lan
 (2603-8080-2102-63d7-03c5-0c53-819a-b1f0.res6.spectrum.com.
 [2603:8080:2102:63d7:3c5:c53:819a:b1f0])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a0568301e7400b006b8e8884f2fsm5309070otr.51.2023.08.07.16.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:42:20 -0700 (PDT)
From: Faith Ekstrand <faith@gfxstrand.net>
X-Google-Original-From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/sched: Don't pass user flags to
 drm_syncobj_find_fence()
Date: Mon,  7 Aug 2023 18:41:44 -0500
Message-ID: <20230807234210.175968-1-faith.ekstrand@collabora.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Dave Airlie <airlied@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flags field in drm_syncobj_find_fence() takes SYNCOBJ_WAIT flags
from the syncobj UAPI whereas sync->flags is from the nouveau UAPI. What
we actually want is 0 flags which tells it to just try to find the
fence and then return without waiting.

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index b3b59fbec291..3424a1bf6af3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -142,7 +142,7 @@ sync_find_fence(struct nouveau_job *job,
 
 	ret = drm_syncobj_find_fence(job->file_priv,
 				     sync->handle, point,
-				     sync->flags, fence);
+				     0 /* flags */, fence);
 	if (ret)
 		return ret;
 
-- 
2.41.0

