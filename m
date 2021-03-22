Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1922343723
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 04:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9739F6E07F;
	Mon, 22 Mar 2021 03:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF186E07F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:10:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJZW1QPHcN9HGt1zpFhwM0FZ0z1+JlkKN5p0knjc2L5nsPLE6IjT+jn/glQqYd1YS/Wxr+IYF7U2NuNE+Wz3Q5SZlTVt0BbrFvPI7g4lddUcCQuC7f3KDLVjxD3N8IOxq4c0ehyUbTcTV3PvskJw0mR81126p+/INk7DeOiDSYYsRaULl0/aYCJCg76Dg34KcDCYLROfdRILWWWzJtIBiTqdwHbkGU5SDMWcNitUYIBzuLpbSe6WsbBf1PxIa4BIEkip9F2RQsI/xtS4NNgL1EdOR42Z+wwxpVga710pyqwfLQemTlQV74DpuJGmL2dYJWB5aY0tcXkAyjpozrxOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HisUy3DlxU5C6XYQMN8vXSSh5kGk81/deVh1oOf8dgw=;
 b=ZL6TmtFchSDvLsdPz1GalPJ8eMdPz0nzMwzt8ArJ2VV8Ssc9Mvgy8ENrQSKoqXVyGpsu9hrsip8Oxc960vhRLROykbfDkVNihCz8JQ6sFQMbIjsQCV+w0bGMyQ5G9XX3hirb8IFIajYjLeeFD0oykD1FiJORLk8cQPbwHyJekKDI+RhgsmZMtZIhkPh/OJkEY8ygcg2GAFI88cNM9lvgOcreayTDeQ+o1fhc+RLWxVY7SnYB7+73mTsqg9x9m+xO9HN5eRcOus3lholvAhicmAjPAzEaDmzkq6+VM/N9U17ywtf3On94+X7ux2m7C6svcJukLVboO1JtGuiGTPxBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HisUy3DlxU5C6XYQMN8vXSSh5kGk81/deVh1oOf8dgw=;
 b=YILuJ/oLe5ms0dOVgytET21TyrD/X5NTbvOjmNVWXuINXHqVFlu/ou4/F/MPzuS007wNEIbc4Cl6k4IHQ0CGd1DcMtmaDl9cSwGriaA+fqal/y3UZXbtrmuKFKepOA2OXpWcB74MEAkyimhSg7OvJSWUZScFg56fJs9tTekAUBY=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 03:10:53 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 03:10:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: imx-ldb: Register LDB channel1 when it is the only
 channel to be used
Date: Mon, 22 Mar 2021 10:56:40 +0800
Message-Id: <1616381800-4862-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0119.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 03:10:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e52a63d2-cd62-4b84-37eb-08d8ece019aa
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB297598B4A5962A0195672FF698659@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUPP0brjvVkQm5SXrZnHYAOeRQEs3Ku1yhV93kptfhR28m813hZFCCZflDTjvkvTT4H6//kBorzx+HjkDsVJ6ugTco0SfbJzNdI9qdNc0dRBdSOp5IHw/E4G87KKzynbIKEqVOTGwPXIgnTL9ZQi2r00sH/wl6q4kqHIkNdZP4WaXZZ/DgYcQq+HFUO2p/b46lZJFZg8FkJ1ORDaHZUAOee13LE+hul791pPCvzOGHZbl3WB597FkdtDj930U3KAZZ8vlMFThLQO94YiPqiIzRy7HqlsJJaEyEw73xRxnIuDIf4p0kmrhsmKAQC7WZjcnb0UQR/8ZxhAJU9iDc5qtEaKapcUkgG1tpFXpA+sIo30IW4zaQlQeG6ntn+yNLUxfLOtiaJJZi1/FHkLCD2k8XT2l4iD5EWcAztOjLOcT3drGWXFWuzktRhBBOCsmLi66W7e2jYNutkjG8lfUX2vhLBaVvVm7kzl+QYjrWDvxMnE+oWgDJhkdR+PYpx7N0lD4AlPETXguSObhlMXiTstTT2D9sm3uo74ykqvTZJOAP6bUk3DxcF0BjShwT/XYysYvfwGOdT02T7mpMGUQ/8KrAeZPdAHdZSVDtNWa0N89ax5y9jzgxYSyJydCQdEVPGOPw/tCZR00r6LZXYzLt+yJNVzAxcxlLAcbAjDC8SuADEVccggXybgNAZ+A3GJYxnB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(8936002)(186003)(69590400012)(86362001)(66556008)(478600001)(83380400001)(16526019)(6666004)(316002)(26005)(5660300002)(66946007)(66476007)(4744005)(2906002)(52116002)(36756003)(4326008)(6486002)(38100700001)(6506007)(2616005)(956004)(6512007)(8676002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UD5OE+WWtwRFysQGlWJJVcgCv/QlWAulKPjVFXHoDgL/Z69YtR3RII8UZhMF?=
 =?us-ascii?Q?5beH6tw/e4UkgZxGEmyFtpgT+kZSZxsSfhe6VLc6djLKE3NowQmSnK0IaTFu?=
 =?us-ascii?Q?V9WLsbD88mpr8rB0X4TmOxaMhdNCOsPf+pt83nwlGCmCk3WPJaH80E/4fS+1?=
 =?us-ascii?Q?N/y2J+w1g7k6R74+PfSp6MAQ+cIWIIFMtc+2IRRFdzaDoW97b550TXfphP81?=
 =?us-ascii?Q?xgbyJLW0K8j3aYArFICUWUVqPkF8ceQq4/xJVFrF/eDuG9wZJBDJsmBW/cZn?=
 =?us-ascii?Q?Cut4PYmY95C1jVebHs10o+uPP5zl+PE8B+9z+vTfj7F1mvi5hlFVXsjna4VB?=
 =?us-ascii?Q?HqpCbsG7ILrTEh/RLO4OMLkj0wtAmXitB1wY/1gXJyn+rjpFfzsG2TKmEqFm?=
 =?us-ascii?Q?ejjHKPPf5CiNVMQJ+Xp0c0ZW/o9HasPEiet+FBjK4iZ+tIEsoWEF5ROm+P5B?=
 =?us-ascii?Q?5wWuDL5QJPUOaDXSAb+aMrZh5W/BPB7JF2XAj1070CZwYRSWxJooIsVF4hue?=
 =?us-ascii?Q?n00CfD6vgjmPQW0dJL0xNhsaZFmRlF/5f6kfMdJomk3JgTYjbftPVSS8ZpPn?=
 =?us-ascii?Q?rq1x6+tZ3IbwB8H3Sk5HqVOx4yEtQ8MtxCINxiJ9oTwUF3hgB9h6V+PMvrV4?=
 =?us-ascii?Q?K8s1lVwce2AMAtPJxK6LZRUOuTTVkyvkkZ6N0x6jW6W5+W23eehfnTOz0poF?=
 =?us-ascii?Q?Egg8ox4NoqeDv4a9LGjWkeISJgkeTgqShoFEBMIqhuhChajxqFyIScb7Wqud?=
 =?us-ascii?Q?YBNeiMuNwTks7kM4d8A9jwp3f57W2lmhB7DkhSgJViaWb7ZJcgqANA2CNE6i?=
 =?us-ascii?Q?hDkOrr/oCzCvP152R0StI9X00VEP2iiQsmAyy+0PZkIHzRBfW6lN0/ZaZ4Ff?=
 =?us-ascii?Q?1ODJehIXB8TXEEq8EVPstdTm6GJeIkw9wszjGVHP04f7/XRdUD4RHCTWlvTi?=
 =?us-ascii?Q?MGVJ1phV2bIy0byv8lQbgNLmap7T2ixkLwx8N5d/yugx4gp4Pl1yLlpNPDBe?=
 =?us-ascii?Q?JEmjhO0oNs2Jt6K4pyWbIsyp82xQlMBhudnZtcQNgTP9fb6tsJALJOZgiUYn?=
 =?us-ascii?Q?d11XuVqGlzmnDwzE/j4w5x7d6ZKFyQdI0judFAl0Z2UynWR7E20VP7rFau1M?=
 =?us-ascii?Q?rL7kEVUsViJUpv8N9jTJN7vPq+11Z7MaN576bS6jD1dT78uzaVwV7xGa/xm5?=
 =?us-ascii?Q?S9ONUJmkf80DauY62v6is8JBk9jSymv2eE/EqpcAF2NyfpesKNMRE5Id2qN8?=
 =?us-ascii?Q?hzAa4GrAbwwwUK/xjKhb3BgJdAnopMVaTBumyC/vXKOswz9DsRJE8ba2W4b7?=
 =?us-ascii?Q?q6oJZRd9X5DhEX4WenAjrGWk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52a63d2-cd62-4b84-37eb-08d8ece019aa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 03:10:52.8155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbM00qOVRqJrLGNpZ6Ol/UPtGVZ++diMs/+7fkGVATrBDYcehi2p0ZPX2J6bpA16xBkYmS0I0hCzeZV0mnEsLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
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
Cc: airlied@linux.ie, s.hauer@pengutronix.de, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LDB channel1 should be registered if it is the only channel to be used.
Without this patch, imx_ldb_bind() would skip registering LDB channel1
if LDB channel0 is not used, no matter LDB channel1 needs to be used or
not.

Fixes: 8767f4711b2b (drm/imx: imx-ldb: move initialization into probe)
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
This patch fixes an issue introduced in v5.12-rc1.
It would be good to fix sooner than later.

 drivers/gpu/drm/imx/imx-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index dbfe39e..b794ed4 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -583,7 +583,7 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
 
 		if (!channel->ldb)
-			break;
+			continue;
 
 		ret = imx_ldb_register(drm, channel);
 		if (ret)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
