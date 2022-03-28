Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9234E8CC9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 06:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF1010E58A;
	Mon, 28 Mar 2022 04:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD4310E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 04:00:17 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2dc1ce31261so108411357b3.6
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 21:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=5YF472UBEt2/+0TMmuAJ6M5CUqS69OAWnmeSQdznm4c=;
 b=Otbv6BZ5qGCcevBDAZX6xN8e9nfLahzy72aZz2C8ZnF7O0aumEiNkqQhZur1HY8/Cs
 iuIInxQV8DulTLV4peuIv24Kjo659uXmfHBO0sgraK+JrrU+As1YNNyP5VsmX8xvpfHj
 +DBCyPIEf7Myz5u2eebcccJK1GhatoYgWRAn9u6/hx3eLzgc6yDZpT0DbGZeqrIsxVy0
 MWOGzNy1ZJc3Y1AzaPB/KCHt1qRh6XZ3/aS55BAmF+xfDQhiQ6MSAI6I/s870uy88oLD
 B8qFjM3s8ixGcMg26tII9h+aMEs3oAt5IN56f2ExKguMu+wacxiRqK48y/Tgb9VayNGA
 E72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=5YF472UBEt2/+0TMmuAJ6M5CUqS69OAWnmeSQdznm4c=;
 b=M1SJ2UiZfFsLOHHupKW2YQb36D8SxiiS5kM02/gv9DGSuWZ1gu4TDyE7v1CWN7HlTM
 +lsoSQxtSvXNbde4BpLxcd8rI/XAH+gGphJcpBwKR+8ipxsML1n9nP7PUFtk4gECvu3K
 20YSbDfAN7tLe3NOpBgfLnRWFCAACu7DIw/QRGE+SH+Kg7CyeBJE4YVeAJq7vd8duQmp
 Ne/dldK9hMEWvr/q5YHC6DBfCqYhikYV3uXQUV43MJqzDMvdDfDpZbvxuZFDig4fnnHx
 ofXzYWVJMuib91SA3RjizPEeA1oMOPwkIfVQFf8957IgPaa44keLUoSH9NlPJy6iYDjV
 jp3g==
X-Gm-Message-State: AOAM531W12MpHeIZXzriYFSpVogLroxdN469S/w6eIAE1EMTwW5RR9bI
 F1nAI4tnZmjy0yemQJc2w6MUmHEEbjWC1Po=
X-Google-Smtp-Source: ABdhPJwZN53y2iru9thBQM3748jxF+GUaJNvT80PrAObXElBNXlNdj3eJA3jMrzwFwkCwnM8D+0mObmQfCh9oiQ=
X-Received: from tj2.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:187])
 (user=tjmercier job=sendgmr) by 2002:a81:f0c:0:b0:2d6:83ab:7605 with SMTP id
 12-20020a810f0c000000b002d683ab7605mr23417374ywp.150.1648440016871; Sun, 27
 Mar 2022 21:00:16 -0700 (PDT)
Date: Mon, 28 Mar 2022 03:59:46 +0000
In-Reply-To: <20220328035951.1817417-1-tjmercier@google.com>
Message-Id: <20220328035951.1817417-8-tjmercier@google.com>
Mime-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [RFC v4 7/8] binder: use __kernel_pid_t and __kernel_uid_t for
 userspace
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, 
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>
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
Cc: linux-doc@vger.kernel.org, Kenny.Ho@amd.com, kaleshsingh@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, mkoutny@suse.com,
 linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
 cgroups@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel interface should use types that the kernel defines instead of
pid_t and uid_t, whose definiton is owned by libc. This fixes the header
so that it can be included without first including sys/types.h.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 include/uapi/linux/android/binder.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/android/binder.h
index 169fd5069a1a..aa28454dbca3 100644
--- a/include/uapi/linux/android/binder.h
+++ b/include/uapi/linux/android/binder.h
@@ -289,8 +289,8 @@ struct binder_transaction_data {
 
 	/* General information about the transaction. */
 	__u32	        flags;
-	pid_t		sender_pid;
-	uid_t		sender_euid;
+	__kernel_pid_t	sender_pid;
+	__kernel_uid_t	sender_euid;
 	binder_size_t	data_size;	/* number of bytes of data */
 	binder_size_t	offsets_size;	/* number of bytes of offsets */
 
-- 
2.35.1.1021.g381101b075-goog

