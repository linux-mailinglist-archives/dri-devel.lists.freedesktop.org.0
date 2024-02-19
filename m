Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CC085A2AA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4629710E2A1;
	Mon, 19 Feb 2024 12:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="SbFqWZ8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B514F10E17C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:00:12 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5d4a1e66750so3092947a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708344012; x=1708948812;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Y/y+wzHPYfd3SiHwSQB2gKjSO42jAZTbkJRHXD4vpAA=;
 b=NsA1ijQzVQx93luL6oMDfkFxrnpE3YcAAwwpz7HkTY6P8W8kdC+bUq14NhNzDMHDxV
 SQNJMNDDviaH4+ZPC4X+pmv+7YzWl4fB+Niriatt8vffMTj+Xtpf+RYD+tnTO2bA9WOG
 UiB8ScFfgc2Toc72NaRM74QcC//wGT/dcgxsQtyywDvT2B1rbQ4Az9AXZkKq1WicaJvt
 lsg6b5DvbexVyrFvMCaTWXnQdD7j4zIVZcpVJ0wlMzwmd31/YcMYbfKj03Tkd+DAIZ+6
 jaLIAXL9vfkcTFA7I+83OZuBWK0W3cb8/IPcy+7PLHFH8pz/H8+lGLitwK1Sy3h6Yuzc
 1V2w==
X-Gm-Message-State: AOJu0YzM/rjvFHekXSYuLHbmTEGQK8me/YZOTOcIgcUtYOae7a4ZCYD/
 ncRCwY7xW58YDUWi+GEDx+TRtBSKdIjFQ4NWhg+i3sE87NjYPD39
X-Google-Smtp-Source: AGHT+IFqlQY5V3p4tah87iC3Iam00vn1SMjTwNz28T3natSCKrRYMa//YfctcP/zWPa49vZ0F42pSQ==
X-Received: by 2002:a17:903:11c9:b0:1db:509a:5a31 with SMTP id
 q9-20020a17090311c900b001db509a5a31mr12250224plh.26.1708344010045; 
 Mon, 19 Feb 2024 04:00:10 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a170902ed1100b001dba356b96esm4223022pld.306.2024.02.19.04.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:00:09 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1708344007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y/y+wzHPYfd3SiHwSQB2gKjSO42jAZTbkJRHXD4vpAA=;
 b=SbFqWZ8miv9wQlNXq84nvC4QIffme1yj078sP+A9c+zX3ra44UwXA8zi9JAn0LjP5Cwqay
 eAnJGc1G45kkZX0dTq50UTr3hrFd01aR2wuphJ1Cfhs13/WcqYwlP8On4quNjO6L/h6nu/
 BZTxDQ9EtIHLMQ/tFaRj5m4yWffDmmSei2Ui4LWSfUVlQJ16zPLAoJz297CP3p+Ew5WQD9
 jJcyfGe3hMt14Knp21qNZlVUFa7ZzO8YOxiPjlb0MG7OoQClY9czp61i1VNtW1wtq2VISa
 /Bk2lJKv8zyZlOrmiXnAob216JTNZSusEUKJT2dCH0VX439uimzyJfOs0mtIAw==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH drm-misc 0/3] drm: constify the struct device_type usage
Date: Mon, 19 Feb 2024 09:00:50 -0300
Message-Id: <20240219-device_cleanup-drm-v1-0-e2f2acb38bff@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPJC02UC/x2MUQqDMBAFrxL224AJttpeRYqkm1ddaNKQUBHEu
 5v2c2BmdirIgkJ3tVPGKkU+sYJpFPHi4gwtvjLZ1natNTftq8SY+A0Xv0n7HDSA54X77jp4RzV
 MGS/Z/tORfkKQwvQ4jhMiAvDnbgAAAA==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=Km+H2S6VUJOVhwCV0HxwAGP/gwbHc7XavDH63KBqNTE=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl00L1CbIuZohfUxP4oQ+gIg5l/qdyFLnWxlC8b
 h+0jG70h3uJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZdNC9QAKCRDJC4p8Y4ZY
 ptUuEACiK2YVZzL6OtOLLulMgYsNOJGnIij/8clART7o4OFIxLJiEsdVMkGj9Ob+CNt4XNP7gjM
 jphzkppLod/SSoIvWcDAvPx9tU0sSNtJwM6ypDARr7MsSXEAqJuafTSSaeHxsCfq+YZn3CjUUEi
 UxBbKLhdCoJC2GQqPQhPJaCXTyI5JhkRje4ugtREtHYd307d6QaALR1N7c+Ze7huKGOcRTnP+Ok
 9Ragvxxf2Y96SxLmc8qXonskO+QtZ0/Dnoeg0jiWp60T1QVmsMf38rMbVLOqfam1j64EBzWKAhs
 B914RBT1yJD06xtoQEpc/nHTFkdpoEnRiRu9rXwer649r1cVIZ79yfXAPbTgxusHykOzBxW4diO
 lZ3U2x+2/AzuuVM/S/uIBEQ8SsdFGlmcCNZKUU60jljRS7Zb/EunUy9vg5B+m0AEvpqhoLDuKtk
 7C5XeoVX4KmEFosCw5xZzhvoejUOPIv7HcCt39KmXx8+8sbGzv3HB4JC7GAIM9i9YclIYTlivEb
 axBHa1YMa3qzzi1t3tr8YRRUDDBOxsH2vw0L2yyIteGbGBVAcE99omZtwF9bmP2VxjzxJzp0y6Q
 hxX/mLArUzublWYkRljX5K3Pwl2OonxL2KvHncF4M1Yy2wKvkFPF+4uZw/PyHcrprCt/rcsDxiD
 +AJWYhcnCF47VzA==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a simple and straight forward cleanup series that makes all device
types in the net subsystem constants. This has been possible since 2011 [1]
but not all occurrences were cleaned. I have been sweeping the tree to fix
them all.

---
[1] https://lore.kernel.org/all/1305850262-9575-5-git-send-email-gregkh@suse.de/

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Cc:  <dri-devel@lists.freedesktop.org>
Cc:  <linux-kernel@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

---
Ricardo B. Marliere (3):
      drm/dp: constify the struct device_type usage
      drm/privacy_screen: constify the struct device_type usage
      drm/sysfs: constify the struct device_type usage

 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 drivers/gpu/drm/drm_privacy_screen.c     | 2 +-
 drivers/gpu/drm/drm_sysfs.c              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: b59dcca97bf052341b9ac28b1ee1af46498b8833
change-id: 20240219-device_cleanup-drm-eeeb5c7468da

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

