Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE99B4CC701
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7494310EF96;
	Thu,  3 Mar 2022 20:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64DA10EF96
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 20:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646338793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W+Yb3jSVbGXS2UsBEDl+Z51/w7cVcv7OgJoaeEwhScE=;
 b=Q3Vu7866MDdY7xCJLeI1VGCExy3Ut+fs8dJZWMzJh9tsGFzYYkdqLn4DmIRT+3DlOty1B5
 MK73fsmQ5ofG+iVsqpZODN+cHpMIW6TS96gugY+1raJD8oofN4BxBZKjQbSB4vRxUCnadg
 v0ymSJ1LiCls/lg28H8Xy8yjbMG5lpI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-NqnvXNARM6GRxG8z8irpfA-1; Thu, 03 Mar 2022 15:19:50 -0500
X-MC-Unique: NqnvXNARM6GRxG8z8irpfA-1
Received: by mail-oi1-f199.google.com with SMTP id
 o2-20020a0568080bc200b002d64d89d460so3894136oik.17
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 12:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+Yb3jSVbGXS2UsBEDl+Z51/w7cVcv7OgJoaeEwhScE=;
 b=yW9OEw/QTPA8Kg9hNbvBncrwzYDx1kmYNWzaAZdd3t1BeADVl3kgxqYvxvWSmOMMnM
 J5OKpL91p7XYczrjQMMmDvDaU84im0wtPQjCAEBWfMuoNU9gMWt6PU46WMZm48HZqCer
 8Zmdrhr9Eo8vid89CoViEcTU16LzY8sDUCAeymWnBkuHuAXe/iasbyBu5ImEUVa4UaBa
 PtLfBfZs4NwoYJ6mUc34Dm/fo28gDLdkSREtns7dnOL1tuWo9olmDEZXyOJ7PJQSEuwH
 hPZVIuF8Cr8YSJm0p1jKebCONwPOznC9dL/QLf1TmHkFuy245afobYC0j8dK6d2LsYq9
 W4LQ==
X-Gm-Message-State: AOAM533uK81QLVc+0tPZeqLaRy8C7gZyR3AVAabj5cyScuxFobqaSOqM
 nxjJ7E58kE4eqOIJrKSfQGLm3uKU3SFYxXabx898C91XhgPWVaK/v+2howxO9jymfs+ErYKkH0A
 qmu6ljGiYnZiqKf4gyxtHv3YCpeqH
X-Received: by 2002:a05:6870:128c:b0:ce:c0c9:5ba with SMTP id
 12-20020a056870128c00b000cec0c905bamr5481243oal.12.1646338789965; 
 Thu, 03 Mar 2022 12:19:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9UL7z0i5c0I1zBYkPbE2sDhIbft3n5S0zsg8O5Iu/S8GWiXtXSO4aUx3Hz5c0J+4lOC6M2Q==
X-Received: by 2002:a05:6870:128c:b0:ce:c0c9:5ba with SMTP id
 12-20020a056870128c00b000cec0c905bamr5481217oal.12.1646338789724; 
 Thu, 03 Mar 2022 12:19:49 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 52-20020a9d0bb7000000b005afa463d9f8sm1411532oth.19.2022.03.03.12.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:19:49 -0800 (PST)
From: trix@redhat.com
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com, xji@analogixsemi.com,
 hsinyi@chromium.org, sam@ravnborg.org, tzungbi@google.com,
 pihsun@chromium.org, maxime@cerno.tech
Subject: [PATCH] drm/bridge: anx7625: check the return on anx7625_aux_trans
Date: Thu,  3 Mar 2022 12:19:43 -0800
Message-Id: <20220303201943.501746-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this issue
anx7625.c:876:13: warning: The left operand of '&' is
  a garbage value
  if (!(bcap & 0xOA01)) {
        ~~~~ ^

bcap is only set by a successful call to
anx7625_aux_trans().  So check.

Fixes: cd1637c7e480 ("drm/bridge: anx7625: add HDCP support")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 633618bafd75d..f02ac079ed2ec 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -872,7 +872,10 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
 	}
 
 	/* Read downstream capability */
-	anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
+	ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
+	if (ret < 0)
+		return ret;
+
 	if (!(bcap & 0x01)) {
 		pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
 		return 0;
-- 
2.26.3

