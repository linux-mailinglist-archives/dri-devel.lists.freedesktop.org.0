Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68993559ABD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 15:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEC410E67C;
	Fri, 24 Jun 2022 13:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117B410E2F2;
 Fri, 24 Jun 2022 13:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOfkiaiBd3SaCUb5oUwDreND4pVCDGXR8sJwQ53+PRNN0TAPnsA94dOH12Cpp2dxYL40yFj3qxEHWmGRR5P75ykKsjdWS+cNQKnx/F6RyRd42UoZJG4d+9qnXTMmVBqAj6yBLR8Cgw9fCepO2i5ve4er9GWFBlalobaBgd2qmjCrQBY71Z7FVIPjppjKGM628WMmRLPhjOsoavnCjobHt1PwytgHHOjG+XvRxDDqmImk72i4xyY4QClcc2covTN8XV56tlkkMbkC7sGu36DfVv1fR57kQaQBPGdnCvNJyhOvjccr/7pThFSeOnu234S8es4OkU6NwlJ+LQ12/6h+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVsErnjxwZsw6/N2wI93VyrUlKVWC8i4eU+ooUC2Q7k=;
 b=cI95rlr8PXc9Q0KeRPOMgqxQ8dTF2t8JOexECmcXi/lVB4fbSBXxLLOzoRZKaM3O6bfMWL8tg34OhTGXY3GbQKNcq1cwF6u6dkSMLxB3iTzVyTfJUILcVAb4kgPkKyrsqpMmq/N/RB2TTURDpm2h72UaiDkZWZbSRouUTQANkCvXUmu3nHfYyxhVS4ODEnExFa1/uAuge0SiKBf7646mB4ymqZQQMBOcSoFK9o26qHoFz/9UFOy3bgIXwIJNrxdUgE6zX4O6zsmbqU0e0f/QTuO9jl72O05k7ig/qufeNX/hgjkmN7P+3pb5ssoR/vSylpXVz/7PCaHFpkgpFAvR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVsErnjxwZsw6/N2wI93VyrUlKVWC8i4eU+ooUC2Q7k=;
 b=pIqQd81Xnxp0JxOtUJOWvK5BM/2mkk3E+AvGRp9+FdOxvMVJ4dvCb6OBpTa7QeK50ywzT2gDGleGGLIb6y/H7tp4DEikwgRQ0cKhw/7mmg8H+BxUxa6XFWtAa24rNNbD4cHw+2Rgt/GMxKqyDv1IU3Hz3cuSuX0g/SzqBpZCLQkYEHxYGxNoEWsx9+OQMU9WshNypSipPNuZURRiBZVBu/ZqkkmFQIdeYQV4EMwbihnMhKfnGr1y2g9k2imHtDkwlwBEuYNJEc4i29DnoNu1m2FqTS2TOdGX0zxzqrgarHpAkJbAUuE9znd7OmcNo+XukveZVCzqMKqTsXwPeNcIvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BL1PR12MB5333.namprd12.prod.outlook.com (2603:10b6:208:31f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 13:56:17 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 13:56:17 +0000
Date: Fri, 24 Jun 2022 10:56:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <20220624135615.GO4147@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-6-nicolinc@nvidia.com>
 <Yqw+7gM3Lz96UFdz@infradead.org> <20220620025726.GA5219@nvidia.com>
 <YrAUZ7hXy2FcZcjl@infradead.org> <YrI2Ul/u6pRvt0rT@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrI2Ul/u6pRvt0rT@Asurada-Nvidia>
X-ClientProxiedBy: BL0PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:207:3c::32) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bb14af7-45a4-424c-6f1d-08da55e94ef7
X-MS-TrafficTypeDiagnostic: BL1PR12MB5333:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /4Uuxq1GZApsrKMT7xGnxhJOEmZOxdSBjvCUWN1jjB8/8W/FxS8v0g3hP0Q6gRd+ccNjTYH2uSQcv+s1d3LM0ZHrIzveA9BOEILJqdPKEwTfqboW9XgCGEiWrtBY6cWozsWIyR8RVE+K//7XtSorqVmTOOZ0qe+Q13hTi47HU8dDbG6KSZWpnTjzWofsqo0tXskxx4vCNIMkzm2GX6uswo20IxLVS7IvpPTU+1w/oLw7hp0mDnwkR8+JYOQCDaATtSMvRE5hpOz+6p60nXUygJVTudNPeMpXKKoU/QOlcgeVslDqpPxrDmO6rQKuUojW1FC8alHwDKcKwx+QN+TgDK/8waC789TQq8fje1/R28jngIZvMBwELCXioYj2ngD2FR4RH0eK6uN9I8jbWGkVzMFGXuht/F014+nVWpa8lUMEUTq2weiADHFRTUs0MXdSDEUaQgbBfBdgZpUGjnVzfAuwO4ao4paffkFu1aPB3YXS296eKsMk/PTbSbDgwt+BqrXpzNwEEdnk+gFc6cqB/zxYqB8uAV8uZhGoOol6/naRwxFPUsX1y1HomrPNMJe465DijPjY1V/Zfcgw8sPvK/lg8J5tjns1qe5sipWuqqL9QOHsIAP6rtddLvZpjvSe63OKZ6IAvaeGy25BgZSslG+lNKvzki6GTe8Hk2PRNJmkbEjFLWGkQudo3IgL9HAybVqZRxyhx2MbLz+4mxN2KQBZ8MxdxQ+vM88yMstQ9piskceFB1zpSFLJYOgxV9eP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(478600001)(36756003)(33656002)(2906002)(7416002)(6486002)(186003)(26005)(5660300002)(83380400001)(86362001)(316002)(4326008)(66556008)(66476007)(8676002)(7406005)(2616005)(1076003)(6636002)(8936002)(41300700001)(37006003)(6506007)(66946007)(6862004)(6512007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/4EAIsFnR1AZVJr2BVtOVwcXrhFFSjc9Q5LhSa26A+dfnn9H+aG38i4HZ3fN?=
 =?us-ascii?Q?SY6ff4oFexFROcq4y8rrrTOsf6/8rKYKdNi+gOvQPqClgKxeQMbCFFq5+nUM?=
 =?us-ascii?Q?EJhgS1mX2a/QC6Dk2R/eySj4kqZovwMxpHfvdmRQL+UkGcTkngjjIm/5vcPv?=
 =?us-ascii?Q?ubfgqhhyjrmNBto46ncLCGKWaXNyNFuSbYo2LWq+ik9RkIZcDgfgwO4BF6Dh?=
 =?us-ascii?Q?alzi12rq/qbdVf2H/pddNqXjvDuPpFWOGojhokt43ocXhwP0JaoXawGDzsgT?=
 =?us-ascii?Q?0Vg67vtwxvA34S9/2B7+y/7rL40L6+1gF5wF0dbgUw8L/NS0e8s3THCd2Jgk?=
 =?us-ascii?Q?5p/CwG3nZS4RCP0GBTisgsnYfTFbG5W/nhS5q5Aq9J8GlBAGi52mcPQ17UZe?=
 =?us-ascii?Q?SmtLUiBq9sohhvqiW7Vh+FL++fXeQavlo36Jy6O40fvY3nfLFtLct/tOQOND?=
 =?us-ascii?Q?FitpVQRuA0qhdd3Ltm8yysyO8Cd2Rl/nYnf0XnBKpFN7QV5Spnzg1xFN70HB?=
 =?us-ascii?Q?SHFfuiLb+L9a6CikFFARPDUutIPa/QUGPqbMvwMG7b88QtSMGgWBNlSsp7M1?=
 =?us-ascii?Q?sa4CLaYYA+hPSBk55zVuj1cv9y4W/ltqnOaofYvcUdwIw5T8KyqU/HRMjVfY?=
 =?us-ascii?Q?p2HTzosqGP2IBqy+vPStvZBqzV5rsXPOLjnDIRnPLznOdTdtPLPXC+09fJcz?=
 =?us-ascii?Q?U7lDJXCGgXL3wyQZjHmMnYU9XE9rZR+1jhda5d9aK+sxPzhvD7jeZ+7NKx25?=
 =?us-ascii?Q?kWim5Hjy3hKtFzXR4ufITPKnNa3HkzPCEfFimwQQ6CBJh7u2BC8X7IXkXC1u?=
 =?us-ascii?Q?kjWZ1C1Exu8FyNoYU3VxZ8mP3/wj/O9PVWWvawzttX5OxKzczuUtAbAkslX9?=
 =?us-ascii?Q?IPvjEBlg46Pf/ON6DnADlZ2pvLWGZUmRpnz7cpSe1YaI4tftj29U9mhuQ5+y?=
 =?us-ascii?Q?tHu3j2I0eDXxXu/PIZiMKxOZMIpxwTFZvszdwQPB8wQZIedWw5+BDkve6u8E?=
 =?us-ascii?Q?OKIW/FdJpEMgbyYSYH1RNH1yYG0qMqrdydG7HwbK309AF8IrAmwmFq7IX7dA?=
 =?us-ascii?Q?IqndMykDibFtLbXKU+G0cMjmq4n/jUsDUaZccGgbkzOAhWL/GIGnkOrTJ2iJ?=
 =?us-ascii?Q?IstHq2QkMUOWWPFOF+iw901D8bD3ZECiBum1FEefyelmwNumoifpZYO5BMQw?=
 =?us-ascii?Q?zN8HgLQ4xgCPoaWT/r368KAAzDAyLuIsZ2YZqUPa6tVXFXX/d/WnIjo2Zf0D?=
 =?us-ascii?Q?64lHoX5en0P+9hUaGqz8WPApz6H7oLVpHIDltz4OmPiKXVjNziMWTT0N7NRb?=
 =?us-ascii?Q?X5U2aH31+PH1AWIKa92PgjpH4gYrdg3vn6VMTWHdwWgOUbud8ycNO+WbpnCY?=
 =?us-ascii?Q?oFCVq4tP84VJkJZ2U9uCnNClz7ZefRy0rdJ4FezyPHGkQh7wcydhDT8T3jo7?=
 =?us-ascii?Q?NhXsl0gM657QoOhCP0zbQED5pUsSo+TE5Pm5ShQmigkvLgTM8+mjD5dguDnZ?=
 =?us-ascii?Q?Iob7gfrHgQpWRu3lfAVyYaNZjFI2RhgCXWzD5vTUwr8Lfy01Jb5gT0d9XvPT?=
 =?us-ascii?Q?lr6yY2nu1QG8xPE3aL0vOg7u3+3CtNV3Sh9SuHdc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb14af7-45a4-424c-6f1d-08da55e94ef7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 13:56:17.0206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuqlLCo+4x9gtj5pWXdVFHZdVs4CmcIkDy7H4ZlTvtu6Q5vgUEtZ1Py/lq/nJufr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5333
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

On Tue, Jun 21, 2022 at 02:21:22PM -0700, Nicolin Chen wrote:
> On Sun, Jun 19, 2022 at 11:32:07PM -0700, Christoph Hellwig wrote:
> > On Sun, Jun 19, 2022 at 11:57:26PM -0300, Jason Gunthorpe wrote:
> > > The remark about io memory is because on s390 memcpy() will crash even
> > > on ioremapped memory, you have to use the memcpy_to/fromio() which
> > > uses the special s390 io access instructions.
> > 
> > Yes.  The same is true for various other architectures, inluding arm64
> > under the right circumstances.
> > 
> > > This helps because we now block io memory from ever getting into these
> > > call paths. I'm pretty sure this is a serious security bug, but would
> > > let the IBM folks remark as I don't know it all that well..
> > 
> > Prevent as in crash when trying to convert it to a page?
> > 
> > > As for the kmap, I thought it was standard practice even if it is a
> > > non-highmem? Aren't people trying to use this for other security
> > > stuff these days?
> > 
> > Ira has been lookin into the protection keys, although they don't
> > apply to s390.  Either way I don't object to using kmap, but the
> > commit log doesn't make much sense to me.
> 
> How about the updated commit log below? Thanks.
> 
> The pinned PFN list returned from vfio_pin_pages() is converted using
> page_to_pfn(), so direct access via memcpy() will crash on S390 if the
> PFN is an IO PFN, as we have to use the memcpy_to/fromio(), which uses
> the special s390 IO access instructions.
> 
> As a standard practice for security purpose, add kmap_local_page() to
> block any IO memory from ever getting into this call path.

The kmap_local_page is not about the IO memory, the switch to struct
page is what is protecting against IO memory.

Use kmap_local_page() is just the correct way to convert a struct page
into a CPU address to use with memcpy and it is a NOP on S390 because
it doesn't use highmem/etc.

Jason
