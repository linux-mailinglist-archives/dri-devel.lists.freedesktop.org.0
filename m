Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1EFB2EB92
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B475F10E375;
	Thu, 21 Aug 2025 03:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Szpi8pEl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A3710E375;
 Thu, 21 Aug 2025 03:01:49 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b472fd93ad1so347154a12.0; 
 Wed, 20 Aug 2025 20:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755745309; x=1756350109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dchl2bUxkqbgVtu+uy7PwD6R4U4jQS+j2652EoPkofQ=;
 b=Szpi8pEllBXaEj4PFcOY/kI32p5VrbihW0GuWtujkAv5qKPoCVpxKiBnVFLqNCQot1
 BDcPgv0PM4otHfk7VoylFA0rVyrNEs8/zkfe2ANTwj95zjUWipo6N2qm8F826y5qTrvw
 60oqU3Bsrb4QX3R3IvFbBa5C2cCZrlt+2DKCFPha7A8TQQDNwdNSeh37E2THtKDRilND
 +fmGdBVy41sk63jKwFWf9FhFbtWCEzFUDiQBvSZSaaRMiOO6ABZvTeztD++2eD5tJtcf
 WLNUdrTQgno+fDXXtA2pgX0qhXhj5RcALFN6u/z2PRhcG8aPN+CNRYD09FhLFPbrY5o4
 fG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755745309; x=1756350109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dchl2bUxkqbgVtu+uy7PwD6R4U4jQS+j2652EoPkofQ=;
 b=txI3Zh+QX2Mqzf0aEUDI21rx28RR33/fwiQCmEPZ51yCfV+k8Ogv+lcW9p/LQTNmPT
 ItJRGj2AniCdebqwEra8yUL7LyfNhdXUO1GMMGb8av99snfvqLBFXI8mqnoc1bStY71B
 zR67mC7H6Ff4aT6SQJE4el0YjM3fx1GKzRzZb2wlmJ6xI2Yp4nCfsetrPUeI249NElfu
 Jh6e+kIUDoV2ajJ2QuQWsNNJpLiYmUh01vQlkHJFH6FIggjvRwATkYohz/KOVRemdGiH
 W3a0gySuI6Erj2ad4FimTG/C+xmalaYxx8Y3t4urFqCyhmtVuDR0btotZ1Bd67mBVAW+
 9Mjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV69rK35dyFs/uKfeVca/u5av3qndu3WN+Zw4d48albs+6lJZhGbREQqRCstalf2tjyWzZLLrhC@lists.freedesktop.org,
 AJvYcCWOydeWdeFvJY0u+T6fKlkmJV0Z2qxfOUoq9uVqqyyG5rWGYQpJlBWhYvchVFbI/T57AV3fb0IesfY3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxLaQUkXDyMcJOw8TtOltnCA2RQBebXNUDrwrA8TsorSB+jXjb
 gc/Gt9oPOBhmwEyjUmwdfDm3Rs3dHkUp4vTAc/AdlseUtOBvSblfwLhX
X-Gm-Gg: ASbGnctp2PGqHwNDXH0iFxLtROwJWqPVXO66mECjq5cjsy6SV11O3xC3jSA5j+QCQLu
 wCmOAB8C50njAtUqGQsOcV3Fx3mTUd3XBJa2TLysHrBfL+uqOFpiw7/H0zp5KgzGJKHD3Ch/a1p
 ihFmCjfxBOh5J+b0k3pLZrIqCdJs8PujfCeo2eVkAQcXS5wQWN6RrD/XuaFGttJaY97uWtsl9Mr
 BF9UlddX3rqIUaYV5Xuxtm3E6hQCDJ19g4UYyAV1Gmi6K8D7w3QYyRePoXX/LqqXoD6wFGETx9u
 9ZsJ+kSTwrbEOlwxsfv1AB7qdK8HlPfI+T0Sfj/GG2Mqezw5S4KtaC2uF5gdh59GejYMyl99MZl
 JZaoMyie5aNvkj7jgeSiRtW+q1Os=
X-Google-Smtp-Source: AGHT+IHsGc+xADnS1KQl1Eq0/IUY+3ItHxMypYdEF+dKr5ceq+9PZoCw5+c5P8t1BY/0NJT8/0dLRg==
X-Received: by 2002:a17:903:384c:b0:242:e0f1:f4bf with SMTP id
 d9443c01a7336-245fec053e8mr11669045ad.18.1755745308564; 
 Wed, 20 Aug 2025 20:01:48 -0700 (PDT)
Received: from lkmp.. ([49.37.161.210]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c73f2sm40160695ad.94.2025.08.20.20.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:01:48 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, corbet@lwn.net
Cc: tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, siqueira@igalia.com, harry.wentland@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 rakuram.e96@gmail.com, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [PATCH v2 2/2] docs: gpu: Fix spelling in gpu documentation
Date: Thu, 21 Aug 2025 08:29:56 +0530
Message-ID: <20250821025957.22546-3-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821025957.22546-1-rakuram.e96@gmail.com>
References: <20250821025957.22546-1-rakuram.e96@gmail.com>
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

Fixed following typos reported by Codespell

1. complection ==> completion
   implementions ==> implementations
In Documentation/gpu/todo.rst

2. unpriviledged ==> unprivileged
In Documentation/gpu/drm-uapi.rst

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 Documentation/gpu/todo.rst     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 843facf01b2d..7435664a1ffe 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -535,7 +535,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..1d064e617699 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -319,7 +319,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -854,7 +854,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.43.0

