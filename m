Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A14406CFB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 15:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CDB6E9FB;
	Fri, 10 Sep 2021 13:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B5A6E9FB;
 Fri, 10 Sep 2021 13:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esBmszfN7ygIFwQDVjJ9ItaeW62+LfRhiFasQ/CT+9BCUtx9Pdvi94Z1huYQKojTp4l7kwCCGzAlkWVmySDqjBwJZtzpLkqDH6BkHeQUcRvW7k0TFu4HgjD9oJ+O3mWBg467iHvgcEjC0+oc5nlqy0z2/I9Uhfj/0SH/z1CGWcSRAKzOo6coKimIssOlSJrr8LY7GPU9FMCIFLzZW0c04FUTjHH7cKGviQYzhnKKaD8DbK0+/4GnQ8G6WEFJHhck/tX8HC5K0UR4xemgBMCUvyiiYxs+6zBIsBh6+UrVIlvt0ixTjvdvs5+o8XCj9lWu2fyvIBa68bvOT0O0r1NAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dJMidaqVcfyWf0MdzqgXZUXLoJR5ARnHL7UICuS7LIk=;
 b=n7gdf+nELSd3YJmwK2HnQzeUsIxflPXLq9p0qodBLQP1wlp+hEAgI251eU1/ZVwvFtKqVPX2ZROo4Fdm+oCZFgmBCJiUF/QcOEl/kXi7i5jDNS5YN834aAoI+isfgtaWF/Bnay41FmX4amn6rnCs0jXX358cvA4K0ELiMJiH1P6qOdza4D5D7L0C/CFchsse1BGsxoLNCKjwY4gVkiDsdWVAR7lLuKs5j2cCnyUvyt8qIZzhyqsLUBtgWiWoreSW4Q/GM3r5V21uV/I9raqxSuHh66yMy5G+c//KHoARc4eAvF9JsgsyN281MhIdQFZibDa/3e5qYk5VYt1langNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJMidaqVcfyWf0MdzqgXZUXLoJR5ARnHL7UICuS7LIk=;
 b=PKypkT2vMeUJCdS1yqDRvcEpqCQRFvgquKtCv/YKQo0c9ULuwKRDiCER8+93QiIyc2zwRp48LF6aa8gQHeMXZctwzzdAFH8XwD5Es8UY1GAqMCtON17XSUqAgkjKt/oEw+oD2vUwqg0L3lEM8eeNEx6217O1VO9sxeJDeQDI8HsUMKu31IloL9k/JCwQfnI0dQpcKc7RTm4BdP/YF8o/3oLFjpssvSxPCP0qFxy40hNcNzU9r/q+mH9zcW4Bdq3H4Qh30GQFS5tHj8CCbU3tUJLc7uuT3ZtI73KOuNkfM/LhzYYK314WAkqLnUyBOEqM6vhv1Lxq+xqKpD6sPAUn0w==
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5094.namprd12.prod.outlook.com (2603:10b6:208:312::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 13:38:53 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.014; Fri, 10 Sep 2021
 13:38:53 +0000
Date: Fri, 10 Sep 2021 10:38:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 5/9] vfio/mdev: Consolidate all the device_api sysfs
 into the core code
Message-ID: <20210910133850.GT2505917@nvidia.com>
References: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <5-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <YTtLRmiXq+QtJ+la@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTtLRmiXq+QtJ+la@infradead.org>
X-ClientProxiedBy: MN2PR15CA0013.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::26) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR15CA0013.namprd15.prod.outlook.com (2603:10b6:208:1b4::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 13:38:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOgjy-00FYKl-S3; Fri, 10 Sep 2021 10:38:50 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc9ce347-3a26-4990-bcfe-08d97460545f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB50944810E5831AC511C6DC59C2D69@BL1PR12MB5094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rw6wTOETbaR5wnDZar/FDz1hKdSdi8d8rkankYBjLBOVhnpMhHRcmiky4eBcW4Z10hd3z+kr4Nq8CRXn/V9hAozd/FMTeImpIxCXlwDVxZmuvyvM4h9m1kpdv4n4tBNNasn/LQHnNYvqXUdsM0XM9zK+W4j9DtEjidRfMmD7VpIgX9Qqg2Ly8NNsDaaJrFmIX5fj5+WrA+aOAjLIWvBIgRLqt+QfEyEKP/3xjrQyv8GtbTghaYpIZDi2obm2uO7bSFrpWqccUkfhJSCZw7H+RtRopHDNWdPigael1kYalDXr4SEtnd4JeppVkoyWqPOiZetk/TWR5EwILiXn/5RS3H6TnaIF+R417EZ8WcOlVkydZYpxK4muQSZzWZcfTlRneOpamwyWwy6Fk5vgtPStQbjEAf5nCA9WeUU7rJo0ZoRkqcdM2axckSl/kok5pj61VIC5CASiANNcRrXdZwZjLxoWXRyq1x3Xjn9YjS91Fc5GIdfTpi5nwAcKUNVfs9wj3R5RZ7Y6ysRGMZl0QD0gJQfufgnYgk4AnvqJMBtYzrPC+clX8FvVvydcoV024QNEXdTomvM9S98E4bqLu555Zz4KadP+HCeIVkrlNlAKOKp5ZaiLGwPhUaJS/+Cm1LO9KZkuF11GUsJtdqtsd3pFPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(4744005)(2616005)(5660300002)(316002)(508600001)(186003)(426003)(36756003)(26005)(2906002)(9746002)(33656002)(7416002)(6916009)(66556008)(8936002)(38100700002)(66476007)(86362001)(66946007)(8676002)(9786002)(4326008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SDuZHjki13zUwWqTkTr7KjStUMTTx2mIlrBGo5di3sDN9ZYP4S1srjRfXdhe?=
 =?us-ascii?Q?yBZ1m+l0gKPsWTry3GtdSn27bAZQXCGlx1DflRf7VikwAl4lyNK7++xQxrXZ?=
 =?us-ascii?Q?ZZXh09EjpVWvLRR/f/lfcCcCpJSfcSeoAi/LZ3l8rSsiz9Yuy/0hjoYHXdXJ?=
 =?us-ascii?Q?5TwCbSdKy0QN8oE8IRee/77qqgl68aPHXx2hx9j6Nf4LtX+z4f8frNT0C7Ww?=
 =?us-ascii?Q?bQgsJmtyLW+z97+CFA2SRRuixiqnhM/+4kvrrGZfl3hyq1FzVl+BOnS90hp/?=
 =?us-ascii?Q?Ht/W0iY8xW5F1kHhZkLtQ1GJ1et6gJ5OWEQKWL7eSb5nY9/46mXhXXVj9Tua?=
 =?us-ascii?Q?86mC2sG5ADhDQC+m8Csm9ygfUQoaXJoKJrGEsbL3v1h71wa3D2rbW5AeywSM?=
 =?us-ascii?Q?/unVFSkcBv9u6ppGxqOuChJVuDCfMFRO6DarkrRQ1zgZScmL+TEDBFny5adg?=
 =?us-ascii?Q?7+d0fGKRzEYrjHJXw54jI5V9nitcH4jSiOTNKMhlqrvIg3BqfguEpAKvy6o+?=
 =?us-ascii?Q?KYOvqpJTHq46AwnBZbywFXjgYq2nUyXEcHOOAhhtfeDmoED4xZN14KJdocOc?=
 =?us-ascii?Q?yB6g/ZYykq1LtrlCDCTCiwJQ0+t4/9Gz9czRAKkq0mmtUpoZaFvn8o4Q9btr?=
 =?us-ascii?Q?C7AZzAaNdGxEbUqc0IgGrWUFv3x/xLprpzH+ye6aSc1aIHLPhC/6m9Q8B9FV?=
 =?us-ascii?Q?CNgB1JFfdDllqmqmwkvlDajmGiBqVE7YClzhcamraM0pVtDWiCM60Lhv8bYI?=
 =?us-ascii?Q?KvjiB6BoqIdwEdJLw0aJeRXzqLe+5rcYChfJ+6jOtHiOc1Rvvm0TzVOflHtw?=
 =?us-ascii?Q?tDGER69md7QwPnmWDh2jHJVNryaGcOKXlFtntRzYsFCWNOq2m7f+uG3an5K2?=
 =?us-ascii?Q?caikoEE8O6bX0xRhnAigxsqHpfkkRg7d2YcRSOMKoq8i6FfkR5/gInVu3N0w?=
 =?us-ascii?Q?k2AlT3XOiKZf3YnTQlvp8dNVha0D+aUWPOfLj4OqKTxx/FL2c3qRt/qT7/49?=
 =?us-ascii?Q?yCiwXml/H43g6Ah4NcPOobLGHcOyf1OTfaxt2OzmPEmdtalT3GU7NzkRPBKq?=
 =?us-ascii?Q?x10zWixxsLpvq64I3fgh2YQtXJzDVB/zu7rHVdVFsbnwYCqBmvPUH3KptaV+?=
 =?us-ascii?Q?vZ/mK/qquPQPSZn2KqcF3gS2URaVtIFEUp9U2fzjHWLb9iHpnufo84+8z9+Y?=
 =?us-ascii?Q?Zx1WfnrzFqcfy+RO4DCvsxoa4zdlyvX9fuk9DFA8Sh2IrKYwK1kMO33WHHP6?=
 =?us-ascii?Q?hjL/o7TmWdTKIcQcwX2g6Fs6UatyD3NYV7f3JOCp6GghUyn9cHOGSEhOHRmo?=
 =?us-ascii?Q?jjau38st9pCB0yPXzWAx2TZn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9ce347-3a26-4990-bcfe-08d97460545f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 13:38:53.3138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TV5+xS3vTlme0eZ+DdsHsePBh6+WmMwawNfZUrGTjE7w6tx/4RSsxsavHYbc9xDi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5094
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

On Fri, Sep 10, 2021 at 01:10:46PM +0100, Christoph Hellwig wrote:
> On Thu, Sep 09, 2021 at 04:38:45PM -0300, Jason Gunthorpe wrote:
> > Every driver just emits a static string, simply feed it through the ops
> > and provide a standard sysfs show function.
> 
> Looks sensible.  But can you make the attribute optional and add a
> comment marking it deprecated?  Because it really is completely useless.
> We don't version userspace APIs, userspae has to discover new features
> individually by e.g. finding new sysfs files or just trying new ioctls.

To be honest I have no idea what side effects that would have..

device code search tells me libvirt reads it and stuffs it into some
XML

Something called mdevctl touches it, feeds it into some JSON and
other stuff..

qemu has some VFIO_DEVICE_API_* constants but it is all dead code

I agree it shouldn't have been there in the first place

Cornelia? Alex? Any thoughts?

Jason
