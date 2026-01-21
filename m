Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHbJN6pecWnLGAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 00:18:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7545F63E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 00:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7316B10E03B;
	Wed, 21 Jan 2026 23:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="itkKlVVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B32910E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 23:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769037477;
 bh=raKq3vJAy1xYlXJ3j4zfMGnhmo0+q4HQy4gbDp6nNys=;
 h=From:Subject:Date:To:Cc:From;
 b=itkKlVVpHbCYaEOsFnSkJA6SJZ5+C3VaDUkgnIYHMxONzdIJVHbyNuKLkN6tgIF0B
 /J/SHhSIma+OYaxm2XhvKd+62Hw9v9TnSgRiwhh+QpFzKr75fqhS6nipiu1lSLL8tP
 B4fHlvUBdmiKmtsO3G2jITrBodxwIp2aYkVIfq3Nnby3eQ32T5YxREhNANbmdwyU8S
 CipZkkPeSgfI/mbBqut/QBxcejCSQC8O4an+3feQSvibClOtCO10yNPiWni2jn57+X
 Zfag8JjFZnuHUpbHmGvnyp05TJv3QosdV/73CULFGrYzKcDzGiIt1vB0xtkz4DZvw/
 SEvsWs84CyaQA==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EA3E17E0342;
 Thu, 22 Jan 2026 00:17:57 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/6] Rockchip DRM use-after-free & null-ptr-deref fixes
Date: Thu, 22 Jan 2026 01:17:33 +0200
Message-Id: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI1ecWkC/x3LQQqAIBBA0avIrBvIiRK6SrQQm2qILEaIQLx70
 vLx+RkSq3CC0WRQfiTJFStsYyDsPm6MslQDtTS0lggXPVEPXOXlhN4NRMHZvu8Y6nIr/6Ee01z
 KB8v24fVeAAAA
X-Change-ID: 20260122-drm-rk-fixes-a7622c71553e
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:lumag@kernel.org,m:kernel@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[rock-chips.com,sntech.de,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6E7545F63E
X-Rspamd-Action: no action

The first three patches in the series are fixes for use-after-free &
null-ptr-deref related issues found in dw_dp and inno-hdmi Rockchip DRM
drivers.

The remaining ones provide a few minor improvements to dw_dp and
dw_hdmi_qp.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (6):
      drm/rockchip: inno-hdmi: Switch to drmm_kzalloc()
      drm/rockchip: dw_dp: Switch to drmm_kzalloc()
      drm/rockchip: dw_dp: Fix null-ptr-deref in dw_dp_remove()
      drm/rockchip: dw_dp: Simplify error handling
      drm/rockchip: dw_dp: Drop unnecessary #include
      drm/rockchip: dw_hdmi_qp: Switch to drmm_encoder_init()

 drivers/gpu/drm/rockchip/dw_dp-rockchip.c      | 35 ++++++++++----------------
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 +++++-----
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c  |  3 ++-
 3 files changed, 21 insertions(+), 30 deletions(-)
---
base-commit: 68b271a3a94cfd6c7695a96b6398b52feb89e2c2
change-id: 20260122-drm-rk-fixes-a7622c71553e

