Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A75614776
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 11:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BAA10E367;
	Tue,  1 Nov 2022 10:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D85910E366
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 10:05:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5AA6XkYDwGGJZ+WfxkU4zatLNTFhYI0aHpdoHKxRVMcgOAWHvOCUIsW0qG6aWQFa6/E1JKpZQTUYEGYIjbcSP3sehfbflu/l6np0X09e5f2bKGQ2NSfF9msE13Ci3M+ANPQmLhbk4woG4lseYPpyzAI5eT6WZFy2NtKNifOHNOONf0jZwN5A/0U3rYn0vI9JAltQ4taAMuA1o4rNlpsOkv6qKCy1GVNHV0XY40TkAoZ5wdJO5yaXujceN4T+2Q+xQULUoXLabOcRcRtMl7QOwsomVpaMe/1nbwCZckTH93GU0mI6YQdQuNZS9RFJKWEf0OUP+AoCf4dB2nx7eb56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGWXHCfVmsuYLcSCyIMtnZMpsNorfEL3N5kqqbbCOvQ=;
 b=ij2Oh8J6OUDoEYm9dVcZrtDWGmV6VcHSSBzOyvE2ycbE1MU1ybHijM2NqNbsbDf2SzgNnE8GgQImLMIE1xpU0OZXZqnS7aJvKAAXXueyYaKqvl4UAdFw7gjQ6qdL20S0nSIaUhLFqPcWe3FBakDGmThu2UFszZAfA+VXXOJq0bvodIey4TWmpsIm3iBvslVkb9BJROxAflLqzBJW8SclyDBqlKOc+9rIMMenLY8BDxiyflQvfiUhM5cl/9R91eCNxsoueRsVby5ci9/cYvPS1SBL/oDcpnLkElFnEcDMbJUJ8cr2XsetzT1bD5ShJlZ0JCAvf+67Ef8rkMKkYCjxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGWXHCfVmsuYLcSCyIMtnZMpsNorfEL3N5kqqbbCOvQ=;
 b=cgoFC/ub6td0TmyygbJYaYJGRVljjZvxdeFMbKyNvOssQNKHIBelRDdBU8u3LhwelYq1ZrL/AIG+kB/eSo0BrANDRrDs+fu034PqrpPVP8U401n9g3GcWM/y5nESuLssi31BoFHplJQmtn//IVF9c++bAAj/aJgVX0vITlHp+XA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MW4PR03MB6362.namprd03.prod.outlook.com (2603:10b6:303:11d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 10:05:58 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 10:05:58 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] media: videodev2.h: add Synaptics tiled modifiers
Date: Tue,  1 Nov 2022 18:04:47 +0800
Message-Id: <20221101100448.66712-4-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101100448.66712-1-randy.li@synaptics.com>
References: <20221101100448.66712-1-randy.li@synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:510:5::32) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|MW4PR03MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1d07bb-cfb5-46fb-74e0-08dabbf0abe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CbWjIm2kG5u02ZBzY587Ffy4BZ+0pnUE83e+JfrVIIeaC4UtMuDad75yvZK8Jxo9wA2u0d6/aIvuCuLBpWxbYaeLj8YxJkiUe90bXB8/7cyoS7MuUZyQQ7Flwr2pjHuJxXzBDdWW4CKetBSICFR4WQKHQPhZsirLi1rtJw3hKeddqQIcmmw8XcpNy90G1dlchjr2Ao4Iu6PUqJItqxHfk++ZqAj6H12xjrL8tiwlu/tEyclc+hFkhcK+kn7Z9tkdhQhy7r9FhSYAzN2QqnJEy3oUGAxYmVsGR+IRbCmY55CTeVfagG7RBZScRBvEAzVmsnB0mQtkPYzJ5kk0JQovF0uFaJ433okFXNkBLHEk/MT+IuI72GRMEg3MFaWVuARl1y7Bj7N5854YG6lsghRNlC6EmxZ+gspvQmv6rfMAJqnhIN0FLWw9mAmEtOhO7YbFh29FxrT2XcrDse0sX/btBbRqkL/vb+GKJwklhh/is6yJvW6Zu+yr8dLdMEkcHmuCzL25DCP91EZd1FC7mlyikCT4QySibDRlqaTouns0JkD90q9CKJ7ZuwvD0QGtRFsavT2WXueLnI25NPXjVlW92L/KiNpbFtjcquuKqTYSC5ptEoTbqECKPdoUdEUgo9YO6Y/8AiUkY+Wx0gMbxkS2F+1nX3iyHr9KYuhW5rkUfRl2Vc54NJ/BEuKjOY04zy0X+V0pS/h1Uandn4jR753C3vHFEB9JAT3XnuZx6KuAOJkyIEPD+B4yLVeuZH220gFD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199015)(36756003)(478600001)(86362001)(6486002)(6506007)(66946007)(316002)(6916009)(66476007)(66556008)(107886003)(4326008)(8676002)(6666004)(52116002)(6512007)(8936002)(5660300002)(26005)(41300700001)(1076003)(2906002)(186003)(7416002)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1/dIRCIBP8+GseE/iDXECzJqJ+p7tco7GjziOu7ZEbv/P7SKITQhhT3k09/a?=
 =?us-ascii?Q?olVQ2UotKHJn/GPzAtXpYhTOukr6hBFxS1rT+XWbWhhjJynYXLGj5CChWXGj?=
 =?us-ascii?Q?LMgDFGFWoZ4uNFwMuoOkULgeVYEify1SVSNy6P8PweBONYxteX6Wgj5J5Q/I?=
 =?us-ascii?Q?SuL38q/dQ1uc2jSB7jiQspRoqEC35ECcdl0Ms0gH3vcLvH/SYoMQwIf/vz4D?=
 =?us-ascii?Q?w0cRV94R2ciQou5GYBUW+W5gm9zD8G1x3Y+nvmA/EvC1Lf2RgHNDp9JXLDBU?=
 =?us-ascii?Q?Yjv7EJDGTnYjbftNlHVotBdLC7U/f50NS/3n8kVp4Fzu6bkZLldwMB7QHv8g?=
 =?us-ascii?Q?Tohq034QsSzdfNZXviZuK9kGu9t5SrvKEjCvQX6oBpkvaooaaGgkH/bd9y7g?=
 =?us-ascii?Q?UXv5/EhH7OVDC9+M7cMCM6L0vjJhWMsDbqCDbWSxHkx6qnHuGhqfXAbANbxa?=
 =?us-ascii?Q?JoCIzq/sAavXPsvdAlcVL9vwZUFnv9vjBYCjRl6+uIMuEZtP54Es/HH0Aa9w?=
 =?us-ascii?Q?sDbRBEM6pkiZ9AcJgBbUtdYjYWtBYdX4EjTlmS9uoNADoY1DSO43hperq/ea?=
 =?us-ascii?Q?7JjOQcb+TqC4G/lGK4xc6nYiCkBbAX/XEovZwh+KFf1jTXQLL32uuRaOUM9H?=
 =?us-ascii?Q?m1+qMFgIa5jxIrAC1kVLZWhWXxJq0G3JPQ7z5BCbEAdnZOXcvWsd98BHvYUu?=
 =?us-ascii?Q?GScssy6l+C9ox0b6On7iYZnCPZSMS5P3Ez12BWeppbo2utLWMv5Hx/hPYBdS?=
 =?us-ascii?Q?T8tsyh2h7TapiLI9eu05KjE3M+JEzj8Jx5n2tkLU0+Cw3mBdtatwrwVZZ7zd?=
 =?us-ascii?Q?NpWCHu3U0jRAXniNGNaaiV9qQyQiMkbxCfSk77SajToq0hCA0YUkx3uiG72Q?=
 =?us-ascii?Q?DMo69aNIXE5pu7xWn/0r81fhgYAWwSqI7xUuB3jEqnsxGRvzWXCu+3lLxUSp?=
 =?us-ascii?Q?FdePGcq47N4wflu0iJHrm18ZwDRQWihKU2bd2LFoVM9Dl86i5UHR00zd6fCx?=
 =?us-ascii?Q?rNneK9ST2jliaTFJgLu6feCXXj9Fa2TlRTwBmSlmIHZH5nOSJFDYEKaVQihh?=
 =?us-ascii?Q?lz/6YbiV8rz/yQ8n6tXshIRk6An0m4ZIFqgkVvopZN1MXXrjTflE867l5ueU?=
 =?us-ascii?Q?BiqHVdkxATnzjF+lB+NXPVem9rbcfd1FUgWLdqVyINwqyIx/A/irGI9M6MzB?=
 =?us-ascii?Q?oCA2kdiUy1EwnYqiGFQ1gvT9jksRL95AFjCUCZGsMWfOOVAEG4xFSz9gM9go?=
 =?us-ascii?Q?RFX25Zgv1kt/6s+y+QzWGK1OhmYFiVXU+iaapZeVxsaX4bckfaN1WvlgJ63C?=
 =?us-ascii?Q?8vjQL3+Y8neqqtMo9LFNbNtoIxCfHRUQMFg/TV28AxDQZb0v4wuv/4DIoI5k?=
 =?us-ascii?Q?fkVdHU6hIKtqDd+zPyQpdxg0DbFsDiPXDYu9e2Rk8FqmOgLsBx+ebMw/UzEM?=
 =?us-ascii?Q?D4bafNYuvwCsVYrE3Fm2cnwpS7TS6lc4zcC2FF5HihyQW1qDA4e4sfKvcEaB?=
 =?us-ascii?Q?6uwjeneRjhCWqk52gzWYTi29P8s++wXUJOA5vr8R5Fm5K4ciwCcGfxLfi2cT?=
 =?us-ascii?Q?MlLUggRfodwW8guAF7CWXWT7/HORo0C4QmLmji1Y?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1d07bb-cfb5-46fb-74e0-08dabbf0abe7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 10:05:58.0413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6liF0HVGxBIbKP3bF50EdsacFJqDYQVvr/C4ZymqDa3ZaM08kvIruwEli602sr9eilRtAHDLVaH6Gn6jBiRLqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6362
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
Cc: mchehab@kernel.org, sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org, nicolas@ndufresne.ca,
 "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>, helen.koike@collabora.com,
 sakari.ailus@linux.intel.com, ezequiel@vanguardiasur.com.ar,
 jszhang@kernel.org, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 tfiga@chromium.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

These modifiers would have the same values as the one defined
in drm_fourcc.h, they would just be named in v4l2 style.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 include/uapi/linux/videodev2.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index d00b2e9c0c54..71136f29362e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -820,6 +820,8 @@ struct v4l2_pix_format {
  *  F O R M A T   M O D I F I E S
  */
 /* Vendor Ids: */
+#define V4L2_PIX_FMT_MOD_VENDOR_SYNAPTICS 0x0b
+
 #define V4L2_PIX_FMT_RESERVED           ((1ULL << 56) - 1)
 
 #define fourcc_mod_get_vendor(modifier) \
@@ -835,6 +837,34 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_MOD_INVALID  fourcc_mod_code(NONE, V4L2_PIX_FMT_RESERVED)
 #define V4L2_PIX_FMT_MOD_LINEAR   fourcc_mod_code(NONE, 0)
 
+/* Synaptics VideoSmart modifiers */
+#define V4L2_PIX_FMT_MOD_SYNA_V4_TILED            fourcc_mod_code(SYNAPTICS, 1)
+#define V4L2_PIX_FMT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
+	fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
+				 ((__u64)((m) & 0xff) << 8) | \
+				 ((__u64)((p) & 0xf) << 16) | \
+				 ((__u64)((g) & 0x1) << 20) | \
+				 ((__u64)((h) & 0xf) << 24) | \
+				 ((__u64)((v) & 0xf) << 28) | \
+				 ((__u64)((c) & 0x1) << 36)))
+
+#define V4L2_PIX_FMT_MOD_SYNA_V4H1 \
+	V4L2_PIX_FMT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
+
+#define V4L2_PIX_FMT_MOD_SYNA_V4H3P8 \
+	V4L2_PIX_FMT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
+
+#define V4L2_PIX_FMT_MOD_SYNA_V4H1_64L4C \
+	V4L2_PIX_FMT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
+
+#define V4L2_PIX_FMT_MOD_SYNA_V4H3P8_64L4C \
+	V4L2_PIX_FMT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
+
+#define V4L2_PIX_FMT_MOD_SYNA_V4H1_128L128C \
+	V4L2_PIX_FMT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
+
+#define V4L2_PIX_FMT_MOD_SYNA_V4H3P8_128L128C \
+	V4L2_PIX_FMT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
 
 /*
  *	F O R M A T   E N U M E R A T I O N
-- 
2.17.1

