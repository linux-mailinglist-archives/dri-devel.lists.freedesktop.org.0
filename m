Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B721CBE1DB5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 09:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B2F10E959;
	Thu, 16 Oct 2025 07:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rexpznn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A506110E8D3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 19:50:38 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso1335098f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760557837; x=1761162637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFRVqaDMnH4SBXpwWtqNUxjwC6dLm5pDnJjbqzI+Vnc=;
 b=Rexpznn2VrLmdLwro2dbIjc+EXI3i8cAdqGyfjXrvKu9FvqAA8kt3luhn0wKKgZIt3
 99jaUU1jX+NDkhYLzRtIwwJRL13UWABoijb1RMv1KvbDvoBFrjOXb8e9Vccg1xo+6qkf
 8lwAVwhsYuQquoq68N4jALSZBLR9/9HmXo8w87jeOp55NedLQ6gcTiUMDvUu//s6kT88
 8GQsyUAs3ErwIXJBH0Yo0EstNRBRSsW6D8Y6K2s3x3c6xLuQiCHd0YXU3YeccWd9u7bp
 E5+ufzRcwaic9OTjvvn6AZxuV2eQov2VNkWXaDfPkIGmgyB0Yq024ol2mqw0YHqoqkZy
 EBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760557837; x=1761162637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFRVqaDMnH4SBXpwWtqNUxjwC6dLm5pDnJjbqzI+Vnc=;
 b=uXW4NndjJmuZ48RMlFvQiVtLF9aYpfsilORD2D7ia0HvRxauTxze1KGtpEEvwROXP/
 TLxiPllOKPn33/YMxkKJ6lxQNR8GwMOphaNzP4hPb0M/+KGQCn+54hSbRD8JL62kxZmM
 RkCQpw2HNXBFhIQE6NrR4qpodUva2GbdbEg3PoePRN01MzOZllbw647HAZJhOa8/KLoN
 ho0bQBGqEOlMFTl+SnP7UcuhMEAwSw20dyA8vjkhfmbourznzdZkJ6+jtzFsvifpSkg2
 Awa8WEJZyUqi7nopuuwt2dn56nb6BWZBQTCzdBZ5y8I/gLKd9vBpxg14m94C5ZvR3lus
 cE7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM95IByJU+0b3h+A9Xz1OH+10VBM3kJmzqg4/PDFeJC7mHlr2OGYlZe/i6Hvot72F2Ki/poF/cMDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXoVOPogc0SCIFOyKaxIruwxeCOdTQA+bvNk/vFahEPeuJoLN1
 M3Xs2Ub3ZcVqeXClIPyWy9ZzkYX+XUnelBwHqqpjyaM2LtjcyPo8cGcS
X-Gm-Gg: ASbGncsI74vKXZkfBs01ZFzBNSsI6vKrpClYR4OsnoQkAqwcrRF3w0Gy/eC3gIt5WUj
 mFl0W2J9m8dOw552ejedn0l9Fn13nUebty9ziMjA8Q9Gncb+ZY/wIrwwSin3Bo3yWFGwdOjIZLd
 m21/3xnaen1Lvs0HxJ87wjgfhKjBMiT73a58oxzJBToapk6Ckulgl4631DTwEECngBzaTDMI12K
 0/390PWapTODke52QOe2L515AHGnYl7DZEFqPa2fKkGWExowq2wOTncu1LXs4ShYOBt+qCQPeiS
 UcmPAXZJO2vuk+dcvXI8tGwnF2gshFpQMBjrP5vXxvLZNkOuMP1FHxprOfqIF97Fm9UGwlJakO7
 st+jGsGmNybVn0SgKUh4hyeX7zDpJndgVhFGb7wvMWFdnhqTchsA+4H2t4GI5RtXRHCslSMOHLY
 u9E1ZTbF2bUmHHV3o=
X-Google-Smtp-Source: AGHT+IFewXtBswgFkJ+PxuKCQAic+eavwTJGRRYaxnccnJwiMsIC69bQdFW+noWi4hvllo/GJsJtPQ==
X-Received: by 2002:a05:6000:40db:b0:3ec:42f9:953e with SMTP id
 ffacd0b85a97d-426fb6a7131mr971099f8f.7.1760557837106; 
 Wed, 15 Oct 2025 12:50:37 -0700 (PDT)
Received: from archito.cern.ch ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fc155143fsm281464675e9.11.2025.10.15.12.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 12:50:36 -0700 (PDT)
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
Subject: [PATCH 2/2] Update the nova todo list
Date: Wed, 15 Oct 2025 21:49:36 +0200
Message-ID: <20251015194936.121586-2-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Oct 2025 07:06:00 +0000
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
remove some tasks that have been solved lately.

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
2.51.0

