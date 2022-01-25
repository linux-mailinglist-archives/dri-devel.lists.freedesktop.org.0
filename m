Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E29C49BAD7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 19:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A60E10E3DD;
	Tue, 25 Jan 2022 18:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E8510E3DD;
 Tue, 25 Jan 2022 18:00:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15BC96146E;
 Tue, 25 Jan 2022 18:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794B6C340E0;
 Tue, 25 Jan 2022 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643133640;
 bh=thPgkn5bU/soMVjidYH0tOpgluG55pEiEr9+5W6b6MA=;
 h=Date:From:To:Cc:Subject:From;
 b=kMOAaP29cN/sKal92kvYcKRpaaVQR4woLTyXvu0H3WnJAXlvnTeku2Y+Qo3SwWvId
 XooGFP6FJhJV+hIQCAjglcY3x5ZCYD310nmZ/mdKPp4PEtQYUWZ57dLc02OR/s2HS7
 7xKD1CgJd1vYll6gbSdTm5TE9WSsjP728fiamu4EkJnB+Vnx0qFnVHVhHnDsf+TqvV
 cJ/+rlEBk4qB6WGRIHUwOzL7PYHyaXajCEbhww6UQFdrrOmQlqS89B5Kk9P7e4N8Fe
 DPVQUOyC2HwNoFwO2lKld9FQNmwLirB0m77loI20BSsMdiQyN3RiKibz0c0l5F/uAt
 XtFWAtYAzqKZg==
Date: Tue, 25 Jan 2022 12:07:26 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/i915/guc: Use struct_size() helper in kmalloc()
Message-ID: <20220125180726.GA68646@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make use of the struct_size() helper instead of an open-coded version,
in order to avoid any potential type mistakes or integer overflows that,
in the worst scenario, could lead to heap overflows.

Also, address the following sparse warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:792:23: warning: using sizeof on a flexible structure

Link: https://github.com/KSPP/linux/issues/174
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index aa6dd6415202..e352a1aad228 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -789,7 +789,7 @@ static struct ct_incoming_msg *ct_alloc_msg(u32 num_dwords)
 {
 	struct ct_incoming_msg *msg;
 
-	msg = kmalloc(sizeof(*msg) + sizeof(u32) * num_dwords, GFP_ATOMIC);
+	msg = kmalloc(struct_size(msg, msg, num_dwords), GFP_ATOMIC);
 	if (msg)
 		msg->size = num_dwords;
 	return msg;
-- 
2.27.0

