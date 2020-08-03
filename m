Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C323AE97
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 22:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413896E15B;
	Mon,  3 Aug 2020 20:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D13C6E15B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 20:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596488370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pjba7UTEkMQb9cgNSFsINkPwPT47kJGCQxpArSsq/v4=;
 b=Q91VOC+tMWCwBBbei3sir2WoOe1PNe0YuHGXzKR5ZIhSLsznEUFNrr7TWOgPAaPAE8X88X
 cwhed/1ZVVAJR5Kxk2parCrkHcw1B3LbZg3nPfJVOnG0GZQz0geFhB3n28+Dj2mbnJj2by
 zkt5ImGZCjkRGndHkWpyvIDccy1tr6I=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-FId3rXLJNRyP_LDq80Diig-1; Mon, 03 Aug 2020 16:59:23 -0400
X-MC-Unique: FId3rXLJNRyP_LDq80Diig-1
Received: by mail-qv1-f71.google.com with SMTP id p15so13849066qvv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 13:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pjba7UTEkMQb9cgNSFsINkPwPT47kJGCQxpArSsq/v4=;
 b=YMlG6DPd5f49oOuU6NBKU+7NXK2BLJrvX4MRXOwP+IV83eJbeISqjUr9VbICNWOPAa
 +upIYy0iQmEgXKdxlVwVg4zE9Vc/NHixm12QiG6ln2TfpDTen8VujIalD4S7coEfockE
 Qxl9mOx8YIFzrYJMKROaCX19LerVQjfyJRk08vAVsZMcogSmv+ZwVS4XQdb82SZBV34C
 J+gCvE7OSy3q41mKFOhT8sEmzBX/obnkraaHaszKgYA6wAicbacpHcFVW4DF7/aWP8sR
 8l4CK0IVrYB4Q3hp0tqCR/0ewnU/yQALyE4fGlzfWBmPHSHvaW21w9sPm41i9hnphBix
 yDTA==
X-Gm-Message-State: AOAM532hOF9Cv+aH1lAQ6f02pBULV1kvZgknYfw/Fnx5UnRIcgCKERmz
 h9eB2kKquhhmnybQfYV2ohySxLBYe0T+fY9uzd3kUKrn4hPqN3uGD8aQdmGPolt7Qc+1+v8f/DT
 jWCj/639oBu6i5yqamzEIClRwfoRv
X-Received: by 2002:ac8:387b:: with SMTP id r56mr18809905qtb.353.1596488363074; 
 Mon, 03 Aug 2020 13:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHozttQuejm//tCqktxmYXDIQpJ0ThAuBb6QUqCnnttWqM4Fv1n/r76PemaGEK2xQsqaBj5g==
X-Received: by 2002:ac8:387b:: with SMTP id r56mr18809888qtb.353.1596488362838; 
 Mon, 03 Aug 2020 13:59:22 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net.
 [79.177.102.128])
 by smtp.gmail.com with ESMTPSA id p17sm19764307qkj.69.2020.08.03.13.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 13:59:22 -0700 (PDT)
Date: Mon, 3 Aug 2020 16:59:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/24] virtio_gpu: correct tags for config space fields
Message-ID: <20200803205814.540410-11-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200803205814.540410-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since gpu is a modern-only device,
tag config space fields as having little endian-ness.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/uapi/linux/virtio_gpu.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 0c85914d9369..ccbd174ef321 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -320,10 +320,10 @@ struct virtio_gpu_resp_edid {
 #define VIRTIO_GPU_EVENT_DISPLAY (1 << 0)
 
 struct virtio_gpu_config {
-	__u32 events_read;
-	__u32 events_clear;
-	__u32 num_scanouts;
-	__u32 num_capsets;
+	__le32 events_read;
+	__le32 events_clear;
+	__le32 num_scanouts;
+	__le32 num_capsets;
 };
 
 /* simple formats for fbcon/X use */
-- 
MST

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
