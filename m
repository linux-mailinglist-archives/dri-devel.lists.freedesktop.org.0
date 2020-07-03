Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B8213ADA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 15:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08396E130;
	Fri,  3 Jul 2020 13:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13576E130
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 13:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwUvvtdvmEXC3p+qOoiig6KZz6phCCelAlkCTm3XLeW1Vvykn28C3mBMHUYuSbhhjBE8HQ8jUFGExM57FvnmLWrwFzsokqy535F2znaDIkO+9Ql3oLM+BvItNxNxAuVRawvvZETaTZCVyzlDenthLhMufC0qgWwsR0SNYuGAgwJQ0abDouAcbDGfaY0mUqPEchfXxLNDT1t/PrbXo8mV53PI2LbiW16CqOurLKpRTkUc4oTTE3+W+8QTEwMDqEzhRMA4m+mgIHl4bhh0rTV0ELxak2WWdQio20QetuQ3oCL1jepcuFo2FKjfBOauPHF+YR7o3bIrzYXelLcIJlQdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PulGJoWoPK8Fw7jXzdE/YHq2Q5W+Zr96x+BLQRIFkQ=;
 b=OWMenuu74l6JVu7yJVEcx1TMI5Ul48vQ4uopSoxB8zXgfghXknZ7XPson0s1XVN+9UNfAHxqJ/AF7JIj4Djgu2Jl5bN6//D5lhkAztCt6m/RVox6sXNAR4Q/gOBjtETnctzMdSaVj02K7OHJV1hO3D93vQy9LaBs0q8q/LsaD+3c7LDJCnsjtQLcXqcxqqX3pJ2ksz2g+OU+DxhyG4dqHyt1axCP8UBKD2fmRjYfKKpjiJPmNhHXgjkrr49cDdRrvVa9gdEi4BWT/a1bxDqP6sUk3645vOjicWALtCxgnnE2Pbij5SF0DQUa2/le9Y5978rvaXASjJXXYD0hjkf9nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PulGJoWoPK8Fw7jXzdE/YHq2Q5W+Zr96x+BLQRIFkQ=;
 b=eGMcmkiOr0DBYznIeSLeveZ3vZblGV6Av/5FumOcEGeGsNnhO8vHpg6/1YfcvGUNcySs0+U5BpGeJjTC5qjl9mqstk2lXYQwN0EsGhLZTwE7EIqVfV/Z4ncMVMLL0qoZwvT43HplzDlX/tW6HMDiZaVFlsZS04iNuCf4VR9GbQo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Fri, 3 Jul
 2020 13:21:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3153.028; Fri, 3 Jul 2020
 13:21:13 +0000
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
References: <20200701123904.GM25301@ziepe.ca>
 <34077a9f-7924-fbb3-04d9-cd20243f815c@amd.com>
 <CAKMK7uFf3_a+BN8CM7G8mNQPNtVBorouB+R5kxbbmFSB9XbeSg@mail.gmail.com>
 <20200701171524.GN25301@ziepe.ca>
 <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
 <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
 <20200702181540.GC3278063@phenom.ffwll.local>
 <20200703120335.GT25301@ziepe.ca>
 <CAKMK7uGqABchpPLTm=vmabkwK3JJSzWTFWhfU+ywbwjw-HgSzw@mail.gmail.com>
 <20200703131445.GU25301@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f2ec5c61-a553-39b5-29e1-568dae9ca2cd@amd.com>
Date: Fri, 3 Jul 2020 15:21:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200703131445.GU25301@ziepe.ca>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0083.eurprd05.prod.outlook.com (2603:10a6:208:136::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend
 Transport; Fri, 3 Jul 2020 13:21:11 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8cefbfea-39a7-43d8-05d3-08d81f53f539
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2356F837B0AC33082D128966836A0@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukYzrxNB1Z0ggda9Ad0ObjZckHoKicYUA/y4YklJ8r1l13kvCUc2pSJVYpUnJ6DztqvgzCfMlfiiKF5MfqdYvmLiZa3FCw3KsAVm1KXvGK7mdCozumP0bLRIhLaYDXPAGuTudB+f9DbfS02qY7RAnsMJa0msnP7yqKlzukEowN87BDKnjfL/uMZbeqw+IZBTX9cdOAcp+XVqoLdALUcizGgNiqU3bGgDY854NERZrEtkGI1dliwvvSJQelBNlAqX8/TiQ1GTP0eq48/BF91VZ1baz3NYEEgK4Kxb9sSOMAnzQX39Cl+aS4JZ90PGjIuiZn+O9LXIxqAHqXVfQaed9Xndd4SiGKEojtQ0eq86j+AbWgT0p+CabCxJzgnECNhA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(66946007)(66476007)(66556008)(2906002)(8676002)(86362001)(83380400001)(5660300002)(31696002)(8936002)(6666004)(36756003)(31686004)(186003)(16526019)(6486002)(4326008)(316002)(478600001)(54906003)(110136005)(52116002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: BPqR6FGxdlfm340iP4/ii3uZDo2aGDXfy19KQe0DAZTDnSBdL7jZCTjHwAZnjmGO3u3FzCmYK4U+OHKaS403ztXoyB0n631HXD9W/7iZujKPGsCIFl2pyj9Hbd4b5iNn9g0JbQsysJvBNY5unZiHKDfRPC9KLt3P0/SrHSeCA+j2Jrcaq7mDDLl6OaWomG1pOZZqMpKuXMK1HTbqnk4kmHP7oOueuWyC7LE41kd12lBqJVWJ93IS8piumQY1km9E7vtNO7oyhisggr/595Tnw9h9dXkpBGVDD+NWfsz62Amp6ix+UP3MnmefbOqGKsJFGZNGmQHacgArQ3Zm0HtikKpIndF4pUJk2SAv1CM1cD5Eoc2X3bvjqdx5QLJalBVJZM6u951AyimZTcB2N2wz8l5on3RuLvCg85xRgIextLc/ftzxioZ/Qcv7uHN6r631YahwhbIOrkXn2nto7V4Lwj2X7Zwc3azjQxGF3QYxpQ3Rc1b3J/W/085tq3E8aOq7tu/xpv2+AFy1ldWr0eVxdA4PE0lW1a6ZBE9gQa/yEEaeY0HiqAU461cEdwvNZI3g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cefbfea-39a7-43d8-05d3-08d81f53f539
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 13:21:13.5583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ps+wTB+pgcws9oz8ceYyeWvkD9N31CaABoLP3PgORnH+BQjdp+FfWvRgpDUj624
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Xiong, Jianxin" <jianxin.xiong@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.07.20 um 15:14 schrieb Jason Gunthorpe:
> On Fri, Jul 03, 2020 at 02:52:03PM +0200, Daniel Vetter wrote:
>
>> So maybe I'm just totally confused about the rdma model. I thought:
>> - you bind a pile of memory for various transactions, that might
>> happen whenever. Kernel driver doesn't have much if any insight into
>> when memory isn't needed anymore. I think in the rdma world that's
>> called registering memory, but not sure.
> Sure, but once registered the memory is able to be used at any moment with
> no visibilty from the kernel.
>
> Unlike GPU the transactions that trigger memory access do not go
> through the kernel - so there is no ability to interrupt a command
> flow and fiddle with mappings.

This is the same for GPUs with user space queues as well.

But we can still say for a process if that this process is using a 
DMA-buf which is moved out and so can't run any more unless the DMA-buf 
is accessible again.

In other words you somehow need to make sure that the hardware is not 
accessing a piece of memory any more when you want to move it.

Christian.

>
> Jason

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
