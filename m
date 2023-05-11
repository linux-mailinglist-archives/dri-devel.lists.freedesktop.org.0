Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB697002F4
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 10:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE9710E639;
	Fri, 12 May 2023 08:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4720610E271;
 Thu, 11 May 2023 14:26:39 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc1612940so15770743a12.2; 
 Thu, 11 May 2023 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1683815197; x=1686407197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NuRohinkfnfKmQ5A0D+/nPSG9lRUGHQe+yhHKcHJQxc=;
 b=LtK1dCAhlTv//hzdt2MS3tcXcqmmZZ8Uq+ljdJNnuuCglgmhmm9NuHsu73nfpcQlSJ
 Oe1i6sin4+SziCfaxmajG9Mop1DS3VAV89W3M9GwqfL2NqFBqcZRlnBK7rAoWVLECKju
 QGLD6uMlpZNvfWHqc4hYTnnbHRI14zXMNpVgR3YjZSl8eED7DDP48pupvBdwHhlEzDjG
 dGIUFk34vfcb+AN0naBTlDjc46KrhjdmBFRxdbe2hO6F0EgKmzkvTETHjHMcwwMCMk2q
 R7pJ+d5SeSJeDn75IkxGfZ4fKQP589sMALN7ukmg6zahdU4e3DmKP7/1Or8+YvChH745
 uW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683815197; x=1686407197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NuRohinkfnfKmQ5A0D+/nPSG9lRUGHQe+yhHKcHJQxc=;
 b=k7FWPt1J9FljNOIlD9QKbPiJgy/NgxG0xoG1D5PqIbl9ba9qCbYMeUMgAnmCYUObzo
 +7AlUBxdr5DrlmIWk3DJdYDbykVYw7lQ2PfZmnk9dSW+6vHS2C8ubEEFYgFqovrRQFCc
 8dd54RJlVTjSWP1PQ+fN7GCZLmVcy8vN2lbhbEORuxUFpbW7kYsgAHHaBuAgz4/TfmJ9
 tY29p2aSM6FCZLrkKnQpXPSxoBsu6VU/2bTxvP/AtypKvSUDzfw7DUaXn7Iogka8sT0q
 mO3Yj2U95ONG2dsM14AYUUOICSbZO9eDU9HwGu9sQhf85s+8hMS+vs3CNcuf/+PcWw8E
 38ZQ==
X-Gm-Message-State: AC+VfDyCG/du1P/K6Co3gP29OhqoPzmaa/lhF7cdDjPkqrenA4ySBYt7
 fIQopk543G+yrFy6lB+AVjg=
X-Google-Smtp-Source: ACHHUZ5GOLDQBV2a4yxrRPw74HHNTnjeXEf7+OrzQ2aRfK6fL6kLzU37PHBUAbvQ3LzW53EJgy3gcg==
X-Received: by 2002:a17:907:720e:b0:966:5a6c:752d with SMTP id
 dr14-20020a170907720e00b009665a6c752dmr13444473ejc.20.1683815197050; 
 Thu, 11 May 2023 07:26:37 -0700 (PDT)
Received: from debianHome.localdomain
 (dynamic-077-008-180-228.77.8.pool.telefonica.de. [77.8.180.228])
 by smtp.gmail.com with ESMTPSA id
 hf15-20020a1709072c4f00b0094f58a85bc5sm4056647ejc.180.2023.05.11.07.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 07:26:35 -0700 (PDT)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Subject: [PATCH v4 5/9] drivers: use new capable_any functionality
Date: Thu, 11 May 2023 16:25:28 +0200
Message-Id: <20230511142535.732324-5-cgzones@googlemail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511142535.732324-1-cgzones@googlemail.com>
References: <20230511142535.732324-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 May 2023 08:48:34 +0000
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
Cc: Jan Hoeppner <hoeppner@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Stefan Haberland <sth@linux.ibm.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sven Schnelle <svens@linux.ibm.com>, Alex Deucher <alexander.deucher@amd.com>,
 bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new added capable_any function in appropriate cases, where a
task is required to have any of two capabilities.

Reorder CAP_SYS_ADMIN last.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
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
index 1b54a9aaae70..d21fb9d1556b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2896,8 +2896,7 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
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
index 688075859ae4..ca3f82a0e3a6 100644
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
index ade1369fe5ed..67d1058bce1b 100644
--- a/drivers/s390/block/dasd_eckd.c
+++ b/drivers/s390/block/dasd_eckd.c
@@ -5370,7 +5370,7 @@ static int dasd_symm_io(struct dasd_device *device, void __user *argp)
 	char psf0, psf1;
 	int rc;
 
-	if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_RAWIO))
+	if (!capable_any(CAP_SYS_RAWIO, CAP_SYS_ADMIN))
 		return -EACCES;
 	psf0 = psf1 = 0;
 
-- 
2.40.1

