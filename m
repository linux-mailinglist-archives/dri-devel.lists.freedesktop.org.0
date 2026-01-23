Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAqONHS1c2liyAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:52:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7F79364
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA5810EB85;
	Fri, 23 Jan 2026 17:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="dVBEOuRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81E210EB78
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 17:52:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769190766; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UrqnfEKzdmvIw5PDlOQny41sgrcUTU+rakZD/ryxhminOeunKOoNuf1KdSxVdYjHCdjSBHnge5xk5QohHUOLbdCF0UoaicjoW+J3XxS8OYiiqSz6e3ZvQdUAejx/8LcGNzlUIGisgNf+AldI2zosBV5Afc3AT2Z45M4AHRTYQJw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769190766;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vo9gvhzzc7pVzSzFGU32xyEpNyrSjhM5A0YA5N/eeLg=; 
 b=jsbgK+QR5h/IRHA1cnOExJoV84NDhv0ly8qKXZlfRti/zsKgIZn55ZfXEPYzn26aN0As2O7OtVZgsE7G6GrK/4iNQERF5pJXjjT/sPicnI2usP8jfa+kaYsT1dVXpWhNM3SwrQe2U3WQ7ahHsM7oPpgOfSsE/2XT3gSIMb3nLp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769190766; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vo9gvhzzc7pVzSzFGU32xyEpNyrSjhM5A0YA5N/eeLg=;
 b=dVBEOuRE5cbBSbfbT7Rg/5i2RtAv8IxbAQgE5dlSPcdoQ8g9lF47zLir2tX4jbDr
 yGnP9w3iHQ/TlSrO2sK25izTb0Gd6ewvV5s8+79jRdRRbvlgnLKFS3e07M9MO4be1Cc
 49EVSpyiBY6kv2PfTDiuTPYTL6CxTzEwmOE+hpMI=
Received: by mx.zohomail.com with SMTPS id 1769190764326682.6739991113686;
 Fri, 23 Jan 2026 09:52:44 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, broonie@kernel.org, dakr@kernel.org,
 miguel.ojeda.sandonis@gmail.com, gary@garyguo.net,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2] drm/tyr: suppress unread field warnings
Date: Fri, 23 Jan 2026 09:52:35 -0800
Message-ID: <20260123175235.209092-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,gmail.com,garyguo.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 11F7F79364
X-Rspamd-Action: no action

Currently the rust compiler warns that certain fields in the TyrDriver are
'never read'. The fields are needed, but they are not read directly, they
are only written into an 'impl PinInit' that is returned by probe.

When warnings are compiled as errors, these warnings prevent Tyr from
building.

Suppress the warnings by adding underscores to the problematic variables.
This allows Tyr to build again.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Added better explanation to commit message
- Used underscores instead of lint attribute
- Link to v1: https://lore.kernel.org/rust-for-linux/20260122003746.405370-1-deborah.brouwer@collabora.com/

 drivers/gpu/drm/tyr/driver.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 2a45d0288825..568cb89aaed8 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -34,7 +34,7 @@
 
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrDriver {
-    device: ARef<TyrDevice>,
+    _device: ARef<TyrDevice>,
 }
 
 #[pin_data(PinnedDrop)]
@@ -127,8 +127,8 @@ fn probe(
                     coregroup: coregroup_clk,
                 }),
                 regulators <- new_mutex!(Regulators {
-                    mali: mali_regulator,
-                    sram: sram_regulator,
+                    _mali: mali_regulator,
+                    _sram: sram_regulator,
                 }),
                 gpu_info,
         });
@@ -136,7 +136,7 @@ fn probe(
         let tdev: ARef<TyrDevice> = drm::Device::new(pdev.as_ref(), data)?;
         drm::driver::Registration::new_foreign_owned(&tdev, pdev.as_ref(), 0)?;
 
-        let driver = TyrDriver { device: tdev };
+        let driver = TyrDriver { _device: tdev };
 
         // We need this to be dev_info!() because dev_dbg!() does not work at
         // all in Rust for now, and we need to see whether probe succeeded.
@@ -193,6 +193,6 @@ struct Clocks {
 
 #[pin_data]
 struct Regulators {
-    mali: Regulator<regulator::Enabled>,
-    sram: Regulator<regulator::Enabled>,
+    _mali: Regulator<regulator::Enabled>,
+    _sram: Regulator<regulator::Enabled>,
 }
-- 
2.52.0

