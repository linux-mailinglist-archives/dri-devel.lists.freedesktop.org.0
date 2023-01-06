Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924965FB0C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 06:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AFE10E2B0;
	Fri,  6 Jan 2023 05:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2042.outbound.protection.outlook.com [40.107.103.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A99010E2A4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 05:50:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkCXWshsntYmuh9Wh0n4toRBAPFRnZuWFj0tP9+/XJQqqKvEM2rBj6uJNwPJilom59w9QxJllX0RqAI+bZpw3TBVD4usD6kY1UQNlEmDeBUq6Sc7s2o6pipjxg6Q0NWlf3R+1t9fOwlbmcHsl8inYF7b6UsFPbro6XyoqnHExXiIuotRMjMSCyqeQ5pvPEROdBBGXDcTl/nvmR+//7j7+UUGMIw4IdOWpgSh9Ov9tbvKWGsgen0HN5sYILxni93p0FtB3LOgGHHaKYx/PsoR/XP2Cvodh0DRTOvihtrZvHBjGJw0kKmvT87MSFYC8VvqIvxySIRU/Zju8R/gLGJeSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDlazzu+7NEtuEXjOap70JjR+xrRtGD/AmIzYvHrDt0=;
 b=d3cdkYduUWbMDY3ixzjLWSol6R4EI/qGHIh1t3drxHl3tAF1X5eLJ38p/fSJybfP5/BH+7WfPgBBpj2+6FGjbt0TrZ5wA17oD0FxTLvIgk2Izm/VMfEzBSa4vldhkvPcWuZj8N5N/ddZhcsUkRNBZM3ZWpPOBhJrmnB9BANRbAR+MCAd06XsqurzFbNYYFejB56Tt2nMeQWYTET1JjYj5Vte2U/tC8wos36geQskqhGH/MSZ+ChDXzzlUIE/M2Fk9fBT1JOzEV8ai1SNXxr5GXlcQkVHYvnkbHRhYIw1Rbekzd0fqiwgQnSxWqDDSVKmkLtjAyjqkmKceQOwHDRiAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDlazzu+7NEtuEXjOap70JjR+xrRtGD/AmIzYvHrDt0=;
 b=ZC/RI9MGFPcfmsXXHLO3qHn6QLlZPWXU73UxDSCpU62zy79UcyQRi06SOQXaSj4FRXb//u8CZFZe9QSl+CZ7D+1T2SJvIJaWcf3vU54uyeqL9WZZ34ke8rbl0cmjNj3GdmPVVLTXxshNPmx1f3b8wnnes6OkX8FeeGG/llWdyjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8310.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 05:50:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 05:50:25 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Fri,  6 Jan 2023 13:50:54 +0800
Message-Id: <20230106055056.2883302-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230106055056.2883302-1-victor.liu@nxp.com>
References: <20230106055056.2883302-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec5c1c9-dbc6-4484-c803-08daefa9e858
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iArurTXC3MmVzaJG4f9NQp47gavFqS71TnS3Nd1vIuP1JQFakHYRbWwjvvchoXLIXefJN9Kpfq0rH+2DAWRy7SzbJGZHznrdu4Ym+F279xmJnwDffbpvsWEtvQIoy6oFkrm3ZVz7Oe5cDLFh3v6Bx8ZwHfA1WbW+YnowJgMMjzOihkldPZNKrdt0jwgusENNK/oxKpA94ee00oCYB/CW/e3RKf7WZNE/3iP42jMBTXkktjXAzxHaVbJbQg0IatOilXWXzYmgDenzPHsFn8tLSz1WyzU4o1HFYOab07+Z5mmfdmeVOurOt/D35/oPi3KCfmePkYtmGb06AYFH3P2lHQAZaxu1abWR4AxxI11jzIpKt6xURBrg/Ty3iRbzP0Ql+p4AL2BsHc/HhmsXRTXbclov//NITq7YCG95pW/IAcpvNejDuBIMM4BtJf+BpuXVHXdFT0/H4EzTmOpWEXrn/MQ+kRGFCwq0YkdvUwatoaY10xPpa42c1fWZ2VvkTNxQLWJYKLVhctv6LlZM3H9R2i/+2U/9J3unitdHiukwBcYJqW6Rz5Do3QcE43yhqgaV103FKHLG4C2Pq6hQDCwEpBOEmLDttCXgk1xHKA9Q2G0kmdAIJyLIu9dwDjzADBvMf8mFNRiYLODpEsCrhoXzITHRcpYUVG7Y0AKB6xvNBfbDmn4andKb+qgvMMSSEwpjsamXkm+h1q4PhKaCmjb6dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(83380400001)(1076003)(6512007)(26005)(6666004)(6506007)(86362001)(36756003)(186003)(38100700002)(38350700002)(2616005)(4326008)(316002)(478600001)(41300700001)(8676002)(7416002)(2906002)(5660300002)(8936002)(52116002)(6486002)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?THAhzO7LgwK47LHXjavnWENZ/D8OLjw0EBkOx0nZGapWL6zwi+A/5H9DylJY?=
 =?us-ascii?Q?qR61EVJTn2G+GI+0J+z0BMpbqQawmH1eYixQYzqIEWGI9k0d8D0fSg049NKr?=
 =?us-ascii?Q?zVhTkfmLAQueiicuBOsX4EaubCssS5IeZlUJlctoUgSIpy75AJn3bWlcOwyA?=
 =?us-ascii?Q?25JarrFAizqfrcAPMhDyJHyCapRsvoaVOGrAwWlvv5CCWWDT8p8Rx4UNyAQs?=
 =?us-ascii?Q?+q93H+RPesHb72rfJaHC9O/BReBkFNvCXk9CkTO1eDuW/FGZtmSeFoNzlHea?=
 =?us-ascii?Q?d6fNWJ5reCWyiW+0jLIb0tXOrjsq6EAVEJrWd0bpFuwqdbgBtrCQ9Z5UVVLB?=
 =?us-ascii?Q?PO0nlawjiYDzCOXt1eGI8j82tNxaaB13X9HC7hyFRRQFRPJwd/Qq35WHOqLe?=
 =?us-ascii?Q?eE1ZI9jp7CTbQ9DgoNTLSDzoVhpyh5Qsxz606szJE9mOP+fLr2u/gPZok5uc?=
 =?us-ascii?Q?KvX5UlgYh+x/0JYsFfolXPvE5ef6RII43iwgA0p8MlC8pGkA+EVDwyO/qF54?=
 =?us-ascii?Q?GmR6TinwOfUURvT7ET10mIxieUVhxcDFWz1l06YC7iZMDrQGlRYrp4ibiwoK?=
 =?us-ascii?Q?B1teiLNE4sUlzevBSx26O1BE3F3InGEruD8rMAuX5Vb8DxMyIj7MIUp33zJr?=
 =?us-ascii?Q?UdYqUAc7la2wJC2GbMZefYLkFdBvobb9TyeWeYbd1pf5C+CSEK5tfpoyRbp1?=
 =?us-ascii?Q?pxxUQPLHfiCkoh1PVvH9uAMPp2DnI0B7OZXGTqBB/TO9KZSW52Ze8Is2PBu5?=
 =?us-ascii?Q?gfChMAhZNu362S6xIADeAEcRM+tg9Gl+VLmpMuIzPjBPzNqpOL3sotoWL9OI?=
 =?us-ascii?Q?nTGKxFAs3Z8MYh7gqmeOWZsihpVJtM0kTPetadp2mVIRuuvFBGoyBx4MA4mW?=
 =?us-ascii?Q?ELC42YifZX8DtEXoCxr+NSvEmVR8ye38lY8YaHFNgtXOmL7/i0DS+oDH0i8Y?=
 =?us-ascii?Q?ZgY4koTQHmvrLy+/6rSXYhtOlwEciy4ieOhUrllKmsKwLO9GAmI0P1j7rTCp?=
 =?us-ascii?Q?nhEVaRwJtaYK4FoFMfWpnbCiOhxSG7KAK//WaRUXdg9v0N/+dFegj9Nnpig0?=
 =?us-ascii?Q?/0Ul6cOX7iQTXW6KKui2g99mmJ9E9SV/XfxDHXAJrq8pHQzgRvu8U9kH/nmy?=
 =?us-ascii?Q?v1jmKlCXlrH3Hqf8UnPyD9NJ09rnNWEa06VdVDJk0r7BMdIUBh5gQcUeagAP?=
 =?us-ascii?Q?K5zAkJue4rs9+epoFouXkU2I/2qST+Rlw3tUDCqgqkBt3ZOVOMehyW6/YsnC?=
 =?us-ascii?Q?KI+zqEQQISXN79f55Sh0f2aKFFJamRC4Z6jLSpD402qiABiwmfQsuOmdCxMR?=
 =?us-ascii?Q?88e7yqlH3WMJqTZdiERhZfb96uJx9kyRlDPuhRm09iSFyVeLJYmAIFWCeOtL?=
 =?us-ascii?Q?5WePT05eJJpPmAqUCF1LHcIH2pRiKJ6d7LEPp5EhhZoYlnWVr14UVcEvY/28?=
 =?us-ascii?Q?gYRx4nXA7zCByFgZTQ6C9F7I7ORZ4zN/e9uAUEy9GVkePe+MOzkUbmdTZBAQ?=
 =?us-ascii?Q?Tz8pOVxuN7YxAEbdtvU74DoK1u8B/piCSR1CuBZT4sjHlAy4h+Adyde/JaGs?=
 =?us-ascii?Q?HYKKLaPFZbEl6i3fjXoNNOR1UfXw9JzWkXrnV05I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec5c1c9-dbc6-4484-c803-08daefa9e858
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 05:50:25.5177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvwq5Bbe3DGlvwSgI1J9wNn0nE2W6mba9SoXo4xRHBIjwZlyCG0XytvN4teYfCqDfMkliGM1mnCVvqxpWbK80A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8310
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
Cc: tzimmermann@suse.de, marcel.ziswiler@toradex.com, s.hauer@pengutronix.de,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, laurentiu.palcu@oss.nxp.com,
 guido.gunther@puri.sm, shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artificially use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6->v14:
* No change.

v5->v6:
* Fix commit message typo - s/Artifically/Artificially/

v4->v5:
* No change.

v3->v4:
* Add Daniel's A-b tag.

v2->v3:
* Add a missing blank line.

v1->v2:
* No change.

 include/drm/drm_atomic.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 92586ab55ef5..e88876c29cdd 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -947,7 +947,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 	     (__i)++)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
 			     ((plane) = (__state)->planes[__i].ptr,	\
-			      (old_plane_state) = (__state)->planes[__i].old_state, 1))
+			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_plane_state) = (__state)->planes[__i].old_state, \
+			      (void)(old_plane_state) /* Only to avoid unused-but-set-variable warning */, 1))
+
 /**
  * for_each_new_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
-- 
2.37.1

