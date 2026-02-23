Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGZYETBKnGmODAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 13:38:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B9017633A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 13:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398B310E384;
	Mon, 23 Feb 2026 12:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BSXP/k2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7A310E380;
 Mon, 23 Feb 2026 12:38:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F19A60054;
 Mon, 23 Feb 2026 12:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2758BC4AF0C;
 Mon, 23 Feb 2026 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771850280;
 bh=iHZa8nYe42r2IjJzinLnQVMLFp3VrGSWpay58wvZsmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BSXP/k2sWKkXL0NuDeNI7dhVQSMrgkG2/+kBnm33XygN2m5TrOGFCFkXc+TBLrfpW
 W8BndV/+jMANV0wfaBuJ9zCjWTuFT66y7z33tOPzC57gVhqCQzBA9CaCmc7o9MG9NB
 SIaWLAbdot1KfZrnjT/fQYf50QX2+wXDdQZfarF22z4gf24Gkh/V1rdqbeX/L4aJ6a
 cCQHDthNLeq5HOGAaBVuqpU/76DlcD8/oCT6rVWjw9KrV7wQaeNexerchKCTY/pz3i
 cWd55/rdVomjGn54VgeqXcSbGlRHwGRbsDuIs6MXoCB7WDrXUPIGJZU904UlwrCdS7
 +H+kBlOjQaWkQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Victor Zhao <Victor.Zhao@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.18] drm/amdgpu: avoid sdma ring reset in sriov
Date: Mon, 23 Feb 2026 07:37:19 -0500
Message-ID: <20260223123738.1532940-14-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223123738.1532940-1-sashal@kernel.org>
References: <20260223123738.1532940-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.3
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: D5B9017633A
X-Rspamd-Action: no action

From: Victor Zhao <Victor.Zhao@amd.com>

[ Upstream commit 5cc7bbd9f1b74d9fe2f7ac08d6ba0477e8d2d65f ]

sdma ring reset is not supported in SRIOV. kfd driver does not check
reset mask, and could queue sdma ring reset during unmap_queues_cpsch.

Avoid the ring reset for sriov.

Signed-off-by: Victor Zhao <Victor.Zhao@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The background task completed but my analysis is already finished. The
result would show the same finding I already verified — that
`amdgpu_sdma_reset_engine` was introduced in the v6.15 cycle.

My final answer remains **YES** — this is a small, correct bug fix for
SR-IOV environments that prevents SDMA scheduler work queues from being
left in a stopped state.

 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 8b8a04138711c..321310ba2c08e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -558,6 +558,9 @@ int amdgpu_sdma_reset_engine(struct amdgpu_device *adev, uint32_t instance_id,
 	struct amdgpu_ring *gfx_ring = &sdma_instance->ring;
 	struct amdgpu_ring *page_ring = &sdma_instance->page;
 
+	if (amdgpu_sriov_vf(adev))
+		return -EOPNOTSUPP;
+
 	mutex_lock(&sdma_instance->engine_reset_mutex);
 
 	if (!caller_handles_kernel_queues) {
-- 
2.51.0

