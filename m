Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9497D55A1CF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CA510E73E;
	Fri, 24 Jun 2022 19:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4538510E64D;
 Fri, 24 Jun 2022 19:30:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrZupekqEwqoaPrP5VgNhVrAdw5YGAJapuWJw4MLk+Pxej/eHH0KY7u1TZoeyx1CGx9BIzNhSuOPcTMdJy/QkKcQ9dR+FL7+E3fiVPdvGChtoMovzG+NzF6qLjv4ZVbG54HPNGz2Yzs5em/uEHfuLuGYhPZZkINi+h3XbRO4bI/sJnxPROMqW7SP3vQWHKPMQTbT4oc0VwiKdcOz5dCATv5JEgq0BaVg4n6eZ22fuh5lP7mJyZ9njqrcdfXAzgJByI/D1XS3v4wjAGZuwugojSlFl8UPgkeko+fAj98g2AdB8NrFw9f0jWkqz7zc5NNl2ykYUVgEqZ4s2DyQM8iZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqNqUHCbLomiuGFtXesA5iI2i5qqLUtQ71Ia1noIpuI=;
 b=e/mYdeUyUFBd4QitnAviSV1B9sQ15V5UdMfiS3t0vEKBAYcfgycgAFtgUvlQu6IwPQbfPjAOTadv/C+VLp39H+UJYrxDEcN+IixZ+bQjqdEgopFU32BiCzwPFGJyj4A914jTrYn5flCRhNclxdvjhCpBc20Zm1ShaFKcA5ETCTPkR/yWumZPz5LTzvZmmm5ZGwxJFbUDx2lWNCB+zG5xBNZYyYHh9FuRUB9m/xnH7XjpVn9574sfS/TTA5GFNXyQ4GTeywi4L8ZzFFpkYTjSJIGsC2JiUIrJd7ukyUBdwRw6tvGSAW7rioQ8rGjLwos7hKSnwOx9+xMb8uLHHRAqog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqNqUHCbLomiuGFtXesA5iI2i5qqLUtQ71Ia1noIpuI=;
 b=ubwhXcRVMJsqHjOnuQob5NhYLe8/rsc5B7VdFGgkLln1eqqCN0S3OubBF7aIIIRskSDgOSfvLH4yuq8VfLMi08udU8vNKMxUEgTUoc1JKggXtF+rA3Ai3T+BoXdbMdRsq3mOT6FI8aVxlb3RCab+VvLugDx3n5UE33IOdM0+s24u2vTvq98r1rnc+/fmoKDwKpfxvT7PFOAwcTm/djX37E1FQP5inmITWKnRE2mLm7o67WfpSiFCLvmQckiELkoT9muy5z8uc3lhYsTCXPkqYMLhZh5KcCF6kcDR2ppa2rK11imzmAeEX7084MKLT9pdxegMWMVDJ2W2olzFnuvd+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH0PR12MB5331.namprd12.prod.outlook.com (2603:10b6:610:d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 19:30:43 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 19:30:43 +0000
Date: Fri, 24 Jun 2022 16:30:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <20220624193042.GB4147@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-6-nicolinc@nvidia.com>
 <Yqw+7gM3Lz96UFdz@infradead.org> <20220620025726.GA5219@nvidia.com>
 <YrAUZ7hXy2FcZcjl@infradead.org> <YrI2Ul/u6pRvt0rT@Asurada-Nvidia>
 <20220624135615.GO4147@nvidia.com>
 <YrYO/KAa2bqmxEIu@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrYO/KAa2bqmxEIu@Asurada-Nvidia>
X-ClientProxiedBy: MN2PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:208:15e::42) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8223e9c2-4f40-4523-98de-08da5618079f
X-MS-TrafficTypeDiagnostic: CH0PR12MB5331:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZIpJ76pLml8f+Hiv9WfS3vSJM602QJR0S4rCGWCmzIWp+LRw03IbXcODhcttltWYDZg8dfBE/c5hW5DqxRGlourwfueklIkwgBaAZDmOxv8iQd+bBlUB+HSgudHkGNwniVEr4rOgcsVE2r4eRwEiXEQNOXsP8A2LbTmkXKmbD0OxFxHwWJyGg9kb+G4VwDk0SrG7P4xYVGJvmz9BauzVPu4Jm24r/snCODW9qugQNG0f8Wuu9M5jN5D7Ppy4ci/+zXnfWFGji7aWrG24NqUGoCHM5NGCC4x2hlRvpz/W0xU9BkKqikGdYtRYrvL+2iCGHNasmYNqrDQb60U7gUebvZlU7bnK4eOur7Qdz4BOPcAhIAsl949BYWWdeHPi1XyELsfCFgr8nHkjWGlRr0qpMPaIA1ZLLfQVk6m+kAN3ureAWQBpYm9SDGGm2c+5dusy71YpvJv40y3744G21PsqWobrq7salbOIsyOP8EBK28TPZa6m0ArxydboIZiUIrBhYd1RIxw7Qd5eiDXPfmsBsP1dlXbY/Bo4kF2Qs2e2N/U04L2gcx4m2kr03vp3VH/SE8jEJBglDpVVlvizPU3J2XOdAEYgKbNl1llJOOicxNH2UwPE8e2re70N0qzB31GUOFKpbHCo2EbrcKP4FxZqwETaLrBCedrtiXZ6dk/wOlNYRteKb6if4A1CHNeUPapfqBm9LWSMxhUQ4homaevhL5gRc1ECIxOOnS57nDF7WM0L4VeqFCGnJImYdusj1deo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(6512007)(26005)(83380400001)(38100700002)(316002)(6506007)(2906002)(6486002)(36756003)(41300700001)(478600001)(33656002)(66556008)(2616005)(37006003)(4326008)(8676002)(66946007)(6636002)(66476007)(8936002)(7406005)(6862004)(7416002)(186003)(86362001)(1076003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v6mWWETTX6YUz3aWn9aztuCsVweXB8qFKW6kkclcl4R2B30JdBBG07A5jg+2?=
 =?us-ascii?Q?KkqzSh13M2ElwhcGYWdj+F8Chj9Urd4PUbYMQBX/b+qsY++TRPDWSb322TGe?=
 =?us-ascii?Q?lCfra2VU6VoxaO0vYH52K0SxBFjdWdHx90WMsBGNol4DXt6XhArMXZpNzFhA?=
 =?us-ascii?Q?t+loW1NEUm+sGKsDcimivulYhVVHMOSG0dXkkeK7nSIhdvqlHHHqDVzs7rxS?=
 =?us-ascii?Q?c78QwRaLOBkLR9Ojzyt6V0O7AzXgcFIsTAgpWeRRCaB0gBknrGrIDTkIQG2+?=
 =?us-ascii?Q?YclpMKqPmNski3tBG7FPc6P+nCC/8cvsu4PZiNxT5v6QZrRYuGsCbIkxHvsR?=
 =?us-ascii?Q?HO1GkhhxCPB5z6OmmF+1pHtCaLqh1hZyfhD6R2HKPv0V3KgFF2qy220vk0hA?=
 =?us-ascii?Q?zRXen71pZ62yipmQxUouN12fV2WuNstrbFXCs+XlYhDyehGKL4tBn9m53rs7?=
 =?us-ascii?Q?P30hfKH1gMUsdS66400L+MhxpWxz9Sc64/Xa5QKzO50KsMVGYcqLVRoYAMAI?=
 =?us-ascii?Q?IAK3aRZQETPdT0cQl5H9jRzJ4AoIpodKiveoTRHc8ADhkzpGFlvreggjsRqA?=
 =?us-ascii?Q?Xu3OOS+/D/6A6SxKC6/06dp8nUeJZp0HSM8Rg/jDy6EXR1m5wkJ05DAqSoXv?=
 =?us-ascii?Q?JNiBFqGE5RO734M8Cd9+qY8ichfY2lXdKA7QFbZXHGfOv0aNmcrGVI2McxcF?=
 =?us-ascii?Q?g8GB5M/hAI/fyfZXJJnNrvNhfvDHDfE+BFLRcfta2Jdd7IXetRndDTkY8gR6?=
 =?us-ascii?Q?/yRGZWuU5VKT4p59bLw0LiU3u5vd3Q9ich7Z0fGYN18LLG760jYk6agjqQWl?=
 =?us-ascii?Q?NsazPzpTlAbZH3vuwhYysQIi92DkjECZXolw625bCWhcjCMq1ObuyiRPpYpz?=
 =?us-ascii?Q?b3ZsnkeKB/olLChgZlkQcjY32xUWlKcKsIKZn+EhybSfZcXjLIgQDJzvXm3/?=
 =?us-ascii?Q?u9ZaCqUC3Xr9KdjDEIQhRBpxpT8web7k678OwpNlCOKVDUryc255MNPS61rZ?=
 =?us-ascii?Q?AS1VxO9shSoIbhg2XgBophyCgbak6UbVGO7acF7JUmqyKbvJL7lo+Q4nTeDq?=
 =?us-ascii?Q?tlgb4mcWU3kP05aE/Z0Vly0/SOtKMkUbysWPTm4n3AbBRMWxlN1wwJoww5Oq?=
 =?us-ascii?Q?XqIVXK+6GQePApvGEab+2JV2qR2zA6idF1eKyt9RJBTZdEUueHA+DO00uWE5?=
 =?us-ascii?Q?981YpB6IqNwvdPUeobfuh5bdZDgPUnStbV0mG9xJ62Qm1FXuwJrWRRowNM88?=
 =?us-ascii?Q?8XLzkmTeASdBzuhtjUVemOuFicgoEOBnnrf7+5FyjV7lVG6kKdTOWTjpVVFk?=
 =?us-ascii?Q?p3igQYPweXO4z0QVAoU9YVziZyZPkE/LEg2e7HwQa3E3SlWtauIyte4SvXRv?=
 =?us-ascii?Q?q1UNdQ3iVBP7QNMoingHbRgSBR2Kt66bezslCuqhOyzJxRFv7WhfdlijIUV3?=
 =?us-ascii?Q?nkZvirGd0Pmy7K+mnfrz+O7sGeNqk9ncjhHDjXWkXsQD7+nAyQ6/0sR7G1B7?=
 =?us-ascii?Q?ZLkgbpRzQWqeD32hGzokRfuskWTHFvHAHkXqx9ylZaANOBupGEKfBCBq8Tag?=
 =?us-ascii?Q?2PC8d9gZduYmWp19Njt+rvjVBakDfWt07bL8N3ya?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8223e9c2-4f40-4523-98de-08da5618079f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 19:30:43.5012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyxMbDJH2V84CJP3CsMtkggsId4guSxEmQ7gqDKKnx6F2fysLFWeUFs72u34yyDC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5331
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kwankhede@nvidia.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, pasic@linux.ibm.com, kvm@vger.kernel.org,
 corbet@lwn.net, Christoph Hellwig <hch@infradead.org>,
 borntraeger@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 zhi.a.wang@intel.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, linux-s390@vger.kernel.org,
 hca@linux.ibm.com, alex.williamson@redhat.com, freude@linux.ibm.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, tvrtko.ursulin@linux.intel.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 12:22:36PM -0700, Nicolin Chen wrote:
> On Fri, Jun 24, 2022 at 10:56:15AM -0300, Jason Gunthorpe wrote:
> 
> > > How about the updated commit log below? Thanks.
> > > 
> > > The pinned PFN list returned from vfio_pin_pages() is converted using
> > > page_to_pfn(), so direct access via memcpy() will crash on S390 if the
> > > PFN is an IO PFN, as we have to use the memcpy_to/fromio(), which uses
> > > the special s390 IO access instructions.
> > > 
> > > As a standard practice for security purpose, add kmap_local_page() to
> > > block any IO memory from ever getting into this call path.
> > 
> > The kmap_local_page is not about the IO memory, the switch to struct
> > page is what is protecting against IO memory.
> > 
> > Use kmap_local_page() is just the correct way to convert a struct page
> > into a CPU address to use with memcpy and it is a NOP on S390 because
> > it doesn't use highmem/etc.
> 
> I thought the whole purpose of switching to "struct page *" was to use
> kmap_local_page() for the memcpy call, and the combination of these two
> does the protection. Do you mind explaining how the switching part does
> the protection?

A 'struct page' (ignoring ZONE_DEVICE) cannot represent IO memory
inherently because a 'struct page' is always a CPU coherent thing.

So, when VFIO returns only struct pages it also is promising that the
memory is not IO.

The kmap_local_page() arose because the code doing memcpy had to be
updated to go from a struct page to a void * for use with memcpy and
the kmap_local_page() is the correct API to use for that.

The existing code which casts a pfn to a void * is improper.

Jason
