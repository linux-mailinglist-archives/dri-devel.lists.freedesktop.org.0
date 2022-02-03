Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3E04A879D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6512010EAB2;
	Thu,  3 Feb 2022 15:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327B210E8F9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643901800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FyaICBNYXFogXQpGuOXvlvkFpwrbiEbZFhG8GrBvphk=;
 b=XP83HuH/oc7UxLINC/YfcdOPEyPZLFovBEqXY8rJjW7GOS6mgljFyERFnVInHR5e1m4K9d
 /7LTbUVSEWtW1uRAvcQzRbRrVFydGqGNQJxmHf1fQ7K+WJg91A4FAwvAu1+PnJfg2Pyc5c
 917iyfqtE6b7UeeXaH1S2PM9phbzoV0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-TeozX5UINLeAiztWA_VkGg-1; Thu, 03 Feb 2022 10:23:17 -0500
X-MC-Unique: TeozX5UINLeAiztWA_VkGg-1
Received: by mail-qt1-f198.google.com with SMTP id
 x10-20020ac8700a000000b002c3ef8fc44cso2196708qtm.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 07:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FyaICBNYXFogXQpGuOXvlvkFpwrbiEbZFhG8GrBvphk=;
 b=uT6qK1Z9ZpxO904B6NnInMMV0h8zYwatQz/W2IPJ+jwoQx/Idn+3n4bN67wzeVXx3N
 ZtI5PcoatyQ8MXAH7yu5uDd/YFsLQvr4rWua/VF0Rv7DZjx3SYaKB6wiUi7fdd3OsOXP
 lM0e7DfYGVuR6NpBIZsXiyLUCGzNZ4dlEdCZN6QjV4tt3KzaC3x1mU5M9ggmEv2piDpE
 19LPIitZmeEijnylSP3wJwVipahR7fnxbWgAKe3ANhKojbJMJYl4DnC7BL7MoogJLUOk
 8qjTbBdU+3W76LJlRMaJGF/kE666KFW70cooUrnHXOAU0bF+lEoywqlFHcOEaZVWGsoa
 MrBQ==
X-Gm-Message-State: AOAM532UpD8RApZZLrHP+XscE6o5WjKsAhd6tdPzRuZofs55laXYi38m
 H/GV0Ol05RTYcy28yzPB6I8ERSpJV2PHKHGTglptBSapi51dFBMf/B2YodTmLy0vn6MDBNyVzDX
 eu9OQPtyR2R1BXX2VzLFQ6r4XNvoj
X-Received: by 2002:a05:6214:767:: with SMTP id
 f7mr31309322qvz.32.1643901797246; 
 Thu, 03 Feb 2022 07:23:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKoZK62v8/DrZws5sOsM70Uxo6BwdmPV1YiNBPk723GMaQhV5IIhjTr/Mj5MVVcyOlC4yv6g==
X-Received: by 2002:a05:6214:767:: with SMTP id
 f7mr31309297qvz.32.1643901797012; 
 Thu, 03 Feb 2022 07:23:17 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id w22sm9746568qtk.7.2022.02.03.07.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 07:23:16 -0800 (PST)
From: trix@redhat.com
To: airlied@redhat.com, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com, maxime@cerno.tech
Subject: [PATCH] drm/ast: fix using freed memory
Date: Thu,  3 Feb 2022 07:23:05 -0800
Message-Id: <20220203152305.1846862-1-trix@redhat.com>
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

clang static analysis reports this problem
ast_mode.c:1235:3: warning: Use of memory after it is freed
  drm_connector_update_edid_property(&ast_connector->base, edid);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The second condition on

  if (!flags && ast_connector->i2c)

Means that the edid is not always set.  If the previous block
fails the freed edid value will be used.  So set edid to NULL
after freeing.

Fixes: 55dc449a7c60 ("drm/ast: Handle failed I2C initialization gracefully")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ab52efb15670e..9131dc8a1a2fc 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1224,10 +1224,12 @@ static int ast_get_modes(struct drm_connector *connector)
 			return -ENOMEM;
 
 		flags = ast_dp501_read_edid(connector->dev, (u8 *)edid);
-		if (flags)
+		if (flags) {
 			ast->dp501_maxclk = ast_get_dp501_max_clk(connector->dev);
-		else
+		} else {
 			kfree(edid);
+			edid = NULL;
+		}
 	}
 	if (!flags && ast_connector->i2c)
 		edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
-- 
2.26.3

