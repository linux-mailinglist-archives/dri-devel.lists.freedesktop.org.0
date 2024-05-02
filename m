Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC31F8BA330
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 00:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC25610EE05;
	Thu,  2 May 2024 22:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bTlM6HG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D01910EE05
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 22:33:44 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1ecd9a81966so9591835ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 15:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714689223; x=1715294023;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Alkyi5JqXUdcGMCJmPn2xNXTUHn7MjYy9EVPcBLGUQQ=;
 b=bTlM6HG1Us0dHeidylhPUimN0RRV8pgph1DmnIOqtT7wzN66taD5q9KDaRUzEtF44d
 Rh2o+pUB+CFib/T3YEjU+VP+Lgfhwy+AWWqWRhosvdkUnJqVRcpC60KgvgHyKxp4OxoR
 XYB21zYp0Zfgm6I4KN7l16fQH1ckx1m0owXTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714689223; x=1715294023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Alkyi5JqXUdcGMCJmPn2xNXTUHn7MjYy9EVPcBLGUQQ=;
 b=gBgq0XK4ZvFP1teMIlhno/4GV8EiLQqBEaKdDMH7XF4mKrBips1Xtwfb3RHp7/+PUb
 apew6N86N03ZmT1uFIv+Oxwm6nkWXerw2SVLQ73i3I8L+B7TeOqG0kloHWvM1+NK3k5g
 7s0EFzCMioSx+xUHICfmTzkD8FXWKo4vzlK+LE4ij4rKKCDUpCqnUwivxPPVR44wVj6J
 d3Lx/dhgfoFV7nMi3Czp5HMKRCh+DPOMEZP4vk0Ush6U5LLiqQRT24GCsdOpCFe1axWk
 lrZMu+Y4kSVJUG2y4s3AUwfzLG3rQ2uVJ4suU/anx3tsdtYCqEuW82IMUF+EdKQL4+Hy
 CQdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEP7osu78S3eC3H6xIqC7Plp2S5Yq44caGJcHcuRHWeGEV7smSEEw8KFzIgJiBpg0WJcJP1PuedfTyQBDaUjI/04W+N1qivOlzI7Fpf9Mi
X-Gm-Message-State: AOJu0YwITL5ra4Wn1lVs2GicizLdzNE+ibxONjmjC5sKFDcrJEE4eNGm
 ecb4QO657iW8sTwxUtJ2ig1VdeFG9rRjWrWxx9K+5YDviAfywIz0pNwTtuH2hw==
X-Google-Smtp-Source: AGHT+IGAayZiLEBsyLgIJp727/HOhIW8jcf68JHnImgIz5MoqiH36x7xVdhDcqAQUHQ4AOs7ALD8tQ==
X-Received: by 2002:a17:902:ce81:b0:1e2:7734:63dd with SMTP id
 f1-20020a170902ce8100b001e2773463ddmr5911220plg.30.1714689223609; 
 Thu, 02 May 2024 15:33:43 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a17090301cf00b001ec852124f6sm1859006plh.309.2024.05.02.15.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 15:33:42 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <brauner@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH 0/5] fs: Do not allow get_file() to resurrect 0 f_count
Date: Thu,  2 May 2024 15:33:35 -0700
Message-Id: <20240502222252.work.690-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562; i=keescook@chromium.org; 
 h=from:subject:message-id;
 bh=zh3jTYlv3gAfsJ0fJDEOOWbgXfu84QDhZ5jAngTPr/A=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmNBTDFUoY6TVoqmQxs375eqvdFBj89/ctuDLOW
 2+X99yJ49+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZjQUwwAKCRCJcvTf3G3A
 JspPEACtGBTA/04xGkfNe0POOY6UGlh9ESMNyH/8oZZ8d3UQPt4M6jepl1PWlD4m3cEnHJK7W59
 Ew1O/o3JMO6xpM/DaYhVWnWU6vmyOuXC2BLL3sC0H78DoDCS1YeGvgwcsLvoJQkPR6yocxZc1Lp
 ArPQeS2n1GN6Natd2CKQpRU1hHaVx8V4k47jJ1C1ooXgDt7NaA3v3Mxp2k1nkVABc40Xt0iPZHe
 N135yJYCUnJcpYLB0ibjarI10wI4Q38s3kkHaSPBUFFlyZzwaqs8cVJtVafb+WFIadgKLSgplR6
 Gvo818ypPYTYB7jNIlptvHB2MpN4nJBL6DYjM9W9EA22HbIDDGJexmcFxNXqlQl/qXZpFt7XmnP
 Q6IX+BvQ65e6Zl3n+AYDDb+8lD/3uddFxKLY+yN8uImNTJaomfLEsLEdpWNQISX4Sd0iZoqRgNU
 wW8OcE471z7VJafbM8my64tY9J+xrj7sh3jZrbv695WaOXZVOZhvKl4yHNKdmuB7SwoTxzGJp8c
 6H/kFSBF+jTC0H5n89DfR0Uuy/y1HoONrXrvE252vDox1DwVh8Gfz62Vr1+HtbNlBpcN9K4w/k7
 /tznwjyRyIqPUxNhJJzdX9hpAs9d/CHvDyY8049XOPocPYOnqRtriVf3abZjlh68t5HB+axTGF/
 GHusxWn D0shXk1Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

Failure with f_count reference counting are better contained by
an actual reference counting type, like refcount_t. The first step
is for get_file() to use inc_not_zero to avoid resurrection. I also
found a couple open-coded modifications of f_count that should be using
get_file(). Since long ago, f_count was switched to atomic_long_t, so to
get proper reference count checking, I've added a refcount_long_t API,
and then converted f_count to refcount_long_t.

Now if there are underflows (or somehow an overflow), we'll see them
reported.

-Kees

Kees Cook (5):
  fs: Do not allow get_file() to resurrect 0 f_count
  drm/vmwgfx: Do not directly manipulate file->f_count
  drm/i915: Do not directly manipulate file->f_count
  refcount: Introduce refcount_long_t and APIs
  fs: Convert struct file::f_count to refcount_long_t

 MAINTAINERS                           |   2 +-
 Makefile                              |  11 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c |   5 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c   |   2 +-
 fs/file.c                             |   4 +-
 fs/file_table.c                       |   6 +-
 include/linux/fs.h                    |   7 +-
 include/linux/refcount-impl.h         | 344 ++++++++++++++++++++++++++
 include/linux/refcount.h              | 341 +------------------------
 include/linux/refcount_types.h        |  12 +
 lib/refcount.c                        |  17 +-
 11 files changed, 398 insertions(+), 353 deletions(-)
 create mode 100644 include/linux/refcount-impl.h

-- 
2.34.1

