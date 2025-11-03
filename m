Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF7C2C19A
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 14:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A88889070;
	Mon,  3 Nov 2025 13:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qOJnxsWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330ED10E3EA;
 Mon,  3 Nov 2025 13:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f50R3ShpXmFL+bgO4VYkNLtppL3aJ+ZifSEw5FlZsZP3rApkqskAEXrBcXkbfEaweQxe06UzUaWYFBXNo97oLx092MmwRqQ4fEzHOJBSmJzaWFKN5ytuSLLKBtERKP2h/6emduF408d7hQz54gOkHw0+NDc+rrLcvtOY8NlXFSCNXtaU+lImjgqVqBlRd5q0S1h3QXXORWRiN3y9zRlDH6JzZu0n/GQ74uj1z6pPAoku5xFWeLbmyJYRbPqjPQysuEJozM3zX15t5XbQyx3AyrMV9wOa7TMnpZNfwRmyR/s+FaOWb/dA9rdlINuJi4ELQj+ZieMJHY+fwpJJl0rSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDRUkQP6itvYT6R0MdaudwV2NeGoRfVzAo4DqV2Xkic=;
 b=Qoqt6TTXkyfnJWyTM8ruChqIMCHYo6iAe5wECGHJZzfAw/L0J1o7GW7itQDO9zMMzrG1sovA6PF6EvzBlbnV+Cfbdqbk6Fk4/dTXecb6oKRnXuiYlbiff8st9/EqfFQV0d+FiXWF7A+fqPp62RsqParaqGFefyjW5RWYGXnlBffSd9il3zZMJoVMYugOr8HUOg5ck4kMEv7cNSLl6qe3Fki0D/T8G3nZ55NYw7CSGC62nlh7LLhfzn2SmH70ntGySTd83+j1g1R0wr9zwf48wy8L3253Pqu5idUnsR5V/NQfKgqJiMhkCrEDslekUFg/XwI/lvw0lkdQNhbdteXQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDRUkQP6itvYT6R0MdaudwV2NeGoRfVzAo4DqV2Xkic=;
 b=qOJnxsWRLsTCI5/zMWGiXFNkC58cwvce8k70KVaUDLLqOYyt6rkPBQrFac18q4+TykKRDRF9TNUetE0PoSPksWCpR4Bq3VQyT7U2ZHWjSxQLsGsM3KMxAS8BaFgKADe+58mxGKhTtrKlL+Nvz47AWMJ7kngIiFysljNiifUfex1OG9o/KQm1KKak0ubO28ggYPZ6NSOuZK0rAbcyIn/etjFitk7LVxQ+OE50wyAV7FaUSRxjlOisWGafcyFcxUPk+YtoJXHjZPMjmwyAIvB5pAZCNuPOsc97eAcJafveFg1w0JqOER2Cz8j5rgJ1r0Re/vnpNtJEFxmdKgi2/gO1EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 13:31:50 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 13:31:50 +0000
Date: Mon, 3 Nov 2025 09:31:47 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 02/22] vfio/hisi: Convert to the get_region_info op
Message-ID: <20251103133147.GQ1235738@nvidia.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <2-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <aQhGTwg4kpuP8pgF@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQhGTwg4kpuP8pgF@google.com>
X-ClientProxiedBy: MN0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:208:52f::25) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec0ae4f-f573-4dca-a609-08de1add5725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mR97/4nOmDSpYsKYuUT+ATaErIQZz9QIu76wVr5k8N2Je1USV7rIiZQ7IZSh?=
 =?us-ascii?Q?lHZ4O6c6PLH2zYWSexklCzIZoNYfWseGQ0BB4E51HyCjualJIdsJyEW2/rFQ?=
 =?us-ascii?Q?8oC/lGtpeJfu0lc6qP2nz68wO09qnTFINxf/K7CSBIaOeBy2bZBK3NaI+/bg?=
 =?us-ascii?Q?LtpUZpLtkx7Xp8AmiP8+zYLur73dBqPaUEZ665vEQHgBNwjrusYxawrJ1xl7?=
 =?us-ascii?Q?BNGGV7iBmPXXkRaDPObZkCOiZJtqgt7hrG693QP8OSVfW+v+JBrIjlJFDk4L?=
 =?us-ascii?Q?YWkp3wkLUSixBetmIJCYFMLc/jaPn45OGIzPWSZphZ3fXqGO9cB+0fa6RYiv?=
 =?us-ascii?Q?0Yd/pP0u9GcausPFtSKMFeQ4700ECTjCsZWVeILLIV1UOsoFlNIJk3l0MNrC?=
 =?us-ascii?Q?xo41UCS9bqesLeE5oCohRqU90I9j1mkv/Da1OnrTouPU78XGz53Ky63LWwp0?=
 =?us-ascii?Q?7y397BwbCpbGSwSdDCUxbhyMVTbBJracnarZGujGQmpEFlxbGXoy3djTzeTX?=
 =?us-ascii?Q?OD6GOElQiq1E5JLfnDf3OplHdKALw+c+Bc7WHR54upUJJdXkf42GeKExhESM?=
 =?us-ascii?Q?Mv4w7KuDFZSVPCojy4FUYGEAgNjaSE0CEXYVMO+iO4G8uOBdXohW3Ijcxsju?=
 =?us-ascii?Q?H8srJrlcbsN8hihUhUd8iRa0+oe/CDfRAmR6+7NzqE1i9cwkceuO5s2Y+uAZ?=
 =?us-ascii?Q?hZCybu9Ea0OC/185ukXO8dj5K2JiFJ8Na8T4T6lry1f0FeTmdstTYUMW3a3b?=
 =?us-ascii?Q?jlxw80Oli3OkP26JmDCa5VkiugdBV1s85O2BFYX9z5mtQAufwtfduvNm1eHZ?=
 =?us-ascii?Q?1NzYSYnI42ZC1pUeap2/EhCfQ3Yba+jGa1W+h9Bie1+aGGCcwrfBw6sEH4WH?=
 =?us-ascii?Q?yipBV9iaxKaKJObdmiGPJjRd0T9XYNzTfR+aY/D3nRGVHoghzRKPEphjkIeO?=
 =?us-ascii?Q?h3mk2gEAP81srv+dmPObxm302MGovh0ajj84QZ1Ndx5qqPSDxtUgAWPQPaFw?=
 =?us-ascii?Q?s78vB0D4kP/uWbkGOIIY7JaW7oFa4UydV5dqJvD5GYGeMyJRLxPdw+lZ8K6N?=
 =?us-ascii?Q?UEG5CcFFPTwJe7cQS7VbxAnGBa4Ln+peBrEPu+EKoTdWbPodAGBN4p3rxbTI?=
 =?us-ascii?Q?+OSImK8k8aUWG79kzi/WhWEpPaqSNl0ES+j64RBwE3m6XnuNd+AU/WB+jIDm?=
 =?us-ascii?Q?Y0vgBqmiqSU1HNb8Paorl9KB0lAg6tO+flCGGJuobX55bBZkjkdWotZhwesD?=
 =?us-ascii?Q?Lej5GGV0YQMJiXWR0n4rLFi9kwAjMqqT6QNcAzs2aubuUHALhbj5qyS1bNBL?=
 =?us-ascii?Q?RFk6Db1/o8hhMjuIj17kBbOdt/PrkuUqMPDY9vEFkCxtPHYoLMZjmznBvDPH?=
 =?us-ascii?Q?GEy39O8C9zq2E2uSHN0KpU3ei/d/nDROb0EYLfy/D89sA50Rpr1+O+qK9N9J?=
 =?us-ascii?Q?YBCTW+l6sR8kPF0ihJIrP+LmzYWXgBl0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+SqBSm0oWdieetGJ3JXzVaZ/VYn3Bnzy0GpAvOKpH6jXTkQ3fk9S2rzzDBXx?=
 =?us-ascii?Q?vl1i1R6izxyHD7cDROClnom8UsHqbdl+vvEYi2RNzFhupt5yFbNxwi2k7W5D?=
 =?us-ascii?Q?T/4lGYQu8DwkkFFfU50Rk5gOPWvtBrFDOLkPLnB0Ohl9J+mylmqEpSzJ63kL?=
 =?us-ascii?Q?lzMd9WYCj6gmIm4xT46AiDIcsBTzVsfB7NWBFdtrkKuqpY0rn7Edk+4X81vA?=
 =?us-ascii?Q?oDCWaWSn3/jyDYTle7dEiOrraV1xkFxSz7HuYxdsHplozVwGmcuwqpzJuGb7?=
 =?us-ascii?Q?x1KeUdnlEqNgGNcBIcVQ9+ua2fP5W/+cq4G/3/1dH5954vM1MCt+lJoloXAy?=
 =?us-ascii?Q?cAqSEDrLDgQJ4MaQEXDUhDoTHLcSidNJTMom0LdF95ykZF3hyF3x0bEGBZcT?=
 =?us-ascii?Q?uHQ+T/5aXssDztvIyrW9ilSZCCAj5STVtQKn4vDv6hdOr3uEg74/ou2WSlMq?=
 =?us-ascii?Q?uTp1/NX6C2X/Yaa3tpMrJWPM6hCVA3WmFE1F9q0yUD4zh6+IahlNhCPpES46?=
 =?us-ascii?Q?CrRpbL8fcxXH+oR7GZkA512FYYlYlSecek6gIaGtqlBDFI2Hng84L+HlJbq1?=
 =?us-ascii?Q?P823VChRboOrCxPCNfn4IE5uDNy1y4GckCog6HJFzGd6C4yXjYVesQXDfZy+?=
 =?us-ascii?Q?GsiFB3XUYcUm3eOS+5YeUt+Jlnyigi6giwvlRv+fI6h6+cCokJPb+eau8fGz?=
 =?us-ascii?Q?7GKXy58JfwPmw8FQXmOnnDyExI0cTJ8ySOzCuofUfN4auV8qgHFCmfd+SE8I?=
 =?us-ascii?Q?UIJFbL87ZSCAG/nunb35BGdaWP2SHkenoFlCc7MgiF8jMVm9MshZSvmbO6VQ?=
 =?us-ascii?Q?hms+jgTdgVQnno0qzMJ0lBmX3X+nS9Mpg38udMZPS5Kony2CjYe76doMqwQo?=
 =?us-ascii?Q?3b/Zs5+TTcPwCRPgC+Vz6dsF3i8fHpclUgD26TC3jyjc0N6iW4RdW/0muUTQ?=
 =?us-ascii?Q?A2flAMWXRy3DZv146iM9wpE9ffM/7Xlcss9LuighzEQmvuGNoqmtByBqolBI?=
 =?us-ascii?Q?1QAbPU2f0o4YVWonmi6TmhsmCIFpVbtw8VkAXhD1G3tbi+pk9fxH+6J0AVxz?=
 =?us-ascii?Q?1k6j5T6hfJ/zGU4RaiztmDqbjaiRKp45jbNAdmEv4vFWiXZePIsGB8W8KgjP?=
 =?us-ascii?Q?602izsPWtbCXZsB1S93X5wJHxUZNIxsvXx8ldkefgQuipE5uTUUY39EmQq37?=
 =?us-ascii?Q?8FMx+XiAURkCeola74TLzAtcKP4LCdcb18yB43t/K2AbTewAfb8z+pUA4x1+?=
 =?us-ascii?Q?K3Swc2yVC6i4ynUN8kSJXvreb00p85/5HIkGHWU1AX5jV5RDpG+GKZxa3AhE?=
 =?us-ascii?Q?yrVZY/f/UtWmlNBWyW/2yd/Bgtt65qehGU8Fdk1O6PvL2BI3XimPCvx3C20m?=
 =?us-ascii?Q?oiQImdkQSOV1GBF7D1dCTPXdpbu2yCidKOXQwolL7IJ50cy0tEKEScj0uaK8?=
 =?us-ascii?Q?Ux79JiIPP9HcYA0YIo2VGYB9qEvll/vB762LLh+X6AMxvmBsHnTBXNThPlfM?=
 =?us-ascii?Q?Mp+saf8VL0tDtDHH1TzaCOvXvmiVbvPyF/9u27vY/CsiPFPLhetEyJNlliPE?=
 =?us-ascii?Q?i3n5umggv9/8mJhBiag=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec0ae4f-f573-4dca-a609-08de1add5725
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 13:31:50.0826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciyX4LdT7D3nF7+QCH5miP6ZIz5G4I1WCk82a57Xu2P9krBB5MKV/FoRS+4A0hSW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612
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

On Mon, Nov 03, 2025 at 06:06:07AM +0000, Pranjal Shrivastava wrote:
> > -		if (info.index == VFIO_PCI_BAR2_REGION_INDEX) {
> > -			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
> > +	if (info.index != VFIO_PCI_BAR2_REGION_INDEX)
> > +		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
> >  
> 
> I'm curious to learn the reason for flipping polarity here? (apart from
> readability).

Yeah, readability

Jason
