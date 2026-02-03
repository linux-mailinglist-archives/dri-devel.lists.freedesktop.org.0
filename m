Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IDuJ/ANgmkKOwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:02:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8E6DAF94
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ACA10E203;
	Tue,  3 Feb 2026 14:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NemeBfBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0BF10E203;
 Tue,  3 Feb 2026 14:50:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8023560132;
 Tue,  3 Feb 2026 14:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B4DC116D0;
 Tue,  3 Feb 2026 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1770130255;
 bh=Dnu2BD4jD3XDBreBSD7AyscxzS4F6XR4ojpUsYjqxgc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=NemeBfBtXE+ytSkQCIRqTXhoX8JINyCtX8nqQiAkSvbpa8oqyMcH5140lgKDBknMK
 eoM0QVrMOOdfYkMhLriyidoQiG5fy0b+2JLMgbTg0a+UHhJFUAcysNEh69imrtnMg9
 g3p3/uXplYv0oEG0F6Xb5sZVaAHHaQ436vKct1AA=
Subject: Patch "drm/radeon: delete radeon_fence_process in is_signaled,
 no deadlock" has been added to the 6.6-stable tree
To: 1468888505@139.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, patches@lists.linux.dev, rbmccav@gmail.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 03 Feb 2026 15:50:38 +0100
In-Reply-To: <20260202075831.947537-1-1468888505@139.com>
Message-ID: <2026020338-embargo-commuting-7a82@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
X-Spamd-Result: default: False [4.99 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[139.com,amd.com,gmail.com,lists.freedesktop.org,ffwll.ch,linuxfoundation.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[alexander.deucher.amd.com:query timed out,christian.koenig.amd.com:query timed out,1468888505.139.com:query timed out,xinhui.pan.amd.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email,amd.com:email,linux.dev:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,139.com:email,linuxfoundation.org:email,lists.freedesktop.org:email,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 4A8E6DAF94
X-Rspamd-Action: no action


This is a note to let you know that I've just added the patch titled

    drm/radeon: delete radeon_fence_process in is_signaled, no deadlock

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-radeon-delete-radeon_fence_process-in-is_signaled-no-deadlock.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 1468888505@139.com Mon Feb  2 08:58:36 2026
From: Li hongliang <1468888505@139.com>
Date: Mon,  2 Feb 2026 15:58:31 +0800
Subject: drm/radeon: delete radeon_fence_process in is_signaled, no deadlock
To: gregkh@linuxfoundation.org, stable@vger.kernel.org, rbmccav@gmail.com
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <20260202075831.947537-1-1468888505@139.com>

From: Robert McClinton <rbmccav@gmail.com>

[ Upstream commit 9eb00b5f5697bd56baa3222c7a1426fa15bacfb5 ]

Delete the attempt to progress the queue when checking if fence is
signaled. This avoids deadlock.

dma-fence_ops::signaled can be called with the fence lock in unknown
state. For radeon, the fence lock is also the wait queue lock. This can
cause a self deadlock when signaled() tries to make forward progress on
the wait queue. But advancing the queue is unneeded because incorrectly
returning false from signaled() is perfectly acceptable.

Link: https://github.com/brave/brave-browser/issues/49182
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4641
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Robert McClinton <rbmccav@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 527ba26e50ec2ca2be9c7c82f3ad42998a75d0db)
Cc: stable@vger.kernel.org
[ Minor conflict resolved. ]
Signed-off-by: Li hongliang <1468888505@139.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/radeon/radeon_fence.c |    8 --------
 1 file changed, 8 deletions(-)

--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -362,14 +362,6 @@ static bool radeon_fence_is_signaled(str
 		return true;
 	}
 
-	if (down_read_trylock(&rdev->exclusive_lock)) {
-		radeon_fence_process(rdev, ring);
-		up_read(&rdev->exclusive_lock);
-
-		if (atomic64_read(&rdev->fence_drv[ring].last_seq) >= seq) {
-			return true;
-		}
-	}
 	return false;
 }
 


Patches currently in stable-queue which might be from 1468888505@139.com are

queue-6.6/drm-radeon-delete-radeon_fence_process-in-is_signaled-no-deadlock.patch
queue-6.6/ksmbd-fix-race-condition-in-rpc-handle-list-access.patch
queue-6.6/wifi-ath11k-add-srng-lock-for-ath11k_hal_srng_-in-monitor-mode.patch
queue-6.6/drm-amdgpu-replace-mutex-with-spinlock-for-rlcg-register-access-to-avoid-priority-inversion-in-sriov.patch
