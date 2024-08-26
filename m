Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D305495F146
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 14:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E49210E1F3;
	Mon, 26 Aug 2024 12:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g91xUbsK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EDC10E1F0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 12:25:48 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-533488ffaebso4824541e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724675147; x=1725279947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pYZtiYtxRd3+JF554W7zBHVXrKeX4GmwhuWQSFjXhdQ=;
 b=g91xUbsKxYsbMC88SiiQE7aNOZx1wJ8gwAc3YXilhzW0aKVROByuBWsn0cpziduq2G
 srQOrjet343MnTyhbtVeqsNnKUqO6E+h3FOaxbYUrcJTSkYGf4Lz6q3t9RDZuM7E9jYV
 E7a/QUEhMqLItgDh6sLKdZr9Vuj69lVPPpHIKp2dIYtLuB1eO9rF6R2JQn8yNyhTJ3pC
 MKKq+NKvqRo2Ucqj3krqcfyT7aiE1gZAlX8DbAtQK304RFjaTMsiZR3v+fq2q2WQF4/+
 Dd1p4ApCgLQxsYYQILz+arRN/oNWztdDsfbuyg9Tip0I3YxoKcF7M8z7ys+ge5qENsDK
 Mdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724675147; x=1725279947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pYZtiYtxRd3+JF554W7zBHVXrKeX4GmwhuWQSFjXhdQ=;
 b=hNNrkeBXv2echU8UpQYg4wQtq0/un+jmVX3abfli3aZRDUQ+YezmyXoz/tvpoeA9Fe
 J9bnIgvdM0IiW4NfG8rrcIwSvEai3cdCfk7/jepcH7kggen6mqQlA3gijBzG/TvulIvX
 9thMupgoztq2r7JCD4Hg+UHuCBsg3muDP3tdxAtONtyfjP1PEReOc1wRxNcZhS7j7gO1
 fAtaklHSWmGjEfUN2YD95PlMNnaRgP1s243iUpft+B+KFB8RBynEhTmhTlqcYN3cMrfj
 EZykJM8tqLSKAgzSLXkWWOpS319On1Qx9/33hnzkd6yG+1Iw7re3xMvDyfzn2JxX4t3O
 GLUQ==
X-Gm-Message-State: AOJu0YygCShK6Qxc86bMM47GyapfoJU/y4xwqv/fIT2yrWdMEn40u1Db
 GE7Bjs9uAr/2e7LC6MOG6tsLPYQHnrhTFAEiT5SoPuO0P+GrVOVv
X-Google-Smtp-Source: AGHT+IH4B/zq1lrNoOARpIwftWEZdDyWLrXfkEfpLRY+r8Ah2o0yq3AF3QzxRxM1kz3/BnjcyMfZvg==
X-Received: by 2002:a05:6512:3188:b0:52e:7656:a0f4 with SMTP id
 2adb3069b0e04-534387bb456mr7901172e87.41.1724675145873; 
 Mon, 26 Aug 2024 05:25:45 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1594:dd00:26ff:beb7:f040:ba50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f28f122sm655073066b.49.2024.08.26.05.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 05:25:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	vitaly.prosyak@amd.com
Cc: dri-devel@lists.freedesktop.org,
	ltuikov89@gmail.com
Subject: [PATCH 4/4] drm/todos: add entry for drm_syncobj error handling
Date: Mon, 26 Aug 2024 14:25:41 +0200
Message-Id: <20240826122541.85663-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826122541.85663-1-christian.koenig@amd.com>
References: <20240826122541.85663-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That would be rather nice to have and the kernel side is really trivial,
only the userspace side might be a bit more complex.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/todo.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 96c453980ab6..c771f0c9610f 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -834,6 +834,22 @@ Contact: Javier Martinez Canillas <javierm@redhat.com>
 
 Level: Advanced
 
+Querying errors from drm_syncobj
+================================
+
+The drm_syncobj container can be used by driver independent code to signal
+complection of submission.
+
+One minor feature still missing is a generic DRM IOCTL to query the error
+status of binary and timeline drm_syncobj.
+
+This should probably be improved by implementing the necessary kernel interface
+and adding support for that in the userspace stack.
+
+Contact: Christian König
+
+Level: Starter
+
 Outside DRM
 ===========
 
-- 
2.34.1

