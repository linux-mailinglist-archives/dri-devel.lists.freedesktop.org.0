Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192482EF37
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 13:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F5F10E4C2;
	Tue, 16 Jan 2024 12:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595E010E4C2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 12:54:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMMJf+ETGovCZmsMUbj7I3PV2EG3HwzA6WPFWTiR+W4U1d000+N3lo/HbHRjseqAKEfSNpgQQdgZK3rDx57b5rZj9LVyRHro+YhoN/VXI8e0H6OOP4IUboeY7hdnf31ShTljqoYXoZnc/x8W7r0m7ZglXYJS/YqCqgSP3BJVPzj1T0Y4IoRjcam1EEhae29VEFDvdgEWEQtaklLTPc3u997Noy1qCiX1bV+gh5WRUN9upu9XU8Ovg3LFP1i78uVVSkD8Oe5/JFW2/jC9N3HNRdHRwggXapLw9iHYU3niFvseaArGAg/8hqw4N2+m9mTLK2RGjlXYsYKzZ8f4siPfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sE6FCYBsuhvzQ6aiW0wQrrNkOTprx1vO8DLg6rmxPeA=;
 b=JfDOfRKwArOiaD+oNFiJunaOICxyetsBd7nc2ntnuqd+VPyTXvgg2FRSdwQRxlsgDOkeh9xpl2Tg5hw/9xK3Z7S9EcfzYUh5HYd2eD48ifcHlYPjt9zoCOPYcq+/6FUxdg0YqXfa+v4043iYa71l/gmbr0Ms8q1ZOoUJNddqllI2ThCC7HT8IvVD3dcx5vvG9fAscUgS8aeAgtUCIqjOKQ3aOurkuZ57JzeKULOSVgqxuIhpUe1YHQERDw1H8Cqf8xEfMaCpXWNWItzWpXmY/ja0Vaqu8YEoeX/yFLzQIgrmXkaupc8g25WTGiFUsBm77W5WWwuiA7JDcJHz6cJBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sE6FCYBsuhvzQ6aiW0wQrrNkOTprx1vO8DLg6rmxPeA=;
 b=HKYk5we9gre4KAi/rhczu6HB37jjEvkRh8hFAq9Mdn6nL3hWjl+4QlkvjCLq99E/YZABnQaYz4+Yi/5VY89hDpcIQ74EVK7lBqDuvwMGgKj/8MP7ia3hd5YOVq5suZ3c1hYV6Xl8C9ZYCZOmfwJ0sgTN82KeDCA5KgmgJ9cQYypRUQnuF5V9s2aAqsHp1d/pWgK6r4WVny2ARXHkSjM9yC3XQITVfvepCFQhAOy0rlvJBj5LfFTn7hsqJ6JlNI0+OxmwzkpQm2EMi6d4x8XLmpoJlYWv5RLRA7kYq4viIBOt45fOYZLJHeF15PYZyFuUZAizFQbCFZOJckzRaqDmHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7153.namprd12.prod.outlook.com (2603:10b6:806:2a4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Tue, 16 Jan
 2024 12:54:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Tue, 16 Jan 2024
 12:54:27 +0000
Date: Tue, 16 Jan 2024 08:54:26 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Message-ID: <20240116125426.GA734935@nvidia.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
 <20240105195551.GE50406@nvidia.com>
 <ZZuQEQAVX28v7p9Z@yzhao56-desk.sh.intel.com>
 <20240108140250.GJ50406@nvidia.com>
 <ZZyG9n0qZEr6dLlZ@yzhao56-desk.sh.intel.com>
 <20240109002220.GA439767@nvidia.com>
 <ZZyrS4RiHvktDZXb@yzhao56-desk.sh.intel.com>
 <20240115163050.GI734935@nvidia.com>
 <BN9PR11MB5276B5603D9D777F01D64EDA8C732@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276B5603D9D777F01D64EDA8C732@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:2d::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef99777-6fbc-48df-4520-08dc169245f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJHZNcVm20spUiRWq8jxik/2v4G/joDEyPHyGLRADWKYeWfnNc/1RhC2H4wI3DSTHuIGLG/jm8vt3GyA9IyY7zWRBXqBk+eFYxIQsG+EwshOc7iz53CSypHC7YVyBCRt7OlZr4ZaVU2AoaQYM6xsbaUFrhNc7iXe+6oZDTTr2CADK4xPiiWdcJpPl7WI5/qVqb9MIDisKEYHPXEBoKXifGlizkwwvWQEVDO0inGtQQ23C/aqw4GfUcFp5aN0alF1PXY4/QMyCALw3DbjxUeKiv+rn0fIs07fZ9kiLExlLKxhHejcMOM5zC71eb4GuN5GlBsK9c2BiV45811/rXf+fRKU+nhJxCK+H/7mDcwQS8mEjPmx1Tti5sEIQfZ4YTFLLGN6ecDH5EzglVR5+e9WNXXMQzHOeaEtVk+YvDfYlVRLR+0jgF3cHbheN96hl3oXLekFg17M5sFphqZ4iSlxS3DBpXegDbbnwrCEY1uKfndgdbpcyJs8ED21OoUYDNSqKOJZpXGFAOp2VTGRrFUwAx55zwEp+w3b0oUE7O6RET+gr1d1rQtPb5l/TqDF9nXuo65NAF6wq611ixch3+K6VpFhsDZ1vUpxZ7g/0aQVwRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(38100700002)(83380400001)(36756003)(33656002)(86362001)(66946007)(316002)(54906003)(66476007)(66556008)(6916009)(8936002)(7416002)(2906002)(4326008)(8676002)(5660300002)(1076003)(2616005)(26005)(6486002)(478600001)(6512007)(6506007)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2T/llDK5cbu2v2aCrEFdwGImspbEDve0nKNaSUYRGLf96VEF6hCYdaewZu6d?=
 =?us-ascii?Q?tHIW5I6wuTCDH6CJGM6WhwSefBoj2QFK7usFQ7tvgcYtPXJK1gZrIomtczRI?=
 =?us-ascii?Q?vx41IOOnYSeeCA1+FmIKSpRp9aJDlZlN20TDGP+uQaPuAEfs1pgJBqD4iWAo?=
 =?us-ascii?Q?6pGvUK11hH+KSRJW9bNabc8ltZWfjge2suQeCOYH7GwGGy5i8lrBe2SZMo7o?=
 =?us-ascii?Q?xVfChFcs7LfQYPwciZZzkwqNMALpd/pACFryRbF6kHXmsAzXaIOCJ7SSnEsx?=
 =?us-ascii?Q?J3Il6MqpJeOYI7H7lizf0s2ne8U/Ph0qwG5tgozQow0qKy8hIahEZPPt0RsU?=
 =?us-ascii?Q?4edqcQIrh+rs++v54ptLhRvcgcfsX0YqAd6Ba6yXFgxVLk2bVbxNJUR7CvLK?=
 =?us-ascii?Q?hS0OQkiudrc6S4APRL05GuV2G0z+nw/9pQCs+a0zzz8ezL/7XquWL29mma5k?=
 =?us-ascii?Q?dd8ytyPO5q2g6QYIgK+Y//XfV9Dbi9b91rLhgZQkPSAqKbpoyGsgeVpVIwG3?=
 =?us-ascii?Q?ODpbb0hvRRjyjKeWNVWgj3deY+XMC6Yi2Hb+oQkRpwkfD5mH1GV9jb9R5ZLc?=
 =?us-ascii?Q?FfmEY3ZZmPU1c9hSCISHzY6CnpLAziBy/5MJIU1tF0WaP8bOGMiTZTiVdBT0?=
 =?us-ascii?Q?DUOQ5TaBR1S6qugVQjYguQcjxqXZ3bwbBk0d8IIfp8GMYfgdBIpP9H3mXjWH?=
 =?us-ascii?Q?JDPblWeKTXRAST2aNStnq8BQjU6Tcvvc8sD/0nou/KTO7oU7Ln+WMn/34M6f?=
 =?us-ascii?Q?8fhcvrqozDIXoL9tuyNlpjx6AJF4jXZ0FWjXhw4Si1aeYi4uK8RHjf+kGVlW?=
 =?us-ascii?Q?lPMA2EpTBF2+LiJqKX4kDKdWC7KtK6a7s3ZdB/taTcCwUfnZ4rkA+DxhXF/Q?=
 =?us-ascii?Q?kufC6fL79TQTcwIJAAKfKHTIERvPzaWMNmJxjsNzF8O1OWOe0NNiIhHa6y4p?=
 =?us-ascii?Q?d0SO78Cy5FGHsWoi13oiJUCGdyul9dci1Zg79uQfzK/55WRUwF/efAEb+Wwr?=
 =?us-ascii?Q?DvBKZmzOkG02uu/fHRsxUKbu/WVjFGRjwkjU+FOuf3Md/eDA3b4Kxogwm2CP?=
 =?us-ascii?Q?Tn2jZJZzocKvqcHDvej2bWiD1v9c9mnnRwnB6SJfjUc1PbSvkXLqRri+xi8n?=
 =?us-ascii?Q?l3pIP/GeA2cGaQr0vet14ZD0IdHeLGcQg2y1ERKWNElNojG5BZFFtPR0/oI0?=
 =?us-ascii?Q?uW9a++xiYp6ReLUodghGcUzcUkTNIhdr7VtHd9XeaCwWBw66b4vAwu7cjwYP?=
 =?us-ascii?Q?UtnEsKRf/NiQFjmw255kd15lJ6hUS1VJAsPbwhEb1V/rIzlrndhGvbHMN3uX?=
 =?us-ascii?Q?DuXucPw6ivRjZA9ByGg9RAEC+9KCxyTf09dFq++5bPdnHtA4XeUvF5c7USRX?=
 =?us-ascii?Q?S4BWeYplrSLLg07AokJqDL+s7gGmti41Rc1w2pV+olaz4o7iaYJZFfM2Rns8?=
 =?us-ascii?Q?EuyLLn0MgfjI5hnA+p6BQYMYkblUxLXXyP+8aNJKmxiz7qIYcTkOIZsJv3zF?=
 =?us-ascii?Q?eBxOy8rb+en6Prr7iBivbyNjWEX942sOQiFb9KRwn4hJxdJyh6+IZIKoB5kj?=
 =?us-ascii?Q?IS063ptCFOvUMc6icZQkH4zXaE6lcB4oRGWjGU41?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef99777-6fbc-48df-4520-08dc169245f7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 12:54:27.5880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXPuni8jv8zzAXck6BBCSjSTMp2bmqH+0WaucUfzuZivNTb7c8/TkOlDGO3X4El3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7153
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
Cc: "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>, "maz@kernel.org" <maz@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "zzyiwei@google.com" <zzyiwei@google.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "olvaffe@gmail.com" <olvaffe@gmail.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Ma,
 Yongwei" <yongwei.ma@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "jmattson@google.com" <jmattson@google.com>, "Wang,
 Zhenyu Z" <zhenyu.z.wang@intel.com>, "seanjc@google.com" <seanjc@google.com>,
 "ankita@nvidia.com" <ankita@nvidia.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 04:05:08AM +0000, Tian, Kevin wrote:
> > From: Tian, Kevin
> > Sent: Tuesday, January 16, 2024 8:46 AM
> > 
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Tuesday, January 16, 2024 12:31 AM
> > >
> > > On Tue, Jan 09, 2024 at 10:11:23AM +0800, Yan Zhao wrote:
> > >
> > > > > Well, for instance, when you install pages into the KVM the hypervisor
> > > > > will have taken kernel memory, then zero'd it with cachable writes,
> > > > > however the VM can read it incoherently with DMA and access the
> > > > > pre-zero'd data since the zero'd writes potentially hasn't left the
> > > > > cache. That is an information leakage exploit.
> > > >
> > > > This makes sense.
> > > > How about KVM doing cache flush before installing/revoking the
> > > > page if guest memory type is honored?
> > >
> > > I think if you are going to allow the guest to bypass the cache in any
> > > way then KVM should fully flush the cache before allowing the guest to
> > > access memory and it should fully flush the cache after removing
> > > memory from the guest.
> > 
> > For GPU passthrough can we rely on the fact that the entire guest memory
> > is pinned so the only occurrence of removing memory is when killing the
> > guest then the pages will be zero-ed by mm before next use? then we
> > just need to flush the cache before the 1st guest run to avoid information
> > leak.
> 
> Just checked your past comments. If there is no guarantee that the removed
> pages will be zero-ed before next use then yes cache has to be flushed
> after the page is removed from the guest. :/

Next use may include things like swap to disk or live migrate the VM.

So it isn't quite so simple in the general case.

> > > Noting that fully removing the memory now includes VFIO too, which is
> > > going to be very hard to co-ordinate between KVM and VFIO.
> 
> Probably we could just handle cache flush in IOMMUFD or VFIO type1
> map/unmap which is the gate of allowing/denying non-coherent DMAs
> to specific pages.

Maybe, and on live migrate dma stop..

Jason
