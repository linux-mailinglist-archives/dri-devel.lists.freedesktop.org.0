Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNAbAZ07lmkDcwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:22:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C789115A9A4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70F10E633;
	Wed, 18 Feb 2026 22:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cTqtQAr9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB1D10E323
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 22:22:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 527CA6185E;
 Wed, 18 Feb 2026 22:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F6FC19421;
 Wed, 18 Feb 2026 22:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771453334;
 bh=ZHxw9mjElurFBBFJ5JXCeGqeCu/86mNjtr5wW+CUw/U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cTqtQAr94tPVsOJC9u3krItTnDDk/5NByGKEubxgdIs3mXY2vpsEbjUT5inY0oRFt
 6G1ot150bG357fmIMNMluq6CER1Yn9BFXCtn4J5bsJPe/GrrewSveDyMukPpA7gNNb
 +vrQvQNY/NlqAbvtGuxyAihB2DSxDpAZmMfVVaxKRsfOM1xNyF4F5RWIk0+wzZGwBX
 Fx9QLOYn6d/f2v4igRPB4xVzRvhdni4ePHbk6JD6wspYnycMp51SEdFVE0WEOrEOE0
 ZXeilo/XUEB2wzDXYBuL5skC6VT3Eb/wMyhSgX0glnNGaJgC0l5ZR16y1VcET2Go0M
 85HkWvZfhd0Eg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 18 Feb 2026 16:21:57 -0600
Subject: [PATCH 3/3] accel: ethosu: Handle possible underflow in IFM size
 calculations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-ethos-fixes-v1-3-be3fa3ea9a30@kernel.org>
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
X-Rspamd-Queue-Id: C789115A9A4
X-Rspamd-Action: no action

If the command stream has larger padding sizes than the IFM and OFM
diminsions, then the calculations will underflow to a negative value.
The result is a very large region bounds which is caught on submit, but
it's better to catch it earlier.

Current mesa ethosu driver has a signedness bug which resulted in
padding of 127 (the max) and triggers this issue.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_gem.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index a735f860a119..d1169001c83d 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -245,11 +245,14 @@ static int calc_sizes(struct drm_device *ddev,
 			((st->ifm.stride_kernel >> 1) & 0x1) + 1;
 		u32 stride_x = ((st->ifm.stride_kernel >> 5) & 0x2) +
 			(st->ifm.stride_kernel & 0x1) + 1;
-		u32 ifm_height = st->ofm.height[2] * stride_y +
+		s32 ifm_height = st->ofm.height[2] * stride_y +
 			st->ifm.height[2] - (st->ifm.pad_top + st->ifm.pad_bottom);
-		u32 ifm_width  = st->ofm.width * stride_x +
+		s32 ifm_width = st->ofm.width * stride_x +
 			st->ifm.width - (st->ifm.pad_left + st->ifm.pad_right);
 
+		if (ifm_height < 0 || ifm_width < 0)
+			return -EINVAL;
+
 		len = feat_matrix_length(info, &st->ifm, ifm_width,
 					 ifm_height, st->ifm.depth);
 		dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",

-- 
2.51.0

