Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C090B1686B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C89C10E6E4;
	Wed, 30 Jul 2025 21:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EFydgf26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4FF10E6AE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:42:09 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2402774851fso35699005ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753886528; x=1754491328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FYHDRzJKOaAYMNCXSgPR1P5klbcOxCCuVtkaiNHOnc4=;
 b=EFydgf265OL+UaxNkp2Ll9rQGo7M+BbhjmOc9UD9JHPhG5QQV8ljeQsa7mXombi4ZY
 57RAImfnpigwsnxyGi5fsvGtR3ANzTAjHQvYHSwnBY94MnCubV7wdBbfjvOcXpIL7iDx
 g6zkQazekpz3o2W/GjSlI3tFBK2WYl+oeTr6haOkunAkct1koa8iVxd/9zeESz4n/nlX
 a+EP3w4zyP3Cn7thti2zNVSGCCaa/67H9pvsBp+7oJ5Ku6B+T6Bn3xCfV3bhRJqf0OY4
 wZvYzUJyl+BfYIyyO3mnO+CvPX3oA2zOW4glJSorOYT9i28QNvWuaJYKA05Wc6Ve3iOA
 X1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753886528; x=1754491328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FYHDRzJKOaAYMNCXSgPR1P5klbcOxCCuVtkaiNHOnc4=;
 b=QkzfaFYOqsUJSy9ETcF/apucGOmJ11A0ZkRv2R8YaM5nuQXZXXOx0ZNNeg6MsjqI9k
 W+c8Oprb11p1XjeYn2lUy+VCVX80FOqjptpC2oaByBt8tplrilLiqtaA3AKYyZAA/fbi
 mzZCV3lphBnwjj05mQMVdfr1sAg/aqVHu2l8gRNknHrewMDhdmK02TzJdBh2EXBOovHi
 FbnRqZYQt7Pn6V431H5NUvRcp2OhUpxHYceDRPafNFyutp/5lFBnhT5+F9obv7hlKHD7
 D1Kt7Nhd7qPtxUO6gBPBfA2Wwf4KilkpScPnMhnSLXhRZP3XExTXAtadWCBJW3r9Hy5T
 wgcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXykw8/CwEzBOcqaT+toJM8q3K+9q/Cik//OhW2Sl2/gnIVKAU1k/qmmIEr0UGeiCUpsO4G/zcD2D0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyItZ8bZsERlZ03tZlUfIBaaHtGxJif9NX43pLOrPuxJtmzxAZ
 eXhnXW/RoxAB47o2kTMb21g3Lipavii/Ps94Kx5Z4QNg9M7lMVtzWmUU
X-Gm-Gg: ASbGncskNJHLYbQpHESQkF+xEQ1RXxb1kaCSZRpmDtetStJmn+ROxQCVAKQijKKuJfP
 CLxL/mgN9tRLt+u0LakLwa/teZbTrn13PDJoplbp9r+88G/JFvJoGG+hFLuZLaSo2T6OlZrevjP
 gYSzSidQOBQLtGQXKBlrLwXayechd2Bf7i9TqdjNpH/Sx8W9ZeD8CpgKEQGHckTaAwRm6qIZkU4
 jR6hunicMifcW0lgCoWhJENzbh/KpV9odmriQML46L8ns4Xvr4kki8zcECJn21I1UaGgCVU3cDu
 iJ2klJM9KIMZWLZ5iPkwwZp7AyCL/FFd66JxIQzmvb1dUnkuqZygR18g0X4Y11A8r/UlwWRCUdW
 JO5jZdAml5Ss=
X-Google-Smtp-Source: AGHT+IHHhMReMrcHM0rLPnguJMUg4v42TJz2pDtZFa86c15cEiGMS6XSNlbDGKZ7Gy8VKfe9R0BtaQ==
X-Received: by 2002:a17:903:41d1:b0:240:8cca:50fb with SMTP id
 d9443c01a7336-24096b49247mr42457225ad.37.1753886528338; 
 Wed, 30 Jul 2025 07:42:08 -0700 (PDT)
Received: from Arch ([103.87.142.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ff6e201a3sm87342125ad.150.2025.07.30.07.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 07:42:07 -0700 (PDT)
From: Ayash-Bera <ayashbera@gmail.com>
To: skhan@linuxfoundation.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Cc: Ayash-Bera <ayashbera@gmail.com>
Subject: [PATCH] fixed typo in the DRM UAPI documentation.
Date: Wed, 30 Jul 2025 20:10:23 +0530
Message-ID: <20250730144158.7926-1-ayashbera@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Jul 2025 21:46:19 +0000
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

fix a minor typo for the drm-uapi Documentation. 

Signed-off-by: Ayash-Bera <ayashbera@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..64e002c6383c 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -518,7 +518,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
-- 
2.50.1

