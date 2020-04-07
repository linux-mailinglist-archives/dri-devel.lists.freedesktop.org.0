Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB0F1A0440
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 03:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12116E0F9;
	Tue,  7 Apr 2020 01:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C1789BC0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 01:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586222204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/sKDsOkhGFY1/dLpsWaX9PoDjxAIj32rAFOPRCnZ2U=;
 b=Wjn7IuAPnLh9VbWCCESmnFy3Dbx/932wkY1QA8ihss0t5ODBANX93YXQroQOL61k3u0rvE
 9G/EleswiemhuVKPrsJegS+jfHybj1jhnwSDmM1n4KcD+Bj0C7wZAGOW4PVsV5ShkGrLJw
 UhgmBgexbbiU0BZFRRUkwKfFhmFpoVo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-scGpfTJQPf6ymTYaagHCxg-1; Mon, 06 Apr 2020 21:16:40 -0400
X-MC-Unique: scGpfTJQPf6ymTYaagHCxg-1
Received: by mail-wm1-f69.google.com with SMTP id e16so37299wmh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 18:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l4t0rXeJXf/7Is8eR7dpPgB8JuUv5NDEJCaYkFwA7To=;
 b=mKi/KZnobte/D3ufVqXsh7OvUTCzaVbGiE5HEwEQ7HgVVTF9l3Kqh27deKxj3nDILX
 u+ouclsEQU9II+FtmnBVw/ZOBFRUMVDwZ79tjwgdVCpXg6APL3UZhnwiU0K9Kcxvz9Vs
 5BiWx6vN4tTXk1C0NQDrfkSFbWv/NjZJWO+70Hbedhhm6ndoYTX1dWtbsmGaYdpbjW6r
 rgcleJBPRhZ4393zfsuLOuEp+nrU3utqSGOtGKFwbKt9B6uonS5UJLG6hDQgwhWs0Mss
 Ax1/aWIFxfy6xKY4eFBmDpYydJK7/2QeMcqNvMY4zZFD6Fz9DNgTBeCX9XN62YP2AKeH
 phAw==
X-Gm-Message-State: AGi0PubAc2Jre+k2AjF0ImWZqkKukp446qW2vhFZp6YBsM3JU31Ti6eb
 XPY18HjaCB1hLPg6WKZQgmpP84qYVSLvfH1Yq40bL2JVsTE37m+KGDy1jhUcLoYgNmf0hy9g09K
 Z13rmRXbO7IL2W/MDYyI7q0Cgjju4
X-Received: by 2002:a1c:a553:: with SMTP id o80mr1972465wme.159.1586222199752; 
 Mon, 06 Apr 2020 18:16:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypLzgPCpeHBVPTtA2sAbQBKCKQ2qzZXjvqfsDhPpYNlRvmHlEV5qibDafwbRFUM0lCv6VFnpwg==
X-Received: by 2002:a1c:a553:: with SMTP id o80mr1972456wme.159.1586222199594; 
 Mon, 06 Apr 2020 18:16:39 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id g186sm99764wmg.36.2020.04.06.18.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:16:38 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:16:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 05/19] virtgpu: pull in uaccess.h
Message-ID: <20200407011612.478226-6-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
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
index 205ec4abae2b..289dabbce477 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -27,6 +27,7 @@
 
 #include <linux/file.h>
 #include <linux/sync_file.h>
+#include <linux/uaccess.h>
 
 #include <drm/drm_file.h>
 #include <drm/virtgpu_drm.h>
-- 
MST

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
