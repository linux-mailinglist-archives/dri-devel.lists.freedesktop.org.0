Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262F3B4837
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 19:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1EE6EE1F;
	Fri, 25 Jun 2021 17:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F3F6EE1C;
 Fri, 25 Jun 2021 17:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2Bf0j9a4jDx40hwbV0v7G+jAakmPonFCx8m5uE4AJ5LFSp0QYcGpzsBgJjbMxx3hzFjepiM1WgCtQTtmb5K7MNJJ54UWNwOl6C2pEC4y0eJF6OrxBMzRhbhS5g+CAhG/uJ0bgJw6oGI8DZ50kqsO2I5yZUFQDJCL4iVBeaE6fuZX7yweWYJJQL+u/tfnznOosbKpIbol5ZiYNVyzEHCMXzbU61LEkcp1QS16eqpLGKs15PpNbHNzCeeOIwzSi6GQOm+5dwHRj6TiYhDv23tYViDFm4DMC5J1WFG9hn4rsZOKd6z8RzSzRFkaKFN1J54FZVZ37KVYlf0l1h/gRDgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnBiqDIGazLas9alx1hBxUyeyXlZxxobdElOUAsv5/o=;
 b=edAJHwVBkP56X7D/oOJxzSdSNN7PXYhmtMnWgZ1z+n0wNNvBMHYiFdGgk8JsAeRgbKCaPSc4WBfmf3lY6w0hPt59lRTsBbXhDTHHLRxEJOcvm5RWH4A4hmSl6tsGqx6mZ2aRKFahfy4IlS2NrsxPhSUJM6TWrifuteYUk/7H5/42jrSch8BHnCnXa2muEFskrk9lSDpds8yee5uyJG43njoJLg57W6T/Xl88BmxqLlB2PdNycKPklTQkG5ucVL5ulyoDQOC4zyqZUpb/wTRWO8UrW7y15FjDeEvurSeM8dtT/wbj2+9cexdEww8sERVVyfxLBq+FUMS2cYCXPQHbWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnBiqDIGazLas9alx1hBxUyeyXlZxxobdElOUAsv5/o=;
 b=lJgX6sN18QNdEG4WEcqe8+8Dc8tCV82Ugz+szCdD0I2a79+5d4a1y92MOxf2DanaT0ebNPXutzPPpuMcm/VufsLNPcTn7M1hkNRkBeaYJiBZGuFbAAwi7Zv7iyoyxLxwCJsybpX2m3IupqvrE2d911lDRUIwyFhRDeFe+cxsme0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 17:28:25 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 17:28:25 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: raise error on incorrect mem_type
Date: Fri, 25 Jun 2021 19:28:04 +0200
Message-Id: <20210625172804.3193-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625172804.3193-1-nirmoy.das@amd.com>
References: <20210625172804.3193-1-nirmoy.das@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [217.86.118.138]
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.118.138) by
 FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Fri, 25 Jun 2021 17:28:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdbb1886-d4b5-47bf-d417-08d937fea317
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB50705442D725234214F15B008B069@DM4PR12MB5070.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VnYn1XeWoEPfCAHUarKUbcfhNT4chnzuRKv/F/Bx+a46s8mGl3Q88wtw21pLNfzAlY0GY7rfJdN81UpfbY9Fq9+bXQaZT1/hpMx+uYwj3048jIOAl9yh3YnQEQQk01R612BEcZzjKl0gonZUf3m8gjFopq+2Lh1eZIVySN7/wBqVFgv4AFpLIN6Ye8BN1orYf1sJkcuFxlKRPCZjzy3aMXRVOB7TdRMwfkQFOu0M9X2hZY50/sl+HBr8uju1PPP3Uh9NAW35UMnXrHeRherDDkHJ1qx0YC4TA0w7s8LTNremKJRdHEx+jMPHeezmRadjHsXfLTjaZ8JhsqKAN3kuChwKPN2FKRlgyRbPTLdoU+hoChgv0BBJJopGS06iTn+l9MlkV2ng2wWvxTzHav+N711AWke78hWZFVA9GgvCZC99e9SxUAAdFo/iRYTvYmrCjIPi3o5bZ/0jF1l4CKtfU3ByZ5DVY2NdLl91eXYZ9HIbl8tfByVuGx9e6+bs2kQSB1Tl07A2gQBWsbp7mN0av6eeLlc8WW5FM86mVsE1lrIP3O3tVPTk0YBf3UTez9pGgsc5THzU+DHso+ek+aBMNb9zSbuKjRLZuiVsXUw6NQ7ljStIA0CxvAK/IhgWlH6tWMbqqFzRtc7PKZzWqTc3j5P5ztkA/NxIvpdFkunj2SQ1HIhLgMetWkiPVjUK1DdnCDSMdwTexqiERk/XaMjl7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(52116002)(6506007)(4326008)(5660300002)(66476007)(66556008)(16526019)(26005)(66946007)(4744005)(1076003)(2906002)(86362001)(450100002)(44832011)(2616005)(38100700002)(38350700002)(186003)(6486002)(36756003)(8936002)(6666004)(316002)(956004)(478600001)(6916009)(83380400001)(6512007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o1IvhiUKzZ7CXtd5nW+mjW0yaI7JWmwH3p6Kd6tpY2ilkbdPX0hJzOZsWypV?=
 =?us-ascii?Q?36z6WeV3kaFBwfa/Vl2Vt5fs1HhsOtzA71AhXr3QSvW7Yh58FQqd7UnRa2yB?=
 =?us-ascii?Q?PyUmPHv5X5e0bcywbC9WXdv7XPZQAQVafTOItQseZpy2u4caE0kKyRosG8SJ?=
 =?us-ascii?Q?rAD3c7eiNQZvNLFSjlIlJ8WP0x/AktwfbX+pnPTZey06R5VtwfTuLjtQ1irj?=
 =?us-ascii?Q?rLYdDggdqzOOpDpPcv80aHwnuNhCPQ2oCn6bQxSM666Z/YE50ZqbLKneSnC8?=
 =?us-ascii?Q?nL2n5PqZoBlQma1GCZ649SrQYCHyCo5adNiBV3+MVoyplBDuvlMjgPUE7WSP?=
 =?us-ascii?Q?MSfBQ92BMZJaVyOWW15sU1WYchmDOF9KwBVwv3iJVQEaTqehvXANT/6zAG9h?=
 =?us-ascii?Q?7KcMTa1LCXIXGq5QlUWcDs19YduGo+s/gyDNrI7DN6PJqUFPbNaRd7UKG378?=
 =?us-ascii?Q?CqOw7qINFxYzZ1C2vJPK1SnJtbIBztWsDQjzHddNMbyxgL+RDaIMwcU8hpe5?=
 =?us-ascii?Q?n83bjPImcoiaL8GyPor2XGjRipgVB5CkeFkYAf/y8rzq0iNwYuGmxATS3YlQ?=
 =?us-ascii?Q?Ce2G6KQN0zQc1pGXW1K27EFt28a95DAfH0leSB4TuMq9XuFWNSn5cKrtQW8h?=
 =?us-ascii?Q?eyboN3VC2PLJPTvq7JB60jwqrzR3ZJnpDvLtM6XY2R0DnbB7Kz7/gdprNalu?=
 =?us-ascii?Q?sbSoZd0Mvh6nnfu7hNRlFTA1VUn4mrPN+sxiHaJB/65cIAyc1AHQ3Hr80j29?=
 =?us-ascii?Q?RrmTtpJBPguWhlbOV95nkezlls7xseAXp8hlyHTLNcmTSPbCr5iEdG5mdYod?=
 =?us-ascii?Q?Ydi38zcqQumZ0zuKgxCi5ka3PqT7hMWddnnyqN/00y/skYqmlTfhAThl+IhM?=
 =?us-ascii?Q?M9tahdxlR7An4bkfrvOtNL2oPJFu3fwPQdCqpdhu4N8lqAl6AqktvbwGatyV?=
 =?us-ascii?Q?vZ0yhshXZbdUL/kua1r8nyPPfW8mKaQGJVTiWx0elcMRL4hf3RlTlExgRM7M?=
 =?us-ascii?Q?6dmmDH8WJbkqIsozusgswS9XOnvAeHxXaiEIghIrOkk8C9275NDewBsfjxVD?=
 =?us-ascii?Q?r3tFdF86Aa+TRaGcwbx08RLwx+NSdgFlxaSkZHJbM1VLuONA9la7TAJHT1dc?=
 =?us-ascii?Q?RaseH8n9Fn1syOxxVEvK8PO53BxhoBQ41dEaLutJ1dRvMm+ZKbLuhyeevtbo?=
 =?us-ascii?Q?gMjCkUhnlJtf3jHKnU4tJ2RRKzqeHAeeHZMf6LpEx//8OK8rEYRf8g1gLQrU?=
 =?us-ascii?Q?Z+rw/IgVfToRTO2d96cDRXvvWlrO7PvzU2wCpX51iWagnU//O0b0+5iy3gk9?=
 =?us-ascii?Q?v9uF7TJ43peOZ6QlfI6zUpAK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbb1886-d4b5-47bf-d417-08d937fea317
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 17:28:24.9464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqJwYdszpo0UMzVPBNILVsuWPkXLUHQN/S0jCDuioem1ZeIUI/iAcAD6xLTKT4DfZkIB1D3yrXfD9ncMxEiKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5070
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
Cc: Felix.Kuehling@amd.com, Nirmoy Das <nirmoy.das@amd.com>,
 Christian.Koenig@amd.com, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Be more defensive and raise error on wrong mem_type
argument in amdgpu_gtt_mgr_has_gart_addr().

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 543000304a1c..0b0fa87b115c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -107,8 +107,12 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
  */
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
 {
-	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
+	struct amdgpu_gtt_node *node;
+
+	if (WARN_ON(res->mem_type != TTM_PL_TT))
+		return false;
 
+	node = to_amdgpu_gtt_node(res);
 	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
 }
 
-- 
2.32.0

