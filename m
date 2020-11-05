Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4472A7909
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575856EA16;
	Thu,  5 Nov 2020 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483016E057
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 01:47:50 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 13so80179pfy.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 17:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sYYwClh6EchPM2BfZR+4AEHuja7044UzaidnsIy8Qcg=;
 b=Id8UrqPwcLEkt9PwDuwqYhVZ9KTxZgq/wynDwuSf63/F8l75yjB81xuZ0c4D5Ds6AP
 xq1NsRzKt7wNjgVtk1D7RAGyiBSy1Wn7OcIaiCLSFEDDpo/VmCUPfdJuYrgAYSxHSEkj
 fWS+97jxKFivtDHmynjuL6EiRM3lAt+VObgAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sYYwClh6EchPM2BfZR+4AEHuja7044UzaidnsIy8Qcg=;
 b=rg6+AKkwI+4v9M7LZN98L7u9veXEGWoNcwrEjrXrci60Wc+KXrBtZQuiwhSSViZqQg
 c18/LgC1ZGAD3LT5njkWLjC7t5rkvzlDbYyWT84hZPX5QjH9ULDR+2WM55JkOYAvhHH4
 NPjIZKVjQ3yu/VxV5edURuFQVp9NdpI9dzEvUVx+aPtOf3ETcCWTzho0aeEoN3b4C9Yq
 bFkNOSsQMRuXOqnPoeDjFp8Mq0h577a1glZ/wcoaLMEVtjB0k0vYNEjVFHPQPGXJm37Y
 rPv89nnkERK/VfYK5bXg6zJSL9oNyydiLL0SIp6VxS+uqt+yZYeq9ffYqTP6O2MqW0na
 eXVg==
X-Gm-Message-State: AOAM530nqw5GyKOpK1VcD2UDGmtLXSyZY76pvKkvYv+keMqxrIDLXXnv
 f0oJR7ErGx/+83rC7VnEhHg/eA==
X-Google-Smtp-Source: ABdhPJz6AoKdhCysWyJGFbxwj173ZuJ5XbaST4akQgoDruF8T/h8yzY9MmP+ZneLYT0hbQ/+OukUJQ==
X-Received: by 2002:a17:90a:7d12:: with SMTP id
 g18mr362516pjl.137.1604540869798; 
 Wed, 04 Nov 2020 17:47:49 -0800 (PST)
Received: from tigerii.tok.corp.google.com
 ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
 by smtp.gmail.com with ESMTPSA id d190sm116741pfc.185.2020.11.04.17.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 17:47:49 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/virtio: use kvmalloc for large allocations
Date: Thu,  5 Nov 2020 10:47:44 +0900
Message-Id: <20201105014744.1662226-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: Suleiman Souhlal <suleiman@google.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We observed that some of virtio_gpu_object_shmem_init() allocations
can be rather costly - order 6 - which can be difficult to fulfill
under memory pressure conditions. Switch to kvmalloc_array() in
virtio_gpu_object_shmem_init() and let the kernel vmalloc the entries
array.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 2d3aa7baffe4..d9ad27e00905 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -184,8 +184,9 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 		*nents = shmem->pages->orig_nents;
 	}
 
-	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
-			      GFP_KERNEL);
+	*ents = kvmalloc_array(*nents,
+			       sizeof(struct virtio_gpu_mem_entry),
+			       GFP_KERNEL);
 	if (!(*ents)) {
 		DRM_ERROR("failed to allocate ent list\n");
 		return -ENOMEM;
-- 
2.29.1.341.ge80a0c044ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
