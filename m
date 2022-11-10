Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B0362438A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AFB10E7BB;
	Thu, 10 Nov 2022 13:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0488D10E7B8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:47:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso4258383wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jYeie/ZZSPiqzVcmz3SigR7Giv2tjj7giPYVI0G/E7k=;
 b=ijXWAxem5lTKOYMl4Uihwu7Ix7IWDEene5SYiyg6yPx1m5qOEjycw2TplST+FxOVoa
 0qLOgswgxdTHYoz8hzDAwwCrg2T0NA8TFO1mbnKIks0areBtVKTQ4ZbCL879SX7uPBMt
 2ugCYEHFMlVfGQzlXQrRx/FuIBEE0uXjfST+CAksmVoqeKK0+yEKRaQwl+QKTpZG4821
 HQGlY8xAoApEAcaVo2LX72xPeI+Ew1pyB+UE/+CDGCBVehy9MRblM20LLxNpjoHl/SIL
 UhLN7l/82+5QjXxL5ZkO7OqGe4ra4SjbW7vA0TNDe6GonjHDTWOF8xlxw7SnpqAx5gyy
 mCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jYeie/ZZSPiqzVcmz3SigR7Giv2tjj7giPYVI0G/E7k=;
 b=qxdTQ02h2XVeZjHcNjeJR2f5WblVmYVqJJDEdf2A3eb2bEESLJmPpEArcjqVDdSSkF
 73GNYgX8yehP//aJs1PJ4DIHmO8dHldECu/DlsyhfRRAEryuvaQxH+xdEKND3eJDJQo3
 795jRb7YuqwcjU6VLezgVjmqxYcSfDQeO5cY3oJigw4pW4+Cg9Oq4xYA316FukX6dRXS
 FrJUY1tgun0mIRk+hMyWT2X2BQMNJeZJaDFUKbkWgCU8o28Q+7+MWcuypzhcylNnuQXO
 s+hSPL/dr6rGm9L8c63uWFUUU4XkYJRoiqEv3fTRYPXWux1y9Rf+YWZtyaxEUwdDv1/S
 xFNg==
X-Gm-Message-State: ACrzQf0OxaRKAl0Qm0yMxlxPaUkaPToQ538UIql+ukC2V6XZnNuqGWhR
 mEr48v0jriRN7DTuSuunGv8=
X-Google-Smtp-Source: AMsMyM5wZZolV5Ko0Lr4iFvKUS2cxb3BGICIu49AM+D2kZAEymvE0C9TZtyWklq/EpOgs/qY6rY6/w==
X-Received: by 2002:a05:600c:414b:b0:3cf:94a5:6564 with SMTP id
 h11-20020a05600c414b00b003cf94a56564mr23266536wmm.65.1668088077197; 
 Thu, 10 Nov 2022 05:47:57 -0800 (PST)
Received: from localhost.localdomain ([94.73.35.109])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d4302000000b0022ae0965a8asm15717060wrq.24.2022.11.10.05.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 05:47:56 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: mripard@kernel.org
Subject: [PATCH v2 0/2] drm/vc4: hdmi: Fix pointer dereference before check
Date: Thu, 10 Nov 2022 14:47:50 +0100
Message-Id: <20221110134752.238820-1-jose.exposito89@gmail.com>
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
Cc: emma@anholt.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v1 -> v2:

As suggested by Maxime, I simplified a bit vc4_hdmi_supports_scrambling()
making it receive a struct vc4_hdmi as argument instead of a struct
drm_encoder.

Also, variables are initialized close to where they are used in the
second patch.

José Expósito (2):
  drm/vc4: hdmi: Pass vc4_hdmi to vc4_hdmi_supports_scrambling()
  drm/vc4: hdmi: Fix pointer dereference before check

 drivers/gpu/drm/vc4/vc4_hdmi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.25.1

