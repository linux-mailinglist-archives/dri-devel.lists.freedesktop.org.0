Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39AEB10F87
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B4110E0BB;
	Thu, 24 Jul 2025 16:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llgzDJUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69CB10E05D;
 Thu, 24 Jul 2025 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753373955; x=1784909955;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n96evV4s3n7nfkJIWlGw7uhJ6uAA6JOhSuImpeWtgmY=;
 b=llgzDJUklWdmHUvDaov5G35N946rSXBi9k8X/zEh4EncAObsPEkUpniz
 dbOQT2MiaVyuBAFC8MXIExSrZLZmHjdOUd05ZO3XDBR2mimWMkgEjkVCW
 CXUGYjz+3qXBxM9gp76ILdk2eLC7b4ZXKVLHMfDozmU0fZx6/sNxKn7AW
 1U5vJ6xb3RYSkl8XDkBXCTZ9HQqG+Kaib8gOU8EQjq4cKpVKWKx++zWwJ
 r1KHoSKRXdkxe7NVsPDPJvGUUkBZopcG1x8o1h8lKvFJLSUlxGwD+Wepa
 yu8lIixNmsEVSX/QmhRZsA4ubbUIJRaKho4cNpyKO7g+DkELtNZtg4tp2 A==;
X-CSE-ConnectionGUID: MyH6nZdYT6y0YKyjuay5nQ==
X-CSE-MsgGUID: XWHqepz3SKCI2J50ccFrKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78248092"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="78248092"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:19:03 -0700
X-CSE-ConnectionGUID: +cpZuyKMRBGh13ylY6UPAA==
X-CSE-MsgGUID: lrS0TAd0TCeTU1o/UembrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="165688058"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:19:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:19:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 09:19:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKdDkKRO+JeTqvcqivTuUwPRQxOL62GqlODrKiKMd8OzrSXXuk3USqRBdCaRvXzw+YkFMEp/Zmb6Ga3jh+X+1RHcW0xMMDGSYyf0RdH+GhzSE8XgkDX1uhKmwhVed8yycVQvF+2lU+sk53Gk/VuIfA8hKY7f2i/WiX3tsJnPSX7syAIVdTxqprXfmQlzBMPoI53MbteyNu8TJFmJtT7wHC/j0s4qVq2sRZphfGpMOGaInfWHmrmGe613MM6ioYTbvZbKu9KrDGFhtJz6r40xtqc1d/cKOUvNhZhhAkyxuRp6+1SbIpk8tTzQWBoUq/cEpreZr+hUJ2ShQOgg3LOaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vx2mVADRsjEK1EmwEFtbQCDrnhbYgb6a9SrUqYHPAVY=;
 b=y2ddaMLT36W4L3vmqs9uDOLbDKeBg8uH8DCG81W1iIa34c2l/lYTBDq3iMrbb7wqTl1zQQoqwLFGltKVYSWA7hOXVFv45o2+CkKale16T4oDfr5lHAOFZWeQFdYR3Z0nQMVmsFYAE+HraMkemVp1y0PbdE4Fz1EvybJAvKXAMjcjLmVCAmMq/Llz/Q5m+IzR+HPrG/Tzjud4gxzRHOs6nFa46MhsgSEy1Z9m5AC6DFlpkSMhE/X2FxCYRRxpTklbnKkDruxynwfdmxfZfOsdVOabgyV/1p8kWjJdblFfA30ebmC0l0Eg0ZxwJmLPP/xDm3M86YHzIBxhbTWdn/pv6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 16:18:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 16:18:31 +0000
Date: Thu, 24 Jul 2025 12:18:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <simona.vetter@ffwll.ch>, "=?iso-8859-1?Q?Andr=E9?=
 Almeida" <andrealmeid@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v6 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
Message-ID: <aIJc0asrYbD7DzHL@intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
 <20250724143440.232862-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724143440.232862-2-riana.tauro@intel.com>
X-ClientProxiedBy: BY5PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS7PR11MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 1986026b-08d2-4571-a548-08ddcacdbae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cvEObW7l7XfxwQf9VtsWRxNb6SRy1eSqsaM2gNIXFPujZc3Ktwl3LM05iz?=
 =?iso-8859-1?Q?HgFZhjlL0d1Jpn7D4m26wABbEmU2C0AG/gi7zrmXpAUPr/GQIpNmaarXJ9?=
 =?iso-8859-1?Q?+voARt46UjBwmvLGoNsD0NeSDVE5l+YZxPXJ6HhmJbSC+SZ5+f+U9HzQT2?=
 =?iso-8859-1?Q?YKJbTrY0DL1TqRop6PmIbDUy5Dwv05AUkUHAH2LQUyjlOOPRXoqpyuFv3Z?=
 =?iso-8859-1?Q?DsXzyNAlG7x0tcIJB4ut8rPrEbXYTGrwovXrIA/Vocdegky97stXn3TNMo?=
 =?iso-8859-1?Q?Yd0iBUimUGLWi750pxXA0QrDfQX82Mdh5H5GZKYRKz/jBnzxnKTba/uSBH?=
 =?iso-8859-1?Q?vd6VVaMvfjV/7tlgwfFoiLehd2GVWPSRbKuU5chV8noObMsN1rkxl57rXs?=
 =?iso-8859-1?Q?Z1LGRqgqbUTZsU3PYx3qZHfInwCfy9HffVndB0Zan3NKMgh20UQAkHhOY8?=
 =?iso-8859-1?Q?Lug5LrgOMbWcE9dB9UX8sQHNApzpyl9o1m6pcAPwkajO8A6VifaMPqCRXY?=
 =?iso-8859-1?Q?sLPV89IZ7RICrZVebgBwih1mumLxkniXp/Vv+VJ1D03FEA2b3/ft5rtICm?=
 =?iso-8859-1?Q?rMvSKotjPfZ0YT5pic4LMXoghcjQzoiouLdiUsxupcG4zqIGoV2IlXUaLx?=
 =?iso-8859-1?Q?B0N9jEqYj1pcGQXxS0xA2sWUKASqb5f7+BYu0DEQ/iVSADw6Pap9Na1ATj?=
 =?iso-8859-1?Q?rh00LhKqdPHaR5UwQiwOBNl7nzjomUDyAVd7ZlewnYZznIKi1FRfvAX1EU?=
 =?iso-8859-1?Q?Lf8NTKQWLR3oUSf6Dn4s/9lRdPBKhTmVNYhxUlcQtEnLW/tM8IgrxochfT?=
 =?iso-8859-1?Q?95S8RDBr5vMM0NWuPopuRrzyEGXZWBp+x2s00QH4OR6nUgiqSNF5KOKBq9?=
 =?iso-8859-1?Q?AcCZL1J9dUH72Zf11egDMT9n+gjiHrOZQ4SLbLKGqXXDTJW3+jsV41kzNa?=
 =?iso-8859-1?Q?UARuBjRZYBVbeZySxGTBjFy5Ixzlupep0igfh10PJF+CpEs4koV0fICOOU?=
 =?iso-8859-1?Q?uVLkaABNCDGjWyc5JXwCPyOnUTxiDcz5KgjogG82Y9wgkbXfRtdNKpzAEI?=
 =?iso-8859-1?Q?jZg5AcYBaAs4qnLSSgoMJAaFMEFewd0+6NVcR8p3AzdUKwKWE/fKuw9RtO?=
 =?iso-8859-1?Q?tnejmPqRj7ZsVQBaHuiRVOppwPLJG5qZqK4ZoWwKR1mnocZi8J4QALO0Cs?=
 =?iso-8859-1?Q?hS8N79Jwvy7ikr5nDp7qiXLhlRp+3MIJSIWlY2rpcc5PxANwt9cVaSjazJ?=
 =?iso-8859-1?Q?1LNPtNAsDhSgntPzau4D9rX3rgIhw67TQqBhFPghwD/RUUctzT1tc938Ds?=
 =?iso-8859-1?Q?247TM0eW42CBBpUbIyzRXHlMBTpAE1nV0OAHoZ74rpFBczEqGAbta2P3Hs?=
 =?iso-8859-1?Q?/kxZpE2afzmGwNVc9B7CkmB13QRLr9pjaDz4nlu7Ylopwa48Iy1T1MWtLf?=
 =?iso-8859-1?Q?VRdJ50NkmoYhgPIkjrSlsayW5DYvil/knaCQlUGCXX26lzsiHLoNQRh+WN?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uZO/qbLC7LDcbksN64ip23GY71ODjo+tvPFwnxhOe7aTsNeMnHZGCKiLJD?=
 =?iso-8859-1?Q?R8LL0BVpqckU8spBWA4MGslixIsj4o7X6c3tJhNMzhrTI3Vyfeel+2u948?=
 =?iso-8859-1?Q?FAgwRjDaP6vRqvJucuBfe33Eux+NBQr7KKIDmFPlXLBFzKP9cNbBIcANwB?=
 =?iso-8859-1?Q?G+HxyPFmVGgIyiEp67iv1A/E0AQr0l7I8Diahn9mmjr7jed4CSOxhasGnl?=
 =?iso-8859-1?Q?3qJnV4BM0eXiJjSEvhQjQDsiQeEiN8GHBoGtaia9sQs+ouXDtC9EIDlcQ+?=
 =?iso-8859-1?Q?rFP+XbogaNEKMubyhrNQACdzhFxKrHxPwWmscJPSL9C2B+gVbecBrnU4f5?=
 =?iso-8859-1?Q?PIITw47eBbYtMZ7uNH8P8vV/AysL4Dg/0MrepKYiF6N2Bo4eazxkHCMPxA?=
 =?iso-8859-1?Q?HseAW0Yyl7usP1v2GhDMfaJhO+KGhjr3/eXUCPTwmqvCw71TIbU1ErvI2l?=
 =?iso-8859-1?Q?XMkn8XY0fIzcTcO/IrwWon9+vqeG6RovBxiISDxrp1oacgPXKlMTuZ4GMf?=
 =?iso-8859-1?Q?wY11yld5U9utRquHdBdFh1yt9AC9R/Eu0kfi5hel8s72wJFw2hSPTzz/an?=
 =?iso-8859-1?Q?b5GRkrdyu+hCQDYridEfUepr+pYQbDcq+5BbOLZvRyT6zXumeOhtiIl1oW?=
 =?iso-8859-1?Q?LFXc41bHMIdW0qE390pI8Mj98dW0P9NA7LaJFzRXnbVky0RB44oKt22p0S?=
 =?iso-8859-1?Q?+R/+2QKF2QnvqxqiwpuLKISCpkUtAk0YkOJ3HaiewGwFUlXpp3RZH9v4m0?=
 =?iso-8859-1?Q?lZao3VcAPzyqDms0nTK02VI2oQrzyOz8BRvj2Gascn/PXcSdUT0SMUqlpY?=
 =?iso-8859-1?Q?ouOxb7EFVcskrOwmMD5gFyUb6k0Kak5FkdvMSq2fzUdp5cNi/5KtAcVgT1?=
 =?iso-8859-1?Q?IOFN3DwAzs+f13flvrcNhdAoptamC6fY3rzxEfSnkEvyx5/vygZ54VoVl0?=
 =?iso-8859-1?Q?USNU/fWFn+/tdIPvdxGIpv1FhP8dqzKIS3AqRTQzVW/BT3HrgK1eBdToDi?=
 =?iso-8859-1?Q?WRAx2eYdjhHeNjDryuJW9B4sWxRJblirx2OozwnCsnbR7kFj7sUKipBruj?=
 =?iso-8859-1?Q?xI5tpjlCWsXaskOblxh7ENMvWVuFF+qmGe2fU0Y7UJUtDsjq4EwjFz1J/I?=
 =?iso-8859-1?Q?aDo0enXd4GRFS34g7kFlj60uhMtFUIYrti4UDYiIki3bHhhI4Oikvkli8F?=
 =?iso-8859-1?Q?Po3GShdsnYnbjzwWS3b0ag5ClxkB9yRddWcaxwF4QjEQejOfkiL1j6bSfG?=
 =?iso-8859-1?Q?uMzhz3qxFbJEWrrB69MPnD3/BRrGsr3DRRv/njaX0Jm3n3aX/5Yb2ZFpWM?=
 =?iso-8859-1?Q?rJmzwJ/5lM1z/299kOk4CnowQ5l46pK/1llNzT7YJc9Vm+zKNB+jDTl/T9?=
 =?iso-8859-1?Q?OXc9NE+sd9753kPKEdwjwwCH+BXaSq4GG4TGjswbqORVeawgdQXG7R9BpA?=
 =?iso-8859-1?Q?ttfVMBx9O5N+/G4YvQJFzQyuSbOkDkgIRx9Sby9/PA+0P+KOhSnvB1FydW?=
 =?iso-8859-1?Q?WcrR89uMDziNRhmP3LLLKaP5mxrgsC4OG9VjHxpLb6WRs1QpLUlSwBqRBl?=
 =?iso-8859-1?Q?NqsaULYjwBUck4EIZf0+ot7i0HEiLFfxlkud4xT5uXHRXwGsk8uDXHDypR?=
 =?iso-8859-1?Q?uxeJI/p+b0ldKGo+aLvrQP5/HtbpoKSHMi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1986026b-08d2-4571-a548-08ddcacdbae7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:18:31.1945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBKnUi2VJwGoLl+4Yj3SNMvYfp0VIxSJEJxZxAGfczyVz/LReOdkk1TY4Xh/Cusa4cdYw1FxBnOm+/1qx7UlCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
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

On Thu, Jul 24, 2025 at 08:04:30PM +0530, Riana Tauro wrote:
> This patch addresses the need for a recovery method (firmware flash
> on Firmware errors) introduced in the later patches of Xe KMD. Whenever
> XE KMD detects a firmware error, a drm device wedged uevent needs to be sent
> to the system administrator/userspace to trigger a firmware flash.
> 
> The initial proposal to use 'firmware-flash' as a recovery method was
> not applicable to other drivers and could cause multiple recovery
> methods specific to vendors to be added.
> To address this a more generic 'vendor-specific' method is introduced,
> guiding users to refer to vendor specific documentation and system logs
> for detailed vendor specific recovery procedure.
> 
> Add a recovery method 'WEDGED=vendor-specific' for such errors.
> Vendors must provide additional recovery documentation if this method
> is used.
> 
> It is the responsibility of the consumer to refer to the correct vendor
> specific documentation and usecase before attempting a recovery.
> 
> For example: If driver is XE KMD, the consumer must refer
> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
> 
> Recovery script contributed by Raag.
> 
> v2: fix documentation (Raag)
> v3: add more details to commit message (Sima, Rodrigo, Raag)
>     add an example script to the documentation (Raag)
> v4: use consistent naming (Raag)
> 
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>

Cc: Simona Vetter <simona.vetter@ffwll.ch>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Co-developed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
>  drivers/gpu/drm/drm_drv.c      |  2 ++
>  include/drm/drm_device.h       |  4 ++++
>  3 files changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 843facf01b2d..5691b29acde3 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -418,13 +418,15 @@ needed.
>  Recovery
>  --------
>  
> -Current implementation defines three recovery methods, out of which, drivers
> +Current implementation defines four recovery methods, out of which, drivers
>  can use any one, multiple or none. Method(s) of choice will be sent in the
>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> -more side-effects. If driver is unsure about recovery or method is unknown
> -(like soft/hard system reboot, firmware flashing, physical device replacement
> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> -will be sent instead.
> +more side-effects. If recovery method is specific to vendor
> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> +specific documentation for the recovery procedure. As an example if the driver
> +is 'Xe' then the documentation for 'Device Wedging' of Xe driver needs to be
> +referred for the recovery procedure. If driver is unsure about recovery or
> +method is unknown, ``WEDGED=unknown`` will be sent instead.
>  
>  Userspace consumers can parse this event and attempt recovery as per the
>  following expectations.
> @@ -435,6 +437,7 @@ following expectations.
>      none            optional telemetry collection
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
> +    vendor-specific vendor specific recovery method
>      unknown         consumer policy
>      =============== ========================================
>  
> @@ -472,8 +475,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>  be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>  device of all user context beforehand and set the stage for a clean recovery.
>  
> -Example
> --------
> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
> +consumer to check the driver documentation and the usecase before attempting
> +a recovery.
> +
> +Example - rebind
> +----------------
>  
>  Udev rule::
>  
> @@ -491,6 +498,27 @@ Recovery script::
>      echo -n $DEVICE > $DRIVER/unbind
>      echo -n $DEVICE > $DRIVER/bind
>  
> +Example - vendor-specific
> +-------------------------
> +
> +Udev rule::
> +
> +    SUBSYSTEM=="drm", ENV{WEDGED}=="vendor-specific", DEVPATH=="*/drm/card[0-9]",
> +    RUN+="/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
> +
> +Recovery script::
> +
> +    #!/bin/sh
> +
> +    DEVPATH=$(readlink -f /sys/$1/device)
> +    DRIVERPATH=$(readlink -f $DEVPATH/driver)
> +    DRIVER=$(basename $DRIVERPATH)
> +
> +    if [ "$DRIVER" = "xe" ]; then
> +        # Refer XE documentation and check usecase and recovery procedure
> +    fi
> +
> +
>  Customization
>  -------------
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cdd591b11488..0ac723a46a91 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>  		return "rebind";
>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
>  		return "bus-reset";
> +	case DRM_WEDGE_RECOVERY_VENDOR:
> +		return "vendor-specific";
>  	default:
>  		return NULL;
>  	}
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index a33aedd5e9ec..59fd3f4d5995 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -26,10 +26,14 @@ struct pci_controller;
>   * Recovery methods for wedged device in order of less to more side-effects.
>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>   * use any one, multiple (or'd) or none depending on their needs.
> + *
> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> + * details.
>   */
>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>  
>  /**
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> -- 
> 2.47.1
> 
