Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A1256E90
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 16:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5986E45F;
	Sun, 30 Aug 2020 14:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EBB6E45F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 14:20:34 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id u3so3948020qkd.9
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KCiOSennHEZukxfKuX01u3ytG0Ubl4QOaKCxwhG2yKg=;
 b=ZnGsN+gbqSPwD6yKY4E8I5NhEgfpyl1xG1Is0GLTq7HoHPJB7S9tNM/kIxazTCXVSj
 Bq5etIIUKHsNf5KmC9DWx3Zc72MzsY6JOjfPdMNzMYlP0LGhK/o6XA01Ptq8YxCEg2NZ
 9SqrRUtif6kb4bXtK6OKawUE4QMOTAe5P4MBUZ8RKgcXL6UbMKvpLwmdTRm8DRbKP0cT
 0eOVyKRBSWW8OM+e98Uaty5uSd6ssq5TdKR3wq4gFMI1RUKpYFrRjWlq+RGd8ViDHbeT
 mbA2U0tAOt94E0WXZB4NQqKBTXPdQZWvYB/TwVbQUtWmw3qQEPK5F2wzNSRqHkf+qCLA
 T4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KCiOSennHEZukxfKuX01u3ytG0Ubl4QOaKCxwhG2yKg=;
 b=V3BIHnlY8zo/ReOLjSe1mlCbH18VaWCXX8MjZVooNN21jr7csy+oIBk6x+K4ObWGhr
 T3Wx4o1rUQjfAhtqav1baYx1X2vfTfpoGEkLg1MROqcrwALczNfLxaOEvxj+q5P6foYU
 OVnUuwXC8Rl2AlE6gWaWf3JSA3PzAoCVi99IEmzVCsq6hPmU82rIf90ZZxpt0XJvdAGo
 iDpkmTZQXeuZ38OY7ikCkrVHMTo3lKP8isnYCrncY047XvVlwirqAn6mnlEefFHFujdD
 9IhvzXXPlHxnVfrfQpUKMIcmT3teTrbEUNA258ZlyYzUf/k+1wdj5Za8vQKON9sJ5G8N
 6Xbg==
X-Gm-Message-State: AOAM5339DSoWmftwbBkXg8234WZ/dqbm/oYsq44XEt2jz3AR4pQj9MI0
 asfWCeFX1quX5YfrDvjyUYQ=
X-Google-Smtp-Source: ABdhPJz3R6QXaB8qksylHiEc4ZYhxpg+xWEWOwkAnGW9vU9BuqB/RCzwdzI1Cw9RO8pLZN9Zu4jKOA==
X-Received: by 2002:a37:4b84:: with SMTP id y126mr6824524qka.148.1598797234133; 
 Sun, 30 Aug 2020 07:20:34 -0700 (PDT)
Received: from atma2.hitronhub.home ([2607:fea8:56e0:6d60::2db6])
 by smtp.gmail.com with ESMTPSA id o72sm5884861qka.113.2020.08.30.07.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 07:20:33 -0700 (PDT)
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/3] drm/vkms: Introduces writeback support
Date: Sun, 30 Aug 2020 10:19:57 -0400
Message-Id: <20200830142000.146706-1-rodrigosiqueiramelo@gmail.com>
X-Mailer: git-send-email 2.28.0
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
Cc: daniels@collabora.com, Liviu Dudau <liviu.dudau@arm.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, melissa.srw@gmail.com,
 Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the V5 version of a series that introduces the writeback support
to VKMS. The first two patches of this series are a pre-work for the
latest patch that adds the writeback connector, this patchset can be seen
in two parts:

* A pre-work that aims to make vkms composer operations a little bit more
  generic; these patches try to centralize the vkms framebuffer operations.
* The final patch enables the support for writeback in vkms.

In the previous review, Emil suggested multiple changes in the series. I
tried to apply most of the recommendations except for some suggestions
which I was not able to incorporate due to compilation issues, or other
suggestions that may complicate this series review. I left some changes
for future patches for keeping this patchset simple with the hope of
landing this feature soon in order to support VKMS user's requirements.
Emil, let me know if you want me to change any other thing.

It is important to highlight that from the previous series to the
current version of this patchset we had some changes in the VKMS that
made it unstable.  In particular, our previous writeback series stopped
working properly due to changes in our commit tail.  Thanks to Melissa
working in the instability issue and her latest fixes to VKMS, I finally
could update writeback and make it work again. The main update in the
latest patch is the use of vkms_set_composer when the writeback work
starts (enable composer) and after the writeback end (disable composer).

V6:
- Rebase and tiny fixes

Best regards

Rodrigo Siqueira (3):
  drm/vkms: Decouple crc operations from composer
  drm/vkms: Compute CRC without change input data
  drm/vkms: Add support for writeback

 drivers/gpu/drm/vkms/Makefile         |   9 +-
 drivers/gpu/drm/vkms/vkms_composer.c  |  98 ++++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.h       |  11 +-
 drivers/gpu/drm/vkms/vkms_output.c    |   4 +
 drivers/gpu/drm/vkms/vkms_writeback.c | 142 ++++++++++++++++++++++++++
 5 files changed, 228 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_writeback.c

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
