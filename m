Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2055B502964
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 14:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0CF10E5EE;
	Fri, 15 Apr 2022 12:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D8F10E5A8;
 Fri, 15 Apr 2022 12:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNds5GGHooO48lwWVTWIVybyc8F/WCR7/iO04yNmkjRH2chdzm/rq4OILcL8uJZ5PNtzZqdV7PIwvnSYOdYmWfVYQ/lg049kwKimlL2G7nv+lgHpTXNjLtJuPtQ21L4O039mC2l4XoVN8lknNyXg9MUc7VZ0w1cHEuYK9AjYy0w9M1MaYjtuupQ9wypoa5u58EZiZrgndjPKe6rm9Dk76qudOg7IVrDuGl9l5QmTrHwmCVq2OknorY4tAEZWeX6/kdH7GZqsuJW8n12cc3S0DPwfiETBNhgCwo5DvlJIGXOwbFRrlw6pxstKeR886UIZc61SjOLlLDziEGDH0RQ5Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zy0gxiC+qm0NUBlq33tjhdy1MSNvnPo7hBNf5CVVvRw=;
 b=cwOgyhABO2+ZwJQ+2QqPRdzbUsZ6De6SaPTlDu0YhO4CPEHw6XX0TA6zz4PcNQXqGVzQFYQqkzp3QFCeYXV/oluRlLJreiayg8hsT7jTM6peuM+KfHqBDMbaSlNc7230tqNGhf4+qkWI8LFuE5KkQT2asowzB3uQ4ZPZy7cFgdUe4yxIaLk2UO5pRDLZmSWSestKlqJi+fYSTfLs2Xl5GJykXpAv9w9FBGBmR+/j0f/CLpGhOIHcJYDbfgZVcdvbR4E10eLKw/uPmhA424kF/MAmwOxSlFK/P8MSCzPnMIEKELf2/1p32RtZtzbZiz+dJPtWScgG1P1sV9hT5/0Gmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy0gxiC+qm0NUBlq33tjhdy1MSNvnPo7hBNf5CVVvRw=;
 b=BCWNPbdO0B1OTkuVKj1wWIWUPCW1jUoyMIRtkniPm0zkt8BHDMZcM/N9SAtl8MqsZJDhJXhN7qEk/CnrsU5IRmQ0qCAZgQIoqU+YwS4/Ho+lBPfsH52qivEBtCaj+f0Z+ziCVWkxIxcT922XRkjluR2nuWqvcV9czYrf3mEFGYAltKF5xbiLRytUL+G3lfK/3y46/yrMtyZOOhh4dFRaIzmJOTiYtcrB+mnNj3raIG7b1fDUoDCkQ/DWnM9Yc7AXPPDRZDIoMIBt8a+380wxEnm+3f+gDHAx/W/CPwGkxFlDGeN8VLGGF8UEZpAM36UdRMS/ONbmYFqUtuocdTUrPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR1201MB0261.namprd12.prod.outlook.com (2603:10b6:910:1c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 12:07:29 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 12:07:29 +0000
Date: Fri, 15 Apr 2022 09:07:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 9/9] vfio: Remove calls to vfio_group_add_container_user()
Message-ID: <20220415120728.GG2120790@nvidia.com>
References: <9-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <d6e2778a-01e4-6468-2c2b-3b718d924e65@linux.ibm.com>
 <20220414142210.GE2120790@nvidia.com>
 <BN9PR11MB527672B82DCFAD2C9B28E8CC8CEE9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527672B82DCFAD2C9B28E8CC8CEE9@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0267.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::32) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c28701ca-0c8f-4491-33f9-08da1ed8836c
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0261:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB026113F221088D4ECC54CBB0C2EE9@CY4PR1201MB0261.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j8sNb3nRn2ZLNua0gdG+/P6UkHcWfQhL+aXF4pBAZBvqN3GjIHnT1EtSIPyExtYmS+tgmXbCdPAuzzKjC+V3Iwdd1Zc9sOgKMZKWuCgjpdEBZJwVy+GBrmgb+OiJQ+64RurQ8mtGGxfKoUETtlM5/Olm+t3NjiuOnyNzvwIMw28VlEQskiPZ8kztmvyh5qlcfS7aCkQ/TCtOIK0PLKZG7TfHcknTcJwj4wa5xGf51yKaVfGzsH20YBJHM3DEZZlYB8VBu6hQQPus9SvFIVx8voRmvYt1relg3n0ewaXPJXs0TzxNJtG9oPq0KKgRI1dZuByByQooWscASs6VjtF3Xfkq5eTxBl01L1ttE9nqNWIxXgMRiRadiR4i70kfpI60hFSGaxB6N3gGQQqu6ieWsGCQA5ugyRHPa5cSPUSCSmwqw34KH2ADzsA+yZVlZ6lOpRgiIYwummDZzuDcvK3gHa6JtM86rn034ZSzAuAs19WsmKevN5m8S3DNK1y4eek7gvPQPQZ/LDLTxvasuj7bXyjdpdoacJhZHd7oFHYf3d9TefgkWAh7WZV80yNj0ZXNs625+R9SW7x8u2O7ETNPTKsd5hOdSRp6+o1tas6RaZrSNKqtx4UJmG8PyBNx7y2jHB65P6LcfMbDoogPSI7Djg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(36756003)(38100700002)(6512007)(316002)(6506007)(1076003)(6486002)(54906003)(83380400001)(186003)(6916009)(2616005)(5660300002)(508600001)(8936002)(7416002)(2906002)(7406005)(4744005)(66946007)(33656002)(86362001)(4326008)(8676002)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oR79/YtZUftUkx5c6dkP/sYRzm/bWucq9XunZNQmC7nu0lVFp+08H/dEfv4V?=
 =?us-ascii?Q?XLCFZ/D0SkS6JQ0Snmr1QATLaG1ON1joSjZ9u3IkN5gz1ZlbqB6VbwrUssod?=
 =?us-ascii?Q?FeCTHel2177gXre3Cr9lX1N48tVdM5Wmm3PQFf/wGeGZ5uzmoA+j9zVsUpY5?=
 =?us-ascii?Q?adpMCIqfGrmQNI1FHgyHKUf+xKlxmF77q4THCVYsD702P9ldvjcIaJNus47y?=
 =?us-ascii?Q?GNKuGzxosJh+coSFilNkEwRYDRh1PILM9ERJDcnkhiEC+H1oUS27ztc/bj2T?=
 =?us-ascii?Q?v2jx4hRKLyd6wjF9rRHHRor7Yr5UI3LCr3SeY1iPm9cZNiVaeuKSAYL+bZ5A?=
 =?us-ascii?Q?2jbtZqFqkdcjdLRPiYakpJHaaNvIP9zW9nFkVs7YZ5TQT9QiwIfL43+JMFuT?=
 =?us-ascii?Q?k5yAg5KlwyYLAkCWQjRYmikFny2pu+3NeEUZEZOk5OMtQfd/womZ4yg6nZCD?=
 =?us-ascii?Q?fPSr2MA6QD4EZAtgWJsFbdOVGHIhWJtZoggoofgaE2x0HWcEYqX3AW+UTMlF?=
 =?us-ascii?Q?chW42nLUAlMq4w54O/y1Ap4bOR9mFInHgn0YGNelulhUloiJCLc62cd6LBGY?=
 =?us-ascii?Q?QfhBhMDHKDr11ej6Iss5sI43gswh/slXjaPNEVuqp6CAwXO6c8o6e0MIhFQP?=
 =?us-ascii?Q?kSA5HYu5bbeyBSWNugbUKW+/vk1+kSQTPaqqvcqOhE42WxHr/1V2pb9fRlJK?=
 =?us-ascii?Q?ks0czMF2LeMgKoIjSuasi2+ucUduBzDuwqqNuwb+ZwNNJLi3GZtPr7nqyo7p?=
 =?us-ascii?Q?2TcgjPtjeCCi8ExvvyoUHWubXhdL4A4n7YmSj7uCh3WdBrKWllg+SgTKKV7A?=
 =?us-ascii?Q?ltDAq/TthwCKIUKblwljxTt+bEYj3NBX5kJ5QYxcvrAUti3TmssEVm4XFgFv?=
 =?us-ascii?Q?Hm/Tl25YTvOz8HJsRv0mstkL1JA8cFBrJ/5D/JzzTT2lDJpdqWUsprGr7qHU?=
 =?us-ascii?Q?wz1SVA6h6pSXd4+k3Q9LKi3vV3hty9E/GGO/dWs4ZmYY2lQG9/BfWWlQxPsh?=
 =?us-ascii?Q?X18GRzd2vdwdwdHAwNr/KbNhX8lEhbAclDzPnxVdIFokY3g87PhENRUj+rDc?=
 =?us-ascii?Q?sw9QKNgAU9FkuDT/hM3W7Pr0a6BYHSZdokQ0KF6tmHlmt18rRyCxXQ4YuBkj?=
 =?us-ascii?Q?EA0Uc7rIIth8FuZRfO/Q8o5BWO2ZgCwuA9Xa1ZVmzFnK9Ja/FtiVB0qwTRIX?=
 =?us-ascii?Q?YJHvfWh8Jf1TKBy8mOXob6HTMKS+OoRmlLAZfJNvBtkO3LdjF0wtL+rXV7yR?=
 =?us-ascii?Q?irzs2seqGwvxQ2gx+wSZqf6o+ai4GL+NnkyUZ7s+QYmXaAfZyPP9P+f7shDl?=
 =?us-ascii?Q?JBFn/dw1ogAKJLcs1CmnK/CAuWE+B1SLwzGpD9Ujbx1XDHUmaDMhuDCqNAsE?=
 =?us-ascii?Q?X5ELeN+SR0aSFTH5QBsaQ8+6l+/loEhIB8rGEQqagkLu/2J+PVxvDLX+gTFc?=
 =?us-ascii?Q?Evt0lL0DTmUB+43kTrHyyPKvOpedjZ+evneVc9jFnmWDZHgqW5COyDshZUzz?=
 =?us-ascii?Q?EDMEa0mEamBX41ifzxaPXCOHyuM+NrnxTP1yqX0V2KanGkMaufMxDWbkwGsD?=
 =?us-ascii?Q?ciNcTneFCq0VfAbqgCwFXoSn2KsADMEMAWUu7DNEdX21oBmsYHrsa+7ALFga?=
 =?us-ascii?Q?3Jh0OYp5WVrg2/SIGDQjiiW7jO8wTjLlXe1pVlfwrXWDzwgws34ixZ9wetvW?=
 =?us-ascii?Q?9TRU75QsOjsMg3079iK8F6dvML/DMIrEzWp1/ws9pvv0KiQP36cLRKTN4WNn?=
 =?us-ascii?Q?t1nAXtCUHQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28701ca-0c8f-4491-33f9-08da1ed8836c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 12:07:29.5209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nq0uEIKtugRD33dBnx0ZYAmxnv/3tmdudf1hOWYpc3N8CGxrGGhoRjIxaqv3Jtmb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0261
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 15, 2022 at 02:32:08AM +0000, Tian, Kevin wrote:

> While it's a welcomed fix is it actually related to this series? The point
> of this patch is that those functions are called when container_users
> is non-zero. This is true even without this fix given container_users
> is decremented after calling device->ops->close_device().

It isn't, it is decremented before which causes it to be 0 when the
assertions are called.

Jason
