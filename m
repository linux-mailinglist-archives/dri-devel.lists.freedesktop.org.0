Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20F7A8071
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7A010E4A0;
	Wed, 20 Sep 2023 12:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE02F10E4A0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695213432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KRPqkETTBVBC/zv1aXEUiiiXJ1Cft936yka0iGNazc=;
 b=GDssDO8BIGhK6TKMZh04cGJJnpoaaAjR4Dkx9sAIlFD1POzPVWi4Zot2wniwcVPb+TQMwX
 VkZNBuiV2wuvq60oXW+bmakbfa8VIYK3nwbn7CJfPH9+rGZKxxBbIbrAwkZTZ4dXlC5CPi
 n6nDeuOtyyiclJLWf7fxdpy5lAxOiB8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-yx_31ZEgMM-B6ghO52NY_w-1; Wed, 20 Sep 2023 08:37:10 -0400
X-MC-Unique: yx_31ZEgMM-B6ghO52NY_w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-404daa4f5a7so15032565e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 05:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695213429; x=1695818229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7KRPqkETTBVBC/zv1aXEUiiiXJ1Cft936yka0iGNazc=;
 b=cpnBF9zxIhNXpXisO9Qxv+JJMv7vyE6VkyKJmwNAZIybA31/o4lPRbzG8Q8wBDaDv5
 OV4/5EGJb2bDig5jputUNSFzWa7EKyJ6HBm14EIFVts6KLkDolPWPeXKMMAJgz462h++
 rsT2lr/i8VyaoEqof2kWP5eFDU38EUiI8bLIVziZtDlT/TcLHhz3G86uRSwaoqyz/FZY
 rj35axZqp2kIS4dZMAZMpXFP8uylak4x53OKFL1vdXS1drK2SFr5oY8MpnoYww97zDhb
 TJUr8ixFjg+voJUwt9J6DvRFlzjxpzaXpoydEslAvDEcL9j/EpytAkT7vlGVGfuCLIqC
 XJuQ==
X-Gm-Message-State: AOJu0YzVuWVmaERtNJXfp+e0eisGs4SB9sn1cGMiD2hmCbUIcQILE4NM
 PW0qDqGSHUrnIsr0WKPhuAmitvuAhS2XY58C0TBQGCq96CzTzKn4ijALuyRck1QE7JdDtTD/aIG
 Mve8kx+Y1b7rbJgASyt7X9GQYhX0j
X-Received: by 2002:adf:ec48:0:b0:317:630d:1e8e with SMTP id
 w8-20020adfec48000000b00317630d1e8emr2031495wrn.2.1695213429447; 
 Wed, 20 Sep 2023 05:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGorWXFxi2CZ+i0Bq4z7I+sy7K13wS44rMjIuskory3+gtAyjUda2GeiUfH2k5vq773C10/rA==
X-Received: by 2002:adf:ec48:0:b0:317:630d:1e8e with SMTP id
 w8-20020adfec48000000b00317630d1e8emr2031462wrn.2.1695213429120; 
 Wed, 20 Sep 2023 05:37:09 -0700 (PDT)
Received: from fedorinator.. ([2a01:599:906:7772:a505:d891:dcff:9565])
 by smtp.gmail.com with ESMTPSA id
 lg13-20020a170906f88d00b009ad88839665sm9297787ejb.70.2023.09.20.05.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 05:37:03 -0700 (PDT)
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
Subject: [PATCH v3 4/5] drm_lease.c: copy user-array safely
Date: Wed, 20 Sep 2023 14:36:12 +0200
Message-ID: <20230920123612.16914-6-pstanner@redhat.com>
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
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Zack Rusin <zackr@vmware.com>
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

