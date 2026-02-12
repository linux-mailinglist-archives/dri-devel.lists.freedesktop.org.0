Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCYhEBSmjWnu5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:06:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A604512C3DB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8246510E719;
	Thu, 12 Feb 2026 10:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="fq8lRvhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net
 [178.154.239.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A90210E719
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:06:08 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:eaca:0:640:4fc0:0])
 by forward101d.mail.yandex.net (Yandex) with ESMTPS id 46C97C0066;
 Thu, 12 Feb 2026 13:06:07 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id d5RU869G5W20-HuVH63BL; 
 Thu, 12 Feb 2026 13:06:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
 s=mail; t=1770890766;
 bh=qxkeRDbJgUJjhLFpKBJWlnb3gZXNfZQn/ZWX3SwQCBY=;
 h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
 b=fq8lRvhHuCXcjV+lpfbScCKhcGFCEDjW+/gN6IHq9my2LYRKuk4k3tuTCwK/dKSvD
 XyHN4035vMWDtjEqOxhvYbhP6tzsfNlljforBQZwHPkkq5hj8ZUhpZdQ5tsx1yCDli
 N94/cdmG1nFG/0cukBX+QXaCualNzakggQ8xhs6c=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net;
 dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 ojeda@kernel.org, rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Date: Thu, 12 Feb 2026 13:05:38 +0300
Message-ID: <20260212100538.170445-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260212100538.170445-1-work@onurozkan.dev>
References: <20260212100538.170445-1-work@onurozkan.dev>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:ojeda@kernel.org,m:rust-for-linux@vger.kernel.org,m:work@onurozkan.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail,onurozkan.dev:server fail,zulipchat.com:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[onurozkan.dev:mid,onurozkan.dev:dkim,onurozkan.dev:email,zulipchat.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A604512C3DB
X-Rspamd-Action: no action

On rk3588s, `dmesg | grep 'tyr'` logs:

  tyr fb000000.gpu: supply SRAM not found, using dummy regulator

This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
which goes through the non-optional regulator_get() path. If the
device tree doesn't provide sram-supply, regulator core falls back
to a dummy regulator and writes that log.

Panthor handles SRAM as optional and tolerates missing sram-supply.
This patch matches that behavior in Tyr by using optional regulator
lookup and storing SRAM as Option<Regulator<Enabled>> which avoids
dummy-regulator fallback/noise when SRAM is not described inside
the device tree.

Link: https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/573210018
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/gpu/drm/tyr/driver.rs |  5 ++--
 rust/helpers/regulator.c      |  5 ++++
 rust/kernel/regulator.rs      | 45 +++++++++++++++++++++++++++++++++--
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c036..e0856deb83ec 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -113,7 +113,8 @@ fn probe(
         coregroup_clk.prepare_enable()?;
 
         let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
-        let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
+        let sram_regulator =
+            Regulator::<regulator::Enabled>::get_optional(pdev.as_ref(), c_str!("sram"))?;
 
         let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
         let iomem = Arc::pin_init(request.iomap_sized::<SZ_2M>(), GFP_KERNEL)?;
@@ -201,5 +202,5 @@ struct Clocks {
 #[pin_data]
 struct Regulators {
     mali: Regulator<regulator::Enabled>,
-    sram: Regulator<regulator::Enabled>,
+    sram: Option<Regulator<regulator::Enabled>>,
 }
diff --git a/rust/helpers/regulator.c b/rust/helpers/regulator.c
index 11bc332443bd..5ef45a8adf12 100644
--- a/rust/helpers/regulator.c
+++ b/rust/helpers/regulator.c
@@ -25,6 +25,11 @@ struct regulator *rust_helper_regulator_get(struct device *dev, const char *id)
 	return regulator_get(dev, id);
 }
 
+struct regulator *rust_helper_regulator_get_optional(struct device *dev, const char *id)
+{
+	return regulator_get_optional(dev, id);
+}
+
 int rust_helper_regulator_enable(struct regulator *regulator)
 {
 	return regulator_enable(regulator);
diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
index 2c44827ad0b7..d27ce3f6ef26 100644
--- a/rust/kernel/regulator.rs
+++ b/rust/kernel/regulator.rs
@@ -232,10 +232,11 @@ pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> Result {
 ///
 /// # Invariants
 ///
-/// - `inner` is a non-null wrapper over a pointer to a `struct
-///   regulator` obtained from [`regulator_get()`].
+/// - `inner` is a non-null wrapper over a pointer to a `struct regulator`
+///   obtained from [`regulator_get()`] or [`regulator_get_optional()`].
 ///
 /// [`regulator_get()`]: https://docs.kernel.org/driver-api/regulator.html#c.regulator_get
+/// [`regulator_get_optional()`]: https://docs.kernel.org/driver-api/regulator.html#c.regulator_get_optional
 pub struct Regulator<State>
 where
     State: RegulatorState,
@@ -283,6 +284,29 @@ fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
         })
     }
 
+    fn get_optional_internal(dev: &Device, name: &CStr) -> Result<Option<Regulator<T>>> {
+        // SAFETY: It is safe to call `regulator_get_optional()`, on a
+        // device pointer received from the C code.
+        let inner = from_err_ptr(unsafe {
+            bindings::regulator_get_optional(dev.as_raw(), name.as_char_ptr())
+        });
+
+        let inner = match inner {
+            Ok(inner) => inner,
+            Err(ENODEV) => return Ok(None),
+            Err(err) => return Err(err),
+        };
+
+        // SAFETY: We can safely trust `inner` to be a pointer to a valid
+        // regulator if `ERR_PTR` was not returned.
+        let inner = unsafe { NonNull::new_unchecked(inner) };
+
+        Ok(Some(Self {
+            inner,
+            _phantom: PhantomData,
+        }))
+    }
+
     fn enable_internal(&self) -> Result {
         // SAFETY: Safe as per the type invariants of `Regulator`.
         to_result(unsafe { bindings::regulator_enable(self.inner.as_ptr()) })
@@ -300,6 +324,11 @@ pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
         Regulator::get_internal(dev, name)
     }
 
+    /// Obtains an optional [`Regulator`] instance from the system.
+    pub fn get_optional(dev: &Device, name: &CStr) -> Result<Option<Self>> {
+        Regulator::get_optional_internal(dev, name)
+    }
+
     /// Attempts to convert the regulator to an enabled state.
     pub fn try_into_enabled(self) -> Result<Regulator<Enabled>, Error<Disabled>> {
         // We will be transferring the ownership of our `regulator_get()` count to
@@ -329,6 +358,18 @@ pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
             .map_err(|error| error.error)
     }
 
+    /// Obtains an optional [`Regulator`] instance from the system and enables it.
+    pub fn get_optional(dev: &Device, name: &CStr) -> Result<Option<Self>> {
+        match Regulator::<Disabled>::get_optional_internal(dev, name)? {
+            Some(regulator) => {
+                let enabled_regulator =
+                    regulator.try_into_enabled().map_err(|error| error.error)?;
+                Ok(Some(enabled_regulator))
+            }
+            None => Ok(None),
+        }
+    }
+
     /// Attempts to convert the regulator to a disabled state.
     pub fn try_into_disabled(self) -> Result<Regulator<Disabled>, Error<Enabled>> {
         // We will be transferring the ownership of our `regulator_get()` count
-- 
2.51.2

