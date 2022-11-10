Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4246624A7C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 20:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7126A10E7DB;
	Thu, 10 Nov 2022 19:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B43B10E118;
 Thu, 10 Nov 2022 19:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWzUGtpJgTF7wR04g9NYSt56Ylw3f6BP+g4rZK4p0xVtUJKsEgW/zNj+pyHKLXvuaRHuH4rDwQfa6qYhYM9uH3F2ND7mscZ6CLCzesnKRmwfVN3MDJHyoLLvvoLJosDNQ1KNzbfiyzIvxMjFVTjGtKOhIebUd2Gxc86eOa+oEuKSoM/bA3XFRAO3rQPcIpQfrNeZYkyl+CWFksWVF/FMvYGTQoPky1zW9QsRyAO70fBvVjvusEmfHoGu9/YNxXrRyVUgNZnyMR6NyoZKFe0YjC8WesO7t+lTIKhXzhETa9sioZQWeDxAiWgoKNy7J3WxRtcN5LqC8xE4/gMN7ftdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTBjqopfkP2iYv3rIuTb2Aw1BThon7runQkBpsK9mA0=;
 b=SvvWF+zG/a3NVSPw39ImlhRK0lsEGN6XlUr11GZnjF3098lMIq5Bzx+Vmnljob7z+6QLygkF0SouilnNqD+20VEGyjsVGcxGtmP/qR0wDr/QYJPLf0eLEotPQos7iMGh9tRzdRFITrGM7fnpn+TkC25fG+KFsiOW2VrtowJ/7WIWRlW7denjrleGG957lgoYbDBposhjHWzITj50pAvNwHdILfaO03q/8QwtgDFwdfitVLFj15pegxmjhNty333q5K2r/oqHHyXC/zjJiA5xnjg7wSRkRuKSFi1kazxJXNux6iZMKX6xoE20xkxAl087aB7s1wHaIDBtNBAT5kk3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTBjqopfkP2iYv3rIuTb2Aw1BThon7runQkBpsK9mA0=;
 b=Wh+FFSZh4gg1/VsEhaf+4fPwGA9POxfU4Yh9aPyu/FA+Nd1N76qk1Zn7epLyNK9GVaZhQhT8tSqTrlWl7S9mfR+eHwoj8xclm9ZqjtJ2gahIWJpPfevA0RTk1al4WtzcshduMmpKGlZzkwwJeMEOUibEltjNoqZYdlNDW+MqXeaHk4rS5Tqaa4Af8iJel35sRw+LHR5pn+/V8qZ2sU0QQ1uki270CbybUo/jD9hExHTxF1yI1uoGg4/4hA0oEQwxxVtW9DSjQ109YQ5snV2LZOtv5YhpZxmaMs8d6qVEuQF9fKmYCzkr6UNvnvLoZNTdtG7kz4EamrjmA7X7JMqOQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Thu, 10 Nov
 2022 19:19:09 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%7]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 19:19:09 +0000
Date: Thu, 10 Nov 2022 15:19:08 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <Y21OrMoVW/x84qkX@nvidia.com>
References: <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
 <20221107081853.18727337.alex.williamson@redhat.com>
 <Y2klGAUEUwpjWHw6@nvidia.com>
 <20221107110508.7f02abf4.alex.williamson@redhat.com>
 <Y2lSZwNT8f/RMoZf@nvidia.com>
 <20221108155520.4429c2e5.alex.williamson@redhat.com>
 <Y2r80RgytKpPtK58@nvidia.com>
 <20221109112822.7a8c5f7a.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109112822.7a8c5f7a.alex.williamson@redhat.com>
X-ClientProxiedBy: BLAPR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:208:32f::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 12268162-4f3d-416d-90f8-08dac3507141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RQQRDG37XMLx2c3C9YMUdn5HG0jmhWQgodFg+Sc7JCdMfJc8VT1yusnkYHjyrcOIdF9PzlgIZpZojC1KJiCzYTt8xroWx0XF8RST1O73gI//QwC0bRt/L3H3uHQXVaSh1DLaLp8/QQd+QXd43dGmyZjSUkwfLTqPwtnWXV0htdQpu85Qj6QALUcQee5jHgr9flr3Zc6+FSbqHtIf6CI2CbzsS4R+6oEHaLiFa15Ig5G1cFCtiBcJwBS1A8qSE79FuN7ZKkEKdsnnuio5C+UojqxsjTTV2SKb2ASsXDNo7K57RSi//uEA48zEoOAvMQICu59EVESgCtjl+2ctBm8zETyEDgiz58ySPgeJqWb4xjP+MrtGQgPp8Uv7hAeCzuQdAWunat/RGc7QKt2qhg2o7Kao67ekI2VnxkbgQv1NuZMVJHasVTfMStwEnG3P7+TzJJfLZy6CkR3RinWmk6v6NIMjAUxa7QmTqAfZIr3GDZvArzo7ag+7MfyWxXKlgW5MRDK++upxSDKiwsREG5Jqxn25htDK1/p3mkhLxPFjQXxO8XniTyqjGZRf6wm7pJJ9ipMurjPd8ou419yji9UhwR8daR2VKBtl/6/AjOZkneeurwSij1NTh5MqKQTMKplNw55m75kT18J3vBRfe1kHGq2A0jvoN0pixKq68SZM2YAUhpQZ373iT8FGl/oDYEFa4KUruU1O9TggtrovWS7UnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199015)(41300700001)(2906002)(54906003)(66946007)(4326008)(6916009)(8676002)(316002)(66476007)(66556008)(6486002)(36756003)(38100700002)(7416002)(8936002)(186003)(478600001)(83380400001)(6512007)(7406005)(26005)(5660300002)(6506007)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EPc3QBCu5Z3+C63oUEZZ+2TSUPcspMygtP/4Y3AiHrovjwc5hL7bd2YMYAbc?=
 =?us-ascii?Q?h7er+Ewfk/gme0fr0KhVsb55T+SxlAyPyH/zGMT1nlM1fYDJ9mM8TFlgsTIb?=
 =?us-ascii?Q?ceVVLCBtlEp/XCwSgmt8DRuQlFqPHXiNTIAnWOp7DIuAqpqOeUMWIQbz6Kdl?=
 =?us-ascii?Q?DXOsN4Dos05rCux/feY4MKT9U7aykNlM7T3UETQw2Z+t4GRvNmdF2/2ONz7v?=
 =?us-ascii?Q?Y2OfI/oCEh5h7EH+FWGkZtivx6jdchVMJfGhAf02ytWnC+LzPyOertlqZxQz?=
 =?us-ascii?Q?UQpL+75GRkdTBGuFwo3NpFL4+X7A7zyk7X07qVZdtJpqlPM4T9ZVzJLoObKf?=
 =?us-ascii?Q?uTlhGcHI3vn28DtcLCvnQSrWa3ZujPzjwc93uuUtCiOg15sCmQV6OjsS6fOF?=
 =?us-ascii?Q?CiKDQGwG2F4BYfQi7wtFMNZJ9Ylvo4rNU0RFqM5f1QwdJE2jt9bw1vrOXtyA?=
 =?us-ascii?Q?fxcJPmLabw511lXwCJ7I/UahJOHSkH5L289AxmnVyl1gxVhxV8o2yqAxF6EA?=
 =?us-ascii?Q?q6KZM+KHXGk4yMaB3f17Lxa+AFKrtPd0yYYtL2UCqE6BcH+9ytMBec+nTqtZ?=
 =?us-ascii?Q?gLFSmjWE9FXNWsQd2XMFAw/y/Fe+o0rnmOotMfzPE+mBAgyLh+8N6rtt0h8x?=
 =?us-ascii?Q?+PIvtMNyg8o0EsoO/QT5hHCF9B8raFXC/p6mh9z3Rh1NAEELHysDjR2+YdtR?=
 =?us-ascii?Q?c+lDUSmGWrJ/Onz5jqG6b6KRbMU2COHYYc5j1HbCaicb3jBZcxX7jfDZYsO1?=
 =?us-ascii?Q?5YRyEfWPFf+diqLYYMdL6dR7cKdPykgRenCSPq/rHQ6e0MxqZEYyMMt5dfBg?=
 =?us-ascii?Q?uRdXAP41avbEkG/nKzBPkBUpn0NVXO72P2CKP5gWuxCNypDg8+Kf5RZ5r+KK?=
 =?us-ascii?Q?Ol0iMb7ZhtqKW9fBnihxQlyKnRNwfjALjOWIAhDv+7TfqoEJGl2fjxFytrfC?=
 =?us-ascii?Q?jtRseIkH1S9HPBGGuhmWtqGUKX2WhfXHgBsL0OFBTO2Ye0IKYSSiI3wrlhLJ?=
 =?us-ascii?Q?wxu/jyEpviEADe8O6wGVWwYqfg/X/MsMkIlmHtAGdwgTxKm5eneb7+eN9Kxz?=
 =?us-ascii?Q?Vy/2+FnTHqEuksddwbe7qv8GDcf9sihddYiVmXrO3WALfs8QXAo4jPJIj6O2?=
 =?us-ascii?Q?l6DCz/UGZ4TEIzICngGvgLIZY1fJRpLouZD3F06oB/YOyt8fWyvJ5hnxG3xL?=
 =?us-ascii?Q?fuh54yJAtPASxOjQrdE7IGwu/4pLE+W6U8Dc8CFMkRZL7SjGLeRhigLMu/9g?=
 =?us-ascii?Q?JPHO1//tK9bu/+rr/2W+IXNMLD2V9Pp1d8PqMwb73FHmMyl2iIHF7bsAxkfy?=
 =?us-ascii?Q?oKzQC/GUTfBgH5KKjUOOXAPHwMevDLS9EzQZgH4HaTVdv6GCYVkQKEzkPwgh?=
 =?us-ascii?Q?5gK4mliuXfzRgP7Uph8RXZsJaWrI3imUJ/SBD2M02p5QUQWVhjHug35osPpW?=
 =?us-ascii?Q?lhg/caMsseTwAxe2x4DDKRU6ASBL2WJfnk704xXKNDfqaDXCa3H7s3ElN+9R?=
 =?us-ascii?Q?3Sp7nsnNdVCJUyY6BUsyIcU7wnNJPKRn53C4jzzOyQ1R6abvN2CfwRRDeIax?=
 =?us-ascii?Q?olO3N1a5VEkwcGJ2LuY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12268162-4f3d-416d-90f8-08dac3507141
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 19:19:09.5031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhIS4XsQ1mYSxKJe1cs0owUJGnvDFtl0EEw55K40eHW8SZ/qUDrZA8OeY+ktEGdR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 11:28:22AM -0700, Alex Williamson wrote:
> > > > I'd be much more comfortable with this as a system wide iommufd flag
> > > > if we also tied it to do some demonstration of privilege - eg a
> > > > requirement to open iommufd with CAP_SYS_RAWIO for instance.  
> > > 
> > > Which is not compatible to existing use cases, which is also why we
> > > can't invent some way to allow some applications to run without CPU
> > > mitigations, while requiring it for others as a baseline.  
> > 
> > Isn't it? Didn't we learn that libvirt runs as root and will open and
> > pass the iommufd as root?
> 
> We're jumping ahead to native iommufd support here, what happens when
> VFIO_CONTAINER=n and it's QEMU opening the fds, with only file access
> privileges?

Yes, but I am thinking aloud about how to best to do this in native
iommufd modes.

> > I think so. At least you should have something to shut down an
> > insecure feature in kernel lockdown modes. CAP_SYS_RAWIO is a simple
> > way to do it.
> 
> How are CPU vulnerabilities handled in lockdown mode, do apps require
> certain capabilities to run fast vs safe, or do we simply disallow
> unsafe globally in lockdown?  I think we have a lot more leniency to
> ignore/disallow flags that enable global insecurities when any sort of
> lockdown is imposed.

The CPU things are all information leaks from the kernel to
userspace. lockdown is about preserving kernel operating integrity -
eg preventing modification of hijacking of the running kernel.

So, like you say below, this is kind of in between, it is not
information leakage, and it is is hopefully not an integrity issue.

Being more of a DOS maybe it is fine under the lockdown scenarios. At
least I am happier to hear that.

> > vfio-iommufd seems like overkill, I think your first suggestion to put
> > in vfio.ko was more practical.
> 
> Convenient perhaps, but architecturally the wrong place for it.

Ah, that is pretty subjective. If the architecture is that the iommufd
user subsystem opts-in to this insecurity then it is an OK place

If it is that iommufd sets it globaly for the whole system it is the
wrong place.

We could also talk about a per-vfio_device sysfs to control this? Then
we can make the sysfs only appear for vfio_devices using the
iommu_domain part of iommufd/vfio. That has a nice sort of compat
shape as we can make the existing module option default the sysfs to
insecure

Jason
