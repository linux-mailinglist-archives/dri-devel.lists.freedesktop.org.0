Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF274EE52A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 02:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8BE10E45A;
	Fri,  1 Apr 2022 00:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08olkn2028.outbound.protection.outlook.com [40.92.45.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D17E10E45A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 00:19:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6yvuWIP1agDaEtQXvXUHMl2ax83LDB5kLSQBx0LGnYS1FDDbgsQFI6bSNHu5JMvqECPx200yvy3vy4R1vPJ6VcPZ/sFbaaLHK1kdTL0+vb6kBCG9QmXH0B0opq63Xa97MbG3nP0WcXLeItxewEdVEaxDvIPz6v6WpNb3Xsbai19pfKHcSNFYW9DFv4C1vsXcE9DScHWi8qsEH65qsXVqTqUu/m26LmsYgUWPic1H/ylfNxm5OE7pwXX4K9rCJzo744hCPdUizouA0LZklJqfTrFFiKkxsKNswGzIqQqLM2OYMfngkKbejFAeDng55dJNa0LyZwVc4y3NWrEcmYcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbPsUtwrZMl0rRdrnl1F5pmp8TVBbs0jz14nBenYCRE=;
 b=ItSCn+1CfiSaes8btNfqcPKuJ2P5COactVAGxfQrvyAHXEN1qaWJ6yiWzYVCwHaIjAN4mxDsZtAVYvx3jPfS/uK96yL/r1AY6pDioiU1GWiDwYgeNTPefh7EStXRN9DSMmD1w21YjXlFyBuwUdcDTJIlCdOxpb7iaWnfsB8MC/cacqAMg7o0ucV2Qx80LDr1wbEMY12NPEndUPnoGkpp1qM011g/OiBTfB8OQCSaXnmu44EJPtU1UCdrpdugZcHNP+dp2x+FLA/BalWuTFf5SGL8MSZsSWRnBG4SO9Hqbr69gPHY3IKmuBAKJWNZ4kE9VL35jNmyI74rKGwplVqK7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by MWHPR02MB2253.namprd02.prod.outlook.com (2603:10b6:300:5c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Fri, 1 Apr
 2022 00:18:57 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6%6]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 00:18:56 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 1/3] drm/panel: nt36672a: add backlight support
Date: Fri,  1 Apr 2022 05:48:08 +0530
Message-ID: <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401001810.81507-1-jo@jsfamily.in>
References: <20220401001810.81507-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [wh7uWdrksSEkIY+IhK8YRBdE5C+nuyZuRVklmeyWoNUWmNG4RBSXNeNHu+l03yZk]
X-ClientProxiedBy: BM1PR0101CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::17) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220401001810.81507-2-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b2299e3-76a1-4ab3-07e3-08da137535d9
X-MS-TrafficTypeDiagnostic: MWHPR02MB2253:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45CAGSnRHLjx5zKyEw0xLDCFGLEB7NvUFtSKpxncxF0k78XwAjmKj5bpTRkgNKX3YGk9g87QVm+qUwxeURaS/NXuP/9SQ4YG6k2BslSBXH2HyHmM4i7TsmV3PO2dNydqiglFfj8dC8cel95FKfoN20OlUsabtQp7rhfp7aNCFhPRmIdL0+PQk+qfmzTYyNqhCqSnqSriPHki3OgoXnxTOMOfEmfKt3oH566MmFyPJOaR3GzjfHuV63KwB1MUl5pXKyrNxB9a6TcdwrFgbAIcVCDgwK0ZU0EEKa+oblNUIflarkQkQFJHNU+jVt1Q3s1XwyHQhCupa/FKB+TYYzdZTHOiXR/RpO1vJIDBthaB7kVTzyndjOEI1o2SZmqiYK9jRBOCP5npUtNfRjpgKyerBbKVsTpCC5f8AMHqDqYkHDa9gY/2eXZfNWtJsjh1zeGcgkF13AhXEzV1nPBmdOm++7Jvq6/jvy8B+KdI4zwTHxmX0529zCUxLF4X3lPleqojEF5sVZiUxOnQy/E1aqs2JD2egPR//GH6fNFXbpGUCRgF2wC/g+3evFaCxx66Airs
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NdJliEdRPT4UvmSYwzED8djYPTOuP09oDY5irFQGrAgP/ZtkVANo+43EuQ38?=
 =?us-ascii?Q?LZX65UbhaON/Jt+8ubsK6QF4Snxgp9DTHbAgcqiUcVeLBPlgjtb9IDMiL5ug?=
 =?us-ascii?Q?pJD7hXV2LyFR6gbXwxPiWegeyCcCin7hhK3O0X2Ee431f/BGzT/TBxlCtSFI?=
 =?us-ascii?Q?lUAEfGf6ELbqiUsrlBBAAMcodvznyv4SSC4xG+mZ+pntdZgmNfktaiG7WeVS?=
 =?us-ascii?Q?lYp9R7nWrMvhh6vvFFyOaYfrQtrAeWamYGFSVn8+IViZ+w9PRNrDyVex7F/X?=
 =?us-ascii?Q?Spa65dgqEQlB93/X6LY35YJ0mlZP0Wt5J9HktmyZWojqK4Si3HnK6S98mKkN?=
 =?us-ascii?Q?F+oIX3GNN6fahTnXUuw2wgdzzWwtgDovfrd5JUjSKP6kkc5Dcfre4+dHZT/8?=
 =?us-ascii?Q?JqcqmYAsvOK7lz7sZ3Yy7/hPLdTByv995XJDy5iq2S6Ztq7ESVz9tzUI1gKD?=
 =?us-ascii?Q?icgCt9IlmCVz7yoFWLPNjLjqcJQLSMmUteng3OJhdDQsE2HyzPBOlO15KWkX?=
 =?us-ascii?Q?ai7fqn8vx0A/zZk6O+e8QAGqyQVxDxcwsGtOD9Dm3lWZN+oJcRIMqwwXPwcb?=
 =?us-ascii?Q?iU6wHj1CfCJsyRG7eafF7sPmpf8DxzIAtHowbKq+ihJN0Zo6Sw0Ns2uyCleT?=
 =?us-ascii?Q?uZQV3dM/WQIIf3lWLdJo+K+OllTTDY4tEoksPqYGlQmfwbXSfg2I2Qg2wqV2?=
 =?us-ascii?Q?O2oFkTaHm1DDdeJSGrYi/Lxa1pYD6QFE+UNKyUWwD9es4T57DWyy933XvGhq?=
 =?us-ascii?Q?0yu9l2PBjk5PdxNpRuWsvd10cwUV7DBCuYx4BnqsJi9ZqSccILu9qWkWq2jn?=
 =?us-ascii?Q?Tv6Nh6Pl0zV8XeX5GxcqR1tVmYM3pLI6oiEIzkEZAzO39zJpQnvuz2jLATWX?=
 =?us-ascii?Q?NamXYDWUSxIgXGsjNvM8pZoG749a9A7J2lXxF4hhJXYLcmn0F9saye0UeTdS?=
 =?us-ascii?Q?70E5bnxPMAEbG/YnfRLz2AFlDDSoTx4AnrazWfmqU281DjvBPqktzz3H+QtQ?=
 =?us-ascii?Q?/j3wJHGYK/uth2mz92W/CSshxGHFrrjVy4cQiyiJDrTIwbsMejwHRifNS5lL?=
 =?us-ascii?Q?hyegBi5wapTuaZvkvbSalTiSHHMexDFYgUL1XA6Zz6AaFZqw9RNtnw3GQAaf?=
 =?us-ascii?Q?qv+wpngwlVoj2c4nkgFVu0CI4glL3Fuz6QsR6Lqv8gKaZuX8azQKvsKAwdL9?=
 =?us-ascii?Q?wGsXlkMrMy+KpVVU3O+DXWrooxJjvZOci3aT4iNDi2GfoK9xBO/eHmzDKYl/?=
 =?us-ascii?Q?N+biPBvS8alM7uBvSg/SFuLRVMvAZT/UgYdpMBacFkz29rJWgYI2Mq3l6tEc?=
 =?us-ascii?Q?cHEgmfJPzEoaLCMWwOtlBr7cCwPYPqpoxjXp62mO4DUWn8k4sPqR4HcUaJZY?=
 =?us-ascii?Q?saqv5+VQHPC0CdraBo4v5l4cdwfj0yjKrKnyUWBHzzA/GoZ9cOiiqI4jdtOE?=
 =?us-ascii?Q?5E7K6h6mP+oCNgoIeC4yip6fcCkQ3odGzTo6/ttrrW/CzKxqH4KkaQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2299e3-76a1-4ab3-07e3-08da137535d9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 00:18:56.8893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2253
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for backlight. This panel supports backlight control
through the QCOM WLED driver in Xiaomi Poco F1 device.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 231f371901e8..6d6ce42787e2 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -628,6 +628,10 @@ static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
 
 	drm_panel_init(&pinfo->base, dev, &panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&pinfo->base);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
 	drm_panel_add(&pinfo->base);
 
 	return 0;
-- 
2.35.1

