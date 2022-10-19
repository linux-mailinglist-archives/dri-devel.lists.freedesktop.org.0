Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C53604E79
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 19:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E2810F2A4;
	Wed, 19 Oct 2022 17:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FCD10F2A1;
 Wed, 19 Oct 2022 17:18:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvOSWvNNjoyGG1nX7xQGRFcnh+jFlK42C1nnshwkAovetYAIuUlTmqTCvwx9ERkZb8dae6pMSbRZ1OQJMN4seDN1Se70sAPdKr3nDho7Alozok3SMLMW8IxLIDie4uwa7oOIQ6I1aXDu/jfjMxTLt6Rd8EbgdbaqcU4IqYtXH2S80pLTA3Vo/TQLiCDZrVAPnqs+QpJG/k00MzxQ+vha5PpaXzf+VOhKniaDetHLf4xqz11zdt5kZFNAtQEbfPOjR64R3Q2irmmmgQKsncbfo7E7jBDlFitj4abs1l93neiNCv5984JTV0hSZRsHNXPKKvhGu5Nhg9QP/QU1Y7NkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeIBeul+3UROjR4wqMK3OakliSW1LmrFZpRdKd4r4lg=;
 b=HeTH8QycJKDe0sixOiAAibSBJB4KvwfFuTPIBHxnqKqzxUQ2HajptIFDdQq2OEm+3+adHEn6z9JHmRM4r/F4EX3MnvuyMXdKMBHOd2KJlV/qGKCXnQEHGk5e0tTxNMd8zLlgOiFmDqGwggjMrXmtMCA1Oxted6PC/f2LxufHGSXtr7HcYNDWyxbsAP1cpzPHvSZIe5LzTvSfo/QXY41101lnPCh7RB26sJn/Bscyj+pI0MrxbumoSKu1MDNliPn8vQXSbSOWCd24iansLTZVoGE1uzRtkS367S80FQwkDeYeZgIpI6vgOsi6AzhFmCxYeVoS+XYn2/CNBwsiOUH71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeIBeul+3UROjR4wqMK3OakliSW1LmrFZpRdKd4r4lg=;
 b=KULwPtnGa+EGhue5TvwnIizm/je+w9xDjf/9bZMNm8/tFg4MYRf5EOaYeRb/i/BxLi8jrL8LsA/i5Y8o/G6EMxfeVXwlLATa+o35AesVGHjtSLD7yEObuBTKJUNt6PZix73LUoMtSOmuwKXFG8PsIOsKpLvsQ/XmFwdcfmQ05zS9YaXlWlMeyd8aHoogyFua/VZw/Qm+84dbsOR+Xsi2jVwCHewPxNHnvxGJwJ4yz/yk3digByDmnUSe06zEIVXrYaIZvehXeSO1cC41RVaf637CEyODTd9tGZTNaxfOCowcTXCKh8B2nUEmJIFS3exjQNan+cVBUqPuGw/y6e1YNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6122.namprd12.prod.outlook.com (2603:10b6:a03:45b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 17:18:26 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 17:18:26 +0000
Date: Wed, 19 Oct 2022 14:18:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v1 0/7] vfio-ccw parent rework
Message-ID: <Y1AxYXJNm4zz8nx8@nvidia.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019162135.798901-1-farman@linux.ibm.com>
X-ClientProxiedBy: BL0PR1501CA0023.namprd15.prod.outlook.com
 (2603:10b6:207:17::36) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dc6330-b0bc-4eaf-af6d-08dab1f5ef18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1Pc9l6JROP2H+kVUOu3YVEImakTkZQuneVmbRx5/SBXDacznNTiKPJW/TmNKZaeFW14+LlD9yWizUOv1q8bla0KtM1c3/2kNrNrVZxXT/eSERFV3mwhVzkHtgJu8ggiybzOfS6aCURIdaIEmxKJesqBfKnv2O9KYXuZV1+IAvNuATILNgoz2Vk+vLCSZA2rEDqKOPJOsNKuwkCDvKnh1GfRuZE3GcI8A8eGAy3p3JB22fIYFBSBmQQVF81P1QqPW6Q/Spcmi5VQQxLCdi5BOwNgpj++N4WoQAzn8fBYo2acaKf8rHRVgEa193kSWQQndv6yxorMItGRGnBoq1cpgaSDBZpRpujAV7JtUYlGUnGsm+lF2Ft7+iOhDiBZ6NCcmwlFSsXeTHD1BDU97vSWgKYU2yBHcy/nr7/p6RBmngmEk1ybjFhHd93sBsuB2CMHBWYbV4BK07bU35StONlBs4pqVVhjV3jvC8WbJyvDT8nwD662hRLIuCeRqY0jcswMwQMwv5UUi7xSxhsutTWqLWHxC5dlK8HvD8d9qWP0bRV4K7L8RetCGQrRFyil3NI4+H3LGnx+FzjVeV+JgKK9ybNaAGamZHgkajXevhI3uNqFIEgiEC7zKXzMsAuGmOt6e9Xe9oq1BbkXTJ97h395s4DLmD3LN2P3ALr88XLjD5NWF5jEkqoAj7PXgqrII5xPoLiPU7mpptGTjXLBw78Lzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199015)(316002)(54906003)(2616005)(2906002)(186003)(6506007)(36756003)(41300700001)(26005)(5660300002)(7416002)(7406005)(4744005)(8936002)(4326008)(66476007)(6512007)(66556008)(66946007)(8676002)(38100700002)(86362001)(6916009)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PnnuSlAo8q5C/YEFEFrDEKMaF8cVPg+TL8uoN0wNNp0rTok0zxBVtuiaLITv?=
 =?us-ascii?Q?9OvvpNCiAY9KIs3YntPGEtlvME24kXC1g3EQGoCd42dnL15QO3ndbon6ZLUS?=
 =?us-ascii?Q?ijO4ECtySBRJWcS4Zk6Rx6op2aU7NVT7jxqIe1S++bwcxMXA2Bli+F8brNYj?=
 =?us-ascii?Q?mAAuCwzh6erV/YMEfFCbACYUMehvJ40Z6AM+2WlCIMTtBYRaPIU1ZtSJZn4+?=
 =?us-ascii?Q?dGNO0gQQI2UKWgxkFJvpd5xRLZH606B23cszyDbGMogy2kfLlqiimq0PMIAE?=
 =?us-ascii?Q?GKq+9xOFTZ5wdU9vWcTCjbJn+yN+4QbmeMmsk5lqvowBSYAQaGCbR47AuUEE?=
 =?us-ascii?Q?isqjeNchKSxTXT4uAdPjshqLfFznTq/8ZUcEQjR4/7my97fftxgQm1oTotCL?=
 =?us-ascii?Q?4A0GCTDzDxneTJuEp1s59zpn0IwTzE6DodldmIQMI4xDzrKd7drAxvhDlbZf?=
 =?us-ascii?Q?Hv6eOSOV5d7azqe5pnp4ioZ+WFr/rlhSZKwGhR/jEAugZ6fUsxMSLzWgJuYd?=
 =?us-ascii?Q?IBT8SmIvDb7XWbndciAy8bKCisy2hmUQfRfiEgaiApnv0OZ5dk6r2Makxop1?=
 =?us-ascii?Q?sk/oBvh4XTxEcpmDvkzC3r1iC7E8HShV8ROkGBdFfnfoKeylKWW3bNU3cq2R?=
 =?us-ascii?Q?RaxS8LdlMZGAxQTfna2oPmfT1xzMaJHgAGSM2JCQDLm3Aq+HnYqTBmrwJjOg?=
 =?us-ascii?Q?8sCDtIAhUy55jI48CP1iFihamnR41g4frdSNPalfOihKyi+J9J24D8UsT0Ye?=
 =?us-ascii?Q?29wCkXmpcj6YzvE0TFVL5IInJxURr+thgLeQRcN/vQsgZpzXVj/C+NfLL4rQ?=
 =?us-ascii?Q?K1nbtIURpGvfgUUM6t7F8WDiz+0wa70ZKHAhXG/aQ56MJN1fhP7GR+/VYvr0?=
 =?us-ascii?Q?Cx5b1+2cxcRYfj4OvCbQqhFelN8QIS6zKcWLJoD47/+21Oca9/x+yLD+3v5z?=
 =?us-ascii?Q?eR0BHScx1uKoe9JjvFAnBg48ALXOuqvYlz8rTPdfz/2DsWOAt45cQ0ZadbRu?=
 =?us-ascii?Q?BugXD8owLaCaPi9a3kXQF+SegpSbk5UokrWw9BbFSGJtJ6lM7vqiWiufeMNH?=
 =?us-ascii?Q?a9V5FonIy37hzNjDfX3kbSKeLpLX+xhNKw4lJ3tUkIite11vbhXMQ8uxU2c6?=
 =?us-ascii?Q?HpT6jo0btOXYXBOwxG9oIUTw2wIQYYC+eenj+8u4Scgrn1IwJAgHYD5Gzjwp?=
 =?us-ascii?Q?BXcoPr/G4kdgqpu/zibwoQuw+0Km+R676186Uqu6T1rFMYRm3JL+uU4n42UT?=
 =?us-ascii?Q?hbEOLyyZzK+OrIsogVVPlXa9eNxZKSYr2fCxV7SzB8xYXgsOiqnlLAtFPmxQ?=
 =?us-ascii?Q?tCw5kWDUFjTj1hasSW+b6llcs4kLaELkq1EdQy50GOdl/CkN0IJwY1Dha5CY?=
 =?us-ascii?Q?7AyvN4cbcmll8ibPfuJhbbwE5EsxeMArXxKPNMxwtchX/KqWIoyeogYmLdhA?=
 =?us-ascii?Q?fGmTxmhdRGl+3+D3RDKGm4S2gBdpliu/wzUGxVDjO7cr+XZeghYt9Rqf6w+R?=
 =?us-ascii?Q?9qo081+eq4wLTfSxjtvRQEON559iqT5ikt7YkUWg1DJs2q6K0+/UHaQLhqOF?=
 =?us-ascii?Q?DsDqZsCUENGOP0FCJpc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dc6330-b0bc-4eaf-af6d-08dab1f5ef18
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 17:18:26.5322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4y2GDO21EfFT1O6+ibMrPWgcgbEzjkkkQH/HTir8U09bqcEsBVmeayO+gsWEmCz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 06:21:28PM +0200, Eric Farman wrote:

> This series attempts to address the oddities/shortcomings of vfio-ccw, such
> that vfio-ccw can use the same helpers as everyone else, and the tricks that
> were implemented by the other drivers can be removed. It is built on 6.1-rc1,
> and thus includes the various changes [3][4] that have occurred in and around
> these parts.

It looks good to me if you are happy with the ccw part

Thanks,
Jason
