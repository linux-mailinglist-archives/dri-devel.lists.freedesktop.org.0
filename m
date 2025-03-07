Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52517A567E0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 13:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3629D10E182;
	Fri,  7 Mar 2025 12:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lPeFiW15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEC610E182;
 Fri,  7 Mar 2025 12:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syXqGrrS/uKpE430lwtDIs56TSkhuR0avotvC8f8bo62k8L3kIZalLI6bB+agB20SR4J8Ej+91A6yQQAOVcDRwEf00VDLKY/oCdb1IPb+0RIcT54wjp7NzTT/73TdWn9FH/n9/lKIG5f8IFGRcLpSIWWAM9CMC2VA1ccQbXyiTH75Rr7KYw2Y+GtiVKGguj/pAbD36XM02QvZCrpaOpMu2djV/2A9OEYCBuXa7SLLHAiGmROXyPHjoYwNlBzgwFjLYO3N6As8Ojh/Z2UrvCeFvWkF3vWtb46wFSWii9OoyxpRUQjlJ8eY/RP0XZrPrcD/pWxI/1t/xBzNSuFh1bkqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLvAiD0JhA+JB6QAtcfODrDKZ+dYHKv4DhAZlXdNivI=;
 b=rOudph8qf87ZaDwBWHwFpNds4e3G+FT/o8igFDWJP4jFwKBP75WeXhONErlzI8bRUx1SnyUv8xp8ixqMNMLlnZAu3tk092HbE6XT+IOfB0Ho8PHreFKNvCRgs6qN40aSzLQIJXr8OdbkihhtLnvof+mBzVwr4WLAkM2bEa6RNX7/E3HADNqjLnr5jo7Bbu2wyM5OaT1OfjG3pHIOgUYd0LsRocDu1BqOJ45PoAuo6fw7hqbg75xxXdpXRh4VpNheeRFrV+2ajroQ7SMGKAaVaAjywyzTs6lYjCXGCpeotMeykupl/c5+R7/+ZSbXiM1jZHQlHazDqtXXc9YD/ImpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLvAiD0JhA+JB6QAtcfODrDKZ+dYHKv4DhAZlXdNivI=;
 b=lPeFiW1594AvEs8KWVmEKsTGWwY5b9YkRYQ3UL9sZRgg35O4xfBwwoup1DV3b4NJtYkP1v1L517LA3VDFzNw9KIvihvCIycwkWh2v6xB6mRA09SQtHKivZf4zXBZNF0tkmj78P0+/jQoXAK5EyAoV+5mLjHSEXAh0ky9/0kD3l2Eeta67J/jLXVQMdF0RixN4x0/Y0S4GZEdk2sUpBzHp34rejvxUm5GHkBAi/gQXt2CyNd1gev/kFfmHz1G5Xf2E1MvLbijva7unEAmuRdJZ8uG8s3sJB3LDV/suzsKogIKIQeC7mIlOePRl+uu2PY+CFB8R8EcLcjiBxWEPDy5NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Fri, 7 Mar 2025 12:32:57 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 12:32:57 +0000
Date: Fri, 7 Mar 2025 08:32:55 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250307123255.GK354511@nvidia.com>
References: <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
X-ClientProxiedBy: BL1PR13CA0274.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::9) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|DS7PR12MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 152382b4-fda9-4412-6998-08dd5d743092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kf+RVKuR0mNmFCkGA9+mQOLTK/OoFrh1tLA4A8fyXfxm0+ckLSmOQbe5M8u5?=
 =?us-ascii?Q?Lq0673j3p1PEls+f+KeWWREV9sYS5g6RNrdLGtM9wR0fxk0jtMwBklxb63td?=
 =?us-ascii?Q?idkU1S5rScRG+WjT5RuFECln75kElRVUl94kmBXpMrv17HlChPF5Q9UCaqqR?=
 =?us-ascii?Q?DAuiN6I/svbOGFoskFhvSAIg9GYN1PHZr954jY5ggXyHQbQCaeg3By3DII/Q?=
 =?us-ascii?Q?/TSn209DogLblWeKtacv0uXRUqSOj6OQdiN+JiSF7piYPpE352bUkKusa3FG?=
 =?us-ascii?Q?5vgeYj1gZAUXQJFx9Pat/N0ro2E3aZfV5vMceJLuwoZ1VGTYVclEQl3Xn9qC?=
 =?us-ascii?Q?uLlONXKNnl3LP4PtT9zeaJ1avGGr23FegTTnlpKwh5XjH0/xFm+8gww7AZIx?=
 =?us-ascii?Q?noWJLitADaz1c8sAuA3U8mSFSmyUTjOW6T9RWuDlQL83zM8GIwtefDqkm3OB?=
 =?us-ascii?Q?eypsQDeY2Ie1IHMa3sKbH7ZTlz+7cY+abZNOasoKGGRSIZN9g6TKXMBb4EqL?=
 =?us-ascii?Q?p3ZbmSUJUxFTvteNCMOq92QaBnah2Qgsfz6jPU3XgW/PIxus+ewS8yGKsLif?=
 =?us-ascii?Q?CWTSbB1LZ2VN9JhfUA8yIW34UAyKrkB/tkSUExY5Rdj34QhP0LGXv3ld0in6?=
 =?us-ascii?Q?hi7NjhEmrYTN9Vxhie+GP8Jp7t+pbZobNVa6AcZiiLNzfLJaWRsefdYs3JJC?=
 =?us-ascii?Q?CGc1GYkwB5xZXYJnJ5nTo4bdx6C6kLk4kZ7sKqLeLmK/lBNoIBnhupd+V+fU?=
 =?us-ascii?Q?YkeKZsRyVOt8Fp8zevKHnb1rPRgGOnqUtk3J83LQdfqOQw4EMfU0ITBdEyKc?=
 =?us-ascii?Q?StUzmDGa0Hsg0R9hPDVYK3dDEEG6ZNSdWaM7wqqlGkmJqDNC5ww9W3BEzTba?=
 =?us-ascii?Q?bq/RXYjhTkG0wQxboRgO3s24bmmytfLhizATmulXKvndvjKLOFldNzBqUqQd?=
 =?us-ascii?Q?I5queVYCHBhVVegjLHK/yIOosgQ/K0t8gYXcbfYRytpHXxVEUy5qmHVHkrMI?=
 =?us-ascii?Q?CTToLOO3DC0pbu5A2PohS9Osa8KTMjqv0VkrUah6NkJxFvD+wskRfUUYEcyB?=
 =?us-ascii?Q?8RTb7ReFh0PL2ReIqz2jSyNhZbrYkHIl1Q0GiGD0540FMjmr3xV16I/RuoUq?=
 =?us-ascii?Q?Yjb8Gkn26L6ksPdk4u73PIYdbWpHgaZcFsNpJa5fySCk+UGDM4R5SNcvA4+H?=
 =?us-ascii?Q?QCBEnSdzbTKIbEhomp0utThM1iStSwEJdfM/y0U3xXt1jo044bqyb4XHalMF?=
 =?us-ascii?Q?Z4rLgq17imODOzGJxnuCyuFJqzIBuuNuDZQZjTgpWdD8UcYqJABXHcg6u3cA?=
 =?us-ascii?Q?5MfTVwTBcAyefr1j6RMW+FuX9GByxIDijpiiVVuL1kEaDVYUOjqateGEtQfg?=
 =?us-ascii?Q?jjwwlchdHV+Q2uGUyjzP6XZi3LfpBWswr4vfKPiFHlgypQAejYjrmCMdO01T?=
 =?us-ascii?Q?Msu7xRTm4OE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yvMhjiT6++/ExQyCEHIeDH0BRwhTKa9Azya8O0Tt8AFZPFgUmuQLYEM2NERC?=
 =?us-ascii?Q?oA2j6hliR8pVMJ/eGfc92OVulao4Vbf99wDUVgVuHBMda5H2Fr/kJXB5zHpu?=
 =?us-ascii?Q?XAjMG8c2MfOXlSJfoypp4JYK3ZfQ4uD5/Hlaa/NlriWT6+zWPO6MWeRIzH5N?=
 =?us-ascii?Q?8REjLU5Epv2y8O5IEhrLeAcruom7jMOBPlc0xwku+De6pDLfMrC+9OmwFSQZ?=
 =?us-ascii?Q?txDAShus/FL3J9JzjQGKfG0ZJs6kXazqYH9Ylww6mEbU700T/Q/CNAIvW+te?=
 =?us-ascii?Q?xUklcO87f0S5o+XRl3xyStA/UGlqRMuvZ5VO5ssKsqbQOomgmcvn33WtGbpp?=
 =?us-ascii?Q?ipnO+PIDEe61GK78KET47O3ujZSOm/0AKaTeeRexIUzV/84nQbblJnFpCgMK?=
 =?us-ascii?Q?ni3TmSrkbabgGW9Fuk9COQEQlfFJM+lkxcJll2qiN52cRpssCu3bStNIoEUe?=
 =?us-ascii?Q?fB29kqdtpHzTAS7PsK40mldcSJke81RIH4s2dnItDK3UV4NA7qhvxabBimKX?=
 =?us-ascii?Q?hU9L8ibgKJbWgVK5PdwilrlxXuxZAoematRGy9fJ3RnOv10/cMq89/56/3pu?=
 =?us-ascii?Q?rYFi8bslteSpNcf3WVFu0YVDE//Ai+yM/DwgF6zbktK3F6Lqzd+8riiGZT5L?=
 =?us-ascii?Q?MHYU0qBApnsXXMreQuUTlE+STEBCZyZAEQlYc1Bbwov8zgy/0YhBH/TBICbL?=
 =?us-ascii?Q?Ey/TA+EF2sL4qdE3/GeeFcOUNwdsOxoqAmlkPodKSQiNrVIF9KM/BEPBunwM?=
 =?us-ascii?Q?LB56Bv/k6rH7ToJEO6JPy/gYvQIygH9ssB5dMIUphFrbRrQ5NazFXm+ShD5h?=
 =?us-ascii?Q?Hr2imsVQoborHKmuxXFGh78e00lhkxmAJnErL7i50/dGdEn5/WmZumFrfiKQ?=
 =?us-ascii?Q?eUC+o2MRdq6tWCgDx9XlhiZRH+QLi/v1/uSdrsR//lLiBGaarzmxcvmq9gKZ?=
 =?us-ascii?Q?fuLLkIhMHBpHJSEdMdZr1hvnxwHQV2336uqVjTeIoqvU0eMZJmfp6z1wT1vx?=
 =?us-ascii?Q?RcceUYY12yvebzFMmQkJF13KLo+lu6ellJyiAir+yCEbGixqaafAS0hTAdhQ?=
 =?us-ascii?Q?IGxaoexix1pbs30VY9siC2DTAkTToTHRSoLqX9DgRFsHGdn0gdtIrCyVq+wF?=
 =?us-ascii?Q?KmEPiNr5HFd3ABs9qWGzbEqsKTayTKlBxHWCKAg93faART3euL2o/gavU4j3?=
 =?us-ascii?Q?yGtPvKmhWQtbHfkhNpDR2DkX8Y5+zJ+N50p/QHE3Pmh77IHzY0xOXCNa9gsM?=
 =?us-ascii?Q?H2hiVzTqZ1ZXurA05ysk2YXB4n+6+yS281uhYAeacKQw8yXWaiaGUV7faBd8?=
 =?us-ascii?Q?ZhzKDavLpaUD0LSujr/4RljozD0c2iOg8/fQvW+P+vxMbRv31jv+nhkGoyTn?=
 =?us-ascii?Q?Yn6+NSNwUstSUMYAbx24m1/PNf7u3SWGpt0B/2/Sb0wDCX3tT3gE1lldNBH+?=
 =?us-ascii?Q?YW3yq3pAKcdN7xJuXLQgjRDFmX7BNlb752W8BF7hNlfDIz9EvGIxHZTHWVKD?=
 =?us-ascii?Q?XG3neKCJ62+gcRzXM1n9j6WG0c9tXpfDjGS8UjcHipAIBPoqUmju3PyKNxPx?=
 =?us-ascii?Q?L3sg8vStSXTj+ysYXAIbSWdcGqiWt7XNHmjH7a6d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152382b4-fda9-4412-6998-08dd5d743092
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 12:32:57.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJoqvDFTuuJ3YjYWB38mSAwxbqgdhDV3bycoJ42f9qcXksELnmNOCm4JKFXAAeZs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6288
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

On Fri, Mar 07, 2025 at 11:28:37AM +0100, Simona Vetter wrote:

> > I wouldn't say it is wrong. It is still the correct thing to do, and
> > following down the normal cleanup paths is a good way to ensure the
> > special case doesn't have bugs. The primary difference is you want to
> > understand the device is dead and stop waiting on it faster. Drivers
> > need to consider these things anyhow if they want resiliency against
> > device crashes, PCI link wobbles and so on that don't involve
> > remove().
> 
> Might need to revisit that discussion, but Greg didn't like when we asked
> for a pci helper to check whether the device is physically gone (at least
> per the driver model). Hacking that in drivers is doable, but feels
> icky.

I think Greg is right here, the driver model has less knowledge than
the driver if the device is alive.

The resiliency/fast-failure issue is not just isolated to having
observed a proper hot-unplug, but there are many classes of failure
that cause the device HW to malfunction that a robust driver can
detect and recover from. mlx5 attempts to do this for instance.

It turns out when you deploy clusters with 800,000 NICs in them there
are weird HW fails constantly and you have to be resilient on the SW
side and try to recover from them when possible.

So I'd say checking for a -1 read return on PCI is a sufficient
technique for the driver to use to understand if it's device is still
present. mlx5 devices further have an interactive register operation
"health check" that proves the device and it's PCI path is alive.

Failing health checks trigger recovery, which shoot downs sleeps,
cleanly destroys stuff, resets the device, and starts running
again. IIRC this is actually done with a rdma hot unplug/plug sequence
autonomously executed inside the driver.

A driver can do a health check immediately in remove() and make a
decision if the device is alive or not to speed up removal in the
hostile hot unplug case.

Jason
