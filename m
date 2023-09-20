Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9667A8068
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775FA10E4A7;
	Wed, 20 Sep 2023 12:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A248410E4A5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695213413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48G0tj5zzQRFiALYPkyRPndfaCR4k/8e83lXW3c50mA=;
 b=W9LiAbU/WPMGWNpDS7mM34mkZuYanEqenFjLNaYDdjp3Ei1464khBpLShp/QXQyCflIb+7
 wCX8yCwV5k8YxWuKv7Iec1zBVY0lxXjCsiYie+tn5nfwhpLQXJePxIG9CEosV3sdpk+N7r
 LI5eVSZgNjCD+2sdr+h49YrWocQNQY8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-cAWPahN2MT6Pl3yslyaztA-1; Wed, 20 Sep 2023 08:36:50 -0400
X-MC-Unique: cAWPahN2MT6Pl3yslyaztA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9aa1e8d983aso156322066b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 05:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695213409; x=1695818209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=48G0tj5zzQRFiALYPkyRPndfaCR4k/8e83lXW3c50mA=;
 b=KdioGlkqAMB7M92fAV0QuOtFPL+lXbVuJUEy04riTeWpXwakkmdiqxTkX/amXlKG5/
 qNCSd8qARp1jdPO8mB8+NiwkgLw4aWLy4VdaiJ/OkCCKVlRoxfseJ3lUqUyqMeG5qJ5H
 WQDMEv4/AvcYBsbSAMaVhhpJi48tXmK5dtgWiQgBmb4ZVKLs50VNhcTJjhjwOo3zfdUb
 9cCboxLROuF1bG+5x45jnl2SK+31CuEzX2Z7DOTmTxp8+FFN+4HAzLaQ6Adrb0Fl+KHe
 3TNAfjAQ7rxjyQcA0F4CIbxrDt0a735uMe7qgWWZVzPkBtbS3scQleoA3aeRSe+TvWAP
 YBdw==
X-Gm-Message-State: AOJu0YxeGiv3nyYnTYJiP2s/oUuRKfKcTHG0l9hVMPqYaDSML8LPcWqO
 LBJ/8aCxp/9lk0Si9MTVJY+TM7sKXs6/zNJZGh9xNZ8IS72B3ntOCnBOcVX7lgqmUt8hhAXv7ES
 kDC+gA6v/9XqlPO32aG/x+BdExO+N
X-Received: by 2002:a17:907:9512:b0:9ae:4492:df34 with SMTP id
 ew18-20020a170907951200b009ae4492df34mr1444634ejc.6.1695213409776; 
 Wed, 20 Sep 2023 05:36:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmJTym5YvZ4MH52qjmmgnlm70HGxEIyE84IZpdWdDkioxeqQ+sBFeg2a5b+qpjuhd9RNuOjA==
X-Received: by 2002:a17:907:9512:b0:9ae:4492:df34 with SMTP id
 ew18-20020a170907951200b009ae4492df34mr1444608ejc.6.1695213409547; 
 Wed, 20 Sep 2023 05:36:49 -0700 (PDT)
Received: from fedorinator.. ([2a01:599:906:7772:a505:d891:dcff:9565])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a1709064ad100b0098ce63e36e9sm9447247ejt.16.2023.09.20.05.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 05:36:47 -0700 (PDT)
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
Subject: [PATCH v3 2/5] kernel: kexec: copy user-array safely
Date: Wed, 20 Sep 2023 14:36:10 +0200
Message-ID: <20230920123612.16914-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920123612.16914-2-pstanner@redhat.com>
References: <20230920123612.16914-2-pstanner@redhat.com>
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
Cc: Baoquan He <bhe@redhat.com>, Philipp Stanner <pstanner@redhat.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 linux-hardening@vger.kernel.org, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there is no overflow-check with memdup_user().

Use the new function memdup_array_user() instead of memdup_user() for
duplicating the user-space array safely.

Suggested-by: David Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 kernel/kexec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kexec.c b/kernel/kexec.c
index 107f355eac10..8f35a5a42af8 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -247,7 +247,7 @@ SYSCALL_DEFINE4(kexec_load, unsigned long, entry, unsigned long, nr_segments,
 		((flags & KEXEC_ARCH_MASK) != KEXEC_ARCH_DEFAULT))
 		return -EINVAL;
 
-	ksegments = memdup_user(segments, nr_segments * sizeof(ksegments[0]));
+	ksegments = memdup_array_user(segments, nr_segments, sizeof(ksegments[0]));
 	if (IS_ERR(ksegments))
 		return PTR_ERR(ksegments);
 
-- 
2.41.0

