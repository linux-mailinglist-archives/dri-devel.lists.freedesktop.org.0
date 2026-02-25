Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB9LH581n2m5ZQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:47:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0D19BBFF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4DA10E825;
	Wed, 25 Feb 2026 17:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="scycDjy7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49CB10E7DC;
 Wed, 25 Feb 2026 17:47:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 406C460053;
 Wed, 25 Feb 2026 17:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF03EC116D0;
 Wed, 25 Feb 2026 17:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772041625;
 bh=3kES5koMMsOOveBPxWed4CGDwckWaezMzM1U4NZbmGc=;
 h=From:To:Cc:Subject:Date:From;
 b=scycDjy7y+yijVjgfP2u1s+aM+ah3eO9RgVaAl8dHbvWYfIhFLa633aymmFbaerfe
 SpTqZJ5weJxA0JckNxAubDr1K4VeO3bs2E5R3L66cB6pj5lU/4AUXIsBmEuOGN9PcB
 MiI8V++NVHtBoKbmqr9uHAi1BZoVKuo3Z3rc4zuGLexZGCZ0JnVY5LSdboWv/rfD/N
 BHSAOnxgFO+9sGKntB12oalkhdcA+1v0CknhyGA3MSWbNcmYJVa1TPo6bTKlXghWbk
 N/k2rBIqdMHhopoxMAlZNvXzJKisfY+wEmIFEBDM8LoufMsEWwUWy+xyudTXibn0tW
 MVJbLwuHziBKQ==
From: Kees Cook <kees@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Kees Cook <kees@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2] drm/amd/ras: Fix type size of remainder argument
Date: Wed, 25 Feb 2026 09:47:03 -0800
Message-Id: <20260225174702.it.918-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3415; i=kees@kernel.org;
 h=from:subject:message-id; bh=3kES5koMMsOOveBPxWed4CGDwckWaezMzM1U4NZbmGc=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDJnzTafpqa/NSVmixSh3xmHKu4kvwiSEHt3Ps2hSu/jy+
 aGcz9f3dJSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAExE5TgjwwHlB3Fqax5HzHL4
 X713OtuOyqXVZw7IXj8y6823fPOXsw8wMnS89n3xUah/l1rPHc+CF08NWe7dMlCNZrILN1gh8GH
 den4A
X-Developer-Key: i=kees@kernel.org; a=openpgp;
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email,amd.com:email]
X-Rspamd-Queue-Id: BBB0D19BBFF
X-Rspamd-Action: no action

Forcing an int to be dereferenced at uint64_t for div64_u64_rem() runs
the risk of endian confusion and stack overflowing writes. Seen while
preparing to enable -Warray-bounds globally:

In file included from ../arch/x86/include/asm/processor.h:35,
                 from ../include/linux/sched.h:13,
                 from ../include/linux/ratelimit.h:6,
                 from ../include/linux/dev_printk.h:16,
                 from ../drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/ras_sys.h:29,
                 from ../drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras.h:27,
                 from ../drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:24:
In function 'div64_u64_rem',
    inlined from 'ras_core_convert_timestamp_to_time' at ../drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:72:9:
../include/linux/math64.h:56:20: error: array subscript 'u64 {aka long long unsigned int}[0]' is partly outside array bounds of 'int[1]' [-Werror=array-bounds=]
   56 |         *remainder = dividend % divisor;
      |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c: In function 'ras_core_convert_timestamp_to_time':
../drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:70:19: note: object 'remaining_seconds' of size 4
   70 |         int days, remaining_seconds;
      |                   ^~~~~~~~~~~~~~~~~

Use a 64-bit type for the remainder calculation, but leave
remaining_seconds as 32-bit to avoid 64-bit division later. The value of
remainder will always be less than seconds_per_day, so there's no
truncation risk.

Fixes: ace232eff50e ("drm/amdgpu: Add ras module files into amdgpu")
Signed-off-by: Kees Cook <kees@kernel.org>
---
 v2: use temp u64 to avoid 64-bit division later
 v1: https://lore.kernel.org/lkml/20260225024716.work.043-kees@kernel.org/
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Tao Zhou <tao.zhou1@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: <amd-gfx@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>
---
 drivers/gpu/drm/amd/ras/rascore/ras_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_core.c b/drivers/gpu/drm/amd/ras/rascore/ras_core.c
index 01122b55c98a..02bbee64a5bd 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_core.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_core.c
@@ -62,14 +62,16 @@ int ras_core_convert_timestamp_to_time(struct ras_core_context *ras_core,
 			uint64_t timestamp, struct ras_time *tm)
 {
 	int days_in_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
-	uint64_t month = 0, day = 0, hour = 0, minute = 0, second = 0;
+	uint64_t month = 0, day = 0, hour = 0, minute = 0, second = 0, remainder;
 	uint32_t year = 0;
 	int seconds_per_day = 24 * 60 * 60;
 	int seconds_per_hour = 60 * 60;
 	int seconds_per_minute = 60;
 	int days, remaining_seconds;
 
-	days = div64_u64_rem(timestamp, seconds_per_day, (uint64_t *)&remaining_seconds);
+	days = div64_u64_rem(timestamp, seconds_per_day, &remainder);
+	/* remainder will always be less than seconds_per_day. */
+	remaining_seconds = remainder;
 
 	/* utc_timestamp follows the Unix epoch */
 	year = 1970;
-- 
2.34.1

