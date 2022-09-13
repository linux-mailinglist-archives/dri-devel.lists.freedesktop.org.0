Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292D85B7C5C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6327F10E4DD;
	Tue, 13 Sep 2022 20:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5455189160
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 20:55:43 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-340ae84fb7dso111965137b3.17
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=s33IIyZmc8+UOGDwcegpipUma0relN3TBfpMpfz2BtE=;
 b=RjSvDvpURFWYgxGTp+hsMgMlof5mN8kvxLIrfLqX4X89vJU6vIXFtmx0+5iAbRnMOl
 AmhQI6ePnBrDnOU4psWJxluoIzalZblllUZva2TEr4N95hjhgz8ZGbLOHTFqvjKegQex
 HWb6RVL597rKKcH75a2RB2G/IRszLtafu+XLKFjl5XN0LrxBPn+c8Q69aA2uJCuI/Pre
 OXID5G2XefTpi4prdWtlr5n9LEccAWLjjHsNyMBuF2bFZow0uM/4qIe4sCcbuQskeeTU
 RRC0VCjDJWvklrNi5KxKkgKM/2yq4MoRMOQLvTqdqMcd8Wtu6wIc4NGkOeV8JKsRLtea
 TIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=s33IIyZmc8+UOGDwcegpipUma0relN3TBfpMpfz2BtE=;
 b=MgWMb1lYtBREWweTjsX8Hspugc4nKrE/OoKeWYcSbaGpSdD4J3bFIqcE/igT2hnJUB
 aLgeslNutdnd1kPeBDF9odRz4j3x80+nExdwcSB0NNKju0h/JSG8wPYF74DYxVRNKKXj
 d7ic0P0HRus9zZwbOFXXzVougr8keqrBxa62BWORwPWggRu9FjJF9kb+bz4HU0yIWj6X
 wi3jG3Ku5KHe66L8sd4GSXhK98OsNYeDwaIVIwaDkbps/aR6hgyuhfybN7LGYwJ8YuZk
 sMWgMx74TBVCX4Agnt+xh4pmHsIjgMQ6QIH1Zz2W3e2ffOR4AWlQ8aoPYdnhJb/lwNtY
 AjMA==
X-Gm-Message-State: ACgBeo2+3O+BDTRjTuC2UY2pS+vDEQiSh8qSNdZvTrgyY4co27ZTcDxG
 VSnxzRM5FwFPv5quf/3NLj+5FdCu9A==
X-Google-Smtp-Source: AA6agR5dsFGBClGYLD+8MsGw7ygyHU5aaKZYuov7XnCqBY5RuEfzGEGGFNkCWySIkMRmAQ8phfbVgpv1BQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a25:a26a:0:b0:6ae:a723:f721 with
 SMTP id
 b97-20020a25a26a000000b006aea723f721mr15192009ybi.200.1663102541983; Tue, 13
 Sep 2022 13:55:41 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:55:27 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205531.155046-1-nhuck@google.com>
Subject: [PATCH] drm/i915: Fix return type of mode_valid function hook
From: Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, llvm@lists.linux.dev,
 Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Huckleberry <nhuck@google.com>, Nathan Chancellor <nathan@kernel.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All of the functions used for intel_dvo_dev_ops.mode_valid have a return
type of enum drm_mode_status, but the mode_valid field in the struct
definition has a return type of int.

The mismatched return type breaks forward edge kCFI since the underlying
function definitions do not match the function hook definition.

The return type of the mode_valid field should be changed from int to
enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/i915/display/intel_dvo_dev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
index d96c3cc46e50..50205f064d93 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
+++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
@@ -75,8 +75,8 @@ struct intel_dvo_dev_ops {
 	 *
 	 * \return MODE_OK if the mode is valid, or another MODE_* otherwise.
 	 */
-	int (*mode_valid)(struct intel_dvo_device *dvo,
-			  struct drm_display_mode *mode);
+	enum drm_mode_status (*mode_valid)(struct intel_dvo_device *dvo,
+					   struct drm_display_mode *mode);
 
 	/*
 	 * Callback for preparing mode changes on an output
-- 
2.37.2.789.g6183377224-goog

