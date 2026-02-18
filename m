Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCPnGJk7lmkDcwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:22:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F8015A98E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF81B10E630;
	Wed, 18 Feb 2026 22:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vPX4atLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D981A10E323
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 22:22:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A79E61858;
 Wed, 18 Feb 2026 22:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA34FC116D0;
 Wed, 18 Feb 2026 22:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771453333;
 bh=6MIqgY4UQrceA2s9yZ6szCOXqUxXrfrLCpqE1Gg3myk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vPX4atLZTSW93kyNyMIi+fG3N9D0EjyclpzEMVtLRoowsgTf/FrN+hf1c4+VmKLEN
 /w7aucS3uAtnHcbabrTiosuFLWg1zBWtLxyNzrG3CuubJULpWf7RVsJ7JJodhVQV/V
 U/JLAqRTOtRXKoOYIRrGy2uEtum7SZm6EpW10UGCf16wfUhErEuh4A8rLl6hqbbeKB
 eJPHUeHfctSsWt/HdTINKbesNhAM8inNAsVUceXmyVCCqkVMILIJ0EjlwDjHvLeVYD
 8ltTE3uNyMw3C8aSdkyZk1p0ErZQIrkXtG8H0nKSj9yh2fDUsRZ53NBAkwZuHi1qDF
 bIPo83l08a8NQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 18 Feb 2026 16:21:56 -0600
Subject: [PATCH 2/3] accel: ethosu: Fix NPU_OP_ELEMENTWISE validation with
 scalar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-ethos-fixes-v1-2-be3fa3ea9a30@kernel.org>
References: <20260218-ethos-fixes-v1-0-be3fa3ea9a30@kernel.org>
In-Reply-To: <20260218-ethos-fixes-v1-0-be3fa3ea9a30@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Anders Roxell <anders.roxell@linaro.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Frank Li <Frank.Li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:anders.roxell@linaro.org,m:ogabbay@kernel.org,m:tzimmermann@suse.de,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F3F8015A98E
X-Rspamd-Action: no action

The NPU_OP_ELEMENTWISE instruction uses a scalar value for IFM2 if the
IFM2_BROADCAST "scalar" mode is set. It is a bit (7) on the u65 and
part of a field (bits 3:0) on the u85. The driver was hardcoded to the
u85.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_gem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 473b5f5d7514..a735f860a119 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -417,7 +417,10 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 				return ret;
 			break;
 		case NPU_OP_ELEMENTWISE:
-			use_ifm2 = !((st.ifm2.broadcast == 8) || (param == 5) ||
+			use_scale = ethosu_is_u65(edev) ?
+				    (st.ifm2.broadcast & 0x80) :
+				    (st.ifm2.broadcast == 8);
+			use_ifm2 = !(use_scale || (param == 5) ||
 				(param == 6) || (param == 7) || (param == 0x24));
 			use_ifm = st.ifm.broadcast != 8;
 			ret = calc_sizes_elemwise(ddev, info, cmd, &st, use_ifm, use_ifm2);

-- 
2.51.0

