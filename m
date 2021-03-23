Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF663455C7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 03:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5176B6E03B;
	Tue, 23 Mar 2021 02:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D21C6E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 02:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh+F54Lf4zYfRXGBscKkVE85XV8nUZBb3AdM830lGFBiQybRPBf2XTPXr1szz2B4Wz1U/XlTT/CHgYz1J52IezSLA+Dd0JpdDkqCzCnn1l0gkCxRgOpEaJNF1nUj7gFdX6C93sRTo90B0KxekvKtSu+bNpMmTAIlD7Qtahd+fLDbgZcxkocpQnZNZWQFN4APjWj6xsZl9GZuTo3dk/ZCnRCmDRP2iFgJqLNXqR37QqFfVm6sq+y+/v5dRnr04x5VXhBmidv381S9Beg/Il7vU3TtDskvsho6yLNDd+hYJCZdP2YSKuKWKu/ZFlPw5WgFnwP6x0xNxHMjEP1FB97oxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz4gPygJjBszY1pwW6Ip+u9XdI0w/fmAOLl67Aygzqo=;
 b=bJW15t3q8+gLx6n3GuZZY0WIIMwMu88b1ldmpzjcSNcg/1zcmNu2fYxLUZTCMTuu3gUCSxxkEc8ec9Kc8D/thEBAik4kur9J5Qu52wmQmvTB0D7zXIAl1yIIap8xP1yQEfb+Z3R2BhBObapTcLeuIjculIqlVuc/f+/j5DO/4R+j2u8BL/XPlol7odLZa4UJdzEstSwF+BDGFejSNFeom4QORuU5lBQtDttleiwy5/WgIeMxD0IliIMByLzCtSciy7olI/JWpeiKD+6VZO08oprJPc8uFgs4Tan5OoK+dZ1BFx5mSjDaQct1yljirbDC0+96GVtIDhmtjHlXe2pIpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz4gPygJjBszY1pwW6Ip+u9XdI0w/fmAOLl67Aygzqo=;
 b=UckuP0j+ihvwk0a4ieg/1HJmuYIbKSmlxOwTWMuRSZCAXDiFBcF9EvPNdvzwQLwtqOnC4P8aI2p1Os+aikmugk+azCFFp243BrMDcYzVDlBOZ5DEBGgAgc5ZaYlJOvUGc5OvmZ7g8IQG3yUWGMBhxlBIaEGDhNc5yXCONfc7Kjs=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR1101MB2103.namprd11.prod.outlook.com (2603:10b6:910:17::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Tue, 23 Mar
 2021 02:56:04 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::d4fe:8135:d8fa:81c0]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::d4fe:8135:d8fa:81c0%5]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 02:56:04 +0000
From: quanyang.wang@windriver.com
To: Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [V2][PATCH] drm: xlnx: zynqmp: release reset to DP controller before
 accessing DP registers
Date: Tue, 23 Mar 2021 10:55:01 +0800
Message-Id: <20210323025501.1568039-1-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qwang2-d1.wrs.com (60.247.85.82) by
 SJ0PR03CA0265.namprd03.prod.outlook.com (2603:10b6:a03:3a0::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 02:56:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acaf1ad5-7e42-4cfb-b160-08d8eda732b6
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2103:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1101MB210311F17B9BB06A20F44533F0649@CY4PR1101MB2103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+Jtt1PWTVdqztFAmGHfFa5MGzBjrOgAlg7q9WKssMoIE1bJUFGJ5QlHDjSPu5vd3raDeqzQoxfyuHxM93jloi3sXWXT+draha0HuFFiltR0vmroj3GVteTg4j19nZVPCA6EiDV1QQ1WdoCyO/B9XadwlAHHqyf/KUcqvdBaHXBPw4ys8yYkua4q576/YTAQV+5TindKgPClMHnSwpGrswVT/E4a3u9eN3pvllbqubKGX6R2CYALqGArLEb4woG3jcEHS8gZDSvdT5io/nq65sw4oR2Z/ehyM4LMaztZV3qxy41Lrl0fYNE7ySP97BfMZxf9BT74VsCyyj7Gfyt6jhYt9jZ2IqrzWqjxk61gl5qqfOY+FPsIZLjKFACO5kmhWwyKrpONKptbZ4K36YUnlqPHaGMNvqiwGYSe1GD0i2eLbqoLA0cjnZFSw0gyO7ngLnd/ywJVYYlMT1yHX210Jw55JuTxf5obZs0KjEmlZyUBALhKEJikBLsUAa+7M+VxtgLuX54QvngGRyNT+4rEUsHQOsob8cZy2TvoeS1w9xFeJaZq4xCrVDAX/eI10bfPUEcTvKQNgNZjcMnYXLEBXK+9NRBPdXCS38KVqETIhzWN7U1/Z21JZB0idqjeKZ06+TF/ZLqxsKbPVqbLzc9N4BtLQW9s6sIk944wVm64xno=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39850400004)(396003)(346002)(2906002)(186003)(8676002)(66476007)(66946007)(16526019)(4326008)(316002)(26005)(110136005)(6506007)(36756003)(8936002)(52116002)(66556008)(478600001)(107886003)(83380400001)(6486002)(6636002)(9686003)(6512007)(86362001)(1076003)(38100700001)(2616005)(5660300002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zlA9HrZ+TYnm4E6Q8uVtlqTWxkULVu5sy0Wu2Fbmi9h48293DRhzOz4ZnQVM?=
 =?us-ascii?Q?YqLV+WQ3p1f1zszbSBNpITNneV+0vbqxsVfzbKdZ6MM7DwjfrHcmDWJUiFjy?=
 =?us-ascii?Q?5o3O3K3/JfT06YSsVwgb2TgIfgyQxhzxTxfgOxJKBCLYu+wSBWFb2lKQ2kSu?=
 =?us-ascii?Q?xQ56CnoStCHyBBm2gl26MpMGhdoP18O/7sbs2FBjSyCn+Ph0w1JOPsw4ZKda?=
 =?us-ascii?Q?lsRZXcoQt1H4+evCThuXPk8rR/+sg40bpDwMYz5NZntB8Rgh783L0I8uTFIL?=
 =?us-ascii?Q?gET87FCTjKYSi4YDW6iQ8dXXqrce864eTpezbml6FTODZiIneNpgj/kD5bCw?=
 =?us-ascii?Q?HkNBq31Rw2HmvLoDZZhq4VrAYen3VkgVf+A7bNOgoTkcR81RgdKGlllbpWEw?=
 =?us-ascii?Q?I70eZHTKKcyGNHycs2kuVl5w4MYbsT6b+HnYMLKFEANtqhglQM8ysgt8AuGe?=
 =?us-ascii?Q?78ZRYnm03Xl8V6r9QIF/dCIagMLp5AlUuaXWf+zs558oytGiRLjY+BTEI1Mz?=
 =?us-ascii?Q?9Ef8uFrfSUv2JFJ0vHfRA8CBpzQ96NmsqPrpY5cvaGC+txnjUwR+QfLZhSuF?=
 =?us-ascii?Q?BfU2n150qJtkgroVDpAX8Gx2zvuY5/TfJMLFuwLBtXSrqtwztQfjHoCMjkR+?=
 =?us-ascii?Q?0082mHedahkkkImOiB5wq2Nadg5Ktb006V+M4YSNQvOHGSU0TtNGDddziYer?=
 =?us-ascii?Q?QS6OvI2B4sBMswyuREEEQLrfVV+Yd5KPpdC2GwQPe65gaywaoUhHRUtKKfnc?=
 =?us-ascii?Q?goCBf7UAIfEXcQtHKLxSJM87+OGsuXVI9tKTxdGBFfHxLzHzRgaN1QK73RmQ?=
 =?us-ascii?Q?ZC4AAOnmQ3qMETSDuF7lsS/ficF3ROJquN0LYelWfvoRHb/Ab+qe2g+1Zzd4?=
 =?us-ascii?Q?dNjM44KaPjvijPokRD9XacsW4pK2EfeZd8zh7Btm7TU8/WtryAbvQX9mSZya?=
 =?us-ascii?Q?wrax7930jPArjnGG3Bdfe5IyKj6+/FDZqlBYwjABasSwyeewYVPyejXgNpBA?=
 =?us-ascii?Q?EQs/EZU7i/KQZ7G8c9McTl7Kq6QQTaZzvA5geBIaEIUZA4BzrZrj8LLjwdm2?=
 =?us-ascii?Q?jg5U22TKtbBuWRop4q5zNVCaBbO/uhIFO2+7Q3IUYeid22eBIXYgiYLjsxq+?=
 =?us-ascii?Q?WY1xdWtyd3OrU+O/DqWM/difG7ry5PlYUlkHfKb+MoaWOBqWJXlI7OPn4x5q?=
 =?us-ascii?Q?hRgJZ0iilzQnu2z3E9nqKWZ4quERbyq02VMVgZP2Tx6edETGJjr/XmX3NRbd?=
 =?us-ascii?Q?s3gNvzH3ZQl9l1CEDmZfvhJNrHAt2v4l131pK8XiM0SYrjGh0gUHckf0SF6v?=
 =?us-ascii?Q?qAnWGw1b99ZS8mzSKNt0AIKj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acaf1ad5-7e42-4cfb-b160-08d8eda732b6
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 02:56:04.6815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTnerT0NYYhs61r4xdWmuP1Wum2YfQoXu4tw489LTyd+TSzP+ehO9DYZya6wi6SZMWZgjAE+wKSTObZxe4p1A6mp7xgYca7WwrLLpbLo2sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2103
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
Cc: Quanyang Wang <quanyang.wang@windriver.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quanyang Wang <quanyang.wang@windriver.com>

When insmod zynqmp-dpsub.ko after rmmod it, system will hang with the
error log as below:

root@xilinx-zynqmp:~# insmod zynqmp-dpsub.ko
[   88.391289] [drm] Initialized zynqmp-dpsub 1.0.0 20130509 for fd4a0000.display on minor 0
[   88.529906] Console: switching to colour frame buffer device 128x48
[   88.549402] zynqmp-dpsub fd4a0000.display: [drm] fb0: zynqmp-dpsubdrm frame buffer device
[   88.571624] zynqmp-dpsub fd4a0000.display: ZynqMP DisplayPort Subsystem driver probed
root@xilinx-zynqmp:~# rmmod zynqmp_dpsub
[   94.023404] Console: switching to colour dummy device 80x25
root@xilinx-zynqmp:~# insmod zynqmp-dpsub.ko
	<hang here>

This is because that in zynqmp_dp_probe it tries to access some DP
registers while the DP controller is still in the reset state. When
running "rmmod zynqmp_dpsub", zynqmp_dp_reset(dp, true) in
zynqmp_dp_phy_exit is called to force the DP controller into the reset
state. Then insmod will call zynqmp_dp_probe to program the DP registers,
but at this moment the DP controller hasn't been brought out of the reset
state yet since the function zynqmp_dp_reset(dp, false) is called later and
this will result the system hang.

Releasing the reset to DP controller before any read/write operation to it
will fix this issue. And for symmetry, move zynqmp_dp_reset() call from
zynqmp_dp_phy_exit() to zynqmp_dp_remove().

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---

V2:
According to Laurent's comments:
- add zynqmp_dp_reset(dp, true) in error path in zynqmp_dp_probe
- move the zynqmp_dp_reset() call from zynqmp_dp_phy_exit() to zynqmp_dp_remove() 

---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 99158ee67d02..337adf0769ad 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -402,10 +402,6 @@ static int zynqmp_dp_phy_init(struct zynqmp_dp *dp)
 		}
 	}
 
-	ret = zynqmp_dp_reset(dp, false);
-	if (ret < 0)
-		return ret;
-
 	zynqmp_dp_clr(dp, ZYNQMP_DP_PHY_RESET, ZYNQMP_DP_PHY_RESET_ALL_RESET);
 
 	/*
@@ -441,8 +437,6 @@ static void zynqmp_dp_phy_exit(struct zynqmp_dp *dp)
 				ret);
 	}
 
-	zynqmp_dp_reset(dp, true);
-
 	for (i = 0; i < dp->num_lanes; i++) {
 		ret = phy_exit(dp->phy[i]);
 		if (ret)
@@ -1682,9 +1676,13 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 		return PTR_ERR(dp->reset);
 	}
 
+	ret = zynqmp_dp_reset(dp, false);
+	if (ret < 0)
+		return ret;
+
 	ret = zynqmp_dp_phy_probe(dp);
 	if (ret)
-		return ret;
+		goto err_reset;
 
 	/* Initialize the hardware. */
 	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
@@ -1696,7 +1694,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 
 	ret = zynqmp_dp_phy_init(dp);
 	if (ret)
-		return ret;
+		goto err_reset;
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 1);
 
@@ -1708,15 +1706,18 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 					zynqmp_dp_irq_handler, IRQF_ONESHOT,
 					dev_name(dp->dev), dp);
 	if (ret < 0)
-		goto error;
+		goto err_phy_exit;
 
 	dev_dbg(dp->dev, "ZynqMP DisplayPort Tx probed with %u lanes\n",
 		dp->num_lanes);
 
 	return 0;
 
-error:
+err_phy_exit:
 	zynqmp_dp_phy_exit(dp);
+err_reset:
+	zynqmp_dp_reset(dp, true);
+
 	return ret;
 }
 
@@ -1734,4 +1735,5 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, 0xffffffff);
 
 	zynqmp_dp_phy_exit(dp);
+	zynqmp_dp_reset(dp, true);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
