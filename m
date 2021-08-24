Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A193F6BF3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 00:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CCA6E0E5;
	Tue, 24 Aug 2021 22:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C32A6E0E5;
 Tue, 24 Aug 2021 22:54:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2BF861139;
 Tue, 24 Aug 2021 22:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629845681;
 bh=VRPyW1VeO7gfAN1WVH2HUQN9HNXvpNgT4uXN0dtpgSg=;
 h=From:To:Cc:Subject:Date:From;
 b=flB5TcWMNT76AKxh3XR22CrIVe8y0lorcQ+fmCHwlvsCWMEVcQfSoaPUhs+8NCd3s
 w3n5+bOLR393xOnucjv1GYNkNNyLzyt0Tvn3ywytxpMLxGssKqF51mFz+pQwl6khSn
 J/2ZWz5pS1Ny9jpFU/IS94ve1YYaJ3MW2ggL++ktqzgAl6F2s7Xkk1DFDm3ssrOcZ7
 GAYAHHwG3Spard0hg/zFb3yOZuIJ3fhxZDHdulADHM7JXE5PsDXhxws+PTgpIFBQwz
 pokFrA+TYRhrdFRHJWih4350aovGhGvJB65V3RUJIoSUzco2ZsoqslXX93lpvE3VKX
 igBtg/5u03RCA==
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] drm/i915: Enable -Wsometimes-uninitialized
Date: Tue, 24 Aug 2021 15:54:24 -0700
Message-Id: <20210824225427.2065517-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

Commit 46e2068081e9 ("drm/i915: Disable some extra clang warnings")
disabled -Wsometimes-uninitialized as noisy but there have been a few
fixes to clang that make the false positive rate fairly low so it should
be enabled to help catch obvious mistakes. The first two patches fix
revent instances of this warning then enables it for i915 like the rest
of the tree.

Cheers,
Nathan

Nathan Chancellor (3):
  drm/i915/selftests: Do not use import_obj uninitialized
  drm/i915/selftests: Always initialize err in
    igt_dmabuf_import_same_driver_lmem()
  drm/i915: Enable -Wsometimes-uninitialized

 drivers/gpu/drm/i915/Makefile                        | 1 -
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)


base-commit: fb43ebc83e069625cfeeb2490efc3ffa0013bfa4
-- 
2.33.0

