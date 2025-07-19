Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BBFB0B255
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC05C10E428;
	Sat, 19 Jul 2025 22:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P4FXXIv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2A710E42D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:42:46 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7dfff5327fbso440976585a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964965; x=1753569765; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uDWC2vJajr5e99NLv/Ti1ax5HIYUjw/FV4qUgNUzVj8=;
 b=P4FXXIv2HUEZCF9WGxZu54VKCxbXBUa+UMqNLNRdk5z0pdYXXQHdfYxwByXve8DSip
 9OLRb5cjxLcX/QZbrM+AcEN42N/Gn1K43puwgI9aRFLJaEW4ATGGonSUbDpBlFF1m0dZ
 taiOTFddx7L7FGEJkqmz7dv9EuJIb0uMc/yN29/3wS01Lk521Eg7tslGZvp76bBK+CTp
 IWJNHsi+iwJTjqMLYi5kF+iKZ+D3dDqx5jMl7DFXc1IdPwb0m2NCvabmlQhFpdL/12+B
 tGuERmffs7himN7qkoxNAKu4yo852IGsDwQUxfAdzU3z43wlNugpy3iKKHMHiBgkvPdk
 ubhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964965; x=1753569765;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uDWC2vJajr5e99NLv/Ti1ax5HIYUjw/FV4qUgNUzVj8=;
 b=NdxE1hFPPmfAoiYK0v9WC9B7v34XmUiMVmr52O+MIrlDs3Vwq5gSW2SKaN13HcDXuc
 DTz7Cxk2KwbtRCjCm6YsARvWbXhzuHhPgWP4BRsJVTh//GCcmCFriddrUcZbiujuJpYM
 zYawTyv7KOfhm2O7UqM6I+GTbyrKhONUit2CGGvp7UWr9gaPpM/P/y2vojhjH3Kco59N
 8ZSh7Wg3/O+naCeiGlT2QZKFofv/zyd6VSO67ynGXJLXbkkBHofPojui9KfjA/Q5cOPt
 rHJQxPcY4dISTE4u+NXQ/0TNgIIlg+u5ZOVCD9wfSKEXlj/HtraCbjbhTkEwlJZ4FG+N
 CqzQ==
X-Gm-Message-State: AOJu0Yz1zYW/lSDIf4CHMokeJKOZoqtgB+N7ZKSQOz2othGmrEdeQEWe
 6cskBjp9wC7EfEcSysCsW53puagliNELEA1GRPS686G4/U8GfJcL0uO6
X-Gm-Gg: ASbGncszG2TnJwIMoMIbgN2pmOvvlng5HCsq81jkkBPesO9x7H1ZQJW3iieqfc+EuAc
 5peYWByKpnXfoY5UOn49eimuHqV2UwdHSDrFyNcpi5z17gsOOb5KEnHGYjxk9bEKqUrMduciaDO
 VuU+Y91dZ6QvRSY3LX3ILF/2FrZRNZh6wjmOu91qqrfK0OBnzmlea1Hjq3B5xf+B+y3IQb2iLeg
 BXdxLYErRNqNAiFuaxVF60hlLHuozSn9q4xhDxYLcNNlVic5xMeluOkdWM0sTNeg9g+LR/l2M7G
 XIEnZwdHF2ERiLw3xBVGBgkPpBgFoDk97hd4IXGlUjojWlAWF2471KSXqwdWy2fJQqAsjx4IaR3
 bP8B4MuozO65ISHN/nQzVJYjz094USPnmcfNdlmZlh30YGmZtBg8VSmLjeZbTlz2oYkV5SYwd/T
 aZPvrFV0XKvFZO5lHOSIGAjQCsk1cIhHTenATHh/w=
X-Google-Smtp-Source: AGHT+IE9V4lUrp6+KizRk5T1lH1N1yFglQFV1kwy0rjAllnBSIOC4NKWikOxAmpD+50/9TKsIJOTpA==
X-Received: by 2002:a05:620a:6019:b0:7c5:3d60:7f91 with SMTP id
 af79cd13be357-7e34355ebc3mr2518295185a.15.1752964965239; 
 Sat, 19 Jul 2025 15:42:45 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:44 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:42:33 -0400
Subject: [PATCH v2 04/10] rust: cpufreq: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-4-e1cb53f6d233@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
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
 Saravana Kannan <saravanak@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964955; l=1043;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Md5viX5GUz2R5mJkUWEkGx2lyxvokj0qp94Xg8uiCEU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBE0v/HGS7nTLm+VoHQjFRVbHknYbIoX7Qf4J+/U3Mp8SY1LNU4ZJaFGEgU3gct0Sxv0sDo4F/t
 03jQu+PPrfwo=
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
 rust/kernel/cpufreq.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index e8d231971276..71d601f7c261 100644
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

