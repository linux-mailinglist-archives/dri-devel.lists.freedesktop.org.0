Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A3AA56AC0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 15:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294CC10E0F1;
	Fri,  7 Mar 2025 14:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dcFIt+Ix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CFB10E0E0;
 Fri,  7 Mar 2025 14:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2t+YmiWJZ7hIoDFKNs1BolPpS6T6BvXiSHUqTw9tsCvXrpms4G6IVqq3LdBoxMdOCvq3uiIqhDdjx+J+nX+1Ag2t+fYHOvwzI9LTljI6Ia4xpluEdksFTSa3IABR61poP5FX3m/u/5i6vdvqSbjyk/l9Nv6FYOUWIE+bgr0JJoou8lDI6dHP/4CHMIHH2k3r+keoPlOCG7mAcX65xlZriqy8G+yQuvybg4xokY1oEI7I94jZ8qIMVbVIzUeTohbDLlnVMb2Yzl6IuA1+VufTTkpUYWvaBX4xnaDp2/BPZxUs9koEXp1ocFAJSUUURHUsVwG1eMJbFOwitynXkhlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQENKdsut2bHSOrlytb0frE4DyA3JlJFlvtCt1CIGok=;
 b=AhnXQQ1PbecX3ChunIV58kBeXYUa7mPNv822DGl6ZbKQW5lrfWAZc+2P1N8J4uaopQg/qhy6wOByr0TUoKWkpAIxJo4/VO1G9O9tpHGG1+8VK+MBbtZdVZyagKRKFj+3CaaXmRn7NiQm+00b4XlkIsP75FJv8hl7VnqJQGJE5/7IlhPsl7J/tyvYikxQXpBVUrmEu+dmwb4qAy5Qilo7PAOo4n6C0VPcHDAewDQO34iBZQwnplpER53gSB1afWYXvv1GONaW9XKw3hIfUY2y42YnJwB15guenfmNLiKXYsDPVE+br6bib/c0z0AARvBUiO3NgmNdstPZ2V+ouDI6GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQENKdsut2bHSOrlytb0frE4DyA3JlJFlvtCt1CIGok=;
 b=dcFIt+IxXcu+ZIsq2qBGmUTZC178P5VVn5pNaqCFzYeAxREmxxZ0BTKdz4DPgadRwAlbn89d68xv0fQVmLEVBxnYEr8xReArzehKeLhIvQswsOBvOwslgZ3lwZFqNzCy0oMcviE1YzlwwFPjLGeVZFbLGsdw8jC1W1EJBdoa10SjfgbDRWjIyiHAls8pQj/wwKm2aYBAcEWHuiBJIBhts/uSlNJiRJ39UsyAnSiVF/yOTwGAnMAPucasNkMFj8yrPZd+xap0RM9ivxRv/U3PR95jj1csj7OzinLad9pfGg182emmCNy0UTJ5mA3EpPFd2mGWDN1rVBTtjBeFA72pYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 14:46:31 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 14:46:30 +0000
Date: Fri, 7 Mar 2025 10:46:29 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250307144629.GN354511@nvidia.com>
References: <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <2025030753-celtic-quarry-1799@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025030753-celtic-quarry-1799@gregkh>
X-ClientProxiedBy: MN2PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:208:15e::49) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: e1148b3e-acd6-4bb8-fe45-08dd5d86d8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sBboMNELjfEg2hkDwQKCf0xK+6djszXE+ERqtpPEQ0r0B/J+3Q3eU4tCPxje?=
 =?us-ascii?Q?XUMMZM4FPb2VoDB78oTbNaIkEDMuAPAnW5mEttRMHs4THGNwvCojY+QfBxiy?=
 =?us-ascii?Q?C8HrlZtLiXpZSCL7MAKUkFMh3n8IlZsvCnekhug76NcGdHUPSyQkn9pok1tP?=
 =?us-ascii?Q?C79K8gJ+QNgteEsaGP7nfDPGM7STAWy8d6vJL442ukoQYgJNMxvq2LXyamxm?=
 =?us-ascii?Q?6gXKk123We2dMJRu1DEH74ALhETK2gW7p1uUhh0vdGjaVwkfMB9Yj6AeaNbj?=
 =?us-ascii?Q?a3nYQ+zL2iducwQJcNcZSQfcJzexnRY/coyJx4qKNXcoQnuyDNm22y+l3LVW?=
 =?us-ascii?Q?kyqk+XfcxVhPCFko6S23WgZvXk4YfjvEvWm/uTem12fKXh/ADcEQXmsNI4Q+?=
 =?us-ascii?Q?9Fh2WrMEEn1vRi6iSBWyibIfmSyUfaqWyyWnlr9VNJsQ+4+Cz0V0cQDJaLfs?=
 =?us-ascii?Q?YoHrS1365SUGBcKqd+b9IHh/oW8rIedWlYN44sHcJnHsa5F637DFzxMHTnQw?=
 =?us-ascii?Q?XfhUtYBcx0RhvhEbrvXzM+5RsYbqEiHc5zp/gcJjOrqSBoagBV6ZUw5oVVgy?=
 =?us-ascii?Q?Mq8nGo+3kXGZOs1BwmM+dsHlpOvBB+b7jYHTg2JqwhkzXNnnYERgqzNU3oUR?=
 =?us-ascii?Q?zC0Jb9vtg0c1hQc1L482IycyywDSZ5cjGil34AQsdVR62Y+M2WqpOPPGvdVC?=
 =?us-ascii?Q?C0Rnj0pskdcgdnrINi1M5WVIupZTuKBi79s2T7o/MlXXOjw95RXGRM2flGmp?=
 =?us-ascii?Q?Z/WUoLMVO/ndrwyh9D+3SNZ3MXTNE3N+s6RPRfdsl397knrhfFuWqGhcuOE3?=
 =?us-ascii?Q?kPpHxM3OWZqWt9z8P1t0f3OAVPwBCs6iKhnZJYSmBOohKN711aYOzWF+zFUd?=
 =?us-ascii?Q?sX8G2yCjbibb70n+44Hq29OIwxW5PuvD5e9mQQSxb9mk3U5QsPYvWpYJNilX?=
 =?us-ascii?Q?a+K+elsW+YigmQDC3U4YVHikP1Iw0IUtaDZKtpFZ/HnoHksRuj7zrGD41zKa?=
 =?us-ascii?Q?oRI67W51AmGAoYdqYCY31fMZH234BXg/kHA1Rr18BLdz9NY9YtjNGV3zxvrF?=
 =?us-ascii?Q?IgnNzhrqTmmzjvsDWN4aDPEhezYnhTIZLtb37jodsKK4BGGaY8HBn5lBmksr?=
 =?us-ascii?Q?WrpGNvIDuLEY4Q7k23FFEuaAUZ42se74ZkfiSPMgPaOtMKKjkFLcxSCBM0XU?=
 =?us-ascii?Q?k9+EeqjxaatFSe8MbQ1Y/cQW/75nqaT5Ltbg7AYoEta4hPl8takvex0mg2Fu?=
 =?us-ascii?Q?+r6WxPqpM3bR3r0+4/Anm+67c32TSy2YUBl8ozBKH3UsOq7jGEOmdeV6KYX5?=
 =?us-ascii?Q?To/RdxesMiihvBOygyqL8P61KCudSQEaM+r/Vfkd3HYTZluZP2EcSV27AN7Z?=
 =?us-ascii?Q?qSg00qnWYX/2gRwyevxw8LEjQiPf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d11at41mOhwyrbEhY6WtH2WEvESFAhDJWB3MV/hGXD/CocsjQVJXrgWYaG+n?=
 =?us-ascii?Q?vkwSibA7nkQdhz3Nzqe7ODRP5G+QUIxA8U+YPy2aLU2PNqjmZJmoNInKTUsV?=
 =?us-ascii?Q?G9aCkeK0ralst7N33mAlM9UkwKwulBqcb3AE6U8S6G+CIqRelf1yRy+xG2y6?=
 =?us-ascii?Q?HJt2NWW8fpbn1LosQ7vxb8L5qU8mWE6qOTORn0iHc8fUxUwBigncHkRlZheb?=
 =?us-ascii?Q?boTLSGoCAXkh+TOM9Kif2aa9gRIFJDJHhnbAkfIw2ia+wjEMjKlEXWu16N6M?=
 =?us-ascii?Q?nveAHuY08aYR/wTpiZj3gm6Rvq8JWxb3/ZAaATsJZOFv6EvJX4mny1I0tC63?=
 =?us-ascii?Q?TZc/fUg5oChC9keXH4nj2QfSyresb0tDraTGy4ySiy0+rnsn0kuhptdH2vdb?=
 =?us-ascii?Q?eoXpqp8Q0Fay8R9xXqYsTLukOrGfQ9NnWAAhxVuNofDRjtPNqBoawGHIVmFR?=
 =?us-ascii?Q?1pc8SO1ogbbDoPpb6wdRH18VK1paY2gi0Rdc6lqEif6rc09p3Q00U+VqrOlb?=
 =?us-ascii?Q?D08Zmvfw+Rx4V5BMkuqY4maB6Xly29iEV0hYhkRfdray5mBhaRFaauD+Te0G?=
 =?us-ascii?Q?LiN51YOw1yqtlo+1qUyxDH47U0N4dXXZIzUjhsIQpv6rNc5Vp2mIpWVvsR3w?=
 =?us-ascii?Q?4/uDsvEWNon2xEoAtHS+GeVB4zm80vRes7bKC+Pla+bVE071fiTX7Od45cGb?=
 =?us-ascii?Q?k5aT9N5MEgUbu3nj8IjH5KZ/bHge0n6CqgmSU/nvLC+DIXgsPizKD1/nBVET?=
 =?us-ascii?Q?r77Z0Nx/76o8q0wkXpmPPgVxvRUvp4Nk7l42RWI7MfI915774dqFnjo2TUdZ?=
 =?us-ascii?Q?APyVlcYzPT4fA00PFGnN/e5plKipBrv2njNEl8e7yAoyPugPhOFvCnF/QjAN?=
 =?us-ascii?Q?scJ30ScxOSOeDk4w//dDK62UPlI/wM/DMnM+19iVpAjDb5Ff2dAQdxGtxOH+?=
 =?us-ascii?Q?Zisv94cKdUPr9Lo3c35Rgz3SBrCobnfE4G3Ci/aR0enOr41sSDt5qd4JxfrR?=
 =?us-ascii?Q?vSXw2eqT9oJkcvrjs6F1kfRVj7Q0TP6duAb7C/kMmJPvENL9vY7rXOgVTbAS?=
 =?us-ascii?Q?S3bmUp1/o2TnSfrc+1FUHORytPYizcxvKYhBTTzt2e+EjA4nPiOkeE8au1rF?=
 =?us-ascii?Q?+XHTmOW2FQDy5HUoVl6KcvGe67tWGUMbyYXi1FVun+8+c94P9X37S5Zn77da?=
 =?us-ascii?Q?zLpUGZrWIfZnSrM4D8lyvINXNpdBEj1BZ68BuAYThT+scHZssawsdQcucsU3?=
 =?us-ascii?Q?eDjDq9PacQAV7+3fep+EkrolYpA+ZEqknzMV1IzA2i/lBFzceyX0nOeuC73Q?=
 =?us-ascii?Q?LbxZnipKhozEi03a/9pgDA/zP0OCAMGdBlJxmG94R689cQirPzNDAARjgwaD?=
 =?us-ascii?Q?APzsnix8pdpr9XmYnBWkAbL7r9HX6Kyr5JaA3h5LLd5tBHFQZfyURP5L+NMg?=
 =?us-ascii?Q?zFa3wpdzWdIggL0CSAQr4y/GdrJJ3lR1cfZBrRIllgta2EfQsiq9afxt+ZNX?=
 =?us-ascii?Q?B5nMATGJz6433aO80M7EEsKKWFcPI8Xb+QBM4wEU38O/iZ0OjQ6E9Vxx05El?=
 =?us-ascii?Q?psCf0oiOwWCHwXLOdmdz89JNHHTo9SMEdZFZmAkr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1148b3e-acd6-4bb8-fe45-08dd5d86d8f6
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 14:46:30.5710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wa2aY7FcZbMASx7ZlQ93FIgMB2YTEiUorrv/A03wUVL002qptrqoDxIlVJ2xkXeP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
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

On Fri, Mar 07, 2025 at 03:00:09PM +0100, Greg KH wrote:
> On Fri, Mar 07, 2025 at 08:32:55AM -0400, Jason Gunthorpe wrote:
> > On Fri, Mar 07, 2025 at 11:28:37AM +0100, Simona Vetter wrote:
> > 
> > > > I wouldn't say it is wrong. It is still the correct thing to do, and
> > > > following down the normal cleanup paths is a good way to ensure the
> > > > special case doesn't have bugs. The primary difference is you want to
> > > > understand the device is dead and stop waiting on it faster. Drivers
> > > > need to consider these things anyhow if they want resiliency against
> > > > device crashes, PCI link wobbles and so on that don't involve
> > > > remove().
> > > 
> > > Might need to revisit that discussion, but Greg didn't like when we asked
> > > for a pci helper to check whether the device is physically gone (at least
> > > per the driver model). Hacking that in drivers is doable, but feels
> > > icky.
> > 
> > I think Greg is right here, the driver model has less knowledge than
> > the driver if the device is alive.
> 
> That's not why I don't want this.  Think about this sequence:
> 	if (!device_is_gone(dev)) {
> 		// do something
> 	}
> right after you check it, the value can change. 

Oh, I imagined this would latch off. For instance if you hotunplug a
PCI struct device then that struct device will be destroyed
eventually. If in the meantime a PCI device is re-discovered at the
same BDF it would have to wait until the prior one is sufficiently
destroyed before creating a new struct device and getting plugged in.

> Handle the real cases, like you are are saying here, and then all should
> be ok.

Yes, if you handle physical device unplug, PCI device unplug, and PCI
device failure recovery then you cover all the actual production use
cases. That is already so comprehesive and hard that driver writers
will be overjoyed with the result anyhow :)

Jason
