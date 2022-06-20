Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF55955214C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 17:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B049210E38A;
	Mon, 20 Jun 2022 15:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A6510E38A;
 Mon, 20 Jun 2022 15:40:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFkw6ujbqsMmplRRN7CPmTwo+lXUr7z8vS9rAdIitPmc/3jRDbFyBWEieiVEzzx+/2x6TWOU9LuKy/+7Bx2N77iYV6pSVvnS3jxsDmvas5e1yCFAobuzfvLYW4VNz8/uIsott2kWALHhvwshKf9XPfJkizj9o1qUru9tdHDxWYsQC0oEgezAtyizy0GoiUpG/l9jzU7JesKp5y10RmxEyZITEWaNcsX8mX1B+7OcGjekG8ImJgGElHzVKkQ2iawzwZbHM4EY3fzxLphFmVEzeu3TVYuM0w9Cw6BHIe5+K/IgysL2XieOQkxPEB0629Cx5ykw60RVY+PAQ4/uE0IiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlN0ECtgKqc9UPB2Mw1zDNRx3uQQ6vHbqj8pAhUgp80=;
 b=Sh/Gj5waDKWKLAYfBPooRasTD+YdwqSGDj4W6SvAwkoBD9X87d7ogRuRu8fw1LD4yH9S1CUa8mobWPFfyW+ShVu4GG07ITYhKbFr/hfhARjjs65Hj/SHl+/OdwjTD24l2KSRdXYy1uArJ8Ooa9mM2260QfYjqMX4/aFis5TYQfAm/BLaIK3RPDu8FQETMNmku9/gqeeIenZ4b9R4xGWYecMZZedo1ZjOQRLxmkULTaCTxvv3TlD/xCcxg+KHazS4khmTwC9A0VkoEjsZpPl9+7MemDOP3wB7OgD+aqSsp6CvoNFq+Frufog30SW3WH61IFID1sb2GPEFKUJ7td1v3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlN0ECtgKqc9UPB2Mw1zDNRx3uQQ6vHbqj8pAhUgp80=;
 b=Ly9VsLJaYcD3c+5L9/eSe00YYA2YFCyDkru91LAmgISrQJKHb1TzXOCZZV6uOtYdnqa1GMTxXKBu08TNDElJp/MNBEu9koh27GwYZV9YiAqZF4+C1qX8wJlAn/GZFJc0qNCQM+as7kkIPe2XH8GFlnItFk2zrcRfkgbfr3n3vmef8xoqA2rxwicMvYw2VN7P7eVF4Q9CzmqHGG9bNCFG2Ap9SK6K1ydllMFB1FbA2pnAUBZBCbVOaGOMFBuY7K9WFr693sysEd1WvzcLQMJqh/l8NBxhJJT2iTxzpItqW2W+5iVSO5Mv51UuEZNS6QzrCxcVOmTp7K6YQZBR9jKQQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MWHPR12MB1438.namprd12.prod.outlook.com (2603:10b6:300:14::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Mon, 20 Jun
 2022 15:39:59 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 15:39:59 +0000
Date: Mon, 20 Jun 2022 12:39:56 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <20220620153956.GB5502@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-6-nicolinc@nvidia.com>
 <Yqw+7gM3Lz96UFdz@infradead.org> <20220620025726.GA5219@nvidia.com>
 <YrAUZ7hXy2FcZcjl@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrAUZ7hXy2FcZcjl@infradead.org>
X-ClientProxiedBy: MW4PR04CA0290.namprd04.prod.outlook.com
 (2603:10b6:303:89::25) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fd6a13e-7a08-40fd-bef5-08da52d32203
X-MS-TrafficTypeDiagnostic: MWHPR12MB1438:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB143881D7476AEB391A9CCDC6C2B09@MWHPR12MB1438.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r2pus2Ue9T65ZRSnnC3dET066yVpFWrdfBz9Pdy/X/eQ1SFKMR5ANK7rUlpDStsZvsfSQVBZm53ApFk8ohA2Iv6qyVAffWyOPhGteQbvRihPFby63pHxN8p32NALvG8Ld7OFh9fuXGgx3hcwIgMG+M3yTC53ubxLwE2TVqbMpJQX+iFdl1vxEX1akMqN8p6Flu7XfOAiRF3BQt7nq+mjlK3V8H1oEP8bBZzxOmnva4gaBB9Gyjrkbkx86soKG00r0+d7Ulh0J9iSgue1Uo5bm5yLNljRI1XVu7cPCddofRr67m7iMD2NQ74+fZ9fe61TUYCriP5lvrMZ9ansapDFR7s04JScrrXBNRlgFVeLVkzugggMnJvCLEvBNXIQftaa/sZf2oK7qcl0Vxm+5rq2pJc7vgjBdmDbA3xI+84BOacWw9g24hwJyH0h5JkMr6cD5SjD6+OHSYEyqJ+v0Z12PhT96Aa6ttEoo33QhooUj3a0K3Rz4pKfR8KLQ84jnaP4qy0pimo0svKAWoU/rx5pG7v51WHOHnJBvP6LJ7jtBbu2cSV6TNA/1JQv6Abn1B1P++2PwzDzi049GOyrW4iWpvllhxW8MOVBTpq+jMPEsQZPrz4/5nIJHKWySTk//HNNUkI1+fwMveVo2ttqpz9k3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(33656002)(38100700002)(86362001)(6486002)(5660300002)(7416002)(498600001)(8936002)(7406005)(2906002)(4744005)(316002)(6916009)(66946007)(8676002)(66556008)(186003)(6666004)(4326008)(66476007)(1076003)(83380400001)(6506007)(2616005)(6512007)(26005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1bAV/LX1Q6td4b/COvDCMcTzQUO0nh8Tjv+Ndpm7eyM7zlZp1vzuT98YF4zR?=
 =?us-ascii?Q?K7V0WoGwIalBR2a8sPJC0MjGy2euJCqQgenskAkg+hdhWo5dTsdUeOwO+bvG?=
 =?us-ascii?Q?ohEkE26BnmehXvXVmWyHIj13XEOoYGJvoqPYK5hEfoXbPFE5UclIWK2kHOYL?=
 =?us-ascii?Q?EPLEhG/RW8VNBSBmpnudiMYODo3x1Lor8UhNRu7sJ2TfhOBw4S7a0qTodmi4?=
 =?us-ascii?Q?GQVHrTzvKUZ6lUP8oLTF+SEY9SAa89NKcejvHuiDijuHKonwjL53MDwgMuyj?=
 =?us-ascii?Q?YxLkhrV0hCJvQsx+Bv7sQTimAbZ+qNpFlgBVNVRkA0ttcqau9C5YFy5MTwZB?=
 =?us-ascii?Q?LHjxHDxpGiMqUdoxk//kApZhCAakcvrG/54JismLy04WFOujjbvs81sXTjYU?=
 =?us-ascii?Q?ZuaffpPZLnsbldlfFNIFS0UYlej3O5y7zoiAcbSosEjuE0Nhym+W4dTqHQme?=
 =?us-ascii?Q?IvmRMU6FcOwUXgDl0aEz9JBywBfhMu2HG+jVunVxOR++JAZKC9JZHNz/kQDX?=
 =?us-ascii?Q?B7439OjguoQ9vsSA0pLL+1s3PwQjvXloiQC9nxUg2tMknNU3xsVx079i8a6b?=
 =?us-ascii?Q?hMeDWHIQVHkZwkWq4Eh/wtYiL5F2yLnulMJRjN3OhftP5/Umm8rS2XRPEhuT?=
 =?us-ascii?Q?pK6alLYQgWmSFxksnmICyBmocCb1wT0R6DlhVaAjycDsqjDqrokjovmURtXj?=
 =?us-ascii?Q?bswc5ET7ro7Q2rHZgbXz+mEPb9nUEuw88kbL/RhIndhDnT6W53fBQpXYC8Hq?=
 =?us-ascii?Q?EPa7HRTNy0jKYM7k0PXcT8hPGzeQtvNeWd4dLNp1I5uq529r65uQ/qirD0NG?=
 =?us-ascii?Q?u8x0WSmQJex4NH1prtwQBj9hJ2Yd1yd4boSitIGxrgPqHpe8na7x9yHYbGtk?=
 =?us-ascii?Q?R36ZzE8rjHvvU7tAJGG5qBEKMiYcjgS19WTJMqlAWKCrnEXSkx22vh2rH7/j?=
 =?us-ascii?Q?QJNlQLZuAP8IZQxS0oEeIVV+HWB0vsctj36zKNbeqBxCS8cMADzAiW9uuWpO?=
 =?us-ascii?Q?zP6ZU72pG+Q6NJ1fho56TRs8B1ySCb28L1/3i8h7oiZGvkSQolxPMHzlHzH9?=
 =?us-ascii?Q?6ALVHljSydKRAXtl91qqQelZZXvSPuEtcm0HZf3CD8fly8WIYb1AJkKLq/Ep?=
 =?us-ascii?Q?6rOmjBxI0KpsSFaAGXvnK3Btfpb/4Iivt5ejcWEmDN+vwh6PmNTozLCZF+ri?=
 =?us-ascii?Q?B0r6RYjO4jRmFS+p664cQLeDpWlgs8tjEibh4qwfdEa5A2fa+rfB0/ku03fo?=
 =?us-ascii?Q?g5BFutFM4oE3JtyR3YJacSt5cIOMb15Ou9+SjFBl2zUly5tFFQNZjtT8vD9S?=
 =?us-ascii?Q?5KZUvjlEdAk0lEq612VtVpx7fZVPEGMbSpgT071rO5Qe2TSLfUmIfvRmMZdp?=
 =?us-ascii?Q?PB744YBl/p5+y//mPre9jNuse0Aj8gJssji/bqlWTcN83CaXLE4e8SIT6GSf?=
 =?us-ascii?Q?HskkfcRsJ/XJD0s0v45Gy1OzlYXTxfyp5uVyA3+NgLporGV4z8rUrkA8PPG5?=
 =?us-ascii?Q?AnfxZUrRvPtsbYRzV0xY5/bX+uo0uEmyGS8T+Gru9qsy+jp7URPr6qqFD1hg?=
 =?us-ascii?Q?qW/GhqAx9pIE2FD0wjb5S4YiVhLqHwD+u7CxiwyUTs/DSjlrSWzotzhWAwAL?=
 =?us-ascii?Q?E8Hjq8pIZNH+PegoKTujLR3YEihaQwLXLxx/jEU1lkjirmQQkv7Uwa5/LJI+?=
 =?us-ascii?Q?mWitMAC00nMkL5+VgHyQnzp0bqgWhFrY1Y1swtvUE87mjNR8pv2nIoS6WGu8?=
 =?us-ascii?Q?wDIQRuYxHQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd6a13e-7a08-40fd-bef5-08da52d32203
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 15:39:59.0938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypkdjmQKYzu99BoR8eEEDGyyqZyTcXpU+sMTbeHaZ9OuYig3xUdm2XVUO21vSEo4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1438
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
 agordeev@linux.ibm.com, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 corbet@lwn.net, pasic@linux.ibm.com, Nicolin Chen <nicolinc@nvidia.com>,
 borntraeger@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 zhi.a.wang@intel.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 alex.williamson@redhat.com, freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 19, 2022 at 11:32:07PM -0700, Christoph Hellwig wrote:

> > This helps because we now block io memory from ever getting into these
> > call paths. I'm pretty sure this is a serious security bug, but would
> > let the IBM folks remark as I don't know it all that well..
> 
> Prevent as in crash when trying to convert it to a page?

That or when calling memcpy() on an IO memory PFN that the guest
passed into the dma s/g list the ccw driver is processing.

Jason
