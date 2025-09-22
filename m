Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E85B9012E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 12:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C3F10E40F;
	Mon, 22 Sep 2025 10:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Px1Frq8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8234310E40F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:36:40 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-77f2077d1c8so1144365b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758537400; x=1759142200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O4rjMybAXAfa9QQnXjs8aGz45/fsypTonY048qW3FBs=;
 b=Px1Frq8OxpwG1GJxxeR4iMuspl8pOK+tSBJtv88zBrbr5fWo5yEIFPmePGipdhagIG
 fb9JRTQIL3LlZ6ErsEhHjFJF24b3l9loKdKrF6pXacgkQazZRZSb5DnTEcfpxPrmWSpr
 u/MGwaGfxtRPtlfbCdIBsJltqL8zOZ+FdoB8i+MGkJre6i90m21qv5jbta84uY7ndOe1
 cTrAgsRLs/NJyNviu9ETEZJxl0QQO96jRz+PCdaNni67RnW6GcVwSIlbhIPr3mpqBETN
 rPihoFEZxG8O9JfkPrUc7mTH6Hg9c+Kp312j5E5QXRrDKAMtvRklHIGlwX5ExkrxuM6m
 wPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758537400; x=1759142200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O4rjMybAXAfa9QQnXjs8aGz45/fsypTonY048qW3FBs=;
 b=jdp//HXTGB0MYqhiQpE8KGfY8kqLWwZEh7WSIBjaZJEHrkDgq4NSqYjfHlkZbV438+
 7Js1T/OVHIdrYQWRf31Mq/8I78MOLJs/oR7C/se235H2FyZG8qhH2ly3NYEjbSsArIbl
 LDSwkInPyLXIAsdpPd3RFLlsu3ndtF2LOfNhJo+joYNdRNvI68zgepk3TLXIa7h8fiKG
 TWf6c8L/URInnuH4rhMhEssrJo1GIqyvL7aUnohcVEIpkyEkNp3PotXUB25tfXJuF/0j
 E0UHUyIqn47Zj/VnZMuVQA2ojBEGOXf7siml63eW5u/iJK08B/0SPLSZEN21INzqqTVu
 vDtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+VVJaznCtSR8+OBktKA3sZCd/ix7zhB8PidfCIqgu4NECW/y73HmxXuVNPtaeohL6GrhFdBqnzm4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT3N64pqNCgsXLPCs89b6hjHBO/jTGezqX7NjUsP+zLS5QML00
 DGWQS0EKvjBdRXsKQaV+yXPLEbuSSwgaztyEGYsNwDK+SjbykFOC+3mt
X-Gm-Gg: ASbGnct/nP8jNswAmdLzAoG9eF6n5+ImPtIGuRiea3hCyekA0uJF/LZoPeDVP1RS7nW
 1Md88D/jQhJm0nH7xmvnGF0GEV4u59WT0l0HEF1alCPJ89+/2drW9JYGLqYfRRGvlUL5DIpKnsX
 7aXoXnM1Qah9D0EY1jpMOizWBosN+2B+9JVfy5aQAjMCowgsRtCJ5v6l8q+Ywx0LGe0ndkfNgN/
 rkjttL3iSFopEtE6yBKjrq9zoX0CwEpTb8zxRUl5dWow2ZAbED681SataNUo7xZr1hgB16nIyze
 GCnaRkFOo1TFVqwO9KyLzeYPkJFYcKgrOv2faNO/tKFlAViOrMS/MQBiBJW6e6J73/yxlqBKnne
 b3lC4ujwhPzV5yKI9+EkDbQ==
X-Google-Smtp-Source: AGHT+IGx/AbAeHF8PEb0Q776W6z+sCUlCf72y7lCKvvsiZcqlsNVtOnkt+abaAy0lE0qaFDfobwBLA==
X-Received: by 2002:a05:6a21:e081:b0:248:86a1:a242 with SMTP id
 adf61e73a8af0-2920104846amr16819940637.4.1758537399897; 
 Mon, 22 Sep 2025 03:36:39 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32ed27612b3sm15751320a91.22.2025.09.22.03.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:36:36 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 4A87A423FA7F; Mon, 22 Sep 2025 17:36:34 +0700 (WIB)
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
Subject: [PATCH v2 0/3] framebuffer docs toctree index refactoring
Date: Mon, 22 Sep 2025 17:36:13 +0700
Message-ID: <20250922103615.42925-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=bagasdotme@gmail.com;
 h=from:subject; bh=RXgkduA9t/iaVUetjSaNFmeGS+3ycNLeNR6/iqQUeUo=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkX1QJvvc6sv/jO0nqfj0DYtUu7tRW/7X70Km37Ao3pJ
 2LZSxfwdZSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAis4sYGfb4Ctjv/7f6iW73
 x8VKe54ssFz3ZU+RvmW++9oU7lMvrBQZGeYFbvq87d5V56gezZPWqSeFNr56/O5c3UIm2SlTH65
 24GUHAA==
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

Changes since v1 [1]:

  * Apply proofreading suggestions (Randy, [2/3])
  * Add review tags (Randy)

[1]: https://lore.kernel.org/linux-doc/20250919003640.14867-1-bagasdotme@gmail.com/

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

