Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451EAADB6FF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 18:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7833710E3FB;
	Mon, 16 Jun 2025 16:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KW3TzuXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCF610E3FA;
 Mon, 16 Jun 2025 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750091587; x=1781627587;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fB03akVrCfe1sa7lPBsBbpPVR8fpeQjKuD1m3MgA9f0=;
 b=KW3TzuXGQczAU2EWNAan5NQ9U+dLCDBYhlavZN229tjM00Dw6YbTnIiP
 vLjcGmo3o9HoS2ztXDxNivlu3dN3QAmJeoNQoJ8K2VLqliDn1S0BWmLMB
 +MZoan5wUvHRd21HX+kpQj8EroCYq7zTxQUEYAxC2QEqizUKN8I2gOOtI
 STFEMD5E7VFk3HbCFf9Iif6HAtHox6uGDoHpIAEUZy3g+3YIRY0yoLqVp
 Ma4pDoGeoJo6KtpiBKx/PRoJ1aeD7YISn0uR/iGRtWa9M1GPSQJIJIYGQ
 7eqLRvP+bgK/ertxIolYCBRZjuZXrpYOwco8H9LDAkd05cISr0vKHljQf w==;
X-CSE-ConnectionGUID: nqsAKVFYR92fPjXMRtY3AQ==
X-CSE-MsgGUID: v3RLMyEtRs6w9DrRo3mrCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51469413"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="51469413"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:32:04 -0700
X-CSE-ConnectionGUID: PC522nxSQ6CYJBwgAXsoag==
X-CSE-MsgGUID: NPB8alHSRpqu92W0CMUXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="171745881"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:32:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:32:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 09:32:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:32:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWH3xQ1AWS+2In3i+UqZi36KJkdTNRvIObEJs3rEfWvn7Hbnrz01BNwwURbCtm62XVaYED1E4X2hKMZnJhCqptnWkdMfo5VaARtFQSe+K8ZQjBiMXKHToq/KauqPZNSE2OQ9flDtrbRvzSZ9L1OXwevhmpnCFxpa6nZSKAEiRvcXy5zFb9WdjYb6sOss+T65F1iWmF0cc00KheI3l9yPZkZI71McjmFyJIikscLbSoWHF4RNK5ysgb6yMImNaoxZLWfqzENuhnY6WUo+BnJnQri/bRpZCL+/y5nwiAlVC59okMIZQnCi2lwZk5ZiLOQRW1IDWCK8UyzhOHKATyZ3SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5qaS6KfY/WNZqJC6pU6xBlaKf+x7tOJFjU/LpCRqgk=;
 b=uE7a6weff/TTmxPcbz+qwY/4Gna10tSoaCrETcr5k3fCzfZiyFoXhIhJdcDA453Cg3KUC+XqIJE2p4tZTIGai+HWbVBru46m4BToy0drBvqYiVlLoPu/XcoSO+8k3EBK8tOD8FbKDr8EG8LNzdCTiGh6sYdzjzrVm8mbvf5lfVaXvFt1J8ACLgHpdIdPvrIJ0A7CAFFEyMAGk0Q1Rk/zF5u7kSE05Hyj1fAlOkAAwXv+4hJx1TWz60eGIwZ8vMZSgJ+2lo9qDKEK1/bEILP2gk/+Q1mGCpx4lBOqc/L3RgqbXlBAJCMG4FppFpTP1AFKXB/Yv0YpnbmnhzQY8U+hIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 16:31:59 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 16:31:59 +0000
Date: Mon, 16 Jun 2025 19:31:55 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 7/9] drm/i915/dp: Implement .set_idle_link_train() for
 everyone
Message-ID: <aFBG-5BOfl4lBLou@ideak-desk>
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
 <20250224172645.15763-8-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224172645.15763-8-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: DBBPR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::20) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd9e64b-c76a-4ace-d46b-08ddacf35142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wynrNAyzh6CkcIEcRdnqaozlCdSks+AdREuYuHCi9RSx2VeqYVOpp0fsYr?=
 =?iso-8859-1?Q?Q7gS5dfuqB2pzUVwopHv+wBoz+DKqud05cb8Kcg3vI1LPUSyF39T0F+P6d?=
 =?iso-8859-1?Q?iUeLtZNl7iWO+ckyeJELaf+q199/0d8u0wW41wBqZy7Qtk7vQ+pNUe0Jr/?=
 =?iso-8859-1?Q?ZTIpJDQPA033iozJfoimBTrSU3mYba6b/pF2tU7oVGcpEHdOT5yJUDHjCE?=
 =?iso-8859-1?Q?G0/Isog/gCuCdok/o5WJ+vPHVlz155ghZ2BCiYzbFxlBZD4ncj4VOIYTbS?=
 =?iso-8859-1?Q?WfvAB0QRL8ezrJRVa/1d+GBp592Ns6agMbDCinWS/UBZPRX5lYevyB1+Zn?=
 =?iso-8859-1?Q?Op3e454IZPlrXNkCwiB/PaWykqxpFUBOHDB9Kus9CvBe/5K1Ic69/Ar2FC?=
 =?iso-8859-1?Q?Qyrzy3jrR7faxf8ydQk7jEcZbUS9erqE1ywTzMRDurwkzELU3lossQnu0G?=
 =?iso-8859-1?Q?K9TD3UuYIxtvQ1qbf2AWpFmcnH+NBH9W4ebplpm9ITuQRSCq2Xwkq+BfNJ?=
 =?iso-8859-1?Q?YvKtju/W4+5wljOeboYaRwqWt293s9NRCXZlBgIvjQrcIkw3he7N4bBL88?=
 =?iso-8859-1?Q?1AXnw5cW13wbNziUydvxbp0Wn8zHyYYdUW+LMlRV2bwm7HszT9uH6YHUpS?=
 =?iso-8859-1?Q?Scuhim37nSHDWawQXBiT/ZeYi3gF2Kt/CCX0P/AvW05zUxkGGOE3cA5Tgk?=
 =?iso-8859-1?Q?0z5jPPdVSRR+h9sxH5a/EU5hBcbcSW7R2iUz7Us5NWVd3QLL+jVzYbu+tV?=
 =?iso-8859-1?Q?S/Y8dGmjD6Lo/x9yJGxmKmTwiaP+L7M7AXNqpPnuEOcEEtTVKrbFg3o/HW?=
 =?iso-8859-1?Q?O9lYsIyRTpfS+FgtataOEM8b/471Znm/0dk5ilgnoKvN0FXz90tp/9uHMQ?=
 =?iso-8859-1?Q?4RZTkVJo7spoYgW+7f7i4CMgMUf6BJZg91Aq05D+lJ3vQbjPYgxlwXkw5U?=
 =?iso-8859-1?Q?dQMqQ81+uuEWdsnppUmZQlHaT0fJU2CBzDL4MLvsbMpNEQY0Ps0QJhcVFD?=
 =?iso-8859-1?Q?rFvGgNYG7I475Jjm/wRaBKfvZKOvsIDKFxjVg5FIi+UEQlbGSy/bC0LLG3?=
 =?iso-8859-1?Q?av+a55D9lPbJ05Qw5mEY91n0FBMMEs27u/LKccLW1chUFkWb3izZ8bivX4?=
 =?iso-8859-1?Q?/3lAEb8d7NQcykIpi2PPg0sND/Oibd09NYvOcAPOA9j0FWQmPPl6SZ/V2L?=
 =?iso-8859-1?Q?H6wkUUUyf6mYAKbBQNpT9gTxdE/U2xFBIz+L8svfobpo3z9j8ZHxBmtbe1?=
 =?iso-8859-1?Q?yxy0L/m0JgxD1n4RRlHLtJ9g8m3CR/lx+3zxRJMENDTkjZjlE0OiFg5SGz?=
 =?iso-8859-1?Q?VHhHEE+XK/YTcI08SqasUYeRYKCt02i7z2y11DTZfmOFzJMHn9fVsYbNV7?=
 =?iso-8859-1?Q?6Up8GfgyLkYpjTabURlQCY2c6AKDKlQBz/n+7ULZlkdUYCJUkv07fgtZmx?=
 =?iso-8859-1?Q?ZJDmz1pIv5oyoQmSs7MGJzGki8QXdgLu6Bv5k9shfiBRpwEUIJL2agP6g+?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kRSLFuGhJOMQ/CD/imEf2Mm6lxZujXAujA3OAOoRlwcMqRQ4+sJAprIiXp?=
 =?iso-8859-1?Q?lGqqcuvU0pYUiZ8Ha3c28mvbjR62a11+Cm17d4LZm6Hp8PSavzsThS7IEC?=
 =?iso-8859-1?Q?n1b8AMJZlDSahUdTCyDQjIxAicEEcDkabe6cnX1ry3cjU8mL3FKP5kn4s5?=
 =?iso-8859-1?Q?cnaMoS5cFPDr9keamkl3YqDpsB9o/J6fln5lAXfZv0liXs2KgBSUUnrz9Q?=
 =?iso-8859-1?Q?QfEWcS28FLbYjCU4V8CbxqZ5mThA05kyCYcSLtZ9fkaekLwdLJOcx2ETNa?=
 =?iso-8859-1?Q?ObvsAOz86NH8pLZFh6e79IDq6Q06TiviEHLXCo2oHVX156rtjO2SenVINm?=
 =?iso-8859-1?Q?evmlyWW09QbwtqcnJIhpgPiaQHKwnfDzImq6YKYJ/l4XN5IyYjdWbSFa+0?=
 =?iso-8859-1?Q?mr0h5aiNJd2OD8BgxRGI8CbRyhASl+yiGiPX8+Vt5GtBJKOXy32wu4N8kp?=
 =?iso-8859-1?Q?GKom8cm7IEY1JyYllQX4bh366csMJvpEzNQp0lRtFVus7aYRNegoHUyKVF?=
 =?iso-8859-1?Q?ag71QEHhtaA4SXDWdlazDYdyDS8Q4OOjwZf2PRnPYF0F8378qOKf6BCc25?=
 =?iso-8859-1?Q?mKkW5uk9s5HBBWDWrSg2EdDZ3DXB0mfrkeXUvRf/1EHxZLEMivilSoz8qL?=
 =?iso-8859-1?Q?E+53SJ2wB7l4LUg1dsccRwX12+pg7TFg3vwU8hhmHolozWuI8e3AoaSiq0?=
 =?iso-8859-1?Q?meCO3BWXAMceHVzRJpluafFEgUTtelIxCAXh/PypGCmbDkwHcSE3KdGa7d?=
 =?iso-8859-1?Q?QGGklMLLrGnMuLyzh4kX8g2+Aa1xES2CbKIC07mzZQD4U/hwy1cUPF7dwH?=
 =?iso-8859-1?Q?HolS+ScbkK6GUALKVCddKbthEuukVpgUupmSXZldM494Yavsx4O6YAxif6?=
 =?iso-8859-1?Q?sGAKzzDAkjDnIcX+62D/PHnZIgFMHwfLC61edg4zxKGmq3tdJI/XeIVo5b?=
 =?iso-8859-1?Q?nXTQVdRhH76gja4B2np+9y5+SsL6m6s4f8cNyAjRj00PSREIC3XK9HXOLY?=
 =?iso-8859-1?Q?WYoBqQUCWhdH0QOsVfO3l+JGazzEjKuh0Up8K4LShrHRgH61qkhQh7EkyL?=
 =?iso-8859-1?Q?aFPgdq7GbYQZRO6MID7JM7xBOsG68zjNJ7vWjogXVuhIbrlxBpZ219icvy?=
 =?iso-8859-1?Q?9YuSG+7ySSB29RGVVZY0Oi5KUwOhQg6Nrc6k7xy94Q31RLStXzhg0XL+1i?=
 =?iso-8859-1?Q?zH9Lucx9NiNph2BcY76hCIpbdXO88aa8UIDGC5CurdKTouF4A8glqlXYri?=
 =?iso-8859-1?Q?ekk4p56RKG5gbSI7qMN4G//xQyQO0q5eVs5ajRTy7Jxofy4t1v++R18X14?=
 =?iso-8859-1?Q?l26FoGdSIecyDBElgaZy7UhmJMw/NX1+k3iB9BHElB78ENbZK/ixB2akFE?=
 =?iso-8859-1?Q?RaJWQP8rldK2ekFl31voHgSSMYl9Xi4vKwGaqUFIc45QuPdU236pO0lMU9?=
 =?iso-8859-1?Q?QQBgFIdTrmRd3UFPLhTBfxctoloX2Hh6yKPjTp/WDfi/JhouVmKCTEq9gw?=
 =?iso-8859-1?Q?hj8w6aPpSI5kjAFqbePgDbicP0I9trw842mBESm8zbqAIdHqal0Ls6jyRh?=
 =?iso-8859-1?Q?IKr/WnPX2bNnbCqOgJAzQyEN0U3Q8qNQMW/j/ceBQNKDq2EaFlwpRh3XzO?=
 =?iso-8859-1?Q?TH1Cj+4cVZq9+OHhI4c6YdQuLhVIV2nfa1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd9e64b-c76a-4ace-d46b-08ddacf35142
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 16:31:59.7862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuPfAEBEfk0Pctf4wohi4YLWbqZQg19/BtYHlO3KKoPwB6Hk86JV5Mj8uRy65j3Lu7Amgd+872RZAcVpnLc/ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
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

On Mon, Feb 24, 2025 at 07:26:43PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> All platforms are capable of explicitly transmitting the idle
> pattern. Implement it for everyone (so far it as implemented
                                                ^was
> only for HSW+).
> 
> The immediate benefit is that we gain support for the
> POST_LT_ADJ_REQ sequence for all platforms.
> 
> Another potential future use would be a pseudo port sync mode on
> pre-BDW where we attempt to sync up multiple ports/pipes by trying
> to turn on the transcoders at the same time, and switching the
> links to normal pixel transmission at the same time.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/g4x_dp.c | 33 +++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
> index 372c3683c193..390f9b476a11 100644
> --- a/drivers/gpu/drm/i915/display/g4x_dp.c
> +++ b/drivers/gpu/drm/i915/display/g4x_dp.c
> @@ -621,6 +621,19 @@ cpt_set_link_train(struct intel_dp *intel_dp,
>  	intel_de_posting_read(display, intel_dp->output_reg);
>  }
>  
> +static void
> +cpt_set_idle_link_train(struct intel_dp *intel_dp,
> +			const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +
> +	intel_dp->DP &= ~DP_LINK_TRAIN_MASK_CPT;
> +	intel_dp->DP |= DP_LINK_TRAIN_PAT_IDLE_CPT;
> +
> +	intel_de_write(display, intel_dp->output_reg, intel_dp->DP);
> +	intel_de_posting_read(display, intel_dp->output_reg);
> +}
> +
>  static void
>  g4x_set_link_train(struct intel_dp *intel_dp,
>  		   const struct intel_crtc_state *crtc_state,
> @@ -649,6 +662,19 @@ g4x_set_link_train(struct intel_dp *intel_dp,
>  	intel_de_posting_read(display, intel_dp->output_reg);
>  }
>  
> +static void
> +g4x_set_idle_link_train(struct intel_dp *intel_dp,
> +			const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +
> +	intel_dp->DP &= ~DP_LINK_TRAIN_MASK;
> +	intel_dp->DP |= DP_LINK_TRAIN_PAT_IDLE;
> +
> +	intel_de_write(display, intel_dp->output_reg, intel_dp->DP);
> +	intel_de_posting_read(display, intel_dp->output_reg);
> +}

AFAICS the above could be also used in intel_dp_link_down().

> +
>  static void intel_dp_enable_port(struct intel_dp *intel_dp,
>  				 const struct intel_crtc_state *crtc_state)
>  {
> @@ -1353,10 +1379,13 @@ bool g4x_dp_init(struct intel_display *display,
>  	intel_encoder->audio_disable = g4x_dp_audio_disable;
>  
>  	if ((display->platform.ivybridge && port == PORT_A) ||
> -	    (HAS_PCH_CPT(dev_priv) && port != PORT_A))
> +	    (HAS_PCH_CPT(dev_priv) && port != PORT_A)) {
>  		dig_port->dp.set_link_train = cpt_set_link_train;
> -	else
> +		dig_port->dp.set_idle_link_train = cpt_set_idle_link_train;
> +	} else {
>  		dig_port->dp.set_link_train = g4x_set_link_train;
> +		dig_port->dp.set_idle_link_train = g4x_set_idle_link_train;
> +	}
>  
>  	if (display->platform.cherryview)
>  		intel_encoder->set_signal_levels = chv_set_signal_levels;
> -- 
> 2.45.3
> 
