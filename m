Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72779614775
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 11:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DCA10E365;
	Tue,  1 Nov 2022 10:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C13810E365
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 10:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mC8GAPdebjQIiJATMq2NyKe6p6Z4qsfCSf5r3El064eLuPbsoTFZnw51xrNdKeEd6SVr86szTPTfFu1t+xYmXkB9yViWuPD9gu0rP1E5t+a3jXIJtbK+kjs95yKbTxgiigPdj8CImeS81YzfGIZ05KeBCKMNR1f3vUg3t5/vUSubvlVHmtxXcWr6pI2q//W9Gf8iADyUiGsceJXhieQooruTPTWf668Z38mi7fwwAnx6n68JgqjrOGorQ37UfCUBqAGJCEPHQlNbFrfauuLr0dnhGHI5zSLc0eJlCCIWzSmdCeZCdNQxyzYOrA+3T4ZlB9k5yEnWhlcvgsiEnNKbPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLbFrOWEYWjaTOVaR/p2ZKNFdbel3IZbWaevVbsdCwo=;
 b=hArLA82YgyuW81kmIpk+Uvr/tGYkQmOBahAgL9YNEkwbqlELsLfzk4J54kmc/SNYOuqjT9V/7eKGLEhpvI9zW00GiP4lgRsaONOxW0y/uTGhWXMCIVTB/6aEjHQ5tbn7xHUQuI6aocyPyUO59zdkTx5qHK4cFHcxUwRboOLLQnexSFqr7/rjk1JtXdD7/9T5iNV/y9ndqy6FBLkM3nOMzb67Stj1RdAJ1OlireYoxo0UqgB3p97BPC90qJuJt3sOX0J5PM0MJYME+4JYo11uHyhJUeIHfXuXfbxKuNeUMFE6cH+fB03Slr8a9LkBDAENGypG4q/dY7c4g34XiU/C3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLbFrOWEYWjaTOVaR/p2ZKNFdbel3IZbWaevVbsdCwo=;
 b=A9114vFYm6bklPo4oWG1goZjrgwrAQ/3Y2KHdzLdTFp09Nl8grejhqotjr6lnahDesNX10NMMb5LGFnAXIAiT9RVFv/YExoIxjltazLd3Olijn59auzrNYCYTfPdh3L/tdVj7qdXbG+GENpVui+fQybZlSOjMK6ByHO7+n6x19k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MW4PR03MB6362.namprd03.prod.outlook.com (2603:10b6:303:11d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 10:05:51 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 10:05:51 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] media: videodev2.h: add pixel format modifiers
Date: Tue,  1 Nov 2022 18:04:46 +0800
Message-Id: <20221101100448.66712-3-randy.li@synaptics.com>
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
X-MS-Office365-Filtering-Correlation-Id: fbe8876a-776a-444b-52c3-08dabbf0a7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H4SUqSfy3xre2VoMOqhxyjpdd9Yh3pk9dZQPsjBGLnj5Kosk5xq0ceuJCqSXpQzm5z7NTAoL8Npu9OqMYxB99v3ObJkA1Htgzb65ZLbrf1EeoXAqUnpP5qSFynHuRBCBjUh5JtDSLk1+gxkSftiuQXVOqCisKemG3DW+10uC5o9HoJiYNLY2jDxpDRHK24XhnB+6OM7FyRpapS9TYeb2DVGfG7C+erEDurRUsHd3hQ4Jl32syKPeYaSiWLKb3JDMb4OKcvRSmEflEuMYaSJqq7p3ueb5AqRdcyp7oTZ1seCe+v4aFVQyRp2vGcbFy4IniY96D0oBfe1wANogP4hriO2wGvEIjNWVik5sY3/EG6gCVsWSe8pUT+LHnSQQYHLAYy60ydA0FF/Lgdht8svTFLcgR76a7DSkR9bxVHv9C69ULVZ79Pg1ghJfMk9JAZ2CPvAvUZyjw7JudmEw+utOttOJ2VaNnnmNQwnbTPVogmMFZiWZ38f0F/VR53KMnHMdcErVMDtT1nJi+w/nbR+U2ErKWKXw1Km3OM4QF0Z6JSObwwGeRdvaYtcD46tfwaKqvXdj4cshQ3hiBJu/PVr42KIkUyF3FIpL29MgIfv/e8xFPdytyfFfYFpDxEfomn7irshqzDq917TJZ2luM6cpeOlxnxKQ4lHf8xvD1xaNP0hBwYn7Za1k8VXxb+fYRkVl0FW/xCy6gGb9Dk0yb72zFKrillggT2sWk6L9L0PQkLIdU26ZEh0YA/OhD4POu3jE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199015)(36756003)(478600001)(86362001)(6486002)(6506007)(66946007)(316002)(6916009)(66476007)(66556008)(107886003)(4326008)(8676002)(6666004)(52116002)(6512007)(8936002)(5660300002)(26005)(41300700001)(1076003)(2906002)(186003)(7416002)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HbxwtuiiREkKfFQd4tCbaTI3X9JCeNhumQYX1Jov0UhwvM7cSVlaOpKCK79q?=
 =?us-ascii?Q?5qmHWMe1sEPSlTSAKAFoK/1DplrUNDqcIHtT6gwmiWigXJz24AxrRFOuEFDJ?=
 =?us-ascii?Q?BXhtjMvLF39Iqy/p1aRiL8vxU3I83ogFRLDH8/2k7mbcGUFWudsBdsMbN9rE?=
 =?us-ascii?Q?xANGKq3BDyxzBGnUGckmTM1oaWfcPmGRJfRUoB6Q4A/z3tFaUb5OSuR+cCDH?=
 =?us-ascii?Q?I8aGDv6MjbXtGRqtHF27K/646HBMLztS8OZP8xh2+9hHzRfCLBSzdRvpul5x?=
 =?us-ascii?Q?czRfqVcZbNri01jzqb9pPzPKHikSc2ZknedXCDtZSZL3VkPnxicwMi0Qrcl8?=
 =?us-ascii?Q?GkSdsq2u1I6uPdet0MFDZJlWW5zpG8Pc4O0nYIwQhGqX4IRjuX06uf9O1lra?=
 =?us-ascii?Q?GIm1mF8P5ijs1wrShtLA834EqTEDpORJkSjn+PXsiXIC7DgPPZn2PIjOQoN1?=
 =?us-ascii?Q?2wBoVyCjZBh+djBcB2cN3U580/2gkKL3epEvgsDoUkk3WjFnZMcxN/vEi3wF?=
 =?us-ascii?Q?mwRpCVjBccjszkqsc2JpMCbsvH2+JvJWYe1aOh5N3t8RcWlIQ1byRovZ1bzU?=
 =?us-ascii?Q?rZvcbChC2icaoRn+M+XmirttH/cvpnM8GScIdAtkEJiCnBKxbJ/eJ7hNBISK?=
 =?us-ascii?Q?FQ0lXf68tWU3pv19fMTnhJOcDLGxkyvqOMNZD5taobfKoF5vb2q7NpcCkXNp?=
 =?us-ascii?Q?r5BukUID0xmb/mPmjWlQ02wnGgQnNPmkslKbk0wDR2t1CZw0LG4vss92zttf?=
 =?us-ascii?Q?G3XLFKMTZNaUFqSxkeykHCepifmIjZ9E6+IALisJHcVnvyZlqRq7k01pAHRm?=
 =?us-ascii?Q?MxvF0ZJZzKHP8VYN+bgV3ONP3f9If0ajZs/dw9BgtW3fI/5M0dWU5BtdqlJ7?=
 =?us-ascii?Q?S7w9uuEUszpRBlbCtPEaPp28zU12wy7Xh/pCjZJtwcq/mXVPdiULvkcKKMtw?=
 =?us-ascii?Q?yNkUFzCbGn6SKZeJwOqOxAboA2OcNlr6N003sSJbr3JU0MC3XdLOKEYIib2G?=
 =?us-ascii?Q?pjHBaL7ap5tF0opgtZyqFzm5rqd1afuOUbf7JYipwb9Jx2StFqJ42KDIcSW0?=
 =?us-ascii?Q?rxdq9oxGcTS4QOtD5VJ99AUnAoTd41xKYEj3hOzg0YPUIpiFs4ZukZ5M3V6d?=
 =?us-ascii?Q?tilx4D0xjBCFg9jM4IQhqTnhBWJjhsdQa7lXf5oGyjILyCHYHiazI0qWO7FC?=
 =?us-ascii?Q?L35J34UADwUKTUrx76EM9tOCFl0JsZ1kKvXvT4dHEztK960AMK7qIE0/Eo1L?=
 =?us-ascii?Q?zUTYIjVGueGeaqD5LUhfDSDnzM8Vaoug2rEko6sc86j+XqH7oE/33IjQV8bz?=
 =?us-ascii?Q?MrTrA/E1xauHmllSasWk7/V8dV1qU5HmA5WAfGpWInz4L8XTF0cvwPdANMK9?=
 =?us-ascii?Q?9ouh5roet+4lSa268GXCueZ8OOv8hF+NVIJ79q9zJeQb2KBX6uMRpCAoNri4?=
 =?us-ascii?Q?avPyVXrggCykl9b8tImhEdNF9WUOvNyHpHniw2GR2t5M6w/sUHEqYiCDyjKF?=
 =?us-ascii?Q?u8EGQmxKe6Uq6980Bae8i3ohS47vVU9tmfKWPUeQ+A/Z0eaItVJBMFSPz+cA?=
 =?us-ascii?Q?TzxiuIkEbgrn50InQ6lSYJDamikBDEkGRw/kgwA2?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe8876a-776a-444b-52c3-08dabbf0a7d5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 10:05:51.1791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbV16mQ5ipMUr9n6weVeaN3UaUciPfTJSQqVK8nSP6366VvUQv4v3fYPUrwqR3c8DJfkOa0SEYusQU0x7A0YWg==
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

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 include/uapi/linux/videodev2.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 29da1f4b4578..d00b2e9c0c54 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -816,6 +816,26 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA	0x00000001
 #define V4L2_PIX_FMT_FLAG_SET_CSC	0x00000002
 
+/*
+ *  F O R M A T   M O D I F I E S
+ */
+/* Vendor Ids: */
+#define V4L2_PIX_FMT_RESERVED           ((1ULL << 56) - 1)
+
+#define fourcc_mod_get_vendor(modifier) \
+	(((modifier) >> 56) & 0xff)
+
+#define fourcc_mod_is_vendor(modifier, vendor) \
+	(fourcc_mod_get_vendor(modifier) == V4L2_PIX_FMT_MOD_VENDOR_## vendor)
+
+#define fourcc_mod_code(vendor, val) \
+	((((__u64)V4L2_PIX_FMT_MOD_VENDOR_## vendor) << 56) | ((val) & 0x00ffffffffffffffULL))
+
+/* Format Modifier tokens */
+#define V4L2_PIX_FMT_MOD_INVALID  fourcc_mod_code(NONE, V4L2_PIX_FMT_RESERVED)
+#define V4L2_PIX_FMT_MOD_LINEAR   fourcc_mod_code(NONE, 0)
+
+
 /*
  *	F O R M A T   E N U M E R A T I O N
  */
-- 
2.17.1

