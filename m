Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF17A62C14
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 12:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FE010E3A3;
	Sat, 15 Mar 2025 11:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="janBByr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B6C10E386;
 Sat, 15 Mar 2025 02:43:34 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-72a145521d6so1908735a34.3; 
 Fri, 14 Mar 2025 19:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742006613; x=1742611413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MibvrQXj2P5QnlDxX5YbYon7Ne8dH6XMjJsYnk+RzkY=;
 b=janBByr8xp/2pBgGj4PUhSS65Lp21hJFCG0ZltFeserYvYRKFyc9Mf7hrB2mnZRGtE
 K08mpHkoMAmENR0pkK4g+jQJI92P4HHZpdRhdsp3fMbKMKAQ8VmC4jdcWVFOlOChqf43
 0GI9CEzBt1makc9hqxdP5dfPUCtC3Z8DKSkc5+mWs/S9Db1tU3g69+ypdfyK/VG6JzHz
 7wuU48ZcuWNPdbVIJAQrt3Im2Fah87BLOBQUrRZRbsDBiLaUwx68iAyDbe+uscXRg/no
 w9mxYnVTSDYLG6aCYARSt7lfW8Fu6bP4PbRdsWxnB/TtnOG3+pL3FaECPLeztVPWSfTZ
 kUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742006613; x=1742611413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MibvrQXj2P5QnlDxX5YbYon7Ne8dH6XMjJsYnk+RzkY=;
 b=VYpgeFqVoE6wDO8qtJ9QS+n410cIjXON6+XaW0LYnA2Xy2c6SvRJJdCOt13w8ie8sb
 pI1sTfiUtIqkbxzdKd6rzJRuwxU3M7m08ATBbMkXcxaR/8N8hRmbilpA4Alm9wAKt80D
 gR6SM29IuEH+NbYkZBDl3pM6QyRWtZNXcb1El0ndeLg9RdMbxQMrdJeafMZsIbjTTVyt
 1Cu+89EsYdjd16aQvQqqzn5W7vdmhNX6IIlt6NudvlN0LLtjgduwSaqglbLiSl5etxnI
 0MVWAHzo9GSFOPZ2m3AMq/O8cPp0JIAVCTvKzZEnBgB5IF4joKDQjwxzrmZa4Ir3MhRK
 qYSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMYMoJC25UeeVYQqchkS6LAntaUmryjNCIa/GEIdIeE2cnYQ+d6oO72rmMaiGOLNfjf8R9pXSF2A==@lists.freedesktop.org,
 AJvYcCXZX0n0SQb6xja9w4AeJDRTcnTEOVoyBghkkylPy50Nz0doDo5mfi/VsOqx1Uw5y4TKfocJN5kHil0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFbnDWZMJscQn2PI+fo2mOlyUiAsqCbrBFk5WFGkx3S5xn+yBs
 kCZ8iHsT91Kjo+JdBg20qju1bJAETJ08nvhUhrSA6QcRHCseDHWLFhkCn0Du
X-Gm-Gg: ASbGncsNfGyeMskHP8bvevARQ1sYYVmVghds62BS1KP3Q6HwvULXY+iUJuWn5zLWj34
 EzAFDzWJM609ufdXjnm0reznCgy2AooNbPtaq8aEkz2PGSYOvpz1ec4vBT6/vNbsY/Fct/sVHJl
 BjHtiNICu90wjefqAx1okGzTdBJ+TfmMgujKYceN6qt1tVwPYoKhkcnkUZbiKFaaGPN5INaG7vA
 FGBoogFbfWZlBGIcr3Us+zdgfwPwqdttWT0/QnNI58XLuwGDBS3VtbTqVNbgKugOhxRpa2/UhNE
 t2CXHtLWNWzlWoADDMYNcuxXgbpQpZ6EyNFyGyRFII5Ac0ga+Xx+yuAtZcj1YPLJQKrGZBSc03/
 eNdSS0iumsi6qfxis
X-Google-Smtp-Source: AGHT+IH81UySJfquqqsqib4YT+37awiURcsJmKDQnrwiT5WTPoR6EFhWOtsz2pC9Fb1W+uChntifMg==
X-Received: by 2002:a05:6830:3c86:b0:72b:992b:e50 with SMTP id
 46e09a7af769-72bbc4ea2a6mr3535769a34.21.1742006613460; 
 Fri, 14 Mar 2025 19:43:33 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-72bb26bb82dsm882990a34.32.2025.03.14.19.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 19:43:33 -0700 (PDT)
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
Subject: [PATCH 3/3] gpu: nova-core: remove completed Vec extentions from task
 list
Date: Fri, 14 Mar 2025 21:42:35 -0500
Message-ID: <20250315024235.5282-4-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315024235.5282-1-andrewjballance@gmail.com>
References: <20250315024235.5282-1-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 15 Mar 2025 11:49:29 +0000
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

