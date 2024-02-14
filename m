Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332D4855766
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 00:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7114910E2CC;
	Wed, 14 Feb 2024 23:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KstEo+x+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E6110E0BE;
 Wed, 14 Feb 2024 22:44:33 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1d94323d547so2094535ad.3; 
 Wed, 14 Feb 2024 14:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707950673; x=1708555473; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3JywjW54T+fBYIkPqZ0r52IU6fFZGd6Cdajg00iAyqA=;
 b=KstEo+x++Fx+d2CiBW4Yd4fcclmwZdbLrgmdGRpePjA4Ha/ptR/lJATHvy2mR5A7fu
 wfeXIjF/NtrA0NOvbqpx94Hvx3hehr94LvoFEGY3NumQE4orIiBIAdZ30086aQe37ALW
 GSvUMBcJ6gNyxYTxZoy24AkCSH8K+PMbiFldNyaLDV0vUKN1CYqKg3nTveNF4JUXCgNf
 JfHJmbKkHsi9XGvueIBsgVDN9XrDQhZjYQYpJ8OyCwggaVtyyAo5o9NuD1Aji0NVpfRl
 sYE0/NxlJ6Q+JDFM961i6dCctevF8Zxhn4i179PXfV6X/lCYT3BS7f3pIfr6SWcxW88B
 FCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707950673; x=1708555473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3JywjW54T+fBYIkPqZ0r52IU6fFZGd6Cdajg00iAyqA=;
 b=l1QPD+KFvh8CVBHz339ViiqzadaCpUhapIr9Wu8T20N/H86VLUQ3vtuiG8tBDu9GYq
 XIRRypuf1H2Q2acDoG92bXJ7dGvbUs1r9noHxBSP8ZMpbHgT/pEz/jjB2mROG7sFldKS
 c97jXxY3aFC1QmFPcuvZh+F9kqarZ77DoaAft2HRxAtds+4t758ylLdq0LNNqLG5LAtT
 PES8U342l2PuKKqRD8i09hFJN8q7n5dEjWG3TKOfdWJQfvXYuNQWSUH75dFM/dOnmFbB
 ck7VUVQX/MZth/0Q1ZbxCn3KTrO10DGeocCQyQ7R3XFPZ+YvhgmyMvoFk+ZtncH5cnFX
 VA4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDFEApHM2VdXnVxAvFFQLjSMp/0laSl+38NeXWls2TgC/oY4OemZcX+aNSMWX6LBKZYUDFHWpOaPDuv1aGSlWEJqPbooApUsmpDWuITuUeARgU1D3DRZGFNSI1vW38cnXpeS+Qx1fYG/agt6IXlw==
X-Gm-Message-State: AOJu0YwlcgQ2El8h7WBdelZezYqS2sSsZlR0e+XJ3JkhkOCQ8OdP0gb2
 KminZ6VcfDDCWwcvwj8KHCDDnVceOU8m8xsInvgx+/+mAogLyrKeP13YgV86sZs=
X-Google-Smtp-Source: AGHT+IGgJS7SuGWw/rt854cSssOAUSoxcDTXrkdQaT/B8eKFuwMa5+suH8+Q7FIOm96zpY1FtOJQ/Q==
X-Received: by 2002:a17:902:7ec1:b0:1d7:133e:5c09 with SMTP id
 p1-20020a1709027ec100b001d7133e5c09mr14830plb.22.1707950672419; 
 Wed, 14 Feb 2024 14:44:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUVMhRyDVtH+n6FXXZIp5pFOCOGy05TdDDqMk1HAt1yI4T9JpOnOy+RYeaVujTfvjuZ4d6wPHnaDaLcqbWl8WcZ4nFaVk8l5HcFuRMCwrozhMQSO5LuKSehygfOTfUPL5/nzE+gTVYDtlxtoP0PyX9IaLwnA6lfi+fedemrPgN3YOxbnfWA7DzyGtXAOb3ShwUkc5JtouYs/dMxZ4myPtLBdfw4BkVyIBlOLVsYwD5w/n3oLc1aqwwClf5kzVBrz7PL9u9qGiZsuMH/bzI+8OpUIXDWIRxmEEkK9Ug9BPTGrYOHegTq4+bLK7ML6kOIzJNWbV4Ygb8x17BCu6jqrxKMKRyTqJefmR0cd1b49Jc=
Received: from localhost.localdomain ([179.225.251.251])
 by smtp.gmail.com with ESMTPSA id
 jv12-20020a170903058c00b001d6f29c12f7sm1077950plb.135.2024.02.14.14.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 14:44:31 -0800 (PST)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, Rodrigo.Siqueira@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com
Cc: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/amd/display: fix codestyle for some dmub files 
Date: Wed, 14 Feb 2024 19:42:14 -0300
Message-Id: <20240214224217.15514-1-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 14 Feb 2024 23:40:07 +0000
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

Marcelo Mendes Spessoto Junior (3):
  drm/amd/display: clean codestyle errors
  drm/amd/display: clean codestyle errors
  drm/amd/display: clean codestyle errors

 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h   | 6 +++---
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c | 2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.39.2

