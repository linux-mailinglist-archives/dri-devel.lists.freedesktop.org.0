Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKxvBruRqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:35:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D6C21D28A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28D810E3BC;
	Fri,  6 Mar 2026 08:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.b="EYXZTqkQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 507 seconds by postgrey-1.36 at gabe;
 Fri, 06 Mar 2026 06:49:43 UTC
Received: from xry111.site (xry111.site [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979EB10E387;
 Fri,  6 Mar 2026 06:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
 s=default; t=1772779270;
 bh=V06FD4fP1WIlRIby4zy56+KfUfGL0hLt7tHMLgURozw=;
 h=From:To:Cc:Subject:Date:From;
 b=EYXZTqkQ5bGe3BLEovkWeLcFXBJylZBTXxIoFlcObKjm2bH8K8Z6bwPOs1PrcxsRm
 nmqmshBlbjNztWfkduw1/73BvZh2sOK+BkZWh2OpVSOK7/v8JHMMJSgiz/TouwRp9H
 KP7vSdjMzEiBFIkgLRk6UQfRbNFbFDzCq4eBNtCg=
Received: from stargazer (unknown [IPv6:2409:8a4c:e11:4510:818c:b334:624:49f8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (Client did not present a certificate)
 (Authenticated sender: xry111@xry111.site)
 by xry111.site (Postfix) with ESMTPSA id 81F801A3F28;
 Fri,  6 Mar 2026 01:41:01 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Alex Hung <alex.hung@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
 Zixing Liu <liushuyu@aosc.io>, Ard Biesheuvel <ardb@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>, LiarOnce <liaronce@hotmail.com>,
 stable@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alvin Lee <alvin.lee2@amd.com>, Dillon Varone <Dillon.Varone@amd.com>,
 Ray Wu <ray.wu@amd.com>, Kees Cook <kees@kernel.org>,
 Yan Li <yan.li@amd.com>, Ryan Seto <ryanseto@amd.com>,
 Saaem Rizvi <SyedSaaem.Rizvi@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Wrap dcn32_override_min_req_memclk() in
 DC_FP_{START, END}
Date: Fri,  6 Mar 2026 14:28:03 +0800
Message-ID: <20260306062805.1464383-2-xry111@xry111.site>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Mar 2026 08:35:02 +0000
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
X-Rspamd-Queue-Id: A2D6C21D28A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[xry111.site : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[xry111.site:s=default];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,aosc.io,kernel.org,xry111.site,hotmail.com,vger.kernel.org,amd.com,igalia.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xry111.site:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[xry111@xry111.site,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US]
X-Rspamd-Action: no action

[Why]
The dcn32_override_min_req_memclk function is in dcn32_fpu.c, which is
compiled with CC_FLAGS_FPU into FP instructions.  So when we call it we
must use DC_FP_{START,END} to save and restore the FP context, and
prepare the FP unit on architectures like LoongArch where the FP unit
isn't always on.

Reported-by: LiarOnce <liaronce@hotmail.com>
Fixes: ee7be8f3de1c ("drm/amd/display: Limit DCN32 8 channel or less parts to DPM1 for FPO")
Cc: stable@vger.kernel.org
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 7ebb7d1193af..c7fd604024d6 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1785,7 +1785,10 @@ static bool dml1_validate(struct dc *dc, struct dc_state *context, enum dc_valid
 
 	dc->res_pool->funcs->calculate_wm_and_dlg(dc, context, pipes, pipe_cnt, vlevel);
 
+	DC_FP_START();
 	dcn32_override_min_req_memclk(dc, context);
+	DC_FP_END();
+
 	dcn32_override_min_req_dcfclk(dc, context);
 
 	BW_VAL_TRACE_END_WATERMARKS();
-- 
2.53.0

