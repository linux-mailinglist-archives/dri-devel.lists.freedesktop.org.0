Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F45C0370A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBB410E940;
	Thu, 23 Oct 2025 20:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BmPVfkkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7984F10E20F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:52:00 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-63c11011e01so2183773a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 13:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761252719; x=1761857519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAPXNY+YzoexJ0d/TkSSgHS667VNidACYdJWMiQnzPM=;
 b=BmPVfkkCZ2026DLOXWANitdPpdgbQaLf1l4ds+a+7jYMVRQUcdQLwZxY/ugWkun9Eg
 uWnauuGoNL9T6Ux7LQgv8gZ3CiEtg/F7y9RVxCKwHZpjUHOGtqx7BUD9Xxw7sO3X9Vvq
 LaJtHDvwsGuteZdUiiS/3znnQlunCf41nrzaVipl41xAmF9ksNa4cWYMqZ3ZT0pt2JEQ
 D9gXiXEs3AoBJ5kZxbAXmqHj+U/XrtX50GZ93oPiR7ii9AWK116JXWgodjHKi/y2vfDv
 2VdrAB3P8U79n6FuMYjCOU409fTfehAT63wBfwSbWRjLFN05fwGExN4tVFfjFR0PchPM
 QoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761252719; x=1761857519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UAPXNY+YzoexJ0d/TkSSgHS667VNidACYdJWMiQnzPM=;
 b=tR6/k3IW4qZcleq7BlLnbrSm1jYplIyBiTyy+G6vmyJDYt1GB8OlKh1L7gfXqNahQv
 lNyfgGJYqmRAwFNBsQN8eUQivc3EtHZ6POZiDtkY1i80oJAsiwOidCqOk1ZebrOjZsiA
 4SBKQ+abkQ5/7HFiT+wW4xpWwRfvt0CnDD/PS2tCyEVWdhOI8K74zjW8+jEQOEqtnAO4
 z4IdcumFuuYL7FFMhgBVUuHDJ/cEAafqtNdRr6IjRjOsIVJbVtUk/6JEDFxj+1+5apFh
 514g3M260FM6O1orDleai4aEn8PLzhYnO+2MAZDcRCUvFLR3mmqaModcUuk/WKEdrhKC
 x3iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7UTCKiE6UwJ/Uu9noL13u+w7FTPNJhX/N+vEk5UTCt4Y1x7kHmAftfsmAzMEoiWVki8j5DkePBr0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyCS9ZR2lTNlzmwST0Tfy1JLUq2zWr+5wdAo1eOT8PskNhYrId
 AzFZdvG0KAkV8dUCCh+xAxjPl0U6iqM7hg/MSz4R74kVQB+VJ77LT39R
X-Gm-Gg: ASbGnct0Y+y/xw4j2MXKGdcocbGhHquMDmSos8yxxAuCfsnWugnInMNRyM74yo4RY4/
 bnzPLd5x5nPYcojHYUE2RqFO6wOYeY+X37D+nVqLs6h4wk4mY5aJ54/FxglPNx/RxR7yB2jLEJg
 xS09APxc0R7l86Edn5YN/sbigr7Ko9Iw0rPs+4E+YWqeMr/FTypYqODveB6w+1qPK9rTvtsTH4p
 36XTzaFrkCh/4I6+8RCEtRXcAm7mLRWXtTf+zOxbB2172SMb+jRgArMTA3yD5+LWMM1QcMSwJoT
 ymm/nyMjPj8f1HgmgGgp4YBX5EjFai7ac4usaHeXrkZSIOjrPrFqanJYb8u2hMOcwH/fqoUJwf3
 r57qzgLoVZV6tY6ZZ4oz4KORvA/sCpmHG49dH5f+xZEgnNmnu9h0iv/lXTDHf3kbctuhEpYcTy/
 ESfALTkyXVszK2Z+9kHA==
X-Google-Smtp-Source: AGHT+IFOkN+DkcmLNJzRNIqysto7sYM8LlsTGTSLlhGfULzr9KAi+B1XnIznbLvzFcpxukEGtb28dQ==
X-Received: by 2002:a05:6402:51d1:b0:63c:3efe:d996 with SMTP id
 4fb4d7f45d1cf-63c3efeee79mr22748502a12.20.1761252718877; 
 Thu, 23 Oct 2025 13:51:58 -0700 (PDT)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebb3299sm2564120a12.2.2025.10.23.13.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 13:51:58 -0700 (PDT)
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH v2 3/3] nova: Update the nova todo list
Date: Thu, 23 Oct 2025 22:51:37 +0200
Message-ID: <20251023205146.196042-3-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
MIME-Version: 1.0
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

This small patch updates the nova todo list to
remove some tasks that have been solved lately:
* COHA is solved in this patch series
* TRSM was solved recently [1]

[1] https://lore.kernel.org/rust-for-linux/DCEJ9SV4LBJL.11EUZVXX6EB9H@nvidia.com/

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 48b20656dcb1..be8063030d44 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -44,25 +44,6 @@ automatically generates the corresponding mappings between a value and a number.
 | Complexity: Beginner
 | Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
 
-Conversion from byte slices for types implementing FromBytes [TRSM]
--------------------------------------------------------------------
-
-We retrieve several structures from byte streams coming from the BIOS or loaded
-firmware. At the moment converting the bytes slice into the proper type require
-an inelegant `unsafe` operation; this will go away once `FromBytes` implements
-a proper `from_bytes` method.
-
-| Complexity: Beginner
-
-CoherentAllocation improvements [COHA]
---------------------------------------
-
-`CoherentAllocation` needs a safe way to write into the allocation, and to
-obtain slices within the allocation.
-
-| Complexity: Beginner
-| Contact: Abdiel Janulgue
-
 Generic register abstraction [REGA]
 -----------------------------------
 
-- 
2.51.1

