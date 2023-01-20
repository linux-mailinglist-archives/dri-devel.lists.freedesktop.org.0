Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E2F675428
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8490610EA36;
	Fri, 20 Jan 2023 12:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC9210EA34
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674216518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EorP74j3x4AQpp4pYb79LEKPx0NRfoi7hoT0sE5jwxk=;
 b=g8FAOpfL7N9sp9mzPADjbpQpb7G+UttcA4Pwz3Slt979owvJsU4/dDUVaSFXz4adMKtQdF
 Ggr6BvPHWGv2vUvxyf9mpOZso2AcO3/Kw3V0C7V4IdOzU3z2dMTWVD0NrUZdKSVhkdS+sb
 +eEqr/alDf2Osq8zOh+Bulxbjy9fIPI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-VJqEU2OnO--HZdVJXNjBOA-1; Fri, 20 Jan 2023 07:08:28 -0500
X-MC-Unique: VJqEU2OnO--HZdVJXNjBOA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j8-20020a05600c190800b003db2dc83dafso1496894wmq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EorP74j3x4AQpp4pYb79LEKPx0NRfoi7hoT0sE5jwxk=;
 b=RpWWMpUdZAzGVE7fgNBXap2HlWSGEZJgsVlCV2VXbRVvzg3RcBwLEQorhDXajAgKNc
 I9xpUopyWVnGSE82c6m50rBH+MqONC2yakxxpUVboglFOfV1+Ihj+5Z7kV1rGWB2b+vT
 66QkJVRLMj9smy10dQFiYgL025U6dsXgcY5Eo2FYrAfLJJetXr4RYvv3061i10Rc6hUS
 ZHHvVpTDKQiqiaTjzvYX65XpN6FgU3tjvXsxihwvUycfvvxYob1rjaFpNDOpS2JtAOvB
 8WXtEJMaksnhbr27pzTN1HzgChl/YYxm8ax46aJLNlpqpSNw5Pi4jQP4ez4/mbLV0hxr
 NwGQ==
X-Gm-Message-State: AFqh2koqgzBBdmkP78CoKL7cxkQ0pyGMGYVwNfU17KpzMFZod116EDPj
 3TIoiek/xcKrmwrZ3rP7SRs642WINslDoiKBeof5z7K63pxlUr5OUp6y5OxWhmolwUfWOaO89+z
 JNBUHSsAXXgGkTm1L6jFjvoxNXT2q
X-Received: by 2002:adf:c645:0:b0:2bf:81e9:cdc5 with SMTP id
 u5-20020adfc645000000b002bf81e9cdc5mr954315wrg.42.1674216507050; 
 Fri, 20 Jan 2023 04:08:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtxVGUJbmsvWQFDyiPS9CLawvVjvF3wsxeOlNhZMZ27WAF18x2qJNgpWWaTBA3nDIrWCUDtEA==
X-Received: by 2002:adf:c645:0:b0:2bf:81e9:cdc5 with SMTP id
 u5-20020adfc645000000b002bf81e9cdc5mr954296wrg.42.1674216506809; 
 Fri, 20 Jan 2023 04:08:26 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b002bbb2d43f65sm32766336wrx.14.2023.01.20.04.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:08:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Fixes and cleanup for DRM fbdev emulation and deferred I/O
Date: Fri, 20 Jan 2023 13:08:19 +0100
Message-Id: <20230120120822.2536032-1-javierm@redhat.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series contains two fixes and a cleanup for things that I noticed
while debugging a regression in the fbdev emulation for a DRM driver.

The first two patches are trivial and shoulnd't be controversial, the third
patch is less trivial, but it has been already reviewed by Thomas and I did
test it to make sure that works as expected. With it, I got rid of the WARN
that happened due a mutex used after it has been destroyed.

Best regards,
Javier


Javier Martinez Canillas (3):
  fbdev: Remove unused struct fb_deferred_io .first_io field
  drm/fb-helper: Check fb_deferred_io_init() return value
  drm/fb-helper: Use a per-driver FB deferred I/O handler

 drivers/gpu/drm/drm_fbdev_generic.c | 15 ++++++++-------
 drivers/video/fbdev/core/fb_defio.c |  4 ----
 include/drm/drm_fb_helper.h         | 10 ++++++++++
 include/linux/fb.h                  |  1 -
 4 files changed, 18 insertions(+), 12 deletions(-)

-- 
2.39.0

