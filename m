Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D0771959
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 07:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75CD10E011;
	Mon,  7 Aug 2023 05:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DA810E011
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 05:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADg+ckB3mQc6gOxcmx4zAFwo3jd7cTgOK9qlnWJV+HUKysPgF2VhvfdtN7A+gm5uvk/6rIeHjYRgyu6XcrG9/M4a5p6YWhKDZvQ7g3B2AkZqIgJ7mG1W5c6fzve0Nyt+YPNc1i3npGI71T1VXGi+hy3uKhL/iHm3yo3T6cx2qK5YTMRfzYxzE6kXiA6taNCnVgclhxTkx3RNyQsWBxrd8Nh0IG0NxMzD3Bzh9x67KK8RPa+SK58XZJp/IJTYUgIMep4WqlE74LQpid+tTVpjSaRWNyCecUZY6oCnp/5PKfXIQr6zI+k0rONUzJLd4oKLOkDDPp2ZQtGSw8bsAGHThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPWD0gJ54n4Q0L/+NQ3lHFLKq5bbpu8o16/baztsCf8=;
 b=J95hMTz1ra/jtbxiD/ae01k0Y/GXho2rYeUltUR0Z0BtexUsPyr3QGZO5Aro9yAPr7Sn4mV0NY3xFTRjrLuXrml+R3tCW/ObMAQNQDhFIkYiOWDKtsxqLyQ2iuE/5qhP2iLMRsUKRdtsF4/WORh8Sx9F3+LBdessq0kENN0k9N0YkDHp3eU0fTeEMgrXq6sPG2YnrBs7IlA2v1fd6o9JXxtmM/RB+bkJO4VQAxmbZx3FRjGLudSQmzIPdLTiISTDA8Cn9/N2Asd+71etvFkiCsbbrSflaicAHkblrXJzu3XysRFCGsqv7L+9MDHgxKpdp28cQM78WxspS1OzW6f9ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPWD0gJ54n4Q0L/+NQ3lHFLKq5bbpu8o16/baztsCf8=;
 b=LL2lyY+lr9Eh7H7vWO0V0BGcYluOh59uNubCT/vPxwBHytneDwoxX/pJkLSl3vFvxnRcrF3uPiFa5kmBt5wxb+WlHAnxL1YZiG+A8gUshN2VuJ2uT8wKLO+X1hwk8L+VsPbltTlU3Y8VPFL68ItN3Ha1a8iCT56rH3/ldCUxtWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9701.eurprd04.prod.outlook.com (2603:10a6:10:300::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 05:21:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 05:21:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Date: Mon,  7 Aug 2023 13:25:59 +0800
Message-Id: <20230807052608.3038698-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f06593-244a-4266-608e-08db9706311a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yiz0e8iRPzUDwn1bxMjuXN8cA+0BdLxPwuAMRfWfB1w2K1xNx1UtgJZk/wC/hDAh9h7gQc7IlGND7zG/fq/9Qn9T+1jNQXSxt3Kh6mpbPBnZmmAqPc3jymm2fDh6WHTJLIt6em8VngJTfHQn36vEjE+HGeGbnIlRgleRJERWVqMdXkH70aMkj4WA2iY69/bXdygfO2N+3HiH2HXptY12FPy5kz2VrSfdeH5oOR0g1OVTPx/7k2NOZ28adpStXFic+az7XsDOnfcM1y8XUqpQjaxfYyWcwBmLlgJ6wTbqiOnlJP4W2CoApx+BaiQLjhxGpzW/S7nC1kSeIx4HuSXJVS91M5I5zw4j2RMcTisPkGRDfpCXLeFewBxmQHkVjW13SBWNcUpaTkCgkzr3YpH2P7SAeBWP6+aFkGvhfEpTGs807gH/IIwXwkDngA/vpQQeFDv8mt+NrmH3uWeysheXe1urhtq2J/Ry2+URpzCfwwC6IYjxrPY7LXVMQmpSQiWooLXeOhak6hHqt5YVaGZHG70lh1Z3EzK0IOV3uc7mT1rGYjOmrubYzs8DILKNnJihnQw6W7ttBWZMo4GJnJMHLj/QKKkKvb//KpRBtGDxQwnIdrdLuTVOjam62pJ2G5qw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(1800799003)(186006)(2906002)(36756003)(83380400001)(5660300002)(2616005)(6666004)(52116002)(38100700002)(38350700002)(6486002)(66476007)(66556008)(66946007)(6512007)(4326008)(316002)(41300700001)(86362001)(8936002)(8676002)(26005)(7416002)(1076003)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/0YJESaeVnlL0w6hF/WG8TSf71SzT2LrX6704NmFI2kzM/18kxdHpeX3mDpQ?=
 =?us-ascii?Q?cQKECBgDGiaqx58UW7luq8U1blykOdUFONu4alfQZjdkU0ddKPySktFLzKVq?=
 =?us-ascii?Q?pwF3FJ8SClhJLp9knYreorrVY1YLHl0bshPJcC53cxgCvWA7yGzHRrVvt4xS?=
 =?us-ascii?Q?Y8lgTOcsmH/wFuBVWqlnnH8GOIh2F4qCY6znJY1ZevdY+Jm0RltEv0OBoQCP?=
 =?us-ascii?Q?KHir6XtuZpRRUd2BpPtZ140O1QFNVwxROu9B2PzGIBPhV4KpV4HyknHLXhP3?=
 =?us-ascii?Q?OUe0MLPky3DDtsj9OzhFdqEtChql+pP2HSYPpcsLK+3zJ/McJwZIO6MQs2sJ?=
 =?us-ascii?Q?KFlNNqh6wb7GG4vfs2XTOA0Cdxa2yoWu7W0smEBDNjqIURAdfkGk7qQ60aEi?=
 =?us-ascii?Q?VNslFXoaXfsdAx10ZtMpQkMNmMmmKvuOTUyCPwwdCqNyN9+4GW+JWO2Pofb1?=
 =?us-ascii?Q?bf3bLASOPnkZkMjRk0/famytdU7JXI/XntGk4rULPO9XsZiKmgzM98fU6bI4?=
 =?us-ascii?Q?83CJJ5w6W77vCinWv1dT8pM3s/UYUo2o8/itBrQYgEE2kKoQg/Lc56AFQ87O?=
 =?us-ascii?Q?Ybw/+MziuEZQVAz8rPmBRKGIF720rQ6OrGOCeX+OqvQ7R4M3DIWLfvKRy4Vu?=
 =?us-ascii?Q?IaS+GS7Q8p9/s1Nv6VYBjniB1pg+9/oF5d3StM1Iiu2XH+4Tvi2HL6ZtkPM6?=
 =?us-ascii?Q?p3shajHjdWEIwGgTJ/F3vQB8aMXWDcW/SvyO3DsDby1mU/rsrXNx5I3L/e9v?=
 =?us-ascii?Q?maBq+1GvP0pRTnNRMHnEWTwo+EYtBZyGPI3I2AxBr7A3OOvlnCMezGS5qkJS?=
 =?us-ascii?Q?Xsc9DzoisPGJjG61yEHwNRQW/USqUGliZJp+Fht4RubFhM0TUNqjG8Hrp3ek?=
 =?us-ascii?Q?wAcHpW0jKff9NDgKcoy8oVjP3cNvMcKR+ejbtN5cmgb6D4ZrHwSVPJdAmqdM?=
 =?us-ascii?Q?JMILk+WMhkxzCpDEH2hTgmPfoUEhAkgJgJNC9EP0IjXGOYzu0aIrGCXF16km?=
 =?us-ascii?Q?UIwRuFYcY+v0evei2YxpA3c7mvr+/SWpJwkYUrOGgPIBZe9NC7+HbDE5IECB?=
 =?us-ascii?Q?ZkYzAxxGhzzNNYE9j7GskwKeLvuyJPXKVOshSadDiiE33oYS4hZMX8U6AcQ2?=
 =?us-ascii?Q?mppMus6B73p6D7cEYhl5/stJw9DvQu6wzEcwRHsAfiLIbGjp+NKqvLaTTCqu?=
 =?us-ascii?Q?a/0QLCMPveXR8r/w1HP2t2AQfXRUC/fAdlDBnFWcQlef9SMcZwn7M5rRiPpw?=
 =?us-ascii?Q?Jf2zN27ACa4XXpDmjrBNxW7UaFwZDPDP9M2JsF704PjKdJzFycQrDOenPSdJ?=
 =?us-ascii?Q?Sb0EWsPgje09wnyfoPsihaRkq0wHn01+8F8LiIHpTqSxe6UY312FLkmFPG/Z?=
 =?us-ascii?Q?HYa/3j08/aj0jWm5NGm+fj1354lRnqXqPGssTXwl4mThujzTNFrrdwANpMUo?=
 =?us-ascii?Q?kkHB2fj0IMJWJUH2UXGIAKhtgrHFGF/7/nIHFiXy5sWIQ+3GOI7IqIiJp6xw?=
 =?us-ascii?Q?BVgAvbiIjOqIOtq6UWj/m+WunbnFwEpGfzOx2l9oyz+f4lgBXxtovdpsV7xu?=
 =?us-ascii?Q?J5USgTwtmNDNxlW99ZAFulyRu0x7dj5eO0RBpPyB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f06593-244a-4266-608e-08db9706311a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 05:21:45.4852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4+nkTLj/5hezfgGddvNk69N7mP4ROTUJjDoAt/CKRTr84nrGDlnQ7rkW9517+ls50cuHDxxViXXk8MWyy8hbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9701
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 zyw@rock-chips.com, rfoss@kernel.org, sam@ravnborg.org,
 raphael.gallais-pou@foss.st.com, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, linux-imx@nxp.com, conor+dt@kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yannick.fertre@foss.st.com,
 hjc@rock-chips.com, philippe.cornu@foss.st.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series aims to add MIPI DSI support for Freescale i.MX93 SoC.

There is a Synopsys DesignWare MIPI DSI host controller and a Synopsys
Designware MIPI DPHY embedded in i.MX93.  Some configurations and
extensions to them are controlled by i.MX93 media blk-ctrl.

Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
bridge helpers and implementing i.MX93 MIPI DSI specific extensions.

Note that since this series touches the dw-mipi-dsi driver, tests are
needed to be done for meson, rockchip and stm.

Patch 1 ~ 7 do preparation work for adding i.MX93 MIPI DSI DRM bridge driver.

Patch 8 adds DT-binding documentation for i.MX93 MIPI DSI.

Patch 9 adds i.MX93 MIPI DSI DRM bridge.

v2->v3:
* Add Neil's R-b tags from v1 on patch 5/6/7.
* Select GENERIC_PHY to fix Kconfig warning for GENERIC_PHY_MIPI_DPHY
  dependency in patch 9.
* Cc stm and rockchip folks.

v1->v2:
* Add Rob's R-b tag on patch 8.
* Use dev_err_probe() to replace DRM_DEV_ERROR() in patch 9.  (Sam and Alexander)
* Use dev_*() to replace DRM_*() in patch 9.  (Sam)
* Fix build for arm architecture in patch 9.
  (Reported-by: kernel test robot <lkp@intel.com>)
* Improve error messages for imx93_dsi_phy_init() in patch 9.

Liu Ying (9):
  drm/bridge: synopsys: dw-mipi-dsi: Add dw_mipi_dsi_get_bridge() helper
  drm/bridge: synopsys: dw-mipi-dsi: Add input bus format negotiation
    support
  drm/bridge: synopsys: dw-mipi-dsi: Force input bus flags
  drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup support
  drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate
    lbcc
  drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane byte clock cycles
    for HSA and HBP
  drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and LPRX timeout check
  dt-bindings: display: bridge: Document Freescale i.MX93 MIPI DSI
  drm/bridge: imx: Add i.MX93 MIPI DSI support

 .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 115 +++
 drivers/gpu/drm/bridge/imx/Kconfig            |  11 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   | 917 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  91 +-
 include/drm/bridge/dw_mipi_dsi.h              |  16 +
 6 files changed, 1147 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c

-- 
2.37.1

