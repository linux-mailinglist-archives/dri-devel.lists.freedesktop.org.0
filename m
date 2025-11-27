Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE7C8FBBA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 18:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F104710E83D;
	Thu, 27 Nov 2025 17:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ec6sY7Po";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA8710E83D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 17:41:42 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-29844c68068so12301545ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764265302; x=1764870102; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gJqmdOIxEw8eLWLXbkfWEh7lb6XZW8BGJO73kS58WvE=;
 b=Ec6sY7PopncIE5Vu1yxdDSTcKXH0TnyCguyEqH+p+dqZ3GnYuNbTI5NUYPIkB7Ai6g
 sbexpOey9OTOFfSrgXq5IMslwf9iXvOcXJTdPD37enccytbKWc0ouIe6LYh/Kjb2TEcN
 R5LVb0enbV1DRCyvN14JTYHKQGFvOHhzRQSRyVMeY8Jv3kUx1I7ykLZr26olTuAPqvFo
 dFUe9rrAz2/CVkNsTnqnmrheUzbDYOJmxs1o80hQFV+peP5S7k5nQFiSt6Dugx6+v6T/
 VXudOx7UxguUeUvd1QwuGJzdb4sGGG5fHHVRToJx9KcEkzMZ/i0YdT1KWuoU+aVKkJL/
 kBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764265302; x=1764870102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJqmdOIxEw8eLWLXbkfWEh7lb6XZW8BGJO73kS58WvE=;
 b=jP/4He0EHGkOYs9p6kP4uTHsvd6Swhc3rnxOK6BP6Yzs56Vk/LKE6SGmZ8PK8jMo8J
 dB/N/9z7ObkSaKl6l9/Ww8t+HuXCoKld5jnDQisxZKoTFkWRRfWizJqZSRzPL1yTmupj
 cxrS3BLXvBA/bSxg/OE9llX4msl/w806uvdUSW+KzirhZd8urWqv9EdCkgBKDcQhOvtz
 ZX6+LDjcxTGnHR7Ek6YvFlqlZyW1x3bpwjQfYbQhzWRXIHa+ZRxz7K0WXDwju60zcRmT
 RYZK8NQDCQ+Wl9ujo8njUEUWj6g9nab7BO+yBzdpE7jmT0nDFFQ/7z9TrCnhzdqBtc2a
 Y65Q==
X-Gm-Message-State: AOJu0YxrPsncL1IFYBYS9xtYL2NQqfMOqnjxmh4Nr+GWSpG/++n+SlsK
 QEBj2riYMCqnA54SFtQVUchqhSXmpeykMgVWAbLsPrp9tKSjR9Pn+n23
X-Gm-Gg: ASbGnctc9pQ/Lr76K01JzMCAOFrfoaVl5n6iM4iMmybcZysn3SshweZkjwXLjpj4R7G
 M0fJEk6OAKJL1lsaN417nrVwnjsCBZUJX2KC2p9cEIZNEvZ9tp77iG6wXJwkpTKVmKIamcP3gFV
 RUuGQjULvU3A5qzeSAX4aCkwps3R92nmnZ9z2QwKaUhkevY1NqxXIxpuUWnk82kch2Qe8+feaOU
 HqXloF1QDhTNm2nqKWFHkwTt5NGxNZR1K6ib9UETXQ2SPksoIbe3uvs0ssCn06MAAdFjObY2pPd
 yBuYgK/gwjttitHtYaQLhoUGAJCnWfttwdBc/lL4ra5euG96WsLHeWjV+37vxYfNfHFFxtXZYU0
 E9Cmyjm8uVYX2Pdd1pWDj52570eEx5t1SuxOuuyGRdTfAHyT1MGvUku1bw5C/wrKeSZMCiEPECQ
 H5kWpOqNi8Jy7YRPxPIQ==
X-Google-Smtp-Source: AGHT+IHZoue3eEn27vi/t77L35UHlVlZsPeaZ47NWPrQr+Bw35P2nBh78meTbRj1N70iv3TUbjgvfw==
X-Received: by 2002:a17:903:1b0b:b0:295:59ef:809e with SMTP id
 d9443c01a7336-29b6bed1317mr288255705ad.24.1764265301924; 
 Thu, 27 Nov 2025 09:41:41 -0800 (PST)
Received: from archlinux ([2409:40d6:115a:9b42:5333:be07:7e9e:384a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bceb28019sm23233865ad.58.2025.11.27.09.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 09:41:41 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+95416f957d84e858b377@syzkaller.appspotmail.com,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm/syncobj: Validate count_handles to prevent large
 allocations in array_find()
Date: Thu, 27 Nov 2025 23:05:34 +0530
Message-ID: <20251127173534.236250-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
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

The DRM_IOCTL_SYNCOBJ_WAIT ioctl reads `count_handles` from userspace and
uses it directly when allocating memory in array_find(). and
kmalloc_array() allows userspace to request very large allocations,
which syzkaller was able to trigger.

Such unbounded values can lead to excessive memory requests, allocation
failures, warnings, or resource exhaustion paths. Add explicit bounds
validation to prevent excessively large allocations coming from
userspace-provided values.

Reported-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
Fixes: 3e6fb72d6cef6 ("drm/syncobj: Add a syncobj_array_find helper")
Tested-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index e1b0fa4000cd..f322b38ec251 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1293,6 +1293,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 	uint32_t i, *handles;
 	struct drm_syncobj **syncobjs;
 	int ret;
+	size_t size;
+
+	if (check_mul_overflow(count_handles, sizeof(*handles), &size))
+		return -EOVERFLOW;
+
+	if (size > KMALLOC_MAX_SIZE)
+		return -ERANGE;
 
 	handles = kmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
 	if (handles == NULL)
-- 
2.52.0

