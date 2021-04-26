Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8772436B840
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 19:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141E689CC4;
	Mon, 26 Apr 2021 17:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D1A89BC2;
 Mon, 26 Apr 2021 17:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilL7Y6lPylBc3kxRn95zn//FoYefklZA3XEBziVvVQd7oANTIkcBQZcz+nU2owq57SM6lWqnYQPYzRDrzz9R+lQ4jmKcLgQcOYzqFRmiOappmBasrw5fRGhPfPIwkv4hb84CXRHz/RiOKUT4j+KxEPO6x0HZkyxqMnsnBUC6mhk6QutwEg36EA5sDlbvPcJwD0eYHMtD8fgwjnpqZu7nZtwBrKenhYvTMStzf5oe3tbgV3yGAocWTrzq3QmCDmSXNaBlK/ell9ft6gukcRzOXeUKly1ctLBryidPSJ+saJZTKsCcX1r3xofMBOxTkEKB1DtS/GRCX/LxgiWdZYGenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfpZ7eQbr6s/a0Nv6wJmSq/ur7J8d4GrDbRoNx25kvw=;
 b=TfvSEOtOwfLzGkjjux7XZdQYJIR3qIP0y1owKVeOk/gjXKbjpJpEOIiOIm0WXR87WGxkNvBVcpyfCaigoYYZ6TY9O2XpLG7Y86aSqGVdBx7gPJ/hmXJO2aVu6M8fZVGPf7hZCVEXM5TznzM6GoWTq8s9VbDSqolaLL2YvggroGpjVfPzXW+S+JuNqq7RyZ0JttfDkZB+fzBa8kxCaRCIpnHzFfbjFgpNeWpF4lz3OA7jnY6Dy5R/qlFbPOmxldyEolWP4KfKew6EnJAz57aBmWWDS1ISJUPLaHacyv0N/43DgAVXYST57jWx1lO3cq/Qt+iUKuHagGNvB4ZJKpmQpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfpZ7eQbr6s/a0Nv6wJmSq/ur7J8d4GrDbRoNx25kvw=;
 b=bpP9+enzgTzU7YNIswMtoWRenJPPFrZ1wSvd41f5FPyDbMsSCqV8Xt3MVI4sAbg4y4ovkftX7c0a1UBJ/XS/v3dUlZapQD12ohVAhF9DSfht3FjD9JI1l2h9aE0BZeYL9CJXV2vBWY6DZTUee2f3kNfnEdNLe29Qv1Bd3fd4y1j5AV0iI7qbFW5RVw7yTk2MHay9aqd2iUBJ6Xelv+41M4fp0H+tEOc6rEyA/Dj23zpl1AE0DyGXDLa0oc1jRJ+b8HbU6FA5Inc5qXanqVL7y8yUxYIY0T7mBSLcpIt6/a+tvKQSdNhRWiFR3zvFE0YzLgJYAifWbKqXl0JYybRmmg==
Authentication-Results: de.ibm.com; dkim=none (message not signed)
 header.d=none;de.ibm.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 17:42:52 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 17:42:52 +0000
Date: Mon, 26 Apr 2021 14:42:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 00/12] Remove vfio_mdev.c, mdev_parent_ops and more
Message-ID: <20210426174250.GW1370958@nvidia.com>
References: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
 <5def83bb-599c-27fa-9daa-efa27b5ac1d4@de.ibm.com>
Content-Disposition: inline
In-Reply-To: <5def83bb-599c-27fa-9daa-efa27b5ac1d4@de.ibm.com>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:208:e8::28) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR20CA0015.namprd20.prod.outlook.com (2603:10b6:208:e8::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Mon, 26 Apr 2021 17:42:52 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lb5Fy-00D7oo-Vr; Mon, 26 Apr 2021 14:42:51 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 643223fd-6ee4-43d7-d910-08d908dab76b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4356D8355283BA84164444D2C2429@DM6PR12MB4356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eiDcZiYW/aYhMHV4ec1O5Ttx02fbwt6BLHtiyG7OG6noN5Y5C9DBEy+K/Eq5OZYIylWR75tRoWf5FkkYc9zf0EV81NPlR6fSw0YAVZDtPOxhcWH3YhiAbZXqg/yUBzieVsEo3ZS6EUlT5vtkJzLUdlFNVltKAtYA6gBEXOGjrBG7w2+cws+xfq+Ndp+sRG4UtGc4qFIVxRKj0hHoQfXdqE6g+AikDXB7fKaSSHXW0lOSj/td94x1t2Y9YgExr7+mC1dXLSjDBwYAmffkE2RTOxxgIq0XM83cYBuIKjH2vPBa06xcLgTlnw0RjjlR+UxFcRoQcmYGhEG2NfINHZ/SUKYruW9URNzOQl4DirhBNBrlKbqP+NMNpoFV2Utl7ieldwU1DDuOe4SlNTpZ4LKSBHomXUJLZiuQI96SJ39I1VYu7Smpz6tJdup1bnTlNFx5Lg5v3M/KqZMj2somkHMIW3j61raoIktYD0XzajKE7dJaS1SqTvKNPzslfKKdh2j7NP8jGTX/Czxml/A347BzdfrIVGVrRQX0jg1C8Bsd/a2H+pTmNUcddweIUl+UjqMLfOoyUUs2efo7aGVweQescoAatTedqNFFsoZqNGIMz54Oa5r1zxClLxwMwwuVIUGQYPuYmMSBkYsE402SFWBQBeT2SWotN9qWl8O1ghPXt8iKE4YB0ucrZegqILSceah1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(9786002)(9746002)(6916009)(2906002)(54906003)(83380400001)(316002)(4744005)(478600001)(53546011)(1076003)(966005)(86362001)(4326008)(5660300002)(33656002)(8936002)(38100700002)(26005)(186003)(8676002)(426003)(2616005)(66946007)(66476007)(66556008)(7416002)(107886003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K+c1gTZirpRKGFz17iZUNlD4+0te1eYpAFBi+DkjMugS5g//t7GlH7bl3iZh?=
 =?us-ascii?Q?0GLufaQnZdDMMhqLsdyQ4SQUfc2//5/bMoSXS0y99vptQKKPJy6wOEBHdBxX?=
 =?us-ascii?Q?tRzaN0PxwgAlEcvO2I8rPfDDQkCLCvOsl2hmgZO/MaWa4TB51HLRx3r7sE32?=
 =?us-ascii?Q?oVYJhKm3NHJlg+Fe0vup6yb30u+KVcZp6ug7UF7X3XQAw2AkSaEWgmFfiSV5?=
 =?us-ascii?Q?KiuS8RlNTbAbzsJUWtzSyuGToejyVyny51DXgQT5NkgfWCPnoA6Xk+M38OKL?=
 =?us-ascii?Q?P6oIdFIlPOfVxzlDRxoZZKz9ykOH6KPtizmmEUzhcsoMOB+TZuPKRufl3PXZ?=
 =?us-ascii?Q?LqaxuYXTfVkL7j5hD7KbxcfSXiU3i1vB23IESsWS1yg858435lN/1KAyEZdy?=
 =?us-ascii?Q?n3Retc0fyaN0F1bgvLPLuiLpCqDBh2gEvd7/FBh4P96rJ//SC0WVnP7XJKpo?=
 =?us-ascii?Q?wAw7Wu3niHi5Pd3D2rIf15jpX5lIqMrM5MwL56ryzfrETuw/3WxYO58DLJQt?=
 =?us-ascii?Q?zRR0ktVAXfpkNzV9cr4s1fD1h6AGDJ1/Yn2m0yJKMRErgoMKExBH1VB8F6YV?=
 =?us-ascii?Q?TAUFJgcd4ClroSGIR5buY1AoNCbM9aUvjNZucqBECXMDvCrcilvFgYo/jV+G?=
 =?us-ascii?Q?4vPgwGhmeRNkHGq1mbG1cnh95bS5DwcVwUQ6MP1kUYtKakOyqSQC0+713Qay?=
 =?us-ascii?Q?AaOvhrsyk/R+Y50KIEC33pFfFiSUvX/EkgTIgG71S9nlh6gxTdktzcdU9qLt?=
 =?us-ascii?Q?sFa3ojvQI8jHihH+SVY/bd7LHmOORD53Us/KTvdP6JDY91idicmqCsWrdQwd?=
 =?us-ascii?Q?lfHzRk1VLVROTBzZnPFDLCL/9vTdf/asUVjh9aLkSYJUjXRabYf/SLWqrWPN?=
 =?us-ascii?Q?+UjEoTs7SjhB1F8C3rqbHFbjoKkk92kOY3L30FV8aQHPeBB8jfF+MkbOt0PL?=
 =?us-ascii?Q?SaKuCY1crXYXjUqFsNErpLBP4J6p1h8PMXfL4NRwS/B9WLL73iuWZAGtOby2?=
 =?us-ascii?Q?hzebacFywAyxpBKy9WmFsEEqJhEkfRhnv3AAqPbHGehHYJrWtFBJkxIbnlbd?=
 =?us-ascii?Q?4YkkqdsUuKx78MvRFkfp7L/eMGJcQzdabDO1+KkLwI2I7B+sOqVTSdStXaNi?=
 =?us-ascii?Q?Vj1W0bkMGh51+RW0eLA5HmupVu0TkNPpLvoA5wSc2C+11rArUqoHyx1lDmg6?=
 =?us-ascii?Q?b8LVxXic2Z2P8pMiQLukI+UWoT+4zpyJ+jmwboGjxQEgtGFiZeBx3whFmiGV?=
 =?us-ascii?Q?abKX1DQXAM8JLjIK/6YkcdC0JgsdJyMx7IR1D64kGRHKmmY2eyovaAL9kONC?=
 =?us-ascii?Q?NHqJ2F/X5PowcCbFzx/olzZ0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643223fd-6ee4-43d7-d910-08d908dab76b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 17:42:52.6335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1UJ6d9ED5d/4ypkDciRvbkjWOPba1/Dnx2Vu+ZZZcuU6gjaqkJnce1rcWPRgGek
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 06:43:14PM +0200, Christian Borntraeger wrote:
> On 24.04.21 01:02, Jason Gunthorpe wrote:
> > Prologue
> > ========
> > 
> > This is series #3 in part of a larger work that arose from the minor
> > remark that the mdev_parent_ops indirection shim is useless and
> > complicates things.
> > 
> > It applies on top of Alex's current tree and requires the prior two
> > series.
> 
> Do you have a tree somewhere?

[..]
> > A preview of the future series's is here:
> >    https://github.com/jgunthorpe/linux/pull/3/commits

Has everything, you'll want to go to:
  cover-letter: Remove vfio_mdev.c, mdev_parent_ops and more

As there are additional WIPs in that tree.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
