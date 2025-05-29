Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11426AC775A
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 06:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4540C10E27B;
	Thu, 29 May 2025 04:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RL8pq6/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237A510E27B;
 Thu, 29 May 2025 04:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748494695; x=1780030695;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PjpRJed9DMcL3BGoPW/anQjUGVpxw1rGE3oNOvIZ80A=;
 b=RL8pq6/tIZK1Lv4BPdNJxWfKFK2/Ylg5xCf9EzzK2kFwRGfpAUvfHJt1
 gg7AWr0q2cqnaNvCMGOrwz+fV2pATCFVBpZA/C2d//7shATulaPLUYuIo
 YxJTo4fEcucyQc37UxO4/F2xH1FTai4GEmK5GqTbdlnnClmqgTBNFFpfw
 iZSXphW5WKtX3WJh7jFScJOMGKzfckVXEqPHy1WtLnzvfIf25g29nwJBK
 Fyl0kR5ykAIYoRnbE0RNQO4hsduf3bqt1pYTmDgiG6nxjdEYgrSHXGAf8
 0lKteypK/AK8kLXroiJte6PueHZCf/EyJcM+B7BNLpGdS5g5xUf9WPnVi A==;
X-CSE-ConnectionGUID: WxzGdUjTTTG1ondLxquN7Q==
X-CSE-MsgGUID: TXeoLZjGSECBxDvi/45MVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50598252"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="50598252"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:58:15 -0700
X-CSE-ConnectionGUID: BohuW8BzTmW9FhOno9Y0BA==
X-CSE-MsgGUID: Kk3WVZ07T3aZ/UBLlC6l+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="148314447"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:58:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 21:58:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 21:58:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.88)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 21:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeqXDSL8y1UhvOr7LA/HNrjbfc/9uWCR+E1tYnMyudPmiho//tsUghcxV+Y31jh2hVQfrlzyLoIWwQYGeQa6sLa+VaIcjW9VimOMhuiGqJx84B4Lfzw6wG+6OTM81lUHLeZyFUkXr34Na5uFGJwphQwLAtELN0dFRvn6+7p6Hk/EQC+Aq3r1HVyQt56igqC4/aLISdxNxmsPwsyf4+0NXDQMcxZ8UvXHmXYB2zVE41ws8LYyHRKjvUnQ8apbs2mbFpFlLbkP/Je2EOGspnQ7V891z+LkpesoewNmHETp1H+yI7wGlAmFVMC/jxDuIr4Rctabw331cYOuz2hcFgMWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uyo+peH7qyJSYmAcaDiHPvGTkWUBzj+pAGTPWK63iOA=;
 b=OJnx7iPK5JqG2qoPzC5lg6mTEVrPFs4Pw8H4EIQPZlsGsUNU0sspAfyPPSX+6doH4jowmSL+uGxwUbeiymVpewioiSvXFjRYhqh8/c+tOdSfXv6235kuj2MXerdtK/AG55wAMmBddVF8Lr/r/X7oJ8CxhVGfZ7E6enOQNkz7/Eou4DTfhE/saSkKdHmsfbp2Pvb3Ws/qLcu+wibcH96D1OZPeqUtLiwELn1YFPBaC+9YaXpjnYC31O3CM0o5mtmySw3itdOEKtewLxT76Y1GucDK/UNJv/f25VrKBlJ1hotOX8Ecez8wEBbD+PTwp5HLfe0lCLBgVYMmVoxTbYRB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5192.namprd11.prod.outlook.com (2603:10b6:510:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 04:58:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Thu, 29 May 2025
 04:58:11 +0000
Date: Wed, 28 May 2025 21:59:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Pierre-Eric
 Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>, Philipp Stanner
 <phasta@kernel.org>
Subject: Re: [PATCH] drm/xe: Fix NPD when saving default context
Message-ID: <aDfpvzSOojtSi9gf@lstrano-desk.jf.intel.com>
References: <20250528-fix-sched-v1-1-c042ef23ff8b@intel.com>
 <SJ1PR11MB6204E74753DAFAC2B34C8DCF8166A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ1PR11MB6204E74753DAFAC2B34C8DCF8166A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0146.namprd04.prod.outlook.com
 (2603:10b6:303:84::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 00bcd6f2-2aa4-46d2-470d-08dd9e6d698a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?o8/X6rK7ndDDeFcszBxTfaOXzR3k8QvXZRFNwhGA8h12lYda3F8tFnwki8?=
 =?iso-8859-1?Q?GtDyg5NHgzZKj9SDFR/uC64I5YzBkTN5X37dGR39gLqpbCiS9IzWPgrvKe?=
 =?iso-8859-1?Q?a3vyFIgKgn7wUjKxObK4hlyHIqilaam4JPvLDtSNDBrUL/HizuzymDZoF5?=
 =?iso-8859-1?Q?HJhQ+ptBJEsN6vYagFROE1Ye1RL6+2p14IqSjFlnXNcjdEI2SIweeo/SWL?=
 =?iso-8859-1?Q?bKTFaGHEjtd4DaPPGpkyYf7tomDp0Bdj88X84k54lqKABVHrg5c0h17ltu?=
 =?iso-8859-1?Q?hUOBC9vG2u/bFVQJNFVaQ6AhUnPmZM4/BGBIyjsyAH5uNQkpdt9NOJcGg4?=
 =?iso-8859-1?Q?p9dRzpnJORSj65P3z2giQ1DKUL5WSdpvDIBg5cn89iK/VOhxxeQLAV14XQ?=
 =?iso-8859-1?Q?RQx9kAxj/LZxYkvVNE+c3cF38UUytAxqMq8uQ2KxKf+GvH/LYjx3tMbbeU?=
 =?iso-8859-1?Q?RHSU3kgtYG6pbDrydLOAWKKeKU1r7pwn17VKJjO+NAmjVqnrtpCAe0VfLu?=
 =?iso-8859-1?Q?4KhVzykE8tjQlTAUrFaeJ+bw0GznMhyQMOh84i1UNGUaEPEHCHWvs8E8US?=
 =?iso-8859-1?Q?/FiXnkCjpG+3cYxBitG3c4jq+lsgqrEnYdoU6WnKffgf+rwJo3Jp7sNcra?=
 =?iso-8859-1?Q?NiZWRGRAbX/vuZZD/kkNEbxMYoVB6j3wRhcw6oiJoWEEDD67rFKqbO1xtL?=
 =?iso-8859-1?Q?Wgbnxm5Lgho8w1KgmJ7wFGn8xHa4U94GqvbuWfSu1SHCrl8mFOANx0Pqgs?=
 =?iso-8859-1?Q?DtpvjTQEeFJsX7aKyyFbYTAU/21mkIY4o3bfwO1mKwq73Hvh1s5X4ca9E8?=
 =?iso-8859-1?Q?WBotQJMWpEGakLwI5b58XktLpBpSN4M7Z9AsCIyxluOcR8Ql/hN4JGsVUF?=
 =?iso-8859-1?Q?Nr3+f5qrdba8fRLLQhtS88arFwy0+9WzWShtHS5XTDtXZ2jI4a9dAPRgTg?=
 =?iso-8859-1?Q?gGyLFXG2dOQhQruedjW2RZrn4C9TymECsLBpn9sDaPsw6hy3fOBtKlDgc7?=
 =?iso-8859-1?Q?1BxNSgqcI7mdSYjjyehZji1WBTnvqt80zk+IwgEpTUYWKZycekqFcgFnD6?=
 =?iso-8859-1?Q?3wp6jVHyvWhKVM85n+o7e9v3luQvS75qvyZJ1JjyViPK0hoaXCej7uYgJ2?=
 =?iso-8859-1?Q?7qy/ehmG7YUvidezRdoAsgSOOwBLx6c+lubnkY9gL1Cl+55uRkc+EQHAGV?=
 =?iso-8859-1?Q?Iz0BvxizgKlnSbNzLI9gPInwuPYfpzsQG7lXQW/g/DcVD6VmwNa0tYEEC9?=
 =?iso-8859-1?Q?CGSbG1FuteQHa2JbMNLcvdEVs6/bCjrWnNgN1UTDVvuzuNYVf+RgmRoK4Q?=
 =?iso-8859-1?Q?ucVW+kuf5aohKtZEWTgI+S6DbRZmJ2YgcuUfb+cC2Ap6iIkorw8aYJ1X4u?=
 =?iso-8859-1?Q?z2R6KlXMCBOO1U9OnCMftneVhd6Hy5tHHP9hB+VwuTBd5jC++YCmrbrzMy?=
 =?iso-8859-1?Q?bsoMT3GwRQ6R+RVPGu8j1hp0EZox9SIflJqeJ83Jr2JgCqMNvdu0NIKCc+?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0yWv70GLLJtXFDThGvuXt2F94v3PPdeQJZOAdVZjvfd+0vIUS5m3WPRtqW?=
 =?iso-8859-1?Q?qFzDDNIE7IVd3mEKZomDJGjPc/Klq/1IAR9CeeZaJHZZg5hJCCIsfl4LhX?=
 =?iso-8859-1?Q?r+4d/8Cpf3FsAnTiKbcLXT7ETc5wSvwRTfBSvyrb9OG22L4yPimCzU5NCA?=
 =?iso-8859-1?Q?rY40jGrEovuXM5H9+25TYczTxEatyTNumKt3up+JllNcoqLo9IRcbjh4dz?=
 =?iso-8859-1?Q?CF6KSZuFS4hAuA8A1/bU6cV8/scrms2emQkjc/8sgPEEGpcVZTpN3fpiLs?=
 =?iso-8859-1?Q?4cF32RbF6bF/e36NorgaUmYEmSDtHFdMXV4ji5e1RfsE8PUn+/m6/Pa5QL?=
 =?iso-8859-1?Q?SKAuG9GpZ0KR1h3vKInHhP6R4smIqLI/vmHp79h4zjE0Ke6ian3+JF6gjK?=
 =?iso-8859-1?Q?rdXtypOVX+2tmwAYrxsUuswrRBPntUBEy6pBLDpwIa9UpMCxsnR49MOaT0?=
 =?iso-8859-1?Q?8MxG4E4lWgpRWZRtrj7qWVmknPPrbanqjIjHVFcetqvwC0R4iu3QMAiF9W?=
 =?iso-8859-1?Q?1SWPS4vRiyaqoEsu4AxRgdXVdqd5N8t8mlj1dKBWJqpXtaxXrlZRkuACBI?=
 =?iso-8859-1?Q?oGyrww1Kj/sTRhM1mvf0V6JGuS0SCjTBb7rh912xm4ljlILOmP0yLWQFa9?=
 =?iso-8859-1?Q?3QJ7iXzKwNyGzUj4/C1bLIlI5DBkLzwe8QbEpEDgnPJxhb95AU/5yQJgnR?=
 =?iso-8859-1?Q?m0NDkzqZQM4hbxMzXGwfl14Nh97S4Sn2tVHYPFVpvRG1ZrhEj9m+8/Cuwz?=
 =?iso-8859-1?Q?HbIHyLmNnByqhza3bAd27YPl47tpWujE+MrIcYHHKbgv99eTEmnqbUjqZE?=
 =?iso-8859-1?Q?P1HRhj0zefHLZfttvXt+SB+QvKCU+S8yP5Ust6TcMuFgdieffM9IwD/28t?=
 =?iso-8859-1?Q?geaJi4pxnGoSzau0ZQt+PLQxe6m7dZvFDGKrixgLmiiMKTu0PI3tVciUIT?=
 =?iso-8859-1?Q?AEaR75pJ6x23PyweZtDHuDC17Mymb0Lb6G760qWolyI7kKJoYShZaLBUpg?=
 =?iso-8859-1?Q?y2GSlRtqutIX6fQoZHafnRRsTqjOo7FxFeBgph2A5jL+06J5ggFPu0ZShg?=
 =?iso-8859-1?Q?JOo4b9fS7xHxANRIOurRclDwy4oenle6Cp8/tCgJ8qx/tVTU7Z/l01koKN?=
 =?iso-8859-1?Q?R8CSKuK7lOEQlCyLzRib0ydvZvmNi1U/pxHrhD7SyrFBdzYTuueJBCRN8v?=
 =?iso-8859-1?Q?jHhvEiuOeWJLikJXUrqRhsVm6TcIrTy2HWT11AAEfPQ1S9CrG+ABzqXNy6?=
 =?iso-8859-1?Q?VuaILoMGI+rh+NB1Tg05QT3Gtz/XK9HokBn3fxeltVf36Xh8/9DUZISPem?=
 =?iso-8859-1?Q?PYN88mmqa5dnF8HA2fcdofIbV7kos7WtM6uUrujLhfQfN48Ea6O+3dcb2y?=
 =?iso-8859-1?Q?YBjbJ4DB2fru+R0MaJqCjPJtRpbRwyhDUeuKIr84LFYkoPv2Hy7ZEJbv19?=
 =?iso-8859-1?Q?TAv4toBoj1/X1GMun1yHvp0J3zvIb74O2r2Cr+BR0yAuwzOwSPq1R+9WXo?=
 =?iso-8859-1?Q?f90oX+UtPlMjt8aGkZ8ExxaMjtOi8Gw8XQ+FQI3DT4ewCrQ/5uVvdEEtZ0?=
 =?iso-8859-1?Q?7Flrtd2jcWQ1/9jElz6s5nSLwBj3k4pb7kanOHhqSr4IxLy9Rl5SHnDew4?=
 =?iso-8859-1?Q?TZUPFkNz7IrW4ohm7XQJ6pnXvNUvSM6L50/WD6bgXn3GeMc+5Yu16jbg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bcd6f2-2aa4-46d2-470d-08dd9e6d698a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 04:58:11.6858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSqOv1L1/4We0ISHs/kTlQWnZo1p1O9uK1kp+hMKYzgQ1W4CtisnoZzFdwmzQbxsfFZi4aFC8y2zGCgKGPxMVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5192
X-OriginatorOrg: intel.com
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

On Wed, May 28, 2025 at 10:55:03PM -0600, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas
> > De Marchi
> > Sent: 29 May 2025 03:12
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>; dri-
> > devel@lists.freedesktop.org; De Marchi, Lucas <lucas.demarchi@intel.com>;
> > Christian König <christian.koenig@amd.com>; Pierre-Eric Pelloux-Prayer
> > <pierre-eric.pelloux-prayer@amd.com>; Philipp Stanner
> > <phasta@kernel.org>
> > Subject: [PATCH] drm/xe: Fix NPD when saving default context
> > 
> > xef is only valid if it's a job from userspace.  For in-kernel jobs it causes a NPD
> > like below:
> > 
> >         <4> [] RIP: 0010:xe_sched_job_create+0xbd/0x390 [xe]
> > 	...
> >         <4> [] Call Trace:
> >         <4> []  <TASK>
> >         <4> []  __xe_bb_create_job+0xa2/0x240 [xe]
> >         <4> []  ? find_held_lock+0x31/0x90
> >         <4> []  ? xa_find_after+0x12c/0x250
> >         <4> []  xe_bb_create_job+0x6e/0x380 [xe]
> >         <4> []  ? xa_find_after+0x136/0x250
> >         <4> []  ? __drm_dev_dbg+0x7d/0xb0
> >         <4> []  xe_gt_record_default_lrcs+0x542/0xb00 [xe]
> > 
> > Since drm_file starts with 1 for the unique id, just use 0 for the in-kernel jobs.
> > 
> > Fixes: 2956554823ce ("drm/sched: Store the drm client_id in
> > drm_sched_fence")
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> > Cc: Philipp Stanner <phasta@kernel.org>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sched_job.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > b/drivers/gpu/drm/xe/xe_sched_job.c
> > index 5921293b25db3..d21bf8f269640 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -114,7 +114,7 @@ struct xe_sched_job *xe_sched_job_create(struct
> > xe_exec_queue *q,
> >  	xe_exec_queue_get(job->q);
> > 
> >  	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
> > -				 q->xef->drm->client_id);
> > +				 q->xef ? q->xef->drm->client_id : 0);
> 
> drm_sched_job_init() has only 4 args!
> 

This patch added a 5th:

2956554823ce drm/sched: Store the drm client_id in drm_sched_fence

Matt

> Tejas
> 
> >  	if (err)
> >  		goto err_free;
> > 
> > 
> > 
> 
