Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO1GGhG3c2ncyAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:59:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217A2794B7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1866410EB8D;
	Fri, 23 Jan 2026 17:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tWQBJ0hG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9051910EB8D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 17:59:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A2EE601EE;
 Fri, 23 Jan 2026 17:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A981CC19423;
 Fri, 23 Jan 2026 17:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769191181;
 bh=abMEdDj1ecT7PEBgeo3Efaftk/vtPUHppJTpuJNaA5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
 b=tWQBJ0hGSMfV9MbHmctkF6zXMFWybelZwtXbWKtmlJlLjn0/FWy8JtsC0ocR4fYaB
 NQalsLm3+3ldC9YFTqhx9k7u8n2nyfcUkMqhzgJD0jZtpaPV1PvP1/IlHhhHM/24ti
 jJSOa1aY54EX+30u1PfN6k8p61ELtHu0bxiPslCKAWc5U0oD4ho2lwm/Q8oD8awEui
 OoojRrZYJjC3xGcE3fb8NrJrxW/DRV4r2sPB8ev4aJrMs9a3Gyg0u8hQv0fz1SgaHR
 ltUZ+yptSxB6Narz21YhGU7tueViDge2yGbMa62qiL3FqoY/pxa1cnNbo2XjMZGLP5
 9yQKLbbWmgbNA==
From: Gary Guo <gary@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] gpu: tyr: remove redundant `.as_ref()` for `dev_*`
 print
Date: Fri, 23 Jan 2026 17:58:45 +0000
Message-ID: <20260123175854.176735-8-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260123175854.176735-1-gary@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
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
Reply-To: Gary Guo <gary@garyguo.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[gary@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,ffwll.ch];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_REPLYTO(0.00)[gary@garyguo.net];
	NEURAL_HAM(-0.00)[-0.931];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:replyto,garyguo.net:email]
X-Rspamd-Queue-Id: 217A2794B7
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

This is now handled by the macro itself.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/drm/tyr/driver.rs | 2 +-
 drivers/gpu/drm/tyr/gpu.rs    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 2a45d0288825..fe991d8cbb4a 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -140,7 +140,7 @@ fn probe(
 
         // We need this to be dev_info!() because dev_dbg!() does not work at
         // all in Rust for now, and we need to see whether probe succeeded.
-        dev_info!(pdev.as_ref(), "Tyr initialized correctly.\n");
+        dev_info!(pdev, "Tyr initialized correctly.\n");
         Ok(driver)
     }
 }
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 6395ffcfdc57..64ca8311d4e8 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -98,7 +98,7 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
         };
 
         dev_info!(
-            pdev.as_ref(),
+            pdev,
             "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
             model_name,
             self.gpu_id >> 16,
@@ -108,7 +108,7 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
         );
 
         dev_info!(
-            pdev.as_ref(),
+            pdev,
             "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} AS:{:#x}",
             self.l2_features,
             self.tiler_features,
@@ -118,7 +118,7 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
         );
 
         dev_info!(
-            pdev.as_ref(),
+            pdev,
             "shader_present=0x{:016x} l2_present=0x{:016x} tiler_present=0x{:016x}",
             self.shader_present,
             self.l2_present,
-- 
2.51.2

