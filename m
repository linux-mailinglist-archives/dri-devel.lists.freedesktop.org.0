Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A3E50E007
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 14:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051E710E755;
	Mon, 25 Apr 2022 12:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2131.outbound.protection.outlook.com [40.107.255.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAB910E75D;
 Mon, 25 Apr 2022 12:22:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5pYIzW44HQtYPvPfwZiuA1oSblgGVJDj+iQu3AVOrylaNbdL085+TeTTpLdq/0Veo91UBgxpNEc5pd9rO0ii2NdB7WIwrKSPExOf6gAcGmz3ZNv7PlkjT91dKQJsJqtNTQvVnHK9xmtMyTCWR9FzbP/vJGND/TMe85cUTD0IDa4pT1HKTe4CVFanaesvJO+4mjgCPUS4OaOK3rpfwXYnIWbaac5e4mp/IER5/7Fl6HJwaPxw8pX1onTsISSlHnxwCT7biDD2SWm2hKf2+lPe6109CSKaZ5UYJr5BEDsrrUOTw1b4V7BWs8jP+KTPvjIkQ9Tr+uaqAbR0VamjAk1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSSTaCRoFuoFRjyZ4RqHKYwxgulUdtKd1/oEIFavEiQ=;
 b=VAMFP8LEuQccp3In+2PvH5py5nwBVgs8C4DTDj8/ahODq6S6zkaBg7Lu8HVHSFjuK2YTPNHSyWbZoC8hPlgSEU25c8VhMoYgP0C4G/ivaF7QXy4420PiL8yzHklYHaxIxbr1+F0A3ZNn/VYwq2ASVlkULnDoGEdg5pEaGEKwC0BHP/gf2hfQ/wchiDpydiAHydAPZdStso76FhXOMCjShvqV5KddpQtLoMaP3tPkaqI/U4l/yNV4vPiHacK29zqMp+W9082g43UGpu0jAcbjshdmlBA3WTBD1ADvs3wcZiqKVDf104CjOUrRODcLYknnmVBb+NpR2uBVemhvBtH/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSSTaCRoFuoFRjyZ4RqHKYwxgulUdtKd1/oEIFavEiQ=;
 b=SzWyiYfqr+v2dvhW0awhu1dKAcOPyysIuRGDNJ9V12Zyl8MTCyFhk/ZBYQbdhFYyEtVkpsutONLsnEgMDP7dn9IFVgaqsbMZylOOaW/QVU/QO7H+4hJiqrmgpvwOhtVcObyfvyps+wplTFIo0Zc3bdBLw+ogpbo/iGj9qKiTxZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by SG2PR06MB2508.apcprd06.prod.outlook.com (2603:1096:4:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 12:22:47 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 12:22:47 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Heidelberg <david@ixit.cz>, Lyude Paul <lyude@redhat.com>,
 Stephen Boyd <swboyd@chromium.org>, Guo Zhengkui <guozhengkui@vivo.com>,
 Xu Wang <vulab@iscas.ac.cn>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: fix returnvar.cocci warning
Date: Mon, 25 Apr 2022 20:22:21 +0800
Message-Id: <20220425122223.7415-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0401CA0009.apcprd04.prod.outlook.com
 (2603:1096:202:2::19) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c74186e-fabd-4770-80e8-08da26b64e71
X-MS-TrafficTypeDiagnostic: SG2PR06MB2508:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB2508FC744C357606C71F43E9C7F89@SG2PR06MB2508.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sUOE3h7tWc84LkADNVzWgieXHKYf8Nmy1fOLieQtQXtl7v6iL/Hq0ZfVCKLApxVGArNtJpmIugLvIieGSxmj2IN/lOqnh+FczW+akuAnH2ZlF2B8ez+lx3XHYwLVKfPcNENKMRi6ZJVzQLZLH2EvTvBOoLtFjdznqi/RqP2LaVtJYkWtcsOrfubJ+GIS7aRFl/T+Jvn3CQJ9+acx5BbQKHkziChc6/DVUbqo9XqCWK+VvB8lhOFH+QJEjnftHId1OoCnKZMh+V6v2gTsQzyCdmaRhPglrC3rwYXFX7nQ+U1Gc/AwQ5TY1AtBun1xwOJjWsrwYo/ZafF6qMcfGYAjzrohNH9JK7Npg19Irk/XX7CsEr1Ob8S9GyuwoujVbHBEeqr1gaoBeA9S9HNXpZKgc4Nn9B3RwFUkoFFdhMSMDgnV43rtFIUhQyvHnGR+XkX62WyTOfn+QGlGEnbb98mZQ0/+Z9/tDVatUff797IMUmfKxzssYV337LldzLRJaMjOI3zqZlEtRTA2twwWdNUa9XXYnqkOC9YgJJNoXaBZ1UxvLhst7kPYGbWya2pSSLVaOIXeboqK6D3sHexR7jHYZM6vhMP47BflON8razJPFV92cBX21Y8yUPUdDtkslH8KbUmQpWqPwGeZLXJVAwK6qSx1VQ8fFJUxhWCHUEJobFpQiGeCu/VqN53Hx15u7eIdQGd4a1jcjtRrHKIutMVNGmbetUNO9I5obWq15xIe75c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(6666004)(36756003)(6512007)(921005)(6506007)(508600001)(6486002)(83380400001)(52116002)(1076003)(2616005)(316002)(186003)(86362001)(4744005)(2906002)(8936002)(7416002)(5660300002)(4326008)(8676002)(66556008)(66946007)(66476007)(38100700002)(38350700002)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X/0vhP7D0AqawylAbBWJ0wlhSIQKr61NvtyWcy3AT17VOP8hn0oXcxl6z7Pl?=
 =?us-ascii?Q?C63eaYRIJ2fgR9iYZzsp58fFAMy5JLlSVuQDWx6MUBpswzD6VwSC0A4bcbOo?=
 =?us-ascii?Q?cAeroWVlvLJGG/eSAeNzDniNNAf8rElvRYHWQ80YEE4SgfqkyqTNmBldo+Az?=
 =?us-ascii?Q?MUQtJ1lzZphSJx+JJBLcgHxslzaqmDy/RLrYwli7uV82kj6UN/4/BwUjA/KX?=
 =?us-ascii?Q?qq1zcnJv3SMOLI8sD0qT1FcP5NhtFLYY/r0yr1nztA9DNQSYn3ODStluzqD6?=
 =?us-ascii?Q?1YDK4okVtDxPRHL+p34bmj+5+M1cd5NtVvGrs7FMPYlQrh0kSVnK1bwe4xPk?=
 =?us-ascii?Q?SXfHYHhKsEYCYdPpgEcpXpx57HMSkPV7tdqy2hyJzHJYFCza9J0S4E9S2C9n?=
 =?us-ascii?Q?2i8aSMMUFbiZjbzbb4LTQBfrfWUrv0y9Xx3dEfryQXxOoWYkhc9UHGiaJ/wD?=
 =?us-ascii?Q?Iuh5AqBI7fQhDWo9in5d8k1RFhS9L2vhDsSppSFku7zbgKkp2X+kUSGLGesh?=
 =?us-ascii?Q?cgJbC7auBZqlGin0TUObutzeEi4S0eTkvE079aE0f6jVE816Z4tC0ADzgGtn?=
 =?us-ascii?Q?WePZDuH4uXccoWEfAkn/eW52G/G4XdI2sU7gBuGh/ahKU8Fk+vNKPY6UEvvu?=
 =?us-ascii?Q?90G2LmF8CSj05oXj7zufcnP/6RiYvOdJaKfb+7rDnHh+PSCle5SMh8u+ZKAy?=
 =?us-ascii?Q?90jf122FysBG61vlnbOhi0G2EWCquLLGbVbRyTikCc2TgauIyw3CCkUh0zUf?=
 =?us-ascii?Q?7vJ1plFFLbcYTVXahH3wfOsXz5vEZc2+HwHW2w2YzXD1uvmkayr5r/9zizKD?=
 =?us-ascii?Q?/Ax9IIlazUH94lGevHv21Dn+jPqqIuoI7BOZmHBx38S3vxv8HICchP+V7UvG?=
 =?us-ascii?Q?i5ZuMV4th3WkRL6B8PX6uhInukn5mXPwWK7RQqd2coo99Fp/gKkwV0YZYEOo?=
 =?us-ascii?Q?i42zTsAmBESqGes2krTIMis5rbrOsVl0PfdnwLGlZPppsttJWq/GiYpWtF4w?=
 =?us-ascii?Q?l1E3xukohaD/hTWgr3Emqi2caLpHcTgok4e6x9hXXaieGuD7Zn2HmP59Pqnl?=
 =?us-ascii?Q?UO6Qi0pbpZUl/AuJn0MBruhKM5mVsnoUhprO6dDK+RwdZB0Q7pmkGvC55G2t?=
 =?us-ascii?Q?Ezs83/fPmIlZBPUXMvDGc4a+AdOA+n32Y7RMDWErjmE4WvykOU3+LF2aG5H7?=
 =?us-ascii?Q?V1uv6CCYlHMoWeh/F/9rw9rb8iOKQgpQ6Mtl5Y2pIeKpoXo107CR4GAaUus+?=
 =?us-ascii?Q?8jEl9tPIx5gfd8MF/u8IEJZPRV6vVeWlG5uJiyNeZdfwjcKGn1imzoaeUGFr?=
 =?us-ascii?Q?syzc+WDU2NavoobKYFL0Ub4EVcd37JZV/elStLroUF58ByardPy8QqRw5MKH?=
 =?us-ascii?Q?z43nh8PzbROTCVmn6FpZlFOkbkw5UXLhD9w//RDXiQy4Qz+9RUFwS8kG/TfZ?=
 =?us-ascii?Q?xcoj2ud+RV9keYq0GuEtbDSahjt36MHB+uQbiBPQmlTQ00rH9Cf+oee6YsqH?=
 =?us-ascii?Q?//Nkf35mnE4YTrt5hvbe9KfYNy3h56BPQSJ9ga0IRQ+Pstzac7REw0v6WCxY?=
 =?us-ascii?Q?2ZAm0+Z3R+pgcC6CxpguvWfBxDdlQgwkX7SAez54qdA133R3buYdtpYYmZll?=
 =?us-ascii?Q?z8v6eZiNhY+/sDwepsG8INEHxx9OB2mOw2iZ90YaLxzg0E3GROv5W3orhnQI?=
 =?us-ascii?Q?4n0/sWO7cikfr+14n8bGLN+PMpNgC4TWw8fplVqOl7tBjvyrsjOgTPzV4Yjd?=
 =?us-ascii?Q?3ZNkLftRFQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c74186e-fabd-4770-80e8-08da26b64e71
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 12:22:46.9717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYyuXrqdKmWUPbBVfcudchVQODM3BqNcdIcNNPNqMalB1fM4i+onfU3xDCMkv/Q81sCdiMk020beibI89uNwag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2508
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
Cc: zhengkui_guo@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:
drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c:24:5-8: Unneeded variable:
"ret". Return "0" on line 75.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 3cf476c55158..8ae66facc095 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -21,7 +21,6 @@ static int mdp4_hw_init(struct msm_kms *kms)
 	struct drm_device *dev = mdp4_kms->dev;
 	u32 dmap_cfg, vg_cfg;
 	unsigned long clk;
-	int ret = 0;
 
 	pm_runtime_get_sync(dev->dev);
 
@@ -72,7 +71,7 @@ static int mdp4_hw_init(struct msm_kms *kms)
 
 	pm_runtime_put_sync(dev->dev);
 
-	return ret;
+	return 0;
 }
 
 static void mdp4_enable_commit(struct msm_kms *kms)
-- 
2.20.1

