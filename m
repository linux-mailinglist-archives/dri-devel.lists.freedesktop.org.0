Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A32BCFCC1F
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F365989C0A;
	Wed,  7 Jan 2026 09:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hUDNbMko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B2610E568
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 09:12:00 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-34c565c3673so280492a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 01:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767777120; x=1768381920; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=z6PKvH2Ow6ko853+AH354pPeqzOvITROthdCzpOchPU=;
 b=hUDNbMkoNx2pAXz7ECL/Fc648/+HKBqdI82/zJchfTAeNhPkGatsd1JoHLSBxiXr3h
 6J1iRpYezn4+CX5cWCw++cgvxLh27+rfbUC/aVV6clphH1lbLWQAdUQEknnuR2OwJxHp
 MBlhgwMLoGacE6HHPEur6WFJ0/GGIPPGWy63ZNPzeXdTITLldKZM2Y0kkheeSRZtXxry
 2ge648IUUgLGm4jJ+GIr8psuZX0WbrhoG8kXd8Qezkn9JSWPwTtNAvWXGq/S7bd8tf5Z
 E5NC/thDhPoIUTrt2aZN4rqRoNTBOsmGXKLkifhou68sxnScdbWQo/5Wcz+MI+k7OYvS
 JyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767777120; x=1768381920;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z6PKvH2Ow6ko853+AH354pPeqzOvITROthdCzpOchPU=;
 b=EHRdxVyrQCjPNvYMqFnz7TNwKivqvz2WOIDiiRKywk0n1J3HuQ/P9CGh3aHXq5tfpV
 U1KqVfqCMJ2w8yxzmYbN3xAKLmhvs/3ra6GlomwzFuH3bwLD9Yd0Qfcn8Hlpvr1Kp6p8
 Pmyi4DgiCKSkEbm4BjhiaGLKuRHds1m2uQqRt1yUXBwJUgb68QQkosYhC6fDv8vfg/sW
 umFCdywqrVIbYi+JFtbiQotDrbY7CMpmWIhELzK4zEYwd1itFrqigKXSgpIzLVuwrFVv
 WmdIKYEXO7Rmca/YwVYwcQwWbwrFrLCrL3rjlpwYmKOMsb+WTdTZIIO1XTXE7Tm56lnq
 U2xQ==
X-Gm-Message-State: AOJu0YwvodRKx46pgMDSHdjr2/amqiB/vFBPC39sL96isrHkxzkTjZvo
 aRyUoriJHAjpqOa3SatfcksK/7j5x1SAyRLfCOI4+5L83970j9HhB1yc
X-Gm-Gg: AY/fxX6MFxA+QnyNw1aRWG7eW+1LQf4M76UKgriM+Q0HG8F94Eryl1KJpCyhBCPr+SM
 EAb0Q0qhuL529uAhATSwbIoIsetX7uVWLUd+/tGAp3cyXHUDzQ3Z3v/ALL5PQRzPAtT7jpura6R
 pJ0aNl4QbxCQwfB194Gt/3T+ZeJe3vCDfMChu3G6ssakKxOXoX83bjQx47CbI9qqVY/pEethX90
 9pVDHfEjU+AyFWurDXkAZLabf6zSJWBAYpJoTGUlRJ5HFOCjKsulM9AORrnxiC2mw46JSOo/fwH
 IPFghCRltjiMTKvQqiVW/g0q/Jhn89qrHxXRE/C+ew1dPwaPlXxjJrooLHdOOGMPW3TVjwwGM0M
 zWDO1uzvqe+5wTIJXJ0n4rZriC00u1l+u3rILS70+hi3rVotI0rDMKSTugQdd4fXsrNrV8J8uU7
 lk+l3sWr1h9fjJ4Fttecka9JDEEukEsU6GNy/lSjfVoHRZ3Sru5sNXYDc=
X-Google-Smtp-Source: AGHT+IET8/5wzNt7Aff+epntdgaB5qdBkTImmgeJLXZCQ39VAdysCsV7Qhu6h3hzUYQd0+SOKj8n7w==
X-Received: by 2002:a17:90b:4f81:b0:34f:5039:5ac7 with SMTP id
 98e67ed59e1d1-34f5f84a94dmr4656646a91.6.1767777119628; 
 Wed, 07 Jan 2026 01:11:59 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819c59e9d42sm4335843b3a.51.2026.01.07.01.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 01:11:59 -0800 (PST)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Wed,  7 Jan 2026 18:11:54 +0900
Message-Id: <20260107091154.27436-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
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

Hi Dave and Daniel,

   One trivial cleanup which replaces system_wq with system_percpu_wq
   in HDMI driver.

   This change aligns the driver with the new workqueue model and avoids
   further use of the ambiguous system_wq. No functional change is intended.

   Merging this early helps unblock and simplify further workqueue API
   refactoring.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit c4f2ae53863de2b5d125c3cdc9ff12668868a74a:

  Merge tag 'drm-rust-fixes-2025-12-29' of https://gitlab.freedesktop.org/drm/rust/kernel into drm-fixes (2026-01-05 14:45:33 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-v6.19-rc5

for you to fetch changes up to 8e6ad0dac6266c5e13874e816b016759d7145500:

  drm/exynos: hdmi: replace use of system_wq with system_percpu_wq (2026-01-07 17:50:50 +0900)

----------------------------------------------------------------
One code cleanup
. Replace system_wq with system_percpu_wq in the Exynos HDMI driver.
  system_wq is effectively a per-cpu workqueue, but its name does not make
  this explicit. Recent workqueue changes introduced system_percpu_wq to clarify
  semantics and support ongoing workqueue API refactoring.

----------------------------------------------------------------
Marco Crivellari (1):
      drm/exynos: hdmi: replace use of system_wq with system_percpu_wq

 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
