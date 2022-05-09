Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9416B51FD97
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6042C10F16A;
	Mon,  9 May 2022 13:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AEA10F160
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652101742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9C8drEYqngKOm3nncV9RRJ4ZJYInBOQKfqINsG0BQFA=;
 b=CoSTYxzbilstUGaXMjMAqkcXY6uXbFZrS/m5Rq28T9YxdskvuYDzY4Z6nKBfnvEwgHd0Hl
 npG3rXCxB8B/0dlE0/Px/sH2GwLko3g40QQYATvkhEMYGe4FrLTsCwf7shnqZ+WNyq+kG0
 AmC+vwc9Hiu/9aVGwwrDIkYdXMYmsZI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-CQDWgBrVNkm2BbJLTNbWlg-1; Mon, 09 May 2022 09:09:01 -0400
X-MC-Unique: CQDWgBrVNkm2BbJLTNbWlg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r9-20020a1c4409000000b0039468585269so3196594wma.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9C8drEYqngKOm3nncV9RRJ4ZJYInBOQKfqINsG0BQFA=;
 b=WJz2ULNA2Vc2hunLONrmgkmIACC6DP6oDXT/HWyVgPsTVTgq7pzYOxH/eOxqo6G8gi
 ZJkhu+qrEEQzV7/X8I+7/xc5VpbCsOjKEy7FB83pXh1YWE6D4qqGVIyZeWnVHerjOCGE
 np95bWRXO/cVU6VlQs0T7VFf5dAdOgn7DJzygEEDeoBnnpjVjTmfCVLPq1Zxv5lqbntz
 t3B116MGT8y02nVolsMsSyMe2mIm3WTDu/eZCTodQhkEGPKDdzQGpb2uhqamR7WYf8XM
 YjOF6MCwPufK4EtF1JGNlhdIiWsNTDuAzFV9CYIOoJpXRN10810M/D/X+PFN4U+FjKxw
 C1uQ==
X-Gm-Message-State: AOAM530LPxQY8y5wCxXWpuX1sQkCSMHZOOgbq7zKICml34tS1U3/N6NM
 7lBwhaprXhx6PqWaQS/dwWeHEYqGp9OHx/F/K6z9F0JrmbNEhibEKC5efvAuOvFr9dOsugsfRDh
 1FJVhZkffnX2UG3xcdVn6LgwwLcin
X-Received: by 2002:a05:6000:1869:b0:20c:5362:1295 with SMTP id
 d9-20020a056000186900b0020c53621295mr14079749wri.700.1652101740371; 
 Mon, 09 May 2022 06:09:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDG6lbGPaq84WzEwCdXcOkQUQu+pRyyBz43QQu3IUWtgwSbAp0rMkkKwCQUS43pMkFMDHl0A==
X-Received: by 2002:a05:6000:1869:b0:20c:5362:1295 with SMTP id
 d9-20020a056000186900b0020c53621295mr14079728wri.700.1652101740162; 
 Mon, 09 May 2022 06:09:00 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z22-20020a05600c0a1600b003942a244eddsm13120297wmp.34.2022.05.09.06.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:08:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/todo: Add entry for converting kselftests to kunit
Date: Mon,  9 May 2022 15:08:46 +0200
Message-Id: <20220509130846.694397-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many of the kselftests in DRM can be converted to kunit tests instead,
since that framework is more suitable for unit testing.

Suggested-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 Documentation/gpu/todo.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 10bfb50908d1..513b20ccef1e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -617,6 +617,17 @@ Contact: Javier Martinez Canillas <javierm@redhat.com>
 
 Level: Intermediate
 
+Convert Kernel Selftests (kselftest) to KUnit tests when appropriate
+--------------------------------------------------------------------
+
+Many of the `Kselftest <https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html>`_
+tests in DRM could be converted to Kunit tests instead, since that framework
+is more suitable for unit testing.
+
+Contact: Javier Martinez Canillas <javierm@redhat.com>
+
+Level: Starter
+
 Enable trinity for DRM
 ----------------------
 
-- 
2.35.1

