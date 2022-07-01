Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C6563978
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 21:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212D418AD7B;
	Fri,  1 Jul 2022 19:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F54F18AD7C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656702158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LWfDQABAaX6JpmqkFhW71LBBJJ2YX+O6PnBrulbv00=;
 b=QbO2glVdHRRRaeephBAIkF4ZKKCXv8YVg30iHHxt0JhU4gC4GijWVwhpy1ez2UYRtq3DDC
 IbmgjDf53wM7rJRasiTarxW3Mbobz4HlryLlo19fWlTHdl6NvA9rEyQWYPf/tGKpEhF6hq
 eAhOUDjXMgAXJIvxbWaL4rO5FjxQRxs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-i7qYTWxEM7Kl7EFBYW6kSw-1; Fri, 01 Jul 2022 15:02:37 -0400
X-MC-Unique: i7qYTWxEM7Kl7EFBYW6kSw-1
Received: by mail-wm1-f70.google.com with SMTP id
 e24-20020a05600c219800b003a0471b1904so3422769wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 12:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5LWfDQABAaX6JpmqkFhW71LBBJJ2YX+O6PnBrulbv00=;
 b=6/dTgZofI4iVFP03zbHac1YHVNcHKu3hWDtvXViBbCdbFdvKeZNZ+u7H06ypReEF7U
 Wr0ziCQe5tiiRpiMw7d12oQWa8vPksI+afrPI73ERg4UDprBBMVPNg0jmdmpWJI5fnEa
 di+zF87uffUezNbn3+Xvs+T422qgDyHE+VEEyPvF7Uwe7XoBtovZVJfKva6pKZ7isReO
 EoT4amVUOIVqQcoh/Pah7ktZuGTIMWV+szhziV5cLJPN0qycS677/wDhR4c8xNzn91va
 YLZlrp/WycgmOjsWGCnAOGMTyD1QjhjOFhWVE0makQnnhgJ0393HGd3vrJkZtgRJEHUQ
 kMqw==
X-Gm-Message-State: AJIora+6tbLdb/QWHl/8Ae+r/PPRnS3CT6P0zVA2bqyC1R/MK8yEYtPV
 TvV29Y147ta8RAwUgoSvvdbSlUWa5lflzY/tUowt4zRx6RYHSSOHJuVdJqFqWLDxGjQiPsgfJsF
 Tn6kHvR77PpS+IlLCMZ8d/BFd/2nd
X-Received: by 2002:a5d:420f:0:b0:21d:54a1:691c with SMTP id
 n15-20020a5d420f000000b0021d54a1691cmr599963wrq.40.1656702156601; 
 Fri, 01 Jul 2022 12:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1slXnmlpnnf2Fh346beEHXPcik49nkXMKD8QypwkLs3wJX8XDvqeUcc8EozNRusoL1OG6yUpQ==
X-Received: by 2002:a5d:420f:0:b0:21d:54a1:691c with SMTP id
 n15-20020a5d420f000000b0021d54a1691cmr599950wrq.40.1656702156446; 
 Fri, 01 Jul 2022 12:02:36 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0039c5642e430sm12535470wmq.20.2022.07.01.12.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 12:02:36 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 08/10] drm/v3d: use idr_init_base() to initialize
 v3d_priv->perfmon.idr
Date: Fri,  1 Jul 2022 21:02:25 +0200
Message-Id: <20220701190227.284783-1-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701185303.284082-1-dakr@redhat.com>
References: <20220701185303.284082-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danilo Krummrich <dakr@redhat.com>

idr_init_base(), implemented by commit 6ce711f27500 ("idr: Make 1-based
IDRs more efficient"), let us set an arbitrary base other than
idr_init(), which uses base 0.

Since, for this IDR, no ID < 1 is ever requested/allocated, using
idr_init_base(&idr, 1) avoids unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/v3d/v3d_perfmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index f6a88abccc7d..48aaaa972c49 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -95,7 +95,7 @@ struct v3d_perfmon *v3d_perfmon_find(struct v3d_file_priv *v3d_priv, int id)
 void v3d_perfmon_open_file(struct v3d_file_priv *v3d_priv)
 {
 	mutex_init(&v3d_priv->perfmon.lock);
-	idr_init(&v3d_priv->perfmon.idr);
+	idr_init_base(&v3d_priv->perfmon.idr, 1);
 }
 
 static int v3d_perfmon_idr_del(int id, void *elem, void *data)
-- 
2.36.1

