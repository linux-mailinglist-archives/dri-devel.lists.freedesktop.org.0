Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A657CA4B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 14:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1448A2B8C6;
	Thu, 21 Jul 2022 12:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130079.outbound.protection.outlook.com [40.107.13.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17DB18B8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 12:10:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/GlGgsb2Q7pfn5agCgznbPNQn2VBds4hDAhb/l51BB4OI+z3D9QGhdF4McjGwmdI9T93i9f9HpOOC7gqmXbkLD+yoJoI8vDla234A2i6x5KszkYAAJIty6kuCd3nrkk0MoZperwpVBzkus5DfuQwAswYhLMsxDkQVzTeSSXCad6fl83k4zkv5be4yNGTe6L62+chD816r4smfDdv8CXVGFnSwQ7FDYaVW7Kehy2hfqo7Yskzyk7ri/XPTR2+gvHfMabaqq+DNy0OqjoLq/iXbp3+E+9Un6ePYrGDu15D5eq24HKhK+CcggflYXVEMIPgH1PWWqWDW8HzMb/0IJqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1XX7NJNHbbde85ODGHPMEobrVrS7Tr3u/qkhNMsSjI=;
 b=QtHl/a6YyqJrwlbyt5hR5Yl/Jl0v4R1WClT4aK4g+35k6xXb1VGO8hK76I5Aq5YuBsYjEk6/+4TbmLjAqci0+QhHTRKncPQQWwcQ3kHtx1ZfJPlpJ/E6fDy3xac85ElLg1I2+AE6K2vFCputLAkPmjVsYTMa14rKLd/icYPjxbjtgObs+9AyMUt4K/rJgK45oAK1MMZ9SxKkH36iYv3S+5AnbJ1v5UynO5M91GA43RcfTo6oJ5CPYVVYcxgrf637w1r1cp0q+F/h6nJZzYQrAG8hUDUPZu3PJ/G+9iEG2Br7hubkXhfvPM/Og7jtr4zJiJAIrYmkXXEYv6zGAMq9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1XX7NJNHbbde85ODGHPMEobrVrS7Tr3u/qkhNMsSjI=;
 b=AJv1p3bijzQOvhIbZtmuS1vo8AVrPGYaP8Z160QzlV8NFKz+VUSSV67ZtxZRYIXzh4fnrkSnw1xJ3Z7NdsXYzdeA+ZgCEbdsxnH98UOpkisdOUY0Bwe7yccQDb1I68V2KAsxPMWi/s3ex0BXKrFykapcM7JNjvQ0E26nYmsfYnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by AM6PR04MB4791.eurprd04.prod.outlook.com
 (2603:10a6:20b:3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Thu, 21 Jul
 2022 12:10:02 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::95d3:800b:30e9:603b]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::95d3:800b:30e9:603b%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 12:10:02 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/imx/dcss: get rid of HPD warning message
Date: Thu, 21 Jul 2022 15:09:12 +0300
Message-Id: <20220721120912.6639-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="us-ascii"
X-ClientProxiedBy: AM0PR04CA0116.eurprd04.prod.outlook.com
 (2603:10a6:208:55::21) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93bb614a-f3d8-4a0d-d8b9-08da6b11f05f
X-MS-TrafficTypeDiagnostic: AM6PR04MB4791:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWEI6oFBDhtZ+w8kwl+6TEYXHmuM5BKQd3cRLzGCo+Qxu3FQrdD4BodBlnIOD6Mp9le7c87XTCaxzQV+BggtSlAl9rVYC9zgcxA3JsaTPUhwwpKPA3GgCWzB6QbHLB2JfLqIpxI+jZ1TnRlM45cXushyhF8MWXYlMkTW1Yb8uidSFsia0Jpt+volLSC3H6C81gMbxWMMAXzoj3m9Gdqu+VfN2b9QajtoPSV+NRCVNgkfD6TB5N6v/eBEfO6hmnEWMpCP49Sq4Y0s7QiSkTmasEjQn1oqvzkBHFqiVA/8TTxlaesCiADOnnWZE/NMC4jLgQfXdUwQW57yQgvs/ct/HwMEk7yMqKc89m1DRAEYZbpMZ0vKPG9DQwN84FYtiYNbB8tCl8VqxQqv8VTVdquByLzz9uFmfgycAziTVT6FZvgucMtE6VfW1pQMdVSgsKe5pSeYem6v4gxghvqLA602H0KWzF9Zg49+OPvo7cwJGk7rklV3JqkkodkzpvKPBlEGiyAKIzKmooUGffmvSqHXQC9US+Y3kRxWgCg+atCjsalv7prqfHJafIrrjybuxyMmrfiZYYpQUgqwjExuJl+Xhg75ocU8XcjPnu6c4HnmdxmprIolNgoBMJAWwxp7vRhCp8Bn9OTscxuk0kcfRs/MgDPzIGGJdQG/D1FPRzpl7C0MS+lslGIRE9OxvilRGH63celdiziBH4AXZmgAH+3Nn0Q+ugB+ao4hdoz/nzJMRqUj9P85qdyIBWq7knRCIGrJIX85y1RdgvXVyTV6FaIs95bIeiiQZRh1cZDLIk+llUegpC4ka8dJw1rOtzKnOZdqcj4dbONF5fOURcXyz2XE4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(66946007)(7416002)(66556008)(2616005)(186003)(4326008)(66476007)(1076003)(6666004)(8676002)(41300700001)(5660300002)(6486002)(52116002)(2906002)(86362001)(44832011)(6512007)(478600001)(26005)(8936002)(110136005)(6506007)(38350700002)(921005)(316002)(83380400001)(38100700002)(26583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B12F2jx59ctqU9PsTxGf28j1Qbq9deXt296OkeIrBQkcKIdulATxADdgqX7N?=
 =?us-ascii?Q?BfDina/kIHeYaXSAhAtD7xphgllyWaMAdGeVxa9cyXtwHvd9/BzT4TVjKPeF?=
 =?us-ascii?Q?ZsSo+4uxibeUxe72jOuLnSxglZfss73d+MuQbXuIUTfbgZrIxrRTsN9rv1qc?=
 =?us-ascii?Q?eiRgHjesir4XvlrMymqIBHIy15wGgNTYDkeAnpQXKzAuU7mjC/zvW2j8VKsD?=
 =?us-ascii?Q?88pNVuqgAUw3/OHzXLLK7hdYsqEx1/nHPSEODqm5kAKhMOzMnIqGlMA50kUc?=
 =?us-ascii?Q?m4nc4cFzbTN1U5D8Oh72lFgD4LaEM97R2lFeOyztq1O0T2R3ag8G217Acuel?=
 =?us-ascii?Q?JeevkgsOzuOk6hzeqN8Ohc5881ftXMDJF2zb6kFRMDqHorKryyjKtr7u1Vrr?=
 =?us-ascii?Q?7UjN9EPfJ37DfzB1qttA3u9IZpGMcyTskwn596yDsWxYRvw24agEL9GjsejD?=
 =?us-ascii?Q?2hPjo/cXzlwsA7S5dgSlOWaAC9CyFqY/1fKc5FWGWr6jOtFUES5lr0kgH0OK?=
 =?us-ascii?Q?aqICo60xpxPL5kfNuHvJreZ3h4TirAEEgU4UczxccCcB4YNrHDlQllIfTKTx?=
 =?us-ascii?Q?cntgqskhdlOijx6t3Et4flOHm7Mp791aZjgblObyfiq6wwi7kg22TarvAJkc?=
 =?us-ascii?Q?SGsIhnLNjDlOZrBBLDSIH0yRAqnARWEkWz1NoTaBSAz082HTpyCFe/nliWZd?=
 =?us-ascii?Q?X7sp2OJlGxBsuXYtY/lcc0VWzdzMKK/XpS+TCoDpq6pQ/+0aIWQIkhczr8o5?=
 =?us-ascii?Q?7k5kpDHFQpmt+hrqh/hb4j6F74cUwEcpwhV10qAoU9WrUmpD2OS+hgTq/x+6?=
 =?us-ascii?Q?e0C3S9qXu7IMDCqTn+68XN6MlGAPzAnV8ceJ400/jKm4h7K53k0Lqh766cQM?=
 =?us-ascii?Q?XDShA+rWwM6ociC48X4pko/XXExBLmtYCMGwXdz0OS0wD3GgUY+POh1p+6Fx?=
 =?us-ascii?Q?jCcH37d6Iof1OvRoy191LRtskVfZ+XSmi2eqiiLgsakQhH95WK3rdoIPE/v0?=
 =?us-ascii?Q?7Loshrq5wmrGE7oieMHEn7i7DobuM5IQraoPSO3vWzG76mJAC7JzKltMEog/?=
 =?us-ascii?Q?CFt/No98URqppMEclwGxJrb5ZiiSfR9C0aDSRQFejN6ImHZagrrvM7LXoyEL?=
 =?us-ascii?Q?WvTcVKGkdJ02epixVGPpGHoH/vkK4B4PFpAHdNBg3Ae618ROefDZ1GC5t8tm?=
 =?us-ascii?Q?uAS5zIToCDWdouGVQRJ62zY5ZK8bsIfF+fWF+0akQT/U89wSTld4OkmsccG/?=
 =?us-ascii?Q?/d4BZDz/3CGfdb1fX4+QgT+POUTEDpHHsYleqVEn4kVOetz68QX+2f4SQSqP?=
 =?us-ascii?Q?ZTiXPHrZ/HShAPvJYC9mf6gQmdZekzX05lnO4vlhEzHepov75izE0vCPyARx?=
 =?us-ascii?Q?HIWDJICCKSqmUx4o1FYJbJFBkdPu5cfKgRg2xJtYtgOU3eTVCM6dHhOpwfwA?=
 =?us-ascii?Q?DBkHFJmwDivaFNdiGK0njr9SXI2Zzp0DyRmo4wWEDOU3HKhw+qOSYrcFp5Us?=
 =?us-ascii?Q?h8uxNq/rQR3EDVEWVMRSCNeMJ88MxXgYKdzD470rQLibflLkxaf0YcHMpJqO?=
 =?us-ascii?Q?SX1KFVRyQekIAQm/FB2zNK/76a4z13y7dpu2CIDOdKAcvLUX1Ihnne1sqHjQ?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bb614a-f3d8-4a0d-d8b9-08da6b11f05f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 12:10:01.9963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ygw/+3xKp8sZldCJ2e6F427xeA9l+7G6uAjivyPoG5AQG8WyY96K//Q+5tJUAWpOWgaJaBGQN8fAMmXcn2dSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4791
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DCSS + MIPI_DSI is used, and the last bridge in the chain supports
HPD, we can see a "Hot plug detection already enabled" warning stack
trace dump that's thrown when DCSS is initialized.

The problem appeared when HPD was enabled by default in the
bridge_connector initialization, which made the
drm_bridge_connector_enable_hpd() call, in DCSS init path, redundant.
So, let's remove that call.

Fixes: 09077bc311658 ("drm/bridge_connector: enable HPD by default if supported")
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 9b84df34a6a12..8cf3352d88582 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -142,8 +142,6 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 
 	drm_kms_helper_poll_init(drm);
 
-	drm_bridge_connector_enable_hpd(kms->connector);
-
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto cleanup_crtc;
-- 
2.17.1

