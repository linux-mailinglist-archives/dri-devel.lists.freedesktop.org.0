Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B80DC50027E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 01:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADCC10F20E;
	Wed, 13 Apr 2022 23:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2042.outbound.protection.outlook.com [40.107.102.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C7F10F201;
 Wed, 13 Apr 2022 23:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvsIUVY3d5F/TNLIsoxk9qmY/FvCq+93fGsg3rtQh0mB5jBN7dJydf5DUhQdRekEqSvYSva46Y8N1EsNKg3Xx62/BFm/Spw/MHWB+gLDbC0bBCbVT9d2rtQU7vWJ0sjgLwCIVJ1ukfMtxZiWJ5bxl32fYORF8BeD/z0NmdMjA5feUx9KuPvHVwOlny1ghO9+1hmTjBYISbGGaurDc4lZyykQ6Tf9LDKICa7MhlMSDDYU9PZpkUSS42oo6aKGw4Ih6k8FtEr+t4tNEbkGaEleu/J+KhpT6dwz7ROzPyNWT17rGyZgmhkkDtTi1jUp4wJUoZhXeRBoqfDdS9MV99n+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqXCGl/Z8A2I2pkZSnJ+MWHsG2UGtsIbBmqqSMZsrmY=;
 b=iKz2rUQulVeJ012BEgpOemOPN9eO/5p7JC9e0jAoy9pCscce1QV2MeO9CeIFQfpviS7xvDOzymVdvx7mNr3O+6sMYVABNYFUKy6D9LMOMGEo+2UXBx9jxCMNxslXETnmHYfmjquyAc3MqJWfjocbKU/ZfXl1ESXuAQG1N76VcM2V3M0Y2vYlPPCR9CdRPkEjntHoWoPnCqchAcWbL7IOYfHsS8TAmIpx15nBy5uKroIDzvhuZIJ6eiLQqYJ/20QMPmrTBmXiDYnXaNx4JoHRg3BQxcQ64gqmUrg4KXoKR60mI7c+cJ7gApc8LiE3adqc8zEvJ9Fd3Ba3bunfYWy6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqXCGl/Z8A2I2pkZSnJ+MWHsG2UGtsIbBmqqSMZsrmY=;
 b=hk3Kb5PrjtopzjJBFvLoOQUMVf3tav6O7eeGIrOChTw2a8N0C5xf/TahUdqg3Bu1Sshabx5IcnX/J0VkP5paR9Gp4MFytsu1sZ5s2ddP+XmWDHI5Fn/Z4lC2gG9sWoMDLhuPONbJ/CaU371TGBJgyfak3yVh1NuHaBPI+1jB2snzvdpHWxR692zcSnTOelYxE3Dw/wXqAuOyfWByCdUhzfHrFB34kbehTBvDV6ciHkTpLa7HmSYNZCT3ORtbPVy1uDHrxoSwjUni/qx0z+EW9mFWbZuxlRGdTp3aij55fu/JOKPakfpoMEop42FGgrAaOMcLovwiY8iBJ1E3bL7GNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 23:20:55 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38%8]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 23:20:55 +0000
Date: Wed, 13 Apr 2022 20:20:53 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Message-ID: <20220413232053.GA2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
X-ClientProxiedBy: MN2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::12) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 397bda6a-844f-4b28-8ce5-08da1da4424f
X-MS-TrafficTypeDiagnostic: CH2PR12MB4326:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB43268E532C685EEFA5ACB7B0C2EC9@CH2PR12MB4326.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7LgYxRfx+t/WrGtw+P/a2ncAhnw0u6kDRzA0KQ4V9bYsR3ehm8lXTkG/5t45aFe+DcF/CETbMRo4jFNQD778vwR+rNsSaXekgBrWDkqHXdGNfE5KUmRb4u3RWRh1ARbq28cv7m+AMlWTq0S/EV+CrCNnVpOMa7ooogNE+VkkkW91p2VDE5YiVXKWfDcrhdtZjtGvpgpHLH9YwAf7IYPmsmLR6FT8IQfDXq1iSdfT3eNTwasBRzu5fhyPZlml0gY1i7w8eV891TM/sXzZb+pdMeP8HogA1aY01X+w8OV0xN0nV7IFDSNRtmkMj+L5/4zU5cdNzcsNiHrPadP6co10D4e+9hi9n3WCMYwh7Pi6IcyOn4Zt98PLhLHYxDf+BVjB/MkmiLL0CxxSpY5wZ7i0TN3Qk7O7R0HJNCMe4lSbp6f90xXH8XyPwYCsxSixdfYHNzISgZAuCpOzz44Wx0nw33+aywX3rWoSH3ruoSlyaNQo8iYg1aBLLgWmyhZBWSewGxCbqhaiQ/xZgyVivplFjpmOGy1D+LCC4tp84wr6n4t7FB26IpfhAxfToWM5CcNzJfA8hMKZm2BFlGq0/tqCVoV7QE8p6feb3fEh3ICcLwqsnOjpgJItBDaJqN/RyqasN80tBu57vD34dL3FJaegvS6so0qrrVhVqdugLaCFJ8odl46Tvi/4aTwOybhUz7BKn1y4JL4J7s0Ih1nv62HlVgv7KKuwp5eRY0RBNgXzUyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(966005)(54906003)(6512007)(186003)(316002)(66476007)(66556008)(36756003)(83380400001)(508600001)(26005)(33656002)(1076003)(6486002)(2616005)(8676002)(4744005)(66946007)(38100700002)(6506007)(4326008)(2906002)(8936002)(86362001)(7416002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1PmlkrDq0titB/PeihK4HvYt5z6xDr3ffXuxBHQth/Xg6cbVGqfl329d5vUA?=
 =?us-ascii?Q?vpE9Q5FT+H43nDkljjo9uKR45YQH7oMwF5pJEr9ygnRlvZXaDyTFM3hJt7XV?=
 =?us-ascii?Q?nQj8tK7Tljv0CKCXc9a/SBDu67MduMPozK/myTu3F6P2ESPWvuljKxg8Ceaz?=
 =?us-ascii?Q?/HVvG5mjjjSF6IpXvXyMAWCILYqOxY8p3aTlSwCIMW80l153/SFXU9a48OUm?=
 =?us-ascii?Q?rEaGjFJEn77Mrp1VdbXezCEGvRadOxold0+/dPgKFxnZCIDanhqSOQyWoY21?=
 =?us-ascii?Q?KFjOYibP6kWWgnlkVFhyOLupIEPuaceuoWh7o3lN4V4LmEJxOu0tQxlTncWO?=
 =?us-ascii?Q?yf+oVGncsDIdAoxHZaPEzwLzJRx6uHSo5CbiHNpEkd21ThP/bXXPo1P/IK9a?=
 =?us-ascii?Q?vwQ4TRa5NgjRBooduXaibWE8z73LSvg8UOzWYnTcq39AS9zrvZFYF1cN7sIC?=
 =?us-ascii?Q?eCHo58FpAayKBCTQ0/FhlmtuZdZWtD8eAUys6C51IRTrgopsJlHXqND7V9iT?=
 =?us-ascii?Q?BnnDczRhYgn5JEwCU2BLFoU6F6Fp4oW0tlGmdhI2nspfsRtl/hhAyE6nJteD?=
 =?us-ascii?Q?W6xDmEPuDzq8o42/Um1yhHSTgIkLBpUlPwXdUOiIizxXxAeQNHkkiOdD0MVs?=
 =?us-ascii?Q?SGQxtLeLU/j8KGN+1hlepvmebj3Q3JJOAHVRWmgNQV0yDuPTId5mUHHvKt8h?=
 =?us-ascii?Q?l6x2KDrV9ojRNMVpJ/590XzIyjHeGogJD1qgAPF5L61KydXr0Zwwe/OHij8V?=
 =?us-ascii?Q?YOBsO1at4Wnd14g+2dQFEUJcdF4MaPEaGEXOrKmZdnsAefI2aFwzEr8DhRHn?=
 =?us-ascii?Q?uRWSLopWlbQCd8vz8BWwaDDlU9vOWI/12UscC46hXyqemODvEseuyMXpyiem?=
 =?us-ascii?Q?DAZFpc2TUJoj4MlXrth3oA4j/fZ3+/8fIULXe3ZE6LOWv4Cx4X/z2HE1wR20?=
 =?us-ascii?Q?M2nFoxhAFyKhBNox+2PUk4tilxcQGIDdXF8q3WAbJGZO0qoU4xz6yJxNLF38?=
 =?us-ascii?Q?LlktRcaFL2BLS1AN0kd/BBp1whg6q7n6t67JOFphKTkqJVWruqbznh/5LlhF?=
 =?us-ascii?Q?E7DHm58fSV+qnZJGc14mgB9EdAWClzY4BIxEGkh+x2g/IPbTaujMTKfgitnH?=
 =?us-ascii?Q?YbA3bAtx8LQSUN7MyEFoA2BkPwY77oxaLbWExiH8aotScSm04gJMaEhaWgeg?=
 =?us-ascii?Q?rjL5uswKwEMc/q+3EKxuWXexL0N1h8paZ564y92fqb3nafINsoNKnh/SUgqe?=
 =?us-ascii?Q?7797Gpnvzl7TEAKCN9iAMcktxa3P8amGVWsJ7R2MqVvLiLhRJ9BjumaFRY1B?=
 =?us-ascii?Q?MHQoNtHpPs68KpeNHLh3JR/sRG7BFxnlTor4SeMcGCaftk9MIpdIDs2BuGwc?=
 =?us-ascii?Q?iJA/e9Di2HxLwTvZvcLeLJhIghzEqBIwd8gMrvFJ9p0uk1B769Y/5zXtJPSJ?=
 =?us-ascii?Q?JUAJyq4V3CA6ukO/jsyxYctiG+FAfKS07+LhyeCiAZlPv9yYeZ645eeu0GdL?=
 =?us-ascii?Q?xrqzXeiAD7yLR7l6QnHTRorivumMbK8V1CCu9xr+YYjimT0BlGwSu14GptPp?=
 =?us-ascii?Q?Ux7LgxUh/I0glAMiM3wwUu1xXAYS6VE6l8Z20aVwhpBxdFr0Fe8VAUmoQJyc?=
 =?us-ascii?Q?154t94d1xP1qzbgieUXp/xd/OZf+HM98TShUesHCxAfn5Yz6YBZ8QGMLdis0?=
 =?us-ascii?Q?b8ktKEiDNL2uYZpoJLwm8a/iu/8N8axE6y8LC1rcG3JNaBPk+HJCgcCxO92b?=
 =?us-ascii?Q?FHqzvkxtXA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397bda6a-844f-4b28-8ce5-08da1da4424f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 23:20:55.1635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ce2n7nVgY4UTG68npRgjI/tDIMxSUxwtgnkfp0CLhwZLdbtgcWSPFqXO+y6QyHGX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 11:13:06PM +0000, Wang, Zhi A wrote:
> Hi folks:
> 
> Thanks so much for the efforts. I prepared a branch which contains all our patches.The aim of the branch is for the VFIO maintainers to pull the whole bunch easily after the drm-intel-next got merged through drm (as one of the MMIO patches depends on a patch in drm-intel-next).
> 
> I dropped patch 4 and patch 5 as they have been covered by Jani's patches. Some conflicts was solved.
> QA is going to test it today. 
> 
> You can find it here:
> 
> git clone https://github.com/intel/gvt-linux -b for-christoph

There are alot of extra commits on there - is it possible to base this
straight on rc1 not on some kind of existing DRM tree?

Why did you choose drm/i915/fbc: Call intel_fbc_activate() directly
from frontbuffer flush  as a base?

Jason
