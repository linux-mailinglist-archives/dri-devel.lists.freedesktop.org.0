Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8500A5FA25F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 19:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F4F10E68B;
	Mon, 10 Oct 2022 17:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21E010E68C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665421334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qk5ghpsK8PDbqTdW6PF39RiS96AoGnZ+OQsYu95yzaM=;
 b=bULl6ig8vOXy1W7MOeZf0Y5jtrfT1yPvY5GzwXZs5fT/3syhYT9jD7bJi68NsjY4iL30IX
 Aw3ki5JmiPZ+b/0oKTZ+gQ6TqoGBN0HGhypG4QOk6N8k43Uwi9aaG7HjrIoD6+QREk113T
 /uRyOny3dEz4j5rrMMhXGoGrYvnBxoo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-2pJFQee9NUeRbz5Pb4x4-A-1; Mon, 10 Oct 2022 13:02:13 -0400
X-MC-Unique: 2pJFQee9NUeRbz5Pb4x4-A-1
Received: by mail-wr1-f69.google.com with SMTP id
 j8-20020adfa548000000b0022e2bf8f48fso2968087wrb.23
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qk5ghpsK8PDbqTdW6PF39RiS96AoGnZ+OQsYu95yzaM=;
 b=bQ3mAA1/gs467JyKABv4wGth/nmbNMR0tEoGRXTwH3AIWzqRLRfWJEm4J9Rx97mZD8
 19DS/VfJr4DQ94TSb3flTOWxkOE9Va6kRUD3Qa05EYIQzK1HDTAQwBV2z+pW5wjmQ0S1
 eP4+iqmnn0evEfhLEnIcwgjsrZzOhbcqHFW9ToF7jPXt5Mf/IDUGIxEcIYyIg8/Bfr1x
 6YVkIcIcgd9FE304IfE0Am2fNsYebbM5QwmdhXpHe1rvjSV+GabYYQd/31Dk7tXfOp46
 2oIs5vrMSdU7+EswSfnzEedTrc+z6pXvOz9gbaNa3Cx2XxxsWoTmtJUl5Xs9z7YkS1on
 Tgdg==
X-Gm-Message-State: ACrzQf0kmsQw6pIRvDh9+CecYf66ZkEOfsU8JjfcLGr+2TSpqtE9M/SF
 e4TB3fFNp//bYBkWivbY9RVtfd5sFZjAXbSSID1OeyFU6zfVnt8muFUB1VZS5ZXEfXI+fN1DZDs
 /do+w7dVBAxgzN08YRWdNbvdQ61eC
X-Received: by 2002:adf:f40e:0:b0:22e:2ce4:e6a2 with SMTP id
 g14-20020adff40e000000b0022e2ce4e6a2mr13064930wro.30.1665421332362; 
 Mon, 10 Oct 2022 10:02:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6wesICMOp8cUSjDeGz35jt9FwoGQdTtaZeMl/ecyL4tTVqGmDsyFU6F3dnEkiGT8nn8IDAsQ==
X-Received: by 2002:adf:f40e:0:b0:22e:2ce4:e6a2 with SMTP id
 g14-20020adff40e000000b0022e2ce4e6a2mr13064918wro.30.1665421332153; 
 Mon, 10 Oct 2022 10:02:12 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z5-20020a056000110500b0022b11a27e39sm9160551wrw.1.2022.10.10.10.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:02:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/simpledrm: Do not call
 drm_atomic_add_affected_planes()
Date: Mon, 10 Oct 2022 19:02:01 +0200
Message-Id: <20221010170203.274949-2-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010170203.274949-1-javierm@redhat.com>
References: <20221010170203.274949-1-javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no need to add planes to the atomic state. Remove the call
to drm_atomic_add_affected_planes() from simpledrm.

On full modesets, the DRM helpers already add a CRTC's planes to the
atomic state; see drm_atomic_helper_check_modeset(). There's no reason
to call drm_atomic_add_affected_planes() unconditionally in the CRTC's
atomic_check() in simpledrm. It's also too late, as the atomic_check()
of the added planes will not be called before the commit.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/tiny/simpledrm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index ecd49a8f3334..f03f17f62a56 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -549,17 +549,11 @@ static int simpledrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 					      struct drm_atomic_state *new_state)
 {
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
-	int ret;
 
 	if (!new_crtc_state->enable)
-		goto out;
-
-	ret = drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
-	if (ret)
-		return ret;
+		return 0;
 
-out:
-	return drm_atomic_add_affected_planes(new_state, crtc);
+	return drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
 }
 
 /*
-- 
2.37.3

