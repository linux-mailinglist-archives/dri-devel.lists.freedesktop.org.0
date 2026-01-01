Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A4CED1AC
	for <lists+dri-devel@lfdr.de>; Thu, 01 Jan 2026 16:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E0A10E0BD;
	Thu,  1 Jan 2026 15:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZA3AeiB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EBC10E0BD
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 15:21:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B503E60008;
 Thu,  1 Jan 2026 15:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C0DC4CEF7;
 Thu,  1 Jan 2026 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767280918;
 bh=7OKFoakQwoSUcjDmuB9YNPtcMJGrA0v9+mss0z2KfPg=;
 h=From:Subject:Date:To:Cc:From;
 b=ZA3AeiB3oDKH7ijOmAQn0/5xJF9Ae36dWWUyG39JXYoU3fT9rdSyQyy9zAtyGb2p/
 lvM0mGPDpiqzbtBttl0rZD4qsY2l3wcvkqVc9W3sThKxEXe0wadW8DS6jGAd4mRKVF
 UNTtYVFzEUExGyNLG5T5XIDYDaUE+msT6HXMbWvmvAOGIU9Fq96j9gcpXQCXo7Fcvc
 1U3XEUM/gFtkS39Tscu+784VyCXTtDR1fRVq8ISnASw4uR/ZpFO2fG25zBRvEstTA+
 JYYoYThdMzZQNyJBmYJ5Fht7Rbb1KgtFB8mz8ps5LY9eAKf6d8OaKNpBI2oi+tO0va
 jLEVAeKKeC7Tg==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH v4 0/2] kbuild: remove gcc's -Wtype-limits
Date: Thu, 01 Jan 2026 16:21:38 +0100
Message-Id: <20260101-remove_wtype-limits-v4-0-225b75c29086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKRVmkC/23OwY7CIBAG4FdpOC8GhgLWk+9hzKbFqZK1RYfKa
 kzfXWwvbrbHfzL/N/NkEcljZJviyQiTjz70OZRfBXOnuj8i94ecGQjQEoTmhF1I+P07PC7Iz77
 zQ+TOWmxKcxCVA5abF8LW3yd1t58z4fWW8WEesqaOyF3ocn1TJLOSFSen2Hv55OMQ6DF9lOS0P
 R+X68XjSXLBrdKltFoZu7bbH6Qez6tAxwlM8IlUywhkBLCCRrXaGKf/IeoDAbGMqDdSNtKKurV
 C4B9kHMcXbwxnzG4BAAA=
X-Change-ID: 20251205-remove_wtype-limits-c77eb46d09c2
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=7OKFoakQwoSUcjDmuB9YNPtcMJGrA0v9+mss0z2KfPg=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJlhE9mmyKwpf/vJr/PP60ULwv9r3FiyJyz7Trnu46JC3
 1V6AWt2d0xkYRDjYrAUU2RZVs7JrdBR6B126K8lzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKgDZDJwcQrAVG/WYmT4KsT2QHznpcq3JSve77QWY11XrWhkltHqbrlJmc+k/akewx/ePK6y7d1
 v4x58n7TVOLl0+xrL2K9Osgp7Njy5+Nj+8SN2AA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

I often read on the mailing list people saying "who cares about W=2
builds anyway?". At least I do. Not that I want to fix all of them,
but on some occasions, such as new driver submissions, I have often
found a couple valid diagnostics in the W=2 output.

That said, the annoying thing is that W=2 is heavily polluted by one
warning: -Wtype-limits. Try a gcc W=2 build on any file and see the
results for yourself. I suspect this to be the reason why so few
people are using W=2.

This series removes gcc's -Wtype-limits in an attempt to make W=2 more
useful. Those who do not use W=2 can continue to not use it if they
want. Those who, like me, use it for time to time will get an improved
experience from the reduced spam.

Patch #1 deactivates -Wtype-limits. Extra details on statistics, past
attempts and alternatives are given in the description.

Patch #2 clean-ups the local Kbuild -Wno-type-limits exceptions.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Changes in v4:

  - Remove patch #3.
  - Aside from minor changes in the patch descriptions, this is
    basially a revert to v1.

Link to v3: https://lore.kernel.org/r/20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org

Changes in v3:

  - Remove patch #4.

Link to v2: https://lore.kernel.org/r/20251219-remove_wtype-limits-v2-0-2e92b3f566c5@kernel.org

Changes in v2:

  - Add two more patches to clean up some -Wtype-limits workarounds
  - Collect the Reviewed-by tags.

Link to v1: https://lore.kernel.org/r/20251218-remove_wtype-limits-v1-0-735417536787@kernel.org

---
Vincent Mailhol (2):
      kbuild: remove gcc's -Wtype-limits
      kbuild: cleanup local -Wno-type-limits exceptions

 drivers/gpu/drm/Makefile | 1 -
 fs/btrfs/Makefile        | 1 -
 scripts/Makefile.warn    | 4 +++-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 82791741762a870f5f2ede9f909301770f66f867
change-id: 20251205-remove_wtype-limits-c77eb46d09c2

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>

