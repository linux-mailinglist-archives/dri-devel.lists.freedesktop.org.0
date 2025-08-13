Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141DB24DB7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9800A10E75F;
	Wed, 13 Aug 2025 15:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IHUt5lIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBF710E75F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:42:09 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7e864c4615aso115017085a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099728; x=1755704528; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DAVIGNcXAikIPjcz0+9QwautG+MBQN34qHjISmCjRuM=;
 b=IHUt5lIHru8oGO+ocmgxPIyP5z18dFguUT8PasTPHvMssXo1jQ7jVDX9hedbCVXGJx
 +wbCRoKAZJi4af+yQ2JCK8vDQmEdYaVyH8xYmHASDmLwmsjGG6BDlntJsPw4fJBExSAp
 VoCDSbf0xxTYDAPRvC11otArwCtNyh9biu+MNoZRl/+g0tw6GouillS2YOUBEzHm/Omm
 ThhbYmnxTF+xTYJlhbAovutyFKwqIkkQl2ruN9veCiTyJMYJhTV9eFPyI7Fd2WGo+TKO
 gTzoqomBsI4qNNtWBrGgJqvQIIGuSQ79ctUnvWQWVWuu4aCP6S6mYyxwrFnUVuXp9oPw
 FXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099728; x=1755704528;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DAVIGNcXAikIPjcz0+9QwautG+MBQN34qHjISmCjRuM=;
 b=Ns7gerL1n9z4pXoONZHMlYoeOgc/i7GwYCIfeZgdtyOtdhqAC/wGjBlwbgK1CuhS/a
 kTeN4QTPBCVHDpNwwcsUPLlu+y88FChbNiTYgNm6+s3XcbFWukkS3saGiwxMSFR76TiP
 JxLQyqacw6ivPUafMl0j3gdOPNpWC70srVumeMFO1XVMoEo/A6Ktth/Ou0T9YD1yaRLp
 C5oZYk8ZFN5+7diyojoJz83+TygLgSPoFcilaxkrJ3lASal6WjJeTfV/dkaD+dq0gc94
 5mgeW0+N1VvCRfmMH6b7n24yU3QzGb6F4w/mZp0+U0HQL3R7W1hw15Iz46zkOckdZaw+
 9O0g==
X-Gm-Message-State: AOJu0YzUV8udyTjZV1Ds+5u4SlXuUivzHdQgTdZbEJlruUG+wj9j8CxD
 rp/3eQvnAaYXCvEPlBgBbjLjrFkLkY2vPTeb329nuqHElxXSYy3CYI4v
X-Gm-Gg: ASbGncviv/Wo6lV7Q6J+zuIzPev3cd/Q9lTRlTuGbd0CYWQ4VBmsj6/O4s75BvItTEo
 cKAuH95X5cxjbBjn/o7qfvWC5RPpwfcRKujA+Uk6As1zpKuL18G6BGBz2StR2VTCYWFNDliGYgS
 p4UT+jP+ADfueT8TtOtUY4vrpGArBDqm48YYcJx1tbAMftObHm/WJvAz2ejKx/L4qdFxSex3Bwf
 TMzIKes4QYp5LPNxUdQv0TVC0KOGLUNecUDsF/2tNjYXy+NwmPZ3CcJLQU8qSs/fZocuwPqBLe1
 /wNYyH8uJgpFc9iGqGmO9bcmmSTLntXUQfCWT36HIz+yzJtB0tWeUpbU0xou3j9gvDAItVLrYip
 H+lowHlnCSAWYyuARjxxjL+enY2vSDG1ONeeNL9HDf+skSUQktygGl+hXQwpeLUHWL0RKG0MK5O
 E+vgxd+KU+FQWijNpquJrnluI4OHWBV5nIzf1bWg15EBeJ
X-Google-Smtp-Source: AGHT+IHWWRr4WlqqCu+JbpSqKh1qg6xKr81k4ITVTkgW2vt8hj987C3AcQSVI0HeFPlkaF6YX7H/mg==
X-Received: by 2002:a05:620a:390c:b0:7e6:38a8:bbd1 with SMTP id
 af79cd13be357-7e86fbc03dfmr9802585a.2.1755099728387; 
 Wed, 13 Aug 2025 08:42:08 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:42:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:41:55 -0400
Subject: [PATCH v3 04/11] rust: cpufreq: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-4-545c14bc44ff@gmail.com>
References: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Len Brown <lenb@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099715; l=1047;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=VlYiw/A0T4sL7LlhqFZhg9UDlnS8zpc+y74HsiIttIg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKRzT95JfYfHTEBnhcIw0am5SW6Ke1PVB8xmVGYw6QGfVJxXJSHX4LF0AI5UNzsF0D3C7KbWjbG
 vvqT1dVQqpQo=
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

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoid methods that only exist on the latter.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/kernel/cpufreq.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index afc15e72a7c3..2bdf9ae00ffe 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -1018,7 +1018,7 @@ impl<T: Driver> Registration<T> {
     };
 
     const fn copy_name(name: &'static CStr) -> [c_char; CPUFREQ_NAME_LEN] {
-        let src = name.as_bytes_with_nul();
+        let src = name.to_bytes_with_nul();
         let mut dst = [0; CPUFREQ_NAME_LEN];
 
         build_assert!(src.len() <= CPUFREQ_NAME_LEN);

-- 
2.50.1

