Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC1356395C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 20:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A6E18ACA7;
	Fri,  1 Jul 2022 18:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2056D18ACB3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 18:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656701596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CdygpZqh9NvpmiEiKhKOinbjqxdLDChD2fJR1JgBJ3I=;
 b=RbaJ91tub7EaXgMFhqNn32xfbqQ6p6nGEsZMI7rikDorxS5nDZPW7fKuTzw8gw5uWEKjPv
 EgDvC/XcOSGFO7kgTdDQv9YIusgHCj7QMFKfgy5pZc3QCwt9MJVB/UlIkbH4+kXq8WJuhz
 Vd462ZvibOYTEz93kQ3R0DXSDi8+f2Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-OR3mvfU6MnaG1C1IrqyfPA-1; Fri, 01 Jul 2022 14:53:14 -0400
X-MC-Unique: OR3mvfU6MnaG1C1IrqyfPA-1
Received: by mail-ed1-f72.google.com with SMTP id
 q18-20020a056402519200b004358ce90d97so2274757edd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 11:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CdygpZqh9NvpmiEiKhKOinbjqxdLDChD2fJR1JgBJ3I=;
 b=6L3IqDUbYoeLnGeQVcU9rWGKRd38buRAUNxnUPOub4gake139iegRF/H9h733O3pTk
 Lrm5B6TTDyq09rvF5Eg8IJViqwkp+wgGkBPIaGhoAVsA3YXNI0tP9ZUT/NSGqNIbrfnF
 7N7S40ogzdWJG38/CmufANLX+UzaRFve/KkVA6wUVwhdaHiU89651cngkN43Vwx57MS+
 7BBxfjcEH6fzkNWsGUMInBAhmXgwb9h+fZrPxvw530nHx1awz5AAQ9OC3SbpbgXnnI6B
 l1U547nTFnMaE9mMYMV3TtY27KQYbPLJ+K0HTRDVXXMIYFZXsVP4fndCEr5RtsEdJ/gK
 ip6g==
X-Gm-Message-State: AJIora8nKoBISrjvbnfyt6pbYH7WNmNSXt97aqOU9c7UYZCKocZO7zY1
 86lOlEz/zm68MKHIuL8nTy5Mr3LHv4s4bvc1jcMAwLx/8HgXe96Grx2PXXZv6Lahz4ppX6Fx1Pp
 VRLa5GaVZFRwzjvSXiirUilIHZhd0
X-Received: by 2002:a17:907:1c11:b0:726:851e:179e with SMTP id
 nc17-20020a1709071c1100b00726851e179emr16035592ejc.39.1656701593201; 
 Fri, 01 Jul 2022 11:53:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s0Fdu/TsECHntNJrudLVig+OOZhMwqESCp2Ml9dWHu45h34F9jhd9i+N3vVzxtmd/q3deigw==
X-Received: by 2002:a17:907:1c11:b0:726:851e:179e with SMTP id
 nc17-20020a1709071c1100b00726851e179emr16035577ejc.39.1656701593048; 
 Fri, 01 Jul 2022 11:53:13 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a0564020b7900b004359dafe822sm15406658edb.29.2022.07.01.11.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 11:53:12 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 03/10] drm: use idr_init_base() to initialize master->magic_map
Date: Fri,  1 Jul 2022 20:52:56 +0200
Message-Id: <20220701185303.284082-4-dakr@redhat.com>
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
 drivers/gpu/drm/drm_auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 6e433d465f41..63395bebaa6b 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -140,7 +140,7 @@ struct drm_master *drm_master_create(struct drm_device *dev)
 
 	kref_init(&master->refcount);
 	drm_master_legacy_init(master);
-	idr_init(&master->magic_map);
+	idr_init_base(&master->magic_map, 1);
 	master->dev = dev;
 
 	/* initialize the tree of output resource lessees */
-- 
2.36.1

