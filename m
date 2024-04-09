Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C438A89D729
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97827112CAB;
	Tue,  9 Apr 2024 10:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="YrLyhQPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2121.outbound.protection.outlook.com [40.107.241.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F72112CAB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GM9iKoFZcgIOQdYUNBZNLYO5uXIiemdLXm+qSUf9CImoE7GWuq8SLqLZEU4FmLAlRvxSEQCJo817S+95ELjpiIXbiVFVBlIYHrfguyubCe9wAhu0XnKsq13gpc0JEvpy1FjQo+KXqhMkXtoLrkUbG5aMDgm2j+7RphVBLaAjP9owWXpVfe8E6dvcGezVhmxt/gaxKn7ujCgIA/HLanJQYMUxz8HbuIi3lNLUkcioiT3xuP80myHr35Z/ONRkWXk773GigpNsQxKfHo7RXD1aFGzq8JKwztOBhe9+AYPVVBikKEjLkCUzhPGJg/hgkrCfkbqU2NnyuGNBZgsB3DdYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9opRFzleX7w0RsgDIjAUz6Mwuc/zJwkYCLstivxccEc=;
 b=g8xoVGk/7E4R6lWIwV9G2oR/bfJPjv+59gfmrudCxD4LFTyLPx+lxrzJKIXYNSwQtpNK9hVtG2wTXIl1OzsRtlt/vzOQ+EIkiVKcF06Uwu0SZMOC7duKChxzCazVuUMH3WVnk3azW/5W1vk6auHW/GJdlMJomHhHPd0g/+MqlrV/U+CtUB5qxyyDzgGNj+a0tAV9XEhvw6o3ptxwX1m8hxxeP24FR9noWbScIrTLz6pamUdSMBUyDOlMkIL1kYUt0Mt9LOQsjpUFn8t6IUYFcYEzZXebtcrSZ/AmOQ/ThlNrJq+bUom8bz0HJxCL+pWXuBQzVsDgbTBT45uYrYV9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9opRFzleX7w0RsgDIjAUz6Mwuc/zJwkYCLstivxccEc=;
 b=YrLyhQPtgFcm/n25OLl1Rb9iS3PhOJzuxWH9ksdcmLPIoHoPJ19IIVVG9Gev/6z3QZsI8h8E72wcth8RqS71o434aBX0XFzE480CKSZZFlaNUZBfpmMifhtFyksTexvzZIyIu5eL0XnOvQWacGxLbTiWnA9WzR6bZCX5coF70Qg=
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by AS4PR08MB7506.eurprd08.prod.outlook.com (2603:10a6:20b:4f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 10:40:55 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b205:5d9c:7c5e:21f5]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b205:5d9c:7c5e:21f5%5]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 10:40:55 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Tue, 09 Apr 2024 12:40:40 +0200
Subject: [PATCH 2/3] drm/panel: sitronix-st7789v: tweak timing for
 jt240mhqs_hwt_ek_e3 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-2-f9ccf6e7a881@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712659250; l=998;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=L75Ahzdg028IAtu+zqtyqJPYqEpvooArWModEJr1xcs=;
 b=VauiI8NmKjXwx9whC83Jr3O00Tceq2vaaf5FV+ebDCJTVR+ClxIfGkOcXS42WKZFtMkIXjTIF
 DWTGH3AYpQZA92p1jGvd4kCOfuylEqrjDYXhBnxmEMhGHDv7ovbfwrp
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
X-Microsoft-Antispam-Message-Info: oItT6xpVxU6H3G/mDPrU+dQqqQbS6GFEJizBGblkfocSlyRPYTmyFzKKHItNqsu4G5LyQ837spPHXE2zXWPf0jJKSqXWDVYKSeBUtSbYhUcoLjeTe10FxnFDrolJLXh21m5WGknYUienkgLSt1VEgMqghyXzx49lO+KJ8Dx/eSDPD0UootB4zts2UC4fjpecVyTT9ix0iNZKnurYyIXvrj8ruUoRZK9vU2N39BKCEOgLspTJAXLGiVfdYqiUh+waeBP5jFA1YFF5XiQZJncLRIKW0qfxGAu8OAKmX3xWSCZ2zV+SXZXals2v8SrTIOySQwALjZYWyY03zCStXshUVtAHo+1PcV3XCo3EZAgIHHHpIoT7Lw2kmjlAcp6bZtXiY6S9r7gbD6D/xyHxvOramHfwN3MWAXsRGnKYGZr0Qf+KIC2ezsdzqEqgK1jtUIwHBgoaj5VyBQOAnraAiaDidjc0MoupMhRndE5AiPX/qcutw4Hr0nw0OdogG8XnVxWyKJdsKgYwKL+5/kwE8fMw2/DHPTblI078XC4UmTXSoH+cpQ0B0l31rvpYguoxStR3yJhjE74sE7UHdn9YQ9nrAyav7W0GlD4pZU3msjpdrh3WQPAq9ntoGOXK5e+XokYyRmveKUyR70rfAlquRHqHUOjbKyfQXPlAhRobSq3BulDKaWwBjq+Lj9kyyZ1rC42Pu9umahkuX389f6+orgXlZg+wQALVgXeQgTmsaJCO8jE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YThqNThSTzN6WDRLUk1TQVdKeTVEakRsek9ub0huWHF2MmdLWlJ0bEdNckNY?=
 =?utf-8?B?ZllrV0lrbEU0ZExKV0ZzK2duUzZ6UlFyZU9QWmNjRnY2eDJkeXcwV2JXOGN1?=
 =?utf-8?B?WUlzSUNoMnBxVVI5L25UNHM2bFg3bS9LV0dUbHZ3SkVJK2FWUWFkekdRRS9C?=
 =?utf-8?B?eXBsUXpNZkI4M0w1Y3Exa0VtYWNoQnRUd2FQcURNNGtvbW4xQjFOU25jTTRS?=
 =?utf-8?B?TDlQczZkYmVMSXpDZ0F4UGVvdUZoWTlrUFJhSFJrbWFvMUdIWm4rclI5RDFR?=
 =?utf-8?B?QmtaQkhqNXRTZkJmbEw1bFNGL3VOK3U1RHcwNmtSTFpOb2drbUs2U1lLVFBY?=
 =?utf-8?B?SEQrK0VqcTRFYTM1TmowQzZJMDhIRWdVNWRMYXc2SkI3SVBOVzM0bmtuWG5S?=
 =?utf-8?B?d0xFQTJKaHJYUEd2bHBoVjhPaklGSHQxNWJJeEtvTXFFbHpQWXlxWE5QaW4w?=
 =?utf-8?B?aVova2ZtaWVOeWNTQkErOVVCVUd3UmkzZUVXam9MWng1N2ZPbVE2Z1dKZmFx?=
 =?utf-8?B?RlZ1VTUwNjBMd1JvK2lPQS9TVzhHN291UnA4TXFLQlhBZ3YzdDZ5NlhoN1kz?=
 =?utf-8?B?b2lPU1NQR3F0VW9XblRlYko0Ykc5ZUZuLzFrL0VCaEgrVXJnQzQ4Ym5FSStM?=
 =?utf-8?B?SFBGTFRjRVJMNTNnL01USzM2eG1OaTJIODZjS1ljbzRQSE9CYjBlNFNIRkhV?=
 =?utf-8?B?NGtrZng5K0xMU0RROTljUXh0QXdCRWR0Ym56MmFCTmo3M1A0TUV0Nk13SHFC?=
 =?utf-8?B?ejI4czNGaUR3eElYZTRRcE5xVzJPWVdFMEFkVjY3WFhqb3hXenVsNHJ2czJ5?=
 =?utf-8?B?YVRuaGM5V2ZFMS9PTGdXcjlKNTNnRm5sVHNWRCszSk5ubUtObnR3bWJxQ0RR?=
 =?utf-8?B?QjRTNzgyaldiRzRpeFBFUnB6WFcrY2h4MWVReWltelVaN3ZLQUttZnh3SDVG?=
 =?utf-8?B?SkJtZTc0dVlEb25vUjhVZ0FpMUI1aUN3eklscDJna1gvYWZTcDdHaVVGbG9J?=
 =?utf-8?B?UFh0WWpxZEZpcDhUQWpwTnJ3S3FEUVV4dWtHME1ZV2VvbzNOaWFtMXlYY3J5?=
 =?utf-8?B?TWc5TEhzN2I5VHdhOFN1cFVqSDdyZU9GL1pxdkdmeGNna00rWUc1SXRlMFM3?=
 =?utf-8?B?YW9GZnBiaEpua1lnSjNuR3I3b1ZHRG42VkJqdjlFNHJkb2VQWTlKanZ3WWx5?=
 =?utf-8?B?ai9pUWp4enZ6MGRxSUdJL1BvKzFSZUpFeUZLYjExL0E5eWhsc1cvbGsyMGVY?=
 =?utf-8?B?YjdTL1pVY001aFZrVFhpM2Y1Ui9GWE1EU3QxSEFwVmlZaGt2MEtzYlR2WVlu?=
 =?utf-8?B?QXlhVUkxNzc1NDl2dkM5bEd4Ri9wbEQwTE9sS2d5aWdUa1c5RkFvODJGMWhQ?=
 =?utf-8?B?b01tTWF3K256K2piaWNuU0NkVDlsNmtYeGFleTh4NVB2UzArR2ZyT1pOTW9N?=
 =?utf-8?B?dEVyblFKVXZ4UUlwMXNnK000SU5jbzJQaHlXL3Y1UE1XNjFNYjZ6UHpuWmRi?=
 =?utf-8?B?bk9HRXdzcWttZ0lGdGpuaXNPSzd4VHRiSEdBYzF3WjAzbUhGTllmZFV4cUZ4?=
 =?utf-8?B?cy9hYXNjQmZRN2N3UXZnaWVkMlNWNEcrYjRXemk3bmtQc1FySFlkajVHdmxR?=
 =?utf-8?B?VVRWWjdZVUlOY0JiQkxyQzdMSmxZNTVSeDZxNElwQmVJTklEeWQwR3JCTmdo?=
 =?utf-8?B?Z3ZENUFTQlBVeU0vMlA5Yk1WOFUvVXo3VkZUckpHdWZhZlJWaTBkS002SzQx?=
 =?utf-8?B?N1RCamw3VlNpT1pLY2xzZmJoSHUxN3hqcHlHWXRFbXRVZDFiUUF3ZHhHOWpm?=
 =?utf-8?B?V3d6U200cEl5aTd3UU96N215R2VrWTBNS3cxU2FmUytRVFhzNmFkMUdYYVJw?=
 =?utf-8?B?WE9xQ09jZS9ITGo5eTYrMEFSdXQ3S1VZaWNjRVpvMk55bVZGWENGNDFkR3Nq?=
 =?utf-8?B?VW45UGtXV1ZBa2lEbngvV1JIZ1VBaHZaUlpqb1lld2wwV3EvUmFzUDR2M2lq?=
 =?utf-8?B?SmxDbmlVS3N2dHI1VXJXTDIxYkZsRE9RQlI2SzZOWUMrZEh0bHNFU2FVQ1pI?=
 =?utf-8?B?UHBMRHN2SUJERHBCczBQRVk2azZaSXJjb1RYbmtvSDNCSzU1K2MxaDFPcTBQ?=
 =?utf-8?B?bmc3cUdLWG9Ka2FsdnZIcWdMRklpbDVnejRmaTNoeEUyeEROeXdQaC9TVjNW?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe16495-5a9f-4435-801b-08dc588186e5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 10:40:51.7765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3J2OmVeqyZ+WRkwpiOFOzKb3tf9m5w9zo//WkmjPHv437r6+svIkKjcmjjdbdy82WE1puvynUdo7nkGWkNIOm/oMGPDKgOr629gatz5kDY=
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

Use the default timing parameters to get a refresh rate of about 60 Hz for
a clock of 6 MHz.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 32e5c0348038..c7e3f1280404 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -282,9 +282,9 @@ static const struct drm_display_mode et028013dma_mode = {
 static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
 	.clock = 6000,
 	.hdisplay = 240,
-	.hsync_start = 240 + 28,
-	.hsync_end = 240 + 28 + 10,
-	.htotal = 240 + 28 + 10 + 10,
+	.hsync_start = 240 + 38,
+	.hsync_end = 240 + 38 + 10,
+	.htotal = 240 + 38 + 10 + 10,
 	.vdisplay = 280,
 	.vsync_start = 280 + 48,
 	.vsync_end = 280 + 48 + 4,

-- 
2.37.2

