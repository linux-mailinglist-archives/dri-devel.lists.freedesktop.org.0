Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B8B93222
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6057610E505;
	Mon, 22 Sep 2025 19:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GaBPtu0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B6710E1D4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:56:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45ed646b656so42324635e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758567409; x=1759172209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eyJq43O++KjLnjYoBP21Xp+znz9y7wC4OFS1xU5rHgk=;
 b=GaBPtu0SyYInqmLNWXilFhM26EIrNv/4IlFajwFcflk+1P6ABZzBg51vfCQFGpdlfi
 sMN4/CFf2kgap0hNUxWFQJUBwil7R3Zd9slDqV+Fvu+vo/39TLdjvWre885t3U83d3Ob
 iIIkVsC605tkh9GsBOb4WaljT//OYcC+uzOMPNVmDgwM9Z6xjIbB4wq/3H4JhR4B4w5c
 fdEfegoLrh2o9ozVwiHQ4EAFDkqQjP84+RTXzPyvqfOFRmbvz5TafwcewZ4IG+qqm6nN
 Drx36Bxunp25tNLd4jOXKMWQ5aUKIXWYJklX/YDd5it+N9ajMoeRYdFtwg0juOSQmwYL
 KkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567409; x=1759172209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eyJq43O++KjLnjYoBP21Xp+znz9y7wC4OFS1xU5rHgk=;
 b=kJn8klbPrn7zDF5j97P4eWxEwdYEAWpoL/eBKXHnZcjcBvtrBZJZTfzStTaBsAan3C
 oYswZpAwSoRzl1Pl23d/gSapHdwa+n5aN/+4HGgET2jDuXp3AQUKeBh21rNMM6UH1TP6
 gHzo1kQpseURVSFNK/dKPikONSZ6KkQ44xz8U3Guz5/HI9tsqqe7GSeW45HnYoT/EXyQ
 XAvtADd+g/GRj1nWNLc6KNxcGDQzDkTcC1kZBEGumYGVVgJugkQ2FlD2cRw+AcwIYhBh
 R4HP6Ux415a3asDFFnZWtq6h4qjWH1GGmp9uN5xTkR+KRaXDYQTKTuxA9meEaLyjFGAV
 hExg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTEgqOtN2qSGqyR3fPLACegIgO5gj8YwUJBv8R3l9qenR3B7SwLgh/SoMpMx5I4v2780UNzA9z7k4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLFdvoTTQQ0FlhoAKhohRIAmLTHWv8dp5TyLvoyLtdxHU9r5yU
 Y8hChlxl7Cqqr2npS/1om3Pc5C3uFAN/2t32y661Ize4/WJhJIC7hnI2
X-Gm-Gg: ASbGncuW5IehPsg+6RaMHRW1v6deO97sWw7s0vrCLnp0UCrOMvyERRJSS2cy5PfNKOk
 2Kqn6KiJkhj+cppUtpOryJmBAcgmVDy0OG/zmsmYtgY5zDRFwy5Ekk00F5mC7EJ084oF8kVkzDW
 i3Y5kvuyblo4RtUn7T47EZDlgwmZ9trLGKT8DXqzIanI3OKtf0QLZCE4CZjgHrdl3kx9veaOANt
 5ZBf+7isOuqvZu8sCVnXUQYirYn+6tiWvrtLIqB9No9Mam4b1v1wyicn0WuCPGvoYM6+DCl2SUT
 alu0ZxepxwVGT8+r8TrgswnNZpVOJEiITAAeuk8mjXfYSkX4m5NLuWzvaDzOAhCBlP61kTC02U0
 +8gs69RuYfDjDnacyp2qq2OD2uO9ohpw=
X-Google-Smtp-Source: AGHT+IE2hNAByN1u+WlmeKvdGqq3iQsBllgNjf2IKG0z3jtosjk7L/KvCjfFpn/X7tEHILQPO5GNNQ==
X-Received: by 2002:a05:600c:45c9:b0:45d:d1a3:ba6a with SMTP id
 5b1f17b1804b1-467f15d405emr134177295e9.33.1758567408745; 
 Mon, 22 Sep 2025 11:56:48 -0700 (PDT)
Received: from moktar-desktop.. ([102.31.181.245])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f0aac439sm241209755e9.5.2025.09.22.11.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:56:48 -0700 (PDT)
From: Moktar SELLAMI <smokthar925@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Hawking.Zhang@amd.com, tao.zhou1@amd.com,
 lijo.lazar@amd.com, ganglxie@amd.com, victor.skvortsov@amd.com,
 candice.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
Cc: Moktar SELLAMI <smokthar925@gmail.com>
Subject: [PATCH] drm/amd/amdgpu: use kmalloc_array instead of kmalloc
Date: Mon, 22 Sep 2025 19:56:35 +0100
Message-Id: <20250922185635.50828-1-smokthar925@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Sep 2025 19:47:43 +0000
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

Replace kmalloc -> kmalloc_array in drm/amd/amdgpu/amdgpu_ras.c .

As per said in the Documentation/process/deprecated.rst, dynamic size
calculation should not be performed in memory allocator function
arguments due to the risk of overflow.

Signed-off-by: Moktar SELLAMI <smokthar925@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 540817e296da..8dbb9e349a8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2566,7 +2566,7 @@ static int amdgpu_ras_badpages_read(struct amdgpu_device *adev,
 		goto out;
 	}
 
-	*bps = kmalloc(sizeof(struct ras_badpage) * data->count, GFP_KERNEL);
+	*bps = kmalloc_array(data->count, sizeof(struct ras_badpage), GFP_KERNEL);
 	if (!*bps) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.34.1

