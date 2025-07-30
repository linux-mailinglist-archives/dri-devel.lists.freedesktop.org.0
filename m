Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E41FB15F25
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 13:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EDD10E1B2;
	Wed, 30 Jul 2025 11:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StZMo5qk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F7310E1B2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753874224; x=1785410224;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WQwP87Gvg+ouMzFkrBcNTIozDmtXHsaoEY31mth/TO8=;
 b=StZMo5qkJy+PX0PweBvVM02a5umBqbp66ilIV6TOqtGW2YvnqGXN7iEj
 zsSOg2eYzk1d0i0xX2NSbRf/guFZSGfiE0kaGZly1+iOgbzvSdMy4yIPi
 M0BQ3X6pMt0lVzdn01F2Q1kNhzwPgNl8fTCDrfAFZvNY32WFaD4v7huE9
 eq03ECYicGmYDTLkW1280exU+z1xomDQPt5Wvq2m3cRd0IhXA2FJUwxb+
 3Xd0xnnyeniT1xvHIQHgwid/k2qPwpR6LXwvX0ImZdlqU4Emd0Oapng2s
 QtHaEiq4U51t0pFRcyjT4PM64J0dss9Jg1dt3Wn/GeS+OzQMZxI4jv9a2 Q==;
X-CSE-ConnectionGUID: SvhDIYgwQ2qb455pqRZFoA==
X-CSE-MsgGUID: D+K0J82TSgmtPfySDkbjlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56137811"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56137811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 04:17:04 -0700
X-CSE-ConnectionGUID: MY9YZwSoTOacfVjUUYePBg==
X-CSE-MsgGUID: pZHBUrCPQW25uh/ftdX2PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167447073"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 04:17:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 04:17:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 04:17:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 04:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLajrywrJk2N3eFoWqKnqLEFG0zY6erUZMNJFc3YLwO5JxC1KmhAMMWZusGt3rxArDzbcGyItxhbwvaB6RwTsqnlNu54KrkpPfLFoL/UTemgSQpl6r1cwQEvC/dsFGZ6jGHsHMdhkQdTDb2LgqZ8qLgVdey7+azYotYmpmofUjIbSLy7zM5W3UwU9/EzH1P3KIhQDQLlZjnfbnmfZdDiMtnF4/I2K0pdlr3sHqSCA3qvNI+ko6U8lcFzgN9IXI2sRMSxgsQIYyrbgbtt905lYOE1XeDsq1e3oGG1FjI7R4aBHBUlnemetQASNRNRb8sa4Z9ZL63ga1Yv1o1Mvvx7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHGdxPS/VxixLu+Bz3vq3KWOsLASFtx5AgxPa5du/vw=;
 b=kIM507gu915UOiNZmuGfpPAE+AwsIpE06+aodhpz8TgqQFGd7PlGcuAYhx5SOAHXpmSTnh9Y9uS9Osc3/8dFvfJ4ck3g7KctnhXBLy3xxdkKgoTgjf3jatg9zZc9uRs3oYh/mg/bPyjGNz4WjmwpB4bO/WLYyN3ZKqCyOiqvxUuLVlLselIQcg2udSjO3vAOwQ0k3ggh7A82FZomqCd0nWAqdPJNOd5J1R/rana4x8KdrODLd/ZDO14U5WMYAa9210AkymtXEWv0YqSmScp2alw6q62kSCjqsFlPy6rZWbWOgCa7WBDPg1HS4h8arAZ4gxqFlluLnrTxe3zg6X0y5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Wed, 30 Jul
 2025 11:16:59 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 11:16:59 +0000
Date: Wed, 30 Jul 2025 14:16:50 +0300
From: Imre Deak <imre.deak@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Alex
 Deucher" <alexander.deucher@amd.com>
Subject: Re: [PATCH 1/3] drm/omap: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <aIn_IlGQAEh8O0Wz@ideak-desk>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-2-imre.deak@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728101603.243788-2-imre.deak@intel.com>
X-ClientProxiedBy: DU2PR04CA0321.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::26) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 79caa0be-c0b2-48b1-ee18-08ddcf5a99be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Dy4j1PThuToYavgS6QVZ/DiCSdz0IZd+/ba3GGnDDaq2jzqm6znUKZIS1b?=
 =?iso-8859-1?Q?+CFBPzg+B3oZPS46TLMDuJGCeoHmQBhDsTQcZncUpSQdj5ntxZWwGH78RA?=
 =?iso-8859-1?Q?6B48RNElKryGEX1WicUU4niCWTjUQvJ/nIEMq8Rcf1M7NJ+0jwsFi9rEEz?=
 =?iso-8859-1?Q?yx70OoOUV24tzTWhAEtc4YrsurRI+0niGnXe+sFZvvJO1g2SWR52Ggk0It?=
 =?iso-8859-1?Q?4al3Wha1kAPuHi4dxCtbhi74jyDAYzDFUEnmHbmsWNHjj6WbZBR/U8bINt?=
 =?iso-8859-1?Q?q4OqzCpWv1kD5jgWR5aGLhtP+U5SooIC1TtLpSAafoBYDTSzrwG4SAnnS4?=
 =?iso-8859-1?Q?NDWeRh5uuSprsCCcssoWc/PIAsX+ja5SXWBxT/XRjqpS7DEO+ZlQrid5Db?=
 =?iso-8859-1?Q?e9ze3DW1yR8AQ5HaIVWN79wGYUcQBaYErus3VzN2kCzK2mhFf1TotFuyzv?=
 =?iso-8859-1?Q?OXguYcFvedEug6rrdce2PwjTGIj7c5heFyS1gT04IRCmi6TUyOhq6B6N3a?=
 =?iso-8859-1?Q?w1zoPuFAooRj/+Tw/oTdvuImf7FAETdzd7U4Sw+Xa2eWeYP/cbusCqoDds?=
 =?iso-8859-1?Q?p1CdA/ic1X797QKkD0ZXpf88xF1xDeP4ok+Cn2Vu3nXUnxtkBIkgYawS56?=
 =?iso-8859-1?Q?Oe9+q3XkP8atKiv3ivQmCMskr4elxvIBdZQ9KnmTTvv6Sw26aM+ch+m46W?=
 =?iso-8859-1?Q?IkCcKw3yXIgY4PoGuqRjtnfrlnQTuTlfbS+gJcNz5Te/LfOE1i+ddloKO1?=
 =?iso-8859-1?Q?6EBEN8UAGR8shOO44U1+TBZUWXbHGu7L8gXDJmnUL/LexQ/sOYPh5VcARk?=
 =?iso-8859-1?Q?Pobq3ztFVbykcMdhPNtquFyceDTrLQVlkYhKHihKg3qqNzOU0KtjSq7pkN?=
 =?iso-8859-1?Q?FJAu7fk1s6eI9+GZUQAH85F7kJatLgihuW7TsrGCIfx5+kqRBt2lR8tQbH?=
 =?iso-8859-1?Q?mvX+lQScPUkDNSsHRd5aUKT6D23VyYu6uYJcKVmUdcuP4iAICLs5wp72lx?=
 =?iso-8859-1?Q?3b+urp0OizLC0XRjkT2LaxzB3gGdEvRxZIeY+ClOD+9tn1JJNWfy1U9Iy3?=
 =?iso-8859-1?Q?1FHZ5wrq8/imlu9Oj7NropFbggoS88GhDwe/jnIt1VqDZL5RLVjb/Xgrnt?=
 =?iso-8859-1?Q?cuD3U2p8oQZ8WIsTWrkBWVUPB5FdngWy767fK/WOy7XRBA7LXCuPJ9wNd1?=
 =?iso-8859-1?Q?kRMimE0Md0r6wKtx7KYkexHQUWvlUCyakJZTlIB1HBhvu8qMQQACUB7BRt?=
 =?iso-8859-1?Q?Jpvq0mbTx4bNKE+M2hwCHUe7nA7MKG03NKxUpF3gSf7g2Ar72Oug84q761?=
 =?iso-8859-1?Q?TuUgMxMVCZBPKlvpke5vwAn/a5gPH9oDEZQ/Ri2iUnJQ0uD27pKaI4zUOb?=
 =?iso-8859-1?Q?jYyK5Kh0OWc6apLZfiYLdsERTC8295d9bVSnJhBW9hsJvjhLEA3Z9X8/fv?=
 =?iso-8859-1?Q?pqDKJUl2OeGeEWs+KetR0UwHAixznywicBtiwJfDZLQQxbYSD2G+9DtxLB?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qq3fszeZJOIEVodyxVK7srs4N8RcH4d2zsWHvn7KXgy5iExdF8873G8KU0?=
 =?iso-8859-1?Q?cia/UbeklQH9v6j67ee6cYGywmmJBCaTRXbJWgkOc9WgFp5RR2kzTQMddc?=
 =?iso-8859-1?Q?J0rMmtP6FpNB0vsIfwY1YKj0OGQSTdgSIsnAyFdpiwERzvsGq3sZqMR0YP?=
 =?iso-8859-1?Q?Qv033pLzjdS6sZjfs6tGk8u1vPelNEHHTtQpzJXHkfToz2aJK+L1K7YZ9A?=
 =?iso-8859-1?Q?KWwh101bhsj2h4bM2eoo9jZaakwWtJIhuokHH+PWa6SL+umUwmZszEpmfm?=
 =?iso-8859-1?Q?3YBWVC0fCHDOs94zlmPFg9umnxBCmjTBNTW/1XfJYg8upz5Yu0TdwQ00g6?=
 =?iso-8859-1?Q?I5bv+Rixys+ko/fyD9H9yacoe+2BuYVdl1YeRFUp87ymlYfJrIEwGslOiX?=
 =?iso-8859-1?Q?m9VMSSC+JVpgdSuCSGLuhhz2XzN8Qy/YisnfRunPS/0A78FTSAW4qcafoT?=
 =?iso-8859-1?Q?/rCh91/ww9pyL7/URpoeeFWlXFbXqxy8z+RHJwQn0F/pqP8bK9jaQxP0E/?=
 =?iso-8859-1?Q?I0fwyJynprMO2WwPT5cEGn3zc1pLb1KQGrWMcpuqvCK9V/6yViBrl/V1CC?=
 =?iso-8859-1?Q?8vcpQTxR5TVDCaGsbKaqwZfvw/cHj2kefs7W179IUpEoUh+t3ZfOKmBpzo?=
 =?iso-8859-1?Q?fM2lBqSD8pl1HMEdBnRQD1t204xGLcID+Sk00a3eSQsFcYfa8zGfob+IFe?=
 =?iso-8859-1?Q?HbTGAWnKLgXLlFtb4HAFctZ7/THtQMOkFPfolDfHbfUO/mXZjUbmlok4un?=
 =?iso-8859-1?Q?8kZCtC7STFeHada4TikYCZ8il66Fog+AyiRciWH5sKB2r2OccNGPKaxGpG?=
 =?iso-8859-1?Q?lihjlTdzY5zzwPlPoSoeAO6iK3fTNyopMfIsVzKPq6pCkazyRb/GtDw5aq?=
 =?iso-8859-1?Q?Gdf/4lUWiR1yWElP9EDJCyh4bvyk+oIY1bUnxNOScVJpdu0Xtr7McYwMfT?=
 =?iso-8859-1?Q?OszJ2ny34WxRgtOOkz0lnXKqHkn1jk9lbzbNkhT3wIvh8ARm7fx2wjlH/T?=
 =?iso-8859-1?Q?wITNWV1SzwOva01kqNt+cKf7JCOPzyvvPtRDUbwlaKqVhx6yDlboHc4yDI?=
 =?iso-8859-1?Q?evM3utJUEwBrHl5u8DJxqSmAyDquvogKLKg4//Y0qdHvDoB/+g+iM+Uvjd?=
 =?iso-8859-1?Q?Xdy+rjQ6PuP2cyr8oatiPr4Zkqv9L1vIZ5M6y2p+0htEnasHS4o43GhPn5?=
 =?iso-8859-1?Q?zfRksfl5e+6hdFdfHv4snJIR7khlEKrNjgnSdkDpFnRpnqv+SBo8vVRQDC?=
 =?iso-8859-1?Q?Ix/9kouY8m763W1xkln69TVaExup4/W+tbBAN9KBcdDoeVl0rWU/uXO91y?=
 =?iso-8859-1?Q?px4V4f85Ng4yvucUR8W5TMMhdK+U9VWjVibH30vJ9mj34KnqAeqAL+9uWD?=
 =?iso-8859-1?Q?JLRt/ieCa3QOrkrvbER7B7RrOxVCq5AkNBcgNjspLAnsH4GW38DKwkECuv?=
 =?iso-8859-1?Q?aUQS9oqX62HnGVCTXlWjRf/eYSf+CcMRB/j3ovc4sGgKuDU4LCYqVH2Uc8?=
 =?iso-8859-1?Q?DeIyruiRzJHR2iAsAR6ULNW24VvsryVv0x+2YxE7L7nmpRvRApm9H3Z3NZ?=
 =?iso-8859-1?Q?QuU0in9lZxumlLVPH7mn6FGSOvI72xyNI558m0S9r35SXj/GTnD5qlNRKb?=
 =?iso-8859-1?Q?lEqDQm8oXq4ZSAlQ0ZMV2SLSFP89NT6uqEiadfan4RHFLtTsr7My5s5RMD?=
 =?iso-8859-1?Q?EBexN08sPeFQK2GS63VMsGiz5hNXRSA6LXOuzNF3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79caa0be-c0b2-48b1-ee18-08ddcf5a99be
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 11:16:59.1900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: md4uNYR3jkP2n6HSE155WyVOm2Jro9YAZFCLFIEcgvIUsSqLLF6LDfEooy7ZzxbirnY+wRu4WNB/QnAnSkg+QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi, Maarten, Maxime, Thomas, Dave, Simona,

could you please ack this patch? Note that it fixes commit 41ab92d35ccd
("drm: Make passing of format info to drm_helper_mode_fill_fb_struct()
mandatory") which is already part of Dave's 6.17-rc1 pull request at:

https://lore.kernel.org/all/CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com

Alex already acked the patchset, but patch 1 and 2 are still missing an
ack/reviewed-by from maintainers.

Thanks,
Imre

On Mon, Jul 28, 2025 at 01:16:01PM +0300, Imre Deak wrote:
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookup.
> 
> For the fbdev case a manual drm_get_format_info() lookup
> is needed.
> 
> The patch is based on the driver parts of the patchset at Link:
> below, which missed converting the omap driver.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk
> Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/omapdrm/omap_fb.c    | 23 ++++++++++-------------
>  drivers/gpu/drm/omapdrm/omap_fb.h    |  2 ++
>  drivers/gpu/drm/omapdrm/omap_fbdev.c |  5 ++++-
>  3 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 30c81e2e5d6b3..bb3105556f193 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -351,7 +351,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
>  		}
>  	}
>  
> -	fb = omap_framebuffer_init(dev, mode_cmd, bos);
> +	fb = omap_framebuffer_init(dev, info, mode_cmd, bos);
>  	if (IS_ERR(fb))
>  		goto error;
>  
> @@ -365,9 +365,9 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
>  }
>  
>  struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> +		const struct drm_format_info *info,
>  		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
>  {
> -	const struct drm_format_info *format = NULL;
>  	struct omap_framebuffer *omap_fb = NULL;
>  	struct drm_framebuffer *fb = NULL;
>  	unsigned int pitch = mode_cmd->pitches[0];
> @@ -377,15 +377,12 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>  			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
>  			(char *)&mode_cmd->pixel_format);
>  
> -	format = drm_get_format_info(dev, mode_cmd->pixel_format,
> -				     mode_cmd->modifier[0]);
> -
>  	for (i = 0; i < ARRAY_SIZE(formats); i++) {
>  		if (formats[i] == mode_cmd->pixel_format)
>  			break;
>  	}
>  
> -	if (!format || i == ARRAY_SIZE(formats)) {
> +	if (i == ARRAY_SIZE(formats)) {
>  		dev_dbg(dev->dev, "unsupported pixel format: %4.4s\n",
>  			(char *)&mode_cmd->pixel_format);
>  		ret = -EINVAL;
> @@ -399,7 +396,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>  	}
>  
>  	fb = &omap_fb->base;
> -	omap_fb->format = format;
> +	omap_fb->format = info;
>  	mutex_init(&omap_fb->lock);
>  
>  	/*
> @@ -407,23 +404,23 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>  	 * that the two planes of multiplane formats need the same number of
>  	 * bytes per pixel.
>  	 */
> -	if (format->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
> +	if (info->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
>  		dev_dbg(dev->dev, "pitches differ between planes 0 and 1\n");
>  		ret = -EINVAL;
>  		goto fail;
>  	}
>  
> -	if (pitch % format->cpp[0]) {
> +	if (pitch % info->cpp[0]) {
>  		dev_dbg(dev->dev,
>  			"buffer pitch (%u bytes) is not a multiple of pixel size (%u bytes)\n",
> -			pitch, format->cpp[0]);
> +			pitch, info->cpp[0]);
>  		ret = -EINVAL;
>  		goto fail;
>  	}
>  
> -	for (i = 0; i < format->num_planes; i++) {
> +	for (i = 0; i < info->num_planes; i++) {
>  		struct plane *plane = &omap_fb->planes[i];
> -		unsigned int vsub = i == 0 ? 1 : format->vsub;
> +		unsigned int vsub = i == 0 ? 1 : info->vsub;
>  		unsigned int size;
>  
>  		size = pitch * mode_cmd->height / vsub;
> @@ -440,7 +437,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>  		plane->dma_addr  = 0;
>  	}
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
>  
>  	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.h b/drivers/gpu/drm/omapdrm/omap_fb.h
> index 0873f953cf1d1..e6010302a22bd 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.h
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.h
> @@ -13,6 +13,7 @@ struct drm_connector;
>  struct drm_device;
>  struct drm_file;
>  struct drm_framebuffer;
> +struct drm_format_info;
>  struct drm_gem_object;
>  struct drm_mode_fb_cmd2;
>  struct drm_plane_state;
> @@ -23,6 +24,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
>  		struct drm_file *file, const struct drm_format_info *info,
>  		const struct drm_mode_fb_cmd2 *mode_cmd);
>  struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> +		const struct drm_format_info *info,
>  		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
>  int omap_framebuffer_pin(struct drm_framebuffer *fb);
>  void omap_framebuffer_unpin(struct drm_framebuffer *fb);
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 7b63968906817..948af7ec1130b 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -197,7 +197,10 @@ int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  		goto fail;
>  	}
>  
> -	fb = omap_framebuffer_init(dev, &mode_cmd, &bo);
> +	fb = omap_framebuffer_init(dev,
> +				   drm_get_format_info(dev, mode_cmd.pixel_format,
> +						       mode_cmd.modifier[0]),
> +				   &mode_cmd, &bo);
>  	if (IS_ERR(fb)) {
>  		dev_err(dev->dev, "failed to allocate fb\n");
>  		/* note: if fb creation failed, we can't rely on fb destroy
> -- 
> 2.49.1
> 
