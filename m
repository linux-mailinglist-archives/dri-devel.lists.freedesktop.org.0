Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE0151CD6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 16:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3143C6E84B;
	Tue,  4 Feb 2020 15:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D284C6E84A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 15:01:52 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m16so23438330wrx.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 07:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2TaMJrIJ5n08Na/DcVmgaH4dlvanQpaf+3zXT6+tAk=;
 b=Gr1HjKCpQTnTjqKMa0an4AkNwrviw9FlNK4ai/ryZ5sc8LpKHfuh15lBTxb9A5AB23
 1u3e0RvhfHsBjjw71MNQeZEQ7vlyYI04lSZEVNWoQ1lArKql+knQ7oV6QbYz6sJglp7g
 EplVGlkph2rpiz+Q2PURGtSwSGAdk3bb1qz6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2TaMJrIJ5n08Na/DcVmgaH4dlvanQpaf+3zXT6+tAk=;
 b=k3WdtIlRINIgg3wfUvaHTxKYKapAsiUqxhd6jMOkehxV1ngaBhbjtfsOd5xE+Trv0f
 Q+5KsqEaZ0KkATX/TLePBsYe+8tX6MT8F5M8nSzMwn51hI3+DRz1apxb1Y5A9mCvfivE
 vEC+UiUMg5A0EUiD5s6ro29ukt/m9/xCIr9iFbAB419ZD7XCI8PeAJJyXw1WD77pRD+5
 z1Qx4Tv2XfULIU5X0RW38rmW/fdTDwGHzChzW7xoXg+tU8I+R1jKY82qHeEqX8WOIN1V
 7BCXCl5s999wqPh+CA6ZOS9j13HJ2COW5c4tXge7c2ft/k5vyX502hcgvNew9pWF4mtW
 ZzwA==
X-Gm-Message-State: APjAAAXKbcf7IZYp/qgecpiiUw8HuOetAY7fi4OXVuLtMQefkU56KUM8
 uNmhA3/zNlv6GZOPs7wxcs5m6gKZYy2XeQ==
X-Google-Smtp-Source: APXvYqx5pJTkHsARvBhUIiIbe0LDAMyotywEFpdOy3h+w6cpVuZ9JIrhjeHuIfZZTNS6vUvUkm/rGQ==
X-Received: by 2002:adf:cd11:: with SMTP id w17mr22616959wrm.66.1580828511261; 
 Tue, 04 Feb 2020 07:01:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d9sm14428921wrx.94.2020.02.04.07.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 07:01:50 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/5] disable drm_global_mutex for most drivers, take 2
Date: Tue,  4 Feb 2020 16:01:41 +0100
Message-Id: <20200204150146.2006481-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CI didn't like my test-with tag :-/

Test-with: 20200128112549.172135-1-daniel.vetter@ffwll.ch

Daniel Vetter (5):
  drm: Complain if drivers still use the ->load callback
  drm/fbdev-helper: don't force restores
  drm/client: Rename _force to _locked
  drm: Push drm_global_mutex locking in drm_open
  drm: Nerf drm_global_mutex BKL for good drivers

 drivers/gpu/drm/drm_client_modeset.c | 12 +++++---
 drivers/gpu/drm/drm_drv.c            | 26 +++++++++-------
 drivers/gpu/drm/drm_fb_helper.c      | 16 ++--------
 drivers/gpu/drm/drm_file.c           | 46 ++++++++++++++++++++++++++--
 drivers/gpu/drm/drm_internal.h       |  1 +
 include/drm/drm_client.h             |  7 ++++-
 include/drm/drm_drv.h                |  3 ++
 7 files changed, 79 insertions(+), 32 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
