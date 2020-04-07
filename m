Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B151A03F5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 03:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1DF6E064;
	Tue,  7 Apr 2020 01:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ED16E064
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 01:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MZAeca+dWriUkxqhN0GPlWMQVXhjMQdkqM2vMOcd1Q=;
 b=Ia2RBm7e9JXB7mNXhv+zh2LKx/GwGr2g3WRpwEjTJsuBUQGKBOP0Rh/m4oAgIzBUllJZRd
 OsLCFWSOrgkks12XWXvjcFO6XJ03dTk7I1pZfO+6o9lnXQ/GKGedh3JmqJz8gbG520UAvB
 9w20Q9CpglbhzziGItLc4cvpLbTspnc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-Vm3hVjR6Op-WU7cvOXZXUA-1; Mon, 06 Apr 2020 21:07:39 -0400
X-MC-Unique: Vm3hVjR6Op-WU7cvOXZXUA-1
Received: by mail-wr1-f72.google.com with SMTP id h14so851136wrr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 18:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QXdHnCPN9IKDzYXh6cSCK96yIk733FWewogK2tGBIaQ=;
 b=I8D/H8/DM/1pql3dpPtmuMeZNFdRUblUL+KF57S7Ed70+9riQHitejH+nobNo4roR7
 9OGotSdqNZVV/NL3AUmdMRUxeJWfd4a1nX8SmQg6ZHnujlRklX8y/HlM7ZHV9BtaaP7u
 Qn+98r7sdQn2mEBLfJ7VqVvx8p+C4kKxWGU7tTu5LAHlz4LCkPoe7mF3geSNRnpAE8TX
 VlK93RZPVECjLxE2tNwp3bc5P9MIXqoiH8PHOt+m65Wg1qPhruYvLhfP5hPa05mm2kzK
 cHJ3B8Yc2OgDB41LEaDIaNm0EvMWNc9U3IqkL7wXEqhSs7P7U7Sj/82cRh/qAgSMIiOu
 0ZYw==
X-Gm-Message-State: AGi0PuaHDgrlZgBmoJVADVY2tQWw/OWW2ZGXj/kImbOZ5AMxJ3FlvpfV
 CTTXnMfi5t4n3bwoy8jAM6NPVZt40mswt3fQZUiih6tnOxPaITxQ3Ryk7Yz1wyI5xCxHsP4rZC8
 ZREgAmcM24Fvy5NnAXtb3+7kixKMR
X-Received: by 2002:adf:9b96:: with SMTP id d22mr2187307wrc.249.1586221658594; 
 Mon, 06 Apr 2020 18:07:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypK4RDCslYo3i2lHvzOQqU7u0oLmj6vW5yEO0Z36UmKBoS+EK0dWhGTEZV4YpT9+RwLo5TAivQ==
X-Received: by 2002:adf:9b96:: with SMTP id d22mr2187292wrc.249.1586221658447; 
 Mon, 06 Apr 2020 18:07:38 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id w204sm123674wma.1.2020.04.06.18.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:07:37 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:07:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/19] virtgpu: pull in uaccess.h
Message-ID: <20200407010700.446571-6-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to virtio header changes, include uaccess.h directly as
this file is using copy to/from user.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 205ec4abae2b..2342a8baa5f8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -27,6 +27,7 @@
 
 #include <linux/file.h>
 #include <linux/sync_file.h>
+#include <linux/uacess.h>
 
 #include <drm/drm_file.h>
 #include <drm/virtgpu_drm.h>
-- 
MST

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
