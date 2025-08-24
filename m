Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0321CB3320A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 20:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6240310E04A;
	Sun, 24 Aug 2025 18:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nRLw/y7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5383710E207;
 Sun, 24 Aug 2025 18:24:15 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3253f0c8788so2152858a91.0; 
 Sun, 24 Aug 2025 11:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756059855; x=1756664655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdgoKxIG8/LQsHbKVpjz+drIjpSbT2c+ZQGF2CUmKYI=;
 b=nRLw/y7as3bx1hMEIJFIb0IFauHtjJ+ZTjnz74Uxk36ZXBBhsWkeNe3kFfPAfihDnS
 srQ+nMzViZZri072rAU4McHvFK21+g6F9/TN80puMl0FP1AkD5JxVmiVFZdzl7oyI/Hj
 DOFMDxuFze7mGWgnrBcbVqvx9ucZddcZsD3Xl7JVEGX/OnuZqeMw61NqNeaidbTrnuMy
 mVMDMokdXNsqspnB8HmF488bMIanDshQm2h4BaWaAQCsQOR6C0cKjLo3Nhto9gCHSIAO
 aQtdD1hd1oCnXdlWOOD8us2X2UIQI/OF/tBKaPFqG2yLNEfrzKFF7iLqETJ/BbLrU384
 uKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756059855; x=1756664655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdgoKxIG8/LQsHbKVpjz+drIjpSbT2c+ZQGF2CUmKYI=;
 b=Tbxs7Q8iLzyoYxWxj4Uh4j3gVpirnPZsZZD/UJcv5x3Zy8ylRl+hzauz/mUzqCktE5
 8q15OLp/+MMPC5mDs/KU2NC6Pq3QzzMp1NtlKinsMgLJUvMFsOv0lfN8Vm3vJZcJRl3N
 9vxNENwC+BeBmf9lil+pd0YJRqbrTbtZDKnzFazQs/7aK3ic2rGTKefhRKAj6RkxE03u
 uOlBaUjYa5j7Ozl67s3qKUpbfB29O9aZfgR0flZDiPtIwLl1OmS1gNrW9cM0FgVsUCGG
 PJgfrmrYTzh1YQ3FOkZWY7m/nKxP3Y5iNl0EjLS7WBzKP2VLektzdho3UQXsLYwDIx1O
 mzNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1m/O3e9D+XF56ONDcb/RT+5ntshPqkXrJE5IoSrNFipCSxwDZ5zwv2QwCbDTJexluZN9Dh4xp@lists.freedesktop.org,
 AJvYcCW1Yu5MsXFYcV0+IoF96EFKC0jAE0KecBXtZ9AT7gckH2hEdDjMtrutATtpXNhE4YkwRXq5HmdC2E+i@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybMIWXF6FYinOqy/KMUdfHVxMCwrjECp3hoAsvI80pohqxtDXI
 Xn1tJCoSDXgzEW1tPSpdzNK+rEaMfwDA+dQZsbEP7nycTFvafK0d2eTm34n8pmeT
X-Gm-Gg: ASbGnctAYOLFRVRbt+MJ0ami9ISDf7XNqsHospxRYMuQqVb9V/DoA22hhX8w3UI9cgu
 QLPzSU80yewnUVQnEkFO3l8OQysrqZuKoJT06I4GhYHCiChLvuNB4VwPjbpfYrd8njS4aJpnknm
 DUQCv74q+cldHn44gw1zjESWcx1Rj5rIOUkBbcTRWBIU7K17xnO3OklXBVgatURIfVLZhJYXRvb
 y/SJNT0BVdlZAwRHhJAF4HQh56EiIZOX09K2OX4zQjsJ2hu7vC0NV7pVD41MlHbpmoDfBR560FX
 kUkKye2Is7lE5LLPEOqO1UwJj+pmS5qsIIwrBYrHj0VqMYYRLiGiREdIZ93onT26dH/Xo9vEMBa
 ayFVFq1U8SAQlOQX4qflr7b9A2Clbsd5oCIBKs3tSP9uok09RbSW6N2yG9Apw1s8=
X-Google-Smtp-Source: AGHT+IFTU5oW4ymRV8/xPeqRq4/qqEYx3zIjjLkoyBxb1dFnjnFQtkKwEnEovKNUweZV2b84+zY2/Q==
X-Received: by 2002:a17:902:dad1:b0:240:8262:1a46 with SMTP id
 d9443c01a7336-2462ee54512mr127900995ad.25.1756059854831; 
 Sun, 24 Aug 2025 11:24:14 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466889f11esm47903635ad.150.2025.08.24.11.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 11:24:14 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: zaeem.mohamed@amd.com, wenjing.liu@amd.com, chiahsuan.chung@amd.com,
 Natanel.Roizenman@amd.com, Daniel.Sa@amd.com, jserv@ccns.ncku.edu.tw,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 2/2] drm/amd/display: Optimize remove_duplicates() from O(N^2)
 to O(N)
Date: Mon, 25 Aug 2025 02:23:59 +0800
Message-Id: <20250824182359.142050-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250824182359.142050-1-visitorckw@gmail.com>
References: <20250824182359.142050-1-visitorckw@gmail.com>
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

Replace the previous O(N^2) implementation of remove_duplicates() in
with a O(N) version using a fast/slow pointer approach. The new version
keeps only the first occurrence of each element and compacts the array
in place, improving efficiency without changing functionality.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Verified correctness using the following simple unit test:

double arr1[] = {1,1,2,2,3}; int size1=5;
remove_duplicates(arr1,&size1);
assert(size1==3 && arr1[0]==1 && arr1[1]==2 && arr1[2]==3);

double arr2[] = {1,2,3}; int size2=3;
remove_duplicates(arr2,&size2);
assert(size2==3 && arr2[0]==1 && arr2[1]==2 && arr2[2]==3);

double arr3[] = {5,5,5,5}; int size3=4;
remove_duplicates(arr3,&size3);
assert(size3==1 && arr3[0]==5);

double arr4[] = {}; int size4=0;
remove_duplicates(arr4,&size4);
assert(size4==0);

 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
index 2b13a5e88917..5100e0e7af42 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
@@ -50,18 +50,16 @@ static void set_reserved_time_on_all_planes_with_stream_index(struct display_con
 
 static void remove_duplicates(double *list_a, int *list_a_size)
 {
-	int cur_element = 0;
-	// For all elements b[i] in list_b[]
-	while (cur_element < *list_a_size - 1) {
-		if (list_a[cur_element] == list_a[cur_element + 1]) {
-			for (int j = cur_element + 1; j < *list_a_size - 1; j++) {
-				list_a[j] = list_a[j + 1];
-			}
-			*list_a_size = *list_a_size - 1;
-		} else {
-			cur_element++;
+	int j = 0;
+
+	for (int i = 1; i < *list_a_size; i++) {
+		if (list_a[j] != list_a[i]) {
+			j++;
+			list_a[j] = list_a[i];
 		}
 	}
+
+	*list_a_size = j + 1;
 }
 
 static bool increase_mpc_combine_factor(unsigned int *mpc_combine_factor, unsigned int limit)
-- 
2.34.1

