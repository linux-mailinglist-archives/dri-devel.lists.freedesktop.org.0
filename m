Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD12D2C490A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 21:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54476EA86;
	Wed, 25 Nov 2020 20:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6806EA82
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 20:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606336038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHKnvKojNg07maTXpdLc7opl7LeH8NxJHEW+j33de5M=;
 b=TU4QNaqJfD4VlHwdNWXbUp+orjfq3Bb4yBUhsw1qvYf510zDBxt7Hm3pXIu/pabpxLG65X
 xx/bSZPZG+KFd6EEEc7Dh/NTwNb25RXj6bvtnzWOW+0IbWo5FrakfCXQvg2/pULiP7ywp6
 z8yAoxSC6oAE2eRt4mXos3Re3FDpyKo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-E6Q-UO4RNXurlv2iD-cc-g-1; Wed, 25 Nov 2020 15:27:16 -0500
X-MC-Unique: E6Q-UO4RNXurlv2iD-cc-g-1
Received: by mail-qk1-f199.google.com with SMTP id x196so3288824qkb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHKnvKojNg07maTXpdLc7opl7LeH8NxJHEW+j33de5M=;
 b=kCr/HRdJJvJgNFJ/9KSNDbSGkDV7HL900ED8bHHdgJ2uuEUOX9W3u0QDMjJXKIOPOh
 uiPRkgQq5jKIljSX8iiuNrkGE6VTndBPpfQkHnuesMb7Y1NUnbFnSrMiPxV8JowkRSGZ
 TyNApo5ajxTE9BPLDTRQczsjJShae69zcsbc3MvQvH1awRb1Jd6UDQ7WJQNN5952YxEs
 v5d1GSYM9FKu0n6aYrmz0/pqDmUMAAvGPLV0vw4puwkvSy9BZ7wDHpS6UPUdcmQkcjxG
 V6+gMRy6sNYRPy6XKREun7B7CMyYaz7A0zYzvFAJcgaEIK/b9KXX0fxhjuXd29gnrHBY
 v6Mw==
X-Gm-Message-State: AOAM532pwlkoehjqMfaid66k/6HbSHNUnZpd4R3YV4rTfHNUyz6nUHyR
 QD7TN8tFzvzzRRsi1sGsMlkxKUtde1ErglGZhr5oZmxS8GqMeH0a6smdlwGNO7YbFUDe2i4xdk7
 DjuNs60hGEaXsmzzkIgCYMi8S4nqT
X-Received: by 2002:a37:6f07:: with SMTP id k7mr645813qkc.423.1606336036384;
 Wed, 25 Nov 2020 12:27:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIW7/SCjK5C7le3XLJ7c7SswM/9Tbl2wvjAUiYOJaHFKIGoPwGq/hxgNfwbsf46D2m+6cudA==
X-Received: by 2002:a37:6f07:: with SMTP id k7mr645781qkc.423.1606336036152;
 Wed, 25 Nov 2020 12:27:16 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a638:b301:9966:d978:493:6a3d])
 by smtp.gmail.com with ESMTPSA id o187sm431772qkb.120.2020.11.25.12.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 12:27:15 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v2 3/3] drm/nouveau: clean up all clients on device removal
Date: Wed, 25 Nov 2020 15:26:48 -0500
Message-Id: <20201125202648.5220-4-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125202648.5220-1-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeremy Cline <jcline@redhat.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The postclose handler can run after the device has been removed (or the
driver has been unbound) since userspace clients are free to hold the
file open as long as they want. Because the device removal callback
frees the entire nouveau_drm structure, any reference to it in the
postclose handler will result in a use-after-free.

To reproduce this, one must simply open the device file, unbind the
driver (or physically remove the device), and then close the device
file. This was found and can be reproduced easily with the IGT
core_hotunplug tests.

To avoid this, all clients are cleaned up in the device finalization
rather than deferring it to the postclose handler, and the postclose
handler is protected by a critical section which ensures the
drm_dev_unplug() and the postclose handler won't race.

This is not an ideal fix, since as I understand the proposed plan for
the kernel<->userspace interface for hotplug support, destroying the
client before the file is closed will cause problems. However, I believe
to properly fix this issue, the lifetime of the nouveau_drm structure
needs to be extended to match the drm_device, and this proved to be a
rather invasive change. Thus, I've broken this out so the fix can be
easily backported.

Cc: stable@vger.kernel.org
Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6ee1adc9bd40..afaf1774ee35 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -628,6 +628,7 @@ nouveau_drm_device_init(struct drm_device *dev)
 static void
 nouveau_drm_device_fini(struct drm_device *dev)
 {
+	struct nouveau_cli *cli, *temp_cli;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
 	if (nouveau_pmops_runtime()) {
@@ -652,6 +653,24 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	nouveau_ttm_fini(drm);
 	nouveau_vga_fini(drm);
 
+	/*
+	 * There may be existing clients from as-yet unclosed files. For now,
+	 * clean them up here rather than deferring until the file is closed,
+	 * but this likely not correct if we want to support hot-unplugging
+	 * properly.
+	 */
+	mutex_lock(&drm->clients_lock);
+	list_for_each_entry_safe(cli, temp_cli, &drm->clients, head) {
+		list_del(&cli->head);
+		mutex_lock(&cli->mutex);
+		if (cli->abi16)
+			nouveau_abi16_fini(cli->abi16);
+		mutex_unlock(&cli->mutex);
+		nouveau_cli_fini(cli);
+		kfree(cli);
+	}
+	mutex_unlock(&drm->clients_lock);
+
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
 	nvif_parent_dtor(&drm->parent);
@@ -1111,6 +1130,16 @@ nouveau_drm_postclose(struct drm_device *dev, struct drm_file *fpriv)
 {
 	struct nouveau_cli *cli = nouveau_cli(fpriv);
 	struct nouveau_drm *drm = nouveau_drm(dev);
+	int dev_index;
+
+	/*
+	 * The device is gone, and as it currently stands all clients are
+	 * cleaned up in the removal codepath. In the future this may change
+	 * so that we can support hot-unplugging, but for now we immediately
+	 * return to avoid a double-free situation.
+	 */
+	if (!drm_dev_enter(dev, &dev_index))
+		return;
 
 	pm_runtime_get_sync(dev->dev);
 
@@ -1127,6 +1156,7 @@ nouveau_drm_postclose(struct drm_device *dev, struct drm_file *fpriv)
 	kfree(cli);
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
+	drm_dev_exit(dev_index);
 }
 
 static const struct drm_ioctl_desc
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
