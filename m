Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D549B24DB3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6B610E758;
	Wed, 13 Aug 2025 15:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ArACmhvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5CF10E758
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:42:02 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7e864a60b26so119157885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099721; x=1755704521; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eEL9BFUl2s2rRVMDRV+g2pYwgrhoVdhRC86kQADKG/Y=;
 b=ArACmhvyRHZPIzZFF3VK+gTjRnndpW16WD3S3aK0tJBD2RHuAvQNhisagZa6Ih2MEb
 vEoU1F6RMEb2tlr9r0jB3Sx29FOcauE7ro+KJvWO7Fev6a+eCN+3amushOYqnYuEeOqj
 Xmhhz8P/Z0HbPzBV8rXzwESGRQAXZ330RzDQrfKakib0Ja1laKvRRotUTpxLCrnshKxM
 0b1rp5rD0eVUrTxRqzZWMskb6DDszbTCAn3or8uxc1IIHV5JHvinlShu3i5EnmTvQ2HX
 VuxfXwBLLkZLvfq+lWCn4caajKEczZeBzfILBY60En6QeQ5s8gifBiieP26hCVmHzG/H
 /PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099721; x=1755704521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eEL9BFUl2s2rRVMDRV+g2pYwgrhoVdhRC86kQADKG/Y=;
 b=AUe7e1DGh0Vgs3NYbX0sxi4fTP/JtoC3Yfdff2DRxXvIKiroOBYrLO1YYkao84L971
 e+u5rxxlpqlKpYFHWP3akqoL8ggOKSxOx+/e6aE5cwuurBiAIFv1TPKf/HeUcambDXwu
 zOhWNb0JBZpIFeP4WTPjUzHO8YI9JoZxqaGoLE8Kbzr4LmS/cjTDMTt8nUGEwpAOu72C
 MnaJqphGFmavF7wcgMo9UuQF/eozNLZW2bv4eGO12aTzCLLsvflurvXtA8KhdBtfEJRs
 dcFOhBDtMnGNuro2M3iI9sWzSWC1MVZyagiZ/QMPh8mw0ygq9EXV7uEL++du+iHoXcOC
 cb/A==
X-Gm-Message-State: AOJu0YzYIeKAWBVTaLD3YLurn+UXZjaLUTqXuyBSsvEqpb5zORTSxbrx
 FZrP0/858dCspQ/pzvk6H8948C9wi2XrpREUf3xqkkKjRuXQT+875Lfx
X-Gm-Gg: ASbGncu/GiXJeTdEhFe37X2serlq8vXGyi02w8/NEQ+kw+ao+/HOhtXv20fL6aobpGW
 6NhUUzuOm8PYPEg3SVrKJWabIlR9P8KrYaqkM8KiyNAUb+KyL8rgCV41ztIGT5W/F9vnv9FGwLY
 CEZKKIRlPuISssU2hYp14k4pt0SmQvxHOBSQosSLyEUrQc7OwF/C7nhruH3wnPTVIZAvzFRdIqz
 2w6IE0jXD/OtbA8SoPpPtAAO7Y9aglkGXsaFe0iITlPS2cB03F0WZkq0WvlRCYAPJNQmvw8UwCh
 upCyATTTYNrqIft7l6P0zyxIcSh0gF1Wyr2wOdFjiubBGjE3PIg1ZYaaHS7xqKClvv7u10F9m+E
 39TpNT3W0V860Ym5ShjolBTWy6ghl9BzpcanVPedW02smve6boNLT8guEfCzhBZk4cPITA5zcql
 qCr6Zl0AO8AwczAHsXMhk7oQaWyvGZj1nnghaSlXXZ0MG7
X-Google-Smtp-Source: AGHT+IERtrsVtKTOwE60YtDuNPV280d9g/vz6lBcBxlV1+yYS97R9ClJDETZjnppLO0l2b6EPh2t5g==
X-Received: by 2002:a05:620a:2801:b0:7e6:4f67:d145 with SMTP id
 af79cd13be357-7e86fc3044bmr5915085a.13.1755099721091; 
 Wed, 13 Aug 2025 08:42:01 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:42:00 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:41:52 -0400
Subject: [PATCH v3 01/11] drm/panic: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-1-545c14bc44ff@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099715; l=1187;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=V9/FffzUiUTQiasGGe9zR5nvlq2KGtqv4s9ApP+hKDA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLLcNXv/WAUZIWbgEvJj4/4hXlVGOj6ffH7E+h5eDBfbYXFk9RdsV8aQsIMPCL55DJC6vuu+j+A
 eIbixGdXebwU=
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
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 09a9b452e8b7..10bc5bb16992 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -948,7 +948,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
         // nul-terminated string.
         let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
         let segments = &[
-            &Segment::Binary(url_cstr.as_bytes()),
+            &Segment::Binary(url_cstr.to_bytes()),
             &Segment::Numeric(&data_slice[0..data_len]),
         ];
         match EncodedMsg::new(segments, tmp_slice) {

-- 
2.50.1

