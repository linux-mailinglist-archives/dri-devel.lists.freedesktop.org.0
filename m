Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99E357B774
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6804F8B42B;
	Wed, 20 Jul 2022 13:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905DF8B3CF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SAU7g0XmtNHmK1D83ahVz2l+EzcgZOJWEbwKcBBevW4=;
 b=HjcqYtLRY0SERqxxqO6PSxuhkRE8TDQptXL0hyH6NOHr+st6gfwbxyu0xB2UpM3R60zCLC
 9FhCXOLBgp4kRcRU8yoQC9rUK4J7YmrlZTyBGUCzqp6qwamSzflkSTPKcF0mv8bfiTNQIY
 YdGr1TgC7LVYI1GmDc/V3cmkH8qxXDg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-vpOTzHesO220lcYWhd2qDw-1; Wed, 20 Jul 2022 09:28:44 -0400
X-MC-Unique: vpOTzHesO220lcYWhd2qDw-1
Received: by mail-ej1-f71.google.com with SMTP id
 gt38-20020a1709072da600b0072f21d7d12dso2174305ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SAU7g0XmtNHmK1D83ahVz2l+EzcgZOJWEbwKcBBevW4=;
 b=yXH4Mhvw3/mDpKRCb5qJ9XpfU3y5LfsZ+VqJWVy7R2L1VWAghVzFJKcIXJs17SMxWF
 CqBkls7B1eM/Vdq0n5iV/PQqzvcJwiChBWolBIXxd47nmP/63Ygs7GbTK/HdLrvbA89G
 2PrlE3AbTlQA3y+FS3OQZObqI5Rulk2UBwyQ11XhjyBMQx9SXNUCNcmo0/9eEc4rBzw6
 pk05L6K5zpr0UAE6JXKK2owP1az+uCHEaTDCNmMTC7Dj2aRDwOrw8//g9S2xbS1yBArw
 A6bA8oZ4noe3iN7uffz4SyNuEcYtSxy+mlk76y+nWBOWwDSq8lTOG1BIGuFZIZCZv6tr
 BKxA==
X-Gm-Message-State: AJIora+Ufr88IvbGkWPN0ofbDUbYcArRWBTda9y6MskdHdNfzd0J+pce
 QDbC4aai7r4C2EO8LYkiMuTeOqJkVnkqcPMmHp+aMyx3id1kYvFzfuRVzIAxzvNPBu0wFwNwiMj
 ryz7yPOyQuO4ufhS1yDbC+0+adTLF
X-Received: by 2002:aa7:c6d5:0:b0:43b:a52b:2e9d with SMTP id
 b21-20020aa7c6d5000000b0043ba52b2e9dmr7641383eds.55.1658323723285; 
 Wed, 20 Jul 2022 06:28:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+XJVzPyzWCIWUNCHkW1104cuBpXxWzX9K7AQTSOhaTvyBzI9SqYq7cbAFcGCNK4j3Viv8mQ==
X-Received: by 2002:aa7:c6d5:0:b0:43b:a52b:2e9d with SMTP id
 b21-20020aa7c6d5000000b0043ba52b2e9dmr7641368eds.55.1658323723147; 
 Wed, 20 Jul 2022 06:28:43 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:42 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 08/10] drm/v3d: use idr_init_base() to initialize
 v3d_priv->perfmon.idr
Date: Wed, 20 Jul 2022 15:28:28 +0200
Message-Id: <20220720132830.193747-9-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720132830.193747-1-dakr@redhat.com>
References: <20220720132830.193747-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init_base(), implemented by commit 6ce711f27500 ("idr: Make 1-based
IDRs more efficient"), let us set an arbitrary base other than
idr_init(), which uses base 0.

Since, for this IDR, no ID < 1 is ever requested/allocated, using
idr_init_base(&idr, 1) avoids unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Acked-by: Christian König <christian.koenig@amd.com>
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

