Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAlfA4iDk2k46AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:52:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B474D1478E2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0782E10E0EF;
	Mon, 16 Feb 2026 20:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="Oew0V/a2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Mon, 16 Feb 2026 20:52:14 UTC
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801FC10E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 20:52:14 +0000 (UTC)
Received: from relay10 (localhost.localdomain [127.0.0.1])
 by relay10.grserver.gr (Proxmox) with ESMTP id 291C0459D0;
 Mon, 16 Feb 2026 22:45:55 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay10.grserver.gr (Proxmox) with ESMTPS id 2B00145975;
 Mon, 16 Feb 2026 22:45:54 +0200 (EET)
Received: from antheas-z13 (unknown
 [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 397F01FDD77;
 Mon, 16 Feb 2026 22:45:53 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1771274753;
 bh=5I15CEIJuFRaaPVr6U40/B0JeGSgzopw8BSrUr+LxNI=; h=From:To:Subject;
 b=Oew0V/a2vMDpcAYx7yxjv5u7Ll0/cwGxcolrwt04NlI73v7gG7dwhPW5w92eRHOcU
 zCdpDdMFQ2Rt/R+hMMws6iol8Hr/cTnQeR6/cY8d25PTeRWRnb2PNaHrLQF9oVDI3v
 2v2qtfbN5Ro5eu5l0YcI4yd2JANPf/RML4878VGk8OsRXNxtEyMVG2NT59RrxaXTur
 bbMjIcKM+LHMJHXMErrJ2HlfpXScXXoq4j1hd+PTCV3SVrMMeTSMjhVQbyiVRylMVV
 hju1dC0PguS8wD9vn88P4lk0nmSB7T6JPSxX7kGUgX4vk+xvU/iEMJ6QZ2fDpT81oD
 fS25i7QQrRbBQ==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1)
 smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, philm@manjaro.org,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v2 00/14] drm: panel-orientation-quirks: Add various handheld
 quirks
Date: Mon, 16 Feb 2026 21:45:33 +0100
Message-ID: <20260216204547.293291-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177127475371.3070151.9210313217055670043@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[antheas.dev:s=default];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,manjaro.org,antheas.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[antheas.dev];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[antheas.dev:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkml@antheas.dev,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B474D1478E2
X-Rspamd-Action: no action

Same as V1 with an additional four quirks. Also fixed indents on A1 Pro.
Contains various handhelds. If we can merge this great.

On top of torvalds/master.

---
V1: https://lore.kernel.org/lkml/20250904175025.3249650-1-lkml@antheas.dev/

Antheas Kapenekakis (14):
  drm: panel-orientation-quirks: Add AOKZOE A1 Pro
  drm: panel-orientation-quirks: Add additional ID for Ayaneo 2021
  drm: panel-orientation-quirks: Add Ayaneo 3
  drm: panel-orientation-quirks: Add OneXPlayer X1 variants
  drm: panel-orientation-quirks: Add OneXPlayer X1 Mini variants
  drm: panel-orientation-quirks: Add OneXPlayer F1 variants
  drm: panel-orientation-quirks: Add OneXPlayer G1 variants
  drm: panel-orientation-quirks: Add GPD Win Max (2021)
  drm: panel-orientation-quirks: Add GPD Pocket 4
  drm: panel-orientation-quirks: Add Zeenix Lite and Pro
  drm: panel-orientation-quirks: add SuiPlay0X1
  drm: panel-orientation-quirks: Add OneXPlayer X1z
  drm: panel-orientation-quirks: Add AOKZOE A2 Pro
  drm: panel-orientation-quirks: Add OneXPlayer X1 Air

 .../gpu/drm/drm_panel_orientation_quirks.c    | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)


base-commit: 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
-- 
2.52.0


