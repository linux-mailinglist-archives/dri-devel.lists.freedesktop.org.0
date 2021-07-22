Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850D23D2B1B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 19:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47F86E9E4;
	Thu, 22 Jul 2021 17:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49B26E9E4;
 Thu, 22 Jul 2021 17:26:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/Ej0FytKaODuBIGcER7eZRVwObFY5MOXHsR86fyMUKCUIq+wn9pQTmJooy0MznJIh/HFWHtBo+gkT6UJW1gNunvCpEeGD6gYV4gcIVqWn71Dkpeh3Zx8uUvK4hxg2nGl+kISIGfMn8ZLSKkzxaM8EjQuRzI/kmncKGBLHRpUU+x8aJcy6s/fyWKpGMizAcur45XaV+b+lHnzY565HvPHEf2HRL0GakYZvrrIUelPH5vYMBlzqCM1k92chUCiqJduVV2X7rMqzs5wb4H8NP1MEpZqgH5rCQ+Rg/8bxNSdm+QTuryha4u+kTT2huRmJ864gRdsP6AY84zLb9b5GFjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/UteOzXDOEVpX2VcUFC4KNX2QQO8cDjFaxLSkFtqrk=;
 b=bLHFWMMitWprpjuHPXSfSvKMqshChKkkrckzr4z97spKmzSPR4HMQBPLnbgiZW/oUvysHkIzH7MH4n4gAlculmmZkWNx5JOqH7nM01sg9uYUdnO9vM0owoWnfStnEvPXnCO6ytlhjBuaE1iQGfIbnqe6ZompgxTEH+GNja5x3qm/4hHOVsuIvBJwyFRLU81XqLWOFjq6Z9Ssy2dvxMO0pBWaSVtDUWVF31JnuGhaSFd4ZHJwKtFSlgy9BQAnwYytya3kgJGZekcRMSmCObHGcL2ElbhfwjGiCOyyM9o2/nV9JMG/Wf52W7Em0IQOmQsi+00yyXEgYBtbP2chexOCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/UteOzXDOEVpX2VcUFC4KNX2QQO8cDjFaxLSkFtqrk=;
 b=lo78zGGUzWFFFhwkiSX58kARYjVqOOt3c7sZw9DCbhqfJkQkbHG9kc+s3RLlC93i7cIHf11BntE0zBvlSc/4TLl1ipNCkeOPLodQFyMVLAJqf1vWnQiWaHdNuJOev55hzHgRax2WNrpepLUcnEJlcmzEjaJt5c5yE/tdJ3FJ7Vp59EpJtlq7GXLcqZwhagucEVb+YzZDsPemRC+dqMzMiVGeRFXCGxGlHS4ux5RCflG34HbNwJ9SOd0rCvmAGoKxnqc73k0yQbLXolfvQbeKo733ag13iHOpKXyChC77btI1FNAw9M1bFvh05uWZjHJ7Xi56tT5NbSjdvr4OxiwUjA==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5363.namprd12.prod.outlook.com (2603:10b6:208:317::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 22 Jul
 2021 17:26:50 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.026; Thu, 22 Jul 2021
 17:26:50 +0000
Date: Thu, 22 Jul 2021 14:26:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Subject: Re: [PATCH v4 10/13] lib: test_hmm add module param for zone device
 type
Message-ID: <20210722172648.GN1117491@nvidia.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
 <20210717192135.9030-11-alex.sierra@amd.com>
 <20210722122348.GG1117491@nvidia.com>
 <4ee9e946-d380-ba84-d6ac-5ad337afc835@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ee9e946-d380-ba84-d6ac-5ad337afc835@amd.com>
X-ClientProxiedBy: BL0PR02CA0133.namprd02.prod.outlook.com
 (2603:10b6:208:35::38) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0133.namprd02.prod.outlook.com (2603:10b6:208:35::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Thu, 22 Jul 2021 17:26:50 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m6cTA-006Nio-V4; Thu, 22 Jul 2021 14:26:48 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03399b9c-822f-4a5d-a758-08d94d35e3df
X-MS-TrafficTypeDiagnostic: BL1PR12MB5363:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53638573DA9F889CF42F9443C2E49@BL1PR12MB5363.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kp7X6HsPRmqSJZ+MI1pH02QUSDeU6yoJdxo9G3pVv7EOIUgm2LaK124UkI6gCjrZ683FH6asNpeSQ18AW1KZYP1R8qkJMZ7zwl1ULWbuXUurCQmH8eDIYzDBEXd6emeeaVb4TCQZGRtwocOMeA6A2aFTTc/+yn8cFtTZvQWZvzs1TuJwjgpqM4j6tsHH1zOj0f+e6VDEZdEWbXi3Po++XwWhU5ALUDFxxfhkTgg1WUIQwYta5N9z0eGaDS75LqLRk9DPpHiXiFWtNo1tJInWoO/3jyvsHf3xsdz+G7zhQBensbUwIg3DY0jf9OUbBI0EhMJvfv+dtach3LmYlbcR/cAMOO6eo67QzqI/QzkxPjxR//71SUp8sp0Zkd2y6NnDfW3a0Cu6WKSsHz87iJdOWFToH3IUAuiHsdDLt7PpDIl4i9wSm2gqZ3E3nCILmA08NqztO1ULOLG/pKTSDkzS7PZ6BKUgHFreDMj2+UmlkOrG4GLVscKEDKKGGJSEEx/GYoCM3RG6+w7y8WOFZhw8HKoe3qqZo8YagS7drMx6/OPo+bNTMLarxL1AC6b70A3jFb3C4orMG9aMWqrxWnLb5bYgLxFIV2yHB4txK02g+WembZNF5GhI/s8lJc2kHOpdVS8jn2Co0eSlZ8SUF9oBhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(53546011)(66946007)(6916009)(66556008)(1076003)(83380400001)(2616005)(66476007)(86362001)(8676002)(5660300002)(38100700002)(2906002)(4326008)(8936002)(426003)(33656002)(9746002)(9786002)(7416002)(316002)(26005)(186003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n4DHWIg8hJJ5qJQYPEQdgcjbe2uutLgj7N7gnke7oWCUY+18NtTZx6B8nVTL?=
 =?us-ascii?Q?Zu18zJ2IyQSb8kCveGrDiKsPqQ+ZhbAqQop6YfwHS3wJAxPnHREiXzFSkgV2?=
 =?us-ascii?Q?NZKRGI6Wp+0f1LO61TfHY0o/8n3HrWBYNk62et79SiHjDecm3mWKZ3WXJab9?=
 =?us-ascii?Q?9Z7ZegcKLBhBfscfx6rbzFEetPGh5nKwBQ3gPvfii+V/HitfPYdEfSo+vh/0?=
 =?us-ascii?Q?RaTLT7bq1WfMdRqTc0ePkm4jCS22TkIHopLS82UVSkKLuaMLHNkhrraTL9tS?=
 =?us-ascii?Q?QLTKTTOdKm211Od6aRDLFmJRm6bUzaiOL/aFZvsOPzyxbjt7w91TczTUE/DG?=
 =?us-ascii?Q?0uUKpchwT/9e/sotxnKl9OWXEKUC29+fbiV7nWH+JD8/5PIP2eOy/eBE28j1?=
 =?us-ascii?Q?v25mNGL9kLnFuzZ8ofQ1CdAiJAzRIFaNK8CFunZLkmgaiD5yIX0KNKE035CK?=
 =?us-ascii?Q?qwR5LTL1sibEnFc85nUwvWNR/AANP5Tf5fAfY6gYT4GYXTRt3PCW8xxrg+Tn?=
 =?us-ascii?Q?J2Jul4o+lbG6mjAMHGsY+9xKXts72aRnav+Nm04no0JQD+s7LFxuCAQo70Bm?=
 =?us-ascii?Q?VjJZgvRv0UqT/PMIVwlHazvYfWLQTSy3BjaIhNCS4leJ2DMWsjwUthiA1eTT?=
 =?us-ascii?Q?vpUtJ4IEOaPPUJf8RPPc9APhEZVM9WNK3OY1WLHBGEYrzuHkX+ZDBz0vDFBD?=
 =?us-ascii?Q?bJLKkeMiD9BAdC9HKl3ZXy9EE7QeaygRafS1XetBelYPVoWNXhQxme6Wcr0v?=
 =?us-ascii?Q?8uEwcJUfTjWkLMiIKz2TaIH0kifgeXSDkHtRDDJXcboLlkHP8ETlzVU0re6W?=
 =?us-ascii?Q?tjZ84Sjen5lLqz0k4BnzxdC+BqmNqxzscswzOHjdNeCcBvPWKR5H+rsUkSLT?=
 =?us-ascii?Q?+p00wcE1kR77ZfZ5p0OQkZIHUKDt1e3hkbbj3oVZrm+TCzk2vMQlXaUO/Ly3?=
 =?us-ascii?Q?Qf57pPyenEjWxYXhjxVZ1o0PeQL7XxkW03B+qcM5ISq6Wcc+zHKrOJ+qxPCn?=
 =?us-ascii?Q?hBjNWLIxoK+Jg0FsL7dj7TZ87ZkaiUtigEJ6pz8nTYyLvhMOM/4SxiDIG9Z7?=
 =?us-ascii?Q?dYaF5sftFas37XnwU6BA7cEe+xnYGdyBqRjvAphRllpygs57SyECCdKEi4lG?=
 =?us-ascii?Q?Uop55TDivkyVkXveM0RonC/AcgSucHxEVgkfW/vwTK1wXBDfFDi59o9Q1syu?=
 =?us-ascii?Q?b/dnSZNB9vMW7zAAmIsW1RKqx5dSRQTgZAEFDUy6Dl/c+y5R6Zes1ektyb5B?=
 =?us-ascii?Q?SSLWIUVKqNhOQxefLnDohnIKMg/BXg4BuZLePBfuhEldr1kPdg9kFbXqSRu9?=
 =?us-ascii?Q?XZO/L6XUWBqYOWCYHVuaSs78?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03399b9c-822f-4a5d-a758-08d94d35e3df
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 17:26:50.2790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2aZ44zT/o4E/GJrZ62+OZGrZgXDE2U1W5y4Wilg2CzRGeyH4DufXBbcPekUZJoX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5363
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
Cc: rcampbell@nvidia.com, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 11:59:17AM -0500, Sierra Guiza, Alejandro (Alex) wrote:
> 
> On 7/22/2021 7:23 AM, Jason Gunthorpe wrote:
> > On Sat, Jul 17, 2021 at 02:21:32PM -0500, Alex Sierra wrote:
> > > In order to configure device generic in test_hmm, two
> > > module parameters should be passed, which correspon to the
> > > SP start address of each device (2) spm_addr_dev0 &
> > > spm_addr_dev1. If no parameters are passed, private device
> > > type is configured.
> > I don't think tests should need configuration like this, is it really
> > necessary? How can people with normal HW run this test?
> Hi Jason,
> The idea was to add an easy way to validate the codepaths touched by this
> patch series, which make modifications to the migration helpers for device
> generic type pages. We're using CONFIG_EFI_FAKE_MEMMAP to create fake SPM
> devices inside system memory. No special HW needed. And passing the kernel
> parameter efi_fake_mem. Ex. efi_fake_mem=1G@0x100000000:0x40000. I should
> probably need to include a small example of how to set this in the
> test_hmm.sh
> usage().

I don't think anything about hmm is sensitive to how the pages are
acquired - you can't create device generic pages without relying on
FAKE_MEMMAP?

Jason
