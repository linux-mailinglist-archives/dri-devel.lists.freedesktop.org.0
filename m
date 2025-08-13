Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A5AB24DBC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0688710E762;
	Wed, 13 Aug 2025 15:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WviT0/vR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2747210E75D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:42:19 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7e86f90d162so4039485a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099738; x=1755704538; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VsQSV1TsJHp2MU2Wdr4GjJINpBOVW2jeex8g0hu/Fho=;
 b=WviT0/vRbf0pDD5pcV2To6rbH9fF6Iz+xc0wi6bdmILOiE7Zm8Wu3AKXMIXoPN/42Q
 m3UDmbnlhgbcTxIHLKU/8UsIvxHV9yJKoHxhQth1NN2WT3NGwpfzO1Rdj8tJfGajgBRQ
 X8lgo3ZJ4exUki9IfMIWknG5rVsbiRc8BicBix3KQsQSQv4GBzzGo4isoU4ExwU+Mhrr
 THUpRwZyEaGYnqgTEBstF4w2bFBHhSOCju67FNfy6n80kySbui+e8NrkqlXrS5uXxUIw
 PHNNh2nj5OMeayNZK0uAY1nyhQDXtWCev89qlSrHAQ5OpOpiI22X9gW2cdotEBxfqwoD
 N78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099738; x=1755704538;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VsQSV1TsJHp2MU2Wdr4GjJINpBOVW2jeex8g0hu/Fho=;
 b=pwlrAlWWN8qSlabOzcXH306JGx0Yo8u7USs48Wug9B8xnKJ/6NyckEDyUd0/WCtfSC
 rxxZxdu4FF/AxmcjTK02rpDNiCrh8iC+CXlapaI87hjMoh7SmGEh1MBRXVTYC9Eojb4E
 gZBahfb+Up/TB91kFv2huh1OGYdfAi+lg0VlYxnuQs88KTRJBttwf6+6cJEiYT9k8Dno
 m5HDCPzsD+OioelShuD4wkB66mrPvWhpp8TzrNul53LTpvUcT8M6tafl4iLhECqdSPdD
 4wrdBLoGWs+4P7d5Dr39lzAnWaTbZ0UDXrv0zU487I+uHfK2qGKwV3H8DKiG4dWLcJ15
 Ah+w==
X-Gm-Message-State: AOJu0Ywq+4PE3UgvQi3RKXN/OJUztVOh3EHE8gs52NE5pZW9/KvBoWwR
 SZooS+sZ+kmX4XEavMofUGKBOQkGGwaPK3RJBE37hDRKyimvRJOT04Lr
X-Gm-Gg: ASbGnctByGoV1yEY+13ze+fMHTSO1OiIUvzC9BHk5Lr+FAl2l1Rx9tuUo94rm8lZkJx
 4llXbjpCPkK60speBWDd4mPAftFV2ImGlsLQWpFz5PkdW1M6kxsz1ERwu6kk+6AjkTFTEq8EvAZ
 cpjaXbgzGaU+h05YufGqfj1KB1hGA5P9HOjnb7wp/9wOIiN8fnuYa77VJ6OQ2RTJPXrW/QglYGc
 4Ik+NGyZkqpUJFIZCe0sbH1Y4sP+Q9Mje6yWsYNeGruNWqVLKQNor9k80rm+tlnvZTxCRFRnlRn
 Ipq7gH4NHTjSnr6eRBt3uA406qfjhasovoPRSWTywuU0lVJyIUO3BKOYcdSpAvTA26v7fMvwWWE
 C6o3FHBmpm2DroAHmMyxgk26ru5IJUhMlMWt7u7P22VhY8a33oTtlERK8+GBWYELnYOcL4Ih4w5
 fvy0+jLq2ZTza0zF/QCph9P+nzyfMEx0s88w==
X-Google-Smtp-Source: AGHT+IHar27jS0NGlUqrQQodPkOf9R/CEtXClMPngwLeK8GX4mWCN5I6VofPi0UAtSwiPNgZ+ssZBg==
X-Received: by 2002:a05:620a:4494:b0:7e8:594f:d3d3 with SMTP id
 af79cd13be357-7e86fd3a817mr233185a.31.1755099737954; 
 Wed, 13 Aug 2025 08:42:17 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:42:17 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:41:59 -0400
Subject: [PATCH v3 08/11] rust: miscdevice: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-8-545c14bc44ff@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099716; l=1185;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=g75m/R+Sh3HJx/9egwyo7hbMlFO3MjnMF3dWtcOVjYY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QORcYxs8+PgEi2jdhGN+iGN1na6Boa7otjXeI3vPhu4m4soJQFoRy8+xvO+XTxKLuuC5OO4cIX/
 esCvjMEqV7w8=
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
---
 rust/kernel/miscdevice.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 6373fe183b27..d3aa7d25afad 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -34,7 +34,7 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
         // SAFETY: All zeros is valid for this C type.
         let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
         result.minor = bindings::MISC_DYNAMIC_MINOR as ffi::c_int;
-        result.name = self.name.as_char_ptr();
+        result.name = crate::str::as_char_ptr_in_const_context(self.name);
         result.fops = MiscdeviceVTable::<T>::build();
         result
     }

-- 
2.50.1

