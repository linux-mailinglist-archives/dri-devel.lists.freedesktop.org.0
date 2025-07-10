Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3269B006CC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC59610E911;
	Thu, 10 Jul 2025 15:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i+n6sx4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5CA10E90A;
 Thu, 10 Jul 2025 15:32:08 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7d9e2f85b77so171074185a.2; 
 Thu, 10 Jul 2025 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161527; x=1752766327; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hTPDeQ3MzYVsL9l7pIRQLeK6xoOi/0dqJ+7kw94Xeno=;
 b=i+n6sx4HJtBWCOufuX8WpQwC/rsHcAWYq+ChLJHa6Uq5rFuqlYVs4lymQcAnpOd+va
 nZExYuqzTnDrJBNivUHGHGZVkAV4wb53tJQPmqm2uxFKMkSbZjpBz8sf957yu5pM78lJ
 aVzuDttQJHoKtsa9p19A4UGfnhGkA4uyaCuH6+mx6GdQWjO9j4P5tXoAj+OdN/j1o27p
 xZeuzbkHh7f3IWh2GmGOgSBvLAJZQoYEzkEv3oDOOBd7s4rCVdlYdTPlMPvKx+LSx6Dp
 e4yyBhgAutoltlsEYFnYfRHF2XEcHQvT/knEw/bA/xwvdVX2z/XrclDktpFNmOrgj/Qw
 I0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161527; x=1752766327;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTPDeQ3MzYVsL9l7pIRQLeK6xoOi/0dqJ+7kw94Xeno=;
 b=vqrvmC7W0TL1m3F26QGkc3CloMIdNxoe4HgIAfeAxzwesDpQIdiR2ssyw667QDSWCi
 4G8GzrGmP+fM3NJL2BjpftvGD+YZ+PM5Kn2ifMjzRn1khSgH/Q+f5dNc+Qyn1P19agvB
 fp6R2F9IYVuF2BmK9nEOpRhdKR6+q2r2b2qJxJtZNFyFCrQ/O8mt0v4/SkDd51rRhG2O
 FfgF9hLJ/A2SPPu6xPyh4e36P1Z1aRyY1X1DErPPGTXys4x39aQt+8qIu/5Bb8Nu+fcD
 wg2yA1oWxR6y1xCjB38yLLLKSv5mj2S9yN6q4ta+4X3cMB362QnRcWMbRsOI4m8jupEe
 faJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1SqxSIt5yuz8IJFxmE2ojrsUhaHN8OgWsSMS0/4ccoFmWmYWNiAFR4uYEtVUl6leNd65PPUGFqQ==@lists.freedesktop.org,
 AJvYcCVwBY9VK3kU4uLHwU5O+LH2cKQ7svog/NyMv18d8+QtALkclSTkNr71VcY8hBdGOIyN4cFMYoWzWGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaPSXXc2jV8ft/EE5fpMudtGC8FG6Vw4MlXwIPeTM2c9P0sEFc
 1FyC/ViBZkMHVKxm9oqG8nPtVMYsf3wqrXy/HYSy0fo4G2lREcpZV8tH
X-Gm-Gg: ASbGnct5npV3Hco2739oOm075UFOTvkxqJ1zxHU+4XK6IFQMm+wdnX8scNbRi6gW9Pp
 0WZ2ioW9BrsyAlUpUwN/kqSYt1P9jUAObTuWr6NawU8r2Giwmawh5rDdjzy8A0zpPCp5AOL+zWc
 hJihvlUiOuTvFfLtK1dxi3XNiWgxCIGY3oLkipWG4XaD2VAq4Luy1mmf3AWaO9cjqu9xmiId8uR
 jLMk3HozibH25V8SNWDwsMkGhq9KWL/UhKBbXIkSkmhKOAnmRsP68PbQrPDpFpT8uh89+V7SO4l
 xUFjfc8GZemMIDBMFFThIuauvokC4tSwkWjUty+0jSCFjOgZljfugvitUP851+m9Gt3CN/hOYFr
 6ndX8pxpeDVFW+TOQ7y58gjOiwol3Oq+LjvCcHpr/7BTXDMeHgFxT1l4+bA==
X-Google-Smtp-Source: AGHT+IFwb1eDl83RWRgNOPiI2xnO3+DJqfkH5CNG1RfiaGeJvrTkceoGSYcx57ApRt9niHfqfPdvrw==
X-Received: by 2002:a05:620a:1726:b0:7d9:7096:4910 with SMTP id
 af79cd13be357-7dc999b341bmr564287385a.1.1752161527419; 
 Thu, 10 Jul 2025 08:32:07 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:32:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:19 -0400
Subject: [PATCH 16/17] rust: str: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250710-core-cstr-cstrings-v1-16-027420ea799e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161490; l=1304;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Y04H46Vkhl20b1wCTfgyVZYYKhXv1+IODFSBq3p+QNY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QN/x43LOGtGcE5XoKlHGuC7ORRj2DN1CIT42OvTRD/0MaEaE8FrNbcFi6fQDB5xIRVLz4YRHP6h
 Lk3wiyMArwww=
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
 rust/kernel/str.rs | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 61ebaacddc23..26bb3d916ba6 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -266,15 +266,14 @@ impl fmt::Display for CStr {
     /// Formats printable ASCII characters, escaping the rest.
     ///
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::prelude::fmt;
     /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
-    /// let penguin = c_str!("🐧");
+    /// let penguin = c"🐧";
     /// let s = CString::try_from_fmt(fmt!("{penguin}"))?;
     /// assert_eq!(s.to_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
     ///
-    /// let ascii = c_str!("so \"cool\"");
+    /// let ascii = c"so \"cool\"";
     /// let s = CString::try_from_fmt(fmt!("{ascii}"))?;
     /// assert_eq!(s.to_bytes_with_nul(), "so \"cool\"\0".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())

-- 
2.50.0

