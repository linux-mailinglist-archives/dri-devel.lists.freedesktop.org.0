Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59A7A1C147
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA6D10E2C7;
	Sat, 25 Jan 2025 06:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mzfAcirn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01E110E2A2;
 Sat, 25 Jan 2025 06:46:45 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-851c4ee2a37so198176739f.3; 
 Fri, 24 Jan 2025 22:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787605; x=1738392405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VwH01EKRazu4m0X1GohDgfdyTIUPm+sscqi9yjO/S80=;
 b=mzfAcirnAOuV2YTByAOxfwX0E54jNqKmMoOcqMEmFZAo4AQJoNF5LIA6xMA3s5AjPj
 uipP68gl9kNbUZswgyW5cE61IHaUDUfoJVUehOiFgzNkkjJuBTsqAa41BcciAXQTPAVz
 qWqGWNWx0fZsKNMdOQ/9W78Y743bQN17eaUXPV0FMSsEa1lXQXy5bA/p4uHQ9cooMiUy
 ep7z68LDu24B+jNxWa+I9SdpZvkwMVpfSh4pgN2S8oyEqU9qLnlACxfFYa23KMs+cdOZ
 MVugBHHuCRMacKUgHY7OI6IJcYTlU6ESTKS4n5mF6QUT3uJE4Ezjd1//bAkXt3ZRct++
 js0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787605; x=1738392405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VwH01EKRazu4m0X1GohDgfdyTIUPm+sscqi9yjO/S80=;
 b=k1LkR8FyX3L32oMe6QrQqkS5G5q5NvmySBd/qut/yXLZaHj1Cbb35Lv409iJEPdHkq
 bMQxVcgzR7g6UTqIb2G16Dtk1C3V4Eii8ujiu2GgVJuYCBwCM2VscoNjzCBvnXhcrq+T
 tMLGndfsJ15bQwluBqiaY7p/UYFZYedHhsYF1FiWywA1FGslLeLdMqxNWNxGhjYGfBWN
 ZAsEUGhz0QdSPnXd+/aQVfUOlJoZkMVlmG5WaOt9Ng1RkSgHPmDXlb1ukHDavdu0FMAN
 e7PInWvglJrsHMoQ4Us52Yl0XMw02D7e07q2uBy9Wc93MYA9IwFUV5Ha8N8EdsqlOql6
 bI2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYnLVQqFu9BYDGAJ4Q61bQZoaQxybW0gBUUYOiJkdjvdTc+pEk7I/388cds3qC1Q89ukD/V865h2wueaf/CA==@lists.freedesktop.org,
 AJvYcCUuJI2ga2UcqT95B7acJt7vsikUo68S6UN+Zz8tmgxaoKGCcPVB94HspKm61GFHeusfqNIIRaDFvoJS@lists.freedesktop.org,
 AJvYcCUwbBMTfHV0u+eFVJKeKpMsBMNOUu/AkZeAlLULel4VNWSNF0VE4en4VNE+JZhR/HhhPAAKj6V2@lists.freedesktop.org,
 AJvYcCVRyqagBwMSASHDqyBtDI7zO1e0oQJzC1C19uN+MTtZ1UrRoHPx70d2nO6+XYZDpxB7+DQ/qx2nbUz/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqsxX5xPCCkMvfMWybzTspQAF7FVT8VHG7JWX2jsCD3u9sGozy
 hy/VDoyR7T3Bf5M9hGAfIfA6MA/Af6tMr/CZAR45d8PTfMu776qS
X-Gm-Gg: ASbGnctH38jZ6aGvgCS+pFN64kPPlAfsC6f38ydiYr7HYwvJgfR14387pmhw1UK+TOK
 PlY84nvxB1J5QYWFsB9RHDygUQgrSeLjDYCZ6Ie5uEIiMPyfHXBQR4NwcHg7GPh8sVqTjQO2iuz
 0lG1IkuMcskKGDG5L4rKKTbroaZTwRIFJg/skbirXKuCuQD3MrYF+HOV/MgAgIWSiIvf/7pOH6i
 jBgYYQkAD9psBaueNfbxHNrrrmOJ8jO+DR80mFOXH/VKFXB2E2bYrGoRv29IyaSwJmJ7UcRfyrd
 db5lr31zO8sg838vpcorIPu0OuFSKu+MICDKRw==
X-Google-Smtp-Source: AGHT+IHgeLb1/OEHSiTpUB3Y4KC2A/0xBQxJHz/T9Jw19RrYDifFspA+XBrdojd9CQ+kqm6DqciOMA==
X-Received: by 2002:a05:6e02:3601:b0:3cf:b6c9:5fc9 with SMTP id
 e9e14a558f8ab-3cfb6c96229mr126365525ab.8.1737787605241; 
 Fri, 24 Jan 2025 22:46:45 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:44 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 08/63] dyndbg: drop NUM_TYPE_ARRAY
Date: Fri, 24 Jan 2025 23:45:22 -0700
Message-ID: <20250125064619.8305-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 2b0057058ecf..e458d4b838ac 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -106,11 +106,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.48.1

