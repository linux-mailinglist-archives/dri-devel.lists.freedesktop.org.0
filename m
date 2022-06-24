Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6D55A472
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 00:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E43810F6C8;
	Fri, 24 Jun 2022 22:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFDA10F6C4;
 Fri, 24 Jun 2022 22:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWH9kZFDRZNVrAy6Olb6IemiEth04hNMhUD0Be87S7Tx9Y3oqQ4D+WJsf6cLhzc4CnQXGC7FwsfKHgnDxfX40AVi+2bw5+NkBgagttMtX0nr5wuB5EOPURBDsdR6Le870NgCifCaAR4+Mdfr9q6d5/R9Im2u3m+dARrB+8Omg0SA+C+NEbf5vq6JhTps46vmtxJg/MK8C+H1ir2+P2E4/m2ja6cvZxhFQ6fajBTBLzOAhHL8BOkF6fkFSjZNiQpsOrI1qu7qMj2OSPOPcVfqyZ+/DFL0FWjwXUvbAsQD47hVXG83Jom80aNKB1PR3qb7+vucd3Ea7SAVEneBhWLDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMIWfcVCPcPY7eyamtxYEi2QuYTPSHZ15Hi2O2J0Mk8=;
 b=U7u9TFKxg65mWnG/qcx/GO5FAfuZ2MSOSO9PxJ/s0swWAk3UpMlUtho/FBF5rded+e87f+0qi6T8sCOLXtgVpXhiQc4I/80AezioB0tn7x8xIG6o3c4x+a2KA8ynZ4CmkOfOOtvIqqka/HdbUiEeMxaD7v9SMquhAOE/SJg2x9POtrX53bczKsOgcpTLaG3e64OYz01EhL0+I6Rtq+iOMK/Liw0fycFEG9s7CLvugAIhu/Po9zA+y2kaACF9i9No18BtN1sLcjQYytUGiCW6wtmDok8VaxiiB8g1N7FCXudJdiAGHMINKqGekCc7dPCAJ/I6kESciwsgjNfU0dL/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMIWfcVCPcPY7eyamtxYEi2QuYTPSHZ15Hi2O2J0Mk8=;
 b=rPsEMYen+HjCyrndhf3UJ9kPTQLZxwhVta/GqMcZmrwi8QzPa+H8XoTdnFhZP2rHrJlzkcl2VysR/PuLxPcuPk/1b9RnY2aVs6cPpgLVEge3DpHTXV1iR/AE9tFj5QA05Gd8OqdFaR7/KLudVA89OiTazCGrpC9uxhSJBFCob9I3Q98WJK6uqejjRVM5H2yCtUPKOC89PVYAdIm29mO0/j4ELSeb9T6w55EP/FHAleAazGAhGIGqUSD3c1usXFHrtE2JSwCLrCOMFePpTsRkYjbhyMuT+5J9CW8kNIFvX/5vaKfkqCkQx2cgbbiu/QFr5VbRCd7R79cSAGw2IRAlxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 22:42:47 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 22:42:47 +0000
Date: Fri, 24 Jun 2022 19:42:45 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <20220624224245.GC4147@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-6-nicolinc@nvidia.com>
 <Yqw+7gM3Lz96UFdz@infradead.org> <20220620025726.GA5219@nvidia.com>
 <YrAUZ7hXy2FcZcjl@infradead.org> <YrI2Ul/u6pRvt0rT@Asurada-Nvidia>
 <20220624135615.GO4147@nvidia.com>
 <YrYO/KAa2bqmxEIu@Asurada-Nvidia>
 <20220624193042.GB4147@nvidia.com>
 <YrYayPvA7XlCZLQ2@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrYayPvA7XlCZLQ2@Asurada-Nvidia>
X-ClientProxiedBy: BL0PR0102CA0063.prod.exchangelabs.com
 (2603:10b6:208:25::40) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc6949e5-adb7-42a7-2849-08da5632dc84
X-MS-TrafficTypeDiagnostic: CH2PR12MB4277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1x/gn3AwOcF7Yr29cD6d6WjnEs4ILExmWlMwoMDDSqzzfDuBlEKgrxN2de0eVulZhAgO84m689l7V9gqCiSbw5Cqh8nhOzGkLMzAYqd29VeQJzBMmaVDyXMz1tlcu+8/3Mz/CN1QQSdfJTjYsNBKSxWFu2JKl0FdaJj8YR+Lh1TuyPBl33T4ko3HJVB5bW9NFkFj0Hi5ZZp3rDsintwGF40OBYzvLamwNZdKIoPcbUgVz85a3giDFQVNChgTUyXrHlCBRlCyGGJGWWZgtPTD1+2EQd68ntvll/wa/2RQNGqog7NUX9nY9RaEICffUT4PY+1vkfsdiE7QQ4tUNZNbQiAO0E8eQ8lHWg2DTMbatNp2xGC5Ldi0DBtP8Vfu0Wabf0ZiWpwbSUPd51CB2lbLuiiDJ2EsFWPG3PCiUV/KL+VSl16D3TAUG3Sp+PQLdf3vMAyf7/kKOHpXXTdP36/hKhxcy/JGRhKHL28aIbIy/NU3uprnsdxFXaNB4X5c3VwHIJ2jpNs625gDUhjA0qdQU1K7Vph4bi0SDkmBpuKcDyBPlJA7sQ88vPb/EMehRDpgdNhaaeAnhOn3DWNq2i/2JTaySl5ch6SWjaA6xVNo+rYYSZqCctCbCJbx0Ze3SFta3do4qHPHk+cJFcqFBKeYu5oBiY5SbfD1la/QoWHZMqQ/KdOJjLHjQ1cbJkcthQ7iiA8xhHAMTQ3keA8btuP6bRoabkFFZkjvN1o1B0sewClY73G4rhToOB8Rz1eqGWH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(6506007)(6512007)(478600001)(8676002)(186003)(41300700001)(6486002)(83380400001)(2616005)(38100700002)(26005)(7416002)(1076003)(2906002)(7406005)(36756003)(5660300002)(86362001)(6862004)(8936002)(33656002)(6636002)(316002)(37006003)(66476007)(66556008)(4326008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nm+gR6serET8WEH6FfubHaBjyr7D4+qBeJIWyjLRDsbMItGk4WJm6c3/rj9O?=
 =?us-ascii?Q?hUgOVjVfBHGWLAwM8o+1HxACdGKr2z7plBNrURaJfH3xUq/CnoQXaiWYWjsy?=
 =?us-ascii?Q?1cn8vEww0c4t7cNJN9fhv3JF5A9nKhnvGUDAPWdkX1xF/1AUd/QHQDA5X/Oc?=
 =?us-ascii?Q?LPd1mSHmHLEOvu9ng1n/e1l68bDkPNpt82ixxLCF1zmBefewk11jIBa9gBKK?=
 =?us-ascii?Q?vzgLOEO2DN6CDIrVe5gf2UoDYdWxn1X2Mvn47ZW5sZkAB68DaYVZ/kTIpL7/?=
 =?us-ascii?Q?Duy1jG5oVqhzhLoQqq5k5Bz+3C1LxHwmAFOX0e+bs2vZXHATwuzz8EgsPjBL?=
 =?us-ascii?Q?4bE2GUoNHQRLGK8ymV+7oTX41YZ00GWNH36FYaiqs1le9PeU32OHZroYpfJO?=
 =?us-ascii?Q?NHfdkqFzRU3F2wFslcTXqIJRYEk7vGIl1emrJ5qGy3qRCtQnA50RjqzxPFjB?=
 =?us-ascii?Q?NTKX+BHM4J/YNb4ilM/aZBdulPNzF9Vf5p4j98qbAtgmHRvxeFpMmK7tHtnv?=
 =?us-ascii?Q?sxfwY85LA9WHx58XOEzY1pdddVyFnvyx7mFxZsErNjb6zD9s4RJIuqNxdiK8?=
 =?us-ascii?Q?0xbzspyjWC9jEWrPayAc16sOoaM9qkftXDhXrjDoA2ZENBrLKxLieukg9koS?=
 =?us-ascii?Q?Zj4gRX9lDWVzPMwt2D5DygAl9Ta2SHIewABaDHoYxnLf0SWGwcnl/qfiGeeB?=
 =?us-ascii?Q?U18CkBn4NmxYfU03wPhyWdjti9FDVvKCrVpGxX9P4hJ2LXPY7f0GSTbrIlI5?=
 =?us-ascii?Q?lVoQpctiNVg3x7efsK6/XzlGTqb3L7hTnt4t0UerGqIx5638MVqSd0nm4Zls?=
 =?us-ascii?Q?S4QNHG2a2BJuUMfWV8W6lDFWe/0ZFEkljPwBi+saV5rftxAMmf5keP2uot7e?=
 =?us-ascii?Q?Q6VdwVQl36u7tcSw10FpbbtYk8yotBR763UBLRvgUjeIopzlIb8qGNzW0bkV?=
 =?us-ascii?Q?KvuDCWPVgxLFHVw8g5zxIdoZargY8CByYckIzwaeOrNwLOnQZJiJPxZRcPtb?=
 =?us-ascii?Q?8FDwjwa/IAsj54Pkk2g82DBZLuuN0GAeMNm355iuAI3AAr8SVypxL+u9Ih1I?=
 =?us-ascii?Q?MhL7Gu4O7KDRB17xSlY70RNdqaN4HXwqisIhVxGjxolhwAVRInft597ZHstk?=
 =?us-ascii?Q?/hnm6wgglutx/y0kf1phscmo05bhvNE+K3lOmxuzYz2K2f34rszsaLZw9x3q?=
 =?us-ascii?Q?vGRzv38bklxs4z+3IOuirj4cuhNHcJSN6TCN4/eJp/BxB+ArTvj7QVzHhyLq?=
 =?us-ascii?Q?ey3pfdnOAe1TUBHU+Gy6+wvPwvU+h5f2iuq539PEzaig0GOXT8yxljQOsVya?=
 =?us-ascii?Q?ei+U7O+Q+xz2FFzfbyZNk7F7LLGvdyAkAcSWAkTqy9h7/WwrSc61EQwapDVN?=
 =?us-ascii?Q?WK9ELnYR0uwgdHVLeS1NABDJPFuO1FC6rh/LMVVXzQVOtUXhrapVic6qcfB7?=
 =?us-ascii?Q?kG8d33UUhoVh20O0K45WUJCOJhUL4LeaFhzOBuxTNApmVeAQuxmqCZxvQUjf?=
 =?us-ascii?Q?v6+BTeiJg9qfLzh6LlsSL83sd+tr++hEqUJeQAJj7bM6Ekh3WTC3kdfF4rV/?=
 =?us-ascii?Q?VoFJw4o72HkGxz3dGxqPoNIXSAFE6novdZ9EmtN7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6949e5-adb7-42a7-2849-08da5632dc84
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 22:42:47.6691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOqirtq65UgX9LCdtBk8ZDcVwG+ghOtySzzGBzLd99rXsmwZM7AFK5fv/uoCl6O0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277
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

On Fri, Jun 24, 2022 at 01:12:56PM -0700, Nicolin Chen wrote:

> > The kmap_local_page() arose because the code doing memcpy had to be
> > updated to go from a struct page to a void * for use with memcpy and
> > the kmap_local_page() is the correct API to use for that.
> > 
> > The existing code which casts a pfn to a void * is improper.
> 
> Yes.
> 
> If I understand everything correctly:
> 
> A PFN is not secure enough to promise that the memory is not IO. And
> direct access via memcpy() that only handles CPU memory will crash on
> S390 if the PFN is an IO PFN, as we have to use the memcpy_to/fromio()
> that uses the special S390 IO access instructions. On the other hand,
> a "struct page *" is always a CPU coherent thing that fits memcpy().
> 
> Also, casting a PFN to "void *" for memcpy() is not an proper practice,
> kmap_local_page() is the correct API to call here, though S390 doesn't
> use highmem, which means kmap_local_page() is a NOP.
> 
> There's a following patch changing the vfio_pin_pages() API to return
> a list of "struct page *" instead of PFNs. It will block any IO memory
> from ever getting into this call path, for such a security purpose. In
> this patch, add kmap_local_page() to prepare for that.

Yes, basically

Jason
