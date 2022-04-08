Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC97C4F9309
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197EC10F14A;
	Fri,  8 Apr 2022 10:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0A110F14A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlEVuCnlVIC75ZI9WusZmTcTQs2fQV7MNWCFYWNDVScEAnPI/UFHUhDFKFEmWL9pyn0gRmRrihADLVHfnYN1DM7l6vbisIbCYQGCuUiekvyZH0RUP8KxEbtmBzfiWgc6MUVt4BXoL/rcw1QZqnIU9FO5aBF7kFqjqdPcqD44tNXFiFnAiyuu13XvbCW9cUfw0euxSGP8Xx67kEIS3DnWtM0KiI53ZkJ5w14eAcWhMoQlQo7jal8z7F7dToL9T53+59zMXhaS1gVgCg1kdFoReb4XLmP5XEzQfWKArup8o1SJFCcB5Vb8ej9118mMLLqiP/gEX6z69k1UMQ3woFwOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3JaCfvjSQe13vIAVUHlfA2fq0WBSrv/aOeQc2unmnY=;
 b=NXzXy6FiQAAMx38A98volKdIGIVa8ZxLGctE/riJ0uB9fE9/tKrNTL06Q2NY8AVRy0FxDkz+lGOZqMd1e5PW3Zp3CBHaS1mnPIULAsb2omHm26BoZ/Lx4yqZwYWEiMEesgIaQ58DLNJuiWAy82qDtleA/nrjM968NXjeAsX4nTJupa/Q+GtIUsAyivHLOCPqxxsJb4R7Dw1SKE+7rqj7Pcm7K8+4tdzfrpOwRdQvI2UfTIhASXOe/9GXGepeWsxaa/x2Qt7Ud9/zUou1nZDC8uqIAqx4CLtc9SfEj48LMWiubC2InV5WKmxVP6Su9TNyyNjb1nDDQO+o+T1ISuzFvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3JaCfvjSQe13vIAVUHlfA2fq0WBSrv/aOeQc2unmnY=;
 b=lyScU9KhNZqRAdYesDzaajiy+wMmjn6cz0sasbOppJSPbkdyGMEYJPixvOhr+l2JZD/XwC1AOsK1wXrRpQrsAQyGhcEQ6qLoSn7kOkiZpz9CB9Ar8L4qC9GZXpvACvfFHKe0trH0EDEbdiH401xtlb5lvUC8QDNrXlHSlKt3luE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:33:01 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 10:33:01 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 0/5] DRM: Bridge: DW_HDMI: Add new features and bug fix
Date: Fri,  8 Apr 2022 18:32:23 +0800
Message-Id: <cover.1649412256.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To DB7PR04MB5450.eurprd04.prod.outlook.com
 (2603:10a6:10:86::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6ac7eba-5183-486b-c46c-08da194b27f6
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3405:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3405D317A246B4D93B7043DFF4E99@VI1PR0402MB3405.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: faTPZOftT3YmJqsXEFR8cLGYNZ8cVO7dEC4hbhvYPGAXySlTOBibHsVYdm5lOfXWvSDcaxNgzOVfTWbUZV8tL5but2HcE+hISBVjdqDSldE7Axa2txVJ+vM0XDt61ekUleba4HzRZ3I6afoih5I1/ue53Gj4LmbAyxNugn6kF9ZPOHOByihBhIvbR2GexpbamuNr1IrNS/BaZORearbCNy3ISPO788XlVDncKQJWWG1oSK+3psmb/CauI9yX15+ZFh/vFn1SlcI2eCTJAAgUBc2JX+DNQ/jqyiJys32JFmBUBJPFf2PwOqn41ynMSAaZm0xPh0Ms98VdvGLeXb9mlA5JcuqnegBOJFqaOQH4Dy5p8xSmUcF/1SualpYeQKQTSzGQlzuRkDmYhwKwiVioKf3StzC2ssVixtKv36G6DjL+8pQOkEds7swyG20cIW1QG9aqmc7XZztRJF8T3s1TW3BNgrRklNE3bBkHYWjjTsGcn5s8MFwx4kALYGNonjAJf+yhtJtwrkpx+q/bWPg8WdDWahOFy3Wfo9vc9h4biC2B0C/fwDcX1it8VpPUqB5VUyytpe7eFi2zZwwTH+eL4a0EiX6+lQ5RHhv3sbbs8nLQ6+w8f4kE/1w9HEqZKJCRio5TQdbvWxfeT4XbDk/sbg7OAlXbIVEmLpNy8D6uLhAyqvheQI/r7I2sIh5r8Wo9R+a0Ovu6YUUtueehfHpgWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(2616005)(52116002)(66476007)(6666004)(83380400001)(8676002)(86362001)(508600001)(66556008)(66946007)(38350700002)(4326008)(7416002)(2906002)(186003)(316002)(5660300002)(6506007)(26005)(36756003)(6512007)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DgD6oU+BDPFPZefCD6Usf0Qkhhrs2B8l/sQhy0/37F/op0fTqLADJqh2b0Bs?=
 =?us-ascii?Q?417fZrH+ZGwVFZeEX1+O8WTu7EO66Vt+29hUz7gpIQyqbZ2KnDWOoWxAVTi/?=
 =?us-ascii?Q?O/YcwMi8wUfLJX3oltVXhG6DhNKFiYIZVPw1UcU5cU8g0mWPhaAZFALxaWcI?=
 =?us-ascii?Q?STDc57vqFYwrHo7H+v9B6KXNLt35rWpW57jGwUWTVWPhaa3LsKDixpjwqvqD?=
 =?us-ascii?Q?Y5gn5/RntKEL6KGf9N+exRn2TpDztpVaiazqiF1jBM+3Cjo1PTbyn+q4tg9p?=
 =?us-ascii?Q?OxIBn3WSpSvMYHMffz3XeNormRTgoOhJrgj8FzVECH+AfjCmfJ8ZVYyyD22L?=
 =?us-ascii?Q?YLBnp2sgjY21oQZldqKvY7TH207ahmAOGXuPe8DQ/ss8yhWsvLF5lcCqD14o?=
 =?us-ascii?Q?yug1n/IkBWdIb/HsSDsZaDYhythxeC5RYfjquuCAw2Tu2mFbjY0Ssj5EKBqD?=
 =?us-ascii?Q?5FFptSwRn+RzLGGSYEG/zQgFWTOmg1VR/zAk9y5gDjJEhRQBiXmFPWSGVyr+?=
 =?us-ascii?Q?BzGI2rcKZQQspcecMHmuPDG0j5ZYvFWs0r28KdqC3c9v557xn19XmxeSmYjC?=
 =?us-ascii?Q?aI9zPfITfZ9Bgcx+e0E2hU0BMh/pCUfgKycScVPWt+gP9t/bln0HE83o86Ch?=
 =?us-ascii?Q?UtgbGGDK8Kk7HPc7hrxgiM2c4DVDLaG3SA0OXrMulKqN3SA/Lw20pCU5nAo8?=
 =?us-ascii?Q?SWafpHqCT/0pubw9hhwqbuXsMMQNzMScbH0vIxsP02SxGFbB/kqOKSBZl692?=
 =?us-ascii?Q?DxKhsc01zI3QhU1ouKdbJ7YQjVtqU85gFSVQt6uBNCKe+Yv0LTj+gnNwoEgP?=
 =?us-ascii?Q?dcZMshJmNJ7P7ZArs5KSigN0BsiTDGux2jMHEMEoZPEgZ2PCc62nJ9wLaNk8?=
 =?us-ascii?Q?NN4vs44Tl/XcWNdsxZveYfwWBWjn4Lzs6OmLtfp3rEORq6t490bOqqCslqAB?=
 =?us-ascii?Q?WIwYWVKrLKs1IzkTbb2JIaSIqgkqK3xKGJZOt8DGV0RKFX8++lRBfw+sR+Hw?=
 =?us-ascii?Q?bYJMCbCh++0ivC+0kiOwxQST8PNZEC5ZN9kCkLKKUEuehbsYr+JWsFlkDCYS?=
 =?us-ascii?Q?FPMR11At190pM0LM6/Pdgc+IsfzzPlhgvzoUIT+DuUq7bV5flgSioZ76/9G+?=
 =?us-ascii?Q?zF5w0DF9rqwKe2yPayBxYcmUk9PalVBCMt09uROVr7Glf7XLmvpnCahg9UIH?=
 =?us-ascii?Q?Qlcf5R49tq+nqdqbbq0AjTBWxN0PMwPYjdOOAmB6wOs8IhWbWvWvmhZkSEg/?=
 =?us-ascii?Q?J14uGgzSBz+0QuBnIX0Libip1hw8Symf+I8WZ60ONllR5FfzOACtJwWihjxE?=
 =?us-ascii?Q?p1Jt+QobAfqw9d7WU7mCxFSGao5jthBqvgQXblVDU9uxN72LlmIrCoZU7ewI?=
 =?us-ascii?Q?wC98iewc2//XHoBsdr4LA82m15R4W8rDU+7QPupJe2Z5LsZoPKknVV5FZVFC?=
 =?us-ascii?Q?SHGlUJYcU/b4m4unRcdNe+765FSPyCsrrAe5W1NKtmptw5KiQH02DEfDMzc4?=
 =?us-ascii?Q?GYw1kIuFS872Rwbsnw6UA8VDKGwD6zKu4IvWbKDe7VVtcBgv7BNvMtFJV+RR?=
 =?us-ascii?Q?HSvrIG+0ACwOJ+bvMSU0iwunNfitcJNYbo1O4m18rWNppg3YtW+DuoYvBzHL?=
 =?us-ascii?Q?NQxSoW5BGn1hGpgHHeOw5ThdaS1E6yxbwXHBgkKC3KnBkbGQXZ+MtIzWFfwF?=
 =?us-ascii?Q?85r5rVhSHhZhrIqZ03WbvGunkIH8whQGar+S7JjjY5RnyUz9zBE/g9eqmAPS?=
 =?us-ascii?Q?kFCDXOsvnQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ac7eba-5183-486b-c46c-08da194b27f6
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:33:01.3821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QEzhAPABskVb6G/rnjJNVessrTdVAN98Ycw00f9M9uQJr0dqEvXokekScfAE9neXo11vSfzTRe280faZA/QiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3405
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, cai.huoqing@linux.dev,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is new features and bug fix patch set for DW_HDMI DRM bridge driver
that has verified by NXP i.MX8MPlus.
Three new feature added:
1. Add GPA interface for DW_HDMI Audio.
2. Add CEC PM functions to restore CEC status when device suspend/resume
3. New API for reset PHY Gen1.
Two bugs fixed:
1. Enable overflow workaround for all IP versions later than v1.30a.
2. Clear GCP_Auto bit for 24-bit color depth to pass CTS.

v1->v2:
1. Save CEC interrupt registers in struct dw_hdmi_cec
2. Restore CEC logical address register by cec->addresses.
3. Default enable overflow workaround for all versions later than v1.30a.
4. Add clear_gcp_auto flag to clear gcp_auto bit for all 24-bit color.
5. Remove i.MX8MPlus specific reference.

Sandor Yu (5):
  drm: bridge: dw_hdmi: cec: Add cec suspend/resume function
  drm: bridge: dw_hdmi: default enable workaround to clear the overflow
  drm: bridge: dw_hdmi: Enable GCP only for Deep Color
  drm: bridge: dw_hdmi: add reset function for PHY GEN1
  drm: bridge: dw_hdmi: Audio: Add General Parallel Audio (GPA) driver

 drivers/gpu/drm/bridge/synopsys/Kconfig       |  10 +
 drivers/gpu/drm/bridge/synopsys/Makefile      |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |  37 ++++
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    | 199 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 177 ++++++++++++++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     |  13 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        |   2 +-
 include/drm/bridge/dw_hdmi.h                  |   9 +-
 8 files changed, 424 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c

-- 
2.25.1

