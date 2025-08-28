Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620F3B39DAC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 14:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE5E10E32E;
	Thu, 28 Aug 2025 12:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="s/qqx63R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264C510E0CB;
 Thu, 28 Aug 2025 12:48:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gT5xuZbQpjFdMsFJ1sqpxpgY8OsOr4VAb8l/1Ud8ywRT6QelbpzPUoiv/p++vPWDKVT0KDy6K8Vu8Pu/2ImoXvn8C4v8DDDVhFcJWQ5J1HW0TgPwx90BwZ/cQrnH6cRb2YCKRhoiWA6+VXyQhxfZpre82fT0Ne3IZBUYIuA6xcxdFc69Wc0Jhk7LJgGUEqYZwA6/cgIZpND1sQqt+CkJvrybCsviA6FOgAqZh/Izr9ryKRYTEpfKFdnk28M0S68JC7VjaO5Ems4Biu7AEcBlkPIxOfTlYAJULOUct2jJzo+L7kUl2g6ZLB6JRK6j9//eKJV8M6jQNlDbAxbeoOkOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZOcCZzkKBkWrauz+V1YdqmkMP6jxt0T8ZsI86DhHsI=;
 b=DQMRxQWVY0IF5644PhWKiZnsYT4BoKROF5k1BuVkLrM7MXnw7gUQgmzuk6omMhqUyiGF+IyuHS2X4ByAavbuj0rD1H72JdqXyhjS9CErsRbi/DHcmt4PZ74uqo4AMrG3Mxb5Vv4Fsp2noPmelvYTYVpl2Yv5/0kHpYfbxIbmwZArc2CzKaTKlxcTjtpvY3O/dJAlyK7rZMRra0WdaxleWaS6RZiLlCU6yiby34wOEYWSC8bDlGKwo7yVflqNsRVbkaVzmLUsjwi0lIm6ZKsyMNExqHMBBUOkyxJokW3Y4AdAKZJ9oR9u2WAw1Ou08sBPcpz4tT/Ql0mPXjbLjc/6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZOcCZzkKBkWrauz+V1YdqmkMP6jxt0T8ZsI86DhHsI=;
 b=s/qqx63RbJ0Js2SJVqxM0+hZF06tuMZHQN4enI/vHkBsGsZo/X1Ay0JgbcLqqk13ItOKrgqAmiTqovL8HdQ6dY1+kbEMdUpB2udk1EcY8I68fW+WPZjpl5XalV+wjP1mHapJUcAEQfVXxiGInLwhZjwwBtVFW2oOmFHzKN1WmkAvx4DSZ/6WgZGf1M4Zhsq4mKd5g754rEI/uN/K+2tUSQbbG7hVcXKcU+0mOuvHLb35TLU/UpTWGX/vnYlT8okVpItkJQKoFHgRbfRai2+MUHgy4jm4eF0dieF9SN3AxtlLce3gXMzUt6KtAtf0O5l0Y/r/X3DkyP8JiNJTSSLEtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS5PPF23E22D637.namprd12.prod.outlook.com (2603:10b6:f:fc00::647)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Thu, 28 Aug
 2025 12:48:02 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 12:48:02 +0000
Date: Thu, 28 Aug 2025 09:48:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, anshuman.gupta@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: Re: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Message-ID: <20250828124800.GC7333@nvidia.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-10-badal.nilawar@intel.com>
 <20250506181353.GA89958@nvidia.com> <aBu5O5odAKaxhhym@intel.com>
 <20250507220444.GA232705@nvidia.com> <aKjF_ZvP5-1W1tei@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKjF_ZvP5-1W1tei@intel.com>
X-ClientProxiedBy: YTBP288CA0013.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::26) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS5PPF23E22D637:EE_
X-MS-Office365-Filtering-Correlation-Id: ac92ae92-b556-422b-6eff-08dde6311fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b7TeXS19l/j2UW5goptHr/NsZoOBXS7Id6iHVMwajpqgcpdBJyTQmGdBH8fO?=
 =?us-ascii?Q?OipTSMgqi8nCixvMm9ho9bH/svBi6WjFnjE/TZEdGGKY+sP0gRuSv9I22STD?=
 =?us-ascii?Q?cpSOb7ojOxSJdaD9MoSNEoTK9t4yv9B716RbYoPj23ExFPCyr93MF2JJDIi3?=
 =?us-ascii?Q?kJjiStjL6Y3pBAY/GsitRFhfulVYfSBzZEn4hd2EFw2Dvi86GnRudbzlDldd?=
 =?us-ascii?Q?174BZHFcmu6oNjSzMoiuFfIF787EFFscT9LVOQp1+h6xRDrU27i7TnYXyxlA?=
 =?us-ascii?Q?STykCA85ZYD1OgqqpS5FsJeYDDWAIkwJrX/KjEMsg/lI0IuWmWk63flHNitD?=
 =?us-ascii?Q?W1XW/gfCpj5TUiGD1yj9pAeePN/R8Bks0rYT4fRvE2za9IfDkyeE4jdfqXBi?=
 =?us-ascii?Q?HFDUJqDPvZSMJn5Z0AIaP4nVanCMpcUGl7i6xdGqzh7O/mqqlP02q5r/83UI?=
 =?us-ascii?Q?BXxFk6ztVAoqspwRn2dnJLlABeHCxUKU+TIC/dwpWINVxZXKXPazF/5Bp6AJ?=
 =?us-ascii?Q?95rwe7NOLI8LE4nWKCf5xa0mxDht+YvguNTr3McW6GVNw4ovdwA5zb6cJ2RV?=
 =?us-ascii?Q?FlX78vLBcl3qB/Q0S2W/u92DvG8WGanrGw9Ck0WyAsV0b2qb2eT+d32od5fj?=
 =?us-ascii?Q?K61e0fvanfn0K6xVHPWGTXOGHc0mdTU9OLvGbeAT1aru6G71NsuQQxU8I3aN?=
 =?us-ascii?Q?gFKxtkSVLhSyVnMahnaIekT6h/V00H90LIJPgPzwWzkik6HPj0MOwGAHKOGr?=
 =?us-ascii?Q?Q2y0A7tYV+eqX8fdmR8u8xBRgrrysg2XLoQZEMG6p/rwy3ESLSFvw9wXktfU?=
 =?us-ascii?Q?wnUJICahUu49IAW2+bYQsX0nIsl4WePNY46VS6iWW81Y2L6uPMAMzYtA6SWf?=
 =?us-ascii?Q?Kqyue5q8sgS8K0MVDVQjFT9Bl/WN9sWoDxQ8BcHKmztFu5EKkFk/ZrCqOKlT?=
 =?us-ascii?Q?AQ9l5LMvpgFnAyB4Dwrcct/itnykyK2Y+Us88sGM2ir8vNMDEuEe97JtbUz1?=
 =?us-ascii?Q?CuUB7c5lie3nfX2elYJIf+eE/lpDyzWaM96MFykEUUZ0ZG2z3XhrxdlRPV/C?=
 =?us-ascii?Q?hbyhnbjG/4P2wg5jnz885c+BN5GSy+/xuA3DYenwHYxtml/eTQuVxT9j0w70?=
 =?us-ascii?Q?09Wd5F6Wf2FBoP3DsO1xeL89P/q++06dHPihJTYDMGuRAP8UPrtHH8JTlcjX?=
 =?us-ascii?Q?XDi2EQ3TTOsjeIqvQdQGKlmGbmyL0NqMmAeov2DSqaSLWzH3y+tumn3RK7k/?=
 =?us-ascii?Q?vWGTJH50SLHmMLDusEwpgQMspyoktF5Ud+SlIggk295dunbyOqoZzhgQg1T+?=
 =?us-ascii?Q?X3LFoEGCKjkepSk8Vlyf2vn31ye1vC+uRDwswf7r19dj1emfhmgPhNK4G7Mu?=
 =?us-ascii?Q?nV3CbN99ELo6G19u3iJRMcigWNe8z2ncRBiCKLYfRGHuGTwzJzCFh8kxbbPQ?=
 =?us-ascii?Q?CcLnJnZz/us=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gDEHIckgglYw4mxR+pdMTVzSAyb5fWluEtIm3b6MRpU/YTCKhH+v6TsL1CID?=
 =?us-ascii?Q?9A5vUGShLDb1FRSQ1PWicJ4P33lwocZjT9P1ZaB+ExDqMUooSgAEW8mnDLtU?=
 =?us-ascii?Q?XgA75tWxz4RMQwQRWTdTlM8o8gb7WDoRcpZPCCPF/q18sW49OZSw5RxuNn/I?=
 =?us-ascii?Q?/bGzwkmfn45yqYJVvFlxCrY2hxv6b9wYbWoZoUdaErfUtTA1vWNSr600E57Y?=
 =?us-ascii?Q?pZqYPIicT4Z+iwHj0M9AITwcUJcQOtOCarzyDzpvFeMof2HKmP2O8QohCGXm?=
 =?us-ascii?Q?aESa+7HbzW4W5Mu0evaj3S4ZuiHFFiTfjRVMKTRFnGEFes1klR5/ytAsNmeh?=
 =?us-ascii?Q?gN6iQsbQzpyq+mtqPBmxNAU+PGV4bYi58a6lf3egeO/5iW0eKpNEKIfQ1xsN?=
 =?us-ascii?Q?iRZ7/u0FgQVf6vYb9witcuoR8+Hxar81uZdwhoXR5V4+m01kN5u3SGGxF3fY?=
 =?us-ascii?Q?S07atgDfxGghE2xQNPb2zH/CYjhB5gbquGuQBckTie30TnIZo7DYSigq+vwH?=
 =?us-ascii?Q?xMVtK267MVxkBh+owQkwVt4N4kpQwnTRn1Jf06A39VgGdq3WDy52dTmtGuWy?=
 =?us-ascii?Q?TroYb4WRBth9W95qkLUI2yh5fe5+gtx2wsrfnSGQ5Sp/RmB4+h20AlzF28xY?=
 =?us-ascii?Q?JwQxCiUb0L0qWE9ojC6HCW9QG/G9SOXOjI66fh93Z4e3ipMLlJ4l9liPSZUA?=
 =?us-ascii?Q?AkTVqp+NxmmpoKqXr1YdmZlsUeZIkOP8RWk+SpxK/88e4R9gl1Efp3wAyQya?=
 =?us-ascii?Q?k0i4N3E6QyWP4XJn4G1IjdB7sGBD9WUAAKFVX+/9AC7kzwX2r/0K/tEsJY57?=
 =?us-ascii?Q?980v4F1BRDePMZ75cjFxX5TlGmiK+sCqE8ZAfmwRgWomhBNAnyeFgqIiMtrX?=
 =?us-ascii?Q?NAIgzMqP5DANKykIohZ4AlOQkBTd3o61G6OuDYMpEvELMmrM0AWNUXzXS4hk?=
 =?us-ascii?Q?BsAkUwHUk2UWeU9eFFKSwo3TdeswP0FI5onBSCjEMkdyvZrRut7DbAdI/2NQ?=
 =?us-ascii?Q?iLE5FB+mEu1o1OW6nYLJD4faDINlpKI1y5xAtGqem4CvF5DxNaDHM8Ipn3aW?=
 =?us-ascii?Q?FFWqbUfS3igCJDlfHJVt7n3KsOb6AVMzHgdBnmN77PdwcxybmeDa19tN9+qc?=
 =?us-ascii?Q?dyTLRs0fZSQDXUD3GJhajfEsxJRcsxll1brV/iW5bCof2Ix3UqIN2nTY4tEX?=
 =?us-ascii?Q?dB36iCp09LQJp0yCYZaeqy6BbJrOhPmmzChI9Adnatr/stH8e/38hQU8sYDV?=
 =?us-ascii?Q?lNpEzedRaGmc0ExTiW+gMjMOZV0ML5ZugqKIS5w9m61mGynMXZR/pOOMao3g?=
 =?us-ascii?Q?SbHAUsDen2D8w+TU4DdNAFPLd8WnixJi295+GabNZf8oqn36tHf37UObUzYP?=
 =?us-ascii?Q?nEnlieFyoG5WVdwX7+AN4N0WiPRH8e2uFbJ7XB4lhq5JpZ+HjEGJDCT16Ofe?=
 =?us-ascii?Q?FY9rZoljqPj5H5JIlwWrPUVwEXZvRdT3hsJV4ZyZft6jZrX/UxnjmhydGtTd?=
 =?us-ascii?Q?h4szycLXIeoemaRo7qSNrwcu8tBM8UX6YBTcE/op2JSlXtcc9FDIh+IXymzM?=
 =?us-ascii?Q?mQLS7R7W4EtxBaXCgjA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac92ae92-b556-422b-6eff-08dde6311fbc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 12:48:02.1718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gd6pPIew6mgu0BRTFf9pM3PdA5rv5//WYd9xIOqYlxqLn/9OJDZcV/NJgoqtUjtD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF23E22D637
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

On Fri, Aug 22, 2025 at 03:33:17PM -0400, Rodrigo Vivi wrote:
> On Wed, May 07, 2025 at 07:04:44PM -0300, Jason Gunthorpe wrote:
> > On Wed, May 07, 2025 at 03:49:15PM -0400, Rodrigo Vivi wrote:
> > 
> > > One last thing since I have your attention here. Was any time in the previous
> > > fwctl discussions talked about the possibility of some extra usages for like
> > > FW flashing or in-field-repair/tests where big data needs to filled bypassing
> > > lockdown mode?
> > 
> > For FW flash I do suggest you try to use devlink's firmware flashing
> > interface. I think it would be really great if that could become a
> > cross-subsystem standard in Linux.
> 
> I took a look there and I do believe devlink works very well for fw flashing and
> it is also already prepared for basically any pci device without any change.
> Thanks for the suggestion.

Jiri also has generic plugin for fwupd:

https://github.com/fwupd/fwupd/pull/9053

So if you do the kernel side you get a whole ecosystem now..

> But now I have to ask you about 2 other use cases that are not under the
> umbrella of: configuration and provisioning, but perhaps at least partially
> under the umbrella of debug:
> 
> - In-field-test-and-repair
> - Error injection
> 
> Can fwctl be used for these use cases, supposing that it FW mailboxes
> commands and responses directly with no modification to the fwctl
> infra itself?

These sound like what fwctl was intended for, yes.

Jason
