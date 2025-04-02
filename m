Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525C9A7945F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3F710E8B7;
	Wed,  2 Apr 2025 17:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WlT8F0uL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDE310E8A6;
 Wed,  2 Apr 2025 17:43:03 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-85e1b1f08a5so439339f.2; 
 Wed, 02 Apr 2025 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615782; x=1744220582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NT2KOV5clgY+fvBVb0kMabH8vqyg2O7PfGhDz8vOzc=;
 b=WlT8F0uLxkuzhT+UeyhzHvliGEs8XPXAjINLn8QJcEotYk2I53AqRrjjbUSasLaYQj
 VHJPBw7F+kTTb8nJMMXDDr6RHbbvZT5TwkyDbi/jwkzZu7VIsP7p0XfGxB4avYZzzJwN
 MO42r15sHp+fYki1G3Ebv57aPIOKa1MUldWyL8s9rLhl88RgDvagMjsNCiKdbxfDIkEM
 obLpcuLmRMcuZZtOMQSvi2SK70IbRFlqW9goyzxcNR9so0VwME8N3vdd3twzXLFxdCcv
 3bKrkD1r827N1QRd60HP611tqxVg9UtjoYvoAA2yvdFQvk1F86t0BDykqln0kIK/UN1g
 xc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615782; x=1744220582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NT2KOV5clgY+fvBVb0kMabH8vqyg2O7PfGhDz8vOzc=;
 b=WC5INumY4+lpJWXXhVIp+2P/AJ+Kurm5RMq4HDB6hpSgoeHF37oh/Qnj2PXhRvqTnV
 kdRZrFN0aUuBM8GFP6uPvfCjEKwRWuivE0J5WuEWtt2h2DazP6iE6FT9gyJIee2cPKqt
 daNQ+Kw2R3Q3Wx7D2NGH0yRuCeffXACv/zqlS1jDgarzcF2OeCQX8abPNSEIibUVBCM8
 oN/3pXUPz+iohwDk5I/d1hiM/Kgd23v1DJbUPS+dP921x+j1kPz03rscr64x0u30aYhm
 fMF+bJVYteJNVb6fyQ5AxFnUSPrpP1JjEuAZqn4NrMbsGuCnKJ43gCZ/4EIhtx+oBHqv
 67zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpem54MPvpdwrtFI9QMRbTsuxYcCewjaiZbf3QCD8UXulobL/czPpfcUWgifITK3KUeBledA80@lists.freedesktop.org,
 AJvYcCUqXCO5IdT1bX3XHk+RooFm0H5cGbaLGtazJZZvuQ0IH+PkkgyQ1lkuPOrV5CTpHsGGvvX995fid7WDj6to6w==@lists.freedesktop.org,
 AJvYcCUy8KPTN9e817raJZHeC1r32s/nTG0k/V1xIKpJf8Qc7graBKtViCn+jGHuX0mRr9v3+crY9RLoeLcX@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+FPl8me5MPZYEnznHrmGoHvsifY6iNMnzn7qJR5WmVToE74Jp
 Dd2XxLh1poJmAT10HjAuXbd6IYUobQlaDEZiI3xSkfe1B32vnknm
X-Gm-Gg: ASbGncugJaGuZS8gXy+QcA2ObTRZNx0c2M+R0h8KI5KRbDoacxk8n366hui/phGKvPv
 wbo++oR1kEXYFB+xvGGbd1CMoUDSAqtTnHQRxV6QxtHmOcBdIG1eEVuwV4JmzodzkDTUiw8xXom
 o+Fqd7GJMgvq3W75RS+X7xfMIqIylkosnQiL4vmERfTxsP6mS4XlaWTXugqGePB8HH2MEuGSccy
 ptNqTWd6Nw3Yg3BzpzxP1GfXYpt2MMgRm4dCM2kuKFiFtj7+6ZW21eik/Jad3x1VtVZ1ve4Q8Xl
 F9kxs5l02eUST2H2T50Nx8n4mNmZZ4VnmE2eoLDBoArhtS+0f488R/rn/wInd4Q3L5vLPn7HGNG
 K0Py9BRFcUhsp
X-Google-Smtp-Source: AGHT+IHugLKyVSM4152JdpDyO0IyiqFWhgdr4RcjxQiNgdLiEazciacIDXztJ7jfLMjeFRlO1pAg2Q==
X-Received: by 2002:a05:6e02:1a21:b0:3d5:d6ad:286a with SMTP id
 e9e14a558f8ab-3d6d54bba56mr37037015ab.13.1743615782473; 
 Wed, 02 Apr 2025 10:43:02 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:43:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 50/54] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Wed,  2 Apr 2025 11:41:52 -0600
Message-ID: <20250402174156.1246171-51-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index cb405771d6e2..3843c0e47169 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -32,6 +32,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.49.0

