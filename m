Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3B7990C4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2146410E944;
	Fri,  8 Sep 2023 20:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B45410E944
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694203385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJlM81Ad0uqQunhdFKofh1JwhP2kaFm8hxSxz8OfTMk=;
 b=bzizTypi9G7KWH9+PtT265OdytWC2oMLvDmw/JF+v8zLtKgzPnt08nWgNQnUu/Gr1R3yd0
 L3ylLkMq8CQN7RApJ8t2ny5mifzEXa2uK67ibPgBjHnX5XDnApTl7XCd5M+s/TD2xkXKrX
 q1amT77gWvHci9kD+vDtBtAzr62wh5M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-puUsQEHjPAWD2VVnTzCGcQ-1; Fri, 08 Sep 2023 16:03:02 -0400
X-MC-Unique: puUsQEHjPAWD2VVnTzCGcQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-637948b24bdso5999006d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 13:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694203382; x=1694808182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJlM81Ad0uqQunhdFKofh1JwhP2kaFm8hxSxz8OfTMk=;
 b=o8A+Iqrxt2u2mHWl0EEZwhXe0Ywgoyj28+VCVukflgQ9BFSgBbjPirGfFIrmFs1RAV
 JohyCTRLttKKYyvyQufJ9dr0/itxjDJOQa6eVfb2Q0Hn0EQrRKRb/pJ/hJX6Df/temZY
 Z8UjtK09GETm4grZUFuc+qKfvHccWzruPYrvuyxPPx5iWnhhT2v6/pjy1fLMiPNZQDbD
 jAs0JJahGsm8DM3nVlJuEOkP+BKcDd9EJPlmKdT6JfgYmD/d8S+wv0dWbp/9qryMyyG8
 /aTasUI9g1gKitBPr0u2GUtdRNpK729Y+EVmmd08AjAHwJ3MkcLpA+DEQbVhWFBb6Q8I
 YUIg==
X-Gm-Message-State: AOJu0YxajzqC30UY5KkX/CJP5+8alz4x1Xj8g1RIjtwAw91X2Povpno5
 mUnt780QmdOVmETC8TRk/QMMZtXlI/pABMUUvlMASpOCGdlTbPMiDSzleTjQtoY7RZmMOobVt5c
 xALe0D1TM6FMy47wJ2PZ0YovG9sAD
X-Received: by 2002:a05:6214:234b:b0:649:5f43:245c with SMTP id
 hu11-20020a056214234b00b006495f43245cmr3403714qvb.4.1694203382304; 
 Fri, 08 Sep 2023 13:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkpjEpC3M4jl16uIjnS3PMQJTudw+DmAKJXO1LGuAkwNI/2h/IQUepIX3UGSH4cUrAf1SALA==
X-Received: by 2002:a05:6214:234b:b0:649:5f43:245c with SMTP id
 hu11-20020a056214234b00b006495f43245cmr3403702qvb.4.1694203382095; 
 Fri, 08 Sep 2023 13:03:02 -0700 (PDT)
Received: from fedorinator.redhat.com
 ([2001:9e8:32da:e500:513e:fbe9:e455:ae67])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a0ccc13000000b0064f523836fdsm959242qvk.123.2023.09.08.13.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 13:03:01 -0700 (PDT)
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
Subject: [PATCH v2 2/5] kernel: kexec: copy user-array safely
Date: Fri,  8 Sep 2023 21:59:41 +0200
Message-ID: <31313a8a1dd1baf9dd3c21fbe8dd46b9e111f20c.1694202430.git.pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694202430.git.pstanner@redhat.com>
References: <cover.1694202430.git.pstanner@redhat.com>
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

