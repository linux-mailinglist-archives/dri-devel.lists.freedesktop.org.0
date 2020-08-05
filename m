Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47E723CB21
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 15:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22DC6E5D3;
	Wed,  5 Aug 2020 13:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922996E5D3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 13:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QNkBL0MOslnxA1lTPWBDwCkBLDnBYOCw/rGPZtjWTCU=;
 b=ZIScxlACOASOF8EC8m6eNcqI31nt6wZ8BFjuyIJ67yHc7UTx+Rcc0UUVPAVunqyEPWSnFQ
 EzMhI86Cit8QzlKlbLspt6cLm8WIZU5ifvMkiTUtliZsmmyKn7Yqx6Ln2Nj50nek3z1i9Q
 k3V1hBND3IkzG2tmjn6yo6V3sYxCArc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-5SIHGVq2MKSCEcqXSb95lA-1; Wed, 05 Aug 2020 09:43:46 -0400
X-MC-Unique: 5SIHGVq2MKSCEcqXSb95lA-1
Received: by mail-wr1-f72.google.com with SMTP id f7so13582507wrs.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 06:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QNkBL0MOslnxA1lTPWBDwCkBLDnBYOCw/rGPZtjWTCU=;
 b=NJUcuiplhlC9jX+eaRrBA96XumThiRvbSSnEXbtBwF5LSMcozGV4zD/xGMwg2/XMvL
 wLwmvHDSm128do6im2+lAAf0ozAUtWnK/RkvbZ4phNrVSSdcCWe7kYUinlibcj7bH1AC
 hyuQnupr3hSknmfSdSU3TXvpc8KyXhg5o8C4vHXdfa07X2JngFPyV/CBl2lfv2r91T3w
 KNHVY28JncUD4nd7lA/F+2DvnQxiqE3aCQ58QmNPgD0fJnUUwv5xzbVbKbt2riSqAmHm
 XkIOjFT73LFcSYyLJbnmmDVZ0971ObV+8VWDwnzme1TAaMY3a+WqmA94RKD59NY6oXnF
 WsXg==
X-Gm-Message-State: AOAM533oOCyPZ1vXhLrOMTbROERRxcMND7AlO7T6let6liu4BiyqCT5x
 c6NrMuXxU1x7fd7hP8QGT7Q3T5CofKVzzmc6FQyiLln6OPIk3JPsHwCgbrl7lyqFsbBa0SoYnMT
 dNGwqEHznEnud4fAF9WKj9AEfAPRP
X-Received: by 2002:adf:f64a:: with SMTP id x10mr2692846wrp.99.1596635025560; 
 Wed, 05 Aug 2020 06:43:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+wOWu/BUGFDnYiFNkYnDk0qc3NvkypKVIbTb4eZBzRtJysZaIOINp4bGehYs8hyi8ABgcfQ==
X-Received: by 2002:adf:f64a:: with SMTP id x10mr2692831wrp.99.1596635025403; 
 Wed, 05 Aug 2020 06:43:45 -0700 (PDT)
Received: from redhat.com (bzq-79-180-0-181.red.bezeqint.net. [79.180.0.181])
 by smtp.gmail.com with ESMTPSA id
 s131sm2941176wme.17.2020.08.05.06.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:43:44 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:43:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/38] virtio_gpu: correct tags for config space fields
Message-ID: <20200805134226.1106164-11-mst@redhat.com>
References: <20200805134226.1106164-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200805134226.1106164-1-mst@redhat.com>
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
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since gpu is a modern-only device,
tag config space fields as having little endian-ness.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
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
