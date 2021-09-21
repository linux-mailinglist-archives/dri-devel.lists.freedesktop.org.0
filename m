Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACBE4133F2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 15:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED546E981;
	Tue, 21 Sep 2021 13:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11hn2226.outbound.protection.outlook.com [52.100.172.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B44489C85;
 Tue, 21 Sep 2021 13:19:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4Jo6PsZZuSa55LhS5vJ5tkAaccmSCMIBo+4eMR9edGMnIMwNXuafqGTEPjXb2jd5JweQ+ap+I+hY83sP3XGX+Zb0DQs/pl5XuNSX+CmGNGs7S1DnguZ5Qm7Puil+oGGByN83JVbvSYFsbTm4wnGd10ACof+/DcISQeRrveIZShQlAl3mdTXS0ArTBqz9hwDf0Z2hrf7oGqRDb6Bw7N4czUf5tZjdenfVoWOXPb6o92DDjyHULkV4Jy/S17aht+lEbR3GZghF4yD85COzMjEUxCvOvScD1/kLn4XV6YwRlaTMtEim9N2Zs5Rq/SA2/8w25E5yusABm4MclSfScEM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=94Wdtz1P7371BO9JoG/h7kHcocoe9ZpMfQ2pCiWwlgg=;
 b=oI1SvlrBb2ahyihfWAD2cvNbUtti+aKXR8PNkqW7ubV5vCLGU8JyK7ST+Y49rjPA+41kKvTT9UZWf0puaj2qejwfAJeYl2QWR/D7IatLRtw3mJRSSCJCXARFDwV2HNWD/hM//2UwugecBmsTY66qTi/jBpn9G3foJt3WQYbinCChltM4rf+wGb8UFUStTHKOW3xeeh6RO2XWfq4kWTynk5XeAWhHfvuoReULXnQdvRr0V1cjoXe8dynSBvTANbEOB3BnreSFt5w85NMyeePpHdI0cdAjWtJ7C5Asec1zgntNRt+kMRuaeAG4msxwMPBi+0sYkMURK2fh9Mtq99naPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94Wdtz1P7371BO9JoG/h7kHcocoe9ZpMfQ2pCiWwlgg=;
 b=OI0NY3eczvHXpyr4B6M3/luDLf7OK3iOBC/OUH2aMypDHOOinuKP/k1PmSt8XPeRybTTbmko7rloxhdI4zilwFFzR197d0oaqeUkGmuwv/8Kw5WdeCZ4TVghZS/tnVYYGCpweengXUS8gMbNTLAYAZAr77kLHedsqjCJ/b7gNSuHfiSVJwMwIZlgvuJTcgH/opCJV1cdlvoqVYGbRitfpzBCj/WDy5KtRr5DBlgr9KuIAdw58nPOGUhlMU0fb6Ewa1miymXh4FWk1h1rw8hKNhRQEIwGI8TeV9HE+jHLrsFk5mRUnuPtjRDDbjmxnEySguV18j0cYHSXN2NL1YfQZg==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5336.namprd12.prod.outlook.com (2603:10b6:208:314::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 13:19:10 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 13:19:09 +0000
Date: Tue, 21 Sep 2021 10:19:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
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
Subject: Re: [PATCH v2 6/9] vfio/mdev: Add mdev available instance checking
 to the core
Message-ID: <20210921131908.GK327412@nvidia.com>
References: <6-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <87tuiff7m2.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuiff7m2.fsf@redhat.com>
X-ClientProxiedBy: MN2PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:208:15e::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR17CA0009.namprd17.prod.outlook.com (2603:10b6:208:15e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 13:19:09 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mSffw-003Kbx-LZ; Tue, 21 Sep 2021 10:19:08 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 377f0363-5917-479c-8236-08d97d026576
X-MS-TrafficTypeDiagnostic: BL1PR12MB5336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5336BE1F0CDC1310B37D6C11C2A19@BL1PR12MB5336.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pf6gzM7XhP3b+WfteTXY5QtMZlaWU/fnDfnm2hNovolJjrjhn2k7PV4I7yMv?=
 =?us-ascii?Q?yUlfayAV+cM+jNOOkOUkS6w4vQFRv0YcEkCHl8hBOw7bnj/00qRlWeKR+9lO?=
 =?us-ascii?Q?dS3x8CwwQM0fGGJ+tqhrBisnnv6XpbeEv4iVjKpsXowJzavTQJDQ1saxBzWx?=
 =?us-ascii?Q?Q6liETo5u8blPya80i9G0KsjekWi/9Au5PtpH+FwX6onjr5eeuv+VzMxuMUI?=
 =?us-ascii?Q?9Kpq/SwfKW5Y2p6zihBvybOu3kPVAvp4Wk4Wio/ywJhP6C7SvPKrx66b6DFf?=
 =?us-ascii?Q?XTGD56QzLv70W3IgJL7dUIeP97DYyFcCrZh1mawhD/anuQW3TCJwGPTWJQyB?=
 =?us-ascii?Q?b1tFCS1VxrCbqXZiqBri6Dn0lGEyuUUi6IAVid8tDwR96MP/p8lvnnWDi+tW?=
 =?us-ascii?Q?cO0p7Qkt1OS+I2F7pNvSIARJ7wyoE5LGbnRZFNXJcOCpYCEeqWzD+KlAaF2c?=
 =?us-ascii?Q?7Fm1rEkaCKYG5Ogh7cCD/9c2pRKLYvwUOk5MKgwprJ8Ud/oMtRmiT48qpZZ2?=
 =?us-ascii?Q?c4IFEAwgDmfbV38gwFZ2yCykqaa0Aw/b6QD5tPF+8ldWji5G/2YEpn2B1drW?=
 =?us-ascii?Q?vzFDU/QocDwPMzsVVl0o+eKWqNAtJRv6NcyC11815dyOS3InapTJpP//njHa?=
 =?us-ascii?Q?P27aRv/bBfKaGcrEOrkxoHdHwUoQFdCCMLBHNlpupX7PoGtMWzmztaWI5Ra9?=
 =?us-ascii?Q?SOIHwMzPr+Nq9hIqX4m85/pl0z7uVuxTTpt7dWaztPNB32a+8bLe+j3RYT5N?=
 =?us-ascii?Q?oSbf01/IlgPhfv5dF+X/KspJzFREy8kN1BuNZBDdJhgdd+/i0OQFk0UtDEGH?=
 =?us-ascii?Q?RvVzv/6FXr+/eOmSOmW6MQ9UHCQVyGamOIQsYk514HKlI3Ep3671g0YqQEJ3?=
 =?us-ascii?Q?XRdpQn3VDZvdjP6uoWAhheaeVDQYSSXIYQDHsXe8lAPqO2NV/nslwWMhRVPS?=
 =?us-ascii?Q?fPZ16QoELp0yaqFjPfwhObt12NMGgmTiFsX0itHmeTjaNm4ZHiR8dJBng6KT?=
 =?us-ascii?Q?O6gX36okDzlr9Mi2ro5jTOes35wvcQermwb3vwF7NDFC2EY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(366004)(33656002)(9786002)(9746002)(5660300002)(38100700002)(8676002)(8936002)(4326008)(26005)(7416002)(66476007)(86362001)(66556008)(186003)(66946007)(508600001)(54906003)(2906002)(6916009)(2616005)(83380400001)(36756003)(1076003)(316002)(426003)(27376004)(131093003);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u/FSAdOJ8fM6QbvbhBc/zuGgqWfd8KSeKZdkf0zFIBxAZgXa/M6HXdKqhGX5?=
 =?us-ascii?Q?VX+YNa5zy1A5MUlSJ/dt4XAFSBDt1btP4rt9Sgxj7EV+0gDI0Vnnx54jJKPB?=
 =?us-ascii?Q?SGnQ+Dwvtz2B08gUQC0bEr/N6mu6H3dcMWtevFB+v9cneg3fbFoSV/GGEjiD?=
 =?us-ascii?Q?5UcvWgPzkc9MYCI1kkUf+BMPb7Q1q8BFbtvWI4rzJCaIThRzh/RyaKKrVdNy?=
 =?us-ascii?Q?3Rcb0xEo5NfBaTeI5aPqDIPVIBCpNmRQvqVxY4tHdHD/QbOKO4IW4zHIjGgc?=
 =?us-ascii?Q?MZ/bqVsZowNaotgitEATVkGRUQrDtLFNlXpWez7u6vSNMjqtbaPyauP2V9kH?=
 =?us-ascii?Q?C8rxPndSwwILH0fw/TwzQWFCqyfEGRApO9tBi7tqqO6qQ33ek30AtIj0/tcx?=
 =?us-ascii?Q?UMsR2Qlt+Uz4I27YwxLvM9tgTX9QCikDPvrA7h7ZWUFUhO3bc3zacvs7xJuK?=
 =?us-ascii?Q?VOMqawQRqdaO9wT3BXyNeLschu42YoXqXmQ7xztB4bPKhbohowhXIyETdgGQ?=
 =?us-ascii?Q?jrVb0UzrjC0zL+ZZbfu1KoJLWx6idU1RH5yDQR3fxfT7TPgSEtqraQGfO0DM?=
 =?us-ascii?Q?jrQVKCrj7fFtahJXr+odW0uE+QT8zZ1ahAr+CxoKKEvXjDo8DSg6ca1G1Hrc?=
 =?us-ascii?Q?mZT4UIrBoktdSzKu4AicZAz2kq06s1sA6ie572Dw9/1DBXizfjTueMuUMS6z?=
 =?us-ascii?Q?zxhT+v1dWZbHRdq7ToxmwjCd6sck3Pln0JonPEiCry9wE7SSn0q1TzZZUtih?=
 =?us-ascii?Q?mfjjMVibCTx2EytwpsROxA1qe1OTMHvIK/3myH52Yd05/mOtUIRHXs3Y0hPU?=
 =?us-ascii?Q?ce8Mvc3obdD6zdufHso7k+srexFUcR1d+nqvNNCOlGQgPI9htudP08cDAB21?=
 =?us-ascii?Q?VA+FyXtQiX3SLy4tz0H3YtWAv5WrlYDZz6Ak2/k8y5e2ZUpSILyiLeQQVOxM?=
 =?us-ascii?Q?9eJ986thUHBLH5JvmmbG4Kx608KWzAqq2Rx/LKqfwKHxS0xhPK4TztO1MO6O?=
 =?us-ascii?Q?vkb6WhlvRlvWs1tdT+Q03jhXvQOntivM6EZJG6QrE4tFFjLlEpzTix6gOa87?=
 =?us-ascii?Q?C1l5iwesIwC5VxhN2tPFBBbXXiJs91e3ZWlKyW1luQ9X7Wpezp+4aUiBeuMn?=
 =?us-ascii?Q?492Y1JKAr1NoqPjdceCCjCSFSMtkN30U2qDfJ1CmZOjU9gsktfw7xQg6EPnN?=
 =?us-ascii?Q?MpUxw/9xbHzvH6Im3ALM/F77k4uPuWYVWbaFnLwhIG+rFXKw6y+nvM23J3VE?=
 =?us-ascii?Q?K05U8EJ4QEj8UPsc8k6B3UW0XjYy+meTbQRees2NssZdlqx3vGb0tptzw4ct?=
 =?us-ascii?Q?7XVdKvUKdXzLh+KQFOEMkjkn38MnBzGbmQuI3mG2EgLS9Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377f0363-5917-479c-8236-08d97d026576
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 13:19:09.8603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSXci/sgOsyBy993lndKI8yPYwidWvkowVgIRUoTmphFHM09gQgw+3NTLDwj78RD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5336
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

On Mon, Sep 20, 2021 at 08:02:29PM +0200, Cornelia Huck wrote:
> On Thu, Sep 09 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > Many of the mdev drivers use a simple counter for keeping track of the
> > available instances. Move this code to the core code and store the counter
> > in the mdev_type. Implement it using correct locking, fixing mdpy.
> >
> > Drivers provide a get_available() callback to set the number of available
> > instances for their mtypes which is fixed at registration time. The core
> > provides a standard sysfs attribute to return the available_instances.
> 
> So, according to the documentation, available_instances is
> mandatory. This means that drivers either need to provide get_available
> or implement their own version of the attribute. I think we want to
> update vfio-mediated-device.rst as well?

I added this, and something similar for the device_api patch too, thanks

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 9f26079cacae35..0a130d76b33a48 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -106,6 +106,7 @@ structure to represent a mediated device's driver::
 	     int  (*probe)  (struct mdev_device *dev);
 	     void (*remove) (struct mdev_device *dev);
 	     struct device_driver    driver;
+	     unsigned int (*get_available)(struct mdev_type *mtype);
      };
 
 A mediated bus driver for mdev should use this structure in the function calls
@@ -230,7 +231,8 @@ Directories and files under the sysfs for Each Physical Device
 * available_instances
 
   This attribute should show the number of devices of type <type-id> that can be
-  created.
+  created. Drivers can supply a get_availble() function pointer to have the core
+  code create and maintain this sysfs automatically.
 
 * [device]
 
