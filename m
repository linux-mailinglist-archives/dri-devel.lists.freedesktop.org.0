Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACAA7990C5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFFF10E945;
	Fri,  8 Sep 2023 20:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F0A10E945
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694203395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2kuY7QrN77OjYcmiIgmsp8RgTy5tijHIGRui0VqTUY=;
 b=YHGKXckgsjque6xCaA5yfWv/1EXAAMjhBHSOfCTfmLo2r55M/nu/lI935Pcx1UcoCjvUeK
 18AaheRGeRyN4FYAyVr7FAzhUOXWPiKYgTwEby63dqMWGO2psxkKFg7crGEUDjNHo7OlvZ
 71VgVJex/qwmbkgj2jSuUtFwJJMXAMM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-4TUAXoLwP1KnfLPh-D6ubA-1; Fri, 08 Sep 2023 16:03:12 -0400
X-MC-Unique: 4TUAXoLwP1KnfLPh-D6ubA-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-76f191e26f5so58809485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 13:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694203391; x=1694808191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2kuY7QrN77OjYcmiIgmsp8RgTy5tijHIGRui0VqTUY=;
 b=c8C15lx2udjGTcXkVDab+Gw9XKnS5FFMD01hh3VBr0cVAhmlX1MVy25xh2skkwIaxz
 rmXPRB41a2H/Nq5f4m29LwKKXxXkRMxX/gjC+sqMPZcMMH/Zl3bDlpTJsuGNer4JdbCh
 K8hrOjGfMXidobRiB/zli9LcXfAWymAIafiZWxwU76ZTYU64TmX1PA2DuSYJbAOWAmLw
 5Urlp7g//bn2aOX3RzWK5OmVAFbwVtN0h26AoDhsBZvsKl88WRBhYIeTFkHT+lGYqjOb
 RQfvhnv5SUnknmH3t9J53QHeyskgCSnEUa/L84PfVtQ9wywfj0CW/R5wiBEYIQUN8BH5
 RkQw==
X-Gm-Message-State: AOJu0Yxr2l87LP/XvTudKLa4uTVIThbTxTI8YZL955te9P5riIVkHZww
 0OJhg6+anfVQvSB2G1WTTGuuNkGsYg+XtrXyuF/Bysffc/aVBJpmjiIFWNVY7R6zljCjKQVTGn9
 sBJ7CXHL5wE9i6qaDkQuaZD0j0+J5
X-Received: by 2002:a05:620a:46a6:b0:75b:23a1:69ee with SMTP id
 bq38-20020a05620a46a600b0075b23a169eemr3480482qkb.5.1694203391483; 
 Fri, 08 Sep 2023 13:03:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuCpViWH7IrGzpUqlTBi1h+iY/5ABj5ubmz/i5MJtwSQDaqOps3aQUe1r5isWfpnPKjPasBg==
X-Received: by 2002:a05:620a:46a6:b0:75b:23a1:69ee with SMTP id
 bq38-20020a05620a46a600b0075b23a169eemr3480460qkb.5.1694203391259; 
 Fri, 08 Sep 2023 13:03:11 -0700 (PDT)
Received: from fedorinator.redhat.com
 ([2001:9e8:32da:e500:513e:fbe9:e455:ae67])
 by smtp.gmail.com with ESMTPSA id
 c17-20020ae9e211000000b0076f15f2918fsm825920qkc.63.2023.09.08.13.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 13:03:10 -0700 (PDT)
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
Subject: [PATCH v2 3/5] kernel: watch_queue: copy user-array safely
Date: Fri,  8 Sep 2023 21:59:42 +0200
Message-ID: <b333514f0be426385b5215b47d24062b4f551584.1694202430.git.pstanner@redhat.com>
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

