Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBiGALoXnmm2TQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A361218CC18
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB98010E62D;
	Tue, 24 Feb 2026 21:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kI1afoHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D0010E623;
 Tue, 24 Feb 2026 21:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc4lRoj+/dAIaWYNpm4G61/8ap+fpk8I6U+dLzQlyoiDGBswCijZBMza8ooyEZ41iDZJhG+MObnwMMfB7CQ0BvJVZ5abc1Sa5DWThiikSzNvLK1muYt5WvDs+CHadPcqUfyb8IO4K2RkH9rHoRiZJfBZnaM1If4YQc7gDEsuYJ4yPMinYgLtTaa8uZaCh5aa5cHDfn/TUSF8ec4mVqP04/npz5igu48hxmW/jkTAv0yC6oZP0mqiSFk8yzfGnl1VaKErs+4einBUhXtEQy8uk2wDqCLM0Tsykh8mnNN6ayguWIUaivkIma03cxM+5KfzruRb/rUF02kDfafM0X5/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4naHnIdDIV0GsSFR7/0RICHsr/Q4AUz/ZMTxtLUG1mI=;
 b=yOIQewh+Tk5ASTe0PcKaUNnzyJUysDV0XbvMyWEo36f10OskU/JdERQ6e87dDgBApcNzGyHuRlGVAx3b/8cIjOk16UVJJRHvCRSCPgGG8p0bhD3P6/CUB0ZAV5MnIWWs0rtL38rAB0cJCuejwUqx1VeFVUSD9UGwUnEXrxfRwJGHqMsGLjYG1vE/GxBlISd/koDFS3BzOHy4/5Z7NC+Q4FOKW9UEbunpipdX5hV6weJZBk5TJ2YWbx5+PL2q+E3hakmsJejQHak/fG0bej9UmeHvatvdqpRVQDv5d6zohSl9XWzpNdu59g6TawPB0be63HzpGctp8lXzYLNpT94fXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4naHnIdDIV0GsSFR7/0RICHsr/Q4AUz/ZMTxtLUG1mI=;
 b=kI1afoHqlLXno/qKqyTqHpV0aU7+xOBZcs48n3r5U6L5/Ie71+E2gEIKblTf7eBhQcwAPOQxORAT1dGQnSnA1HXKL2VyN/vKaIGQwpEK11EXa84/pUrVVP6X/TodvgPWOx21bQqtTjxqS/atsAV4tx9Aqnkk7hc+S7dvkgWyt9o=
Received: from SN1PR12CA0045.namprd12.prod.outlook.com (2603:10b6:802:20::16)
 by DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 21:27:06 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::9f) by SN1PR12CA0045.outlook.office365.com
 (2603:10b6:802:20::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 21:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 21:27:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 15:27:01 -0600
Received: from thonkpad (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Tue, 24 Feb 2026 15:27:00 -0600
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <superm1@kernel.org>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 5/5] drm/vblank: Add some debugging trace events
Date: Tue, 24 Feb 2026 16:26:39 -0500
Message-ID: <20260224212639.390768-6-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224212639.390768-1-sunpeng.li@amd.com>
References: <20260224212639.390768-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DM6PR12MB4265:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e10c3f-67dd-4978-5797-08de73eb75e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hm+9vBsext8ZDW6U2eX8xibGUHHT105oPXQEcandUSHD7/nw0VTlk13VKnqa?=
 =?us-ascii?Q?O9Pq3G1dpPiPlzfZtR15OGwRU/OqtpAJw1EajI2o9ebmh5+JyaEOq5uaTv+z?=
 =?us-ascii?Q?wKFsNUosBOFdhQ4U+ehMw7KDXfjLmuiLoLZRuOJLI2xEMLXC9e4dOPTOHaEu?=
 =?us-ascii?Q?aI3kiGOqzRDVlXRP60A/z5TFErzU/rnm8MxKcECTjo1McFfwqyseOcDOSzOv?=
 =?us-ascii?Q?ajwKpzryrx40ldf97hhHy9+1CT+eK6Y7wQi99u8e4x//NVDj2NpXPH3Jbn3k?=
 =?us-ascii?Q?yb1CRUwXH6MA3jR/8ZYdLW09Gy3AZTx8pQnsib7qaJG5v0Dl47XeqZ0ASP4O?=
 =?us-ascii?Q?kgZhhP42zvEvF5t62MggvUYgbliwnFWKMnsTiYIqPlbtN1EcpzwOdpx3UzV1?=
 =?us-ascii?Q?L9iUp9aFtIFDtiiLfkkvtlFvS/7+eBGQqRQJz2pKiK0VOE8I0hzhmvzm+8PL?=
 =?us-ascii?Q?D06gcesRPwCdIm2wLPHBB4knc1Etxl4wc1vPerdiL2vRNh7raG4V1j1kE2lx?=
 =?us-ascii?Q?ONquXIWKuwUE3KNcDmUXdm67Cglc2DBZarCzQkSDVOuIWUr861YBX9GqdyNP?=
 =?us-ascii?Q?JkkiseNyP/L0tV29TPnpUE0KnEv7cdnK3QJk6EQJ9bW1ixLcowv6veh7nu/Z?=
 =?us-ascii?Q?jNhVJQwCYxFTKL3qc6uYCtmQ/qyRSr7G47wXolZESmzaMAi7weav8MSaU9g3?=
 =?us-ascii?Q?RmpvDOMY95QbyEDJ/6GrZS/Xli7pkt2JYIyn7NSvuXJy17OhyGmoymAN+EEF?=
 =?us-ascii?Q?DoAa+dlnZtB7m4smF4d4i5peygXrHqHiWHpu0CnNpt5jRZW+hFiW//PqdyXW?=
 =?us-ascii?Q?XMNMSSUehBW0oyaHOCec+a/oeGdND+TTANox2YhM1lDI3TDRWFZMtxeYLKdc?=
 =?us-ascii?Q?+13/UYueEGlkNS/BGllRg8Tc7ipbsoVmX1IL3SpmXT3QGQlX+CWEKIGo3iPZ?=
 =?us-ascii?Q?DBBfyuDa3JCvOcctn+2w33lvJZQq3chATnuewC/IaxAAte2N2j6r7pyyVnuS?=
 =?us-ascii?Q?RvrtYKyDQYPU9Q99AcpWcW6t2PUAngeF1eA7qdDWZ8aX1AAtk4DW4nNGq1ZG?=
 =?us-ascii?Q?W91qgA9b0W9p6k0xDoU2+bSOZqIiOYiUCOHnBjUQsR7HGGX+SWpZ9NQbOS/g?=
 =?us-ascii?Q?spvz9qmDnkkKywlyA4FjVN9LcIngVVzyp/OVYjOio2q/4spoSV5vWTbqvq0T?=
 =?us-ascii?Q?PVYWwhUZZlliDFQnOg1rx87XHzhA/t2nlrA0x9R8XMyB7a/aFh3NjlUIMCEW?=
 =?us-ascii?Q?rNiQ/AxHXY7zK50TrhOah9FN2L6im2nlnlF9ADhGZuK5UzYvjZaKX71n+iFV?=
 =?us-ascii?Q?dJ37bYyY4VOePzTzcR09hL8Qy3nLmitJLxRMlGldQDmQIxOKi++shGctwijc?=
 =?us-ascii?Q?9HbPvnGOyCPxB8fy4pFCsK1bxhcLzXaweUfO7hD20dQdQS16jo7deNz/i2uS?=
 =?us-ascii?Q?xTgYeNTrHeTq25pQYT+NyFBkRydcwvL063EpfBZVj4PCvoiaS0iE9NFHbeRa?=
 =?us-ascii?Q?beqRb1+G+UTYIcXXc+HQMfXaeQXpZST1hZj07PNUkFtg3yXQRu5/x+Yx6cCu?=
 =?us-ascii?Q?sO8ZeUGc6D613JnhzDng+N+iO6lSF6NO6a2y0xftyzHOCII6egKwZU61VVzL?=
 =?us-ascii?Q?ZYtPVVUd83j6cKSrha1fQptQHGeceIJ550DvKKJE7N28Zs/fznzx9Tfj7FzW?=
 =?us-ascii?Q?tJZaVA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uSOexDhKqgwLhF2HA5OAdA38CzW5VTOVhyld8ijybsNVGGap7eCr2WZL2NlPp6ibojtsBjQl2CO651o2FAkCHrHQVivvpz9Nj9VUgiT3CuRKw2ra/6bAqdSEC8S19vOO/GFSPwIjcEJl8TqjoIr523sFyD5hDXTDWVpfX2OpnF2sMQEEXWfmRC0Udcahj4I/entJZFsG4WtVTLitgKIYEzicLTdhCk1Q++wqSSRTFB4zcNSXz28RpfGJFCWLHtnX92WKbX7wg9KlTl27xVtEEByhdlTwvMArQj9tyXcyBHOEQ2fl6WEj8voYgSNueHvU6LxDQxt3X0K+Pdmlamjj/Vh9FTjfURvdsX8aZbj4f67NMHPbN/Bp3SrJXYtj3X8PzNkkzASJVj3DUAJKBL0/ydZAU42iAQUMm6rCpXRD8VsOWtIXN34aj53UjTPscX4U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:27:06.4791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e10c3f-67dd-4978-5797-08de73eb75e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A361218CC18
X-Rspamd-Action: no action

From: Leo Li <sunpeng.li@amd.com>

It's useful to trace vblank get/put and enable/disable (plus their
deferred variants) when debugging. The trace stack feature for events
can be especially useful.

Using trace-cmd, one can obtain a trace like so:

    trace-cmd record -e drm_vblank*
    # With deferred events and stack info:
    trace-cmd record -e drm_vblank* -e drm_deferred_vblank* -T

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 drivers/gpu/drm/drm_trace.h  | 112 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_vblank.c |  34 +++++++++--
 2 files changed, 140 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_trace.h b/drivers/gpu/drm/drm_trace.h
index 11c6dd577e8ed..3372513a10eeb 100644
--- a/drivers/gpu/drm/drm_trace.h
+++ b/drivers/gpu/drm/drm_trace.h
@@ -66,6 +66,118 @@ TRACE_EVENT(drm_vblank_event_delivered,
 		      __entry->seq)
 );
 
+DECLARE_EVENT_CLASS(drm_vblank_get_put_template,
+		    TP_PROTO(int crtc, int refcount),
+		    TP_ARGS(crtc, refcount),
+		    TP_STRUCT__entry(
+			__field(int, crtc)
+			__field(int, refcount)
+		    ),
+		    TP_fast_assign(
+			__entry->crtc = crtc;
+			__entry->refcount = refcount;
+		    ),
+		    TP_printk(
+			"crtc=%d, refcount=%u",
+			__entry->crtc, __entry->refcount
+		    )
+);
+
+DEFINE_EVENT(drm_vblank_get_put_template, drm_vblank_get,
+	     TP_PROTO(int crtc, int refcount),
+	     TP_ARGS(crtc, refcount));
+
+/* put's refcount not sync'd using vbl_lock, use for debugging purposes only */
+DEFINE_EVENT(drm_vblank_get_put_template, drm_vblank_put,
+	     TP_PROTO(int crtc, int refcount),
+	     TP_ARGS(crtc, refcount));
+
+DECLARE_EVENT_CLASS(drm_vblank_on_off_template,
+		    TP_PROTO(int crtc, int refcount, bool enabled, bool inmodeset),
+		    TP_ARGS(crtc, refcount, enabled, inmodeset),
+		    TP_STRUCT__entry(
+			__field(int, crtc)
+			__field(int, refcount)
+			__field(bool, enabled)
+			__field(bool, inmodeset)
+		    ),
+		    TP_fast_assign(
+			__entry->crtc = crtc;
+			__entry->refcount = refcount;
+			__entry->enabled = enabled;
+			__entry->inmodeset = inmodeset;
+		    ),
+		    TP_printk(
+			"crtc=%d, refcount=%u, enabled=%s, inmodeset=%s",
+			__entry->crtc, __entry->refcount,
+			__entry->enabled ? "true" : "false",
+			__entry->inmodeset ? "true" : "false"
+		    )
+);
+
+DEFINE_EVENT(drm_vblank_on_off_template, drm_vblank_on,
+	     TP_PROTO(int crtc, int refcount, bool enabled, bool inmodeset),
+	     TP_ARGS(crtc, refcount, enabled, inmodeset));
+
+DEFINE_EVENT(drm_vblank_on_off_template, drm_vblank_off,
+	     TP_PROTO(int crtc, int refcount, bool enabled, bool inmodeset),
+	     TP_ARGS(crtc, refcount, enabled, inmodeset));
+
+DECLARE_EVENT_CLASS(drm_deferred_vblank_template,
+		    TP_PROTO(int crtc),
+		    TP_ARGS(crtc),
+		    TP_STRUCT__entry(
+			__field(int, crtc)
+		    ),
+		    TP_fast_assign(
+			__entry->crtc = crtc;
+		    ),
+		    TP_printk(
+			"crtc=%d",
+			__entry->crtc
+		    )
+);
+
+DEFINE_EVENT(drm_deferred_vblank_template, drm_deferred_vblank_enable_queued,
+	     TP_PROTO(int crtc),
+	     TP_ARGS(crtc));
+
+DEFINE_EVENT(drm_deferred_vblank_template, drm_deferred_vblank_enable,
+	     TP_PROTO(int crtc),
+	     TP_ARGS(crtc));
+
+TRACE_EVENT(drm_deferred_vblank_disable_queued,
+	    TP_PROTO(int crtc, int delay_ms),
+	    TP_ARGS(crtc, delay_ms),
+	    TP_STRUCT__entry(
+		__field(int, crtc)
+		__field(int, delay_ms)
+	    ),
+	    TP_fast_assign(
+		__entry->crtc = crtc;
+		__entry->delay_ms = delay_ms;
+	    ),
+	    TP_printk(
+		"crtc=%d, delay_ms=%d",
+		__entry->crtc,
+		__entry->delay_ms
+	    )
+);
+
+DEFINE_EVENT(drm_deferred_vblank_template, drm_deferred_vblank_disable,
+	     TP_PROTO(int crtc),
+	     TP_ARGS(crtc));
+
+DEFINE_EVENT(drm_deferred_vblank_template,
+	     drm_deferred_vblank_wait_enable_start,
+	     TP_PROTO(int crtc),
+	     TP_ARGS(crtc));
+
+DEFINE_EVENT(drm_deferred_vblank_template,
+	     drm_deferred_vblank_wait_enable_end,
+	     TP_PROTO(int crtc),
+	     TP_ARGS(crtc));
+
 #endif /* _DRM_TRACE_H_ */
 
 /* This part must be outside protection */
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index db17800f58e03..afa918c508bef 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1265,6 +1265,8 @@ static void drm_vblank_deferred_enable_worker(struct work_struct *work)
 	if (drm_WARN_ON(dev, !crtc))
 		return;
 
+	trace_drm_deferred_vblank_enable(crtc->index);
+
 	if (crtc->funcs->pre_enable_vblank)
 		crtc->funcs->pre_enable_vblank(crtc);
 
@@ -1294,6 +1296,8 @@ static void drm_vblank_deferred_disable_worker(struct work_struct *work)
 	if (drm_WARN_ON(dev, !crtc))
 		return;
 
+	trace_drm_deferred_vblank_disable(crtc->index);
+
 	if (crtc->funcs->pre_disable_vblank)
 		crtc->funcs->pre_disable_vblank(crtc);
 
@@ -1323,10 +1327,14 @@ void drm_crtc_vblank_wait_deferred_enable(struct drm_crtc *crtc)
 	if (!drm_crtc_needs_deferred_vblank(crtc))
 		return;
 
+	trace_drm_deferred_vblank_wait_enable_start(crtc->index);
+
 	if (!wait_for_completion_timeout(&vblank->enable_done,
 	    msecs_to_jiffies(1000)))
 		drm_err(crtc->dev, "CRTC-%d: Timed out waiting for deferred vblank enable\n",
 			 drm_crtc_index(crtc));
+
+	trace_drm_deferred_vblank_wait_enable_end(crtc->index);
 }
 EXPORT_SYMBOL(drm_crtc_vblank_wait_deferred_enable);
 
@@ -1347,11 +1355,15 @@ int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 		drm_crtc_needs_deferred_vblank(drm_crtc_from_index(dev, pipe));
 
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
+
+	trace_drm_vblank_get(pipe, atomic_read(&vblank->refcount));
+
 	/* Going from 0->1 means we have to enable interrupts again */
 	if (atomic_add_return(1, &vblank->refcount) == 1) {
 		if (needs_deferred_enable) {
 			/* Arm completion before queueing deferred enable */
 			reinit_completion(&vblank->enable_done);
+			trace_drm_deferred_vblank_enable_queued(pipe);
 			queue_work(dev->deferred_vblank_wq, &vblank->enable_work);
 		} else {
 			ret = drm_vblank_enable(dev, pipe);
@@ -1398,6 +1410,8 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 	needs_deferred_disable =
 		drm_crtc_needs_deferred_vblank(drm_crtc_from_index(dev, pipe));
 
+	trace_drm_vblank_put(pipe, atomic_read(&vblank->refcount));
+
 	/* Last user schedules interrupt disable */
 	if (!atomic_dec_and_test(&vblank->refcount))
 		return;
@@ -1405,18 +1419,21 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 	if (!vblank_offdelay)
 		return;
 	else if (vblank_offdelay < 0) {
-		if (needs_deferred_disable)
+		if (needs_deferred_disable) {
+			trace_drm_deferred_vblank_disable_queued(pipe, 0);
 			mod_delayed_work(dev->deferred_vblank_wq,
 					 &vblank->disable_work,
 					 0);
-		else
+		} else
 			vblank_disable_fn(&vblank->disable_timer);
 	} else if (!vblank->config.disable_immediate) {
-		if (needs_deferred_disable)
+		if (needs_deferred_disable) {
+			trace_drm_deferred_vblank_disable_queued(
+				pipe, vblank_offdelay);
 			mod_delayed_work(dev->deferred_vblank_wq,
 					 &vblank->disable_work,
 					 msecs_to_jiffies(vblank_offdelay));
-		else
+		} else
 			mod_timer(&vblank->disable_timer,
 				  jiffies + ((vblank_offdelay * HZ) / 1000));
 	}
@@ -1508,6 +1525,8 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	spin_lock(&dev->vbl_lock);
 	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
 		    pipe, vblank->enabled, vblank->inmodeset);
+	trace_drm_vblank_off(pipe, atomic_read(&vblank->refcount),
+			     vblank->enabled, vblank->inmodeset);
 
 	/* Avoid redundant vblank disables without previous
 	 * drm_crtc_vblank_on(). */
@@ -1649,6 +1668,8 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 	spin_lock_irq(&dev->vbl_lock);
 	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
 		    pipe, vblank->enabled, vblank->inmodeset);
+	trace_drm_vblank_on(pipe, atomic_read(&vblank->refcount),
+			    vblank->enabled, vblank->inmodeset);
 
 	vblank->config = *config;
 
@@ -2123,11 +2144,12 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	spin_unlock_irqrestore(&dev->event_lock, irqflags);
 
 	if (disable_irq) {
-		if (drm_crtc_needs_deferred_vblank(drm_crtc_from_index(dev, pipe)))
+		if (drm_crtc_needs_deferred_vblank(drm_crtc_from_index(dev, pipe))) {
+			trace_drm_deferred_vblank_disable_queued(pipe, 0);
 			mod_delayed_work(dev->deferred_vblank_wq,
 					 &vblank->disable_work,
 					 0);
-		else
+		} else
 			vblank_disable_fn(&vblank->disable_timer);
 	}
 
-- 
2.52.0

