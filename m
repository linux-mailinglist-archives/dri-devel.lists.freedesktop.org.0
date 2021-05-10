Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494637942D
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276E86E8C4;
	Mon, 10 May 2021 16:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8900E6E8BB;
 Mon, 10 May 2021 16:37:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBaDXq0efsnM1gVCKGGCcYZaJ5oz3qXdBWL93JNuKPc3qKG+xDLngokHVt4riZlXyUNKwtjVmXCwHWQ5J0AwMlpvLzLOxYWV4FMTav22BtcpXxiMT1THTOYlaeS2+VnaPPHGnXowVwn9LNwIQo+HX3qhYblyV7WztUet6C1e/cjjn+b4Rd32PukHNiqVqIPBtF/ggEHK75uoddE419SVw7CR+kiGvy2R/Z8TrZvR8XDXuzk7csb0tme6G58tmZmf2HE4IhQ34NudAEo5SUj8x9Nn7H5O4qqoVC4Tm0nX0r2fl1Y+XY/Tk6RP3Ox0rw7S55SAvMCevzOaS4Vbg2C7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgvjxGBOwqJefZXd6MzvbwldJ32F5m+yZB9fIe0OTKM=;
 b=J7UdecaNnSuuGPbxz1PNPK52KNGDXlwxyh7M6FTfGL3nnxzfahqKqPnET2c/EYRwhB9zgRElp3dSlJWP6K7X0lNMOCb9F4iRNR18aZYNcldgq1CXyMbnU8UuWIxF3nHsFWV2jtN/7Tq5sSAn4uYQgCm3rWolPE6fZ21Y73qot72NxWEUZwm9h7Tvj+utC2UaDzrM04BZzUq4QNv9Gg55BeEPZKS52RXOU+F8LwWbJLe3R2Xkm1tW4zils6mIA/Wy2R9CelurxF7Zs2mfp7zkU4G9ZTnNG6fL2FaJFCDhYeuGFxc4TkD4/8THsdoDDCCf7UIwPkOY7aV87nLDRskkWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgvjxGBOwqJefZXd6MzvbwldJ32F5m+yZB9fIe0OTKM=;
 b=Gm9rFbvcSIJ+6OfngNJVmUvEQwZ44FDzUn7d8ZmkTsmjabAlQJTRR8Knub0Nlf02JT6JKCzkVnf1n8b/8GkrFX/TTdckgQnqwD2D8ynbMIkpDKSOWRCNRI1vFxJwmLFqZdzedl4UXYxWKa4gRzJXdqZI9rbYn3A28qxjY2Paq7o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4717.namprd12.prod.outlook.com (2603:10b6:805:e2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Mon, 10 May
 2021 16:37:11 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:37:11 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 15/16] drm/amd/display: Remove superflous
 drm_mode_config_cleanup
Date: Mon, 10 May 2021 12:36:24 -0400
Message-Id: <20210510163625.407105-16-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:37:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd2fb5b-3e59-4d37-54f5-08d913d1dbf6
X-MS-TrafficTypeDiagnostic: SN6PR12MB4717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB47172D58CC623D429A4309D4EA549@SN6PR12MB4717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:25;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ngs82JYkOa6ip7PcLESJB8O3CNCZ3v6TWboyLg1cclrNe/IPTEUSo/soVW9Ub9Zv4PaWQ5m0Jqec8CIOjAAwJC1iSstc26XRftruqEwKZcvOsq9QCaec8LUtpbAOm3Ytx6ZWPQZBQ6GPrhPQEWT5svaQpyoAOo4zOxikWjLraEVboG8Q+tmIKizG/VKBFPVvk+Av1UVr8sTteUinV1F/KFUEknQ5zE52odvBIaZaCkUITwfuHAVroJ4UHklH1LaxrZ0NvutSzRYG4xhwwdYZm150N2g08wGnnxs0QNucl85ECjpb9DFct1Cq3LY/jw63DaakKLPm0K9OCTXxJoW1I6YhW1fAgeA0xA+SwJSl5MNSYBHRtCbBpm5PdQExv8xnrmZ2lORdcTltE2QPwPTg1xJHX3zBiTppHrZVNm/l593PIs4bclWOxXHxrGpDLY1Fnfyb1ijO/cVUaD7dLc8K2RsSQ/75s2JFCNNGpYxHn9+uyWKf2DaWXnh/W/nhnqxEOTEPd+2XGN/i/4OjDOQjdz37xCDH5VItoxbDjxU4tHt4RpOtKiHp/IFIrERHbJCQuaULJMUzE7gstG4Qw6cBp+iNXQ30h2+yYUTehhAMafQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6486002)(44832011)(83380400001)(5660300002)(2616005)(8676002)(1076003)(86362001)(6506007)(478600001)(186003)(16526019)(8936002)(6512007)(6666004)(38100700002)(36756003)(4744005)(52116002)(2906002)(316002)(4326008)(66946007)(6636002)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Hz0EU/4KhscPqZxZ0oI6rJ3WHHTO4mEwFm6Mje9wg1WBvOqZ7EHBx2TfAgqe?=
 =?us-ascii?Q?/c+BBVIzqDPuVRF4anIPrINQfEyNXDDtZYWMbDRaUjgc170gJiWYY5XNAeTJ?=
 =?us-ascii?Q?zYKmV5xVMDnDxd+vEboabhei27GiMu47u4AZgFap5Zhz+11dgyq/QdRPVDTN?=
 =?us-ascii?Q?NTEAdIKHmlrbon0rQD6THaUrx7AmI2ONE2e1p0M10Mm3br22akE7yDwWal+v?=
 =?us-ascii?Q?urluMp1Y6Z0F6M7pahF0mZYCozhFceJpaxQRV0H8dGlHVMsRV5ok7JE32hNh?=
 =?us-ascii?Q?6UdurtZhSV2WTpUg6avLEFFTw6twmOper02If2EK7Oslu2yBJwWNgwbtYdJD?=
 =?us-ascii?Q?dUT2KnnaTiiQZ5QwMPJ8Hs0UcQxeg22ACKPSEYmNMGR7dXqSTK98kWvC5EmK?=
 =?us-ascii?Q?LFxW7yKHSJFjbP/M1HHUSci9BUC78rwsRgj5Uqf7vwLy/30OwSOoU/xCVUkM?=
 =?us-ascii?Q?wuWrj95mBdjvYYUA1w0TCeTa0Pch87ONQlU6ST/EBoLaPEOyF5L573qY/JPx?=
 =?us-ascii?Q?3D8gx7NSCQ8an3e2DuyltZ8YMoOC204rhl3moGSIOx+w4jULpx1765w0KpEb?=
 =?us-ascii?Q?9n27hQ/Y/HwfRGvexBdnNYOKRSCAKm3f/lpA61enWcA9hEqIlgg/w7qeG+I3?=
 =?us-ascii?Q?DcHKUC3PTNwFQFYtEC2i5PCugBrdZp1fezKMcT8FVsWGUVqlHLveUuqM2u9T?=
 =?us-ascii?Q?Im8Axb5zgNiGFU2PBMLBlBkDhz+TTpEfUrXNmqhzRpqOTigm5E5zK++TDWg8?=
 =?us-ascii?Q?/o2zhIdsFndjdm5p21LGfnSOwWOCmWkMCkRPH4RlmnjyHezf4SmTy78tQNy3?=
 =?us-ascii?Q?dQJH3lfcJhVNBD+XqxHdc6Bp3cj+02LSiF0BgwFv1UC4LZc2RyisfIDd12vC?=
 =?us-ascii?Q?+QYNuSacoesd7KSaTpYcF8nAT7bZdoxr4iu7QwG3Y1OLtghucQYoJiLcAFvj?=
 =?us-ascii?Q?Gm4++eEzac4rWw+BjYrgLetGeuNBPAe45rSS0e/QubMrQ5THyq9cIDQx3jYF?=
 =?us-ascii?Q?aZfEDcuB7kU5ZtEBHp8TFcDCFN+mzrg+iCWOViAm07kNYsG91RT37jsU1DNs?=
 =?us-ascii?Q?KVFMRvNO4oeCKTBkmE7zgAH2cxgmgCWo2y/P5gcG1q9B4AQOFLEH+zzDQJy4?=
 =?us-ascii?Q?M+Mt1Mb6oNP59JJCIABuTN92Jv35l939I3BaItGqEZLB00PqP4R+vQfR+PaR?=
 =?us-ascii?Q?KUBMMdX9ZxcEc29zOofDuuWDYQZf0EcbOEgk2eqzysH792PDREwMpyZJbnwu?=
 =?us-ascii?Q?TWSU0/Wc9w0ffEkIxH6VQMwRB/l//Jki0UfZvOVLky24PZbt2ZEIVzy+A/Oy?=
 =?us-ascii?Q?vvqwoHTYIQkO+bD0oFmwErtcfp3AlChiUAVWRcZxnnHeFdpbZvj59WNGACp9?=
 =?us-ascii?Q?C0UVIBaY9DZBkQZ4EjVD31PE7UrW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd2fb5b-3e59-4d37-54f5-08d913d1dbf6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:37:11.1201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUFmkpj812liLPH7VEVWGeCKCHZHMv2LgonB+Q7ysk3dRW2BXHeci9efPCE2zU05bOfOUSunOjCJerhP6IuHYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4717
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's already being released by DRM core through devm

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6c2c6a51ce6c..9728a0158bcb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3757,7 +3757,6 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 
 static void amdgpu_dm_destroy_drm_device(struct amdgpu_display_manager *dm)
 {
-	drm_mode_config_cleanup(dm->ddev);
 	drm_atomic_private_obj_fini(&dm->atomic_obj);
 	return;
 }
-- 
2.25.1

