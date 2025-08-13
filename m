Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E50B24DB9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863BD10E761;
	Wed, 13 Aug 2025 15:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CFG3h2kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5AE10E761
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:42:14 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7e849d7a292so405098985a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099733; x=1755704533; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L3bSBo4SS/FgSpl21RHA4IaNFoFjWvFemtvDkPW++F8=;
 b=CFG3h2kny8XgByA8vHhcud45Ev1HBhWTA1aQEnKzCKOBD2wHX/MgJsGuy8JMQhj9Fz
 yBQNlwxakTWzmorR8vB/zrnsAdW6LLPS6/HsIB6F0cNlwnOHmWGlvk/ZqjIPohK9V5mj
 3esJkn7hZgFg7R6KL3OnIc7AGEQXc9O1TBFpkWEvXiekn5GRsGf4D0DleklSP/54bLh8
 cPairxwtimHNr/Y6bov3aTXcmRCZTeCOAW/HDgnmCHPqFk/eWDaPkwPUTnNV/xBCjcAP
 9IOOnHI74mIJOLIAlpKPfGezbFTjYcEQsrq8kj8Ha7VV8KL0I5+FXsHpBZec6cW2wBP7
 Twog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099733; x=1755704533;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L3bSBo4SS/FgSpl21RHA4IaNFoFjWvFemtvDkPW++F8=;
 b=i1m4ngVPeOUjIAsYa6R2KuMdaxhsOiDR27Jjjhhs4ZShMUffwR9aucDf8Zk6HiYZTg
 8gJxBGEuClrCLAR9y699EmZHxC+ivsMXQKbNk7wv9MUdMMSDvgeue4vodCZZ5n1cmjv8
 UAy5n50WIi19zrlVIuu9wGu/33gw7NRsV0U5WBqM+dAvYi4ePdV8MgJbAzhl58s0lWzt
 tCjJ6RspU/CuQBAHjrZKp/0zzSNNqA03XaB/s/To6x0hv/GlnEDpap8S6mwLUpyYLd8m
 WKuFA6b4odXg0dKcvjTSmLK33dogcKPx8pY1DLIVtWtlzgiYp71iC2ny2zwIqQ2WeZtz
 vhZA==
X-Gm-Message-State: AOJu0YzLKQ3qJ457vcNrdfDzZoaWggmBACQHEEPelUJkENN70yNDvLNr
 93goGxRApXdH/ekldsFBeDiU7IdQBiB16TPlyZ3wYLqIGDRGCCv9DLWR
X-Gm-Gg: ASbGncujvXgwUm+yJ/XdIuci7pFHe+CngfcXuJOe0EONRUvfeZ3s4QNKfIHROgJqsW+
 Cg7VSb/PjjORL4nIdjpcId6nhg0DRPAVV1NX/fossiHulzAcCFXD7wfthNynWX1gizLNqiGOE/J
 70v4LdIwsg6E8l1kOvb85NucCAgd6TD06VJfbWEzVc5IckIAQh3OW436S6Nb35xLtPdwLjKBfBi
 B6ZxJP4MP/T9KqJVFjZ6hTFgSAm3i2N/OqEGB1wFxt1ZBnn6xpeLB3WwdQ606CEuq4uqcd7CzA+
 6ofFx5j1zYeh0np4KLA9HQR8JJEyU3HBZOCFVwb0eeyHRHhjWjsAPNln555cfpTtB0C3+E1DIDB
 WLdSqsLQMsg3Mh2yQnYVj7ERsAw02OCjFKqE/rlYz+0ALGhSZdIQjkHKIjGRqHMPcw880b9jqru
 KWU7jLvvpMobwKLHjNSmf0IVRyBbS9DA1corCAt5oMHADF
X-Google-Smtp-Source: AGHT+IE8kOnAeo+GXXSMqsc4caiIGvbQQSTgwoOCP36Gq0RBHmk5vnkOhXDcBjjhHMfsGrLWbnpK6g==
X-Received: by 2002:a05:620a:a506:b0:7e8:4337:9975 with SMTP id
 af79cd13be357-7e865320571mr448557585a.33.1755099733022; 
 Wed, 13 Aug 2025 08:42:13 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:42:12 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:41:57 -0400
Subject: [PATCH v3 06/11] rust: firmware: use `core::ffi::CStr` method
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-6-545c14bc44ff@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099715; l=1139;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=yC7ocmh0FxZ1j6QxD66YMq6ma2bl8MjdYDc752aDD2c=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPkwf/qzhiyFdFxI2/LV7vaTM5qqBUs0a8B4sP0rLb4odWWjZvsYE/y2xskn3LUJBjsfaaCSwqW
 Uk0Xaykxhjg0=
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
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 1abab5b2f052..94e6bb88b903 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -291,7 +291,7 @@ const fn push_module_name(self) -> Self {
         let module_name = this.module_name;
 
         if !this.module_name.is_empty() {
-            this = this.push_internal(module_name.as_bytes_with_nul());
+            this = this.push_internal(module_name.to_bytes_with_nul());
 
             if N != 0 {
                 // Re-use the space taken by the NULL terminator and swap it with the '.' separator.

-- 
2.50.1

