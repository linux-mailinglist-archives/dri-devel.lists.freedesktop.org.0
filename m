Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A5BED5F8
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4864D10E12F;
	Sat, 18 Oct 2025 17:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QWzrl0As";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BEB10E128
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:45:44 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7f04816589bso472529585a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760809543; x=1761414343; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WxxD2K5FdBz/EnZVjAulq7wLhETf3uBIbeo+/VSTI5o=;
 b=QWzrl0Asd+yo+X8dqgo1laivnHhVwLZt7v9n5ppYwmNWcxRk2fidMnnMw4ZxyaObLg
 VyaWjgYTcyNMeu2O4teU0VxUR+8x7+q2HNHVQAx32H7USREVjZ7Brse8qFig+7aD0Hqk
 kVN1+hVYIsgzWCUGgDykAGY+JuwavuEqnlkCndPL7k9Aw9ZtDEV16JTQPr5CKzEninLw
 KgB8UjyMaR64fB6HyXeCxMFVc1v0EVbwHd+bBWFoIurN6p6q3s8ZOpZSS5KYN85GQ/8I
 GSQ+6hF/YQLKTQPoUrQsN7DJzGGC3x77xLAWNNcpFQKj2jQd3ruRq66kTdZTeDn4gH7J
 jq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760809543; x=1761414343;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WxxD2K5FdBz/EnZVjAulq7wLhETf3uBIbeo+/VSTI5o=;
 b=DWcPEtdvcxv3npcFxMRFR1rE+kJPQfEeYQFF+hbCYCccmHakt3hkH936jyu2yQ61uk
 N9AiJYnJiOQe9N4/qNck4Ja468J7BWTNX71D++ELLmRO1BSjA/3czDc/IWJbAjz+X0yi
 wZV31dHhz6zsFMhEXG5ynE+BC0OIDu7jPSDQcERPaY1KiNB1zELVmQ4OZMX8DItSJJCn
 hKiOjAu7YBmO8dnjZPb2yo7lTVrVchnDMac77kEe8WHUQREnrqzVO/ICKUFHzDi92fsw
 gar32aIb8EJKdZm2B7F744N25k3USJ4dVwItzIg0hjmPLUZU7Jglsv8LsOumf+0TRcOq
 /JlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2h+9n7BK9IdwnA175gZu2fhXijlcC7cZDI+BvsA5Smas+i/4Agr/cQ9H0kmec9n0tlCAKHwWF81w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuO8qsKbVYk+HNwqnvRWV5kNzqnx1detRdzejt8fZdG1L/Y2Fm
 YljwLZwBgm5IkmEo60TXpib8IuPZn+sZoV1+gsCLjKT/4p9L/wZtxA4X
X-Gm-Gg: ASbGncs/1IaUovy/aC67AmItzop423D3WrtH/+Fhu4jc1OghEA3WQWSjdYBswd4Hnsg
 8rGg/1/jSDqUzSpD9iuBz1rBCVPAuLg7wfbzl2zh8ytwZHHdYc2D3stVIGjlCN3Lue4tfg/DGWT
 YeYnJ3wCnhaMKhE5Td/F9kQbQ+VTqJJqo148hshQAzfa3C5NyKYYNW39RLk6ZgXsMNX+G4cA9cu
 yoh0Bzzcw/cVf0p8jWHcMuFag44hb8pcU8nMTSmqrV/b9a5QXDjAqM5cVp84jAIW+1avq5+N1uh
 YKWWcNY1wTN3BLqFPbs49c3Bm/hTUtupzXuiQacpqNWfmOzYXPYYkSNNWGjbbiSA+0Ax8RQzHUn
 /BOJ3BBBJ3494byTpsD7wDxKHi6CKoMWoY9WQkt5ykqY+qiV118mY46H8v2f7AhrF6VZR1lCHgl
 b+ugO4KQ+wWQ5nfCaYFMJPPmnthMw7P+upcba34gbbG8nUb3fGfCFwQbxw/yCXpiu8Gb0Dn6iSI
 +H0Q02KQoTRN7cpZrSKVgu4MaBtSL9sXNYcelI1GiZTazvgEyhQmnjw4+dBIOI=
X-Google-Smtp-Source: AGHT+IFKKdVLl3mAPx5GW1O57JDFIbYY3aQNyGp5ohShtikkzbyW7xTlAHv9ByPokofKb8ncQ992Dw==
X-Received: by 2002:a05:620a:28d0:b0:891:7def:94a5 with SMTP id
 af79cd13be357-8917def9615mr601979985a.89.1760809543355; 
 Sat, 18 Oct 2025 10:45:43 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 10:45:42 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:14 -0400
Subject: [PATCH v18 03/16] rust_binder: use `kernel::fmt`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-3-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809526; l=1195;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=872/2/9eITdb9tB+ajd4McXNzNIKi7XLnXFm8ifjokI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNpeE2O2veZx/WAQcXn2BPsuVFmwejvaIZ814PGVaIzTcLISv+9UjXgL3SnRuXBWt3P0YjfBZ5X
 ySAtgUYGZcgw=
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

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit eafedbc7c050 ("rust_binder: add Rust Binder
driver").

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/android/binder/error.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
index 9921827267d0..b24497cfa292 100644
--- a/drivers/android/binder/error.rs
+++ b/drivers/android/binder/error.rs
@@ -2,6 +2,7 @@
 
 // Copyright (C) 2025 Google LLC.
 
+use kernel::fmt;
 use kernel::prelude::*;
 
 use crate::defs::*;
@@ -76,8 +77,8 @@ fn from(_: kernel::alloc::AllocError) -> Self {
     }
 }
 
-impl core::fmt::Debug for BinderError {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Debug for BinderError {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self.reply {
             BR_FAILED_REPLY => match self.source.as_ref() {
                 Some(source) => f

-- 
2.51.1

