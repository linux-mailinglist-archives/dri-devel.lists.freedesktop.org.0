Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79A8758769
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 23:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5FC10E3D3;
	Tue, 18 Jul 2023 21:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A889810E3C0;
 Tue, 18 Jul 2023 21:44:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AE54608D4;
 Tue, 18 Jul 2023 21:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24652C433C7;
 Tue, 18 Jul 2023 21:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689716680;
 bh=WRmUkvHCf0DOJPqggOYYHIoKA5A8yQxRz1n29Rm5EYI=;
 h=From:Subject:Date:To:Cc:From;
 b=Hg9SfAL9YmLKBMj6deKEhWSJKzUCBpMO3/1aA3VJCg+aGlTP7+Aqejc9Be2Se3Upw
 vWmWbI3Qp/uxbmVQkqR8g/3qxAA59P3a8+CzS7a9WbSzDRLaIOscGxecVtPQ1+4w23
 eBQeNh2HdEptO5+mcCPMfzpeg5Jo/mIsRjSpllb4yCEDe8kBEFPQjVKdUsa5iA7hZT
 uahTH22WWerlUe53u8vv94GMI762t7llCAbSohcKH6FdTCPyigoJirZij+u+Hndxi0
 VSCWX509FXjwSYYJ9aCe9j3JNI89tKZp4mn4h23AqzF8AdV50LwbQH9p7LZokNyyk5
 eH4zSYp7pYFkA==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] Avoid -Wconstant-logical-operand in
 nsecs_to_jiffies_timeout()
Date: Tue, 18 Jul 2023 14:44:18 -0700
Message-Id: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-0-36ed8fc8faea@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIHt2QC/x2NQQrCMBAAv1L27ELaBjV+RUoI6aau1GzJRhFK/
 27wOIeZ2UGpMCncuh0KfVhZcoP+1EF8hLwQ8twYBjOM5tJfMStF9VX8k1Nqpq/8InlXjJK1hlx
 xlYVjWFE2KiHPaIOz9uxMGslB626FEn//z/t0HD+41YJ1gwAAAA==
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, emma@anholt.net, 
 mwen@igalia.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2460; i=nathan@kernel.org;
 h=from:subject:message-id; bh=WRmUkvHCf0DOJPqggOYYHIoKA5A8yQxRz1n29Rm5EYI=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCnb2Y99KjtXGfe5POGkkvgMqYvt3ncDvKUXbosVlAm91
 N58jX1yRykLgxgHg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZhI0DuGvwKTrs+qTlDlK/bn
 Wxcna2q9lKnFbTKfrkLt2wbtE2wxVYwM2464CRzVX6hlyNc0/0X4FOvVnO61XKtNTQ2n1PF+W+3
 LDQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: trix@redhat.com, intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 ndesaulniers@google.com, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 justinstitt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

A proposed update to clang's -Wconstant-logical-operand [1] to warn when
the left hand side is a constant as well now triggers with the modulo
expression in nsecs_to_jiffies_timeout() when NSEC_PER_SEC is not a
multiple of HZ, such as CONFIG_HZ=300:

  drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
    189 |         if (NSEC_PER_SEC % HZ &&
        |             ~~~~~~~~~~~~~~~~~ ^
  drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: note: use '&' for a bitwise operation
    189 |         if (NSEC_PER_SEC % HZ &&
        |                               ^~
        |                               &
  drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: note: remove constant to silence this warning
  1 warning generated.

  In file included from drivers/gpu/drm/v3d/v3d_debugfs.c:12:
  drivers/gpu/drm/v3d/v3d_drv.h:343:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
    343 |         if (NSEC_PER_SEC % HZ &&
        |             ~~~~~~~~~~~~~~~~~ ^
  drivers/gpu/drm/v3d/v3d_drv.h:343:24: note: use '&' for a bitwise operation
    343 |         if (NSEC_PER_SEC % HZ &&
        |                               ^~
        |                               &
  drivers/gpu/drm/v3d/v3d_drv.h:343:24: note: remove constant to silence this warning
  1 warning generated.

These patches add an explicit comparison to zero to make the
expression a boolean, which clears up the warning.

The patches have no real dependency on each other but I felt like they
made send together since it is the same code.

If these could go into mainline sooner rather than later to avoid
breaking builds that can hit this with CONFIG_WERROR, that would be
nice, but I won't insist since I don't think our own CI has builds that
has those conditions, but others might.

---
Nathan Chancellor (2):
      drm/v3d: Avoid -Wconstant-logical-operand in nsecs_to_jiffies_timeout()
      drm/i915: Avoid -Wconstant-logical-operand in nsecs_to_jiffies_timeout()

 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 2 +-
 drivers/gpu/drm/v3d/v3d_drv.h            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
change-id: 20230718-nsecs_to_jiffies_timeout-constant-logical-operand-4a944690f3e9

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

