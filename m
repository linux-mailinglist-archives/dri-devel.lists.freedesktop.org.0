Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8885078D64A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 15:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACED010E525;
	Wed, 30 Aug 2023 13:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356E410E524
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693403191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uG5M2Lwpie6cChdlBf2i1g6i8ozHuD8iPPR+2gMyfYc=;
 b=BY7VJof0QjqigpStiZgPE008ec1Pwqd9JQBEpTmWasug6HnaNMxnmp2zpkQJfXw+kSJEfy
 mQWmwsuxYvZpW0cqozp8NxQjQC1vn3B1r1k1Gbl6oeF8oRIyRbIQPsdzVoW6NICsktgtTt
 iRn1r2aMXZcX3f4PQdUOQP+2jfVuMt8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-psNAjZ-vNIKZUoEbwj-f5A-1; Wed, 30 Aug 2023 09:46:30 -0400
X-MC-Unique: psNAjZ-vNIKZUoEbwj-f5A-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5219df4e8c4so757492a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 06:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693403189; x=1694007989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uG5M2Lwpie6cChdlBf2i1g6i8ozHuD8iPPR+2gMyfYc=;
 b=b+4RQhmuRTZIGVRwBN1CALszv4HSNspP3FyiVj0e+p9lY4lx/jC5kdOZT6wJhVvVOw
 D2c2aingvdFVjoh3vjkgEv8rQADL0iR2t7bEDdeiw9XLJVHsd+N0Cc+saA5SEZSCbZkz
 pGutj5IPv1vVYZ0aoDQbxtLoEel9e9+wyhiMF55ZppRnsqdDEneLrELetcO0PIU36G9L
 SP4Lbzn6emOu77IJGZnOwVWnt88/XVwx+3CWJBAyhFSKLH7uHwL9iDY9oTv4gjOaa2cP
 imSzjopjwQMeWRSsgT+pg4wdBDBzb7KYRCR1L89sEzxaRBzIiJnQXwYh+vCu02r8gEph
 bBsg==
X-Gm-Message-State: AOJu0YxmfqsFe4jGmVitwxvEtgYVtoPfHM1k6rEIVl7TMYdurhpJGKhN
 YLz9dS8lyR/aPkebiMXxQKXmcEXRr5FzilHYDjWAk8oS4aocN3ERIfVqjXgCFYAXuDBHtXQXKsf
 rPJspzvOV45tVUsx57YvdAB67qBMH
X-Received: by 2002:a05:6402:50cf:b0:522:e6b0:8056 with SMTP id
 h15-20020a05640250cf00b00522e6b08056mr1964352edb.4.1693403189066; 
 Wed, 30 Aug 2023 06:46:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpKYbKxrilyWwmvyGSQuR3YdE5ziBNReJitKpOxi4O0anKghb3+MxxX32nil6cbORrhxRuFQ==
X-Received: by 2002:a05:6402:50cf:b0:522:e6b0:8056 with SMTP id
 h15-20020a05640250cf00b00522e6b08056mr1964344edb.4.1693403188914; 
 Wed, 30 Aug 2023 06:46:28 -0700 (PDT)
Received: from fedorinator.fritz.box ([2001:9e8:32e4:1500:aa40:e745:b6c9:7081])
 by smtp.gmail.com with ESMTPSA id
 w23-20020aa7d297000000b0052595b17fd4sm6683260edq.26.2023.08.30.06.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 06:46:28 -0700 (PDT)
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
Subject: [PATCH 2/5] kernel: kexec: copy user-array safely
Date: Wed, 30 Aug 2023 15:45:53 +0200
Message-ID: <0a3f1bca273792edbdc41b64c454a6f7f499c9a8.1693386602.git.pstanner@redhat.com>
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
 kernel/kexec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kexec.c b/kernel/kexec.c
index 92d301f98776..f6067c1bb089 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -242,7 +242,7 @@ SYSCALL_DEFINE4(kexec_load, unsigned long, entry, unsigned long, nr_segments,
 		((flags & KEXEC_ARCH_MASK) != KEXEC_ARCH_DEFAULT))
 		return -EINVAL;
 
-	ksegments = memdup_user(segments, nr_segments * sizeof(ksegments[0]));
+	ksegments = memdup_array_user(segments, nr_segments, sizeof(ksegments[0]));
 	if (IS_ERR(ksegments))
 		return PTR_ERR(ksegments);
 
-- 
2.41.0

