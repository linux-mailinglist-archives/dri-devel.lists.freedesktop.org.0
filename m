Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DDF9E0A12
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 18:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D3810E7F4;
	Mon,  2 Dec 2024 17:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cvO1Ds0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E7710E75D;
 Mon,  2 Dec 2024 17:35:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 320D35C0365;
 Mon,  2 Dec 2024 17:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D02C2C4CED1;
 Mon,  2 Dec 2024 17:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733160903;
 bh=H6X4HxSuzHzBru4loE1fIv7uvjl0ePjrXaJ1JNnadsE=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=cvO1Ds0kUEVV4XP+U5TwsILj0wy1zw0nCs8k2BqpB3wKlYNvzoUniCJQW65nhjh1o
 saSQvVKWHUB6swLh4BekAGHyuiL7dQGD057mzrrCfRUuwd10KzdXMc8tpFW/8BnkRB
 4HeDTCgax/W3CPuKaTfS5n8go2bgRAPSFtrer4xmE9FlWmX/LZZtPzC/Jez2CPdj9H
 5kh1QsTxfKRNhIuSLYUGggIwNioUd/ecVgh+aInzhkQwluvfUTcIwBJUfkw6rsCVyw
 MzGKoRpR7joyAEBnq0jj5mfcJYOTeryL6ScLsY4B/FLWvv2G+zYK2fx6rQjA8yM9PF
 DjJT9eyAXyZFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id ABEF6D7831C;
 Mon,  2 Dec 2024 17:35:03 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Subject: [PATCH 00/10] compiler.h: refactor __is_constexpr() into
 is_const{,_true,_false}()
Date: Tue, 03 Dec 2024 02:33:22 +0900
Message-Id: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLvTWcC/x2MQQqAIBAAvxJ7TlCRqL4SEaJb7UVlNyII/550H
 IaZFwSZUGDuXmC8SSinBqbvIJw+HagoNgarrTPGTopkCznJhU9hxbj7cGVWZnKD9hFjcCO0tjR
 Dz/9d1lo/1Xd5X2cAAAA=
X-Change-ID: 20241129-is_constexpr-refactor-19460adedc48
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 David Laight <David.Laight@aculab.com>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
Cc: linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2878;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=H6X4HxSuzHzBru4loE1fIv7uvjl0ePjrXaJ1JNnadsE=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+749yHXE+efV7rnOkcu+WY3bx8n7fTmrbr7jmluH9X
 F7W1cW8o5SFQYyLQVZMkWVZOSe3Qkehd9ihv5Ywc1iZQIYwcHEKwER4zRkZer+7/w40uWUXt65D
 Rr+mWXn16tUHF2i6i7bLMZjcEecUZmQ4/WjnTadfPbbmk36KXW7f62Rq1pXeP+uB7A/2w3svHNv
 MBgA=
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
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
Reply-To: mailhol.vincent@wanadoo.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is the spiritual successor of [1] which introduced
const_true(). In [1], following a comment from David Laight, Linus
came with a suggestion to simplify __is_constexpr() and its derived
macros using a _Generic() selection. Because of the total change of
scope, I am starting a new series.

The goal is to introduce a set of three macros:

  - is_const(): a one to one replacement of __is_constexpr() in term
    of features but written in a less hacky way thanks to _Generic().

  - is_const_true(): tells whether or not the argument is a true
    integer constant expression.

  - is_const_false(): tells whether or not the argument is a false
    integer constant expression.

Once defined, apply them tree-wide.

All those three macros will rely on a single building block:
__is_const_zero().

Patch 1 adds statically_false(). This is just done so that at the end
of this series, the full set of statically_true/false() and
is_const_true/false() is present.

Patch 2 adds __is_const_zero() and is_const().

Patch 3 adds is_const_true() and is_const_false().

Patch 4 to 9 do a tree-wide replacement to remove all the usages of
__is_constexpr() and replace them by is_const_true() or
is_const_false() whenever feasible, or by is_const() otherwise.

Patch 10 finally remove __is_constexpr(). RIP!

[1] add const_true() to simplify GENMASK_INPUT_CHECK()
Link: https://lore.kernel.org/all/20241113172939.747686-4-mailhol.vincent@wanadoo.fr/

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Vincent Mailhol (10):
      compiler.h: add statically_false()
      compiler.h: add is_const() as a replacement of __is_constexpr()
      compiler.h: add is_const_true() and is_const_false()
      linux/bits.h: simplify GENMASK_INPUT_CHECK() by using is_const_true()
      minmax: simplify __clamp_once() by using is_const_false()
      fortify: replace __is_constexpr() by is_const() in strlen()
      overflow: replace __is_constexpr() by is_const()
      drm/i915/reg: replace __is_const_expr() by is_const_true() or is_const()
      coresight: etm4x: replace __is_const_expr() by is_const()
      compiler.h: remove __is_constexpr()

 drivers/gpu/drm/i915/i915_reg_defs.h          |  47 +++++------
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
 include/linux/bits.h                          |   5 +-
 include/linux/compiler.h                      | 112 +++++++++++++++-----------
 include/linux/fortify-string.h                |   4 +-
 include/linux/minmax.h                        |   3 +-
 include/linux/overflow.h                      |   8 +-
 7 files changed, 97 insertions(+), 84 deletions(-)
---
base-commit: e70140ba0d2b1a30467d4af6bcfe761327b9ec95
change-id: 20241129-is_constexpr-refactor-19460adedc48

Best regards,
-- 
Vincent Mailhol <mailhol.vincent@wanadoo.fr>


