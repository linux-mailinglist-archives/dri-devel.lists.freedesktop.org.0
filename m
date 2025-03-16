Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D0A63549
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 12:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD8810E131;
	Sun, 16 Mar 2025 11:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EASY8a2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F3F10E134;
 Sun, 16 Mar 2025 11:17:32 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-601c12ac8d0so1597470eaf.2; 
 Sun, 16 Mar 2025 04:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742123851; x=1742728651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MibvrQXj2P5QnlDxX5YbYon7Ne8dH6XMjJsYnk+RzkY=;
 b=EASY8a2QqL597+w10wi1uAB2XS04sx5lQY0EVnHgn8sX8D1kBDJfFpJqLJrmG1TELy
 HXYGNKElK00h9EqgpfGgS6nsmO6ZwyhXFXKKCq+VtWGXICip1kFrV0Yb4Q33tVcTgzJx
 LzJbSrQdLZkbAGKWtzunCOzbwXSwSxm/9nXmwZbReVwDPF4jNo+YIxGgvdDAbQmFG3mk
 t5751Ecpo9l7r4uSt8j91spWKc3vORvVXE0p3g3vz9lQmCW/k6jqNr2KOVUrraEkt9cA
 wspDKB7NmoS0G1oZjGjg7KeV96TJCmhK1l3rci9X1Bpnd1Ceffug1W1Woc+DJwiWkHkI
 Mo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742123851; x=1742728651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MibvrQXj2P5QnlDxX5YbYon7Ne8dH6XMjJsYnk+RzkY=;
 b=umTSpZ6X21wzrWsPuqmB7D3AGO/dwNnFyKXGOM0+dj3A5fh8II0DEfxQITa6wNYA+c
 6NvYV7PyDFCmsMxEfgJPvMvwACAibraylwXmYUWzuC8Oxe/grWnteQiiIh+vKddxvJEs
 CN5VZvRMEISzAGOa6WfTozs9chD8eImwXXCuUDyYcbq1UCIIaMCRefBZJ/nN1mUqwhsD
 kF8Zjsopq060of8gLAjGhcRqG8oAdOu4ygbY0+KqLpGIDdx6t3nvB6D495L6ildTqWdX
 NgHQ/e/FDfM0GZmjMAv9hcTkzu3jBfxnlqzKNUMuAkLginHxaqFHhlwhXN3VOnex4qrW
 uYzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOjSV4bgFawrkODDfwS1MxoJlSVxdZg3+CCf2/5NNnssoRwdyWfYg67GIgFODOh55LaCRlngfKCQ==@lists.freedesktop.org,
 AJvYcCXgLroLKv3WwmrYhgK2b1VrUeR5yeeaFJwQREiL52+BEzbSpmAEkq8laOdfzcyMWHkcv+HQXwI1xjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiWs62Sj6ToV7cQkaEqFRCBWwesLFATyV5iuDwQcNtonGmW0vA
 fy5LSmxXWyXSxALzUnusMoy/LVOSNzGPL1T/fZk+VM8TRVUC98xk
X-Gm-Gg: ASbGncuoXQ53cKXoER7qT5pbGPj7Q8bw63y9prBqORgCqOK5Hqd4bWhyw4aZCquqWd9
 iBzwu1AS9g7c444rYq3HqO4JfnmCS9qVdsW1sf3Uv9zr2BPbTN4EpcKgADxRtECv2WmW+lbDRj7
 PnaCjhQDR3tcomB7M8nrwBa8I+ZZFYavcGmFDDwnhdrKX0mJRXjJUzkTvOBOMNIIFohyZI+BxHc
 7CCLvGW00ufTQd94H1dFIP3uekzDkqTOaLMl3eQ/Vxa3zNwyBKNtWBNVcAbCIiJ7g7pY2MW4E/q
 sD3dghhCu9Dg+NQCoKdPIJYTHGsrHDq1YywiAHfk9Kx2Cog+lrwYEUWh8v+4xyGMrBO+lSi4vQF
 SXnmezWwZQxVlv0Y6
X-Google-Smtp-Source: AGHT+IG0u7JDaDNYIHwPQlqHBQlgmBC+Fo0wrepsC3YNTau6TIWAGIJlcCHjX1uHxt1F9G2iknrsEg==
X-Received: by 2002:a05:6808:f12:b0:3f4:af3:74a5 with SMTP id
 5614622812f47-3fdeed0d78emr5189018b6e.21.1742123851687; 
 Sun, 16 Mar 2025 04:17:31 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 5614622812f47-3fe832ce015sm715978b6e.7.2025.03.16.04.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 04:17:30 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, andrewjballance@gmail.com, acourbot@nvidia.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH v2 3/3] gpu: nova-core: remove completed Vec extentions from
 task list
Date: Sun, 16 Mar 2025 06:16:44 -0500
Message-ID: <20250316111644.154602-4-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316111644.154602-1-andrewjballance@gmail.com>
References: <20250316111644.154602-1-andrewjballance@gmail.com>
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

The requested Vec methods have been implemented thus, removes
the completed item from the nova task list

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index ca08377d3b73..234d753d3eac 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -190,16 +190,6 @@ Rust abstraction for debugfs APIs.
 | Reference: Export GSP log buffers
 | Complexity: Intermediate
 
-Vec extensions
---------------
-
-Implement ``Vec::truncate`` and ``Vec::resize``.
-
-Currently this is used for some experimental code to parse the vBIOS.
-
-| Reference vBIOS support
-| Complexity: Beginner
-
 GPU (general)
 =============
 
-- 
2.48.1

