Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C6B1B8EB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 19:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B67A10E6CA;
	Tue,  5 Aug 2025 17:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="KFugIkEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013043.outbound.protection.outlook.com
 [40.107.44.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968F910E604
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 07:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUP6t/cGf5PRtvLDeHnOCUe4gkKEcPl3IrwSV1Lnib+bFn3w4ebMoWdewRlCTjQgMF8yOmZsKZ0rVCzOp8Q4mjAH1rbpzQGML1uwIt2ZgL5+EGaGgfjIslnoXdsusHE+YD3r9fdmWJsWWwW4mZChywqy7jXHb4Hw/Fvgnq03rUSXE+4aPzEeY7h0wGJTT/gVkMPYNPUYfLibl2rE6cXpSbCCbOYiZg+XfmDq81l9eiW/WbyeVRmp+SP+CJPL7C8V4SuNg5ztxLz4HvrmcZcAS32PDpLf7C0Hn0h/gFRdbDbal8QNMNBLZ9ILWMalybhrRfVFw46Gzwz6VCVCiTqaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cubuDjsic/p/WxTvs2JbonkfRAnjZVHQX/vvR5slJRk=;
 b=gPHuvW3Ut66p4fsVToE7VWZt0B7XI2Lcf9duBPnTuxjEn0x1UTVT6QlxeB69j4i+0Uz08A5XIGFLm/XX64QznfgR3lq9+wCqSsHgsTTYQfBxPkMESqkRMZhsUugZaBFfcRyhHqhp5U6Ye07pj2qWlQRroVijZgU18Ku6bnt19qjfANRSJvVv58mIC1T6woq8fck5DXEClzjrdDIoJkh0NULSj+DaoZSIxEkFLwVRvExX8Y9mGiMV0BslWUratBpIkP8POvb3q0Lv+c0kWlrXPePaulJi6qRkzgr7rfSPLYKE1EZHeiIJpDhv/VKfDDH4qVdwF5WwBqUt1FwXPFI3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cubuDjsic/p/WxTvs2JbonkfRAnjZVHQX/vvR5slJRk=;
 b=KFugIkEH3BODi3880BjSVkfLaGZHOXJie/QgO7FLBNNNInBb1RaAYkWXmcsWDB3qQutdw9vqK3vcXGVcZC7oV5JCr5pmUgN7eBRbHCNmdmJtpn/Fx5kd1sFiCDOnhMMzxoly6FKraVvoOpg4QgC+Qp72nQb8mK4glBSqsPKphjUTcRxQ2BfLidn1emyh0/rEjv30xfD5B4hZJm/C8ZZvPWsW/T69fNSni94Up7sxByvhDipD/Ngz5KKcs1TZ687n4OX1wxduA70kcsNPoA9xxgoGZVAtFzvvad1yGsbg7aNCmpb7T6VEYpV1brUHOgPwLXNka1Bn0lsJOrqtXHLCHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KU2PPF022ABE738.apcprd06.prod.outlook.com (2603:1096:d18::484)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 07:47:23 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 07:47:23 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org (open list:NXP i.MX 8MQ DCSS DRIVER),
 imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 3/4] drm/imx: Remove goto label that are only used once
Date: Tue,  5 Aug 2025 15:46:18 +0800
Message-Id: <20250805074645.625911-4-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805074645.625911-1-liaoyuanhong@vivo.com>
References: <20250805074645.625911-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KU2PPF022ABE738:EE_
X-MS-Office365-Filtering-Correlation-Id: b32027af-10e3-49e1-8da3-08ddd3f45038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FVRtc1Q2vgNYLIlXd+F6wdU+Qnab9W/fluFnxmjs5EdJWi5Pu9mT21cM3DRD?=
 =?us-ascii?Q?QotmbIYkrnpA1qQ7oET2ycJWfJJ6A/H57hHXDSt1Q/yXTssCbxMFJOgjL8po?=
 =?us-ascii?Q?TSRJHQn1XZ5oAPbB1YLaEB0spIubzXWt0mLfr47oCjXImS/SPWQuetPVk6fe?=
 =?us-ascii?Q?7IT/iCdMNxIuKv+raCsei5oPOS+koRMFbV0fN+2TO8wuMelpyJBN/kYasOCt?=
 =?us-ascii?Q?VyrHyy2NdrdUkeyKpIYRtdTYB4yUwwvJ5Fwq23rDxRQV4zk65SL/BR1wzdTa?=
 =?us-ascii?Q?dbe7Sjk0OeadIOvHMHSnjfJL8l6BBPN/d53JlUlbLqtSEdlJCB2KCtcSXifp?=
 =?us-ascii?Q?3/0AknKJ9uQgQDfnP9Kg6xx//wJlVRtpTu0BO3pjbP4fcAO3Ht6RMAA0zVaB?=
 =?us-ascii?Q?SJajMRXJuYKhwQlW2rKgX+/MX06wy+yPURbEj4XGc8j7fyINgsRcubwWeZ4D?=
 =?us-ascii?Q?z6SY/KTisAEGYNhWl0xvOKgk9HynoRVIW3yt/hdOoFoxw/nw9bpazrJfb5ep?=
 =?us-ascii?Q?QjIfJKhfx3ZK14fB8MBtZ7+hxQOMG1Zx621/TQ5KGgHDcz+GbuBxSYZrOT/v?=
 =?us-ascii?Q?B9GqaP/H0seXBbGY9GbNs2/4jsMTzP5z6FEjFau1A5bt9qh+3neFPwfe2DVw?=
 =?us-ascii?Q?DuSsKgCBXMvS1+NDyZ2mNldANxGoj/uD8Ptn2E2c2vDzZMRGGXA7nV98J5qZ?=
 =?us-ascii?Q?XbLqbtU8+38XS2urDw820/OdNgcTceF8lCjGw8rUPw/FlBCmomgZYhlgLlwZ?=
 =?us-ascii?Q?EfX+inS0c9JklZgzJeRXZabEImlzRG4sD4sXpXVQSGY9r6H1jvEnfqB25wKl?=
 =?us-ascii?Q?4sSAWvtUSlKUhYiZ6tNkuK8WAHopg6R7QgE5qMj/zPuYWU5V3FKitLFUHXsk?=
 =?us-ascii?Q?0Fc1WIUG3INEKgKEuQy5tVg5VIeHtflUOfMbtLCALjO6Y+5rM0Qds0086n/y?=
 =?us-ascii?Q?CCvyl/Uj/5WQr5n4F9ZN1ULqiCWsv8JUszuWD+efyslxlJtOj4/JZ5pQSLmB?=
 =?us-ascii?Q?aSdOJaSqTa3dEFBtTtzmDb+8e+UD0QBe5LHq2i+pnuG59J2+hsdD1K0bRmvh?=
 =?us-ascii?Q?qCCicni31Q2kc08pJfvBcYfRg7pWkaifr/f7jwAznHzxproJX1A8XJ3+P9FC?=
 =?us-ascii?Q?mYooX25ZjMQmcU6aP72ijqpKP/PSzQJbTNt8aHAnwUPeLMmcwyZrlITvb9+T?=
 =?us-ascii?Q?ZggZu2iFpow1kEEQeCY/Z6A+VNMt4P9LsSaM1BmKcPnLMCptQVtXDqxxLEWZ?=
 =?us-ascii?Q?0gxUWokuCP3c0iYF7urb9yjjOD2pu5j7nUD1Zkf276r4M9oqSWSXrc/iUnJA?=
 =?us-ascii?Q?5/DA65nOzqSvPJ2Mg3lKZbSS9MhXCkW6RrkTM/eumN2gLEhF1GQl4O6jsXCt?=
 =?us-ascii?Q?AZndSzQJbwdEabOD7AmotJVmun2DySqaCXCbxztGxliWH7u2K/ZKL8p+Bpkg?=
 =?us-ascii?Q?SaGYMQVid7FzYk5c4zamqfKICPu3UuYorXL5AaBGRhXCNEz4spTvJQBhaXGJ?=
 =?us-ascii?Q?ShUvlH/rDP77yyI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uMWKmQ6JKOxcikCN4aZPWfQ8V9ei03wPnR47dsbGhTpYYxLg9hOeJeL1eKLs?=
 =?us-ascii?Q?VLg35XgbzXLuZi2gx4u3ZMVs4qk46lwAjn1lSx+Uy0YnSo10r8HyVIteQNRt?=
 =?us-ascii?Q?YQXQU+u6tXl22Bsb2sZL+xZD5HYv6sdUF6Dl1/nvHZRiPJ7gWpuH4dDRnyPi?=
 =?us-ascii?Q?ckDZUhOjwRtyb5Coxsc/0fRBtprEAdEOrvaX41OSN6657eD44f7ltUqt+PJG?=
 =?us-ascii?Q?mMMbkHpWFV7fMiAArJQHKaHT2LRln3lRgaJtZonIN0OkgqWhLwcY8TDlVg0b?=
 =?us-ascii?Q?dA/JqAYXQ69gXzyQb/vbwuQv4dMfNGEG6p1ufhOxgx2HyYDIbTxC+C2aAS4x?=
 =?us-ascii?Q?Pd236KdpuHEdzfer1srUFdtG1yS+ajCBMT+cg+IOal04H9Go6E2amp6qyKd6?=
 =?us-ascii?Q?ugQpss4niiOLd9kOHVkwr2Xk+lLzLYCgAqjo5DsIPBQCJaUCk3LGydoInuVO?=
 =?us-ascii?Q?qZDWBHqf9xHO9wsIeranP+VIfE6SneTY4FrV/JCj3fHpBu/AYgv3ByZR8j83?=
 =?us-ascii?Q?xYbNsc3darP7KbsavtUo9vM+AxA80/3bFERTwsje6UJif5t0Ga6wl0Yr3yyy?=
 =?us-ascii?Q?ru/BteYDAhSjFxZ0zrvH0GBj7chr12SU8Vmsw05FaKQsTF+uPJ0c4GsidPqS?=
 =?us-ascii?Q?wI0hmbUpg1hSnjSJ0PQb5XkslhG9c6BgUA9TxpitUZCm2dJ/9rkzlWGoCpLs?=
 =?us-ascii?Q?+vFAVWo+r5NSpiXQNNfotVUIzX3mb0JRh+FI89QIC0pp6BPOGQaQmQQUQC+O?=
 =?us-ascii?Q?I6Zoc+cvqJ3iOtSBxX7M+q6XTRBQqHha5vNoQJZjnNyRuMMXYkg5Pg/Il8CH?=
 =?us-ascii?Q?8zM/5/rzD1HHfd9qFN7dLB5mQ3+ROgL+oz0C9MLXXD4X8RxBkZ3sBkcN/106?=
 =?us-ascii?Q?p/WCnosg23qkMkzvPaW0QVdRRzP0bHU6T4dV/N6w8kQ+V1vBfLRUnJnXChPP?=
 =?us-ascii?Q?QpTAi/qY49C00o2LN4pFDcDAPtwcjC6fbGUCHbKHFlhqAikn29YzgFzHmhwA?=
 =?us-ascii?Q?JbQAzf8iMsAZL73zSqRhPnmWaWq83tvp3USCW5nuFg+c0k6WDY+3nCh8keBr?=
 =?us-ascii?Q?jIzwazQwAH0SqEGAJNIiMIZBcaUMugG2l4QZWg4Uxbc/OQw6viAIeY9Icqz3?=
 =?us-ascii?Q?l0O/V6HuM2IDUs8ebbF+NZAiqFYNsuaV2caBBXbmgZA2qfXdLsg1pmdgNeY0?=
 =?us-ascii?Q?dx8hIENfEQVnwTHQBNMsPKklOuNxZHlUGuyqcyb4+jTlyIMO6lP8zXk+6vOL?=
 =?us-ascii?Q?lPdHZ8LPBCMWH0C+DEHhAoS4zImWsjQqBSXV6MgMld/crR6ZEnRKtCw6z2wn?=
 =?us-ascii?Q?zB01VkDL8HH+ktCgaGMf6WkUV832nTpPgn+zyTqZ7O0/DLGmH0Zd54jN4pCr?=
 =?us-ascii?Q?tqYiXVQFq5Gmb0olyTg6QlNsDbDwJ3GQlFqUxbyQdoTMz6rC08ThsZpBORQK?=
 =?us-ascii?Q?I0OiacJNwIJ8LBdV1EedaEAC+c2oblO/afdqW+y8XAjuUSdKZ+f2ziwsRv7h?=
 =?us-ascii?Q?GWObmxV0N1xfaLClqBRVwicWEk5xFlAJHCvst9R/Y7ohXarR8s4SSKAGjT2+?=
 =?us-ascii?Q?lYXInjxU8c8yZXLIxoK6UKsvR5m/Sl4bPGQfx4Dk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32027af-10e3-49e1-8da3-08ddd3f45038
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 07:47:23.0060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWkQKMVU/lI2GBvNhWH/MwhP8loQjvTTuqFTu4XTCaABgEGmvglzXXbGt1JJd6Ow8WhDeW56aB8lKF1BgFtRhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF022ABE738
X-Mailman-Approved-At: Tue, 05 Aug 2025 17:05:36 +0000
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

Remove unnecessary goto labels to improve code readability. 

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/imx/dcss/dcss-drv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 19b027cc1dc4..3df060a2f6bf 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -65,15 +65,11 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(mdrv->kms)) {
 		err = PTR_ERR(mdrv->kms);
 		dev_err_probe(dev, err, "Failed to initialize KMS\n");
-		goto dcss_shutoff;
+		dcss_dev_destroy(mdrv->dcss);
+		return err;
 	}
 
 	return 0;
-
-dcss_shutoff:
-	dcss_dev_destroy(mdrv->dcss);
-
-	return err;
 }
 
 static void dcss_drv_platform_remove(struct platform_device *pdev)
-- 
2.34.1

