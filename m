Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9B27EEB80
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 04:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F55F10E06A;
	Fri, 17 Nov 2023 03:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E55910E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 03:55:06 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-421bcd0b532so9162581cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 19:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700193305; x=1700798105; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jQBI6uLk6zFgtT5TUQFquszFHmesPsjbAWYJqoHrB6g=;
 b=Xg4RTlFqEOLkccNkLUAeHqD3QXnGDo/AUlYUHnq8fpsTw6GhwcZLVhhbvtRUeoeZQK
 FPVCaYuGrlxFPYrJvi7iNqdSOb4fbu1hAS3JvzSweyl/4hnG55+fqeowZDMsMQD3YrXG
 PsD53rMJ4+ilwxG9fWGKQxQXFgKBygjffQu9yn79/ecpndN+tuyqaiyKtHV8TJ14P+2O
 HPgz2AwzMpsEcrZ7FnV/ZlimJaNoaruakhNp7Rk7C49P7vQPTuQu+/2uWmOzA7FTEs+6
 dHoW6lZxpYRWTS6USN2Ldje9+xiOw7EqL3lS2X6BfjhFGehWGnHKTnBvdB8wby2xugKE
 4uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700193305; x=1700798105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQBI6uLk6zFgtT5TUQFquszFHmesPsjbAWYJqoHrB6g=;
 b=uzUeWHt4l1xi+cUE0PBBtpBKoATfQ9S7WIxhBEv3UAqPqdP0QjBKRFyoM/Ka+BDlPx
 EEoixlSFLE5jFW+ujgOZuzVROZxaNSrtS94mszIUNL5xoBzpfs3UF3gPpQ4d0RuGogIs
 FuhsxQ5CQxL/BZTnlFg/cxZuUnkjl7mPVZjbAJ5W+D5ojOwsmThRFThG6h3N5lQQMU8P
 l61R//gRS5g//EAtOycEskpfEZAz1KHUBfyRkXdaATYKDrm4E6yutj56fQjgj8xDRa1q
 2Lp7TqDbWuoujKgRPxGnHWq+tzIoTXDGtZuLiznDAkyeuYJ8sDT46ZywUkLydBGNX4bz
 5yLQ==
X-Gm-Message-State: AOJu0Yz1rOjDd/dEzIvjf9NH7U9zNxH1q+JVoyHpD8Hghu35BM70ZVio
 LHJANk3h8gwEp2cTL2stBDR2DWpj9OdswEpJMmI=
X-Google-Smtp-Source: AGHT+IEVMulj+6/tz4f9O2QbiVRJqty/372h/daTpOHNZlV3BvmybZb+cfL2sefY2j2FBFztNWhKPg==
X-Received: by 2002:a05:622a:13ca:b0:410:9626:f0bf with SMTP id
 p10-20020a05622a13ca00b004109626f0bfmr11809414qtk.13.1700193305197; 
 Thu, 16 Nov 2023 19:55:05 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 w14-20020ac86b0e000000b00421c8069affsm294805qts.78.2023.11.16.19.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 19:55:04 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/print: Handle NULL drm device in __drm_printk()
Date: Thu, 16 Nov 2023 22:54:28 -0500
Message-ID: <20231117035427.68125-2-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.42.1
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
Cc: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_{err,warn,...}() use __drm_printk() which takes a drm device pointer and
uses the embedded device pointer to print the device. This facility handles
NULL device pointer, but not NULL drm device pointer. This patch makes
__drm_printk() also handle a NULL drm device pointer. The printed output is
identical to if drm->dev had been NULL.

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 include/drm/drm_print.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a93a387f8a1a15..dd4883df876a6d 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -453,7 +453,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 
 /* Helper for struct drm_device based logging. */
 #define __drm_printk(drm, level, type, fmt, ...)			\
-	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
+	dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
 
 
 #define drm_info(drm, fmt, ...)					\

base-commit: 3b434a3445fff3149128db0169da864d67057325
-- 
2.42.1

