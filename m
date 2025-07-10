Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1EB006BA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B3410E903;
	Thu, 10 Jul 2025 15:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OaJwrDWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087D210E8FF;
 Thu, 10 Jul 2025 15:31:44 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6fad4a1dc33so10566866d6.1; 
 Thu, 10 Jul 2025 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161504; x=1752766304; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Jwny/YDMsp6Uti9L9noK3c3durn05YOXlAE+7kmbbsk=;
 b=OaJwrDWP7Nqe8sMxpgyL0FDKSHe95NlHqs59T+yTyf0IyMaW2FneduoYTiDm70vaPr
 25ZrsJAX2PXpr53RH5IuKqSOpJW5N/JXo5WlOd8K57QbTu0saGonfcep+xDLw4xx/P1g
 is4aVMD991sQWpT3aLxvtce4J3M9/IkxfNlWO2GPBRsrIOmGJZNx+/iMlHGSITtRAs61
 nyNJQbo2qKQ63ibEybvDD3E/w7Q5RDWvakwC4aNbjYRly/BQECbv8e1pm8C6oOIo5ykq
 c4WXuFi/HjPIioAQ3CrMZLOzCPVyPDYHfio95XyCnVabvTw1miIfN+9OrtCP2YF+N4ik
 aoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161504; x=1752766304;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jwny/YDMsp6Uti9L9noK3c3durn05YOXlAE+7kmbbsk=;
 b=SBbX5wuKSkwQjqDIcqich4z/JZEIY65EvpCU9Jpc1IHiGyaG4vQUquco2VeWatWewb
 oNgq2W+Zk1j+5pNngQwZKBKqr9uRLpzPsocEyC5M32lbl2Gzotp3oDQJhdLspbwxIeXY
 3lYxZOIZERuhYuVJ3IqWz//vOQe3PrcXHiQlzFt0v/69ep6shZS5uDMEzTVBREo59M0F
 aZ9RbZ49PcYhxhnxenXIqbDyJCVUoYR93Eq2re/oyNZEuNMsaEepuddRYPS665Mh5CLT
 nIGsXAeQxLuj/7l7P0UjiIn+oOjbHBBLKf+znKhAXaFqD8grde5Ta0CfXQ6BkcBL+/Qb
 G2Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNdXi1123ghbGcEPoIOHnFz1qO/58PLnEv7Vi6p3N8CwixSfpyM3csAau96b21TVxll6L//E+jxw==@lists.freedesktop.org,
 AJvYcCWCda22dqqho3rq+V/WynX5JQ5Be51dIL9M/OG7ecTrQI3kHYvGH7T02uyohciNBMwFcRxwip5luOA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhBAW2dCA69kBhfOe73GCtJWL8MlNn65JIb2O3PYvyBgKtCWbJ
 TmoU4qMEGyzIENkuKKDRKc/tNUbc6LY772rNzCgEKre6G4iBBys6RRb5
X-Gm-Gg: ASbGncs1t5Wi3IQ+0nZFqWyRt5PaPHM3ZjRxze2j+IRewxVIBulimi7a4dbKZI/f0ri
 EY64geAUiZhe8ynNzHchn419AyGEy20/XUNufQGJT1ipCPwUE4IKxkIKZnY+Bk7gHCbXJoGll/M
 KXGnmjYIaC8G1UW+UeFt0SONicOMLPQqTO1ylXC37GX+M0cGW9pzdSl1RrKzvPxc31j/qs9u5Hj
 S6IVCd62mWfXIzHI5Ps0AuKO9+E3J1SK8Wo/L9EgHRKsfEOHOMSemAxdikTXp2rKfkNrMyMx8UB
 yzY1nwHznJl8+IbZjp0gsVZjOQ7uEEAcFkDzzWt1GOjbCE0/vFk4mTSLpDlyXqxkn8ukBxMrPLZ
 h6z3qW1XZ22M0JbSREcqONdM014D6NSugS4QHPyaShB3MCh2ISu0wkEujkg==
X-Google-Smtp-Source: AGHT+IH7OAFO4MBtcOae4A7Ufmd/gVO0MGsqsoI+qUvq0KaZNdtURjl40SFBRWgfYeNbvdb036U2Lw==
X-Received: by 2002:a05:6214:3382:b0:704:7dfc:f56e with SMTP id
 6a1803df08f44-70494f4b3fbmr68970736d6.18.1752161501839; 
 Thu, 10 Jul 2025 08:31:41 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:41 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:07 -0400
Subject: [PATCH 04/17] rust: clk: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-4-027420ea799e@gmail.com>
References: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
In-Reply-To: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161489; l=1647;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=hq6DDcaya80h1WPZeZ2fcDK/88nl92ydlSKTms9sp+U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJ9/Zze0YHCWW3FvdYU/EkNUZX2HriURvSzn4pTjOzAXH73w74+FqJhMSmpj2ynoVkrRw20pPDF
 ulFzacsKb2A8=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/clk.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 34a19bc99990..fb0f259cf231 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -100,13 +100,12 @@ mod common_clk {
     /// The following example demonstrates how to obtain and configure a clock for a device.
     ///
     /// ```
-    /// use kernel::c_str;
     /// use kernel::clk::{Clk, Hertz};
     /// use kernel::device::Device;
     /// use kernel::error::Result;
     ///
     /// fn configure_clk(dev: &Device) -> Result {
-    ///     let clk = Clk::get(dev, Some(c_str!("apb_clk")))?;
+    ///     let clk = Clk::get(dev, Some(c"apb_clk"))?;
     ///
     ///     clk.prepare_enable()?;
     ///
@@ -272,13 +271,12 @@ fn drop(&mut self) {
     /// device. The code functions correctly whether or not the clock is available.
     ///
     /// ```
-    /// use kernel::c_str;
     /// use kernel::clk::{OptionalClk, Hertz};
     /// use kernel::device::Device;
     /// use kernel::error::Result;
     ///
     /// fn configure_clk(dev: &Device) -> Result {
-    ///     let clk = OptionalClk::get(dev, Some(c_str!("apb_clk")))?;
+    ///     let clk = OptionalClk::get(dev, Some(c"apb_clk"))?;
     ///
     ///     clk.prepare_enable()?;
     ///

-- 
2.50.0

