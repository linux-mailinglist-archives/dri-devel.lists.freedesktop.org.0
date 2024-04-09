Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEC489D728
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE41C112CA8;
	Tue,  9 Apr 2024 10:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="INWx2i37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2121.outbound.protection.outlook.com [40.107.241.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4064A112CAA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiuI1vWlRrnmS24FnrELxc1IqWVlc11dxhirnVZdUf9tNfQteu8kQwaK/nHWNM3ClstVMVdpAbAClTWLiNDXeXMTflP5lDHoBfeCvnaedWabdc6FBaS6as7UxU723bN1ThGRashMpZtekry1rcXXVRs87AYhCL/Wus0Fp5UZYl70YkkCt0lrEBC7h3/yAwQBRLHLIKt9+EF752Ra4DEB/BBo1qOcpgjWUaKtjXHCQLFIgIUQrrTZ8XHf1vTm8k4TolHK23w+4NUMsPvclfA1ZveevQzhc8ui6t8iE3UH8PI8/AZZKti0wMw83b7r22GXNkmBAR1J8rWzDREIehzKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EM9BM7NROHLDTPLPC3FQFnhfeVsAi/mFrMO7Uo9OCns=;
 b=LYlt1kMRswxf2nT9AClUuIac1j5JUQhVwJGkoc4sHqCZAHEqYWiIG4Xzr1RveP7x/VucJSNcJoc0ltHUTKBElKQJm/7eVdvPlFvcFq2AX6V/6rJzjAq1Mf1ueGHnBlzlEc+HzlP1tcSTwUt/ATIrV8MkTwPfxuQZM4Ewr1/31NmZiKH0jH0E06S4+DsO2PAfOHzeB45njgMsueM993PZkf5MhpA576tKJaEKcduIn72e92+nM4PLy0MghpEnNB87GlfWemRJDOQDmYkt0qoGkScwK54oedalknkObxtaxuJC3VQWZphZHXaqBYlpM3Bf1dkHNNtxV0F9ncSYhuxp5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM9BM7NROHLDTPLPC3FQFnhfeVsAi/mFrMO7Uo9OCns=;
 b=INWx2i37kUTlp1L47Yon4DR6ovsyI3ZEsp/l+TVjOcIWWPgHX+o3FjjqQ8WRsq2PkhFuNi4b+tDYnrPy6NqR2X6ba0sJmSbzO2zijLsgz0+nCcwBZFYFnx2uu5cUHBPgTW1y5WPEl1LRRXhR9kdeGggvOjyv082McAe5ac1JWzE=
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by AS4PR08MB7506.eurprd08.prod.outlook.com (2603:10a6:20b:4f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 10:40:51 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b205:5d9c:7c5e:21f5]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b205:5d9c:7c5e:21f5%5]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 10:40:51 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Tue, 09 Apr 2024 12:40:39 +0200
Subject: [PATCH 1/3] drm/panel: sitronix-st7789v: fix timing for
 jt240mhqs_hwt_ek_e3 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-1-f9ccf6e7a881@wolfvision.net>
References: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f9ccf6e7a881@wolfvision.net>
In-Reply-To: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f9ccf6e7a881@wolfvision.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712659250; l=1056;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=7iARjiADrdPjTmt5PCj4o6fziLM4cv3Jg7R3sLbVu1Q=;
 b=zC1zjVB97WTLoppT2zmkq5jkk3Ayxz91K6l9Bu3YCLj8kjCUP4/W2qR+wLO5thx0SWoZqXpjF
 K6OV+gZ/6++B5QdND3oLKHZldTLf874CV8z19PmEzGc5I8LeGG8xG8G
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VE1PR03CA0002.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::14) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|AS4PR08MB7506:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8pjR6sit/3a6FWJ4YL7k563ilyQUy0idMiUV88Ddej70RQ8uoy463JG5TAFQFaoIdmPwmYtMX1GjNbMleqTFbDVq8wIQ+/M++TFKOljCLiIbfRUBH1Cgucx2r8r996fRm/lcnflchoKtSsIJrrBwUsSh7XpevV5STOe46OITxLGixuu5LUAOIvhTEjYxdwbPTOOFGeAo5UIzTN3sEMyVq2zIT/jWE1c5YqQJnhhPB41iE7eowFPkzk0tJgru6F8oYORKjmmXRw1W+fbatM9hAo+bc+FyY2Xdy5BHAa8cipk47YcnnKG9XBVuZnioD5HOYO9bh18dmINvJaiEWlJsrCtn88N7fiy/LOcFH+RSvB8nO3XY60tr2+SFzDonvI5FwlfWMJ1MQCOkp5lK0YzK/VwqRycsXnx4CGVssYA0i4UvTmF6lVnPMnmbRz5XH9rmJ3j1b+5pphcV7lIa+CXI+OVNMGDPpRMhxwVdQ7rCGFd6UfLXh7bAWENQzN/FMqnYlIPItwseFzCDldG4HpV4Rf6IC6ZrZw0rnLj4EeVZVI5gn6SPU/p/QWUVNnOyqDHV825UNa8hLOWwl7IX+pmxdkUns69niWaD2Ru8WYa35kNWsax0v+yoJEJGmX7rRoKZJRCTQtkgzEu2Nr5BmnJ9RZo6sazS4h+r+44N9aqScztmXUJVVurzm7sQCyP8jE6xU/hyhshvzvzpF9tRWnGDLVFeC120HFhNgfp77OLy+WY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXVlYk1BZkUrNFg4WllvMlBzeU9OM1R5TnVvY2daMk1iajlmUzh4eStIellU?=
 =?utf-8?B?czZ4endLSnFRZ3EwNEoxZXAxR3FkUmV4R05iekF5a0xwTlBOYXNJaVV0dDJM?=
 =?utf-8?B?ZkNxZ3BXVlVsTVQ3V0tlVUIrNzlyYVRrUnIzbHQxanlrMHl1RTBhRmMxSGRU?=
 =?utf-8?B?dkd3TmFzYXNlVE5xbDZlNWhXWUxmbXVCMi9KekY0UlJvWlZWZUsrVXFXOFdr?=
 =?utf-8?B?Sm9odW8wbkwzaDI1Rm50NU5VTVEwNXBhR3UyL2NGNlJmUXBKQUEyNzhMcU0z?=
 =?utf-8?B?R3VaTUpRUUdrQ09XTkRHTDlSQTRLUzY5dGh0cEdqSThXY3ZjZFM3K1pQcHBB?=
 =?utf-8?B?QjVjNjVSbGlRd3E4aVFEcWRyRXVWYlJKVDFvZVJmSTE5LzhnMnllRXhvWUlo?=
 =?utf-8?B?a1FlQVY3QUJoU09hRVJFMWVhc3V2R2RyNzdNK1Y4TGxObENCczFEN01GSnhD?=
 =?utf-8?B?RVFPVVY0UithVHhwM2I2dmdkMVdoV0VIeVA1RktlZWd6K1o1ODBHWUlnUTRC?=
 =?utf-8?B?a1oyWW9PaHN1MWZNdWl0Y2xnMEdVd0RNaE55YnVXRmd4bU9hN2JISnZnOCtj?=
 =?utf-8?B?alFkTWRNWEhtSFdBNU9WMkw2RGdHYldnSU9zaWdKRkxFOW53NmVlaG1QYVFa?=
 =?utf-8?B?dk9tYi9PdU1PZXB0MUIrR3R4alNTaVJubk8yMSt5dk4wWkJDTGxtU01vUkpI?=
 =?utf-8?B?a0tOL0xqTkorQVovK2I3RFNMQmdqSWFaanBZdVdua1AxY2M4Y2lUZjJ0N1Zp?=
 =?utf-8?B?Z2p1cXZ3ejNFbWYzOXMzNmQ2Q1VHV3dTQUozdjY1TUJLLzRjVUlobTRDS0N6?=
 =?utf-8?B?d25NeDVKVXFJRE5oMHE3UGFLRjFnYWVQSWp0Wlp0QmZzK0JLOWFwNm50OXAy?=
 =?utf-8?B?UG44Nzk2NzZQcmk1ZkhMUkhHTkZLanpTVWE0UmFKbmxCd2V2azJSeWQ2U2p2?=
 =?utf-8?B?L1VOWHJnam9UZS8zTzcwRHZjUlVrMDlsd3RkVjYyUnNLdGVJdnJtZklIMXI3?=
 =?utf-8?B?amtjKzhyZ2R5ZGdiOHpvUDdJNnFkRytCYjJpanFaRnhPelZ2dFpOVTYyWUtB?=
 =?utf-8?B?ZEMyeFo0emhrODBvTG4wUnFRb1psNXB4d0ZCS2RhaTl4WGt3VG1Xa09SSFNm?=
 =?utf-8?B?K1J2NTBXY2Vjd3hocno3RmdCMlVxU0FLSHJaZG9xN0FOMEcwd01JclpFcmdU?=
 =?utf-8?B?RHk1SCtEa1lPOFc4bVhjMnErVjRsb0tSQldRajVXZ3k1cE5tNGNPNVMwdG9Z?=
 =?utf-8?B?OWpyRXdiNm9vaDYwZ1ZLQzFGTng0WEF0VGJPR1NnbmZTN2lLWVBNV2xDUVd0?=
 =?utf-8?B?UjdjeHVlUHNJWEVESmdCOEhET0FHcEtMUW40RFZlZEt5UDUvSXR3eGsxL0tO?=
 =?utf-8?B?NWI1NW5zVndwcUZkbUwwSk5vc1Ryc2pqbnlBbXZuZjNVSlVKckZ3M2RQall2?=
 =?utf-8?B?K3NvRU9jcUhZYVNxTWJVblZvSndNRGRiV3JzcGt3ZVdlN1dTeUl2andwcDJk?=
 =?utf-8?B?d3hZZGc2YTRVVmN5OHhldkpuZjRhY1QranBkN1FCSGxvSGtLU3FMK1h5alpW?=
 =?utf-8?B?eTlMd2wwcjVPTzdheUtLUGhhSHhKNEUxTVFOekZ0Y2F0c1ZvT21JWUFBWHN2?=
 =?utf-8?B?dSs0VXh2SlJiT0J6YkZMY1Q4UE81VFM2RlN5Zi9qZExhNkZSV0FZdG43TUdj?=
 =?utf-8?B?c0Q2d2V6NDhxcE1DMHRZeHdUdmV1UHBUV0JORlpaT3lGSGVRTHpLS3dJM1U0?=
 =?utf-8?B?YzdjNVNIWGxvWU1UeWZVZmRiL3YxVERwTktmbEdpZm1BODBGMEg0b3RSL1Zs?=
 =?utf-8?B?eXFGeTBkQXZBWFZCaU5RVjhKY2lMVmhWeVJaK3NJcnliT214UVVsbTBCMUlm?=
 =?utf-8?B?cHBDdk1ZUFpiZEhISElSeXgwR241L0UxbDB3dld0aGZGUU9rSVJLVkZMSk9H?=
 =?utf-8?B?Q0JVcEZjcUdUYXZscm0rV1dQQlU5WDdyQTJBMG9HQXdRTEVTK0Q1UGRNTGFO?=
 =?utf-8?B?ekhseVhiekVza3VqeGVQc1d3Z0pOVHhId3RiNWl2QjdKem9lQUZ6NWl4Ulkz?=
 =?utf-8?B?dUVXWFBjbnliNC91QytZNlNhNW1lODlSVFNOK1phY2ZDdjZlNEZ3aEU0RWZy?=
 =?utf-8?B?YzhlR3ZWbWlOV3JyRlJndUZvbmlLeHRDZ21BTk5GaWtmVG5MM1NQb0FYMnov?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fae1276-82e4-4a7f-ed1d-08dc588186b6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 10:40:51.4716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEzwaQIMZCldmi6Va+SwbNz+Se2smZ2JiCJgnIjZi+Fgix3duXDYMFB5s8gPiSAYsE4RqK/FBnENoXVb4F4FFoNyt8NvJkWtbksbZiOeNjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7506
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

Flickering was observed when using partial mode. Moving the vsync to the
same position as used by the default sitronix-st7789v timing resolves this
issue.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 88e80fe98112..32e5c0348038 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -286,9 +286,9 @@ static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
 	.hsync_end = 240 + 28 + 10,
 	.htotal = 240 + 28 + 10 + 10,
 	.vdisplay = 280,
-	.vsync_start = 280 + 8,
-	.vsync_end = 280 + 8 + 4,
-	.vtotal = 280 + 8 + 4 + 4,
+	.vsync_start = 280 + 48,
+	.vsync_end = 280 + 48 + 4,
+	.vtotal = 280 + 48 + 4 + 4,
 	.width_mm = 43,
 	.height_mm = 37,
 	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,

-- 
2.37.2

