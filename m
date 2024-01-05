Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D19825B3F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 20:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAE210E66C;
	Fri,  5 Jan 2024 19:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DB010E660
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 19:55:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KML+nAE0b5H0arN/AohHGlJtzEVXXqTZJlIhB7iKODAeTCw/UsW1/bikGCNMvEICyN66DlY/kAkvJEIZQeD6bhJyAJ8Nw6WMUcT6u9fFDZ1wMuqitagFzLywaCvbTWiYFTDbQxnqbvmHvG16cuFBD8+KQuNJYx9/AV+EUdVGEZGQd1ik/43ZjaaZKKM4ohhf9VbCgoMt+JWEIWKrUBHuO9mc5hUi8ldwgQRwez1wfV6t8U4PY4l+ulzknJWmTjrvAFec2ME4ztIET8siqGuxxGJbVkwl/sG1mgSkURwvsA9MXbP64yApbdFv4emwMGUTnC4He8OZ+z5jJGYu/lzdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+ZXbDEinxacHQ4b+lHj/skW0hxodGzjIOunZEExzoE=;
 b=Dx19Wj4IjE9qOXWBvTa6tjkyGEDZQpEfZU+ZWyNmSqmcZTLxEKSzEREBSCtaXpckS3GSqpulVWpMM+fp/ut6He5s7i/tzUJOqCjn+noUCoWluiGDZgrClCrjB11hVKdtgBU59V5Gom6s2eIe4l8sYBbbo4bSfOwmIX0fIFWyvOgD34Zu7ZUPrf6jSxzq4Wj15TaQgqqw+xPgI0p5rdf5mgwOFJWw7GV6a/pMtmb9Wa9xxd/+mnfi0fyPhtzdUIwv24M5Bt34sqbZZ2Xmye7N9r56u2mDPltcN+4d0ixCNo3mQa8df/Wy6L/v3vibMdl6Uj8qHBgirlLU0Oo1lNnlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+ZXbDEinxacHQ4b+lHj/skW0hxodGzjIOunZEExzoE=;
 b=exZRLVvwDl/pkOCia4z2pQ0fp9qE2gJEcghxVRGwXtVb/+d2wogHuyIVmMQUkO01USm00QEVPvvMeX5d5i3sP99F+5K3mO+lxenYzeWfOwQBTD7e7MBtsaFEMhDmbRd8z9RtuMGQcZ4zpD/xoqlOIgOnYPGvuU03GyWYkMWExPr6JZyEzCrm8EBlTQ/r0ZDS75Vv6GISInW5LJf8Y5xqPpxczH3lULQRydUWkA+e1sDbHjdX1bC9xvvUMhq2Hf5zs3YuzGFk1kXSJfPpw9wfKHAFBXiUGcR2v352qZi6PPKO6Tc73gF+BK2m0EbR7MS4FWyIa3xTwuuRXFynBCfFvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Fri, 5 Jan
 2024 19:55:53 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 19:55:53 +0000
Date: Fri, 5 Jan 2024 15:55:51 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Message-ID: <20240105195551.GE50406@nvidia.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105091237.24577-1-yan.y.zhao@intel.com>
X-ClientProxiedBy: BL1PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: d53bf452-9a85-402f-35f6-08dc0e2852f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q2o7zy+Az8LBD4TedxHV7Nq+QzpIiToeU0UQI789t9tvTIz8zMgyfb+Sa+AUCXvhYG66V7P13U/twM1jLJNoMh+rar3VnnlBQGMOSSaCqEwz6MVYvHAYvckmczdeaM8DmXeNDwKLZ9cE7UfPmqKusApjYrxoFufA9+aQl6gIuR25nmnf/8nC+wXFiRKLSKTvuwlhstwPbxcNP9Bf9FTdxKaKCC8mC2K2Wwb5XyGysEO/ySsMPD7nIONHMSzTRZEPBugbB3vdXvevrE1GhiTGzAUodS+JOItqh4EJM6t6iw9k0bEbI3CBa7/C+yFbafv2/8M3+rfyPfYjyEGws9kMcnvRklaJYlUYllmEDVE3Z9C3iBVsSSZlZo2LIwAc7zjIEBQNQtJzSIahZ5ECegIKgobFwt0ureu0leHFxPiN9KdBUTvb5dAvaqOyyvEBOg0vHh2NbqFokABA4bnKGxlLM7X1ZK3TdqwGOl0GzquPbROxKVwpiHWB9Ktf34YNdKvoG8hOb6xpMCfXeIX4qqlXgh1/tiehBbVTrJaCJarPBW8qx8nnTk7JDvBItNCHUqOq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66556008)(66476007)(66946007)(38100700002)(6916009)(6506007)(86362001)(6512007)(107886003)(1076003)(26005)(2616005)(5660300002)(7416002)(478600001)(36756003)(2906002)(33656002)(6486002)(83380400001)(316002)(8936002)(8676002)(4326008)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U4Dl9fv/fpldBexb1HfQQXXj5a4XwftUQYeP9GUGbMZz2ZxgAEY00Le/h1eE?=
 =?us-ascii?Q?3wHtnCITPnpaXMKUPZ7Fo1PGtrkiv4uu7Mv0SfLhr+GrsPrZ//j1WDGuK+dp?=
 =?us-ascii?Q?rbgrOenYS2K4SWCW0aw0CWuhMqJQr3i5msC64a10IHtVv94u4Z3gKjgfCYly?=
 =?us-ascii?Q?V7IQL+IuJG0iNRweMhmaAGTpJaE0i29QkyQjLbPpsOQg554E86A/Gf/kFbM0?=
 =?us-ascii?Q?cJUyb4RV5HGZEqkb7SE34WQhPEApMHnHsn1jZ22VOcqi627YFpaWyLRtF/7Q?=
 =?us-ascii?Q?Vg6t4kbCDkD3122jnABW1/YAFiti075vNKBkLy/5LKkM3NUA/3706Zx54Xqu?=
 =?us-ascii?Q?3NyDrnDoIHhACE3Zfa+fqDb2M4NKAzRU6X+YvQOZTaYc2cP/6Q3OpCaJNOoS?=
 =?us-ascii?Q?/8hltgxKWTkoXmn6wRSUeXkZ66pfq/RPGzvZw1L28lOfiI4x8ULZBVQ41x0V?=
 =?us-ascii?Q?v4QyX2+USFBtDGDg0NR9q+nrZLoO4u2mCz0yDNMBDAKE3iTLP42+mKUBN0sP?=
 =?us-ascii?Q?CrapybSTkbrD9aHs2CBjhdW312sct7+c5U5DK1jWh/y6RU0bcKLywWOCuj7o?=
 =?us-ascii?Q?XPKqRlV7awiZ2PM6cL5/cY9fdpKd+C3Xb2LyDOt7l1Iv1nq2ybUjeGp6dO+F?=
 =?us-ascii?Q?N1MPxFiLYlzk7KBcfrjRaTnbXdFb/qEzQfDIx+40HomeuzsMpKVZRo5MDJqD?=
 =?us-ascii?Q?V9Atx8jod0UDRlldqI8TTtxn8QBponUBE7vevrlNrcROoEe1s1sziuDwoCTJ?=
 =?us-ascii?Q?Z+vw5YYKgE/5rK00n3p+GBJDCxCf2gkJUmTxz8UKQJ48S7uGKRBsrC2twX8+?=
 =?us-ascii?Q?lD+y1Q/UB4l0DJXdp30celSAaHDbl8Ofz2J6jlDr1ahQXbth1Pm2FpFIy6xS?=
 =?us-ascii?Q?LfWTysAlTjh9nRfR/d8SK1vxXkmEEVhNyiwkRSnm9ipBV83RkUIhr5CaYNp9?=
 =?us-ascii?Q?NArB7VrYgBhd/ekJf0Bz4pYx0CLYPwWYDcDH5/zY0XBfuuTNJXg1En8b7upG?=
 =?us-ascii?Q?SP906ws6Ogmwr/EkLZaCyz8p0pEYM6EVI/SjiY49gFDPu0a/HiK2p2i2vodj?=
 =?us-ascii?Q?SBqh+akFgcAanOYW4RTgu4jurhVN+9X0FM8/P4s89qUpbpPl66pLWLQye6KB?=
 =?us-ascii?Q?Yk41Rg6iA9emK+bPNQfo6/OUxWLmx5pbITQCnHH37WUF8X48eTHGKV+PviJa?=
 =?us-ascii?Q?mC7wgzVXYVVbjMMqwDjp3eAvB+NftRG6GG9Q6agX7PYQsY8ErOr9x2F8ln5y?=
 =?us-ascii?Q?d0eC3zCds2gW3fOaPOXGVyVKgW7/9z5vVRXDkENs7+ZL5zF1p3cfEZPr4Cch?=
 =?us-ascii?Q?mw02GEOTjMeeJYRTfxLuYQpOaOoj4aAZNpJ+5rn+PsvaAc2ZDbUp95ygzffZ?=
 =?us-ascii?Q?BJcIU0UBvp7isKBvvufThRUy77uqntIaAsxWLb9npsFpXJWW4GWlrvo0XeFA?=
 =?us-ascii?Q?WxiDPRlCcyhWVqiXEori/AoydVwOEm4NfVMvNR7cuqJ4SNA4SnpGbdiTDF4O?=
 =?us-ascii?Q?Y75vCBDOMPweoYdm2Xh8m+T+L1uL4H/0khL4xzZ+xRMUoerBJla+bCC1jL6X?=
 =?us-ascii?Q?fKkGMxNxPtZTmurW/5Y=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53bf452-9a85-402f-35f6-08dc0e2852f0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 19:55:53.4043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG3Ywe2XwtfNoG5mGRY3ZPwX9NvLkUB+5Jc3qF2m3OgrEy1phvYuklxQqkO2kvn2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, maz@kernel.org,
 joro@8bytes.org, zzyiwei@google.com, yuzenghui@huawei.com,
 kevin.tian@intel.com, suzuki.poulose@arm.com, alex.williamson@redhat.com,
 yongwei.ma@intel.com, zhiyuan.lv@intel.com, gurchetansingh@chromium.org,
 jmattson@google.com, zhenyu.z.wang@intel.com, seanjc@google.com,
 ankita@nvidia.com, oliver.upton@linux.dev, james.morse@arm.com,
 pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 05, 2024 at 05:12:37PM +0800, Yan Zhao wrote:
> This series allow user space to notify KVM of noncoherent DMA status so as
> to let KVM honor guest memory types in specified memory slot ranges.
> 
> Motivation
> ===
> A virtio GPU device may want to configure GPU hardware to work in
> noncoherent mode, i.e. some of its DMAs do not snoop CPU caches.

Does this mean some DMA reads do not snoop the caches or does it
include DMA writes not synchronizing the caches too?

> This is generally for performance consideration.
> In certain platform, GFX performance can improve 20+% with DMAs going to
> noncoherent path.
> 
> This noncoherent DMA mode works in below sequence:
> 1. Host backend driver programs hardware not to snoop memory of target
>    DMA buffer.
> 2. Host backend driver indicates guest frontend driver to program guest PAT
>    to WC for target DMA buffer.
> 3. Guest frontend driver writes to the DMA buffer without clflush stuffs.
> 4. Hardware does noncoherent DMA to the target buffer.
> 
> In this noncoherent DMA mode, both guest and hardware regard a DMA buffer
> as not cached. So, if KVM forces the effective memory type of this DMA
> buffer to be WB, hardware DMA may read incorrect data and cause misc
> failures.

I don't know all the details, but a big concern would be that the
caches remain fully coherent with the underlying memory at any point
where kvm decides to revoke the page from the VM.

If you allow an incoherence of cache != physical then it opens a
security attack where the observed content of memory can change when
it should not.

ARM64 has issues like this and due to that ARM has to have explict,
expensive, cache flushing at certain points.

Jason
