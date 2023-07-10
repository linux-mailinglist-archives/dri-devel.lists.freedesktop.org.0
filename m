Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C221D74CA7A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFB010E16B;
	Mon, 10 Jul 2023 03:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::713])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C8610E139
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZCMSCM9hPdVA7kXan12Uug2YkOvFe30WR5N+1k6OT8e5fl6B52B/ZA7pQRnPMGKWfc2Bnk7VKkJhFHBK//dlP7S+3FQh52wE/udL18oOQI8QI292hVZGWq57RL1cKRXtVdMyR/spx33+U5xJvw533ji24tEvpq6CfECcwPoLqeIODrk0S0jnkgVQnaFfcy1zq747NU3Iq//NkiNGWXkHW4MM+/EDT5jYeO13NbKUtm/Og976ugI7sSw8m3iJbPmdZ3aDB5ItbjGFSDbwDmbK+OQfhGx6O8T3o+SRU/IcJ4M2Wb1RAsMo6S7yS7oZnfpHkC0l1XdvcW0BTlhj/lj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFadkbB4ld6jq7/H4vKooei5J05bO+Y6n4oq8yBFxxs=;
 b=EarKwtMvsZFu3VoU8fPEnrcDQyCyr+sY9+/n+T6GVjpTi2rPprNvFDs+PPFP0jABefwz0hA04bUWj2pTVzl0PiEjUaEwkvpm9/iGXtoyDwiqk6JLj/Aiftf2EBlApQJ4A7F7aMAC7Y/9chl49hNREejTFOXElivImlDOl7e69BWUvTSFI0VFhtrNdZpYjf0zFwwsYpMprloiXlwqjbXZpnjUJp0oXb6NzUuQRl1XRoHNw9G0mrCYj/c8yfXKIYbDaVCyIIQbGgr7VOd295T2xJBHJJs5iCVoRS75D2Q3Tx5GjmbEcuawzAiNIgiQvUzvqo7X8sBxp6hb5cKwnhYFjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFadkbB4ld6jq7/H4vKooei5J05bO+Y6n4oq8yBFxxs=;
 b=kmk2XvaTze56PrGDdR+t9SDmBNoygcTUwWPeojZuw6pAbjy06aacUXtnpmuo6fPmTZtSATRl/Z064TD4mGcgEjRT/sQ5ROnAFOM91/waie7JFDvAZ9uWO8FldxxuaeFDvioyHe50c1cqgZ0oHYMtdGWYFQURA4R/z8i+f9UD8JFW8Ao6VvBuvB88On5deT+X+LzRzuiFKztGFuV4Y9KZin3HpnDEiblsz5IT6nqJhQSG4+lhPYT0mOO4BlOfip49dgAkGeFPdVbz2v9P6TuLTeVj/Ck4SCmTvr+6sRZeWvK39eOIlfmvwW8rT6IrcRso874Mud+mzcKz2Ykqlua3Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 03:24:42 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:42 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v2 14/19] drm/stm: ltdc: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:50 +0800
Message-Id: <20230710032355.72914-14-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e5b004-8093-4b2c-1d25-08db80f5336e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HoaeEKf9Tl5pFIgJJoZMbUxOUIdJ73rQzoOFaUWAORvKmaLqjSCuPfXhOI5W/FRHi2xIPJQBKSbUP0/oLIGAXRXoF3/uOcej2OcJbRIm9nLKyPP2FG9pe2sx/KrxzaQ9z6hGDJisxXSa7rfBXDjDfagkVaCgztZQMDaI+MWOP7NUZgsiD2NOT7IEy0/PiOFCjqD7Fh2PA9ITl67BoKAtTquujkBO7s9gRe8YwHyA6HQnKVVJ0Wv/aLZCvhonTaXekwTEZJcBjeHgQ54ziJoM4o/Y3xGSXmVF0nk06Ve6n+qd+2R99w2wNw/tDHMWLtVTWXRM78ukQ3u8uwepyx2hgulZYzxxS0gJRPbttgs++hJ8hZUGswIXWYXi3193H6zokAQuZbov6yB/W1eCSupSeNBrAnu6UJUrpc7L9smoA2yaBrWpb6+Sa7AP+m80EKtX/k+ypAvG34Y+5OTbZ5+Dlz4L0FVZYEQtCP+jrMUv+ywsqYNlkXFF0047Bi9Jo2oBvgtuzbjcwdGk2sk8x16BJ5yaXK/IrVzrSUAwLPCP7YcbsTx7g1DC8A82i3iHZDg/DdhsH+g2HoLLQmRi2+67F5LpJRXzeJyby5f39XxZjeXU7tiwGzJerpx06Pn+SqIE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(6506007)(1076003)(5660300002)(26005)(478600001)(6512007)(4744005)(2906002)(110136005)(186003)(83380400001)(2616005)(7416002)(41300700001)(86362001)(316002)(38100700002)(8676002)(38350700002)(8936002)(52116002)(6666004)(36756003)(66946007)(66476007)(4326008)(6486002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmhMSGhxYmJqbE9wY3hMVGF4SG5NWVhqazlITjRzUUN2Ri9sSDJBSWNYZXRh?=
 =?utf-8?B?a0JpYXg0RDJmVFFqTTlPVHFaRlRKaG1adThESXllYUQ0ZGNZTTVhY0ZtdVJB?=
 =?utf-8?B?KzRmSjRNQkx3WGNORDgxTVRlNkdWS2JkaFd1VW1iNTgzbFRnNWRITlllU2dP?=
 =?utf-8?B?bERmbk1oK1R6U0dMSWQxbUNRWmlhWWE0enFJMTV3NWRnSzhQQ3pyd2pCTWg2?=
 =?utf-8?B?VE44TTNwMG1UL0V4eUdRbmlxZm9URnZkNUs5Vmc5a0dobTdpOVdqRWx0ZEp5?=
 =?utf-8?B?UkxEVkJOb2dwV2E0bTE1azlzNGZScTY2dXhwNTYzcURrSWpjQXM0TkMxV2pL?=
 =?utf-8?B?RWVuMjJ0ZXZodEhuV0JHejdUT2hwNUgyZGpVclpFRVkzWFNJajhNTW14SllU?=
 =?utf-8?B?RFJkQk9BZmlGenpzVzZydzFRaXVlK2JlSDNvWklkM1UrOHpMSjlHeUtRVElH?=
 =?utf-8?B?NTJQeFhPNlEybWpmM2djdEZFenFvazAwb09LV2N2YzJURWNNMjk0NER6K0VH?=
 =?utf-8?B?TFFKNFdDNDJHZFZtWWRLQndFOWFEZHBMb2FtVytLaG1VWGowbWpWS2x5Umhr?=
 =?utf-8?B?KzY1WG1qUHoreER2cjd3SDEvUXJwVm9GL2FHVlpMdkdrWUlGS3F1RnN4bGlx?=
 =?utf-8?B?d0hqbG53Q29LcmlrYjlxbDM3SjUrVXBXSm1CSHQyNEZhWEZ4aExiOWloNFJO?=
 =?utf-8?B?Q3hUaVBsaGt0VnBROVUyR0R5VkkrQ1BEclRtZlV0V0wySHV5dnZqMjQzM3B2?=
 =?utf-8?B?Ti8rSVQwYmJ0TTR0NnFRVGRhQ0J0ckNPcE44R1Z4dkN6akpSNW5GTkpPUjA4?=
 =?utf-8?B?WUlvQ1dwQlBDNEV4SDBlN00zdU5aWThMK1lGRzg4V1Y5aEdsV2kxaVk1V3Nh?=
 =?utf-8?B?S3BMMUNETUFPUHhhME9lUWZZZmxGK1JvMkN6N3RJM2ZZaDFraC9vc0RZVGFm?=
 =?utf-8?B?dkp2SjZQRjVuTll1NE0xdWhsc3dhNVNrd0hLYlNiQ05DVXFSeHd4akRLcGVu?=
 =?utf-8?B?bHA4UjU5TjZCeVNOZWZMajZLaXk2M1hES05NY3dGeStuZk9aaHVtWXJNOHF6?=
 =?utf-8?B?YWV6aG8vQld4RkYvUkZBRityQkcrMTBiOWl0R1NPb2JkWDZzV0NBa0p0b1Nj?=
 =?utf-8?B?SkxhYXhzM0J2NFhtdjVyd2pESGpXWSthWjNMM1V2Z0ZsbHNvbWErL2daUDJj?=
 =?utf-8?B?L25QVGE4WWNKQWNuUHFXb0J4d0pmZmJOK3FwMUNYNEFvdXdwNVRXckQ0Z3pn?=
 =?utf-8?B?ZmJONkU1MW5OQk1FNVg3RSs3RlhKRU5WNjFyaEgzazRTVTB4TW91Q2NHVHVI?=
 =?utf-8?B?eDJYNDExcXB1Q0RhRFE1UkZMbTVHV09FdE5qOXcxa25aaDFtREhkb2x2ckNp?=
 =?utf-8?B?SnhVRU5ldWVPUGxDTDZFWWx5YlQ1dDNpSXc4K2dzVWdOS1BpbUJTVmcwMDRD?=
 =?utf-8?B?MFZJL3BYS2N5QzAxdy9Bam56R1RQTFVZWmpmN0Q0bWYvek5ITDJjcjBkOXgw?=
 =?utf-8?B?NWRkSEV5Y0VJb3lHZDJIUWRTcm40TEpkWDBEekd2YzRaa0RTajVrT3hNQWpL?=
 =?utf-8?B?MS9CeGxSUWZQblZkTkZrQmpTV2NzZTNWRWNJWVljU1h3bjEyVTExTXRpcmln?=
 =?utf-8?B?ak1XdDhpOE11cnJvdU9Tck1jdkdZQXZGL0JEWDZtZnV5RkdCcVFWVTB5RTB5?=
 =?utf-8?B?Sjl2QnpwYzVFQnRURUNkN05xVU8vWkNpajJyZzEwYUZSNXhKcWtJWGNtRkNN?=
 =?utf-8?B?cjIxZGlQUzZvRXBEUkMwUWxNQkpUdG1nK002c1ZSRUc2U2FvcnpoT1dWYmlZ?=
 =?utf-8?B?eHl6VFIwd0hOaW1JY3dFNGd0L3lEUitQbkRHWndPYVBSdFlKaHpOMytZYVBv?=
 =?utf-8?B?a3FlUWl6OUI2cHZ3d1poZi9DRGxaSzFqYThoY0cxNDIwcEFqK2haY25iUjha?=
 =?utf-8?B?MFVBeGpMK01qV0xEZ1FrOVBFVEVoWFJmUEFHbWZDUmx5QllQL0E2Ky9qWHdL?=
 =?utf-8?B?cDIvQkxDL1IvZDBNbEUzb3doeERVZEVFVi9ac1hhczd3THJLT2pDZmpkRFdo?=
 =?utf-8?B?Q2puemhVR1BxSnhGYjJMZHJYNWxXWThDVzh1cGN2KzBnditKUHBUcElXdkVO?=
 =?utf-8?Q?0kk9PJlUmUEjVLq29rCjj41O4?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e5b004-8093-4b2c-1d25-08db80f5336e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:42.3384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSybH6/Mm7VDh7yy9avKfTjb7KtGW8a3hZP+hYSULFK3ZcHBbaDlsCX9c9BaTMkINBBCwTRULJf0gpJEUpdswA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Acked-by: Raphaël Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index b8be4c1db423..734dca4d7dd8 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1925,7 +1925,6 @@ int ltdc_load(struct drm_device *ddev)
 	struct drm_panel *panel;
 	struct drm_crtc *crtc;
 	struct reset_control *rstc;
-	struct resource *res;
 	int irq, i, nb_endpoints;
 	int ret = -ENODEV;
 
@@ -1992,8 +1991,7 @@ int ltdc_load(struct drm_device *ddev)
 		reset_control_deassert(rstc);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ldev->regs = devm_ioremap_resource(dev, res);
+	ldev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ldev->regs)) {
 		DRM_ERROR("Unable to get ltdc registers\n");
 		ret = PTR_ERR(ldev->regs);
-- 
2.39.0

