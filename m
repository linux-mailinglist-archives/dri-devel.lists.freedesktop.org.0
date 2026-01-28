Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPmkK8VGemk+5AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:26:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E6EA6DBB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D084910E744;
	Wed, 28 Jan 2026 17:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hm+EoL4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52ED10E742
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 17:26:11 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01D272E20;
 Wed, 28 Jan 2026 18:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1769621133;
 bh=+oUF2qRpuz+LzSyFszlYyMlSIQmD/HVVsSraJ65kr0Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Hm+EoL4Pu24+tyTfy8xruslPx1Ri+WPQ/JOTOC56dyeG+qxz0XVCD969IfZpxOKcN
 IiwZCYrzOagZU+P7FLtm/4iR7fIWtQFsWfhuDAzGci6YjU2LAbeRJ5m8xrw775ejG9
 SIys+F2t2oDjEvVUqtp1dNw9CkvD6UyZ6RlfVszM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:36 +0200
Subject: [PATCH v8 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-11-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
In-Reply-To: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+oUF2qRpuz+LzSyFszlYyMlSIQmD/HVVsSraJ65kr0Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekam+SKdKnF77nq/1RJT5BJN1fQbu9mCPItnz
 y9VstkS/O+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGpgAKCRD6PaqMvJYe
 9ZThEACXjLutPrz62N/7Y0jOBsEefTawu+HuIBAaLb4zIHL0x1c5NjqnwtgVXw8f3I2WW9JxmIk
 tiJf/ujq9uxPgFTeDnXjfQ/GPykYhvOU6ctujeoOoCW+BwV47CISO4Ca2T+OurlkgTAKo0zeo4D
 hSQE0apJEAKq4a+IMi/rMfM5GDcsuGXwQSyOzeFZVaCI4bSGPF4YGfMwjczcyH2zR/8QPJm9a4E
 mUm1FNLCK6y+dlxAKZFCUvIA3xKRFhN8Tfb33zSvn+U42aZVzYepUn/9wKRHrxWtYkbfjCd8bcy
 4Z/uQPMCKKYGYMP8DrowR7I+5s8RZiU/ez6YFF45qhwZoRZnBChuBYaLNFxGiS5iTGqO6kS4lDO
 63im0tIxf9S/F59By95FI8Sz9KkaSv9YKFo6Shnk2DhizU6k0nfnbGL114ezv4gOvqSuqviPThZ
 VH7nFBx9SvkgGd53W+wGSsBVyfeAXU20sXhy4m0VzXFgkj74V7AhRmrqYuhP+IZEbx40+RKeMF6
 WlIqnCE8DWtYW2hdaxqNp/MYOIdSgDMq1C4lxVFyF8fyVTKoJy/bwQS2yemmyNIFRCZijE8lfw7
 3W8Nhdosj3OvkzkCdc5wKc9LuvStx1Pw1U5ckWlZ8BnzhE6ezYmdGTUnn4m9Hq4mPiC5xQDXo13
 HgVYJ0Jeq1hSLsg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vishal.sagar@amd.com,m:anatoliy.klymenko@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:laurent.pinchart@ideasonboard.com,m:michal.simek@amd.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:geert@linux-m68k.org,m:dmitry.baryshkov@oss.qualcomm.com,m:ppaalanen@gmail.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.infradead.org,linux-m68k.org,oss.qualcomm.com,gmail.com,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 85E6EA6DBB
X-Rspamd-Action: no action

Add support for XVUY2101010 format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 98105d1c4456..a00a57c6dcca 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -322,6 +322,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XVUY2101010,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0

