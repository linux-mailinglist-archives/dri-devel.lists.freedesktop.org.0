Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FBAB31646
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 13:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9D910EAC7;
	Fri, 22 Aug 2025 11:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j4c1BRYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E866F10EAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:28:30 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-70d9a65c2a3so4585926d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 04:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755862110; x=1756466910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fATcXJL+LrcWLjUxzRMgV18SaL968swja9iMB8wf0oc=;
 b=j4c1BRYI3NciErFdKOlHsuU/AEKv65QPhU6RA3F9Y7gjmeKkyvumlb+ea18WNTYcNn
 HJHkHxPtcxCcgQ00WWC6NUZ6h3S3TKw+e9M7nd7rjdTmeiIz8yo2lgcKX2sQhYZ4KOlV
 fmKLF9E+THK3SbpAoZCI4al3yh5APdkTnS+nikFPtZnvO9Fj2TJyLxv3HOlAHDd7RsuZ
 TeiCQWoxByDLEp5rTlyN3qWbBXcgSpNiVGiifRMLHgm742JVrU5Hoo+4e6Gr1ZbvSgXl
 XeY3WALD9n6RKYUV7oPYWugj/IwQ+G6/MeGURJQt1o94i8zZKcCXmosXdMj2i9d9taKD
 /+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755862110; x=1756466910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fATcXJL+LrcWLjUxzRMgV18SaL968swja9iMB8wf0oc=;
 b=MywafrSuKEazmp9PvZWuaXjK/Lgh01xjPoSzwYaW2SR+Be9MFZumMCO88b8/jD0fxn
 BT3zuNWBYTogJ9DNhpZ0JL9YrwRxsNh4fJl+YTlPBrWkWqCd9ReRBWAc6vlcu7FE70Hr
 sOjqzZGD+fHd14vX9aPHGyndxEyH41h1f7uWrvMzWr6MIih6UiC9oJWJBIs0+rqDTdJX
 z8guRKNwOrUkqai8eSUtLtXEaZHXeP72BNNdLDAEbFi71MRM+bsaETo2aB2tkEeEQfKm
 V9EsLc/5lezc2leyw3M/90ThzujvzpBubojrfAHy28oUb1ox4+0apLp/TMtIxHfYN5mU
 v8nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbnMYVTO+TvWWi3Shv1TQKSSgG+f/9nJxnX7DPcfPaeGwIdWF6Igjjz4Iqqc8cEBTjbZCxyLmpZq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPXe6mZAByVhSzRkCmwCp/MNfCQ4Dv3pb+DdxTvdneL6LBqUnH
 kJmtyABWiMWSBVdj8dwnHQdAVEY6gyc66gO4wdGEMsoLxJMBslDxHEt1
X-Gm-Gg: ASbGncsBwtgJy/OVRbOVAZkQ9tIMObzA7xnzelqtPYjMq4TInvxvylMeekRoYesok+s
 U5Duj2zeboq2evYGNLVe1MttyY6Qie0VM7RFfXdyuf+MlYYFT7v31+PpRdVtWJyacHIVKJuigKV
 2Fxh8p6QhWwU6/OXdiVp2zw+UYUL5OSgS0hiu6Im96s5S8OQEXELb5obO+1qbY047cB08brVOkw
 p3l9NThYllNd2xTctfM160a+Rp8iC7M3s0ScdOiJWP6wdT5RnzOlKLY4Ga9Xv5OnlTCzvYW8bHQ
 uKiQuL/trgP4yuKmfPuRxZM4X9QAm+uB86jM++HxP9lWpVuj7V0DBBbCW6ApwtgSU05xa1K/bB3
 TW9UrXvYk2f6iGW8UAmjv3OxZNGQPHQgMZeyUoMwLaiUoaqInvGlhW85YHJUQREI7uN0t
X-Google-Smtp-Source: AGHT+IFEuC07BCn0ECmRXcw3LPgdxSHH0lEezjr7/+96LbcIVEdq5iydgvMQouzopyVqYSUIxhZivA==
X-Received: by 2002:ad4:5f0b:0:b0:70d:9587:cf78 with SMTP id
 6a1803df08f44-70d97132341mr35945836d6.28.1755862109558; 
 Fri, 22 Aug 2025 04:28:29 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70ba90d8e93sm123662476d6.34.2025.08.22.04.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 04:28:29 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: jeff.hugo@oss.qualcomm.com,
	ogabbay@kernel.org
Cc: quic_carlv@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] accel/qaic: Replace snprintf() with sysfs_emit() in sysfs
 show functions
Date: Fri, 22 Aug 2025 04:28:04 -0700
Message-ID: <20250822112804.1726592-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Documentation/filesystems/sysfs.rst mentions that show() should only
use sysfs_emit() or sysfs_emit_at() when formating the value to be
returned to user space. So replace scnprintf() with sysfs_emit().

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/accel/qaic/qaic_ras.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
index 914ffc4a9970..f1d52a710136 100644
--- a/drivers/accel/qaic/qaic_ras.c
+++ b/drivers/accel/qaic/qaic_ras.c
@@ -514,21 +514,21 @@ static ssize_t ce_count_show(struct device *dev, struct device_attribute *attr,
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ce_count);
+	return sysfs_emit(buf, "%d\n", qdev->ce_count);
 }
 
 static ssize_t ue_count_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ue_count);
+	return sysfs_emit(buf, "%d\n", qdev->ue_count);
 }
 
 static ssize_t ue_nonfatal_count_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ue_nf_count);
+	return sysfs_emit(buf, "%d\n", qdev->ue_nf_count);
 }
 
 static DEVICE_ATTR_RO(ce_count);
-- 
2.47.3

