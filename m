Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID/fOdZ8i2n6UgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 19:45:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7C111E639
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 19:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3A610E5E6;
	Tue, 10 Feb 2026 18:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="hBROQdAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 387 seconds by postgrey-1.36 at gabe;
 Tue, 10 Feb 2026 18:45:38 UTC
Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net
 [178.154.239.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C8510E5E6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 18:45:38 +0000 (UTC)
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net
 [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
 by forward201a.mail.yandex.net (Yandex) with ESMTPS id 945ED83C1A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 21:39:11 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c1f:582e:0:640:200:0])
 by forward101a.mail.yandex.net (Yandex) with ESMTPS id AA25D80C69;
 Tue, 10 Feb 2026 21:39:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id PcXcMe1H0Sw0-2SQWIV15; 
 Tue, 10 Feb 2026 21:39:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
 s=mail; t=1770748747;
 bh=Rc5AjI3Knt85NCpzELFh1EO7d2bbaLUNXALLlH/+aDo=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=hBROQdAq0uC7jvfp51qciv3n7QPevHsltrzL05gVHx2ewGXmLIUtR4U4eaOvRDFVq
 sLsQt3Mdn3P46oKJivHUo0igEWkh7PoltFMWTkHAPPx8OahvIyZDnmTPiokKJQ5I7N
 Lh2IuFCRYxtF2+43CVVbnO9jnOm8jro2ufLM8R1w=
Authentication-Results: mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net;
 dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1] drm/tyr: gpu: fix GpuInfo::log model/version decoding
Date: Tue, 10 Feb 2026 21:38:12 +0300
Message-ID: <20260210183812.261142-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,reject];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:work@onurozkan.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,onurozkan.dev:mid,onurozkan.dev:dkim,onurozkan.dev:email]
X-Rspamd-Queue-Id: 3C7C111E639
X-Rspamd-Action: no action

GpuInfo::log() was decoding GPU_ID like this:

  major = (self.gpu_id >> 16) & 0xff;
  minor = (self.gpu_id >> 8) & 0xff;
  status = self.gpu_id & 0xff;

That does not match the Mali GPU_ID layout and mixes unrelated
fields. Due to that, model detection becomes `mali-unknown` on
rk3588s which is wrong.

We can already get all the version information with a single
GpuId::from call (less code and cleaner), so this patch uses it.

Also renamed `GpuModels` fields from `major/minor` to
`arch_major/prod_major` to reflect their real meaning.

This change was tested on Orange Pi 5 (rk3588s) board and the
results are as follows:

Before this change:

$ dmesg | grep 'tyr'
[   19.698338] tyr fb000000.gpu: mali-unknown id 0xa867 major 0x67 minor 0x0 status 0x5
[   19.699050] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[   19.699817] tyr fb000000.gpu: shader_present=0x0000000000050005 l2_present=0x0000000000000001 tiler_present=0x0000000000000001
[   19.702493] tyr fb000000.gpu: Tyr initialized correctly.

After this change:

$ dmesg | grep 'tyr'
[   19.591692] tyr fb000000.gpu: mali-g610 id 0xa867 major 0x0 minor 0x0 status 0x5
[   19.592374] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[   19.593141] tyr fb000000.gpu: shader_present=0x0000000000050005 l2_present=0x0000000000000001 tiler_present=0x0000000000000001
[   19.595831] tyr fb000000.gpu: Tyr initialized correctly.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/gpu/drm/tyr/gpu.rs | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 6c582910dd5d..da97844efbec 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -99,13 +99,11 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
     }
 
     pub(crate) fn log(&self, pdev: &platform::Device) {
-        let major = (self.gpu_id >> 16) & 0xff;
-        let minor = (self.gpu_id >> 8) & 0xff;
-        let status = self.gpu_id & 0xff;
+        let gpu_id = GpuId::from(self.gpu_id);
 
         let model_name = if let Some(model) = GPU_MODELS
             .iter()
-            .find(|&f| f.major == major && f.minor == minor)
+            .find(|&f| f.arch_major == gpu_id.arch_major && f.prod_major == gpu_id.prod_major)
         {
             model.name
         } else {
@@ -117,9 +115,9 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
             "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
             model_name,
             self.gpu_id >> 16,
-            major,
-            minor,
-            status
+            gpu_id.ver_major,
+            gpu_id.ver_minor,
+            gpu_id.ver_status
         );
 
         dev_info!(
@@ -167,14 +165,14 @@ unsafe impl AsBytes for GpuInfo {}
 
 struct GpuModels {
     name: &'static str,
-    major: u32,
-    minor: u32,
+    arch_major: u32,
+    prod_major: u32,
 }
 
 const GPU_MODELS: [GpuModels; 1] = [GpuModels {
     name: "g610",
-    major: 10,
-    minor: 7,
+    arch_major: 10,
+    prod_major: 7,
 }];
 
 #[allow(dead_code)]
-- 
2.51.2

