Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDpFIQVZqGlQtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:08:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086E2203C6D
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38B110EA45;
	Wed,  4 Mar 2026 16:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="MEg15TKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 347 seconds by postgrey-1.36 at gabe;
 Wed, 04 Mar 2026 16:08:32 UTC
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174D10EA45
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:08:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1772640163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/eGDDREpXLyXXsRoRM29/LaYkjnzfGJW1nFcKyJ95rU=;
 b=MEg15TKJ9dKnRGiNQfNixiR818I/NjLk2USD+8j9tgbqBnYXZQovKppGkDJOu+RpRf/ZC9
 PtD32km8hj5ah4V/r+ljt5vQeBiluQ+3pCRTaX+cS/g8hUtzFJXzIGSN8OrGUTGnH2l3ld
 707EDqmob8iIz94ph6gMphzOtnZebV8=
From: Artem Lytkin <artem.lytkin@linux.dev>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/tyr: fix L2_PWRTRANS_HI register offset
Date: Wed,  4 Mar 2026 19:02:20 +0300
Message-ID: <20260304160220.1777-1-artem.lytkin@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
X-Rspamd-Queue-Id: 086E2203C6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[artem.lytkin@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Artem Lytkin <iprintercanon@gmail.com>

The L2_PWRTRANS_HI register offset was 0x204, but it should be 0x224.
All other _LO/_HI register pairs in the file differ by 4 bytes, and
the C Panthor driver defines L2_PWRTRANS at 0x220, making the correct
_HI offset 0x224.

The register is currently unused, so this has no runtime impact yet.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/gpu/drm/tyr/regs.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index b51e09fe2fc4..acc29f7950c1 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -81,7 +81,7 @@ pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u3
 pub(crate) const L2_PWRON_LO: Register<0x1a0> = Register;
 pub(crate) const L2_PWRON_HI: Register<0x1a4> = Register;
 pub(crate) const L2_PWRTRANS_LO: Register<0x220> = Register;
-pub(crate) const L2_PWRTRANS_HI: Register<0x204> = Register;
+pub(crate) const L2_PWRTRANS_HI: Register<0x224> = Register;
 pub(crate) const L2_PWRACTIVE_LO: Register<0x260> = Register;
 pub(crate) const L2_PWRACTIVE_HI: Register<0x264> = Register;
 
-- 
2.43.0

