Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHSqIb5Tnmm3UgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 02:43:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9A218F9E8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 02:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3BD10E65F;
	Wed, 25 Feb 2026 01:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cKnvqUVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8AB10E65F;
 Wed, 25 Feb 2026 01:43:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 74342401C5;
 Wed, 25 Feb 2026 01:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52367C116D0;
 Wed, 25 Feb 2026 01:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771983800;
 bh=Nmr6hflCYeyKGPgmpGenCkgbLWBwwqrgtfuM+FOG3fI=;
 h=From:To:Cc:Subject:Date:From;
 b=cKnvqUVvZjDtRn0DayjLzm2J0/zqcDaAsqWDZ8h5x4Vngb4krVV6yaviGoXRTlna9
 TD/jtt8sth6ZGen9JzyyK6RgJBtSdUyDealhnIYaMbDZAbc7iFUAIowhaLaLF73/te
 2ZmvDHgGL23VIYlsKYelqe1QhpJyQmVvFDe7nRs7ahYQfXufegrqtOLkUjlUYtd+aR
 f1aVplMebQ+0f7n5w03FjzatYhnAW1OBEU0m2cB+TT2rCy9M7CiRLMgrRAFTkwml7x
 aBPfG7CMrKsic5pLJY4W0QRa/e5cDqBpdpVJp53X0mhUFEvzSkFAUikl2EYXRx+wRd
 9dTdZyyBKo4gQ==
From: Kees Cook <kees@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Kees Cook <kees@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH] drm/amd/ras: Fix type size of remainder argument
Date: Tue, 24 Feb 2026 17:43:18 -0800
Message-Id: <20260225014317.work.103-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964; i=kees@kernel.org;
 h=from:subject:message-id; bh=Nmr6hflCYeyKGPgmpGenCkgbLWBwwqrgtfuM+FOG3fI=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDJnzgrcd3bAyo+Dvikj7po8tFmvXMTJylO95fl5W4GxoF
 otRRVBcRykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwETqEhn+WZjvXCzxb7rY0gj5
 ME4TpQnKrNFVq3bMneWqcfvOvQfayxkZdvis3JFa+WVm/+tfB46Y6K4Qzl98n938yr87c46KRta
 oMgMA
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,amd.com:email]
X-Rspamd-Queue-Id: 3A9A218F9E8
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

Switch remaining_seconds to uint64_t to avoid the problems.

Fixes: ace232eff50e ("drm/amdgpu: Add ras module files into amdgpu")
Signed-off-by: Kees Cook <kees@kernel.org>
---
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
 drivers/gpu/drm/amd/ras/rascore/ras_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_core.c b/drivers/gpu/drm/amd/ras/rascore/ras_core.c
index 01122b55c98a..91e16b0b98f9 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_core.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_core.c
@@ -63,13 +63,14 @@ int ras_core_convert_timestamp_to_time(struct ras_core_context *ras_core,
 {
 	int days_in_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
 	uint64_t month = 0, day = 0, hour = 0, minute = 0, second = 0;
+	uint64_t remaining_seconds;
 	uint32_t year = 0;
 	int seconds_per_day = 24 * 60 * 60;
 	int seconds_per_hour = 60 * 60;
 	int seconds_per_minute = 60;
-	int days, remaining_seconds;
+	int days;
 
-	days = div64_u64_rem(timestamp, seconds_per_day, (uint64_t *)&remaining_seconds);
+	days = div64_u64_rem(timestamp, seconds_per_day, &remaining_seconds);
 
 	/* utc_timestamp follows the Unix epoch */
 	year = 1970;
-- 
2.34.1

