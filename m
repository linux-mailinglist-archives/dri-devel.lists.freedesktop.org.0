Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9A5B18280
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E28110E857;
	Fri,  1 Aug 2025 13:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dac3BYDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A39D10E853
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 13:32:41 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4560cdf235cso11418325e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754055160; x=1754659960; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2idx5QSV7SbSw8eO9muSjti0H6pMvCzwd4EGmVUbV4o=;
 b=Dac3BYDgfV2VsE7lZat+0KkdwnTnWiPYC1gt66d29BqEPONw2zLMb7elY2JxbfQWvH
 mJna2Yqx9x4jNGjqezGKjFYQzl8oLOq4D2R+G2BxuZ6PCzb2YnMk/p7ea6MCVTjUR5Xn
 ndzx/cR5wATMiFNJMA5cvnB2eqZQZ/ep6ozokdkdqW+l917WTN7Zw68P7U87byOcAAmr
 AMX61s+hSpqc1TtnZFSssz9BrtzEJck0aJmWWujSxAS4wnZ6Lz404Htpp+hyJv7N55KG
 NkX/hM/lqFscaHgSw/fD6Z1YmNtHl6qtURBY7SB/kT+QYtLDGt6Vz6uVadItPVFVTzaD
 DcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754055160; x=1754659960;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2idx5QSV7SbSw8eO9muSjti0H6pMvCzwd4EGmVUbV4o=;
 b=h0jcNtFkVeZfo4vJG9jM6gqJWNGeIyNWnjn6ddmPkZbUNhhFl2UMSBmNc9IeK/Ojqv
 57/JAYhg1O1nRn4uWslC2fJ0nineN8NvUFTC4YGe2UU8b/HSZooyByoSOlA/4Wt4iJOu
 Y8GInyqiO9Wz5ZXcn8QGuAjOhkRUVGe9MAtavgOTa7Q2Dn806+UPygK2sWJnk7SqFw8Q
 u4WApm+FA8977UpJCLum2gOVq+YDKaT5zk1SLOr3h9XYBTMxZxvZmHxcfRZaWVGV6AJi
 ab4ELCUrzakWHtnjMmWh1/P0WE+A0W1uQEtlX6ziaRd2fMOxMO39NyIz4KaEbu5PzHUU
 m7Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnw6xl5clrijs4LFAxmE7cq4KFYeweXh195Q0dup9b//qtR2RMx5EckmaJEzPQuLPfv+EQoIKMXhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj1RIvABiHgo5Q54gUh2zifo74Gcw1Vz2GM7zbpgTQc05q2UBN
 jTEWcBe5duy+hWY1i59ENoK5Oeik9NXgUaQh28j5Vt1+y7Xxjcy0KM6sHuKFoxBSQDk=
X-Gm-Gg: ASbGncupC+elKPFoB4OAiaeoTG6CZ4X7pf0hIaAy915zWy6BrJAynWRuCdR4sF7Slv/
 86YWQLsljvTQVJak04o1pDS2F6IRZG8V2gZTZn0gLXNBlDoFAZw5EYaK8R4lLjl/ofwxeHU13xl
 nOvEWcTJFY3POaOpK7sTLTCACooXYfvkdiO0X8TdMK3SyugItEO8m5eMT+iKGdpj970ra/KYVM2
 dttluwB34qh8i9JO4DBvWodlUqE6tV5tqLJcZIsP+gONAFmZPW5kdua1RLsKbj5gILXqCrOaWWP
 eNUSWAb4qog37mSiNwcSskH8e6aodZRYcmd9giFjBFDoEd2F1Uf6Izr4o0HK6jlPhdKMYzAiIbr
 VwlEdXjfMRuyOIfM4Z11kVfhCt0s=
X-Google-Smtp-Source: AGHT+IFIP925vY6Yo9eRXJ5b38/MY0xKS/0uwFqRgqNx/TMNMJnubKb87tJwBNeV97YGf7Vh3ES1Gw==
X-Received: by 2002:a05:600c:810c:b0:453:6424:48a2 with SMTP id
 5b1f17b1804b1-45892b9e335mr130336025e9.10.1754055159772; 
 Fri, 01 Aug 2025 06:32:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458a7dd8cdesm42494865e9.19.2025.08.01.06.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:32:39 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:32:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe/vf: Fix IS_ERR() vs NULL check in
 xe_sriov_vf_ccs_init()
Message-ID: <aIzB8-Y6wtZvfNQT@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The xe_migrate_alloc() function returns NULL on error.  It doesn't return
error pointers.  Update the checking to match.

Fixes: a843b9894705 ("drm/xe/vf: Fix VM crash during VF driver release")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index bf9fa1238462..e363240a3455 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -271,8 +271,8 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		ctx->ctx_id = ctx_id;
 
 		migrate = xe_migrate_alloc(tile);
-		if (IS_ERR(migrate)) {
-			err = PTR_ERR(migrate);
+		if (!migrate) {
+			err = -ENOMEM;
 			goto err_ret;
 		}
 
-- 
2.47.2

