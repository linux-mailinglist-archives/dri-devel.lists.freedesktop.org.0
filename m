Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DDA9B9B51
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 00:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886BA10E03C;
	Fri,  1 Nov 2024 23:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mY9NEQWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B698710E03C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 23:54:58 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20caea61132so21613295ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 16:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730505298; x=1731110098; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OD64WBzWdvsd2FI78h8dBEVA5ff0n1B8ZmLUMQdOtDo=;
 b=mY9NEQWRUH9cWneGAhNWLmamI8XSgfn8dtSgJmVdeIBvwmjUujC/CD4i9djq8HNey6
 eyvwCHVdl9YGJZmgqzVEf2cxk5F1Ny+Y+rmuiZMp4JU5DlsEW04OwS5wdB4rsPDAprg7
 Qyu20IOvO/iqyXLhycVHwZQdReXu6nNqORD29akAJ4aXDWQAGy6hbPj6DbyvpUyFtkPH
 OLsyGZto4cNq+VbUXZFzr72d60rYcHVp1sMplTg0xPgR8psL7gArx9aiBaJ//Ed7/g4L
 3HtcOr0srFp3uL1f4SRGBf9QIMGbnE5kk/A54zyincvCQhKPbcdLrxZiNdnEbOcbqkU1
 lVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730505298; x=1731110098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OD64WBzWdvsd2FI78h8dBEVA5ff0n1B8ZmLUMQdOtDo=;
 b=lGKhy2h02zb4uk6UZtmluuSI930Ca6NUZFzkhQowHxbV3sxcEJvBITx0QE1LzjhpIK
 R0sjBgDxpECLl0g25N5r3iS5POhaulHCzSdf9jMCob1A4jJjraQUeOCeNNwmSPI2dBvJ
 tgocDyPSlavD5Cj6RghNdDVNKOaLv4lyd92E/nLQrzZ8X2BsP4tZLeKIGnpaLw/Fk6Wz
 1hFXEQFOBLSDfkEt7MQqD03WEBFTKmStRd13SlbWOslj58RQpkc+kRk3G4MT3pgWXoRd
 /wqXrLl9noEwHrnWtBOsCenZWW2OpuOeNDStj5WHb5WimBAV0X5JRQWW1s73jEcF4uxi
 1q0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUXtacednHd1PGHKDxKZKeVUcdj+gwcIILyreIay+A0DmEfrmjBy297I5fUAxXnsDVZRu7chP/8oI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV3BQIAyMEGYZSl2OqyiAu2L+omln+FcNTzlBfERMwguefQ8fN
 ZAwGbtC+T/6bQ+1Os+2N8dQEKnVDBTqSYAkjp6J3fQ3fIfOdenwz
X-Google-Smtp-Source: AGHT+IHzYjnu+/nlPw6CJg6fvjzJcjEVC9BZZ9JccksjCJmTCVtq3JgqsuLUn+eWjxFAApBgdjiR9g==
X-Received: by 2002:a17:902:ccca:b0:210:fce4:11db with SMTP id
 d9443c01a7336-2111aef27b5mr72733505ad.22.1730505297979; 
 Fri, 01 Nov 2024 16:54:57 -0700 (PDT)
Received: from tungpham-mbp.DHCP.thefacebook.com ([2620:10d:c090:400::5:7de5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211056ed86esm26698835ad.44.2024.11.01.16.54.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 01 Nov 2024 16:54:57 -0700 (PDT)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 kernel-team@fb.com
Subject: [PATCH bpf-next 0/2] drm, bpf: User drm_mm in bpf
Date: Fri,  1 Nov 2024 16:54:51 -0700
Message-Id: <20241101235453.63380-1-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

From: Alexei Starovoitov <ast@kernel.org>

Hi DRM folks,

we'd like to start using drm_mm in bpf arena.
The drm_mm logic fits particularly well to bpf use case.
See individual patches.

objdump -h lib/drm_mm.o 
.text         000012c7

So no vmlinux size concerns.

Alexei Starovoitov (2):
  drm, bpf: Move drm_mm.c to lib to be used by bpf arena
  bpf: Switch bpf arena to use drm_mm instead of maple_tree

 MAINTAINERS                       |  1 +
 drivers/gpu/drm/Makefile          |  1 -
 drivers/gpu/drm/drm_print.c       | 39 ++++++++++++++++++
 kernel/bpf/arena.c                | 67 ++++++++++++++++++++++++-------
 lib/Makefile                      |  2 +
 {drivers/gpu/drm => lib}/drm_mm.c | 40 +-----------------
 6 files changed, 95 insertions(+), 55 deletions(-)
 rename {drivers/gpu/drm => lib}/drm_mm.c (96%)

-- 
2.43.5

