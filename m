Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2097F0E97
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 10:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5085C10E32D;
	Mon, 20 Nov 2023 09:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::701])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2293C10E32D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 09:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Otqisjnb7Bvwli+5CY9W3Cu7q2ctP7gVztY8xmvPVmSrrY5k1Y9ZCFwz1vwv6x4sIJR40K20JsM4MM+r1bY3Cpze2FFffqa4z/S12F8cYVkK8+gzl+Dm86AvslWsNWQGv4x61WNBqzrifzJQu8P1ZmCtd3JCtX9kb2IQEN3t77GWjJ+4UmPGtvDNIbMNa1bjnpKlEqJcPK2eWcmhjYQC/ESE8rFOvgzJAam5c+o+fiK3C9vveQSG+/ZlYmKXpxRxfJbf8e5Sm1OGiHpF/b+4CHChdyBhZgadyFG+Hxfn55bcOaR6JbV0r2ZEXSD+84gCzZI4WM2UDzz8WFUNuzGvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9a0EpfhZ2nVvzSoynEzyvGwCDqHBkmm9qTg274uUho=;
 b=ebGLKednbvpYrkY3aNc2QOcSqoNkG1dISLxDpjaTeLCoca6hCmuJNqXhvb/RPJub+D4WRIsGf4HgdzXw2QdFdHbAah5d7dYS4tLeH7+anvWyKy5mkQNj17wHc+HKcWrCt71yM4fDZzDZ1Su/M1fXIH3FQ4uMGFrOn0eVtZjs6OKct8Zf/TEFL2c9biOY6ENTyrP+TSTwIJ6qqXh07narItyiJEiKdOavCfdUFlI09pegMVktDfm0wAB5Jigp5vuQr+llbq16H3MlOVH+1jqJSwzddOkK7q4leiWb9jb+nsanSHXituhy/HSVoDkqe2OEoo7A0vx0rToeuqwCpEJarg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9a0EpfhZ2nVvzSoynEzyvGwCDqHBkmm9qTg274uUho=;
 b=3cN+D37quoarmmxPPchQu7isWNu25xvCCGa9izxzNJUASIAjwTW5di3QLHrkjAv+0nx7fOUg3OMCQwpNeb9634ntML1oRXAu60GiAENs9WNCqdpmhY3IQP9t+0i/xuCA5XG7TJlN3DOhjSiWn6VCzQEYQe5rYe2sA43YrYJilTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6706.namprd04.prod.outlook.com (2603:10b6:a03:22e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 09:11:23 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6552:26cd:6ff4:9b3d]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6552:26cd:6ff4:9b3d%4]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 09:11:22 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] Revert "drm/bridge: Add 200ms delay to wait FW HPD status
 stable"
Date: Mon, 20 Nov 2023 17:10:36 +0800
Message-Id: <20231120091038.284825-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::25)
 To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|BY5PR04MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 241fe919-60e0-44ef-7aaa-08dbe9a8aa10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IpDXyibu/TdPuPiCNF5haChhM6kei60FGwyELaRPgGXFKLu0W4cpcyX0PFDHp4Q1N5sofXL8u3PGVoRvwsh7HK1RfBdAw+wAS6NT7tXCfRvoFPwzHoTc2BgzMJ5i4/PcOZgHfrtI7IfCsP/Pc54+8tX1PEFApSfqd7g7DCIGd6+o0ytEcqB41tXIHDkxwrQ6m2zmDaHijGLOoelVg1aIP4vwG+eEON8xKHgZUAy11y/5rctk73VLGhc6NPUb84LxsoPe1Bl+QQKodKT5m/wvqcm4nhNtccERiSqovkd4jWqWTif6llEkgGGRN7y+RcKdohDIv+mjZCLsjFCboXkNjEFKIDWzD5FoDRrYAv0uinwyw6y8Wa65N50vIqauyGj6+QENxDiz5cIIi27z9ZMuosl1+BnyMOAE2Er0mQS1l4fToS7iixVM4DR4JzA/83w227ffsnnreDMlqTmmUGud4p1z/opDAg3U9lVct6EGEAS0kblqcQvrP9213PYRVPrd9wrb8ZusEQ8Og4gLJBFgm3iVoDz0W9a2O5A0909XokpXQfwUfnjSDY3SoeSYVQ1AYRWM5S5555kKfXFw/FjPUpAvYdBgdTVV2HTk9V/hfS79PGYRSqs2wJVJ2QgYKIcl+dBsZyuFKVCHaL7Gl552wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(376002)(346002)(39830400003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(36756003)(86362001)(5660300002)(4744005)(7416002)(2906002)(38350700005)(921008)(6666004)(83380400001)(6512007)(6506007)(478600001)(52116002)(6486002)(26005)(1076003)(2616005)(38100700002)(8676002)(4326008)(8936002)(66476007)(66556008)(316002)(110136005)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ddmri0g+NL9KtnJZIKwDF9lHnQ9afmAL9PVFUQp948nLs7YQE7ZqzoKDOPGR?=
 =?us-ascii?Q?Y3nONB8BaBVjrGa4KalgKrSLtH1gDxMEXAMD/Naj3kq4XO1qtJVIxaYf3BqA?=
 =?us-ascii?Q?mMzRN5MF+AKfek2vWO67KZwInEguGwivr5W6HsEvo7e56x5o0Dr12I4ZYL/k?=
 =?us-ascii?Q?fp94SDxcE5237Ns9jhoeYkiBkcR9GO33z7ndhO17Q4EnokaSlR/o0C9VCR0Q?=
 =?us-ascii?Q?/KThja0/0T57I9rmd3Qk2RP39c9yKYxgbCO02iZoSOKN8dgFKFr57N6H7ZLD?=
 =?us-ascii?Q?Da3NsZQWZP47824sxLDUO3xmr8bHVdmVHkl/Ob2vfTP4ohTjd+JsjsnBXhWB?=
 =?us-ascii?Q?Mj8kweZDOA0B5rRN/DyVLRmiF8QJ46f9xTq+WbSYZA7MXdlNdtBLa4rwuB5f?=
 =?us-ascii?Q?FjLdNv2vAwbkrH0NKd0k6y1/+skOejiIDgjpYPzLaJl3iVbIjngJdUF0eyKw?=
 =?us-ascii?Q?P8YXRPI6w/XT1t2yXI8pO8A7mL6KT7hSt+ziSSiZ+1KabMOzfNDhTe7KXukD?=
 =?us-ascii?Q?v7mWwQSUxc++F1aqS8DCec+p3AwwcruJTL6j7FlzvToTvBH2R2ny4fdE2Yel?=
 =?us-ascii?Q?TiWHNw8bHg+fAXdEldWQfKjEqN/w0JIquKyjnGjFFMGrc6IRyDIqC4gjDxVw?=
 =?us-ascii?Q?t7KHDrXb9+QEX8i5RYtI69u9tyxWhBeo1vlb7H58t+i60GPDAgLG2vu6iy63?=
 =?us-ascii?Q?JurD1v8UQwIBXiHYdqNgq74sm2MEgNvGPXbec7mMZQf7JlBN5fmU9mG5Sisf?=
 =?us-ascii?Q?I2GwMwEspwb8hqmTNkNt5yoMeuuCyD+q/fkgi5hQHovLMRsjaKEs3vgvKiqp?=
 =?us-ascii?Q?CMAkEpK7HfnWtUJ8fkV/iWlYiPMxNXayHTE/JSHwnggLRyGjLwTZZihMkPgo?=
 =?us-ascii?Q?onScaPbaWXg1No0GdV9Eshn1GunJDvmy+5srjDCfoHmnbHaSbIpXefafgned?=
 =?us-ascii?Q?oHmwar2cer3YFU6LtuXDrYzajjk06JvDeQ9GZPYjdqD/55WK4g/LrNtPB5gD?=
 =?us-ascii?Q?CHT/SLpz4J+nBEGJfoIkzIj7S9aPDjYyIXOXvzkQ9hxGtTYWXPM0LOj2j9rt?=
 =?us-ascii?Q?hrkBjjGlbXXdn7NR/qJ6QXTl9ckNCwugaYRucJ4/dz4tyHsLTzNCR4lA7NLr?=
 =?us-ascii?Q?l68D/TEO40F8hY7K4k3cgFZ20TeXMGr68wbygEFpf7SUeAHSjmcZPXlN5Hjd?=
 =?us-ascii?Q?AMM3vZCBSZLY3NHsIeRscRXA1mhNy+w7CiSoyvRGImTXgKBhoSTjObOTACGx?=
 =?us-ascii?Q?0OjloKoUEnHtPqkc+g3rCSfpxuuI6tJpiNqngL8bPTIUpWy5oNmp79kY7im0?=
 =?us-ascii?Q?6R0ZaPB7FMTmqFzDLXLuRxpKYk17IEo9dKjqGMbDq3uOJ4hcPX9Xcjd0cMMS?=
 =?us-ascii?Q?O7HMlFX/hrJf19tnQWkqzanny0as3IwA6ffW3/6qoyb8UxCtSZW907+3LIa2?=
 =?us-ascii?Q?OO9Sr/xFPNuwGdzsfhm4HgXkAZG0By40H04rm+TZ/EAaHamr9w+BC9rcILSd?=
 =?us-ascii?Q?sDWKtPyT+iyNCcT7XWiXyQSfT1g1PTOryJkSFWdHvgPzVFgzMYP1UPl7Iazf?=
 =?us-ascii?Q?ywT/2ISwao8Ki7sABN8iqp1IImkfeCx4dWpxambu?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241fe919-60e0-44ef-7aaa-08dbe9a8aa10
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 09:11:22.5081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEQ67VTCEDaS+DWBJNM+zshBkVhKVGPEkklwkykW2yDZsEJh4nTc2A9Uuw1i3ddAuGKv3+z0vhY+E9cOxd+72Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6706
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
Cc: qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 330140d7319fcc4ec68bd924ea212e476bf12275

200ms delay will cause panel display image later than backlight
turn on, revert this patch.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 8f740154707d..51abe42c639e 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1464,9 +1464,6 @@ static int _anx7625_hpd_polling(struct anx7625_data *ctx,
 	if (ctx->pdata.intp_irq)
 		return 0;
 
-	/* Delay 200ms for FW HPD de-bounce */
-	msleep(200);
-
 	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
 				 ctx, val,
 				 ((val & HPD_STATUS) || (val < 0)),
-- 
2.25.1

