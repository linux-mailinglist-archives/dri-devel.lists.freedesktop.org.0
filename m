Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4605342E301
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 22:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7031B6EC84;
	Thu, 14 Oct 2021 20:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE566EC84;
 Thu, 14 Oct 2021 20:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+Og7C0rC3DEF8QlsgaEZsMGm6uZZX9QaR2GSSQUJAGM4pSDhE+Uq4VzhE92ie0ZNAHPjGQi8nbcDLsMNphIsPYKlxEOZERR7r4UpQWU0UhNJsIiat9xyO8OZf+gUJBF4Oy/wOaIxToitUEqVCl/Nz2T03bCMs/tjphf/O/iUWUjcpsPLlwLVZu90eyckwpLcE1WG012ezOuxTqBHB1Z/pA7TuX4knvM/o9HD744be6YOdo2K8CARZF9rE0qePQ6OjTy5U+58tAoYCL0XF3YZdumTt64BUHua/GvfFOjEyl/EgOS6C76zvKkYmwO1Pflsl5J7hFwqSyAVJMP011a6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvpTn4a8zxu+601pUl+qvYpYhZTCqZpliAcG4fPUr5s=;
 b=Ho+d4v4bH/R9m2EzhJLUDY7fyUqS2JTqW+sVRaL4Ge9FqgC1LQM8yNCljXN2eNerZoPhOR2gMNNYeJxvoDeqjjnAM3KDkehQzxyzSML0JIPgUH9AAVnMHEnY2+WLpyB7dWIcxoe4V6Qh6h0svySsCHL89NqC8cf0JcdaL9iMEfoZEOuNThmQkW7Dq3vxNkmsxwhsSSEdAdGBsdWbH4s4vrEI3c8o415mw25XFkFAYPzbtXby6/G5+Fy9voXMkcEiuG4QFsA5sU9bSI4DI++xXm5lW8zDm08+pv82rRGuxxPpcUzbj6EOzmKk/JmDp8La/tPWr+agEXyAo4m0QMMwNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvpTn4a8zxu+601pUl+qvYpYhZTCqZpliAcG4fPUr5s=;
 b=siQxPlzZrFafDLoU/wWpNpFmUfEU1SGEUiT/51tFpyooJQu/uNsIHESaevyKl31TSocdUOUOD5FzLoPjrdNM+Y11tvxKL1MvXmfaNgLPUVXXh5U6RY9qECzv2ds5l72RGMbCgmnQDU6ZxGAR16CNEvgDMerRR04WSGqdJGJpxQNe55M2RR518lndp843Ts2W5tW8uSWTdYC64qTTeF48WGNoBiPlifvWfDSkfohb2LA/nfLkHj0NmXFOwDqh04OY9DduntztJ5vs6QroP7Loswl749H0rQP63RO324gBdPVAKPnzBulPhBG2NZ8PguIxmLjTEtFKv6ezwoEHuZ0V7Q==
Received: from BN0PR04CA0075.namprd04.prod.outlook.com (2603:10b6:408:ea::20)
 by MWHPR12MB1151.namprd12.prod.outlook.com (2603:10b6:300:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Thu, 14 Oct
 2021 20:57:31 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::e1) by BN0PR04CA0075.outlook.office365.com
 (2603:10b6:408:ea::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Thu, 14 Oct 2021 20:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 20:57:28 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 14 Oct
 2021 20:57:28 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 14 Oct
 2021 20:57:27 +0000
Received: from rcampbell-test.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18 via Frontend
 Transport; Thu, 14 Oct 2021 20:57:27 +0000
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Alex Sierra <alex.sierra@amd.com>, <akpm@linux-foundation.org>,
 <Felix.Kuehling@amd.com>, <linux-mm@kvack.org>, <linux-ext4@vger.kernel.org>, 
 <linux-xfs@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <hch@lst.de>, <jglisse@redhat.com>,
 <apopple@nvidia.com>, <willy@infradead.org>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com>
 <eafbccb5-f94b-0ddd-bb46-7ee92ed36ee8@nvidia.com>
 <20211014180132.GA3567687@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <b8b57851-674a-956d-0d7a-779e601bf6d8@nvidia.com>
Date: Thu, 14 Oct 2021 13:57:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211014180132.GA3567687@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb1a4024-13e8-4cc7-e460-08d98f553c05
X-MS-TrafficTypeDiagnostic: MWHPR12MB1151:
X-Microsoft-Antispam-PRVS: <MWHPR12MB11511B8165131FCED4395C30C2B89@MWHPR12MB1151.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6MGQ3ilDl/sD2S/c635rH+iM0P8Z+gdnUjcY/3k+H5mlYVJX6KexIJnW61DGHrlmoAPO+VEsQSIC9vUQIlDvre6heZS+PnRSMM98+QsIOjmstgSMGqYngl5uQ+VyAW5MpFrk2wCM1JFK0qZ6Co3mHr3YNmikAtx/2yUgDBxa6E7bhDJccZKWC8k/Dq/wUfL8IBXX9vRAc/y0n25J630DWEWmCwiASj5Djqxu61RF31WD4sQB2a0IHyzSNoALhVrceMzdjB9QpKuzzt8O4NaKJ9vLH8+K2gI4S1Q52VxHtXssg7OLvcrqM9gSR2MTfIpHWa+SCADvEteW5IxUtoi+a8yLosqia7K4c8gQCQY0+XQA6tPnYNITMF3XLB/T6vjrE7g1Jwj2niv1Wulk9qo1QdcIrAk86SrqtDRvv/Pc0Iwm8zvFJIpuMFrS9juoDFZItuGV1CZT5vadS/6x4eF7NjwEdVp7cezPnkiPl35FC0G0Ko0l1DEibklcFHC1uXHjxZZL3EJqovhb05NPyhjDzDygoVCg4ctDHNHIrmnQstlAsKqxjhoXx9hHMCEpO4qdqxTGEHj77sU96tVGaiLgvfw5fFZbQIOlFcc59UokMg4uztn9JFqegNTw4Os2axxBlKaU/Belt8hh/SElEIC1JjZ5icNsKmX/acfILzmSgaQ2yAhBfwz5TyqmEncTjImzED3BJaze0/ebcd/bK6roFEtMt+Os2zl7kT8ZLnyYQhQ=
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36756003)(8936002)(31686004)(8676002)(7416002)(7636003)(53546011)(426003)(26005)(2616005)(508600001)(356005)(4744005)(336012)(6636002)(4326008)(37006003)(70586007)(2906002)(5660300002)(36860700001)(31696002)(54906003)(7696005)(316002)(47076005)(70206006)(82310400003)(6862004)(86362001)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 20:57:28.9928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1a4024-13e8-4cc7-e460-08d98f553c05
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1151
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


On 10/14/21 11:01 AM, Jason Gunthorpe wrote:
> On Thu, Oct 14, 2021 at 10:35:27AM -0700, Ralph Campbell wrote:
>
>> I ran xfstests-dev using the kernel boot option to "fake" a pmem device
>> when I first posted this patch. The tests ran OK (or at least the same
>> tests passed with and without my patch).
> Hmm. I know nothing of xfstests but
>
> tests/generic/413
>
> Looks kind of like it might cover this situation?
>
> Did it run for you?
>
> Jason

I don't remember. I'll have to rerun the test which might take a day or two
to set up again.

