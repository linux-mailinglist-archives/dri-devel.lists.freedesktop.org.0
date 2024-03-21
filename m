Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24E8885C17
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 16:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F10010ECC1;
	Thu, 21 Mar 2024 15:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SegtJ9aE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE39A10E806
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 12:04:24 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-78a01a3012aso62917185a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711022663; x=1711627463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VWe40Qw2RtIY9rsmg4dS1sWx+IBR19FeZvKGaxKc9lg=;
 b=SegtJ9aESdKxuok//qo+H6x64cij9XGV1pkMyktVfYDpPGoAF9OJ+zDJjM05/Iv7eI
 hJEVvaIPSQOqNSBs6jeTGJ3c9LDjefoOHLx20hrv2BlLYZQckzS4K++pNj+VTep9z4fg
 0Sy+1yNZE3LBPwCZp1N9nIUp0Km7VhmR0Dbp0QIizUdNsw0Eu6jeCDTqiDOjCsOgtRKa
 cOY7HBPUxZfsx69iHnwhxO0DKmdoSe9YcyoN1IDab0sQeLLpR6QAygyEnz+q2JYKA1qD
 +JYlc0SBG56cXT8sFS1V6sXF/uvr32ATBObOXyXg2b0dwU335S+cJhUeGeYGflDSMAl9
 5kTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711022663; x=1711627463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VWe40Qw2RtIY9rsmg4dS1sWx+IBR19FeZvKGaxKc9lg=;
 b=E1tDosvEJgBh/TSs+JKpKWBN/1lma0FzhvkVgOQUSOAE8uqmTXKEsZ4Bexas9T+46F
 WdnalE8uys9A9saygZEDagjVkHoO0GeBZDU22hyaOUJ5u6jDiAtmmRX7PSkKSGKW5Uul
 F5nQz5/WJ65bG/om+tI6KEsSgOaf3pVF9TWbSali+lnolHn0BMYnxzCLwo/eKjDtxKQ+
 CE1UpupWx1HeBeFCj+EwxGOTY0O2bAxE3LswRYX46bdKtLIAx/6QqzkjM8MulEMN7RkB
 7xBMlvLTKAcI5KUkDFcIHFZ3QodRx2tX8aprYkqv6908dKecEZcusaqNll5hpS5uRGLj
 0XzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhy43xQWC2KcJbLzxSDwytRNvvRuNLazrTOfi7ndOyKf5gXQ7j27Pgltg05ZWGz970AdByQzDo38qV2HHxN/EwErk9bKH7B199i+87drL2
X-Gm-Message-State: AOJu0YzolAHRoQ8ukbOY5Lpm7qTifBA+3JabhKdioxos0he4H1gWjJmS
 OyY8D1wEwltyblDyg0FsFIVCdlqPNFqCnJTajon3xWA+bEpmDI4WrvL11SPPIgp2Zg==
X-Google-Smtp-Source: AGHT+IGd6j5zlTykKxJioDolomp0QHiRr0lYiNs6eUgfeEk0yQ8XJOhGTolmdzYlL54znpzC3S1cjQ==
X-Received: by 2002:a05:6a20:7da4:b0:1a3:63ca:632a with SMTP id
 v36-20020a056a207da400b001a363ca632amr13355089pzj.58.1711022302257; 
 Thu, 21 Mar 2024 04:58:22 -0700 (PDT)
Received: from amogh-desk-mint.Dlink ([119.82.120.209])
 by smtp.gmail.com with ESMTPSA id
 c23-20020aa78c17000000b006e69cb93585sm13341804pfd.83.2024.03.21.04.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 04:58:21 -0700 (PDT)
From: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 javier.carrasco.cruz@gmail.com, skhan@linuxfoundation.org
Cc: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Fix duplicate C declaration warnings
Date: Thu, 21 Mar 2024 17:27:08 +0530
Message-ID: <20240321115738.51188-1-amogh.linux.kernel.dev@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Mar 2024 15:37:52 +0000
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

Fix the duplicate C declaration warnings found on
Documentation/gpu/drm-kms.rst that was found by
compiling htmldocs

Signed-off-by: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>
---
 Documentation/gpu/drm-kms.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 13d3627d8bc0..a4145f391e43 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -357,9 +357,6 @@ Format Functions Reference
 .. kernel-doc:: include/drm/drm_fourcc.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
-   :export:
-
 .. _kms_dumb_buffer_objects:
 
 Dumb Buffer Objects
@@ -458,9 +455,6 @@ KMS Locking
 .. kernel-doc:: include/drm/drm_modeset_lock.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
-   :export:
-
 KMS Properties
 ==============
 
-- 
2.44.0

