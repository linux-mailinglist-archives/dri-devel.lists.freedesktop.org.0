Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VPeyLp7orWmb9QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 22:22:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EABC2324CD
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 22:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB9710E039;
	Sun,  8 Mar 2026 21:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="cjBBVeqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 540 seconds by postgrey-1.36 at gabe;
 Sun, 08 Mar 2026 21:22:33 UTC
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AA910E039
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 21:22:33 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1773004401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RpqpYlSXeAg/awnB0CvRWHuxixfrf2T/O/CAPqniJDI=;
 b=cjBBVeqhU4T10lCpRAAeAjU4MCvwUt698hAAsE2RWi1Qx/9Tw0CE0dvcbuicEw1Q4mZD6z
 UorENWb2j7lE2N+avFntgIvEtixr2llBmLzs9WkkY5IJkDJdLwwQSL5N9K9j8qUtR+D8r+
 Sr7ntF2rhgPnKFD1iQ28UW29ErlFzNp6GL1vocdSJR7RUUv/iyaCRj5ZGPuvsb1uf93JOB
 ZRdEbhl5sJeeqrPuhIK5VsQX9N8t/Cwn0521TR7Eo3yxF/hS4VqrOX9gK1KJcbRu3u/rNf
 6eCwLm7iciBqtV0YwVsdCO4zTNByzkNLsiQAWsRfSrX1T+18o2V/n4dDJ44sNQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Mar 2026 14:12:54 -0700
Subject: [PATCH] drm: msm: adreno: attempt to recover from ringbuffer drain
 timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-adreno-ringbuffer-drain-timeout-recovery-v1-1-985a33faf108@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQ6CMBBG4auQWTtJC0lBr2Jc1PYvzsLWTIFoC
 He3Yflt3tupQgWVbt1Oik2qlNxgLx2Fl88zWGIz9aZ3ZjAT+6jIhVXy/FxTgnJUL5kXeaOsCyt
 C2aA/dnaEd9fJDilQy30USb7n6v44jj8C+n3LegAAAA==
X-Change-ID: 20260308-adreno-ringbuffer-drain-timeout-recovery-617ea69813fc
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773004397; l=2696;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=IwQsRi65M4qXQUkCCxcuReQn++piLHkRFWLqIAUpTuE=;
 b=eGLN4VQHSoWAmzLT9wCgcSJt1HexLpTsXFY/zSncDP/EA8z4I5dzj0yYnNm92JPgaE46Hkccy
 VOeuuDdDFAiC5lPjHB0M+Wg6skuqLqSpRRvniitEFDaE+chlBosgLtp
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
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
X-Rspamd-Queue-Id: 0EABC2324CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:alexeymin@minlexx.ru,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:sajattack@postmarketos.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,minlexx.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[sajattack@postmarketos.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

I found a 13-year-old TODO while debugging gpu stalls on sdm6xx/a5xx
and thought I might as well try to implement it. It doesn't fully
resolve all stalls in the driver, but it's a start.

[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: CP | opcode error | possible opcode=0x00000000
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 0380/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 000c/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 0051/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: [drm:recover_worker [msm]] *ERROR* 5.0.9.0: hangcheck recover!
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 000c/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
msm_dpu c901000.display-controller: [drm:recover_worker [msm]] *ERROR* 5.0.9.0: offending task: sway (sway -c /home/user/.config/sxmo/sway)
watchdog: CPU1: Watchdog detected hard LOCKUP on cpu 2

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..77cda368eba1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -742,10 +742,11 @@ bool adreno_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (!spin_until(get_rptr(adreno_gpu, ring) == wptr))
 		return true;
 
-	/* TODO maybe we need to reset GPU here to recover from hang? */
 	DRM_ERROR("%s: timeout waiting to drain ringbuffer %d rptr/wptr = %X/%X\n",
 		gpu->name, ring->id, get_rptr(adreno_gpu, ring), wptr);
 
+	adreno_gpu->funcs->base.recover(gpu);
+
 	return false;
 }
 

---
base-commit: 52584178a10aa82d80aadda690f4bbc76d92ddda
change-id: 20260308-adreno-ringbuffer-drain-timeout-recovery-617ea69813fc

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

