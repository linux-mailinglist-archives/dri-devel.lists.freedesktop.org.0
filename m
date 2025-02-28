Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C62A4A21D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E5E10E32B;
	Fri, 28 Feb 2025 18:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g1tDRIDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A194110E328;
 Fri, 28 Feb 2025 18:50:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGKgVr9NQZViwRHgIRDzOLoAa0+Dn6YqBy86BwzZzS75h9i4jS4Qg2jgly7P1kilT1kPyIiB0SFXAbHTUm+pxq/4yitqm9zq/NEYC1ULGcGw52/nDi9JJ0qfBJzHEkPoaEaANsya7mkmuPd+y/dcpPxE5E5sV6I1CN00KOuunf8WHoZcN19pHDxY+mgfXRv7t6drEf9rUMe/IVafMEZCA2LYT3iDjRm2G9lWcB8cUWD+3v4FS0vNyY+KkrDkA+/zqqtILChLgaP6d3EhCOLIJE/kYhq5bIzIHf1BYcoRieXirOUVWLhSVXqMRqdP2JOjVcb4MZV5FLVUSRE176rvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rE3FlXGE2DpKIZ0xYRSdWbvOCCLEsyMlhrCelHOu40Q=;
 b=KH5QZ51q0iNewszK10jU+73S11zhweH/AtIBfIa24d/IH5JtCrLkOHIMdh9+VtzbhJQiS7Far/lguT4mOk6FQEB5H7rwmUyXPyqp1XDpH2/rMP1XsCUitT/W4JmsWpgocmjd/g1GxEUW0bJ0sbf5ajl3BZhxhxs7tecPNk75rTdR+7+ta6QSsbLkRbhbv8712t8J8Y5eALI5lwohtpDorAGG3SF0lrxEKpDfFbIugsM31nMNAl5ViYQx/Dc9CnEUCDDXeAH1TAIAL7Dv3cpN2vMjgzlT5obTFcvgM4iDKZ1O3ddKFQB6x/xWmE41v0zv6hLDLH79yPR1QboQXbF4PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rE3FlXGE2DpKIZ0xYRSdWbvOCCLEsyMlhrCelHOu40Q=;
 b=g1tDRIDJ8i+drp+UWErxObKfbPhwAKmEqbnuewQ6hos4hn3X8RSbyAiCW2LMZzBA6S+KxHilYZshG1HzrrNjCWzn3ZdJctpzd2QNyqBJ8C2HG8gJtI14H6hvCJoIKDyYZrNsR2iWMkid4pysuYvPiMuspch3PY5fWt21fowsS/3wzUuZ1VeIj5QotTqVAGHxr5Ks6b5RQVXAZJ5IZrZSSMzmbMjskiu52kifdGjkZHazs11ZL5S84Rh/xhGTp41Y9RFs91pJgOilTdD+2Si0pYIQnFdXxlj3oclsiq3os9MElAKqjxKLQpfWh+YPMBQ9Y5OJnPvEVo1jpuhyKV8Gfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 18:50:10 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 18:50:10 +0000
Date: Fri, 28 Feb 2025 14:50:08 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dave Airlie <airlied@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250228185008.GG39591@nvidia.com>
References: <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <CAPM=9txrRFOb6Uzm=e0S6Tfxmskm4zwAZgsWnkvCzxN=XCZ6Vw@mail.gmail.com>
 <D83LT2GGLT92.FJ3H552P6H7@nvidia.com>
 <CAPM=9txOK4_uVvmb4bWirBVPNsPoPTiF0NMK_FJTd1NuY0Y5xg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txOK4_uVvmb4bWirBVPNsPoPTiF0NMK_FJTd1NuY0Y5xg@mail.gmail.com>
X-ClientProxiedBy: BN8PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:408:d4::12) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW3PR12MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: 95881e8a-0b81-4d6c-333a-08dd5828b9e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E71p1TzczpRqCPM1scA7FJEUIbCuUQqoVDqSndlUvTUQw/GvdUiNDQIp+XX3?=
 =?us-ascii?Q?9KLUg9w5LYcdFsqI1ssAn/8iabNBt0ieI1NOYlfRkhBmZf8AiG6avSaDrr0X?=
 =?us-ascii?Q?nu9mxyUHGCWOp8dhf+gaI1IocxuCPnk6VZ/zwys93kTPVKUq4nKIQVqtlFrK?=
 =?us-ascii?Q?W+UdLVgYR/vfJUXbyeFfpFC21uDIWUVuz2Gq23z8OItN0uRb5uDp/78fkVCz?=
 =?us-ascii?Q?0l9NRPVBXCaLSWL/1MuY5j0EBlkCjzO2LThiHHrLdtnc9aT5SlI6vVmmkoRY?=
 =?us-ascii?Q?FOLnffqbkYjSyrc2PoSAQCHP2VjNKraL/QDN6ryO6s0j4SDNo6yaR1o3xVv9?=
 =?us-ascii?Q?zqyTnuff2pDBhmA3EpVf3KPSc/k/zRfUm4jYN7cEFbzmxXUYzYKB8wh6AlXn?=
 =?us-ascii?Q?oqpR/6wo1QGSfUYHUSbjKORuBFhts1zT/mavQ3/wCn4lfY4D32lPXP1haV06?=
 =?us-ascii?Q?PJpjQdQ0nchEg4OCAXg6df89W1DS1ydBPWEHFOxhEcXtFLYUYBdNE0QuFeR5?=
 =?us-ascii?Q?1xS9rBxPqhkkno4jgVlWG2lZ8GWQsVy1kNw2wsjpyj+KG+4r73op7mFjS3c4?=
 =?us-ascii?Q?NCxkbfWvuLKkiXW9T2DzVWfeO6pVOXZNHl6Pk2VgsyqPj7NQ7HLn5oUOOML7?=
 =?us-ascii?Q?geEk9DW2OT3XbcVyYDT66xerbrZjfAZq58sFDTvtDe8dUHrHNgdZhYF1VN52?=
 =?us-ascii?Q?XxcbZKT4gEVE3S1YLTlmyS31mP9cwtIDQBHaJbb2+NOs02bqUSOjsGGTDoQ2?=
 =?us-ascii?Q?jVkgGFyKIJh+xNdZJrCW/6JXMRnRLr2/bprqXco9/hy73/BAmw4dXS25UX2P?=
 =?us-ascii?Q?NwiRJyTKsP91CGAkj3Zz0blrHklFHMdtz3FqpG2eggIpNY9UJAnFe/HHkhjC?=
 =?us-ascii?Q?fY4afPZOOawPvCjKQuLIgoJaesh54DranSI3cQ+16Tz3LMvk5fvQ+L0Jp3jQ?=
 =?us-ascii?Q?lTV+Ro11g2/wbNUpij7f7q59fKdI+wr4nefkPVEyKnm8MjdEKdqeHmYdNqbz?=
 =?us-ascii?Q?joZTVdAvA6ig7FpNDue9vZgKSRA0NMskXs/eZ5gONDcj72OKLOozUtDrUYkP?=
 =?us-ascii?Q?KbudwBkM3qVZSnv0NgYY6e0drJzGPvTjchUhexbt97iryAFEESarPljCYgfp?=
 =?us-ascii?Q?ff4c97tCMxHiyY+ulF5dxI+0UQo9RKBXnk6/AUZrso/nDJGm+mfYcEzPO2RA?=
 =?us-ascii?Q?64WQl/cPFXnixaRkTP2ntCLt7+dViltF00caWXVv0DaMT9G5wplIKugDbhU+?=
 =?us-ascii?Q?AmLR2OiaTR/F4Cgl1pExiHmXtyjVYzxJURwzxqwXlgpvPVVwvIUwfj2Ds1/j?=
 =?us-ascii?Q?mAwDOVvwWix+sF3DTal1uFdUKc2+i/YFmxAT1ggei38IMKEtpb128+DXWHJb?=
 =?us-ascii?Q?PS9Dr4SmaCuZAOnyW7TdgfIcTRkh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vl36+i15uzYWIYs8baCAKBxA74mky+35HGBokW+ILtiy+kt55+K/ni8zSPnP?=
 =?us-ascii?Q?wKqbBmUc0BNp10CyAPJE2JefEsGaXBYw0jvvppKNJwy2AWj+IKj7zbHKKQLJ?=
 =?us-ascii?Q?c3z4TVbDVEf6HetYZTsQJAzBAXCNsQwswUkSfbcpN1viQ+reU1hBG+QMV9O1?=
 =?us-ascii?Q?v+L4D9NHvHZDRAqn+0HmVBWwzT19yjYK+3wBfUxYqUu8F1YKAe8Xqeoo0Hhm?=
 =?us-ascii?Q?dmQt+5BcT5YwrkzoEP0CgUeUneSWzDl32cmwhPHA2ByhlbqGfxcFyvyhC5kJ?=
 =?us-ascii?Q?DHdxSaY6QFE2dwpNG0MJG6KSobLGw0J+dRmi9nyVMw4g1C4VAO7mlQSRMszH?=
 =?us-ascii?Q?m+D9KyikO6zO2VZfzxQPk9iHshaxOj9vK23qzOkyceyiqHuOGbG4zwJ9pAqF?=
 =?us-ascii?Q?AjjMxVQvBvgR2mAEXJh2SpSOoqbvOCRq/pfrE4X24nFcssfDHnbbeNi3dufB?=
 =?us-ascii?Q?WOvQTosMGeld28U4ngcpkSt27zLvU4iZzuOSe7zKuzE7Nx66fa/6a1b49SMg?=
 =?us-ascii?Q?Fr8Vn7FXnUoTVbXkhCqz6Cpgo7sMfx4MpHjcEvT62SjfB5i2AadVN0Nka5k/?=
 =?us-ascii?Q?WxcqV9lzwA2FDX/8GOm6KutBObM13S1+i2sJzArRzhUlVh1mzknFnzMT/8bg?=
 =?us-ascii?Q?XqIHK1XaCx8nIK7yUHnxIccXdSqacjuA/U2ILSbLRmFAIe6nRGNTJrBNcYBw?=
 =?us-ascii?Q?DSNclZIvHww2gn+/oNJ8to6Og09XJR8A1b8wJPT6ftPMH8eGw84K4hVANuq1?=
 =?us-ascii?Q?CGYXWK08rO4UWcN3N3j9NizvBFlIAaTWv94Gsm1/j1uTmvsNFINJ+qfF5dCM?=
 =?us-ascii?Q?DRr7OpGGzZ1un4mYVb8NqSnaTintK0x50EkjoI61UjQCV0O9B+sRwbfwOHKa?=
 =?us-ascii?Q?loWbMPYJGDYEyeL5cGH8XznsBS4kKIf5OY9S6hRxxloYhVZRG7Z+dpUMxQxp?=
 =?us-ascii?Q?5m2tH/0dB8x0Xsi03q0SsTINaY8nlROaOEd/+RfUZg27cWQUqlsdP29FXo6w?=
 =?us-ascii?Q?A/jBYLxd358OHetmxFx6n/oc9s9htPyDX7PBnPQoK8ESU8liVy8E2KmK9XS+?=
 =?us-ascii?Q?FLJxcrF8XyFOOk0p/5keIUdohF+eMktKFWJgN/jIJIj4AJQLiu5pUEYwRMuB?=
 =?us-ascii?Q?Q5bPpGY7kB70J4mslC3AGi8PZjL3KFR3wB1ZqPhhwKRQq2ny9Aa/d9VThIFj?=
 =?us-ascii?Q?Z1FVcmj57COXDYeo0TD4HPsFTQRWEQWUsXyN107bwntmHb7qNrz5KOUXqhjD?=
 =?us-ascii?Q?nXKEogpwQ/YUCoz6056HaezrCxtzGEN0Hybk/IskLkT2KZTrjof8agwre0k8?=
 =?us-ascii?Q?WC8DeL9bFJcxxb7LL9UdvLcLcpFVrPkr4wwu1zkMYWEvhSvo6mMeXc//NVYD?=
 =?us-ascii?Q?pzKmitZpyeROXS0750hM25ypeXEIHdM/H+AOmWH20QTawhabmEf7sMy/GBQk?=
 =?us-ascii?Q?6UUiQYuwKztQpqBpLBeFklgVdu/ChzPWpb5uu3pPsWEva4HVCHAFEqWBJoD3?=
 =?us-ascii?Q?V1Fg++tUPhAnmmBohg7U345jYK4WezR1b2qR6ssBx7U5SP6c4miClqeIRmCn?=
 =?us-ascii?Q?qkgmkn6bA6fOUQkAEcm7XRxGOfGau08/eNb6j7qk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95881e8a-0b81-4d6c-333a-08dd5828b9e6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 18:50:09.9499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: os9oQS/lf7Ze8LbCMNH6VQVfwDzQUBUOGwg+B2vd45PRqxnQvcOSbM5LRE7SZdlk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4475
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

On Fri, Feb 28, 2025 at 02:10:39PM +1000, Dave Airlie wrote:
> On Fri, 28 Feb 2025 at 09:07, John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > On Thu Feb 27, 2025 at 1:42 PM PST, Dave Airlie wrote:
> > > On Thu, 27 Feb 2025 at 11:34, John Hubbard <jhubbard@nvidia.com> wrote:
> > >> On Wed Feb 26, 2025 at 5:02 PM PST, Greg KH wrote:
> > >> > On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
> > ...
> > > nova is just a drm driver, it's not a rewrite of the drm subsystem,
> > > that sort of effort would entail a much larger commitment.
> >
> > Maybe at this point in the discussion it would help to discern between
> > nova-core and nova-drm:
> >
> >     drivers/gpu/nova-core/ (under discussion here)
> 
> nova-core won't be suffering any of the issues Jason is raising,
> nova-core isn't going to have userspace facing interfaces or be part
> of any subsystem with major lifetime expectations. It has to deal with
> the hardware going away due to hot unplugs, and that is what this
> devres is for.

It will suffer the general problem because it provides interfaces to
the nova DRM module and DRM will hold a reference on it's 'nova core
object' till the DRM file_operations release.

So you end up with nova core remove running and being unable to clean
things because of that DRM reference, even though the nova DRM driver
has completed remove.

You could wrap the nova core reference in a devres, but I think that
would be objectionable. :)

Though I expect no module EAF because you'd be direct linking..

Jason
