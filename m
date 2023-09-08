Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5091E7990C6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2CD10E946;
	Fri,  8 Sep 2023 20:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05CE10E947
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694203403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOJpuwbwTVfs+j95sEE93OpkqtbclA96WzipEC/nM14=;
 b=R+yOEnSITKUZUNN7395GesmLmjRdJINa1km3D2joVyjCrFz5Hd9MSd55Gv0AP5Er+Dgc/p
 7TLg1LgLwBam4Ujjiml4Hp8iNkBMw+3LcNIbZRXvpR0i4fhvPHVkUshbu1tV828U1XFspg
 JBZZ2nBq14lxt1cdz52kHIZJb00ctRU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-T-RhxqjQNYe8NJNr21WZuw-1; Fri, 08 Sep 2023 16:03:20 -0400
X-MC-Unique: T-RhxqjQNYe8NJNr21WZuw-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4122119722eso4981661cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 13:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694203399; x=1694808199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOJpuwbwTVfs+j95sEE93OpkqtbclA96WzipEC/nM14=;
 b=seUMqLmAXjfl20s2ImJBOaaq8jijTaAb84mKsb5cL/lNYFoaki2aZ6wPYqBfVxKvAl
 xS3hPMeDtp5Hz/8DhhMv0K1yHCDeBf0lnNy/kYB48+lwzmzmsl4onGC6Y53Axalf8Ljd
 bKi+69LcHWbWyoqtjRdHs6YHkP0ipL66MVhXN8r6Cr6maRv8+qyfbnuR4njLsSPM29md
 P58ofCc6Mx4RjsbPKPCefMyKsnCDCi1qIuuz/+gwckuWQQ9jzZ+01y8TOIa0eoGO7j1n
 xSWvt3mkI0H+bpu2nee5Cu0+xEccYWh9q3l89QWDVVVoPxyTUUG8kJdZgITFH2sD2O/p
 3xLg==
X-Gm-Message-State: AOJu0YzaMZsrVHP1llprRms0CbYqhIKREqGGnRvqqtjo2VuOmUboPKCg
 1kDNPRMf1mRewzvizQ+aqZ3ZklqC4ojj/j7ssrhw9aUhyJ8oMhFsKZTA3UDY7yc4703mpVHspdM
 5v9KDe2ur1DiqEPldml+W+aL4550h
X-Received: by 2002:ac8:7e94:0:b0:412:12e8:8538 with SMTP id
 w20-20020ac87e94000000b0041212e88538mr3683936qtj.1.1694203399535; 
 Fri, 08 Sep 2023 13:03:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAKN1YnAkZtTcGtA674mV4f8NT9irZONaAKXTHG61Fqfz6xPH+/e15CARdB3FRUjLa10PQWg==
X-Received: by 2002:ac8:7e94:0:b0:412:12e8:8538 with SMTP id
 w20-20020ac87e94000000b0041212e88538mr3683913qtj.1.1694203399274; 
 Fri, 08 Sep 2023 13:03:19 -0700 (PDT)
Received: from fedorinator.redhat.com
 ([2001:9e8:32da:e500:513e:fbe9:e455:ae67])
 by smtp.gmail.com with ESMTPSA id
 bb37-20020a05622a1b2500b004116b082feesm843284qtb.75.2023.09.08.13.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 13:03:19 -0700 (PDT)
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
Subject: [PATCH v2 4/5] drm_lease.c: copy user-array safely
Date: Fri,  8 Sep 2023 21:59:43 +0200
Message-ID: <bca4966d616f417267ba02f66ff9891fceffd7f0.1694202430.git.pstanner@redhat.com>
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
 drivers/gpu/drm/drm_lease.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 150fe1555068..94375c6a5425 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -510,8 +510,8 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Handle leased objects, if any */
 	idr_init(&leases);
 	if (object_count != 0) {
-		object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
-					 array_size(object_count, sizeof(__u32)));
+		object_ids = memdup_array_user(u64_to_user_ptr(cl->object_ids),
+					       object_count, sizeof(__u32));
 		if (IS_ERR(object_ids)) {
 			ret = PTR_ERR(object_ids);
 			idr_destroy(&leases);
-- 
2.41.0

