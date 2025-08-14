Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D35B26CD7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B7710E8C3;
	Thu, 14 Aug 2025 16:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBmJjaXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266BF10E8C3;
 Thu, 14 Aug 2025 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755190047; x=1786726047;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CajMbCDe9Z2Z1VmB/1zpaEZfV5SFb/pbMiWYspp1nZ8=;
 b=aBmJjaXLi1NznWSUEzxSXYA7nCfxJtJQbt+4sVwAlpWCjOwqCeYReqlS
 ILV7xTcU54MY+WZeOAK+GZbBaRxKbiZODNk0RzgwOQHbZjRPlxNW5J4ic
 h71ZmkloMWUJYVTJi5sgy+3IkHakBnzkoKr7frGfveejX8M5oCpIDOj3t
 2G5lD3KT5VL8HqqWzmP27vQA6gmCq8qYh1nellbuqMi24o4K177nn3hu4
 QG37DaZ6Q3cSMwAH88JTN+NSewv75en6MwrLwkbPfLcRCEwaSHq/SJzOQ
 6jjfI9HZGvo1jEZRgZWIYosn3nH0pAB1oaA//5TMq+8Ql5iXrMCQJomE3 A==;
X-CSE-ConnectionGUID: b4NjgyvzRMu86AsJ8FSQAg==
X-CSE-MsgGUID: A247W38JR9m+AIO6Syz12w==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="74963465"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="74963465"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 09:47:26 -0700
X-CSE-ConnectionGUID: CFzeckW7Q8iuBk60neHcJA==
X-CSE-MsgGUID: 2ysBvNspSf6qi7aiK7SomQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="167068424"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 09:47:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 09:47:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 09:47:25 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.59)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 09:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbYLSoqZDE1U+0c46C2JPeSNem9o/GLRp5KMZ43o7m3QRQaucpvjYpabmdw96Q5FEiiRYBPGA+JjEARqMb5HLBQiVShQRs/p1mO7IwWLMzxc5W7HRGFm25n4q0AlTLzZVQH+Gi9u9OPzvrEA8t0k6fSluye/w2brMyjNgWNzbnE2FyE43d4l/pfHXJ7fJuYcmp50fSuc1QtJIk89paOg2frLV+3bON07vcLOlMXOponpJm84VyUqQj60TnBtF/SR50opXpe7GWeMh/ZqGbIjAl7CfjvPeY8Z/8ciso0F/8w82gmYwo6f5wu4cjZQezOUFaDPd8vSnUHQaw2Ev5rPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij7z76dOv+6BwNtSn/PgYdyia1iQh8gd5NaZC6O2tbk=;
 b=Knmtmr/bRroIAhw9+TDposLueyR8JXP6NV0fRJ6Hno4554JpNsNzDEza1N4xS1ewjwnjpaVR2Y1cCEN6kACi5vnWk606VyoBrc6559dcuoU6zTXKTFsdl9KqJtgO69ONe2rPeSHuIk6Uo0y1URJMeSRofaciiu35Z6S61q6jMt5tjRDDRrHa9vuhzf+hFqb07L7pnYv9vcoK0TqNPvv7+Uj1f9DJcMYYYbeLXx1Ni0Av1jFgoThHkTsSnaVPPtjqqVGk0PPvH41pGLJTvqqg3NczEj4ZnbmwHBeG33y5C0yt1BEM1WoeZ8PLCTj0LCWhnnlZwkbA+/fxU8awatAN4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA3PR11MB9062.namprd11.prod.outlook.com (2603:10b6:208:577::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Thu, 14 Aug
 2025 16:47:23 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 16:47:23 +0000
Date: Thu, 14 Aug 2025 19:47:11 +0300
From: Imre Deak <imre.deak@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
CC: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <aJ4TAUsmjO_nFDrx@ideak-desk>
References: <aJ0HAh06VHWVdv63@linux>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJ0HAh06VHWVdv63@linux>
X-ClientProxiedBy: DUZPR01CA0123.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::8) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA3PR11MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ab2d2e-327d-493c-c6e8-08dddb523dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tEbtKQRh+DsEFScuGvjiYyHwhTMkaqr1SiTPXwK6uvAb5E6Fr7CwCPOHCV?=
 =?iso-8859-1?Q?PF+gSg7PdxjX/XIYU8oB0MzNhkkBAJoK0eMy2x7VdyZzN1O4Lr5XTYn0EG?=
 =?iso-8859-1?Q?7rRSCivl+3FQtOH4uGEJrCvUajgGi0zzg2dpZ6PtwUh84AYFRZp2DwHQv6?=
 =?iso-8859-1?Q?opJU+4rbvPyHC/TMzmM0hLlH9uQI7WnWsXngK97Ok99uHCEolowBe7sfcc?=
 =?iso-8859-1?Q?/N9OVAG+nLN/Htp7nMlsWM2weegR/N7o3rg16SVL7z6uWRuTBpB0ZOgZ6c?=
 =?iso-8859-1?Q?eWyN1aiKtCcL2Nh/i8tNZ0+klhV5rSMqhnN2nMb3YfeekpdhyKM8ce/+gM?=
 =?iso-8859-1?Q?L1ZWMRyh7zr2+i+AELH1xhZ9Uf/dWZKfScZPHrGijG0UdaxK9A+tts6Sf7?=
 =?iso-8859-1?Q?7hc4jSG/Hb4Fnt/htsPJHiXAAhsIpzDvV7hwGn/iTH+keHlt2wIS3bbDBE?=
 =?iso-8859-1?Q?VrcIPbPUK17SlgvB9SBrxCBzd0DNc0iflQQr+zKtSPnhaH2AxZqcBs2vyH?=
 =?iso-8859-1?Q?4zKVg909sn0IY+3dd0z/k1tE0Zfur5iYT510EUunMj5Hbf6ngh3CyUjQe8?=
 =?iso-8859-1?Q?rvKvA5BTvLLaz6j6/kK1VZpy22cE4eSfjocymw/sRNSDGnsRGiXzijKn+Z?=
 =?iso-8859-1?Q?UcmvTekI5J8ayMzsP5fDyvFg1uYE2UpOUgMPclWg9Wr3zJr70dw40FkaMC?=
 =?iso-8859-1?Q?kTwdngsx2X8S261jUDwSCwvcr8jrFwVP0en31rG3tdd1luGD1fZ0UkoGyA?=
 =?iso-8859-1?Q?s40Aa5DBnRDItjh/EfF8cd/ia1tnv5+xVJerXgnKbEzFCHr0BB3hiZRxSY?=
 =?iso-8859-1?Q?j4heCZ2kgSMyym8LeNBRxRlAX/i4qB8G1ucHv4RzZFPW3iAJDGn1zffzGR?=
 =?iso-8859-1?Q?zf5Ep/j19EGCXPrKC9FgAFkNoV+ZMowBZHvMAaIDZKRj1wQ/ipGYBOIbnZ?=
 =?iso-8859-1?Q?dT6xkzPar70h1X2C8M2ixsGYTKM3Y/5WkXd/PcI/JVumH8bto4qLePZIbK?=
 =?iso-8859-1?Q?AkdGk+KscgQaemVSS/X3D9w131X0+MfxYmz9LFDCXw56oDO1JbuY5BRsYG?=
 =?iso-8859-1?Q?I0V6TR0uclygZsKXtaNYzmuqy1kaC2RKTopgFhY6XXRA5kqEgDVs3ObCUs?=
 =?iso-8859-1?Q?aLL4Jjx9P5LkcVR6JXO6PM/YAm0qrWq+Z82FbLYVUeSErlDjK+n9R/WkmF?=
 =?iso-8859-1?Q?+Cc7NAZ95Qi0gNb65V1J70i6G5sygvqt0MuT6o3qnQQdRSw39awiR6Jj38?=
 =?iso-8859-1?Q?CHLWeloR9aitspO7pHHfjjzhFT1hb9dNu1ggPq7+UsfgO/5wXQXCH0KVEG?=
 =?iso-8859-1?Q?H9J+8MAOkdsdxkftJ409zpv4Wcv4RU31VXnciCGJiAzunHSKSKKtBgsdc9?=
 =?iso-8859-1?Q?so6z8DHF03fzhXn8veJ5VUaf8otoL4PNV/HX6PnArdE17wjy0RWzs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?m8P/KUL9xzzV7GB0j7uoiHaYczDQnsaZ8cNiEaC/vkB2NlN5ZXR5ornfPf?=
 =?iso-8859-1?Q?10bPpMIzHriWRuua5tzJt+0CCzHhrDYNvj9tc96TS3PFQCkjtoOsTbJXgJ?=
 =?iso-8859-1?Q?kd6H43uT1BnfQKAX77DQFOuQp0KxqXSpDcYbx1eMwCkCmhrB6IvkVRjf3N?=
 =?iso-8859-1?Q?bCYAQPC0Vvk5HKydwjYYL/p1gJzHQp2OHw6oxnvAkkeZW+cM9JaCevJNpU?=
 =?iso-8859-1?Q?gnABppgboLEc/SiRJzZPxhnCdty5BGnpQXtHBWznHASANIlqy50y2uer3u?=
 =?iso-8859-1?Q?/Ov9tpdPMj3HVYWJVtXek2XvLbHGK9PQKSXxYHVA29ulPGE+ZjWk09QxHk?=
 =?iso-8859-1?Q?J4VKm5rQOW7ln8fnKjdu/6LOaa1QprXyhDQMGCaHpG0Ranp+dGni358+RT?=
 =?iso-8859-1?Q?6fmqJJ/qXeEbX3K6JOdXvsTmKDPaViYQTPkpCj+1CGMoxunDZkGj+Y1Tth?=
 =?iso-8859-1?Q?XyT4Rnn1giMDQ73MqgoI3a3Vq/PCSeWfisvBBCLhyV3TogfQ5VDxRu4ymu?=
 =?iso-8859-1?Q?Ou3YGX9Ay0BZe5RSX5g328Qqfakh954nNDTBmYqUebeXWqROh9lCuGp1EB?=
 =?iso-8859-1?Q?ryCvyuPcjlP90GMguI+hy+Vcav398ovJL5bD2OzZJr3PqBFpFxu/btJKnM?=
 =?iso-8859-1?Q?UxQv6HHmyL+Z8EOocmGhlHuS0X1sozuFYSSs6JRI4fovA186psT0VzAo6C?=
 =?iso-8859-1?Q?P7T53j0MDi1YOyuasJ3BiO59G/wRe/FduQFdI6h9LxED5S83C/sam2pkrx?=
 =?iso-8859-1?Q?U0j900SZJZ5GS/5bftY5g/SRcpvZVEE/ngWjqkpynJZeOffTNUkuDuaV9g?=
 =?iso-8859-1?Q?fj1Elus2SW9acc13WgHi4O5iaYm9bsoBTYllfhNSZLRjifgjJozPBPg5vl?=
 =?iso-8859-1?Q?TYvRhzvfHWN6e73o9V1uJcSZDkgcsUS507poHnai9eXOIRP5wM5OLEbF5W?=
 =?iso-8859-1?Q?9uCWsU8v8zoCqDkDnuJAlK87oKmX71CkSCjRa8GP762zDMrXq6JnhEnRun?=
 =?iso-8859-1?Q?4eRfzlvVCt6PHoYOptr6aJ9Z9nPaIvZ3QnMEI3oiPhZRsE06NXRQSPXaGW?=
 =?iso-8859-1?Q?r2K6zsct97Ds7KQE6mHRAUwYXzwllyUMA8Kvf7bzMjUSAT+o4Q1lWOc38s?=
 =?iso-8859-1?Q?/0cvZNK3KXxYgCvA75iuA0kzyYqXh0YKjTAeqDQQdI05CTgJzgS2slAnnm?=
 =?iso-8859-1?Q?DVEVlM2GgwQ06cv4tvYnHhmJtxQieDnk9JRAiXZwGSEIsmWRbyytIT4g9v?=
 =?iso-8859-1?Q?iSnAl3Va5ei/2cZtqgQ8AUZuP5Uhz50AIi+KVzE8d1HU2PlGoIVlNNBTQR?=
 =?iso-8859-1?Q?8P7GRJQWxnlF+nedTEf2ZTYPfCj8MpMcH6B7WAmYH1XUn5BO/Z5QePl4eC?=
 =?iso-8859-1?Q?Ki5Cb4Ox0z0WCdE+1mh7AZ2ZSVRPP+ENc4wryHmxnmI8ppSJ9EtGHEtpXF?=
 =?iso-8859-1?Q?SSR/a95V88I9S/jJ3Aq/rFxWJYDKgxiiUCUEu4NDt7UT45ge1qvCGJxpxl?=
 =?iso-8859-1?Q?ibSWIK9JHXDRAm0lwYm9Jha9OV0tlsYPkVGbddQy6bEOSi1g9g1MV/1pyu?=
 =?iso-8859-1?Q?i/jU87gEG0ofRqIBURRZl9H7U7lisVGwkd/nlmtmwNmeruAqp9puV2YkIC?=
 =?iso-8859-1?Q?XOSCSZ4onSzd1mB7x39i6NwtoWzX3N8YG3GCKc2WX74WE6XXhYikTBWpoD?=
 =?iso-8859-1?Q?c20JaFljqAfOlrCd5WjEh55gv62ohIWfzpleiEQB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ab2d2e-327d-493c-c6e8-08dddb523dcf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 16:47:23.0992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AroFDtcKmLSuFjFgxphdVKsW5lMi2J3NOoQ3bOmThJnzAu5VMK1MB59eXscKR6fyzk8+HyuB/f9fGpRXlFz80w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9062
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

Hi Tvrtko,

On Wed, Aug 13, 2025 at 10:43:30PM +0100, Tvrtko Ursulin wrote:
> Hi Dave, Sima,
> 
> Two display fixes for the RC cycle this week - one for FBC and one for PSR
> handling.

The following commits in drm-intel-next are for stable, so should be
also sent for -rc:

6cb52cba474b drm/i915/icl+/tc: Convert AUX powered WARN to a debug message
afc4e8438807 drm/i915/lnl+/tc: Use the cached max lane count value
33cf70bc0fe7 drm/i915/lnl+/tc: Fix max lane count HW readout
3e32438fc406 drm/i915/icl+/tc: Cache the max lane count value
89f4b196ee4b drm/i915/lnl+/tc: Fix handling of an enabled/disconnected dp-alt sink

--Imre

> Regards,
> 
> Tvrtko
> 
> drm-intel-fixes-2025-08-13:
> - Fix the implementation of wa_18038517565 [fbc] (Vinod Govindapillai)
> - Do not trigger Frame Change events from frontbuffer flush [psr] (Jouni Högander)
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-08-13
> 
> for you to fetch changes up to 184889dfe0568528fd6d14bba864dd57ed45bbf2:
> 
>   drm/i915/psr: Do not trigger Frame Change events from frontbuffer flush (2025-08-12 09:05:11 +0100)
> 
> ----------------------------------------------------------------
> - Fix the implementation of wa_18038517565 [fbc] (Vinod Govindapillai)
> - Do not trigger Frame Change events from frontbuffer flush [psr] (Jouni Högander)
> 
> ----------------------------------------------------------------
> Jouni Högander (1):
>       drm/i915/psr: Do not trigger Frame Change events from frontbuffer flush
> 
> Vinod Govindapillai (1):
>       drm/i915/fbc: fix the implementation of wa_18038517565
> 
>  drivers/gpu/drm/i915/display/intel_fbc.c |  8 ++++----
>  drivers/gpu/drm/i915/display/intel_psr.c | 14 +++++++++-----
>  2 files changed, 13 insertions(+), 9 deletions(-)
