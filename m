Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A55ABE732
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 00:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA74410E051;
	Tue, 20 May 2025 22:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BYnjsudl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA6B10E051;
 Tue, 20 May 2025 22:28:26 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7cd34b6ba10so74206285a.1; 
 Tue, 20 May 2025 15:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747780106; x=1748384906; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N21SmxSPk3omJBaRkrrRAgBurO4P89XzlUY3K9X5bew=;
 b=BYnjsudlmNxCOGoJ5wIioAaqs66X3c6+ShQOkf2fcO4B2I4qCu1GadrTXyhnnqqMBt
 ZyVJdpM0xgbmwd7gNOxhsPDi5FnsbOa4BAC50Tr6xsrWuRhZZpXtv6PnWPNBAUF2c0fN
 heqOeyjP2LJUFTnaCdBIpQ0AjH55RKgu8V/u8c7U4JyzlgsCwqPB5Ic9Wd3YEygSIiy4
 B0DMf5jxzfXVcsf3Tc+zolQdvXsX1OpgnlhZOoDkUGEWT+vCiov4eD4AtMDty1jdK7g6
 3tjZBLKpAWVt3LEMOD2fGTVJGaUFSr4UdbwFZeVMUl71dWgGvhq6rffxMn84dFeZAUeC
 r0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747780106; x=1748384906;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N21SmxSPk3omJBaRkrrRAgBurO4P89XzlUY3K9X5bew=;
 b=xSNUW9uJlBaEeociU6dTyXwSDNKVTMLMF/QGAcY9t2SWwPwiy5sNZjj3a7HPB+2RO8
 FaI+o27KnQVVL3ACCaWBf6Xptz9CDstAOfWkpTS2V1kYYUVBRMdPrrfDbIhkIT14m/xt
 jnmkZGHq0aq3bpNQ9GTEyqNeBBcrDicreXiuadoeD0Odmt2+xpz4h+3collG2qVMXMci
 Xb8rQ3xdEo+O9RdaH8EHxB4ePDDFCr4lrDI9ksCS7Sv1WFP889QQasTgKcJnsbdWvbv6
 ibzgbuWp7yO9PuSBFbE+hpERh44EcExdVS6SRpbp8VR0TFXBDNzk3q4OC0lJdrMYyJdD
 9kCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN2tWeOZ5VqLv9E44BbKr3p4tet52/P7ZM9fbF9RhT3jj7Ks4geQccD0Pbql+RtsdVNp0t7uybnaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoSsnfmK9ZpC97eUWRPyorzFbFmLWaSYwSbfCZ0e7YAhuzmrNR
 rRcI8F4bN/YBQ/0S/x4tJpMjh4VnRJ5FEdI8U3IsYrUVe4Mtt4kqBjtj
X-Gm-Gg: ASbGncv6ngT5+t2zQrnXH2OJGTD5bfqYbA3RgoqC1UScPMxaILzM2MCyCJsFmAmiZ0P
 53EMIU1X/IxbS5BahrXQUqMYCajJq18AhkFtGCNcBNcFy3EDVZ0ELY1i0YTltnDC9Yc34oh3Fb/
 O+q3nPxwAhdYu/TR5uYyP8z3oKBy1SbNlOaDgL/Z/TOMJuwTBiK5O+dDIldO2Z0FtmmxkT9n/RQ
 zVed+xTzDo6BAUndQJxccV9GzZkQbZ5NSshzck5RjfkZ7NKp280C6KNUEHJVglV16fWttsnT+kf
 Vw0OvwyOVrV/sJYu03Q/jto+PxV+MEErWJ3i0qSKlQvkcuIK1aVsP2zn0ZiSIlNMVluoE15G13D
 Nq+Z/o7TqJR6S3rSmQHMOhj/Uq1/aug==
X-Google-Smtp-Source: AGHT+IFVGC/+t7o+h3iyrXliEEuZUmRbIpCSU68k/+nxvy9Qz8exktmdtJJCkImbNivCceFzQeNoPQ==
X-Received: by 2002:a05:620a:2709:b0:7c5:9ab7:3012 with SMTP id
 af79cd13be357-7cd467c2fb7mr1041974285a.11.1747780105708; 
 Tue, 20 May 2025 15:28:25 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd467d7eddsm789957885a.34.2025.05.20.15.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 15:28:25 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/2] drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE
Date: Tue, 20 May 2025 18:28:04 -0400
Message-Id: <20250520-msm-reset-context-state-v1-0-b738c8b7d0b8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQBLWgC/x3MQQrCMBBG4auUWTswjaa0XkVchPhrZ9FUMkMpl
 N7d4PJbvHeQoSqM7t1BFZuarqWhv3SU51Q+YH01U5AQJQbhxRauMDjntTh2Z/Pk4F4k3Kac4nU
 YqdXfirfu//PjeZ4/wXs6nWkAAAA=
X-Change-ID: 20250520-msm-reset-context-state-100249ca5368
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747780104; l=1061;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=tAYeMVxuIhGfCUrlR/dvoEmR1WoIfFdgtO7zcm7py4E=;
 b=4LyQ013FIDtV+LaPThv5ujEci0iZZbC3jMtYNS4Igc/MvBICS583AeMS17AiA4fsfwKHV7C3h
 y1S9wxXdoAxAXpa5bEYV1/W6tUHJ3V+8d0WTyQmXe1aSrEE7AqeY5UB
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

This was missed during a7xx bringup and will become necessary for safety
once Mesa starts using BV seriously. I'm hoping to backport this because
it is a security fix and not new functionality even though we aren't
yet using the userspace bits that will be insecure without it in Mesa.

The initial a7xx support landed before the register XML modified in
patch 1 was introduced, but the XML seems to have landed in the same
cycle so we shouldn't need a separate backport of the generated C
headers.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Connor Abbott (2):
      drm/msm: Fix CP_RESET_CONTEXT_STATE bitfield names
      drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c               | 14 ++++++++++++++
 drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml |  3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250520-msm-reset-context-state-100249ca5368

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

