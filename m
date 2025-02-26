Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D908DA451B8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 01:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0183210E196;
	Wed, 26 Feb 2025 00:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TspGTA46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B8510E196;
 Wed, 26 Feb 2025 00:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUwKXMJHYY3CQEZ8Qh6eAixxJYB2HoZpVR+c88FuwftxyU9rJ4jY+mBOvIZzK1hIk7dIcRDmvvnJt5AK0pXUNiSYMIEH0fKob6Nqz8Yb0QlKnfLwNzvMQ4oQsqMs+JFadRK+7WPGMOhnpP0xAoPsdWObOA4+woTIY3OPnGhVW+6/+PclU4YRdc8FkfuPZlIPOZGDIZkNGRtJNoE0zF/RY2UiiRcnLjpK0+AVVbN9FMm0t99H7jk8Ky7Cs0yYS/cCOPWXb7FywBJvL1ESQi8A6/gjeftBqGHKbL9rm7yoTfxMbJz2YCFw5xKiuDHvK6LqrpXpqNrjhlssdWTlqsTxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wdi8QPj5+ubJssuLU8x8rt1XbSugnTdGgUIASxYtJz8=;
 b=AhE/geW009tPNppNL1y0v3B+nPBvTJ1OmuJaMVBZmqMUZb7z88z6GDWah9imxmSnJ6B6JBzs7VovfTHAsvWy0ehSgIST5E6YNjNdTpqiSQbTOLhQ7NdUWl3+FTxh8l+2qhyXVV4Tr+iRWsLkdQ9NUbqUKTed1ZbIN4Kf1Uxw1U15gB/udlnKtv9NgI/PDDk5BN25RycOe2MgoWPVQvVCfAyQDXdyzCVhO47yQ3GEVCN5EkHNx/RUCWSBj+OguFhFeqoF/a0qwCA2DkWxc+4asWBWkv1J92ytHTe8LAelQh7JfSXyWjPVxKYTOjp+bgLclkEtncoRmdTpvgZsGUzRMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wdi8QPj5+ubJssuLU8x8rt1XbSugnTdGgUIASxYtJz8=;
 b=TspGTA469cV0n7qLvoDYBI6yHMBX6jUJH0Y7GIGH6H77gyWju6C74IfZjwcNwR4tAQpywPdovWPVnWWWIrIkl5U+i7/kuXosVrzUJiF9tvfN2MiR2V6zfJ3Rv3wvoopxyPkYitBpTxQBIOwIwf++1AveI2ZZtVHro+ecRaIuHydqmcl9NhlsxswaW62kbrYrh+EBCRONhqknQQ7QXtn9QlxCmrgSBBlk7Y3vKVJ1KxUGFqmaFasL2wXLSTR3JzZF3k0mKH9lgh1W4qaZpMmknd51zPn8BqOF+usdSTolt7H35h9TnTfynaL62iiSV9N0JWVJ+P4p3ytXY8dZkz3yTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 00:49:18 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 00:49:18 +0000
Date: Tue, 25 Feb 2025 20:49:16 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250226004916.GB4959@nvidia.com>
References: <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
 <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z75WKSRlUVEqpysJ@cassiopeiae>
X-ClientProxiedBy: BL1PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: e337b819-834d-4b76-6984-08dd55ff664c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gvStVip5vhW1tIL1kYZaDR+cNNOgsxReRR0n3GdQqpVNt5Y18l6sq+h4mN1W?=
 =?us-ascii?Q?UDc907Jo93rPCyMuYZ+jPYbZJJHzmmXw58kGHYHUhKt6uhUbjU3/f2Zx/zyT?=
 =?us-ascii?Q?+spcbDYrzzyaZG0gWdaXdPMCIRStA8uQgKzXQ+bVKwoGtCCPCcVvQnZgrN5D?=
 =?us-ascii?Q?N3iSHeoKXsuLQlNfLBx/nC/CR1GrBAiqgTo7NGu+SyVOLVJ3OVXitDCHUbyK?=
 =?us-ascii?Q?ydieaY9JZTtPRmMv9S+UJvn1aJmxqT2iRgT0ceMXrtZ5zNUY13kVAqtkfPhP?=
 =?us-ascii?Q?wPFFT3ihM+pF3VM3BEMKtOCTXGhGtCL8kyN7Ebhtt8d4ncArgIlLdxBWav1+?=
 =?us-ascii?Q?m7Vu7cpaCquRARHx8dvL09diSMLpAVYjBtRhX6zLgqxv1gRL7Y/axOAiyTNa?=
 =?us-ascii?Q?xsoKfYGjIB77MN2m4xSZawG/b42WT8lVW0Gdi5hWDC4bmvlQ6JFfVxTTZs8v?=
 =?us-ascii?Q?Tu05xTQWcwqKmlRJSnFTuj59ALE86chd4kXeLQ1AXg3ywodlCweZY3z3mMqU?=
 =?us-ascii?Q?mRELVAUVv79gpWA/91X1sQf1HADlHThNd6YYloauZ16fv30M2FZ7lwTDipdY?=
 =?us-ascii?Q?imJJsovNXSdi8h4u2nbtHFqhMmnN4pgeXPrdV3vRh5ri16Py0gcCZVlrKNkF?=
 =?us-ascii?Q?4o9AkfgUBwi+3WPVbhhIK+elSPk8YmfTPJoKMb81IlNwtjXWn24icFTAZPhI?=
 =?us-ascii?Q?k4lKCf+n+ylbKsFOSMgd68HUU3FO0MWhvTES4QxHqwfBwqCaiyYBS9cm2HPQ?=
 =?us-ascii?Q?zLP0zeLmP603U7HjSOF/qrOqo/rmSkx94kQKc/BrcrntoW0u4+2JF68m7YcY?=
 =?us-ascii?Q?JCoZ+V0uzQIoojJ+/yqzCmvyt1bZAzw/5OD4AZ4hiD9SCbJFwtQa7oLrlsds?=
 =?us-ascii?Q?04r3ayo3uJAqQmXA9XTQieB/K2rrkykpNruBj3c6sC/G+pFqXCUgHypHHWsu?=
 =?us-ascii?Q?DdBv2aTlXY6jhQpX1IPd4yGpM0Q4gZaHSX7nM9wpvnrVIQnJCi2pptP3seRa?=
 =?us-ascii?Q?eDVssQHbnLeQxcLYHq7cimSd0NjoqsxK5tqxN24Zy3ytWGO6jwwhSnBb61rK?=
 =?us-ascii?Q?w9Ikf+jE6u3e11BZPEtDHnCwruWLePWbF9uQTVxR1ficyz+NdZg05VH/z/3+?=
 =?us-ascii?Q?FJTqzT1QxWLAZmMPkqU4/POSiU9Zbolc17GWHDtlVOdDsFZPzizSmSH0m1CP?=
 =?us-ascii?Q?b+BmAQOmE3c7UNVUSYiTw/7zMVzsnVL0dQccZcp5m0uT9Ju12D4U/9YdN1Kl?=
 =?us-ascii?Q?uJQfdcJ5TzPVRNtePLTdVC7QQ7KSmnlAxw9O9rO6Po6b1LNFu2s95BYGCbET?=
 =?us-ascii?Q?j8BjOZ88ajZvgAW1yX1mfHDyENWCR1q26grg0qHBCy67FDaylP8gH3NMv1bm?=
 =?us-ascii?Q?Y0ZS1klzUkd6q/0RFQvyE1Yt7vs8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b40s9TV4vVXZsmWtbX4sP2pWDKA9fG0gnw8P/M6yUuFSAlknOa1sGyXbO5aT?=
 =?us-ascii?Q?Q3MFvQoIo4tdjzXfO/2er0bwUUFmAq4gNQ+agL7iMM8ztYICv7ZQmSTXE1qZ?=
 =?us-ascii?Q?Drj/znAzmDq16mhUGcAf5oliBE+rkPfTKNWGVbUJNwVijVhwPJPvcP3+zFnH?=
 =?us-ascii?Q?ZAEw2TnvF6uR4WXCWyEF/225DIBt1kDXt5Qszvc3Xsh1A9NPQhIG3ZqeA3rO?=
 =?us-ascii?Q?1xHvluRu4pOzSyPg+W2Gh2zecg2+/xJ9ksVBuV5miYz0jAgwewCNHurL8zzS?=
 =?us-ascii?Q?valR60BCELy0bhHjkpRr2N9jOtwcLXyY5/y04x5EsVnmOljhFL9L8QekyZS4?=
 =?us-ascii?Q?N4rZTnJyW2O6uDOXevyanYaahjjFOs3Gw289vLjkWydbK5ZvoIyh+5KWCU80?=
 =?us-ascii?Q?cqsEbtaGYTo7j8VPq7SMcKxYnS3JYydrmmt5oTsARLH8KbKYq4v6/7Kyv/C+?=
 =?us-ascii?Q?Z/EK+R8c6hbtbVFajOkyFyNZ92O9HsdWLMpu25cEcKiyk472HCZzD7EZWDzr?=
 =?us-ascii?Q?AUkq2ihSWf/ra0vTMwtodJWlNYsdB0IQwoziH3ChKYGZqT8Znc5E9S/6abpw?=
 =?us-ascii?Q?/vS8Ucwo0zwRQlFE2h+6NTrICta6zCK/uZ9dxEFbRN6tAH7jMm4QUA1ePHde?=
 =?us-ascii?Q?82kaMbsxz71a4dkFHTMEs85K6zn8r6/85eXTjrNk2fNix13YvvMm8jffd3wE?=
 =?us-ascii?Q?wxzQEctqT/25jjSrW6u6f41V+8w/efeYE3P5AdzqefioZyA7eoY4iZIOOovr?=
 =?us-ascii?Q?CUs6Vjh66EZ//N6n8NMt0Wi2TAOmsaq0iTx1KbubfqEhmMYOSj71TGugzU7y?=
 =?us-ascii?Q?0naS+rmWofJQ5jdWBtYLQEGE5oDP8lLs0wtyoVZroNaNKdgenXUSZ7bMa6am?=
 =?us-ascii?Q?AU6LYNTXbhGRD1scc5IlChD6NHSCdm8Pg2J63Gs213bO2XBcBw1dHFC1440O?=
 =?us-ascii?Q?ULJLNmYx9jEIMGjl7kQiMGfyDrQxwj5xYy1RrevWXoJ2nuZGPWjUHjK2USvl?=
 =?us-ascii?Q?wn+rZlk/DnvmcurkLiHqtmzWsjX8gD05UrV+xExrFr/9mjIQ4DOJhChABWf7?=
 =?us-ascii?Q?eU4hLT6rRVlKbju7qwvzr1Hdi67h7E6y4pW0OVH6sOvM7EpjFbAkuTObCOqH?=
 =?us-ascii?Q?mdyTcomYDwVLCLtP7jVhoSh9OQAtSwzB0B9XFFjiuAmQJBAmc3pS1aSrzSG/?=
 =?us-ascii?Q?79qNzsRgPvIAvniglDvyhtMrC6wKLWx2b2mElaoHwanka0nMJJF2JZI7CD1a?=
 =?us-ascii?Q?k61rd6c1G+tBnehu+S7aaQVEsgewf6MR3O7mjicT9l8rg3SQ0QnWcO1I8ZXI?=
 =?us-ascii?Q?yKdwE1OejIER5/zLWq/KrgaUgeSA9hZ90cRqE67Fhd10qiHu1BwLphjDEskl?=
 =?us-ascii?Q?kQnLyeXNuA/X96Qo46xIKSrqWWM5k0twnn6k5j+bZn8ozAxr+H2Yb8NIV6T7?=
 =?us-ascii?Q?jAzBOYiNv6Lg736mS1xGSMXuPgOirX4UDqo39ornNeBPBSucL5YrPhUUIN2S?=
 =?us-ascii?Q?2k4fJZxJPn0Uj1JDsKmVbjZlAE8DpKsmia5J6mLKy6XYfOJPDQju1F3EMSwC?=
 =?us-ascii?Q?fi0EHonzs9CL5Phq6fQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e337b819-834d-4b76-6984-08dd55ff664c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 00:49:17.9283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1hwaWSDySjGx9LkrXehwbBj07AHZV1pyKpQcK5D4RZS24I7+lKW1O7OIduXCtuN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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

On Wed, Feb 26, 2025 at 12:45:45AM +0100, Danilo Krummrich wrote:
> On Tue, Feb 25, 2025 at 06:57:56PM -0400, Jason Gunthorpe wrote:
> > The common driver shutdown process in the kernel, that is well tested
> > and copied, makes the driver single threaded during the remove()
> > callback.
> 
> All devres callbacks run in the same callchain, __device_release_driver() first
> calls remove() and then all the devres callbacks, where we revoke the pci::Bar,
> by which gets dropped and hence the bar is unmapped and resource regions are
> free. It's not different to C drivers. Except that in C you don't lose access to
> the void pointer that still points to the (unmapped) MMIO address.

I understand how devm works.

I'm pointing out the fundamental different in approachs. The typical
widely used pattern results in __device_release_driver() completing
with no concurrent driver code running.

DRM achieves this, in part, by using drm_dev_unplug().

The Rust approach ends up with __device_release_driver() completing
and leaving driver code still running in other threads.

This is a significant different outcome that must be mitigated somehow
to prevent an Execute After Free failure for Rust. DRM happens to be
safe because it ends up linking the driver module refcount to FD
lifetime. This also prevents unloading the driver (bad!!).

However, for instance, you can't rely on the module reference count
with work queues, so this scheme is not generally applicable.

Jason
