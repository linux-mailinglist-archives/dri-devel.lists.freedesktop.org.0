Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6752F87D11E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 17:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA887112354;
	Fri, 15 Mar 2024 16:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="R7b9bhqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DBC1121C2;
 Fri, 15 Mar 2024 11:39:03 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a3ddc13bbb3so562203266b.0; 
 Fri, 15 Mar 2024 04:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1710502742; x=1711107542;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ajSGsc6A/F/qkby1cV3DFijz3ujuoh7yFblhBSAWTk4=;
 b=R7b9bhqnJUp3E8d4suy65iFCwcwScI5+MICGcrLDUXNqM3Ghlr9uZXCebETrFQU/85
 udeRglq0rpnFTtlbJbfPLyQxMb5crhiFP82FIlQdK9ajEECeU1gdfdV1ErGRA49UoZgd
 i0FFBFTIZuanV9Jx0/QZyVj4uNojq1jKZxKOY7COHIwji6l8bwss1UVyyHMbeCfPtyNC
 MW8qwNuRIO8R0T5BXDBaJzIvPg/lBwW2a423dpOMYJ/iCAg3V7E3EgDlO4MnfWqjWTvY
 3SD/fZ5WRkVs2E7m6ULHhobxdCEfc/8UKVKYLrO17QV9YK112znBKsaptSqt6k5xTHzA
 91KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710502742; x=1711107542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ajSGsc6A/F/qkby1cV3DFijz3ujuoh7yFblhBSAWTk4=;
 b=FKQJQKPQ0qJ8mnjEN+VnMNTvm9vmH79kaK/fUseD9lC/VsbzXl9MiUKYJHD93OnZNd
 8BxuvwmqNBP8NaEvl1KPS97vfV82GGX+MAGeKfxMWQdjF/49IzGgJ2HGZ8Wlg2xDvwmb
 DJg42uE1tfAEtXNH6KlqcivvR+jtambpFcTqLAdyDgGLt6f7AIGOH4XFBeakkBE2Rmrg
 zmsE6ijWw90dytFc01NRJ6Q2f9l+w+4lZfy2i9QtHhdysK+KH9lbkgWNxdfEXlPvMSQG
 DNwUGxAnpvQKiB4WiS4JCSbLlPjU3C1PnQLRgXATSPxAIoftGA8s0eO4Kk/MOB63Y5Mo
 HIJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfhAlF7tsmzg4IjzoEEqtvr/LeQfOQ5jERQ9U04iuqUNmh5Q86LbWflH/RUoLA+ObkT49SxtAXdwVz1Wf3gZV7OFL6AudL9e2moiKSsS4cyCP/r+Eyn2Y9w9766JocBwEvqE1Y83iHby5QUEX9TQ==
X-Gm-Message-State: AOJu0Yzwep3sB55R2PiKRL6WYwOHSpPPHJxlHxd+vSTGh825+cpDIQ2N
 2IWVLiOPTjl89XTw98K8xFVi0pjrZgbkRkBfo9mOpS1bR34cftPc
X-Google-Smtp-Source: AGHT+IHJJjdK95FxiFWtuKqFb5okKLCX+Xl17xr9ZeV/oMTb5MlWFKMC//tYf9kBKFRK8DaZbTEwfQ==
X-Received: by 2002:a17:906:1501:b0:a45:d7fb:8423 with SMTP id
 b1-20020a170906150100b00a45d7fb8423mr7825935ejd.9.1710502741739; 
 Fri, 15 Mar 2024 04:39:01 -0700 (PDT)
Received: from ddev.DebianHome
 (dynamic-095-119-217-226.95.119.pool.telefonica.de. [95.119.217.226])
 by smtp.gmail.com with ESMTPSA id
 fg3-20020a056402548300b005682f47aea7sm1610024edb.94.2024.03.15.04.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 04:39:01 -0700 (PDT)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: linux-security-module@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-s390@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH 05/10] drivers: use new capable_any functionality
Date: Fri, 15 Mar 2024 12:37:26 +0100
Message-ID: <20240315113828.258005-5-cgzones@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240315113828.258005-1-cgzones@googlemail.com>
References: <20240315113828.258005-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 15 Mar 2024 16:22:04 +0000
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

Use the new added capable_any function in appropriate cases, where a
task is required to have any of two capabilities.

Reorder CAP_SYS_ADMIN last.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> (s390 portion)
---
v4:
   Additional usage in kfd_ioctl()
v3:
   rename to capable_any()
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 3 +--
 drivers/net/caif/caif_serial.c           | 2 +-
 drivers/s390/block/dasd_eckd.c           | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index dfa8c69532d4..8c7ebca01c17 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3290,8 +3290,7 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	 * more priviledged access.
 	 */
 	if (unlikely(ioctl->flags & KFD_IOC_FLAG_CHECKPOINT_RESTORE)) {
-		if (!capable(CAP_CHECKPOINT_RESTORE) &&
-						!capable(CAP_SYS_ADMIN)) {
+		if (!capable_any(CAP_CHECKPOINT_RESTORE, CAP_SYS_ADMIN)) {
 			retcode = -EACCES;
 			goto err_i1;
 		}
diff --git a/drivers/net/caif/caif_serial.c b/drivers/net/caif/caif_serial.c
index ed3a589def6b..e908b9ce57dc 100644
--- a/drivers/net/caif/caif_serial.c
+++ b/drivers/net/caif/caif_serial.c
@@ -326,7 +326,7 @@ static int ldisc_open(struct tty_struct *tty)
 	/* No write no play */
 	if (tty->ops->write == NULL)
 		return -EOPNOTSUPP;
-	if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_TTY_CONFIG))
+	if (!capable_any(CAP_SYS_TTY_CONFIG, CAP_SYS_ADMIN))
 		return -EPERM;
 
 	/* release devices to avoid name collision */
diff --git a/drivers/s390/block/dasd_eckd.c b/drivers/s390/block/dasd_eckd.c
index 373c1a86c33e..8f9a5136306a 100644
--- a/drivers/s390/block/dasd_eckd.c
+++ b/drivers/s390/block/dasd_eckd.c
@@ -5384,7 +5384,7 @@ static int dasd_symm_io(struct dasd_device *device, void __user *argp)
 	char psf0, psf1;
 	int rc;
 
-	if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_RAWIO))
+	if (!capable_any(CAP_SYS_RAWIO, CAP_SYS_ADMIN))
 		return -EACCES;
 	psf0 = psf1 = 0;
 
-- 
2.43.0

