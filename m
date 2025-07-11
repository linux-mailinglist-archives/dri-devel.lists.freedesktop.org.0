Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACEB02045
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 17:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6573B10E293;
	Fri, 11 Jul 2025 15:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NQv5Jx8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3D610E293
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xcuVlIW2/MlavcDT17bfI8/SXQJBRO98cWBxxKEsYSk=; b=NQv5Jx8l7w0ZZTvD3XRQpu9T6H
 Q6vAn9w7xxweGjTaW3/1fhBDAUwoMY8wB7RR/hF/SI06+ORge7aT+V1kTlL+dD9aw0KUc3Eu1u+Uc
 UnwcD9XKuIqjkZemuytrlJrCAeLm3lyqXG8RVQOcp7f2Uj54b4uudUp3McsGun9iaDX51HW8r2hUC
 BFzYOvCW8AgbgbS9sJvYDR9WeT6if8rIdwd3RNaNTRaJ0nE72tR9x1dApqRZ/IhC4CnRD2vDd8+0x
 WG6jEtcmlha/pt+nLeBV5DAq+bYJ0f0wpwuzzXnsHLtPlZrheEGnVht+lzM7jA455TGkSftIEyrUw
 gk13/6DQ==;
Received: from [187.36.210.68]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaFWc-00FQIU-23; Fri, 11 Jul 2025 17:18:58 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/2] drm/v3d: Expose global and per-context GPU reset counters
Date: Fri, 11 Jul 2025 12:18:30 -0300
Message-Id: <20250711-v3d-reset-counter-v1-0-1ac73e9fca2d@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEYrcWgC/x3MQQqAIBBA0avIrBswJYquEi1Kp5qNxWgRiHdPW
 r7F/xkiCVOEUWUQejjyGSraRoE7lrATsq8Go02nez3gYz0KRUrozjskElxWY1s39Ku3HdTuEtr
 4/Z/TXMoHbrEdrWMAAAA=
X-Change-ID: 20250708-v3d-reset-counter-ab231c87bd35
To: "Juan A. Suarez" <jasuarez@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=xo5M5OsF7bUz95Iy7jRGjJttsQr9SOo6+rGiARGZOlQ=;
 b=owEBbAGT/pANAwAIAT/zDop2iPqqAcsmYgBocStWu9KByrDMJh+bHJXbjXAbZehiPNbvrXT8y
 pfhSrO++kyJATIEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHErVgAKCRA/8w6Kdoj6
 qqBMB/ioX8BDys6WauhgbVMyFtD/dsaeklYNiH+TSdKi6pCY+TXOqo9f994S7yjdJpD0dY4OtUX
 yG6L8seB7RxKUc68o55hKUztLjnhJEzan2aUkPVCim0Eeu/t7Hw6Yz/jvEAvkya/IwDr4luX3WT
 cb8hMw3M0kuyewpdOv83Sk9b7yxUeOCidS6IaGZamqqSVURoegdk8T17T6VtVRLDMM1JIDgUyit
 4f219k5icMw8R44PdckgfYrwraGfvR+B3FOwXcf5RyxFXCXsmNdHeu3zHRQrrU7DDaQsGvwThRu
 KZxw2PYuR0yCautsIK0SCcO9fvyVkU35DuvhgYqojyEL74U=
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

The GL extension KHR_robustness requires a mechanism for a GL application
to learn about graphics resets that affect a GL context. With the goal
to provide support for such extension in Mesa, this series implements
global and per-context GPU reset counters that user-space can retrieve
using the DRM_IOCTL_V3D_GET_PARAM ioctl.

The corresponding user-space implementation for this series is available at [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35965

Best Regards,
- Maíra

---
Maíra Canal (2):
      drm/v3d: Add parameter to retrieve the global number of GPU resets
      drm/v3d: Add parameter to retrieve the number of GPU resets per-fd

 drivers/gpu/drm/v3d/v3d_drv.c   | 11 +++++++++++
 drivers/gpu/drm/v3d/v3d_drv.h   | 11 +++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c |  5 +++++
 include/uapi/drm/v3d_drm.h      |  2 ++
 4 files changed, 29 insertions(+)
---
base-commit: 917b10d90990fd2138b5dbc2d22cfa428c070ade
change-id: 20250708-v3d-reset-counter-ab231c87bd35

