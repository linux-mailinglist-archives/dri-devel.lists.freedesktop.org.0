Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B078D64B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 15:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C1110E144;
	Wed, 30 Aug 2023 13:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8E510E524
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 13:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693403196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2kuY7QrN77OjYcmiIgmsp8RgTy5tijHIGRui0VqTUY=;
 b=VBafd5+o1BPasgg3fepmn+pHFg9tfaRqiRoKKiE9l9T2E7RMw1qv4xHyTPt0ekn0jCi9/N
 7XWEFXW7pjfnYufLxmnG7EKyeEZC9KJy7i36g9LajCQJMNCMuW0EPiDU1AXC9uaLhL6vd7
 97T94ul4akjY5DV4rSGaDoc7zb+Kt/A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-KleB5WiJPhG_7knE9IacEQ-1; Wed, 30 Aug 2023 09:46:34 -0400
X-MC-Unique: KleB5WiJPhG_7knE9IacEQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-52c0134dfcdso114652a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 06:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693403193; x=1694007993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2kuY7QrN77OjYcmiIgmsp8RgTy5tijHIGRui0VqTUY=;
 b=DrY7fV2OSqjbaL03ncIqYvQSkjT573LgIyuVrM7b/oRPUYzGtyjqGCiGKfjQgrI2AE
 vvWbmroTpzDl71kUXdUif8lDF6fVWmH/vE/7s1swFBnJZDMFZl5/MtQck1yjSq33T24c
 BPOPW8b8MOp6cSvw5s2IggBbldbLq+rfCxLoWZOezXhk1L9WeMhpRmpwcam6oeSbPIf3
 R4J2slLYIkQYxtLC+3ISkj43n3ImM10KdVVQae1wDCBdHxgyL2T3KL/IWmZcjmWNXH19
 aazCrlY0KbXHBNzcUgQEdl6Wwxk8ldMbcBksv2hVfvK6QPn5j7ofL5tw+RuSFPXH5gDf
 YE6w==
X-Gm-Message-State: AOJu0YzQaAoK4sseBUTG2q2yEPtHR4tNuX7yilmjnlkEHsQjnTl5XMLZ
 6BgqdYhtX0jdLDz8L3X91wabAuF9Gj8HnnJe4tPQSTvDZjk0AMIE1pPhbWQbh7kpf2Oi8GHu38X
 nL/6sG3i+9p1PEKCAerLzbsxNAcpT
X-Received: by 2002:a05:6402:51c8:b0:522:3f32:52f1 with SMTP id
 r8-20020a05640251c800b005223f3252f1mr1737286edd.3.1693403193058; 
 Wed, 30 Aug 2023 06:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf9jsdBfXtDK6B3l1XAhb6uC/SE7H2eq+xyXHHwbpGSepkZ7/eGDvrY6bR1kwu2ebD+wsHwg==
X-Received: by 2002:a05:6402:51c8:b0:522:3f32:52f1 with SMTP id
 r8-20020a05640251c800b005223f3252f1mr1737265edd.3.1693403192770; 
 Wed, 30 Aug 2023 06:46:32 -0700 (PDT)
Received: from fedorinator.fritz.box ([2001:9e8:32e4:1500:aa40:e745:b6c9:7081])
 by smtp.gmail.com with ESMTPSA id
 t7-20020aa7d4c7000000b00529fa63ef6fsm6811782edr.57.2023.08.30.06.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 06:46:32 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Christian Brauner <brauner@kernel.org>, David Disseldorp <ddiss@suse.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Siddh Raman Pant <code@siddh.me>,
 Nick Alcock <nick.alcock@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
Subject: [PATCH 3/5] kernel: watch_queue: copy user-array safely
Date: Wed, 30 Aug 2023 15:45:54 +0200
Message-ID: <4168bc2d9313d5d1a1a2b9ca0b9fc2990d499506.1693386602.git.pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693386602.git.pstanner@redhat.com>
References: <cover.1693386602.git.pstanner@redhat.com>
MIME-Version: 1.0
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
Cc: Philipp Stanner <pstanner@redhat.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 linux-hardening@vger.kernel.org, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there is no overflow-check with memdup_user().

Use the new function memdup_array_user() instead of memdup_user() for
duplicating the user-space array safely.

Suggested-by: David Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 kernel/watch_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index d0b6b390ee42..778b4056700f 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -331,7 +331,7 @@ long watch_queue_set_filter(struct pipe_inode_info *pipe,
 	    filter.__reserved != 0)
 		return -EINVAL;
 
-	tf = memdup_user(_filter->filters, filter.nr_filters * sizeof(*tf));
+	tf = memdup_array_user(_filter->filters, filter.nr_filters, sizeof(*tf));
 	if (IS_ERR(tf))
 		return PTR_ERR(tf);
 
-- 
2.41.0

