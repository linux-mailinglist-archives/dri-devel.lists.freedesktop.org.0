Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8950C0DA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 22:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62AB10E4CE;
	Fri, 22 Apr 2022 20:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5183410E101;
 Fri, 22 Apr 2022 20:55:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfcDuUQOxotsScJs+SekJFiSp4GfWATOtVBdoHzdBDcrsLL7OQ6JsibxBfFgIG5QmRgJysxjHX+sMMe5yQ4kgfpax7uAYtqweZa2pL/xnZflJIVjIuHWfa8iQ4Dxpvrung0NTSWnm9HvKu09wjf2NFEFbRq3QEFEFM1FyL8qzh7ZcOjmdbpDeY0jD4tM8UrzYN3/3HmAEAAfBIzsFRUidFzkQ4LtKSoUex/8JUCzP/Jk7bglk2IxW4zlt4CeuiDUlEwzTmpHRYZ/+pNgVD+FXIY5DS3S2TpQ7c1dofXC/HDL7l2h7AH7nMIkqdYedSsbk8Bgx5feQafZQSLkKjX4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7RI9TTBBoc6BMqIvSebm52iDYjg+o3XVin2RcV5APk=;
 b=WwVqHOKhYH6jUvmlzYFSONqG6V31clUxyTbHKUQKpecVRNRufUBowZowfwUIIpVyxVIYaC/C1MX0trOFmFijNjRJlJBQo9unOS2Lix5CeXDxAKLIZ1/3va3KkXNLz3rjCjutykiFOeZ8uLM6KE1V8DQCMMyMhuGs0pZJ65xsM51oYALH7cGtkzpHl9QXrjok6uyx+1hRdHdeeuky7wdy+u2a3vsCkPl++KqLuXjprfHBMkG4SlySCtW0mYfAkXpTVUgMPExT0wMCfy7wi1W/oXkBGJsK8KYaDRm81SnGwLCb0Zdx/A8swmrrjS+4shzdQgF8Mk7n05Ab/hUWEaV2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7RI9TTBBoc6BMqIvSebm52iDYjg+o3XVin2RcV5APk=;
 b=KF7sIuiHmPd82pf9VYt0BXvSsw/nOVLvxWG41+4MhhCaAmaJ4k3TTrvil2/cnoLX/1sXjotT6knGlK0kfaeCpyyftxaNWggHMBCjhO+YY9f5tNlEPm+jbtxztx74SHmRXxWiqFYRGp7vyEl1rpZ+kM08I/7UnsOxoBXoVtydXYRw7KCOjS3blPrHeeNF0aUlmP2WM3Hf9DUrxEWpbk+il0y+PT7GyvKVY9SxTZ46V7lJuSFrx8uGm5LVI2Jz1Ms8rRdBAbRVkN6qhhiYfOd00keQ3F1EGamxGTSODMnADj5/sJcM4sCUup7US00StkQVnrknAtseR8hPPYyTNeS4hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 20:55:35 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 20:55:35 +0000
Date: Fri, 22 Apr 2022 17:55:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 7/7] vfio: Remove calls to
 vfio_group_add_container_user()
Message-ID: <20220422205533.GE1951132@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <BN9PR11MB52760B405E5F68C2155492078CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52760B405E5F68C2155492078CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0260.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::25) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce308680-ba9e-4a80-38b3-08da24a2725b
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0058DE128BBDDE5E34A53F2DC2F79@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xIzCinhsX9fAqnpXIhCUcpCZY47yrbZGeTJGwmk4ligrRVT4F6wYBV8f3rNWeoC6grviEAqvM3ccZ1rCquFN/8qlGP7rb+NfOOSYIaZRFICBnb67ja8HzK+Ed3nKg70Z82r16N+4eDf74/C+ZMhlokHFSGg4kaLwc5AVNkUkYzmzzOWdRrHVff4Dfjn6k898Ori5Qljxz9qjFtUKlO/TcKK3tBB0+W0nQrrjx39rTch8+wAq6YGqnlpuU6NCAKFZVT+FeN1s4cEvusBKJIE5smdTQ0q+RTrW9aBEDBvyl0h0jig2zkpcittKV4tl0ltiQ2ZVZGrQKU6f88qam2RQkLLtt8vcM79UZgb0MQlCUXbL/t8/+QF/Og0wMMmVV/Wgnpl+zBI22MvVgq2rbXHa+/q5sykFEEZ1D0MYNj4u41ESPIBgOpWOZIuiPp4G+0WaaRxRyD9Lapr0VSQ83l3J4nBDccpcCFo7ZWN7jXjC0EUsArs7AhLwS6JSyBKIpSpDgZ6tNeByc4qLoezeQ7WaMdQFB4WmLG6d0gvsLoTRgXxVajXUYfNiMDfJpmw/LT5PBLmlvMwNxhwREw/3JSjIKHx7GLmPsKvMfBxhFsdHw8RCMvnVoy3toMqpmMOvr1+C7cEc1wuG3mRhoN6+Ayg9CQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(316002)(66476007)(66946007)(66556008)(5660300002)(6506007)(6512007)(7406005)(36756003)(54906003)(33656002)(6916009)(2906002)(86362001)(4744005)(8936002)(7416002)(4326008)(508600001)(83380400001)(2616005)(38100700002)(186003)(1076003)(26005)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PCavLKgy2twAB8kMyftQ2TnDpxa5oaPWpTb3jkKc7Q9Bcu1PVX6U4aQ+Tpz7?=
 =?us-ascii?Q?vebSmNZLO+tiEqg0PQmRDUgyYw+ThNODwwq0Krn9t/AIsuMgfqsaUlNIub3Z?=
 =?us-ascii?Q?USDSjCwcXzi8AVG0fNjwhgX9nv+RAifNU/ouG/eVvH4ov4hvjgyBWN4llSFv?=
 =?us-ascii?Q?euIawedO4oOJMUF/2mNo9gOPpuW3p0K08cmVvf7FSQiy0svWLuRT1Y9R3y6O?=
 =?us-ascii?Q?sRreuN/DWeKvtWcwURATYBnT8gsnLKfdej0rU0fH9WFq8dcpsHrXY8YKY8W5?=
 =?us-ascii?Q?04xVq8tyNi7DhCKwck+IwdhnmRCLebEsIgVncTNPtgqL2qDL1CFZ1ZVu5UwI?=
 =?us-ascii?Q?BDXjXSW+nqZp9t7z8mKN66DIZ53ebadXM6exWjWqIjlTBHHo7hsaQgo3qoCZ?=
 =?us-ascii?Q?uq1PhHptnJ8zaEs+k1HwFSLQf+UekvI81zQo2n88OK/VcM9geiw4uC9HhHLH?=
 =?us-ascii?Q?aBc4CBiE7X9QpmCU0SnYicMmRMDJKIlKtdrk79rFtIQ2u1CQJTj4JY44epXJ?=
 =?us-ascii?Q?kcM3V6dGiNV5KWcaQ1GPdjNfhr0NeVaMybx0Det5SZtjHaudctRf8x7bUYxx?=
 =?us-ascii?Q?fwJHICt75fvn9AMul1oeE+cMyin8xaSz/VpP6HBM2cRBP+o+bOvbB2vlMoVs?=
 =?us-ascii?Q?b+r24j9FXdrtOQ+Qv2A1OGK5nMdmOjm2cHrv804W2VDKB+ksca9WM5QqoZZb?=
 =?us-ascii?Q?Ypi2gfHRDsx5dgZw+N0nBMRD88HkQgu+3/542QMqOAWbqqKj2vlI/5mSJLy1?=
 =?us-ascii?Q?24D0K2DRROWwMIkQlEo+NUIKEgdYyU6TcfX1GO7p9HrJnKzWn1UZetD1stJc?=
 =?us-ascii?Q?42AgI7jbtKR8Jt0Jjn4pBxFiETdkPrgmvyARwc1YElhlxWoLnoyZTbMOeXR+?=
 =?us-ascii?Q?MvC7E84ibsR67qAdCoD+COSAJUFv2nwBEIn96YVgdnyM2/cWq+5T6VJAeEiN?=
 =?us-ascii?Q?QpbGE8cAZoh3r3jfen4PRh9tvWIC1pjEFYLIhZZZpGNdammtlncrI5Brhzta?=
 =?us-ascii?Q?mHnyv+ehuXraj3+sU7Kxm8LKqoX0MTTVtihPQLhun5VjKENQfmmOz7NBGzid?=
 =?us-ascii?Q?5xvWLfwKg8nTH6yy1ZLjUokKzm2GfQU4QUup71phzUZ0hS7B9sExYkrZ6Mxa?=
 =?us-ascii?Q?gXFMLiHVD2AyLqtssS1xU9hg+FGS3HYQRMiHHGppggA2ptOxGAhx7YcX8Y0a?=
 =?us-ascii?Q?LbpQzSdhiZrvkSNjqRs6zSxBrhpSBuzylD6Adx6IkxmfLIQnL+ZXmbZ+m5N3?=
 =?us-ascii?Q?iaai/78jMZu3C3xFxV+DXKf0hbArL3K36H2K/s/fdnzWEU1YvoNoAW8Pv9oF?=
 =?us-ascii?Q?/FEob8ElIm6Cq023SbTujX6kH471tzl9ljUsPqb9XH2Z5xp41pIDo7j/1gMY?=
 =?us-ascii?Q?6l4g3cEMWsnI4aZzGx3srVGc1My8E2z1dytjP+T1cCuQO61i6U0TkhH0QYUd?=
 =?us-ascii?Q?lkev5s9a1PSW+BLtMJcuVx0SWTcPhJ5yZRsdVu8YCmffm2JTL3EKys5WjNGh?=
 =?us-ascii?Q?khFG6vynnBmMjJm+XXztusw60cVeOUe5hqi9Xe+NsC8X8zTRr+YMnflPKyKZ?=
 =?us-ascii?Q?vZha2AzEz9/sDxf9G6MtYxoN56lEMfUEvdraSl1lzG/rYEoyyCgCSWpQSpwo?=
 =?us-ascii?Q?n9y9uV8H2zYQQVjz69IUsmABySiNuJ9/Gda7sgQGHquW7UY2JYw/1pgBUlx0?=
 =?us-ascii?Q?SXKsqqpQfBwt9PSz/+pyLPVPZEb72BXvuBR4XzHvmDLvsNeG+vy4HDKLQWJL?=
 =?us-ascii?Q?whBKXuqZ8A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce308680-ba9e-4a80-38b3-08da24a2725b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 20:55:35.0417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szKENFsBvwVUAMUF0UTLmZ5uYDScW1mRXPXXhmT3nQCM8bn3ir1znNTz7Xxc5x7z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 02:11:27AM +0000, Tian, Kevin wrote:

> >  	mutex_lock(&device->dev_set->lock);
> > -	if (!--device->open_count && device->ops->close_device)
> > +	vfio_assert_device_open(device);
> > +	if (device->open_count == 1 && device->ops->close_device)
> >  		device->ops->close_device(device);
> > +	device->open_count--;
> >  	mutex_unlock(&device->dev_set->lock);
> 
> Is it necessary to add assertion here? This is the only place to
> decrement the counter and no similar assertion in other release()/
> put() functions.

Necessary, no, but since we have it we may as well check it here. It
is common to check that refcounts don't underflow.

Jason
