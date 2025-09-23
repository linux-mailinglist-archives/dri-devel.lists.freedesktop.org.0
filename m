Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72599B97D06
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 01:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB18010E0C0;
	Tue, 23 Sep 2025 23:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="Ps589tdw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8299410E0C0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 23:45:38 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8572d7b2457so8935485a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 16:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1758671137;
 x=1759275937; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=++BDcrVfd8cbOjGvmaYRX2vch6rAhbqO/bo+q5Ibcdw=;
 b=Ps589tdw9RtybnEEC0SdgaLQEXXMTi0wK1eHZtb1m38lWic6Kyo6Q2J0nwqjHjX5iT
 rTxKXQWLABvypcVJP93js33MY6IGjidfZ75clTNxSrPKoGnTzH944fRJCvij8IL0OO53
 lYEOPNwCO6fyv6TgbQRvD5w9oUyCbxn0yq6N/fy0iVebFFyVc9KAE5eAxI4QluQsAbF3
 2//iiQVBGcqmz2O1HSk+Smt4cLScAhLUn+ngZ7/PrdicZjW0TM6VgKIhu2QV8D7GPcBh
 gl5d+aATQmW8Ivb/R+HCaki/DMnwHxwxYmjhc5UHS4kZQL+Ow2kGxfdHa7LyJFALMvgx
 IfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758671137; x=1759275937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=++BDcrVfd8cbOjGvmaYRX2vch6rAhbqO/bo+q5Ibcdw=;
 b=czs2CAkW1n7qmVQ6x6OF/Znu02FjYCwHjoJjshwVB1CYvGVnqigTSZpoQnmtIkXIbP
 lHTCC3lXVJE0nH0N9ZB+p6pMWOOjcZb2b9KFugbBc5A6VHLlcCoS3KRmAaYFJzcJOyQX
 Uwkgm7/h2+mflSrCVWh8cCfwmJhZ9I36PCm4TKZjWx5lmmtbFZN344ktq20HNecVM2iF
 5HgAtH5i7tV7X1Lt8ZzJHNSAwLfdax2Zk0zjWfJinu2v35e1hmM2wj8rMss4jKJ/O2KX
 pAd1yZwj1ofiBsvNUmbc1J/LaN+ZLL9rZV4JNTiRJH7+KqkK1KWenchw5Vo036mCoppi
 AThg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvNFCooojHq8VXCcip6IpISybN+LO9Y2jFV1iQ3tiIgFruHN9mfb6iSjCYVFpEWS/QP2tLz/UywIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/Wt5d4Yrk2fXlu8k7yNOpzu/ATBNkROeKIrCAxpPldF0MvJti
 I7f2aNYRhc/g7zNELnC5m1ZEIaJkqdBR/nuL/fRXh21y2kEZ5h1tSZk7uCh15Z0PtIY=
X-Gm-Gg: ASbGncuJHEeZryJZ4XRXPcVh8s7XiAK29h+iEi6MBZsFd8AlE6owWppac4cg3Bm7wVE
 ibxFLPBLarNZexAHjw3toBdg2RHgMryKnTmMOIFfQE+b+4I5mm9YAnKP8130TS0g3DVUuvbfIS7
 ihiXQlkgyWe2mnOZcyOa+MW7+gsB14m74cVGd8o72yeuFBcFAtrAZA6OEcNi7t5u2W6cb8ao2mQ
 5Zz9JauDhU2fKY5q2OjlXpmGAaO7g187oxs4o4M+gtVlpvnp/bvuweGerH7RQelLUdrXUhTCpw5
 XDIJZtIp3UssUu60Sdcimgl37rz7/lcKA4JL39jEmtOEzwLdWzEIBXQJD2DhDH/L30oLV3avAp6
 9EtWrnE7CmMd5mQAmzSrx+f6tT9VUs42Vx9IpX6u4tvbvyHhZlxs2MQ==
X-Google-Smtp-Source: AGHT+IFRal9X7LmdVEfaQuCk72ASOcG+yGyjc8BySKHKJZwDq9QuviLD9HsnORDiS8CsTQ+WlxJuTw==
X-Received: by 2002:a05:620a:3956:b0:810:a62b:1950 with SMTP id
 af79cd13be357-856e758ca05mr63751885a.31.1758671137285; 
 Tue, 23 Sep 2025 16:45:37 -0700 (PDT)
Received: from m-kiwi.verizon.net ([71.190.100.175])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4bda86b4b94sm94131211cf.26.2025.09.23.16.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 16:45:36 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 0/1] nouveau: On nvc0 membar between semaphore write and
Date: Tue, 23 Sep 2025 19:42:58 -0400
Message-ID: <20250923234511.114077-1-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.51.0
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

This takes the fix from 2cb66ae604 ("nouveau: Membar before between semaphore writes and the interrupt") and also applies it to nvc0_fence.c.

I've tested this on both ampere and kepler. Unfortunately, I don't have a maxwell card to test on so that branch in the patch hasn't been tested yet.

Mel Henning (1):
  nouveau: On nvc0 membar between semaphore write and interrupt

 .../drm/nouveau/include/nvhw/class/cl906f.h   | 23 +++++
 .../drm/nouveau/include/nvhw/class/clb06f.h   | 54 +++++++++++
 .../drm/nouveau/include/nvhw/class/clc06f.h   | 93 +++++++++++++++++++
 .../gpu/drm/nouveau/include/nvif/push906f.h   |  2 +
 drivers/gpu/drm/nouveau/nvc0_fence.c          | 31 ++++++-
 5 files changed, 200 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clb06f.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc06f.h

-- 
2.51.0

