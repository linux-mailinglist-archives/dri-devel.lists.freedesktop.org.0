Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D15517430
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7A610EDF1;
	Mon,  2 May 2022 16:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D5E10ED31;
 Mon,  2 May 2022 16:22:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3hRw9fhEP7fu9qW3vp/YOyrd5nADwZNYFviPHjhE6hxI/JItQ+/fTa3RNeegiljfI8oDJLWDW16Fxiv2ACB+b2hjzGnqacuEKXkxvZaePCh+PGWLLAyHZJiwkM63t6u3BjSjY/SuoRuciJbm2HY4eVXpI4ZiEzqAj6kDYGi2/yAVPZhpN3rabRrVcf5jtFkIk0dKkV3xgVxcCKKoV+0IkHNhslpEfbe3PO9apbN2d2t4Vc0gb0sKs2wl0/9k488xl6DpWxoqI7/pc/VIx17drpemC0A5ATBZI2qiKZsO2ZaS1cz75EcizLSlCg6KkJ71SgLAlIz7WiIUVmjuWb2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1FqS86lV6wC9xGaMtJX1UuHTZtydUY4mJK3cOUwIqM=;
 b=G/RgCxpY+m6TC3geg2YvuNnrnMTrIXYO1CyZVq1IAyCYt4bwOuuleUMF2dUKfW8vxGP+yj6hx/wf8PIONZ8nn3BW25Ku0VUWs/U71VGntdGXByecjd9zX8dcMTw7N9wJxmlDvmIVaGr69gLIUAI3IB3Ro6bVE7Nlx7az2MxlrgeyKkBqinJOZqvoQQkh8D/Cf6TbxqlfTLLW80kO55ivKyDlLwhQxx35blN6vhhwK5gul/qDQmYrNmFlo+XuD3VOMAwS+T1DN/jcTvW9Ozpit4BzDieKYI/1r92YfTk9SCoGj4Di9/R3bUwVI5tkK4/YlVA03SBSxBsELThk8l3CSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1FqS86lV6wC9xGaMtJX1UuHTZtydUY4mJK3cOUwIqM=;
 b=NaMOYnekRXeNmqZICda/3kRi5fB3nxQgla7MdeLO0g4f/Jo0bSL8AtAjVi4GDxdr0LfqTzokL5p+D6ionpbaeCoia7s8WEfOPobJzaW35pnA85/CxDPqkc2UOQjbgrGV6wXVxEgWzhFB8zf98DeeNESfSNPRBPMwTCCHO5s9YFOFOWU28sWJAScCGnyNhqfRKMMGyGxU78NrfIXZx3EhnbgjDgJn+cs1h61Wmc2/Fp06/L9PBEyRlG6kWqMjoUiQ060Ppb+kjyXgynd1QahY8zVcV2Nv3AiSJ+PosUreVjT8z0pt4zAmkU2ejdow2SKr2Rar0NDx3EW5CHTwOEhNGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB4831.namprd12.prod.outlook.com (2603:10b6:208:1b9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 2 May
 2022 16:22:08 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 16:22:08 +0000
Date: Mon, 2 May 2022 13:22:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 7/7] vfio: Remove calls to
 vfio_group_add_container_user()
Message-ID: <20220502162206.GA439065@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <20220429142820.6afe7bbe.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429142820.6afe7bbe.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR16CA0017.namprd16.prod.outlook.com
 (2603:10b6:208:134::30) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e24affbf-ad42-4320-23eb-08da2c57e717
X-MS-TrafficTypeDiagnostic: MN2PR12MB4831:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB483171091609438BF527C94FC2C19@MN2PR12MB4831.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iKknk6/agnHhZ3g5mT4jvLq968oMZXfi9Ta1xl0soQ1kcPN+Z7gVxZ+x6CU8K97WH0DJxzUwwPpMu1d8Db1Zig1FGxtMsX7YKCcKUTzHg8ouuGHKKVIHY8Eo82b087ZBbkGzmkN6b3DFjmbOxPxWqr8yD5lOeze+Hsytf064Wo/KTCDGtciCqAjJpkFsw5aE1lLqbGjUOKQhcGWe6Zv+u7ddTEL1h1DYOY4vg4V2kPVHgHhvk7jnwdZJzKoopxPrxWaU6BlkFaJWHmLX7L8VA0FGo2zmQwkYXOtHHV+kQJYhDBBOf8mV0PHotnPTMKJ/U6bEjIwTOPrjHO3r0F/mGn0gKB50l/HuElOr0KEmmvFofo4mjzwHSFuNw4SxooALcaScqozpzJ/54ULn3kOdY9I7jY3PCtfBtrlQcVbERm9bLK3x5r0Zrk23vUmxG3EvE+VI7hIjtVQJX84lQ7ecT012RJcwjxlLvlvwKsYcDDDte07ZEtMV1KNUnKXY+YTfXU/rO9ZQx+Vy6zodGDJjzCmrmVQmbfulIrT/XriwZtKcmXGKeKBDPSRKLvWZsEDOaujnLbUqKCq9gRs5gZMLD779h9vTX2euZ2glmEN7hUUgxq+6v7ZjV9dubCfx1zIcGROLI9NWALqqNz2npLQS8Vtp0grG1Xf0HdYy4Wwrqz+ZW6mY6QRkMZsJKGhlv5frH0tKKbaUhZ/FNJDO6B9RHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(186003)(2616005)(1076003)(2906002)(36756003)(26005)(6512007)(8936002)(7416002)(7406005)(6506007)(5660300002)(508600001)(66946007)(66476007)(66556008)(4326008)(33656002)(86362001)(8676002)(6916009)(316002)(54906003)(38100700002)(6486002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/J/PRIdLivh2byLEaDC1AIzcXLJCETqfg4hOYPfwtdWCJb/gEMYHE7e/WVzg?=
 =?us-ascii?Q?dEOL2kRH09ZMYZGqo1si+ftF33sEFyOyY7N0yEsXiDhF5VvHlxJPlAuxZfiS?=
 =?us-ascii?Q?mbmWRsxbcKapxjL6DqrQRpNSCnLB0TlmIBBaI8mC1OvR36w49pPaErkcMHfN?=
 =?us-ascii?Q?wZJmbgNiH/rJUDfQLBX4kTUuE+krGbHbWD8GDS4pkP1UjGI+o9a46VlqYmdt?=
 =?us-ascii?Q?/Q2uGqZe6csEnICFLJd8/3AQKy9mpLiZtpd9eU3Pdj2Oc7UBgfnvtyiVP003?=
 =?us-ascii?Q?2+N9r5rkl3sW2lQB0zcC0bYyeOO5oF0aOUruu4mCdU01ky5iq2sgHM78OiFv?=
 =?us-ascii?Q?K2HsDEZQ3bNlj2agFkxjA7t/X0GpuAZqqf8QaDYkHk5UO3Hf1Jw8wCuNuY1C?=
 =?us-ascii?Q?kXqcpsn+5JCrVOcIsXFMwcSvJ55US9MmvzJg92W6EwmGL8wHubCqkE28KdMp?=
 =?us-ascii?Q?ya38zBSts2yWhgt3AGemtKKG+GjA2fTVy1tAX7PQRcFidjj56c2BXOklvECZ?=
 =?us-ascii?Q?gXHWti0RO3B2Fw+OQLg5ZMoHQ6pw7ygsjXUhSTNaFBTHyA35kEsSHJ0tkWDd?=
 =?us-ascii?Q?t1NJtEiLDA73+LoEWUvRVB4e4JDZIdr3o2J5OAUr9dXhA6wyJm9w2G7omgE+?=
 =?us-ascii?Q?FpLPY7c844B1KVPML1snIh7JiJiP+9ef7QTut7GLAFD/9pItdCzBFUGE6+8g?=
 =?us-ascii?Q?IoqUQIB7cqiUeWXmbRqVOoVJkhoZZjjfDtacXEwnlIg4XShJLJu19MBLhikN?=
 =?us-ascii?Q?2DiLjGVd6jMYIPw/NYn4eiYqmSJqCvCy/yMMT44+CugBfhgi2judLAOCdvpx?=
 =?us-ascii?Q?dfV2CCTuHRilKyH6SxCxHluD8WdA5LHkQL4/NrUtIL+IjasKFklDPB7oj/6F?=
 =?us-ascii?Q?RqGxCH4rULTl93JxvHO2/exiKnhOSNUPDY0EzIViZ4SQ2bwMk6B71rwyNj6D?=
 =?us-ascii?Q?9hFlPrmZ5IG17XX6E5Lz+Kzu9YLsEPY7gcd06q+PNSqZj5iofI30h8maM4ya?=
 =?us-ascii?Q?uShqbUYpXdR+pE/TDrjhWMZU7zXrUWnlle3yXQDFeTNnq/Bf4FZ/zdXmFMbh?=
 =?us-ascii?Q?sHn5ntTNDRxnGHqmfaKb7YLN6sdHRdXYs/kk/hLVxkYEv1M8vT/IJAhmpUcg?=
 =?us-ascii?Q?bwU469qI+2m2/utYBYqD5LDkrq712jEWl/amHfO98QWNdu8jnsGVjPaY3ebR?=
 =?us-ascii?Q?hokJYOEt72DMTkAzSXcqmN0xgZOnO+XganlyMQQ0NhIf7uNqkqiswGXsidNh?=
 =?us-ascii?Q?SaHY7zIWaL9HX6A6aOClE9dkHGINmbZuUy01OPvv9bIl5DtLSEZCR5aAE00t?=
 =?us-ascii?Q?UI4ySFx4ir8ovXRANi5vScTFM3594HaiyIzvm0XZSLQn+xdIJkUvvUlgZROX?=
 =?us-ascii?Q?ktwxJpKy+OByb6dcIuX9HFUCEFmYDC0IJKEeSjbidayQo1FqdUU5iEa6VAtI?=
 =?us-ascii?Q?q0PPukhEGfDNNckWxiUd5oU0b4nFRiyyB1k14lhqsAjKzr9F5NRSOXVCoDzg?=
 =?us-ascii?Q?Mf+oSMqwewmLfECGQBJzyMlC/Pej7F3QqYury2M+ZwmAcTjGKUrN/yUpyQnS?=
 =?us-ascii?Q?X56AGh9sp07UWZK/0yVmbCGIfm3Nse0Jbqjhh3cUKmc4iHdw4BVMtcEAhvdv?=
 =?us-ascii?Q?s1kM7rA/vcjLSAN/KQeLRrSiwGT5LeVCHn51/0dLZyamVbSLca7YVjeLoa1I?=
 =?us-ascii?Q?5B8ZTgRSrGOnTJ49BzLFEKEYcycPYIQZYdsN5tzFV8LBt53mp2zrMo94bD56?=
 =?us-ascii?Q?5qkh6PLPhA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24affbf-ad42-4320-23eb-08da2c57e717
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 16:22:08.0457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48VJowsjFYyFFQCafcNgN2X795LNXGTYUygKbG4gPMDzUijXyH++m3NQ6n5aLI3T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4831
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
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Liu, Yi L" <yi.l.liu@intel.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 02:28:20PM -0600, Alex Williamson wrote:
> On Thu, 21 Apr 2022 13:28:38 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > When the open_device() op is called the container_users is incremented and
> > held incremented until close_device(). Thus, so long as drivers call
> > functions within their open_device()/close_device() region they do not
> > need to worry about the container_users.
> > 
> > These functions can all only be called between open_device() and
> > close_device():
> > 
> >   vfio_pin_pages()
> >   vfio_unpin_pages()
> >   vfio_dma_rw()
> >   vfio_register_notifier()
> >   vfio_unregister_notifier()
> > 
> > Eliminate the calls to vfio_group_add_container_user() and add
> > vfio_assert_device_open() to detect driver mis-use.
> 
> A comment here explaining that decrementing open_count is pushed until
> after close_device to support this feature would help to explain the
> somewhat subtle change in vfio_group_get_device_fd().

I changed it like this:

Eliminate the calls to vfio_group_add_container_user() and add
vfio_assert_device_open() to detect driver mis-use. This causes the
close_device() op to check device->open_count so always leave it elevated
while calling the op.

Thanks,
Jason
