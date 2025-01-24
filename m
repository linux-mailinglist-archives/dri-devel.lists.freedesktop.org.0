Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0EA1BBF4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 19:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8FF10EA03;
	Fri, 24 Jan 2025 18:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DeuX3VKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB1A10EA03
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 18:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737742536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bGWmGPJRu/Y2vFGNU2CYSMtLnSZ1JIf2dBRRTduba1I=;
 b=DeuX3VKD6X2CR9nhfcDu4515M6XPpf2Gn18s5hft2ddi6RADOO+IgmliF6sP8RS+TWZhKX
 0Q/wmZ0nubbLJNEiHi2R6Edrh08PX3O2vXQAf8r9XBSuaVVfyhE8DLfUyT+npemt+y4xPF
 2F6DvFUSNn/f6P8vdHJqFyXI23t1hf8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-ZYZvnl-OMEGy68rTAAgJuw-1; Fri, 24 Jan 2025 13:15:34 -0500
X-MC-Unique: ZYZvnl-OMEGy68rTAAgJuw-1
X-Mimecast-MFC-AGG-ID: ZYZvnl-OMEGy68rTAAgJuw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361a8fc3bdso11396295e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 10:15:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737742533; x=1738347333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bGWmGPJRu/Y2vFGNU2CYSMtLnSZ1JIf2dBRRTduba1I=;
 b=KJrcvq961gFLQuvt2oFc5DsIehC6zFNRmnRYbtjnPppiftF0qPij7OhHzuWCRBKQBi
 IdOMzAlZKhQhK9nsknZeWwhyJ7TcVo/rk2t3d08jCiYE+ijfmHcSIRR8xM6uUPbFGvnR
 TM8n8ZGXRAOcR+utcwjyyLlMLswGtUeadgqYcDi9JFwoTzF6qbvz7hmhwJfXo9YyTFCJ
 K705iY4bqbyPBafst5VtYr/U/exBPLPMhm+KxmO40ixvufOFl9yUxw1iexMjt/KmVaSH
 wfTllNpMg2xFO0bcp/c+RlVRqQo2iTFvFjnkcf6uedaOqeEmluFAEGboOBWFdLwaFCvQ
 Sfzg==
X-Gm-Message-State: AOJu0YxmTOT8LKQ/oPiN9cRpmt3jBXU6S40xD0EYydv2uH8PiCQP9sqp
 /GRSlJeXhYmc7rEgeJ32AKBLqNF03Uf4xDa4UU9UrOV1NMeOq8jgaV+sVX/6tS+kBnkHZhQJpCm
 SBWh+8Kmf0jQe4nooC6XsvQBDAreEsD1ZzN6tD07qxJMVqiPL1YKoyOeo7IsCXMR7ww==
X-Gm-Gg: ASbGncts+R1Odt5ZeE55cw3muWa/VGnw1pvofMvUuLtE+YNDquZmZ94K9QHY7Jfj/uB
 wzomrRMmY8oJsXMSt214EQ4MDbqlnnEQPLVEFYosMFyC5TuLBY8GEW3J9uM5+wgRKg2ZvVwIgAh
 skNL8soZwvRAHBDoAtFT2FjD8PY9SNpCIdp6212oTrQaam9Dr5tHrRrZHetQONlh3LXk42Bk9Vg
 z6XPFIvKCTTPVrx4t48gvygso4c+fGe2PLjZ5RqQUDlMjWlMJmsIr0hk7spYOuGCXagpgvTV3D+
 veN8RVVVn1pR5RINFAo=
X-Received: by 2002:a05:600c:1c93:b0:434:fbda:1f36 with SMTP id
 5b1f17b1804b1-438914299bdmr277981755e9.20.1737742533456; 
 Fri, 24 Jan 2025 10:15:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEji4W7ofEq55B5EikqJKy4d9Ug9AcG71r3tdNdvx7LPEmUH0Fw6EvB8CqjN3UgoYb9Od7iww==
X-Received: by 2002:a05:600c:1c93:b0:434:fbda:1f36 with SMTP id
 5b1f17b1804b1-438914299bdmr277981605e9.20.1737742533104; 
 Fri, 24 Jan 2025 10:15:33 -0800 (PST)
Received: from localhost (p4ff2332e.dip0.t-ipconnect.de. [79.242.51.46])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438bd5023acsm35577375e9.16.2025.01.24.10.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 10:15:31 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v1 2/2] nouveau/svm: don't initialize ret in
 nouveau_atomic_range_fault()
Date: Fri, 24 Jan 2025 19:15:24 +0100
Message-ID: <20250124181524.3584236-3-david@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124181524.3584236-1-david@redhat.com>
References: <20250124181524.3584236-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dDNNfALD99aRfR-fJ1qLRNH9ycfSPJ4KqDz9y-mCF08_1737742533
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

ret will be modified immediately afterwards.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 8ea98f06d39af..2f8b8b978fc08 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -594,7 +594,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
 	struct page *page;
 	unsigned long start = args->p.addr;
 	unsigned long notifier_seq;
-	int ret = 0;
+	int ret;
 
 	ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
 					args->p.addr, args->p.size,
-- 
2.47.1

