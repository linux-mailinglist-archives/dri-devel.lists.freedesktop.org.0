Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A539C14B0D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F7910E3C1;
	Tue, 28 Oct 2025 12:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h35QI2uU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719AD10E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:48:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5579B4824A;
 Tue, 28 Oct 2025 12:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AED9C116B1;
 Tue, 28 Oct 2025 12:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761655713;
 bh=avd0F83+zxE6J+9blLWXYv/bBGe3sqPsSFHEyIZLGhw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h35QI2uUmLOP27G6T1p/yAwMZnwUULhJSlVovt9ZWrgd/A1Ku3Vh4a8ab1TxB5+wm
 F5byYxJnmzeZTFHB8+ZEMsV27XLLk6lFk6kh7UkFyE7vCyLTNwUc+fEuqZ8HYHULXg
 zmSN39C8D3QYgyqn73/bZzzt8/JI/ikskDfRtm6YybNY2uhk0HHh0LlAQN2n7XcV1n
 Fx9ERua4edF57oexcU2y8HWImQlWTqDBQrGiGgEdmoD7HqrMugo/5drk4ZhJ7A7Izd
 KtaO7ONjQBPAuh0Zbce42rMSegZLuy/Iz//nGIYlBHvpJm1cFdzetXw/77bcDjxNgf
 yv/sX6xz6BOjg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17-6.12] drm/panic: Fix divide by 0 if the screen
 width < font width
Date: Tue, 28 Oct 2025 08:48:09 -0400
Message-ID: <20251028124815.1058740-9-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028124815.1058740-1-sashal@kernel.org>
References: <20251028124815.1058740-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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

From: Jocelyn Falempe <jfalempe@redhat.com>

[ Upstream commit 2e337dd278c6c38982b520c309f36e0f88696e6e ]

In the unlikely case that the screen is tiny, and smaller than the
font width, it leads to a divide by 0:

draw_line_with_wrap()
chars_per_row = sb->width / font->width = 0
line_wrap.len = line->len % chars_per_row;

This will trigger a divide by 0

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://lore.kernel.org/r/20251009122955.562888-6-jfalempe@redhat.com
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive analysis of the Linux kernel repository using
multiple tools, here is my assessment:

## **Backport Status: YES**

### Analysis Summary

I used the following tools and methods to analyze this commit:
1. **git log/show**: To examine commit history, dates, and affected
   versions
2. **Read tool**: To examine the actual code and understand the bug
   context
3. **Grep tool**: To trace function calls and usage patterns
4. **git tag analysis**: To determine version impact (v6.11 through
   v6.17 affected)

### Detailed Findings

#### 1. **Bug Severity - HIGH PRIORITY**
- **Type**: Divide-by-zero crash in kernel panic handler
- **Location**: `drivers/gpu/drm/drm_panic.c:479` and `484`
- **Call chain discovered**:
  - `drm_panic()` (panic callback) →
  - `draw_panic_plane()` →
  - `draw_panic_dispatch()` →
  - `draw_panic_static_kmsg()` →
  - `draw_line_with_wrap()` (where crash occurs at lines 479 and 484)

**Critical Impact**: When a kernel panic occurs, the system attempts to
display panic information on screen. If `sb->width < font->width`, then
`chars_per_row = sb->width / font->width = 0`, leading to `line_wrap.len
= line->len % 0` which triggers a divide-by-zero exception **during
panic handling**. This prevents users from seeing any panic information.

#### 2. **Scope Analysis - SMALL AND CONTAINED**
- **Files changed**: 1 file (`drivers/gpu/drm/drm_panic.c`)
- **Lines changed**: 1 line (adding condition `|| font->width >
  sb->width`)
- **Change type**: Defensive check only, no behavioral changes to normal
  path
- **Fix location**: Line 523, adding early return condition

#### 3. **Version Impact - SIGNIFICANT RANGE**
- **Introduced in**: v6.11 (commit `54034bebb22fd`, June 2024 -
  "drm/panic: Add a kmsg panic screen")
- **Affected versions**: v6.11, v6.12, v6.13, v6.14, v6.15, v6.16, v6.17
- **Fixed in**: v6.18-rc3 (October 2025)
- **Backport target**: All stable trees from v6.11 onwards

#### 4. **Risk Assessment - MINIMAL**
- **Risk of regression**: Very low - only adds a safety check
- **Side effects**: None - function returns early if condition met
- **Testing**: The fix prevents a crash path; no valid use case affected
- **Font width range**: 4-16 pixels (from my analysis of `lib/fonts/`)
- **Trigger condition**: Screen width < 4 pixels (extremely rare but
  possible with embedded/weird displays)

#### 5. **Subsystem Context - MATURING FEATURE**
My analysis revealed:
- **drm/panic introduced**: v6.10 (April 2024) - relatively new
  subsystem
- **Bug count**: Found 23 "drm/panic: Fix" commits since June 2024
- **Pattern**: This is part of ongoing stabilization of a new feature
- **Similar fixes**: Multiple other drawing/bounds checking fixes in
  same timeframe

#### 6. **Stable Tree Compliance - MEETS ALL CRITERIA**
✅ **Fixes a real bug**: Divide-by-zero crash
✅ **Small change**: 1-line modification
✅ **Low regression risk**: Only adds defensive check
✅ **No new features**: Pure bug fix
✅ **No architectural changes**: Localized to one function
✅ **Already reviewed**: Has Reviewed-by tag from Javier Martinez
Canillas
❌ **Missing stable tag**: No "Cc: stable@vger.kernel.org" (but this
doesn't disqualify it)

### Code-Specific Analysis

**Original vulnerable code** (line 479):
```c
int chars_per_row = sb->width / font->width;  // Can be 0!
```

**Crash trigger** (line 484):
```c
line_wrap.len = line->len % chars_per_row;  // Divide by 0 if
chars_per_row == 0
```

**Fix applied** (line 523):
```c
- if (!font)
+       if (!font || font->width > sb->width)
                return;
```

This simple check prevents entering the drawing code path when the
screen is too narrow, avoiding the divide-by-zero entirely.

### Recommendation Rationale

Despite the "unlikely" scenario mentioned in the commit message, this
should be backported because:

1. **Critical code path**: Occurs during panic handling when system
   stability is already compromised
2. **Clean fix**: Minimal, obvious, and safe change
3. **Subsystem maturity**: drm/panic is new and actively being
   stabilized with multiple fixes
4. **No downsides**: Zero risk of breaking working configurations
5. **Completeness**: Part of a series of drawing boundary fixes that
   should all be backported together

The commit follows the stable kernel rule: "It must fix a real bug that
bothers people" - while rare, a crash during panic display is a serious
issue that prevents debugging.

### Similar Commits for Reference
Other drm/panic fixes from same timeframe that should also be
considered:
- `a119caf6af5ed`: "Fix 24bit pixel crossing page boundaries"
- `16ded1e690422`: "Fix drawing the logo on a small narrow screen"
- `e9b36fe063004`: "Fix kmsg text drawing rectangle"

**CONCLUSION**: This commit should be backported to all stable trees
containing the drm/panic kmsg screen feature (v6.11+).

 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index ea6a64e5ddd76..4c994656ea1ab 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -520,7 +520,7 @@ static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
 	struct drm_panic_line line;
 	int yoffset;
 
-	if (!font)
+	if (!font || font->width > sb->width)
 		return;
 
 	yoffset = sb->height - font->height - (sb->height % font->height) / 2;
-- 
2.51.0

