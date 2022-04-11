Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD044FC432
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0924810EBB5;
	Mon, 11 Apr 2022 18:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC39D10EBBB;
 Mon, 11 Apr 2022 18:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxm3CzzqkTtS03cWb2HicBCC6SLGSyeZTdwaRXJE11m3pKzhsHxVVINy81fJN6oADsqlKSh0YC/S5WfHtpBnkrLHM6Lck5/VcTTfJpTp9oaPHD+AT3svTw9rHTExQ6DZL/GivgyWwKehs0fbogvUFf6sIg1QRCPBQOzfSKB92ruG0aSXVQ0yGdSW6QAFhy2gnI11lkoyb2XFrSJsWvxJnVL8A62QpdG+j64XtS3Fwn+b1V/E0m54mNf5CC3kDO2ivRPZlkZQ9zoYEpzrOAktj4Myd38L+G4a1M6inqambyilRjxtMlugMBU96Yzm8D3quHACouTuwX1EDy6G0DZxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lbDthqxbHvd2na5Qq9ruw06gk6BHofEjvPPTcXZeKs=;
 b=L09rOl5apAqpWLIayQWUdVju43o/xyjiMnTY37Dk2/l0xY9UZjfFHEi90SJmtgqvrEpxnytSD4SMPLVU26EzdRVyRTJ5SfjUBGBbwS21rVdBinxiHqLTdTMXI9Uj3Sbjz36b79aHfGNzx6Y4Nl0GUsTcQwPSk3yVvNfU1WsXRE8FIv5iPObf188BoThXtfY1mscRkC4zVXVrwGP40FA5BMnTuYsyrrCVP4+hwkWwuPzfe/hgUISEQJp9Fs7KZZUgu/SQuVfIQ5HonZ88N/p1DP0EyNoTfA5vJxbx2tyoE+J9NND29Fit+TaqeLjltx3SuPPFd6hOYP9176ptjpct8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lbDthqxbHvd2na5Qq9ruw06gk6BHofEjvPPTcXZeKs=;
 b=nRSuin2DSNtMXyi/VaPRlszt368mjDdRMrHM4ehalMnOLilGlWua8z2NFZwIWLitLGf17z6YNn4oP7T1q6acPd4G0FIL+bXNPzoazWtcJNw68KfTaD4Syvf/aa45ODDfU8J4egfCQOk8RZ5ZTUTLpV2tf8ncjeN5hGmgIX9eO2/rE1U/2AsLOyKetghNGf3EZ8ZX0naWQEbH1XoIHjBVLJGqFyXPAiwPGe1XbqOtEQBCv0ofM6ND0Bg+9LsvvyWegnOZnf2xO9KYM/qmf9hL2EFiEa68ETfznkQ5Dcs0WoEVSVXB3EsYFVOF5Sl+1Xna2wTBrsy/1CjBDlb2rRJBIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MWHPR12MB1824.namprd12.prod.outlook.com (2603:10b6:300:113::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 18:36:49 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 18:36:49 +0000
Date: Mon, 11 Apr 2022 15:36:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 28/34] drm/i915/gvt: convert to use
 vfio_register_emulated_iommu_dev
Message-ID: <20220411183648.GA2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-29-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-29-hch@lst.de>
X-ClientProxiedBy: MN2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95414e2d-8466-4d73-0d19-08da1bea3d7b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1824:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1824E458407BC6FFB9CA9E3BC2EA9@MWHPR12MB1824.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWVDu3Slyp4kn+fXb4ZYXnAHjURSvcwM79Hevpz2vDlR8zMJ2LvRbPqJpbnPkwrfHuoxWMSR/8jH+2IaKXJONghsx4iL37RSszF2XtcV+dbe/4608pVebmWAeYmI4NaMw/dhx+VaQW0iaEXZttds0g7gxEu6pBFgVayE4NxRHQp2Mj75BfzDrhLC0okUQOhhEG4S9JPrzIUx3P1CmaxriA2Ckl1rySO8kw/N0Au19u8TUNrOWkbuGnvCVdLrDv326I3Zx9E8oACa4Qooi3UBYVZHeT8WpHpfPXU+7Rj/GZDd89UVhwkBOmRLHeIFb/5/gyjF4yZOPEGiMR3n7whnX9/3mhe7tIUgnD4Lx8MYIL1Igd4IhPbEnuczwbPIWYlwF2yITTV2ZCsdpOFhOvfLX/g75RmXhBv2tS5DNsqUKTIL5NvygBc8sQex0H9keuDe2MVsM94Q8mVSsD2vJjkCtXS7l4XMGBYsISihrxLWxRFgqzolOj2ZlsrdN9JU3aQqA+VQwai9LBViX8BGKfFW5dhZcQQpVsUX9PfTlsp71orfemp3ZzI1yXFrLHmAmN70o52nOLVRUs7LnTdKtKlPHRr2vOIQeUxzpLOq2Rb4VIMUC6/bCZYRRY8ZO0Wx1QeL2oFUIKXeaX2WVi8FYcdQGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(6486002)(4326008)(6916009)(54906003)(66476007)(8676002)(6512007)(508600001)(316002)(36756003)(33656002)(86362001)(7416002)(38100700002)(6506007)(66556008)(1076003)(2616005)(2906002)(4744005)(5660300002)(26005)(8936002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lfPWxE6Kmfhgyz285N/nqsE58HorXpdceyTIf5CDLUBngvc8+KTTmFo/UUxa?=
 =?us-ascii?Q?lWd3bIRVRxifIL+ED39w63vdbJKuOpbpB1lzNTCHotZz6r19dKEMHH9i7Sq8?=
 =?us-ascii?Q?XdaMRarFeyNijHCdyFub7cW18ViqwK8ABeUYKL+Bf0m2IeVDW8wiDkObY7rE?=
 =?us-ascii?Q?zQu3ewRp4yyEIkxgaG5uHGndsyV8ftXA+HM5RC9PiWDkx15bccyxLhVZhEtA?=
 =?us-ascii?Q?RSA/jhMZdSfHFVLZ5DVCZRA/fakL6nN0eQrSP82mwn9DgydMl5UsoeFUtQVV?=
 =?us-ascii?Q?F+cmUVgBuCnB2Cc61s/ODiioFEmqqAo2tRiD7AUK5Ek7rOVVlm3QBuQ46iOa?=
 =?us-ascii?Q?tThTnMabLl6HZHuem0Rl7BjjsYSuPaoqHc/mFX/Vw9p39OiTVxL3RC0SNrLE?=
 =?us-ascii?Q?V4MxFxqw1arLTTkqSYE6n1lJExLdsLnsr1DFPDUIsujdjMMEgTfO3IIAl9wB?=
 =?us-ascii?Q?OeYwKeRbNndf/tMcUhVRQey8jQM92UapBlDfo6WH+/Xakhx11STw74wnG0mP?=
 =?us-ascii?Q?41UU+mXgrZIivcRheCl0doyQQvKVfxHrCjw/JHQ+nIyQJzyWkaElWBP6lZVw?=
 =?us-ascii?Q?U6Vj/LMblDHt3i5t1D1MQbgbo2fDNjOCgz56EAaoZtMiXl1pq/v4WT5iEVIj?=
 =?us-ascii?Q?0gYSmuoIXujDcWvYDL2GI2IFhZ8SYsS3Dv4y/zBa3bzp+CYAl++GtPZWyJKX?=
 =?us-ascii?Q?BW4v7JwJNCFBwYbNsXW7fu0DV3PdAZUpA82Q0YhosS0qok/hUcNXCcv4+y25?=
 =?us-ascii?Q?P4nrihczXu69lIsqiGnh1ocNBlruOfRJO9KIJYp9INA7V/KfUNuZDLb6APVH?=
 =?us-ascii?Q?r9L2Jfzl5DCKzyKu9RseGL5aZwuPxuFltfxueE9Ji0NwU4RW2gNvEfr3H5M0?=
 =?us-ascii?Q?4Ae76qyRBvN6jAz/T4GwyjN0toraKXa8rkro7c9llfaJ3Uk+oWckLltN1QRO?=
 =?us-ascii?Q?OY2QGqMt1JrhAYB2iffSnpGoIR7G5YK621DtL4DHA+8ks0OcQwyUJT1vNP2J?=
 =?us-ascii?Q?dMr2TtTFq3FcAitBvQijAKKs1X5Y2hMBr8RuAf5oFYmnQJxlEgeKclfoMBfd?=
 =?us-ascii?Q?E82o+1E+FlJd4qx7CTa84VXJBOQfZpHCt/UPVS2AUmviYhQ5cgDEavYqR8mx?=
 =?us-ascii?Q?MkgjkBOsH3YNxzORXDEReGc/MmAiMzDO9UHmUa/i2tR1WTGReuVuaIXGCWCl?=
 =?us-ascii?Q?jQMlkmVJPoG+t4nzg+QDHmiM5587VOR1NVUFnLS6bTukfaHBcEKXZuVKL5Iz?=
 =?us-ascii?Q?Dpormt9yYku/XtIZnO/qx1n3GhOE4zwd7y/k/Wc1aTsM/xmuil162wYh6HLf?=
 =?us-ascii?Q?oh4gecACjcebOg0t+WTzDxxkmnRsIxP+e1x3pcOiAYuaVoxrotqFVOrwyhqH?=
 =?us-ascii?Q?9vLx3pl52fNEq4Atfkt8+xX5UU3d1ANsoWifgF8Ot3WCLKrN4U6+MhProZAX?=
 =?us-ascii?Q?q26U7Iyo53MP/+jPf5Bt0p4oBmxag37CAM3o0sQXY3X+FsjVs/bybpGGbs7X?=
 =?us-ascii?Q?K/9j0PTHBMr1bdGhMUyiaHpYsMWwWtkUNmOUADYSDcXzwlQdtslIC0FIaOnG?=
 =?us-ascii?Q?1JLl2j0GjiT9oumi5qp0C5N0mxJHnPZG1vHqmxloZgDndbjrqSrS2oYDwNOF?=
 =?us-ascii?Q?Cu3lCFIAjz5PPcrc1d6INykCHBydPy9vC+mDz/RAafabeJ1kIJXI8elBXF1r?=
 =?us-ascii?Q?xhHw5JQpJsDpu43ar43B8oYcy0l/bnOPKZ4Uja83OZL22+4p44Opru6J/Ns6?=
 =?us-ascii?Q?lNLfHs8SDw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95414e2d-8466-4d73-0d19-08da1bea3d7b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 18:36:49.5668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrZDsH1uL6PCDef/RFH2DvT7CvghAJ89v69jOzlZoItz017HmLWDr6KdG9/BTQkM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1824
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 04:13:57PM +0200, Christoph Hellwig wrote:

> -static int intel_vgpu_create(struct mdev_device *mdev)
> -{
> -	struct device *pdev = mdev_parent_dev(mdev);
> -	struct intel_gvt *gvt = kdev_to_i915(pdev)->gvt;
> -	struct intel_vgpu_type *type;
> -	struct intel_vgpu *vgpu;
> -
> -	type = &gvt->types[mdev_get_type_group_id(mdev)];
> -	if (!type)
> -		return -EINVAL;
> -
> -	vgpu = intel_gvt_create_vgpu(gvt, type);
> -	if (IS_ERR(vgpu)) {
> -		gvt_err("failed to create intel vgpu: %ld\n", PTR_ERR(vgpu));
> -		return PTR_ERR(vgpu);
> -	}
> -
> -	INIT_WORK(&vgpu->release_work, intel_vgpu_release_work);
> -
> -	vgpu->mdev = mdev;
> -	mdev_set_drvdata(mdev, vgpu);
> -
> -	gvt_dbg_core("intel_vgpu_create succeeded for mdev: %s\n",
> -		     dev_name(mdev_dev(mdev)));

nit: the debug print has the wrong function name now

Rest looks OK

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
