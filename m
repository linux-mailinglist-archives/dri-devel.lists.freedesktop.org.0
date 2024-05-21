Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA098CB131
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 17:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CAB10ED6E;
	Tue, 21 May 2024 15:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0cxT4JT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A040D10ED65;
 Tue, 21 May 2024 15:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716305174; x=1747841174;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I5CJhnnCSBqe1QFHSTltH4qOuyAuF2GRwv2Hi76gLSg=;
 b=T0cxT4JTaVr7wuPrCASIUTAE6IIY36ETJV1QB7kD8QxFOhJIZgSy4MLm
 qPAQQvHcR1PVWA4OvRWWTAHON8TS/cDzTtcgv6hITXrg+OE/r281oEyNx
 uh+hZQ8vpR0VGAhHFnOKARdRTtoNKDkmiAIb/V75PYzmQ+Ov9Mwg7z9je
 Smts8ysqrXFlIbKnYJA5EEhYkXzc4Ovd3RmHDr/nf6RGOcW5nQ+LgVKcT
 vuz2uokGUQJ2fjAw9+9pvJ88b7BpxFHDai1GOElmvH8UM3OPsf4ilX3fO
 kuoJYqMo+0Bl4OcH48RfYF9QpjXfMaUXQsvqdNXfvXprir/Rq3gV9D/DJ Q==;
X-CSE-ConnectionGUID: m83p2fKyTZOPR8n/CVrcdA==
X-CSE-MsgGUID: 2Vii4vUpRzSccva97Ci8IA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12736867"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12736867"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:26:13 -0700
X-CSE-ConnectionGUID: FTpR6vWhT4eYI3zADnbrHg==
X-CSE-MsgGUID: vpe00nChRXql86+7QoRkuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37542181"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:26:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:26:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:26:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:26:12 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:26:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpUgJ/IUPKF7BJBQVJuCXvO9edAhWonDNFVbOgvDxQPBhJuz9JKBHspbBOMhdtT872VIO6vqKrxYhpZZmc61XRd+jGyNWTRh4yJbvEPmlV0bnKWi3bxvem7xTu3YO/C1ay0ZP98TOeiuoFX9IjAmb8zmKRH2sp30p6xADWT+yNyKJ1JkLRtjR+XcWfXx7BrGKyp9b743f0Cc+hpnzg0TFPlzlCL4JTfVSHcVw9rsuiGw/sGN4LfAO6Up2jW7nFk9IHUV/Vq5MdJHdpGINABgVcbTYFDl0LgGFQcSq8vASL0Ybr16lp+ZPDhz0PPhmcP6R4ceHef/IS953ePzGYZqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5CJhnnCSBqe1QFHSTltH4qOuyAuF2GRwv2Hi76gLSg=;
 b=QVZS9rghMnEh7USDECLFnBDiaFrbxq0U7Cy/pR5Yu3azfaltBUEGXx44vfMplf9cZv4AGUcg/Ek7pL1ClEw+38M8Y/cxkgGyDwB586D/BM/B7yC4XcC97Ba5Tf+xsrmOGiob5ij5IDG1vHmTioOM4eGQW9zWt6U1HwgZhqNlt0o9dzEWrCrXazp3CUfGhHnOfkmtnjy23QmfSdzXiFPSmh5fYT53V+UF16+zCu8D8nqaAhwXGoQe84GZ9MQzUPZaHipNQv98bLk/GxrRUntkx1L5ol+tvUXyNblq2nnH9/ABQohWD3PuvCDCVmwtyupdtVPBWQXucSNVochTdchBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7810.namprd11.prod.outlook.com (2603:10b6:208:3f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 15:26:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 15:26:09 +0000
Date: Tue, 21 May 2024 10:26:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: FYI: drm-intel repo moved to fd.o GitLab
Message-ID: <lutgryt5og2hrkoh5fjp5lmuq2ynksjwxrjfpl5brkob6pujud@zayf2voxtcdp>
References: <adff92fd559f6798690e3050b4474b099a3dde75.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <adff92fd559f6798690e3050b4474b099a3dde75.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 36902928-e9b6-4563-6914-08dc79aa5718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fyX9TXgCvXavDeuBD+pJZVb15gaKzUeeXtHpOKxWsxnxp7xcUWGHNT4furCQ?=
 =?us-ascii?Q?DmK1n44C12pNWndiRUtJaLgvELbz1wdADdukBvjfgxouAhufe3Z3kAYllBlR?=
 =?us-ascii?Q?PjxOqVoFDUgdC5pgkKYWYZbkVXHGiq9ZskNzbnT9NNtdPLA0WknlXifympK1?=
 =?us-ascii?Q?qPP53y9CnjCfPJ5RbLh7ZvgrQdbmE4ka3/bICgfqSH/zbb9atiL/ufhnyJuP?=
 =?us-ascii?Q?eNY1UieA5bASwCtVSI7tdpRbtcLJ+yf51EzO6VuGkyOjMD1gCeCOLT5e0PZm?=
 =?us-ascii?Q?RZchRjcArhE51QbudekZogP5JeZOkfV++wtoWWgB/79L19gHQn122DoTwev0?=
 =?us-ascii?Q?pxiSKLNYPzqGnDImcF1gvsdm72h5200xbLoZq6Rw35mFPbZwvpOQWBXDN6ug?=
 =?us-ascii?Q?1bPfxh8edlbjDyXrV3EZvshE46oQUJbFpg10oBQ0l7lT0OTrwrK5BDWzufzP?=
 =?us-ascii?Q?VqW3Zm0Zh9hgHggfxumVAcDd8QizFc3+9GzyotB/LwH5s68wNRrIiOuoL0Gq?=
 =?us-ascii?Q?mrL1eGFqbg3Qm8c7pc6TxLr07564vBJwGL0UDbYgbrsdhhSziq22fr/36oMR?=
 =?us-ascii?Q?uVvYSQnxww2AOXzpB4cELJmdmFB3Be5mxXu7bKl1nvfo6G2uG3ofkMYGia7o?=
 =?us-ascii?Q?nLsM79lOL5rdmcqY90tD+xwhJzoIxZX2DJDe90ZBSDf7tG1ftppDBliPj6lU?=
 =?us-ascii?Q?BFt3/N4Ew4ljCYDjuN2GbJ3BbzrT9JsxLEmW7ctj8S/RbJN4UhqTZAtY3C6F?=
 =?us-ascii?Q?SPmhTDB24I8Y37J2RbQwLwKAU8W1GnwpR3qUkOp+k59UdZ3wMeYy/O9rdVhE?=
 =?us-ascii?Q?ImTkYnwvOHZ+JET+C9W1lJVb2YXty1m8lkH6GglAw87jEMq64QUt50lslHdk?=
 =?us-ascii?Q?5Iq7Dmoqd0zJENZRnMk9aJRCQxshuUw21aSoE2pTM5nG59yVgnHya2qtZp2b?=
 =?us-ascii?Q?sROi0vOgEkVCUPdQ7pZP4saQnI37QcGFRHU51lPeHhGb0xLKYOO5w8ZXh/Em?=
 =?us-ascii?Q?64MlAn1Rq1wr8Uvjq4YjPJ+qaH2e0BKmQHUEoPIl6Ygwyty8hk+EgP95/0Mu?=
 =?us-ascii?Q?+iLTbGYpKYJV9XJXd/Q7kZfS18KHOpymbRmg4Q/sJqdVw6v5AYYFmFkN+Bbm?=
 =?us-ascii?Q?V6mRx2//LZrhxTAf6uxGu3MHWimeXL6Ao33K7BQT8B1968A91IIBEWgJLLEp?=
 =?us-ascii?Q?uC1grEq5HlFgN4Puqm1rZDsi3MD58hmYSqPVs+s0zTmTwM6TdSZekPbZ1hs?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dCm+2wA4IZvb5CZlpXMoiv8vbq1AMjDkzQaeTOeHtkComV+vryODYQjniQ64?=
 =?us-ascii?Q?92Zp+PIvys77oTL8YinYcDHKCm+RRs5rXIvlkQ+WkSuUJ8XB8q+OeVVTUzui?=
 =?us-ascii?Q?dhYCqtKqsEynj5YRdVnj5GYgn8OVvrXRfb6yOqtJDGUUHByLToWNRWxSyi3J?=
 =?us-ascii?Q?CVfGe2eHTyQhlogqHwWih6RTaKpzvsqdsnTKR0GwB8M179aF/oYzjmGjQ7z9?=
 =?us-ascii?Q?sXQ9vLUnRUO4M5sKpKFrC6S8vS1gPgsm3mGWs3cMdbtw3CnEMm8cY6wdYDwG?=
 =?us-ascii?Q?5mc0GRbPf3QZeb3Nm31e3lDaFrrWOt6RkRFnim8u8kqoQp1qlkndqBp/7cFH?=
 =?us-ascii?Q?jyMDdtqYUymhDJLfUotFFqvlLzIkX+pp0lvlWhL2vOx0AYS5t7uBnRGjl+D2?=
 =?us-ascii?Q?ckSULhiwP/jlWkJrLfXzfnUd0FzGn3dmrklkxyluvcsfZaS7d5+cGG7sIiG0?=
 =?us-ascii?Q?fyjR92NKUzwzFx4eBUPQnRSpjS+qP6WaUTUQCXLRIKeIp/GHpseJ7u0qYwlt?=
 =?us-ascii?Q?2VZizZe+gtggTrKFDa1dca8eZnBeQkRmrlprZtOqTZndm2KPI5MUtlC8nt6C?=
 =?us-ascii?Q?scOo65+2TL1FTJVZI7JER0CrIOIs0fl3l/a/5GU3Cah584XV+aZISxzQ+DdY?=
 =?us-ascii?Q?nV7zolU9Z2Boof3LilUUidhyfGNwKuekIOWQ/9Fr26mUUo96eN9H2cNKS3r8?=
 =?us-ascii?Q?bFkPfjz7KpFGfOXrK2emoQ0k6e1wTL5bxBGDix2pYbuwS97xPzP0tD+TQ8gk?=
 =?us-ascii?Q?D9Z9NHB8OxFIm7ZJwAUkMb9mC+E5kjBXl/EyisImP/mesGSeL9ypAGZA9ubJ?=
 =?us-ascii?Q?fA3lB6etY3jQ+YgJevsNhP6F72GhuSKTuOQbXrl4Knq2ajITVhU31W06Wwi7?=
 =?us-ascii?Q?pFQxsyVy7VXrGhGGuQcIq2cnZtTTcnT+SrQzBhBsZbZtr0wdOmQqIycRxp87?=
 =?us-ascii?Q?YKK3d/0Sv6ypK4dce7Dig1Uw+/f1w4ZHYGedZ+v6DZrJRKp0ARj48kJhez94?=
 =?us-ascii?Q?NenGVbHezXRJeVS6JaybwMeKZV7s2BmWA556oHmjwepSstgjn/WCbM8OVGc+?=
 =?us-ascii?Q?9aRAYGm3D0LXYCJ0iGYL/JBx11qjEtwY03wgPp50EQuFADdfZ8VHbEp6xCJe?=
 =?us-ascii?Q?5mk9w/hKHD0T7Rsxrg4dCVSVzVFnIXqcqa8bXoMDsZ0OZmzMwyn5VIO/XWT+?=
 =?us-ascii?Q?nLFh7nzTEGZJjUfcTguzoIKGwEzkcUXlBpYGYFcdZmQynfpGS2e6YGYBKgtP?=
 =?us-ascii?Q?BZjSIYpcsab72Rgk8cP0HxLlavolbQ0sK+kGnf00EjFONhbjACd+/57v3CYd?=
 =?us-ascii?Q?FzpAo56Tb9BgeU2e1BS2jB3tK9w5y3tkFxuLa4e0Mc7FLel/rhUgkthwJrcN?=
 =?us-ascii?Q?40S6hFx+wncWZS0+h8kTr+4Pm1AouhiaGpBi/b5R+e4ZKbu/LOHpztgDFOyT?=
 =?us-ascii?Q?X4I904UXgD3Lv7HjwRSuqwsDCmr0U6mrQggZqNcnLM3CZTnhsk5A3PobPOJ0?=
 =?us-ascii?Q?iBk7fzpvFDtfThPqdprm09ey4XjLj4AHOQRMSdGIm7IkXEM8h8IlEDxUyywb?=
 =?us-ascii?Q?15TA9nXiua1O3XCFsZqWNxX6A7q8bh+xl4yjsDX0MOkukEYlCFFKUIV/hGbi?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36902928-e9b6-4563-6914-08dc79aa5718
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:26:09.4804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inFD08ti8brnldW1IpJIhxb5q+UP4d0JmI3k4Opt+MdfHPPCnX9ZxQ4aylY9Y20vYixePYVsTCKZUfzfJjvCW5/1htI1SpsB/pLzO3KiMRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7810
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

Cc'ing drm and drm-intel maintainers too.

And a few more details below.

On Tue, May 21, 2024 at 02:56:22PM GMT, Knop, Ryszard wrote:
>Hello,
>
>As of today, we've moved the drm-intel repository (upstream for
>drivers/gpu/drm/i915) to a new location:
>
>Previously: https://cgit.freedesktop.org/drm-intel
>Moved to: https://gitlab.freedesktop.org/drm/i915/kernel

For those using dim, it should ask you to migrate your remote
automatically on your next branch update. By default it will use
the ssh protocol. If you don't have your ssh key in gitlab already,
you can follow https://docs.gitlab.com/ee/user/ssh.html#add-an-ssh-key-to-your-gitlab-account
to add it.

New server has no git:// protocol, so anyone using it is advised
to move to https:// instead.

>
>The old repo is now a read-only mirror of the GitLab-hosted one.
>Relevant documentation and links were updated. Thanks to bentiss,
>mripard and demarchi for help with the move!

and thank you for preparing all the patches to the different repos.

Lucas De Marchi

>
>Ryszard
