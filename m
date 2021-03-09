Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A82C8331B3A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 01:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE4D6E8A4;
	Tue,  9 Mar 2021 00:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61FA6E42A;
 Tue,  9 Mar 2021 00:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXlBeDO0y68M++VarL7paLgujm9sOVYJsC67IEU3jx5YvKTWbMhmBx74fyZqALWmklWj5wmCQ2AYHF6x+NtU+tML0EOo0/IU4OfMBrvpdW4sq0as1zbu9ZeTIa+cJ6L6SaNGX372wd85yVp4iYFGe9pMj1mVaeIQGWUmB8UFUGLQlBq2AUXCtaKYWfLO5nGs+y5hjXwpt6qitf7mPmHq/Hyd2ztfWOPJrS/U7UiI2ZJJWSFv287+G2HL3cGUFmASgWtN6bq4TwwNtNudcmQsNDs9kG+XLNx9todO6trbUNpMLP0I/VozTsQ4eovueafWUEXCAyEyHq0mcEnGE4PSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4VTeBUJ6JXNgsP0b1cW/28oiyqgIg3uexhYWJYtNZY=;
 b=MmFFp9wFyKKjFY0pRPZhfv5ucuchd2aBvwMbsjwqJH29jVNkIbSpvQ1ZBe9Fy7x0G6mQQFVmaTAqmeI8oz1yavFQlGrYAjknEPB8phTILlMJE89WsL+u8ZzRN0u4/Nmc7Jh+mPsbOETHCvSNCBRwiX4rnkDnFa0S0XbOsJiRpG03bXtlN9XjNC+TEJ0h443gQoPL/0Y5JBWLQhPgJaBx68rVSXnZPSEkPz2Hc3CwIosf3LO31eDecRNnm1MXlgGAhh0eLCuxdH5TJcDO3DnVI7jQg6AovDHcWCknyueMK1PVTBgwVyIQVd5xpIna8uHkhOqYAzizyPzKvCtfPN7Kiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4VTeBUJ6JXNgsP0b1cW/28oiyqgIg3uexhYWJYtNZY=;
 b=m214ZoryS5+TCNTf7Ft+1rnmcpTkfSzX0FfC+MiZrNR9dPUNHdmqgNv3psC+he8mwzEHOwQSz4UxvPbzkyJxceBq2aQ9qtJCbN7JR5iu2XHiEe5i3Z0Bry/LRhWNsJZb+nV1YafiH0+crigRGs1cUH+xlDk1SOtzsY2mRVd+lt8=
Received: from MWHPR03CA0023.namprd03.prod.outlook.com (2603:10b6:300:117::33)
 by DM6PR12MB3866.namprd12.prod.outlook.com (2603:10b6:5:1c6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Tue, 9 Mar
 2021 00:01:52 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:117:cafe::a0) by MWHPR03CA0023.outlook.office365.com
 (2603:10b6:300:117::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 00:01:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 00:01:52 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Mar
 2021 00:01:11 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v4 4/8] mm/rmap: Split migration into its own function
Date: Tue, 9 Mar 2021 11:01:08 +1100
Message-ID: <3142506.6Va0CHJdLq@nvdebian>
In-Reply-To: <9fa77684-149a-e6ed-296d-dc852aecea97@nvidia.com>
References: <20210304061645.29747-1-apopple@nvidia.com>
 <20210304061645.29747-5-apopple@nvidia.com>
 <9fa77684-149a-e6ed-296d-dc852aecea97@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4a95d59-158e-4c06-1430-08d8e28e8b41
X-MS-TrafficTypeDiagnostic: DM6PR12MB3866:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3866B1528E3E2BF4148ABD65DF929@DM6PR12MB3866.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X2RS0C18DgralhE+6G5wc7C0Ggk4x0h8wSildQWXU6PrdjEXwoHy+gttt6pX95JhWixZK2SaKFqSp5XLwKyEj4qXRtOnNMs4ZszSXLEsmTQc0b0pAHdHncN1c/TUcT8ZF9iTmbygYq7UWzJf7ZnIiCbH0kSFANVUEIzAE2UAsltVjNt3XJP75XjgaGOZjIce14l9hRyxVFbK7hDL6dK/bzuNG0Xif2qHkpcsUPxcot0AAyLFig/CxYvx/dghCFwkIPsvGQoho7ZixxNhkGuAA3747QzuWirCPf8AgxXKE+twpD1rnlVm5eBu1rHZWl2ZOE8tm/z1bMgWKEi5i635nycdXMWkHKNkkQlzYN68TG+med87sX3xQ31wwAbyCKDPfgzH8qTPRz3j6LGX1WoU5cVvTEwzAkNz65m0AmcDKJdNinhUyWonzvrGVBfoMEfb1WYvWBYF8CZj3i2gxYlJyOdI+lFzGFPMpR3VZO6D8Fuz4tXh0X+B9XLhBMbO4Wrce0Z6n1ykfXU8WD5wgxqLgGhZgdCInhktgYycYyc4+1Bf8/9tlNSjz+LkDIkTjEN/Q0i031Q22chljhXWFtYeyeQ78OlpRxmAwyJTPh8W3KTQlv1fYrj3hn9F9GP7f+8sn2c1SwJGBxTGM+N5ymPczc5EGbutS7aIr/zHkiKNvLZ3w+0ZVNIcyoSQfUgrBXUJZH2N5z4vrZ8Tsr1NP9FNw45a/tu07JyE3oYze2ABs5s=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(46966006)(36840700001)(82310400003)(86362001)(33716001)(336012)(8676002)(34020700004)(83380400001)(82740400003)(186003)(7636003)(16526019)(26005)(47076005)(2906002)(426003)(36860700001)(356005)(6636002)(70206006)(7416002)(54906003)(9686003)(4326008)(478600001)(70586007)(6666004)(53546011)(8936002)(36906005)(6862004)(316002)(5660300002)(9576002)(39026012)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 00:01:52.1427 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a95d59-158e-4c06-1430-08d8e28e8b41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3866
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 bskeggs@redhat.com, jhubbard@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 9 March 2021 5:58:12 AM AEDT Ralph Campbell wrote:
> 
> On 3/3/21 10:16 PM, Alistair Popple wrote:
> > Migration is currently implemented as a mode of operation for
> > try_to_unmap_one() generally specified by passing the TTU_MIGRATION flag
> > or in the case of splitting a huge anonymous page TTU_SPLIT_FREEZE.
> > 
> > However it does not have much in common with the rest of the unmap
> > functionality of try_to_unmap_one() and thus splitting it into a
> > separate function reduces the complexity of try_to_unmap_one() making it
> > more readable.
> > 
> > Several simplifications can also be made in try_to_migrate_one() based
> > on the following observations:
> > 
> >   - All users of TTU_MIGRATION also set TTU_IGNORE_MLOCK.
> >   - No users of TTU_MIGRATION ever set TTU_IGNORE_HWPOISON.
> >   - No users of TTU_MIGRATION ever set TTU_BATCH_FLUSH.
> > 
> > TTU_SPLIT_FREEZE is a special case of migration used when splitting an
> > anonymous page. This is most easily dealt with by calling the correct
> > function from unmap_page() in mm/huge_memory.c  - either
> > try_to_migrate() for PageAnon or try_to_unmap().
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Looks reasonable to me. I do worry a bit about code duplication.

I was initially concerned about this when splitting try_to_unmap_one() up but  
most of the code paths ended up being pretty orthogonal and I think the 
clarity gained from separating them is worth a small amount of duplication.

> At some point in the future, it might be discovered that other combinations
> of TTU_XXX flags are needed in which case a careful check of 
try_to_migrate()
> and try_to_unmap() will be needed.

I wanted to keep the code as simple as possible by removing all dead code 
paths that that weren't in use today.

I think this is likely to be more of an issue if new TTU_XXX flags are added 
as there are already explicit (and hopefully exhaustive) checks in 
try_to_migrate() and try_to_unmap() for unsupported combinations of existing 
flags. To avoid ending up in the same situation again I would rather not have 
more TTU_XXX flags added if at all possible though.

> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

Thanks.

 - Alistair



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
