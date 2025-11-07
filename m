Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF72C3E002
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 01:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A950510EA17;
	Fri,  7 Nov 2025 00:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ldno/FfV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297D010EA15;
 Fri,  7 Nov 2025 00:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPHF/LSccurDYA4zL9z5qxwpZ+BnaFrmioL31QR8L297kYx1HaFZmhpc8LyRjrwHzcF288U07EzycbROhlblBsTLAdCSlz2kcp/O067jA/9USMIm+JdUhW66DXKb8ok6Tje/Z4UPARrH+/wn1Rnp5eFeCeXJVQsSima/2I0n6OyO8sjBydzLkamNQLYW8gK2As13IIk+DBvVaWtkei3K2stzzZt9i73+gDcmcZFpmjncLKIwr7/5iJAtzRs9ch3A5NgyFa8q4lcruax+XMY3rYvaFV3lx996u4GefUdz2Bz7CdSL1NQgQmoQWaeJ7TCuJZBn6exgtDFI5tCBDEU/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEiZQrJzrcR2ee6QxGDMUt9sKLput92ma4bI87pkKtg=;
 b=bSgxdsq8BLyBC84ihqv6GbClgTd9/3tFBjuPfrNxAF2ohbc33qyuf5eZDlowwy9xTOfYjHsOQp1zT583UOVVKYp033fcgo8AKC1loYpCj9y6GLgT0lrxM018gTDz9P4K62KKaZzVI2acr/ebbH7w+JrS9LO2hYiNtHO1K6Lc/avCTSoYHrzuENFITnnAonuqZbYwnC4OcQ5r4aEOskusZBRAIkeaEprFEpbJGAo2CJ3KE3gW8DHLnFs/nnAyRvPFizmhZZ0J08lI3MpEygq9UYoO0l7LIUIcTFx45Kzol+ZQU8WFxYbRDzJdGb/vNW1QiIo0BZJ0nzzJGwBkicEyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEiZQrJzrcR2ee6QxGDMUt9sKLput92ma4bI87pkKtg=;
 b=Ldno/FfVxPWajinsccbL3oHSpzY8fXNUjwBm8J2V1jA7lFw9t0YT9UJE0aKm5k9hNifmYrh0WZVpgsBK86F2lYwbLzFy0axxaLDPxXzvRtiOW31/psqkhl/vzpBvEn8B/IT/XzzVUMdKROqqFg0mNELVuPq25aNCHds/nShs3Vy5aRZC5v0Vj+Hpn4hzOg7ssu1zpxqlN4X082bvEg8RATonN6bU9oBavDtaS0CLBX6uHm0WLtdCk/EvIHorYJ1wZYA2qgnjaolqHLD8qcIwEgcV9EV5/izCK37OnO1LsBPkjem+DNwIWcvGQlhQbMSWrltokW+bZMbGGneOts0qtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MW4PR12MB6801.namprd12.prod.outlook.com (2603:10b6:303:1e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Fri, 7 Nov
 2025 00:43:46 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 00:43:46 +0000
Date: Thu, 6 Nov 2025 20:43:45 -0400
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
Subject: Re: [PATCH 22/22] vfio: Remove the get_region_info op
Message-ID: <20251107004345.GB1708009@nvidia.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <22-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <aQiJV4p3AKZSDH08@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQiJV4p3AKZSDH08@google.com>
X-ClientProxiedBy: MN2PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:208:23b::30) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MW4PR12MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: 528f0aa7-5fba-4e60-6f0a-08de1d96b58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?snkksyHsIbgwYputBRLvNqs+3ga8r0EVWHosqWIzeaY4iGBJzY2F4ocSBYfT?=
 =?us-ascii?Q?+LZDL+LAZy+8rEOOKJcHoVBhXBdIxx5ULQYtXWH8WriANt93XJXdLhTu+CW6?=
 =?us-ascii?Q?peyHu0ImF5fSnGoWjU5ybtXYrowuiT9sf+6tvdSU7VhUBq9Aoh0yr5KsGNcF?=
 =?us-ascii?Q?ZeZdVP6O0Vs7XlpunCH48uJtOf3D8RlHTTLMW2YM31Ln/4MokC2TabygCz2g?=
 =?us-ascii?Q?weX1Hzd+/xjpzfkZ0m6MBd13pVlrSofZDGDh+3G4VvjHbcKBPy94zk/nQ/Jg?=
 =?us-ascii?Q?DpkixuAk3vZvFwJXC3zPLdb9j7n502fe6nwh/xrAouCcaRBFk2R6jZu8pMhN?=
 =?us-ascii?Q?RaOeKE/vdIeRQysI6CdPyXv9pH8kh0Xa/dgHaMLjUFvUlTnJsog5cSeK4xRB?=
 =?us-ascii?Q?kOBb1jeB1DDqelMxzJ0baruCQTLUVVeukakbxikkxIM9EwbPd2LgAwn9IBKy?=
 =?us-ascii?Q?5j0So08wJ3Aco1BLJt8kf+C3In8vfPudMoqbrqHQCOjGuvpuw3qFF0kRoagN?=
 =?us-ascii?Q?FnypnJVzQdwo6AREWSE5IdcquCtK1x7UmAieIINNFzj/CjH/mkT/rHtrDFYz?=
 =?us-ascii?Q?lxxCbuNdCLW815cC1aGoEKM19O2L5kFYSNiKqKc64BdtLp/pGP0PLBCebM1H?=
 =?us-ascii?Q?+i40YTZmb5VpNZsz+NGagqq8EYrjFTvwpB7NznoDaLJtGbV2yoi++3RcVPF/?=
 =?us-ascii?Q?Xt1RoZTk5wi20iXMJNJHe4PzB5KZU6JTB6XJH6s2VyJ0rcxySecMN6uMLAd6?=
 =?us-ascii?Q?qlFa0cJH4Yj2uMgpja5fEH8K3zA7/qreEaUFGwcUgocSuyO2EOyYMeDhL8AB?=
 =?us-ascii?Q?0dTFGPQgAMEf0kzRJYFpahSpTzwFJc1o29EqSgsxDmDPRVMjH1+dpm2dt/Wp?=
 =?us-ascii?Q?LfYtPXdYRAaYYrmiAScreFXyBpx1mQotr+xXXKMyNTH6ZL9TMdgflE6v3SMe?=
 =?us-ascii?Q?/QSJuWfk7e4scfSfsU+vDG5GNdwdkDoiNv8CvsdVl6Lorrg8kI7mApaeet1/?=
 =?us-ascii?Q?yRET0iglOpQY/SETBGfx/qOA7FE3FjFAgHqd4WgkIHWZmjvUScI+vrS/yMLy?=
 =?us-ascii?Q?D+r1LkJBf+GnzsrbG+OHeqw45l7Ju3TUpAb4fH1rbNx3OINAp5MXAI6aBqSK?=
 =?us-ascii?Q?/LHXIzYHLlSWK9VUjgNSX1ViwlDdjw9tjEGgkz1cSBr2/3RALY6pV0zD0D9i?=
 =?us-ascii?Q?D7xN4T1EXEgHxkHpTjoiR8YNlO5xzzArIoNcYj6YM58fWSO40vtyeJ8nl7DU?=
 =?us-ascii?Q?gLTAE9GQJalEmSJLeBQmQFW1GbrBPY02kr7TGwCDCjJX2SnDbZeSF5tZIryI?=
 =?us-ascii?Q?UMgOHgwl5DW2EFATb6Y8KTP/gpLsfAu1c1Owpd3/EKu8g5MoBF50RFvy/nCb?=
 =?us-ascii?Q?3g3CIEnduA6zd9C0dplZajRiZnA2U8YHUhj1upFmML8oVcSslw4Tl0g8OA7m?=
 =?us-ascii?Q?tOxHeKMtMneEbx7kT1uhXcavjtzCuDR2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sPsAZm1NsyFB9dIluiw1xW8FwlL7kT9ummZn3FS3Dyyo+haOScKlrYJgDazn?=
 =?us-ascii?Q?gA0MXBOQSyieU6g3PgCVLFe7Kd6GTaX43RkFJBMRMKNxIcEDJrZFrt22NT5m?=
 =?us-ascii?Q?M7d3xzhm/P3dradl3sJUXRLBOssmEI1q4nHo446ZY83VSbQj5z33yooEqIKO?=
 =?us-ascii?Q?tjqEi9sbHOPfkHGtYA2BrtyN/uFPdBvVLzFvcKhdBu35zebUbYceoO2oKD7k?=
 =?us-ascii?Q?Mpbk7LDLt4h6BDzsaOCEqFHFrBt5SOY4vW4sthdKO4Kizdln5CWlDi8hrZ+I?=
 =?us-ascii?Q?H4TqAaWeGVEIcRgIW9q0ZR1due2p0af3UD82oqVkBYwr8FGKM6d2Ol+wUcJA?=
 =?us-ascii?Q?LKFotaaoYYaZdrUkEJSjOleWAIzJ0L2ScHlnbua0ZShpX9MCTujtbMDhkCSN?=
 =?us-ascii?Q?SNVi6Qu0O/25ccILZ4vTN2+zUzoFFeYbHBTeI3PVPtwJlN+w0VRyqrisszkS?=
 =?us-ascii?Q?ZwiUySRAYdahd2jw/lIouDtJZtx5BAHTt9VmKLXMNuYcdEmY1Th/GI00tCel?=
 =?us-ascii?Q?hdktETRzDSg4Ip2wIeueWOcfuYxdeaePqQhIn/TIjTbXnvvkMtrIcLK7jJh+?=
 =?us-ascii?Q?n6Nb8UTMEL7u0p9Q3/cAiKyLmZbfKl6FNBp0rV/SOMxDH34TiKgsNcfQ9gcz?=
 =?us-ascii?Q?Bsy05za9OP4jrugnoxYL0f6cCBw8JnH3rTtBMqTfGuy19+Pqg84/yq/v6YRu?=
 =?us-ascii?Q?sCmFqIH+l6xiENTqspEZ9AkW2UOydzAfZI5fvxxqCN861F/AWgzB6KhdO1xf?=
 =?us-ascii?Q?HOm0cx2SGwTIAW3HB8BPRfGJiP3/XcXApFPJXf2WJMgcleULu8mBhUhfcsSt?=
 =?us-ascii?Q?tuqsU3HvhbSJGkdreBpYmbAGqN6pmnBDy4AivwZNAbOkg+qv36RhoiEVoRK2?=
 =?us-ascii?Q?dRFnTRdkf2RHCNtRdFwb069rJekaZxJPoLPdPReT/dN4vt/9iTVGqwibPxlv?=
 =?us-ascii?Q?gwHUTxPRVgHGXCZLa4y1jUAtCDSmHLYy2+H9VIVx+qk71qsr4tme5QlYwr2m?=
 =?us-ascii?Q?paRWOoq6Y/iWMofdxG09Vybl1OWFBAs+UHk6Ab7KDDiaXeqLt3myu24vVNVM?=
 =?us-ascii?Q?BneqG9iwD5zovmk+7vpY5Qk4Ov93D/0np6pNX8F4x06GgtMY1PXaECrbkNkr?=
 =?us-ascii?Q?vvZ4MOwlIgZX1PCS+TK1UIjvczG+JspqZbnJNCyR64BR3MoleJ4WblMDB/3b?=
 =?us-ascii?Q?F90+LxSJ21zPsfk2W0aXkaJQDm+SV8ncTkyzHxLxb+KFH+ZKB+7lO/uLquvi?=
 =?us-ascii?Q?B83smho78NCulBSmDGy0kGRxIXPNczooHMC4nzR8GR5H7Cc5l7krcd9cklB3?=
 =?us-ascii?Q?rAI0t3lcfCcHrA5lup/tTV/QjzUcr+cqCeIVq488i3/t/EUE+8VogkBLRYcB?=
 =?us-ascii?Q?vTMo2osVEtuJ9Y+G/w/+xs4ERBbUvRI3MzkMjCyLbv7aFre5zRrDHkMuTbNu?=
 =?us-ascii?Q?ctoXUPJ5yTBljq9XyI/i4KK5ZTejk2LSZelzMozSM608kNdN0/QIqV4Xdhal?=
 =?us-ascii?Q?9UHGF7vYx2t0piZ58bZXAKS6MjWNePFhZe8Iuvv8kiPFoYgbqczQUufhneww?=
 =?us-ascii?Q?a/jIYQZnrFqmW4A9tmE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528f0aa7-5fba-4e60-6f0a-08de1d96b58a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 00:43:46.3014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXaHx7ek02bYE4fGR0bVNGAN1og1HhGzevjCyMvZhiPP8jqnOAkNCUpLBtQ6JvKX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6801
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

On Mon, Nov 03, 2025 at 10:52:07AM +0000, Pranjal Shrivastava wrote:
> > -	if (device->ops->get_region_info_caps) {
> > -		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
> > +	ret = device->ops->get_region_info_caps(device, &info, &caps);
> > +	if (ret)
> > +		return ret;
> 
> Shall we kfree(caps.buf); before returning?

Yes, I changed it to use a goto unwind

Thanks,
Jason
