Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B142AC80DF
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 18:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B837510E009;
	Thu, 29 May 2025 16:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jOt5bVy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3C910E009
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 16:29:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnxL18NGHkrfpmzBwZFIXnuJIw/lLArrO6gaI2vU+/1IuQ2PO4/KR3FKkagpI5x0JZYPrmtjjyC2TT2f1FdDxUuJoeWf9Clu16XouhaoKeVlXyirBF3UZbz7rskapUT9y6nbT4XT/BbSMhUoDrjguMHiIRSi6C6+mz4kBmeSORgMrqd1aPFz+w6Qc0fBRocNvOw/r50jEJNlkP3DXjVpeycHKkkpkWzyJBDD3KGmvp0fvb6EYvaiJU10RGW4hcdo14rnEUKVbx0fnhIqZL1zrLU9EK1MDg3H4O2+uLvM07j//HqcaRBlokAA7CoJpViPeRNj3+vgBNm8qoPMpF+wtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFlEEalp4xeEz4zQ4ReUwP4mkRuPIUmhaLfWuP2imt4=;
 b=YoevzW+7g3/3lydFmCJdBETj7JsLBnF8JEPrFXzTFQa+fmJmUBvR8VBzjG17RFScrmh2y8/LpIRSsCMccnitZgXMkO6tLzYIssnPTG+N/ry5ffPoHSgp1NbtXThCEYhCZZ78h3q0Dc6HW6m5FedfZq6U0M7xSPZL6+aN4OoXVxlDT1lwTVvlMHSI5gIVbiBm0Ki9yyhyP7PW8rafBGziEM61K7B3wrWPHSZTGUQC1jcFbcFL1KK06li0JlfkZ55ePT7IKouPaQa1x0AK7RAq0aBx+PuOxbYttsKA0gY9hNU7CGmubu4nnhXzwjuDjiKw+KlCQA9WvZtmVzzSOXr0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFlEEalp4xeEz4zQ4ReUwP4mkRuPIUmhaLfWuP2imt4=;
 b=jOt5bVy8TdJ4Li/ajUOQsxPT8utAgiQyj+8xT2Nas471Z3JVftpohgjuCObf5eqR8NGgGyMcBFko6xbx4WYToWXOdGXc/4xlBPiaXLyvQrARM1cn9a3HW2JUcH8YcLI2+q7mK/B9E0xlDO8ennxM8DLG9y/8zB8YnWwqRkicbgMYcW1/9/VcIQ/RqKqfTeEO/JOgZB7RWR3LmWVursfDkYXXfHbyC/FFW74Wm2YZBWlfvFYpCKWVPoErDdp7c7EYka3ZCawdtBL5qF3aOOKkQW6j/yVu47z5J02zG7YhNoVwZNVm/Gyrt/nc57IFOcb//IOTR6P/+py/Nzpwn9+auA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9135.namprd12.prod.outlook.com (2603:10b6:408:18c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 16:29:24 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 16:29:24 +0000
Date: Thu, 29 May 2025 13:29:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <20250529162923.GH192531@nvidia.com>
References: <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com>
 <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
 <9dea400f-a57b-43be-a2e4-24a9f51e6ba0@amd.com>
 <aDE5SPzOAU0sNIt+@yilunxu-OptiPlex-7050>
 <ae16db07-5fca-4369-aa67-cbe2e0fd60fd@amd.com>
 <aDhyC73r149syMpc@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDhyC73r149syMpc@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: MN0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::23) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdd1bee-6937-4960-e79b-08dd9ecdf959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fWRhKAmy5OXgrX2WLZqqyiGsjHs4MfUZVCdn9TSvmrXIfSg8tLyuHLThkZOb?=
 =?us-ascii?Q?WoVAVLQ4/EvK8bkBbYLHyaqthXtAzhHG4BStkyTkEKaLw2mTorpF70tnsqqB?=
 =?us-ascii?Q?Wimt7b6IPbe9sOArrdFjLPXbsisXLFlff9GFHPiMQJKbubMqwTnasUPRn9Qu?=
 =?us-ascii?Q?NfKoA4q8BQ8kb0EAsJKOGHh4S/jfyOKKZUBtllkKVVYFpHxomoEeT46NrefM?=
 =?us-ascii?Q?DNqOqOnHLqHzENYfgbYbRi/coKZnzixLiyUJDON+jY3B2P8qLcf9QukLAM2I?=
 =?us-ascii?Q?hqkbnurrNQNRKK0EasX2pMSyrpGUzNvpjxDGhlCx9X8xxBv5fMgAad70Dgzq?=
 =?us-ascii?Q?DJY+KRjUNIOaONsUAqR31nA2hrMoiAviFYC2jMw8y/aMxCNdIXIYS5gUPsN9?=
 =?us-ascii?Q?AuXYsiECK2ZPpl44PFOPEJlxaBtSRKFl3N6FiWQkPovAjc0WR81MmRj2HTct?=
 =?us-ascii?Q?iJZlkwWc5QTa2AdeG18UDQ0vAbaf/FKxLQJrAIz+tSaY+ARfE3RxjXMjWAD5?=
 =?us-ascii?Q?YTc+Bn7ZMOB3WHmqqBHeMOw9jySRNWap4LW66X5izFaUebEyooFhGnXgYHzl?=
 =?us-ascii?Q?sgpzxRd9tb3U7CNTWPqGZUkZC8cvK0UAHFNpEBK3fLnMq9Mm8smZOoHyVDf9?=
 =?us-ascii?Q?ZPlzTJ/9wZ8pkR2d5nq2sUP9Jr9qM0bKlYXs6pCcUscE9+/p1pQTZOlhUl5z?=
 =?us-ascii?Q?StuabvhDsfpQ8EZt3mI3JpEOdpyYbbdUkUmHRN3uvJd/VJDgXzVS8gFkNzH8?=
 =?us-ascii?Q?OhDGydIizcV5na1qicq2Tt5h8MBprCpNzzr6jJBCtQbGr8BeiCAhyvRGXzoU?=
 =?us-ascii?Q?c/diY2V4GdtC2Xkiff0lQ84Gd8ZhJOmkXglv5vOczv+SBLgPsKb7KCdZPfg+?=
 =?us-ascii?Q?GPrD6yT8hD7UQSaorIp8Qkn5pPCBZos723tjsrYzNx4Kw92YyOMf+oLI8fJs?=
 =?us-ascii?Q?090S30l9FXmpWftBai3+rtdKPoHLJwecxI0TRnHKELI/kLy7rTqJ8uRpCPv/?=
 =?us-ascii?Q?zj0yjIz3nv7a4ueTiTrFuVoRSpxlgiXqeANsqGXu1k/vqURkQw+eofGXgr/c?=
 =?us-ascii?Q?bFvQUvlZprh50rx465JybycS2QZTkxQSw7SisBUn5WdwlR+y1392zWH+4KUp?=
 =?us-ascii?Q?N8Y/0j/WmJHIKnzqQF3LU3RDzH93fYgymZfmv7Ce1HXY5aLqtLmp6hk2OP/F?=
 =?us-ascii?Q?z9tnhQKL6QkeB5SBodfWHGgj/q+flGG0J55925JVZis+21zLIbz4syW+LOwu?=
 =?us-ascii?Q?ioMclU7MccKyLurTDxd0r2CFNri5CxzLVlV/c9W18ExoZJnyTiU1liDmMyVg?=
 =?us-ascii?Q?PcZ2HSAcBc/9v9R5OmnddgqzzVUKKsRpgzpvfMCC742tzdfk8Ds+glCxim1z?=
 =?us-ascii?Q?rSfFwKCjk0nrNNX8+I63OlXCuTJ8SoA0+O9q+oaoratN3SxrUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?amT4X8uLWB+qU6OgnGbvJ9YWoh4Fteg8kr/eRWm7/ufuc44Qf2NEIbewCm3I?=
 =?us-ascii?Q?QAz/wDFFonxoT/UmxxbN97CYB6lqae+1n0opaVUhl7+y6ojt8fTjqsg9AYli?=
 =?us-ascii?Q?vF4OHEFFI69XmB2WYQPo1x0u8qxRtczg0pnRF+zWBbj2iZx6whampSJkXknE?=
 =?us-ascii?Q?+Jh0RPobvlKICTCa1MQ72RGsVQfXpBqHxDxkGkuQX/QKMZxzvYhjoa7OQcXe?=
 =?us-ascii?Q?0tROyqpo46szVMeg0ORvoYW5BDI+uTheBI7Oz9poZcp9AQ+JUwva3HvXj0cB?=
 =?us-ascii?Q?321tdEfFDobwmRM4UpWIf9OQwrMDya7P3ogw3JZbSPDPsrCjE4iiEmWAzEdl?=
 =?us-ascii?Q?JkiwgfMumDsf/VoRAyGskM60snr7eiMn1hfu85u0uTCGIYl1saywxy+RpCfJ?=
 =?us-ascii?Q?tsgY3i6Cyltg0p3NMdOA2lNMPJ6prMA6jZC3Y56OxEhNnrm5POBfe9NOUY+Y?=
 =?us-ascii?Q?PSz1VXcCSTjhmXKx1A6WChE2558WBZDz+RSUd0D+W3oRXFB2vhpHC3Nuz39K?=
 =?us-ascii?Q?xm3iT5BIMsjWOKvUT38yPCa9Emu95vXbQ1MIIDxSOk5cmTziOnJEKxDWFjIo?=
 =?us-ascii?Q?WB9PttDB5LNUKSUQFhT0VcGo9u5PvGJm/o9UIDghRri9qWhbGXyIBlgjRSNw?=
 =?us-ascii?Q?lzihs7P1xRsp+TTowkWXF/b68KxUqwNP9N0tNf+djItrtqkLGgT7DJJ2jNQW?=
 =?us-ascii?Q?kdU4cSopqsBKOHPwXmR3SfiwWUtJj/9vNxlpZbsQChlwmJGiF7njgjK/M1S5?=
 =?us-ascii?Q?MXsT2gzD/gqa6qNnZkc+P8TDyUgd8+V6YXs0mgY0ZukO6Akrbt5vikr9R5+C?=
 =?us-ascii?Q?L8F8FY8C10oXcDe4vhGd+GAPemwoNGn/JUO7RVE1b2zTgKC22v6qPalA+rrM?=
 =?us-ascii?Q?snaRTp1JEqOKe7HOX+zIm7A8dXoFpBLv/Kn1i3RqjKj55iFfNqrdwvfm3Xgn?=
 =?us-ascii?Q?Q9oN2umdk2ODvmJxDDNGglPJV6OqOaN3P0UvsLGyOzbj0kdW1Yup+aW5UOAb?=
 =?us-ascii?Q?KH1DJYXGuwD+BCnR7btQeNOtHY+cXzN2h4UYVxXbwy4f/uxITUKGz2JbtJKi?=
 =?us-ascii?Q?ftpMrYelgHAimeEuePhGl2QpmffS/6gzp557WjnuZdZXRq80Icb9orlP88Ip?=
 =?us-ascii?Q?vJx0hEeb5vTooEyUoaBK0cKuCBERUwne0InrjP7mTrAcJG0Iz5dyyWCjIcjb?=
 =?us-ascii?Q?q/bIqv3OMf+uDfSTT4uXc3Uo7RfB2xzUCuEf9zlTIHCOd4x2TSrYRnq8cHD6?=
 =?us-ascii?Q?ZnlRGDLn8PnHIe94SBGoirD9GWxzx81e91H9Wg6idUOW4vUdxyHZVIHo0Awu?=
 =?us-ascii?Q?S1IViGNJgLGbG5HIdmfA8qzQWodBkgyI/WWG5znzgd+V6+NQoOGYv/4ujCHI?=
 =?us-ascii?Q?Jhg8swQBNruvhCEsDA2ymLi/ky5bBHq2Nyf0yHb3J8fK2YR2jD6bjCVpFDSC?=
 =?us-ascii?Q?U28IH89azyVNqm2VGNzTNTdBp0i3KpezytFgeDfcGS6Lr9xtZybeY9WNwCBY?=
 =?us-ascii?Q?gh2eR3Mz1bCvKbHzmfeJmIXeKbxPIILtdDcAEAR/2E5vVrKwB7Ogs5LcdF3M?=
 =?us-ascii?Q?8GANtRnpIbZwaCiziPAcJINoWmsixTWqnqxuE9yy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdd1bee-6937-4960-e79b-08dd9ecdf959
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:29:24.6867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsgbXcLrvQKsshpuIeuqmZAzUFE4k/Ho1S+B51PzCXKwfanHTUeyWjjTCiVhxP47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9135
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 29, 2025 at 10:41:15PM +0800, Xu Yilun wrote:

> > On AMD, the host can "revoke" at any time, at worst it'll see RMP
> > events from IOMMU. Thanks,
> 
> Is the RMP event firstly detected by host or guest? If by host,
> host could fool guest by just suppress the event. Guest thought the
> DMA writting is successful but it is not and may cause security issue.

Is that in scope of the threat model though? Host must not be able to
change DMAs or target them to different memory, but the host can stop
DMA and loose it, surely?

Host controls the PCI memory enable bit, doesn't it?

Jason
