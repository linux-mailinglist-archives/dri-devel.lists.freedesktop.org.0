Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197CC44E0B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 05:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2499310E29C;
	Mon, 10 Nov 2025 04:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PpUEKKEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B19410E16E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 04:00:19 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7a9c64dfa8aso2066229b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Nov 2025 20:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762747218; x=1763352018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSDUDAQE9sOa+voyhIFgd7gTvEsE4t/g4DOsmmFBmrM=;
 b=PpUEKKEqhRIByh0keaRGViByIfECyNxTk8GkpBwbP1j9iBcgW/Q6mL/iRho7uYPCsZ
 2g2Ri1IOlKjoBmc/blidjgiJfETz1FZHBhZD3HHVgafXBekpl6FUZqfx8DV709s6bZXm
 M2JcKtsUx/VXEKkUi8hCZnoY4D2mYuGoTmlbbfXcID9ogKXtQSZgJZC8zrtQ3GVxGp/t
 LgZhfMfrl8NRpcp6YgvK3ucZcRuJspDefGBL83SJos4o9w9IpfbOs9eIz1vKT+tD81FY
 uIULLflprQFsj5rmBWQEI3y6DThGwI3CMmwCfrH9oCHP2X9q82qAHBGvpc7HLA6KHtV0
 sohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762747218; x=1763352018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dSDUDAQE9sOa+voyhIFgd7gTvEsE4t/g4DOsmmFBmrM=;
 b=CIoJ5E4P2woMMu9x1CZG7LGBAmMvm8UfkL0bUZS/8Dy/D5+C1l4+EVQuHBBExjMg5A
 4G9vEh04RPmPEfmNUFQ53zzb05XAipTazw7wsckbO4xx0kkc/z93jz3ueRFFO0vsPMX0
 9RntGiSxARC9myGSq86ZEd82XZKfIAvwJ50Y1SLr9x/VPzvFdgN+lT+WZf+N3xhPy3Lz
 o1HFbWMDWhSF3kL/EJsYz/vsk9PeB9ct/m+y9jKMlf4RequSLyJ66OvAjk6/WeSsA+2t
 gmBCYtydhsrXcXnTtN830JJSzEVrUwa0cWQ5PtNCpbAk/jUaxEiXgM6VuWYvgWqsb7WF
 z6iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhvYcF17JvYSuUn+D7I7L+JYHhtbkA3dY4+JDRq1Gz1Qn2iZtqNaFi5Kp++JonXu831Ft2rGG/FVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4QjnSrEmqp14jpymnxsLXFj7cAxqTX2gg8LKSZTajZ2chRWsj
 uDuWpmm54pdBUgFJzGkcIaLS34o0p6cPvVDZ/dITUX9UDpn/fRTDtJdG
X-Gm-Gg: ASbGncuK6mifYBSRiq1xjJSMmgn9yZYicu4s4y+gzuDIgo6tC6mAWbwi1v/FwIbTfxX
 Ey1PJedSqc+bmPQuYf3DLoKGT6ttj+boXPdBA0KKSxCXCg3aFtg3Af+wqpc13G1xERVCe0NTd3H
 bw4wH1eNoxL4vrAuJVjnU3Y3Q2ZaUPNH79vNzgnxxKzCpgV2tOXbPMpyTqnqn2TdT44JLzZRj7m
 iyyZ7kj6dRAEgtXFn5Yat740249HoVz7K4X/6qAgetuQMdEjEYgalyKTRF/ma+VPfh2h6aBVW1d
 ftO7GM7QT0EGuJUwBVk6iXqp+BoYgPF/IkzBlL7SohquSjMrT+5FaFuZnfnnkryhyE+KwGQ6VC/
 cuoFlCGx1LLo0fHVrr4jNJ53wBnJmXzJaGi4hQBMv+UnYqcbKlFVmjizaY7DHH6V0tmNu9JAreM
 7V
X-Google-Smtp-Source: AGHT+IESDcVDuxfGXnbyvbRCs31L9wp486DOb6hfCBx0l2nolH3Esz13I69INyPLAs5QB4NXfObnWw==
X-Received: by 2002:a05:6a20:12c1:b0:350:d523:80a4 with SMTP id
 adf61e73a8af0-353a314ff11mr9564540637.28.1762747217272; 
 Sun, 09 Nov 2025 20:00:17 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba8f9ed1e73sm11606997a12.12.2025.11.09.20.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 20:00:16 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 2B840418F1BE; Mon, 10 Nov 2025 11:00:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 2/2] accel/qaic: Format DBC states table in sysfs ABI
 documentation
Date: Mon, 10 Nov 2025 10:59:53 +0700
Message-ID: <20251110035952.25778-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110035952.25778-2-bagasdotme@gmail.com>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2702; i=bagasdotme@gmail.com;
 h=from:subject; bh=K4xLzZ2/2eVOt8glPRV1xVtrk/KjA9eAkIyUmF4bX0U=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmCSVl5q2wOvw+ydS5S105U0nDbe3GZIs/m+4+NfjvMW
 mGfU7uso5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABNZa8TIcHCC6e93D7QUnRZu
 2cgXvvRsa2q55vO2/j0vvVdkb/q/Uonhn83+jwvtWgS6F5r0X998xLM6+fqrf89rmppW5cS9iZ+
 wjA8A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:

Documentation/ABI/stable/sysfs-driver-qaic:1: ERROR: Unexpected indentation. [docutils]
Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]

These are caused by DMA Bridge channel (DBC) states list in sysfs ABI
docs. Format it as a table to fix them.

Fixes: f286066ed9df38 ("accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/ABI/stable/sysfs-driver-qaic | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-qaic b/Documentation/ABI/stable/sysfs-driver-qaic
index e5876935e62b34..c767a93342b3c9 100644
--- a/Documentation/ABI/stable/sysfs-driver-qaic
+++ b/Documentation/ABI/stable/sysfs-driver-qaic
@@ -3,14 +3,17 @@ Date:		October 2025
 KernelVersion:	6.19
 Contact:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
 Description:	Represents the current state of DMA Bridge channel (DBC). Below are the possible
-		states,
-		IDLE (0) -		DBC is free and can be activated
-		ASSIGNED (1) -		DBC is activated and a workload is running on device
-		BEFORE_SHUTDOWN (2) -	Sub-system associated with this workload has crashed and
+		states:
+
+		===================	==========================================================
+		IDLE (0)		DBC is free and can be activated
+		ASSIGNED (1)		DBC is activated and a workload is running on device
+		BEFORE_SHUTDOWN (2)	Sub-system associated with this workload has crashed and
 					it will shutdown soon
-		AFTER_SHUTDOWN (3) -	Sub-system associated with this workload has crashed and
+		AFTER_SHUTDOWN (3)	Sub-system associated with this workload has crashed and
 					it has shutdown
-		BEFORE_POWER_UP (4) -	Sub-system associated with this workload is shutdown and
+		BEFORE_POWER_UP (4)	Sub-system associated with this workload is shutdown and
 					it will be powered up soon
-		AFTER_POWER_UP (5) -	Sub-system associated with this workload is now powered up
+		AFTER_POWER_UP (5)	Sub-system associated with this workload is now powered up
+		===================	==========================================================
 Users:		Any userspace application or clients interested in DBC state.
-- 
An old man doll... just what I always wanted! - Clara

