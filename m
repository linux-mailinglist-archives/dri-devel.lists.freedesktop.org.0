Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E22A5FB890
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 18:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4573010E83B;
	Tue, 11 Oct 2022 16:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E8B10E828
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 16:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665507112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oo5rZBNzXD8F+rhBbW8zQ7kO5o2gNkfu06ZgFe5d8yI=;
 b=KDIhzneA2aIrXriVdvGHZGphNgg+u8+S51+OADEuK9F089blXGht1/+9ct/pTlFQ0iNisV
 YQY4RYpWkzVAPUBQHog0ifssGCanpF90eC116vNcnkiQShobulMQ4UgGfDgDWkacTnqBch
 QwpkXKtXVxZkYukn7VaaI17sYy8SqXc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32-g0xlWI5RMkKV8HltD8rH9Q-1; Tue, 11 Oct 2022 12:51:51 -0400
X-MC-Unique: g0xlWI5RMkKV8HltD8rH9Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 fc12-20020a05600c524c00b003b5054c70d3so8714589wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 09:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oo5rZBNzXD8F+rhBbW8zQ7kO5o2gNkfu06ZgFe5d8yI=;
 b=sg2RKQyg4zBAfOxrHdyBYl1tFJ8WtS+2XpdeWyCWtZn7vOSv/h7c3Hk9ugIakh4ycE
 6bQFKcz6d6zBiJv80mDz6NXgHqAc+tpY5v4Oy/h4FvK414+62oiVh7M9mXmEN0pyRujw
 U2JynLH44f/SjOS4R7SqSWEZXp31d3kdc/0hZlggxfE8HWdN65VjIxFbQLPg8eOLCdBg
 UcEhj3F5rQwSZ0KfZqcCIf//a3TB41//oj+cWhZ2Md0lNMzvbBMfKr7NAj0nmWkSUAp7
 xyn39fa7cHtgWyz+T1OnJANvoPigb88YxOz8L2uvmgpt+407MKSt6CmFdckzHcGRASHr
 3rcQ==
X-Gm-Message-State: ACrzQf0MkIagL8ySXsePn9VGiir02qkyVk/oAWsfpGx/ZWm8iGIuUJ2M
 Esv7REQrJ60tGFudP7sQMOBqo7M0xQsp8zG9ZTEmxQxZIycjVmwv/GCxztCEjoFuYzx25pmwv15
 tYd4al+MNMpPA71UEiJh5xREsAoE1
X-Received: by 2002:a05:600c:3d96:b0:3bf:bce1:23af with SMTP id
 bi22-20020a05600c3d9600b003bfbce123afmr25386wmb.112.1665507109888; 
 Tue, 11 Oct 2022 09:51:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Sp+jbWVAWZ7KY8c0LuNSuEk/9o2NlT3aiFrKwD3bsUTSK8yVIvyVo5tQLSyWkQagZWavvLQ==
X-Received: by 2002:a05:600c:3d96:b0:3bf:bce1:23af with SMTP id
 bi22-20020a05600c3d9600b003bfbce123afmr25375wmb.112.1665507109570; 
 Tue, 11 Oct 2022 09:51:49 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c19-20020a05600c0a5300b003c6c76b43a1sm2025629wmq.13.2022.10.11.09.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 09:51:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/mgag200: Do not call
 drm_atomic_add_affected_planes()
Date: Tue, 11 Oct 2022 18:51:33 +0200
Message-Id: <20221011165136.469750-2-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011165136.469750-1-javierm@redhat.com>
References: <20221011165136.469750-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no need to add planes to the atomic state. Remove the call
to drm_atomic_add_affected_planes() from mgag200.

On full modesets, the DRM helpers already add a CRTC's planes to the
atomic state; see drm_atomic_helper_check_modeset(). There's no reason
to call drm_atomic_add_affected_planes() unconditionally in the CRTC's
atomic_check() in mgag200. It's also too late, as the atomic_check()
of the added planes will not be called before the commit.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 5f7eb642f0c6..758629da95d9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -601,7 +601,7 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
 		}
 	}
 
-	return drm_atomic_add_affected_planes(new_state, crtc);
+	return 0;
 }
 
 void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
-- 
2.37.3

