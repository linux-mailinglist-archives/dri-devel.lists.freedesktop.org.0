Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO1xLSXueWmO1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:08:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5799FF5A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1BA10E65D;
	Wed, 28 Jan 2026 11:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="I/E4sM7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E3D10E65B;
 Wed, 28 Jan 2026 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MW6r7grgEdVA0qBsRTH2/xd2jQ+4CyVYT74dG8I0zIU=; b=I/E4sM7HLFrxE0EyEmsC96SorU
 JwQw8VdQidtnB9LwP8zQP+tuuwS0aUcV987utzZFsVFBpKgGDANPJev627ckBd9L8X9Kktqmr1HGF
 BFdhB+ifrKmgcyOOEa8tnjVc/SFJTZ9LRGlrMZsV0l3fjLgcsOFkeWhPsSsTUfD6WYwtJoAFHq1Lh
 OkKNRzkKEuut1LawjXhEBtK5+1ruefyQty5HftyW4QRx7ZYm8TST/xFudHEUsnmXczmCASoly/aOO
 nqsixU4e1MWvEbO3oi8vXs7/+G3zwsyWXo5iS3u8VrwiOpN3fkiOgxPhZx5TgB8nVoMONEAcoc1co
 5Z5THr1A==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vl3P8-00Aqa4-9e; Wed, 28 Jan 2026 12:08:10 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v6 02/31] drm/amdgpu: Remove redundant missing hw ip handling
Date: Wed, 28 Jan 2026 11:07:37 +0000
Message-ID: <20260128110806.38350-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
References: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-]
X-Rspamd-Queue-Id: 8C5799FF5A
X-Rspamd-Action: no action

Now that it is guaranteed there can be no entity if there is no hw ip
block we can remove the open coded protection during CS parsing.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: 55414ad5c983 ("drm/amdgpu: error out on entity with no run queue")
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index d591dce0f3b3..d94e8c06ae30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -84,13 +84,6 @@ static int amdgpu_cs_job_idx(struct amdgpu_cs_parser *p,
 	if (r)
 		return r;
 
-	/*
-	 * Abort if there is no run queue associated with this entity.
-	 * Possibly because of disabled HW IP.
-	 */
-	if (entity->rq == NULL)
-		return -EINVAL;
-
 	/* Check if we can add this IB to some existing job */
 	for (i = 0; i < p->gang_size; ++i)
 		if (p->entities[i] == entity)
-- 
2.52.0

