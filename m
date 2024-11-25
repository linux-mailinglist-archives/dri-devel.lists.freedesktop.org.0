Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A69F9D934D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F35610E7EC;
	Tue, 26 Nov 2024 08:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="X5nCCmgO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta36.uswest2.a.cloudfilter.net
 (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6BB10E6B5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:37:38 +0000 (UTC)
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
 by cmsmtp with ESMTPS
 id FZdftmYJGqvuoFc5htQrmo; Mon, 25 Nov 2024 16:37:37 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id Fc5etSMb165gFFc5gtBZLH; Mon, 25 Nov 2024 16:37:36 +0000
X-Authority-Analysis: v=2.4 cv=Z58nH2RA c=1 sm=1 tr=0 ts=6744a7d1
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=e5mUnYsNAAAA:8
 a=vU9dKmh3AAAA:8 a=gA2AQYKQ_t_7bDYX36IA:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/R/8ktimgFp1MMUEeMZMmyHbqIU8LGVD2WqjYNvUGFE=; b=X5nCCmgOO/4M6SaRVygGHlMosa
 Z2I+Vtjx8InQ77ZPoBVhdqpZH03tjmrnott8KX8q+r2oExie8CzkwaNK9+Lrvf6kNTKRQm4V6O0pm
 1/ScB5APAJGpSWNMQcGYsojceruQ39f2QIh7RdwfNZT5pcXHV6zy56uvndWuKE9v+tTOMAYmbXs05
 1gaSl0P3Yf6ysklEzf9M1Ug0/xzPMm3XrUaW+lbzTLwobqtHYqYbwomBiXEVnAaO8FN7vO2n5FSSu
 EKnPl+cxmfewNjwnx+rkV+iHoahG8gOZ4jtmBD0pc4lsKQmEwKTB+VxfZ3I9qI08JbL+aJsrAbgEY
 6ta38asA==;
Received: from [122.165.245.213] (port=38110 helo=[127.0.1.1])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tFc5Y-001iXQ-1j;
 Mon, 25 Nov 2024 22:07:28 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Subject: [PATCH 0/2] drm/imagination: add reset handling
Date: Mon, 25 Nov 2024 22:07:02 +0530
Message-Id: <20241125-pvr-reset-v1-0-b437b8052948@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6nRGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyNT3YKyIt2i1OLUEl2DRCPztKTEVNPUpGQloPqCotS0zAqwWdGxtbU
 A7ZjsblsAAAA=
To: Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732552647; l=1066;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=wz0d94cMgk2jCkE3+IUok1zC9AYzGdZePCRqqYnV2r4=;
 b=prlb1b6SvCi9nOD4ZuXRpjN3ycPphZdm3U7z2CuLxBqeP06ltjCHnpgCBs4WZrh3PWYzKtMzq
 I3feoCWA7x9D0nKi9/eRCw41q3mazGk/LyHX3DVTG5x4ceRX/F5m/MQ
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tFc5Y-001iXQ-1j
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:38110
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 1
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIxNEB6HWRhx4l4N25DT+2/cDOPGua6N+ltqBenCOzpBBCk3DF5WvnMRVTCiX9sXPoWjPwMljt0iyxVqcb5HZ8Lm7fvjUJzPBc2U/IDC5jFWrgAz45GA
 iZHw2+zCW/iboQQ0j3mj4zLwFZgrFCsLu5gylhMElNivD5qLHRcNG4uktp1n6klT9rj/VGtJzhhsUoHhuKC7S26HmCwLfXAUDPVVIGVRc8q/k2JuGcK5lsvK
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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

reset control is included in platforms from Allwinner, specifically
A133, A733. Add reset control from devicetree and these changes are
tested with A133 based helper board, which will be upstremed after
Allwinner power domain controller.

Firmware is used from [1].

[1]: https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/5

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
Parthiban Nallathambi (2):
      dt-bindings: gpu: add reset control property
      drm/imagination: add reset control support

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml       |  3 +++
 drivers/gpu/drm/imagination/pvr_device.h                 |  8 ++++++++
 drivers/gpu/drm/imagination/pvr_drv.c                    |  5 +++++
 drivers/gpu/drm/imagination/pvr_power.c                  | 16 +++++++++++++++-
 4 files changed, 31 insertions(+), 1 deletion(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241125-pvr-reset-0a27fbae5ebc

Best regards,
-- 
Parthiban Nallathambi <parthiban@linumiz.com>

