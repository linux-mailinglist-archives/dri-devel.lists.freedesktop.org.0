Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70E4940A5E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C1010E4E3;
	Tue, 30 Jul 2024 07:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WstVNrP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6660E10E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:15:01 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1fd6ed7688cso28366155ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 00:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722323701; x=1722928501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGBS2rpr+A3aPueh3D6OD2pyezLrXyWzp0rS6hZNrGo=;
 b=WstVNrP4WIt6JlZLhggW52bNsVfrRa22MdSio5YYQZOtuZff1rM7zZ6P/48iEFSwxH
 xP8l2GyHqnecAzNBPiMT9arLCpWlUAv9+I/c4+aVQpV0sj8QO//xGhnRoKnlIIkPq+Hf
 V5tjH6qj+V6qcg/41ow3S6AprYKSRDQicPydUz/Y9KASDJubbqUOpNQCzHbb+eb3uv/U
 L+i5kkG9BGqbEai/2k6tmNcChi304Nr6LYNqihtC3AsE3q3h2rtJL+HJt/iOErkd0MbS
 4kkXpuUOK1OKImwReLBTMLyuVGrc0sKSGebNQN0x15B/AcXVmSrsvBVOU1iNcnNF77Zp
 uE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722323701; x=1722928501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wGBS2rpr+A3aPueh3D6OD2pyezLrXyWzp0rS6hZNrGo=;
 b=H2ysDjfI24Y5AYphCaxWh5/BhcacD9YR4lQTzDTx9cXC7aGEIUm22zf1Zcuc/gHgJb
 wRuP2ahctXNq+FlBQOJli6AeIkQ5m5Nd1btkgeVKfIYwFL658eQ+CCil33bRq9fU2VVt
 5oh7mnzAytID2ctPg1pRysi+mK7Mdy5PKeWe7mOXoTjGVkiuD3W5Z/w1cgig4tzKM3r+
 +9iv8mzNUwZShLSnM5Pnt8CTxpO/g6n3/gRkjhplcBzJTJ/ee9wIEEBOVEs2vTbt/UsK
 +q7oy7PwlqoSBUVGrzvgZ3cIK7kzBpFg80DgQLO9ZoPrdWJsqEN1R/I1cTXtF9voFGiW
 67RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK10unTym/TQMGJ/CEgzvDseZxGnAaI4zz41fYAT7R0InBNhtboprhBXC1Imr+W25oNBsZ5u9Fe/K/cZdy5Z7KkppMkbRyIdJdkWm0O3yf
X-Gm-Message-State: AOJu0Yy4tsTTyhn8JwXni6kUzEvFp10xUMxTZPQm9D+QbRwd0NzPAM9K
 7Th/kNn2ZatqOOmA+JF8mZmwP5RoZRyzSTdAqQViuEMAfJt7Fq5T
X-Google-Smtp-Source: AGHT+IEqaChifI36y9GRjZ1BIZXEH3NXZ4BPZ7FAGlh5To/g48a+6rZQW8YI1/pp2Aw1QDfWYAHgCQ==
X-Received: by 2002:a17:902:fb08:b0:1fd:a72a:f44 with SMTP id
 d9443c01a7336-1ff0482b8acmr64992035ad.17.1722323700747; 
 Tue, 30 Jul 2024 00:15:00 -0700 (PDT)
Received: from c4897d9ba637.debconf24.debconf.org ([116.89.172.26])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7f1aa18sm94810815ad.190.2024.07.30.00.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 00:14:59 -0700 (PDT)
From: Sakirnth Nagarasa <sakirnth@gmail.com>
To: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH] staging: fbtft: Remove trailing semicolon in macro.
Date: Tue, 30 Jul 2024 07:14:55 +0000
Message-Id: <20240730071455.37494-1-sakirnth@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <sakirnth@gmail.com>
References: <sakirnth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Jul 2024 07:54:11 +0000
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

Fix checkpath warning: "WARNING: macros should not use a trailing semicolon
in fbtft.h:356.

Signed-off-by: Sakirnth Nagarasa <sakirnth@gmail.com>

---

Hello, this is my first patch to the kernel.
---
 drivers/staging/fbtft/fbtft.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index f86ed9d47..45dfc92b8 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -365,7 +365,7 @@ MODULE_DEVICE_TABLE(spi, spi_ids);						\
 										\
 FBTFT_SPI_DRIVER(_name, _comp_vend "," _comp_dev, _display, spi_ids)		\
 										\
-module_spi_driver(fbtft_driver_spi_driver);
+module_spi_driver(fbtft_driver_spi_driver)
 
 /* Debug macros */
 
-- 
2.20.1

