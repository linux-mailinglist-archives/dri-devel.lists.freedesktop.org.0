Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D9AF8376
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522A210E90A;
	Thu,  3 Jul 2025 22:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O6c8Jq0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D3810E1E5;
 Thu,  3 Jul 2025 22:34:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHYMgZOCBu/jontfxKMJJtXocxaNEQaKpc2TZK9Mw+cUp+g+Lya2cxW6pPBM6wdJ/hl4rb43uKga6Laus+S9ItatqlLYpnPlfqOZfDsKOJpc8s6fHRuBgXVbk1HGXKC1FnG2jEKzCxSHopcR8MTvs0mo3lEQdAt1rZDpwzI2fq78i048Q7HmnYNeGKUah2XBFh/H65ZBGIyrQOwcLse1smA6JpEud2MBaZl/E4CLmPHzNo/MyZJNwB2u9kMEEninYgZFrnbIdcqwnU2/RMQ4AGrc3PKnKXs3kMiVSIbDFVCITwBo5OpUj9uiPbvH+GnNP5PiIDJeiqS39+MmscO+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzadnW7o4hwuFtDgSuLzNe+iNIk6m0xkMuDqQaNdUzI=;
 b=m7fWIVR2CACBvpKSRVzRJbIXlI69ZqbltrEjDbALW4Ao1/BhRqv3lyk4H0Xr9/ORSPvMwSebvF/v9zbiFOKqNZ7GeTzyxKG9gqyalD1HW3y+cS2I3UJ285uK0qpjJ2gZTDPGvlx+HHOBKXnZdOHJ1UDxL2xwCF2yBpQVMieJNH9FAWIwySytoQD6Rp6WAq9LtTK7Sl6lFsKYZdDHWRMbS85PrqZ0y/IaCyHPREkzNxxEnEIVlJQr/O8bTFW4B3b+Uv+wBms08ZVAauFS8p1Pv+uk48G1JN0wG71I6ZzLYqPGlCQDPo38LKK4XLZ4dWj6S7hjrwAROEYRgTOLG43zEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzadnW7o4hwuFtDgSuLzNe+iNIk6m0xkMuDqQaNdUzI=;
 b=O6c8Jq0mYia0BoLERniN4chWK5KEbKrRnikF/BfYVQnwE7gulZR7AqBN3wg/wZkElKw8Wvyi76rZqoeqlMNeZhUoDH/kBQGvfTDEEYxLoSGnQ8FY2/QM6obS3BD9BLh8Mo7soAVf+tyflmNdaO0vi2QA0ScVdlPP06bO5OXWT1Lphz/Hqu45AnXa3GUOhAGxj8MLIstEFOXSIVWnipcBPKubwwOlc2qutxQeHeab4Bqzkhn6gpkTbXq/Top+vKLq1Us78JLdHEvtk28GgPMcOCMlrgd9fEDXxmUM1GeJtJ6TjQrXxz4Xlj0yICzSAefDSwWldLpZEFV4vgayZwF36A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 22:34:42 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 22:34:42 +0000
From: James Jones <jajones@nvidia.com>
To: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 James Jones <jajones@nvidia.com>
Subject: [RFC  0/4] Add Format Modifiers for NVIDIA Blackwell chipsets
Date: Thu,  3 Jul 2025 15:36:54 -0700
Message-ID: <20250703223658.1457-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0035.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::30) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 7772da84-c8f0-4364-8f99-08ddba81cdd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CRSlV3cRwXEZoo/e9JBXk/d7jmHMOijCoY5XXkDbrdN18eFcj2on176BOvxk?=
 =?us-ascii?Q?tjw+7yab+pJiWor11quJTgOJRheevYlYFxGWt11OAoY+9rmnQdTxW7EtbcLD?=
 =?us-ascii?Q?MzMS4c4XVvXTmmyPE4xDdrqvoX1e9eIxbiybuZgBYzOU9k244wOcPynRHq/9?=
 =?us-ascii?Q?fIRY52EFSxUWhZBMIDUFOaG+yjr5V52ZS9GuiEuMGy9hv/pX8lj1pLIrH+ly?=
 =?us-ascii?Q?vB50OIaNRHCeH+x6X7bnZ6urrw5kZ0VkS8c0K0EJJiiKpyIJH8nOr6cMf4qC?=
 =?us-ascii?Q?jJE9uXiuaqXWOVO3hjlL85DJ/2VOEQKTEMJ9g+cyb6+upTYEz9GVnvb+9kfZ?=
 =?us-ascii?Q?XJ9yKsC8QCdU6Ebod5i0hHNG/eoR/E6T5jXxBwOLWkZempyyr1TCj5a6UVqs?=
 =?us-ascii?Q?ihHEeSatu9Ja1DX/z4dS79Yvl4uBzDt1gf+BYxFstP8uhUJ1jJSolAlGW4zn?=
 =?us-ascii?Q?3ECo6b2ZHFEeEsHf0tXAQcCNE12kNREiFXF7XkalHOCSiUxwfCry2FG/inNo?=
 =?us-ascii?Q?evovaCbj9TX5U5EK6c9qnbw7xvaFYJMn8Ksi/MgT29u7k+Xe/VTWISeJzFfq?=
 =?us-ascii?Q?Ly1AN44baKXrd09NROiSoCSufCIvBrsPJdUk4W2VWUJZ44X7qSRtXyiHaniN?=
 =?us-ascii?Q?d/wiaD3PUQx/cByOOEll9NxsxBM56Q+kijsDnw8KFemoKz/nnGqoawa8MDEL?=
 =?us-ascii?Q?pNV20CJlEUKbGKEbQWbQF2+3BKwhwuZMTt4LOo79xbDAhiKdq2fxNXjQrAMK?=
 =?us-ascii?Q?W2Q2czlpRteFJqh9d7URCmWVDtT3a5HkjCASGv7t19gS6KWGR198l8czlU0a?=
 =?us-ascii?Q?+7WdstKundjUPbWFuaORkKd0KKc9CEGu26AXJ2vIKxtOdrsz1DfHA55hTC7g?=
 =?us-ascii?Q?+63la3/VSgea1gMOI0HmDHZ8pMxz82SmT4LLxL+aCoWK5dsx5FGN5tiZTnBa?=
 =?us-ascii?Q?rztJUIjhOXY3Kn+CI577HOzsVku2sjYcI8d/5QhQeZqzeyHZXekP2N790Jf0?=
 =?us-ascii?Q?toAS+P/vPRXmjjn6MnUKbe7TQPfqDC+ltN93crmS51x69ZTy3Oro8VtC32OT?=
 =?us-ascii?Q?12jzAeseRLnppOeEH4o4GW+sH2mPZoGWSPN7mLWoduuCcFRSEgiXJd5DGDcR?=
 =?us-ascii?Q?3vxJlK/faMj7SDZVkyKNUUXSCR/FFXz19/7BlVY66z9E2xICNPRbIS1BjMO7?=
 =?us-ascii?Q?U3OqS+zFS1Lec1c6SVT6PviNVG3y+KH1yMyHgECdsuxOX4aeP9ZX16NeWcwR?=
 =?us-ascii?Q?zqZCh8ZffwFPHN83VAkDAls0iKNPi6Ed1SzPXRJhmreKruHGMtMfWfdOBt2+?=
 =?us-ascii?Q?5/cXTDVZKwaPFg71J++31b1SWqyNRU1O7olZaDDrghidqdzey0flmf7kDl98?=
 =?us-ascii?Q?3vaxOiFb/QVHEGDcNbi37hL/ps9WSudGurAE+p3R7KEfAYgIyAKoEjOEeNBu?=
 =?us-ascii?Q?6EM423hc4lk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ip1dqlfP95HICUN85SvmBb7mDoTzlalOWwL1j7RM6dKOel7spC6pojyaT3m/?=
 =?us-ascii?Q?4fLaVCf6LUoND66nZS0opp0xrHmDnDpuFyNYduTiCSjcH2N5UkGyUpYY1Mxb?=
 =?us-ascii?Q?X7VKzxBcEHU3qp+i5Jj5c/CfTq48A97oSWNpD7B4k1ifUwDw3273l8Damfzk?=
 =?us-ascii?Q?xGLbhdkPLgfu0+SqQVSpS0NO967Wniwmcj92CAFXN6qVy6duidn8qu72HVnk?=
 =?us-ascii?Q?YsqjS/XY+eq4rJ4D7MxB57nA20U9faVDOqjaveDPa2qVoNeabaOKTzVFEFEg?=
 =?us-ascii?Q?2ekeWJWQlTuEFMvSUEpoKI6ak5q1F3+hxuQs7TxTbLlq4JtyBschqA4mz2x2?=
 =?us-ascii?Q?gHv4zIcD+5DLUBt2lJZfHqlwz6DzUYq5iNSG5ai+A+8eNGg7mCURUgVHLKbM?=
 =?us-ascii?Q?vG/OWmNRBAOlDk2u6DS+kX7P8wJ4zplqmlVv01zvI7YSwptqYg0D3DzVrPdq?=
 =?us-ascii?Q?eGVdzN4MhKz9f4BkzC2YWAwnvCjH3my68Ob1T7qfp67neE34JFcM1JkjRx75?=
 =?us-ascii?Q?tv+F5tpf4waWCcYP4I0wNC/G+31JP3yc/UYVEuqN1hg/QRsnTMu54L48PIsU?=
 =?us-ascii?Q?YhN3yuDqcUqgF3tS6QWojvkvpW1OoOQ7cI7rjFFZ+nn/TH7RkR52GGvHw3vn?=
 =?us-ascii?Q?7XOxS7xJ2WtC5CaFwCPMOtl/TCuxEiA73jYM+vbkm913BW61EEBeXyEPIU89?=
 =?us-ascii?Q?0JT13k5pbVvymn7UqsV9yl9Pz9AdGhMGWVASeouALKADlEbvN9bTdXiKGlhU?=
 =?us-ascii?Q?7PR2Ti9g3xgCtOqugTtPp7TXTT9WIcIEaXWcmVjWw/s8ZQ5T05Jfl1i6o/Iy?=
 =?us-ascii?Q?D67dKt7ZZNpFujEhrKuaHlpiAQc5UsD+Y/C2x09m6wHmJdxBc2P1vLziZk1m?=
 =?us-ascii?Q?rxuuRmBWdZr1lhLkQRldSotEE4e51jg8JpjNgTweSVMWbuUVzBTMgc5zogDV?=
 =?us-ascii?Q?b+PmSoqQBG7FsqWuGTfUGcRVrOlJFSGwdT/QYWUzmdbFHpzp6rV/PrjcKtYA?=
 =?us-ascii?Q?R9A/P91vcisoxC37pLm7Oi5sq3mX/yWEpY+0PFS5v0qETHFYnEBI0SmsGI0i?=
 =?us-ascii?Q?93VfDkVsWFBEr+UQYmae5oQLQ/auDH9whYfbg25g9rxkx4UoVQNofAT8vkhp?=
 =?us-ascii?Q?Mlv8FK9YgLjJ0kE/j5Wk9wN1pLb462Alof5dxlFjxunmlnhIfxdn1N15SlrO?=
 =?us-ascii?Q?0BuYlxcqWm+g0qMQbT57EG1x+KqulqllMJMewbngSL7mU9RXtAV6CWdwVUaY?=
 =?us-ascii?Q?4Gn4guHxuH/ydXe32aVx53LPou6wwwV/6C4kX9AqeaP2NiKEw+zB2Qm1+Mtz?=
 =?us-ascii?Q?KaqIH4JQ+ND3mh5+fVuGuEtqkJsqU7IgycSI5Umgf+6G6Z6rhELi24XRqVMI?=
 =?us-ascii?Q?BDdnvroEva2CzTz2f7ylgqBGptEtPINMyr1jY9BbEffAlIQs6IWGkhf0yoH0?=
 =?us-ascii?Q?GKXFgRodYoMnYhGl4wSBlGWqK+ZpcGIaLcwB/20a99C92cwPdrfHibQAtwZc?=
 =?us-ascii?Q?iMoEMdB8RPo/+q0rVrL9NXrAjCLVQ/NzZyzDLRet2gtALy200KpvMhmTyJtx?=
 =?us-ascii?Q?aK9vym37c5pptdxDNrNAV7/3CFMfO4HprUJ1YNNe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7772da84-c8f0-4364-8f99-08ddba81cdd7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:34:42.4917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3D7ulyVjAXGGJfEGw5TvDoEggTVicI4zYnBrNBS8dLBu0uGawH7lk5h37Ers1WMec7OYVMX7E5dumzE3EmAUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079
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

The layout of bits within the individual tiles (referred to as
sectors in the DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
changed for some formats starting in Blackwell 2 GPUs. New format
modifiers are needed to denote the difference and prevent direct
sharing of these incompatible buffers with older GPUs.

This patch series proposes first adding some helper macros and
inline functions to drm_fourcc.h to make the NVIDIA block-linear
format modifiers easier to work with given the proposed solution
makes them harder to parse, then extending the existing sector type
field in the parametric format modifier macro
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() by another bit to
accommodate the new layout type.

There are a few ways the parameteric format modifier definition
could have been altered to handle the new layouts:

-The GOB Height and Page Kind field has a reserved value that could
 have been used. However, the GOB height and page kind enums did
 not change relative to prior chips, so this is sort of a lie.
 However, this is the least-invasive change.

-An entirely new field could have been added. This seems
 inappropriate given the presence of an existing appropriate field.
 The advantage here is it avoids splitting the sector layout field
 across two bitfields.

The proposed approach is the logically consistent one, but has the
downside of being the most complex, and that it causes the
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to evaluate its
's' parameter twice. However, I believe the added helper functions
and macros address the complexity, and I have audited the relevant
code and do not believe the double evaluation should cause any
problems in practice.

James Jones (4):
  drm: macros defining fields of NVIDIA modifiers
  drm: add inline helper funcs for NVIDIA modifiers
  drm/nouveau: use format modifier helper funcs
  drm: define NVIDIA DRM format modifiers for GB20x

 drivers/gpu/drm/nouveau/nouveau_display.c |  12 ++-
 include/uapi/drm/drm_fourcc.h             | 100 ++++++++++++++++++----
 2 files changed, 92 insertions(+), 20 deletions(-)

-- 
2.49.0

