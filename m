Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A469F044A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 06:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01A710E23F;
	Fri, 13 Dec 2024 05:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FM/iQDg7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428E110E074;
 Fri, 13 Dec 2024 05:46:44 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2156e078563so10800195ad.2; 
 Thu, 12 Dec 2024 21:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734068804; x=1734673604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9nDBDHl8OkOEbonP7/O/xeWGAuqOftf+4IMvf+gS1cw=;
 b=FM/iQDg7KC4a/755IIO7QtW7lGZizb9Ij12tusXglECWpyQ9nvOTMHAcDQwxPnjnYo
 eTsmAPsuz79GW2gDJB31OVGRJSLIvIdoV//6LhZKavKhZUdkvG49eXuYeH7FM/LeRfjP
 hpHU4RxyoJvFZIZ5WFJINR8gs5wgEdI874DfumKMva7Hez/g9dQjQvSD0GxM57ZqiRUn
 Ze68Q8GAR8BO+Otz3EB8MyMegI37Yf180KgHlGvecTr7RT6Z/zQ5ifdva8QEAGqA9rxV
 5k8tF13tb13nM2JEThwqXq215k7y81rAhUluLZI9l+xXAdlzqxQuOL4CGYB6RCQ+9rtm
 R0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734068804; x=1734673604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9nDBDHl8OkOEbonP7/O/xeWGAuqOftf+4IMvf+gS1cw=;
 b=mFWDB/eHGMLYTkaKvVKZ60/txoFkAnA43c4hJyKomRRG88tb4QvFogw4OsBvUIi5Vu
 QOA8BiD/ML7hvLNsYYv1y76T6dbHHOGIsgr8EpdSQiUciT9fKaT7iu6CdSdosuYtPkw5
 7ZsJ9p1VmmQ9jEF20YLao+0dw8dSsHzdBGVWM+PFvLfVH4ZGFOSTwuBPh2FjbEE8/CZH
 2lsLwyvnIkJbBT/TAQhitGsdmuooeqm5zWKs2hTprneecYU12Y/AULYcgNn9J+wj7emC
 uJ8yJfX211t7igSyOVZyJ0JEVpbKBTaILhPtggFQygO3LlvE+qtzr3K7CBAttlu25Dwi
 bZHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuNV/C7KDZ61vdMumNzJGhNjpMAlyZS/AhlZd4MRE3HobeUI7E6xaybrgbdXf0oeOuAQfTE9O7Q8o=@lists.freedesktop.org,
 AJvYcCWS6LZqKveP7bsekch4g5LppcXizEU5XoTm8x26xqOm74sc+ymQcqpR+ZsPSIK/l9G4O/r2a9TBwEw=@lists.freedesktop.org,
 AJvYcCX1nmu/3KwyscWOAguGfYweWt8GgaEE63J/Mv4yirjKB47QZeYaOYR6633KAxKNpvUJ8FCfecaQFZbl@lists.freedesktop.org,
 AJvYcCXHM+EdtG+QH1Y0pzz6C3N1W4Ht+sgm3K+k+QTFPLB6MDAhZbO6XMyZQIrMA7ohfrnIHiXdwRg/Vw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuXR864N1lZGhEEgmYBdzJda9RMNp1aqTsCT+X4sCmUoEV9qJ5
 mkcfAIkMKDbxUYZyAKXwTTN5LjhLbRkGq+1bDN8+prts/1ZJn/MaLsk0ziHZoGk=
X-Gm-Gg: ASbGncsKUZK8Aboj2I69p6dCvLNo9vla2jLf07xDz2WOGJ/DMCfLjVFYERktOyE4Vt1
 1LBpFoIqYz9PoW40OY3QFSQXU63CBL4fUA0xOL4s9NUczjx8krGa34kIlIGEBi9BSVyBFaPVoih
 2BlZo8F85exj9cvo3MyGc4T9ZAqILbfUCdV85UypY+nX5lRCky69tY/cqE76hth3D9RaLKumHfv
 m0Ct3JNbdWgQGRPvsKjZrRxqhOgspaV4r49ieGReupJvjLjjan/a52yy442Ls55tVTWhxXfL+6R
 hsT2R6s=
X-Google-Smtp-Source: AGHT+IHVKByQs8aQw9nFW65MyCdke95tovLrIe/teYLFc9u83Eik6guIs9oKZyvf6Ts5Rmy4R5h3SA==
X-Received: by 2002:a17:902:ccd2:b0:216:26f1:530b with SMTP id
 d9443c01a7336-21892a70579mr20915305ad.51.1734068803702; 
 Thu, 12 Dec 2024 21:46:43 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.46.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Dec 2024 21:46:43 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH 0/7] vsprintf: Add %pTN to print Task Name 
Date: Fri, 13 Dec 2024 13:46:03 +0800
Message-Id: <20241213054610.55843-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
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

Since task->comm is guaranteed to be NUL-terminated, it can be printed
directly. This patch introduces a new vsnprintf format specifier, %pTN, to
print a task's name. In this specifier, p represents the task pointer, T
stands for "Task," and N denotes "Name." With this abstraction, users no
longer need to manually retrieve the task name for printing purposes.

In this patchset, all instances of get_task_comm() used for printing the
task name have been replaced with the new %pTN specifier. The raw uses of
'xyz->comm' for printouts will be addressed in a subsequent patch.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/bpf/CAHk-=wgqrwFXK-CO8-V4fwUh5ymnUZ=wJnFyufV1dM9rC1t3Lg@mail.gmail.com 

Yafang Shao (7):
  vsprintf: Add %pTN to print task name
  kernel: Replace get_task_comm() with %pTN
  arch: Replace get_task_comm() with %pTN
  net: Replace get_task_comm() with %pTN
  security: Replace get_task_comm() with %pTN
  drivers: Repace get_task_comm() with %pTN
  fs: Use %pTN to print task name

 arch/arc/kernel/unaligned.c                    |  9 ++++-----
 arch/x86/kernel/vm86_32.c                      |  5 ++---
 drivers/accel/habanalabs/common/context.c      |  5 ++---
 .../accel/habanalabs/common/habanalabs_ioctl.c | 15 +++++----------
 .../drm/i915/display/intel_display_driver.c    | 10 ++++------
 drivers/gpu/drm/nouveau/nouveau_chan.c         |  4 +---
 drivers/gpu/drm/nouveau/nouveau_drm.c          |  7 +++----
 drivers/tty/tty_io.c                           |  5 ++---
 fs/ocfs2/cluster/netdebug.c                    |  5 ++---
 kernel/capability.c                            | 12 ++++--------
 kernel/futex/waitwake.c                        |  5 ++---
 lib/vsprintf.c                                 | 18 ++++++++++++++++++
 net/wireless/wext-core.c                       |  6 ++----
 scripts/checkpatch.pl                          |  6 ++++--
 security/yama/yama_lsm.c                       |  6 ++----
 15 files changed, 57 insertions(+), 61 deletions(-)

-- 
2.43.5

