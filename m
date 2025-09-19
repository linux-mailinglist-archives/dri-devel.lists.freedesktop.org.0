Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEABB8781E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 02:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8F010E90A;
	Fri, 19 Sep 2025 00:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CelWPYuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11F110E123
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:37:04 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b54a2ab01ffso1133992a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 17:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758242224; x=1758847024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xNKV2H1bYIOdZ9kzp0zgPBPORIzeOGUyz2fBTqyLjPw=;
 b=CelWPYuWSeKHB1ZWG5Dz4VuC482udxgRhtXDHrClNJLF5PtRy82m8pB5evq98I6Qhe
 QB/kRbZCZ5cCZKhSWld9bAENT+Zhaw3kNUmUeiOW06eGHOozQ0EbOxPqluVNdaYcVVFl
 qUyq9FCme6fm530NatABBCCx0BotZfTg493yyaV863MbI58JG+Gk+papRj51mTWaHfC2
 ebAjn8lbpdJvuYn0L4xy7jikOnChgGQxchFp5p7Ykiz5JiaCtQfr5nDaZhbTUlAtV+iC
 vZohn7t6eTPPJ0LU3Ps2CV9gZFgrfDaUjPaws+So7Cad9YvLuFyXfaqM0U7md2Q8Qu3E
 466g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758242224; x=1758847024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xNKV2H1bYIOdZ9kzp0zgPBPORIzeOGUyz2fBTqyLjPw=;
 b=kGABXEUlqFNlRDXeAnvA1b2CKGLk/v0eoGSKkq0JzzCFQ9/nAsHRFzUU2ImkEowk9H
 et26juW2NBSbEuO6Tlz6OYmf+eU6GW9fN4lwvtzUz0AZZyDBdTXhQttdSmhOIZ97/yve
 ieydrfCKpjKjL8dklBHtWaiTyr/SEj69ErmgrzDIIgHEahrCvSABiQjK3+4QAUnJSdf7
 gcilqdSUceTncnkc8i3w+RYg2nf0x6OEyqnR0ftRK3WC3RDsQGux4NkJlvb56V/lmuGH
 KFOopNiPeRWcMd0GWDoN5U27ApCYpJkr0/qRBZDMuDeslzT4MKAL2lWT27Md/WN01aik
 Dh0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN9i5cFJds2noQ6RvJOeg6yfHyS6gqkUrPcJ+8tQ5tZC5onu1yHelnHAkRlXoAycBNJG4Wrv7n05o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJzuvahmBHXsWMCzVGfqr78naLIhe0gxpYV28pzt6dS6QI+H0M
 Xgx6ULFUXoAwG8WJvrvbkUjOtgKKiXGrtczMUXyzxVu5LLMla9cAosiV
X-Gm-Gg: ASbGncvJ3x4HtWnFLEOV61d7TptY/dwRNnC6/L7/bWTwY0LOggIzPnFBtuOOR5Qz66w
 Qf1u1C8i0qfeYyfToFp39wavZmiefUAlNPGsGnYhhdHIjSYOCJL341cBUOIzMm7Nj/dqVeF4ETE
 b4CMA5+c0Kfx0dW7aBvV5MkuSbGmgZf5aOxc3e/9NXi0kKihmoyy1010zSICDLv0N6AcrMqYSRm
 J85c0LphJOG2h8p2gZkPxx6opP7f6NtXh8W9CgXO1xiQQZOSuhiEBnzA/8ODuaT/9ZJBVyLzOYC
 4p4v2kDAz9cxsl9R8gK9eeIqPwDygv9540Ls6a8ThXeZmzuOdL4AQUa02o7J1+V1mSQvTMG50hm
 yBRyFT0jYiTYzAeKOLBC2A8znnfht7iDj9mNadYy2
X-Google-Smtp-Source: AGHT+IE/yBNlcgm9BPTKttWbmAHCiZjMO8WtHGa5VVD5WcCQjQ2ZZ0IocaszrdjGPXBK2fPfpIuodQ==
X-Received: by 2002:a17:902:d2d2:b0:25c:e4ab:c424 with SMTP id
 d9443c01a7336-269ba534e05mr24162985ad.33.1758242224003; 
 Thu, 18 Sep 2025 17:37:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698033ff66sm36649275ad.133.2025.09.18.17.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 17:37:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id EA12F420B4E0; Fri, 19 Sep 2025 07:36:59 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Bernie Thompson <bernie@plugable.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>
Subject: [PATCH 0/3] framebuffer docs toctree index refactoring
Date: Fri, 19 Sep 2025 07:36:37 +0700
Message-ID: <20250919003640.14867-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=bagasdotme@gmail.com;
 h=from:subject; bh=/zHl7Hocdub5nwWFq/uhyVeik+EKW0ciwzHubkGEnkM=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlnllSdYxS+K3jwt99iXc3oxld1K1Pf7Ez88NJ9dk+K9
 //qzx07OkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRF4UM/+O/ua3WsUgKtWGW
 +994d06Y6xeL9kMOz44+b5u9a/7XZG5Ghs2hFX9eNwdKVG6//E5p/97fpw++fPU3LW+bZDbXeiF
 mWWYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Hi,

Here is simple toctree refactoring for framebuffer documentation,
based on docs-next tree. Simple because it only splits the toctree
in patch [3/3] into two sections.

Enjoy!

Bagas Sanjaya (3):
  Documentation: fb: ep93xx: Demote section headings
  Documentation: fb: Retitle driver docs
  Documentation: fb: Split toctree

 Documentation/fb/aty128fb.rst  |  8 ++--
 Documentation/fb/efifb.rst     |  6 +--
 Documentation/fb/ep93xx-fb.rst |  4 --
 Documentation/fb/gxfb.rst      |  8 ++--
 Documentation/fb/index.rst     | 80 +++++++++++++++++++---------------
 Documentation/fb/lxfb.rst      |  9 ++--
 Documentation/fb/matroxfb.rst  |  9 ++--
 Documentation/fb/pvr2fb.rst    |  6 +--
 Documentation/fb/sa1100fb.rst  |  9 ++--
 Documentation/fb/sisfb.rst     |  6 +--
 Documentation/fb/sm712fb.rst   |  6 +--
 Documentation/fb/tgafb.rst     |  6 +--
 Documentation/fb/udlfb.rst     |  6 +--
 Documentation/fb/vesafb.rst    |  6 +--
 14 files changed, 81 insertions(+), 88 deletions(-)


base-commit: 348011753d99b146c190aae262ee361d03cb0c5e
-- 
An old man doll... just what I always wanted! - Clara

