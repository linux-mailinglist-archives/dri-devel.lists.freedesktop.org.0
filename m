Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCPQHg6Dm2k60wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 23:28:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B16E170975
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 23:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6384710E12C;
	Sun, 22 Feb 2026 22:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tDJn+Gvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A2F10E119
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 22:28:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9640560121;
 Sun, 22 Feb 2026 22:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C58AC116D0;
 Sun, 22 Feb 2026 22:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771799302;
 bh=TCIGixUhPyc/6Ro93xL9qSO+umxyc2HQT+H3bVMe/C0=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=tDJn+GvjX+Ekt4PiBD36A8omAg5P16H4ELWNmaT7KKQ0vEyVXb3YQkl4YrXr+h7cR
 fvLIybky/5bv3vRmCJCGVQUpOFI08bXGAsSd1TOtbTIkTw6WR7x4zDEZndHxXMF8P6
 gKkxQ2gBe9FnfHR6A0bne8j2IqdmEtDRCkpnom7uILhOCyRK8GDSKcVFiS/TBtY64r
 4s57wHQsGBcbd04v0p2pTKdePXWQILXZ/ZVy91Pv0r2RhGleahzgFPGqEI4F8NmrsG
 mW2fZ2RyuR8L1an1WrikTbww/emaOQmNgdjnnf5eDyu6+wwSroA4pNOzX8lpt+NYIC
 bs4sMyOZfZoRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 07D18C6369E;
 Sun, 22 Feb 2026 22:28:22 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH RFC 0/2] drm/panel: Add panel driver for ChipWealth
 CH13726A based panels
Date: Sun, 22 Feb 2026 16:26:21 -0600
Message-Id: <20260222-ch13726a-v1-0-e501d78e105a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02OywrCMBBFf6XM2kBn0kkfW8EPcCsu0sxUs7DVt
 BZF/HeLiri8Dw7nAaOmqCM02QOSznGMQ78EXGUQjr4/qImyZKCcXE6Um3BEW5LzhuvgXFkJW6l
 guZ+TdvH2Ru1gu1nD/lMmvVwX7PRdWj+qCcPpFKcm67RWq9I6T8iMLIhFJZY8h6LgwK1IWaPr4
 F+nyX4y/t6bWXsZkvHIFl0VqG6pmRH2z+cLoxZ8i90AAAA=
X-Change-ID: 20260220-ch13726a-59c6678d53d8
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771799301; l=1537;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=TCIGixUhPyc/6Ro93xL9qSO+umxyc2HQT+H3bVMe/C0=;
 b=rvuCTiLbZy3EM+/1YR1yOEHTd5chLZ1ZaOcCiH44aWtS8Ub3VDjbZAJYDn05lS5aPLW4eZFRM
 3aMBaFSNf5VA8zRTx3VrpliWirfgwajVbtDo9kt0dOUUQkxxOep19Cd
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
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
Reply-To: webgeek1234@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.19 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:webgeek1234@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[webgeek1234.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,sobir.in,gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2B16E170975
X-Rspamd-Action: no action

This series is marked RFC because there is no ongoing maintainer to
list. I am willing to put in the effort to get this submitted in a good
and maintainable state, but I cannot promise ongoing support for it. I
see that Neil Armstrong is listed at the general panel maintainer. Is it
okay to list you in the binding? If not, is there someone willing to
take over once this is approved for merge? There are three more new
panel drivers related to AYN qcs8550 support as well.

This driver is based on the one by Teguh Sobirin [0], cut down to only
support the AYN Thor bottom panel.

[0] https://github.com/AYNTechnologies/linux/commit/d0ff75b09e66023c5f88992706dee4601aa7a437

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (1):
      dt-bindings: display: panel: Add ChipWealth CH13726A AMOLED driver bindings

Teguh Sobirin (1):
      drm/panel: Add panel driver for ChipWealth CH13726A based panels

 .../display/panel/chipwealth,ch13726a.yaml         |  66 +++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c  | 296 +++++++++++++++++++++
 4 files changed, 374 insertions(+)
---
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260220-ch13726a-59c6678d53d8
prerequisite-change-id: 20260220-ayn-vendor-a153168c29b2:v1
prerequisite-patch-id: 042cab8f04748207ba5395dd0f23c445955aaa2b

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


