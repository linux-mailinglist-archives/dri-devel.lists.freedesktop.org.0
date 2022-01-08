Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E954884C0
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 17:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAFD10EFF2;
	Sat,  8 Jan 2022 16:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C61310EFED
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jan 2022 16:58:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h10so7446866wrb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jan 2022 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BwgudjBV0Q9OuU6LjxXGZNHz2djTQPX0z94x7AWMsDs=;
 b=J7zpwWts951P7cyFXIO9rZFBy3Jb5BbE1wlNjj9t+NS+mkA59d/Mz5SwppBGR1Lw5J
 Xccku4xvzLCUOqaRCojDZK/fu+lRqAHRkE1s2vZFl9aMSkLlOJ+K4UmtLdUXbRKBtl/R
 R2ruWAmGnGf52ttJpG98KcES0Q2w9qoeVZXe+0iGSVpr5KqhakudbKhVvTZglPkNkOSY
 +iHChFEU0Xg9L5E9MV+sypvy5gBwTgd3MIeQad7f9cevtGycBZxdXQePvfOsSu9wGLvY
 ByDWVOi8DZ9zmZRwFYQYxcWPEwXioARQx07GkUJchmRi0qgzcTTPKqUR4GF8paGs8OdK
 kSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BwgudjBV0Q9OuU6LjxXGZNHz2djTQPX0z94x7AWMsDs=;
 b=xZI+C0uTuWrpWQAHwMJOjUPLcJQsggzsWVydaXfUb+4cRTYRkkxUattTJT60ugurBy
 puzOeit0XOp3rRO4p3Yo9P2RL+wPRs/yHs8DxV+RKuQewxAU/A2ZMLqFlZ46mZipjiDl
 JBhcZXyUE6X/fKbjUqOA+XIW2WkAyiEb1Kt7zhYuCIW6FPLyi6Z7hvHn2NO4R48MevDq
 HZjb16c4+cNS5BC54oQiGzyw0zzdHxoqH6GVvkfRf0QUcXJrnkMFiMfnMl+hf+ERFNaM
 HGmqwuEBXSSvgm6WwqkurP8DD5t5ETXAeBGEJVBUIvLy2Tmw4VSzxwBTrE8wBY3/rEoc
 c1Ug==
X-Gm-Message-State: AOAM533RplwPMnyDTB0KSbKJB3TbbhC+pAIG0tYNB0bNzG7dbsCEBQAc
 MQXvlf8TecOGJfH2DHAs1x8=
X-Google-Smtp-Source: ABdhPJwdNd7qRP1YLQiy8gs11DzHwPv1yjxGoy0OLq6yk4KX6pMbvSP854cGBp+9mxPevIN78My9+A==
X-Received: by 2002:a05:6000:156b:: with SMTP id
 11mr59243951wrz.261.1641661097073; 
 Sat, 08 Jan 2022 08:58:17 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id y8sm2219513wrd.10.2022.01.08.08.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 08:58:16 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: airlied@linux.ie
Subject: [PATCH v2] drm/selftests/test-drm_dp_mst_helper: Fix memory leak in
 sideband_msg_req_encode_decode
Date: Sat,  8 Jan 2022 17:58:12 +0100
Message-Id: <20220108165812.46797-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 lee.jones@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid leaking the "out" variable if it is not possible to allocate
the "txmsg" variable.

Fixes: 09234b88ef55 ("drm/selftests/test-drm_dp_mst_helper: Move 'sideband_msg_req_encode_decode' onto the heap")
Addresses-Coverity-ID: 1475685 ("Resource leak")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v2: Improve commit message
---
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
index 6b4759ed6bfd..c491429f1a02 100644
--- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
@@ -131,8 +131,10 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
 		return false;
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
-	if (!txmsg)
+	if (!txmsg) {
+		kfree(out);
 		return false;
+	}
 
 	drm_dp_encode_sideband_req(in, txmsg);
 	ret = drm_dp_decode_sideband_req(txmsg, out);
-- 
2.25.1

