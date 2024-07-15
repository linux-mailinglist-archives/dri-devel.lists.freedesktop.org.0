Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8B9930CEF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 05:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ECF10E161;
	Mon, 15 Jul 2024 03:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="fMzgi17m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F18410E161
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 03:18:58 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1fc2a194750so3358595ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 20:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721013538; x=1721618338; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ju8DrbZ6bInn88qO2FCZ8unT05Q9AQ07iShZqqDav6w=;
 b=fMzgi17mmbql7eJMFtORYOz8yez6wHiu69CVrH85zBCE8iQgW2qWEGxSSdo/HlHIVg
 pySSCAZFV/unpwY8juyO+MifeESO7heb1lqpfB6Clvg8s0Fl7lUYEdcweVmmCYGGI4UL
 hU5sSjBdJY6+fB6aXfFShcoEJ9N0ROiMR405K9SAeAnXaIzTuqYrZUoninQ3ofJH0IIG
 qFriLG3denhBzsUjE8ZIiTlN5EoSo6TaqTzlVh5TNrCzaMULkRQLWuc5tGurY1m64rV7
 CO5WRwms+7ru93tJEcAIy1t5f49v/ktcWEWZ/8uLwEwIKLP13Ut0k/9d86pCmAPTt3j6
 K9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721013538; x=1721618338;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ju8DrbZ6bInn88qO2FCZ8unT05Q9AQ07iShZqqDav6w=;
 b=LDF88wh8bIA3bTRsd5Yjyx3V9xqK1VDiF9brG42nfYuh9bpqJrcez/UnyVR3DLenkq
 7ww2QvFpgJsqW3s3qxQhvyUSbz0jRFH+r4hyTieYkpiBvYozHgl+h6i8kcFvJHWJPNmK
 xcBws96h48UKfPOO2XXsOddmLu63uIomfzETrMOm4SuhwqdjiEyg7JWtcqAb7a680099
 zP+xEXJRoamwwLu6vCDza31JNnrZYVCh+axJB3+oZppN+1hMCLyxk8YBuSILtQkyaO/Z
 0jJtpqLJYNN8SGy/BS+TQEmpcAtfFD8Oj7A8+U+ieimpinl9nGIkludvAN+ZV21XDrKb
 jNQQ==
X-Gm-Message-State: AOJu0YySyChcex8+iuIX2bXiskSxVWE/zZP1NNKz3reDgh323QHCJfXb
 fHmgIHuAkg5wdvuqHOqHLEaqPOyH5awTKoNE9Xog2312RQ5UJrF9Xfdpbm0Ldo8=
X-Google-Smtp-Source: AGHT+IHkwiw3EzjwMCGtmvmLnp16oQUFGBX4iFQ0TKvfa8nazIkjDovF36AKWz+RcScrp1yYyjzrew==
X-Received: by 2002:a17:902:ee54:b0:1fb:5808:73af with SMTP id
 d9443c01a7336-1fbb6d91566mr121255385ad.61.1721013537636; 
 Sun, 14 Jul 2024 20:18:57 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc451e4sm29962635ad.247.2024.07.14.20.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 20:18:57 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@google.com, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/1] Fix the way to get porch parameters
Date: Mon, 15 Jul 2024 11:18:44 +0800
Message-Id: <20240715031845.6687-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

The current driver can only obtain the porch parameters
of boe-th101mb31ig002. Modify it to obtain the porch
parameters of the panel currently being used.

Zhaoxiong Lv (1):
  drm/panel: boe-th101mb31ig002 : Fix the way to get porch parameters

 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.17.1

