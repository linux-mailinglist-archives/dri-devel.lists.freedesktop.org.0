Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9DDCAD295
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 13:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0AC10E442;
	Mon,  8 Dec 2025 12:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9Obf18m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDE710E052;
 Mon,  8 Dec 2025 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765197418; x=1796733418;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=SkJY+nPb/OJzG4ZcWsre+Q92sN/eT7r7SkPJmv5aSc8=;
 b=S9Obf18m3qOxL14RZcKtwsK434gvFu7izO0Pm/iM0j2LhZt8ep3p7qiO
 G2biyjwjtcPFHUQCIcFjQ+PW4o/AeyxTM7zOk0zBJlERyLnLuuIRhJaVW
 BGmUDqXHBI+0WfCwEZkqHAHVqn0UWqhSwCbSmeetH6lkfwhrXJYg9bciS
 OFm6Cq6plQGGChjvDKAO/V1MkO8enuc6MBVAlMibNjCuvShCc+xpxeKqj
 qfGu153zPVV5oqWFKbHgdW5KtXBkRf2jZc5KQiTuCJQqs65n5i6djcAv3
 5mzdqjr7iOUSfLbP8cXdyY9lEBtM81HRxao32P1ZQ7d5KimuM3cixUkQu A==;
X-CSE-ConnectionGUID: dm7xKRmgQ5KtMeHmmEqeIA==
X-CSE-MsgGUID: 84skBhI0TNaZjFv3wcMHtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="70989530"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="70989530"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 04:36:58 -0800
X-CSE-ConnectionGUID: wrivCaI+TWmCrTS5cMaxyg==
X-CSE-MsgGUID: fINnFjy1RF+T57t6ULD6mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="226580050"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 04:36:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 04:36:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 04:36:56 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 04:36:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pvvca5CUCKqwZvis5CNViksU8HlFfP8Qndr8TnN1SiF44FZKp5eoZ/JtBanKdt0jvi+SJwKKWD+BRBcPfCg9zIt/SmdTu5YL3mePvYG6Ddx/k/e6ht7CNmPrrpH+IQdY/kwtvg58Pe3EKftcZhs4f2Au41yS1IcfU4LvB3es3yObwQe0DvubPG12/n8L9Y/hw6FWOi6ln10OWRBW/FHQFBhTa+47OGeA1shgkQVyhzIrX6zrk/UxjAGfvSRnOoxg82y6/+W1+Ww4Yd8X5VRy64YGLIETqUwaElcdgr7Rspx5Fwu8LU2qui9QQBxNC64Zi/s9j8NoWbSPIo1pZj0X7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NTGGxGwygnfaTdUED26GaIKw2DfOe6LDAOHgfmscEw=;
 b=qVhTBRHa3ocVkfyNPbyhflbcGQEp1j+xRnG3WlN2q6PqiI5hzAs4TQyQvNCmgL0ZouaNuwGef+phwZ4VvTsrIf6BOLGsh30MBMHNB1nBgDH6rLB7Y0XFFq9df42nWSAynsUCf2mJB2GMtJBoDZ/Rpm9aMXL3M6dcsabXqvhHmNrIpJ+JuIZq/U8O90xDYt3Ry5O5bpdG14kcJDl9b9PaRknlcOqHBtZPKr2NE1PXZa94uOjIT7rUCkeXeW67Ne0iFoY4yMGr2YGh84VNqK/YPtEhwPmGlVdAZxiWes+dre8XUUFyyPNgwQcLvvATY1Rqo4QzIrmbGN7TP2COldi+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 12:36:49 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 12:36:49 +0000
Date: Mon, 8 Dec 2025 14:36:04 +0200
From: Imre Deak <imre.deak@intel.com>
To: Luca Coelho <luca@coelho.fi>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 01/50] drm/dp: Parse all DSC slice count caps for eDP 1.5
Message-ID: <aTbGNAB3dkMIIH90@ideak-desk>
References: <20251127175023.1522538-1-imre.deak@intel.com>
 <20251127175023.1522538-2-imre.deak@intel.com>
 <8825c1865ec0b5c588b1b037288a47f23adb618a.camel@coelho.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8825c1865ec0b5c588b1b037288a47f23adb618a.camel@coelho.fi>
X-ClientProxiedBy: LO4P265CA0284.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::9) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|LV8PR11MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 718b0a3d-c073-4988-3248-08de365674cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VOkmwMFWWotfO/Us1te8m5rLV2TXIMm5/lVIG++xWR4oRTB9rViGqn12FzQ5?=
 =?us-ascii?Q?ZL2RJvM56o9io/5sYWC/QqCx5IWMu9hAcpYVfdndF80gatp3i1GAmE/EjDtA?=
 =?us-ascii?Q?tAA3YSP0glvo9my9fljmPieyocrpDJETXgeKkK/DS8XHt3jpqLUbJdeeSoVN?=
 =?us-ascii?Q?BIfll+5guETt6Q5fgo1rzyRKEi+RdOVnL3XoRthCIgzA6gFM5TFL5Qv7JUIU?=
 =?us-ascii?Q?4kqqeLuv10zA6F9zrxf1yUxLIGI7S+zqeMnTChFJwaTgpWh7dtQoMgXUWgSl?=
 =?us-ascii?Q?akSy/zepdG+I2TBQHSVWoQ3Zxle/Dw5Y6UXbdPVEKNVsdLLamIPe0Rug9BqZ?=
 =?us-ascii?Q?YAl1+UoEkJugNvFJNUauNeg2WHTGAjdmfgVWBIisxYWtbT66CljIQpvLMzYl?=
 =?us-ascii?Q?MEUUbVWh5+J5dOKZKKKXvuY1mHwFelcSCO1SOC8e9tJuTktL6RdAacSk3Za0?=
 =?us-ascii?Q?H1DO3/NjtWVrOKKPV+Q3YEAOddGS0cYonOOrVdFfinUI2Zp4fwBxKozSjdyw?=
 =?us-ascii?Q?WP3QvL1OfQda5LC4RYSg5LlC5FtY4aZixxqigkWxkiCKrsmsp/JZ2V7Njlsx?=
 =?us-ascii?Q?0w8jAk2Y2jKq5L6++6rsvHLRDaRZ7+NaEPLsN0Bc7xwq/LxHVEVoJK3W9Ydi?=
 =?us-ascii?Q?Mi/GGq7hY5yi82dtjluqheUc48wmMzqZr11Fwnn/AsDZ0zAtHvX5z7Ae/H3s?=
 =?us-ascii?Q?HIb5WhE3cFEqko7LHAxvzWQyltAuXVXoMXlOkEHPme8FNWTJ6yeuE8gMKfzB?=
 =?us-ascii?Q?Xph76UE5ZdrTMPr54bVK8DuQfjEr5m/bbsgPSiNvUy3iWrEHc9fq2Fpjm0M8?=
 =?us-ascii?Q?AB/apaC0E32bkQGv/9Yr+3nKBtiHl5rE/3FeqMTpZaB9IMlfndmeIaDM155+?=
 =?us-ascii?Q?68AGWvqIqKEvf+Mk0SjxRIP2CaOAFxak2QVQaWiHGqtWASSnaMDD2hIcAv8/?=
 =?us-ascii?Q?3Mwk5tbR0W0f+Ykn8hSp+MuJ3uuMFckQ/zRyQ75wNOXKpLWzxsVZHnq+Ky/m?=
 =?us-ascii?Q?+GT0IGWIU3Eawp8rs3n+BB//4ZwGlj2mHxOs0FUM7IZpoSS4+fIxVf50J3Nm?=
 =?us-ascii?Q?irwVIzigD3US31Hqc1bMl1mgZNwlkcRMwV3dg38/WZGH88ywHVwK8CdVmjqM?=
 =?us-ascii?Q?Ym6mda7PYK4Lo2PUydjoS4ZX7lbggnrTgzFDs/jD5/N4yKjcdARQEBY2sUfx?=
 =?us-ascii?Q?fqGqhnqMxYyyoaAwKNUdt5VGcesKkvxYVBTOt8X8P7qDIpV9mfP18hDMJiyh?=
 =?us-ascii?Q?LDtvGE11z6vT2KQUtDjio/IZ6zPMU/tgzCqrl/VATsOxNv7fjsOCs8zAUwI5?=
 =?us-ascii?Q?aGaH+p9tpmYLyDxPUicxCo61w9iMw+aRAdkQ260wrzkDQ99KctdXPYQa7y6f?=
 =?us-ascii?Q?AOS10cxReSnrXUNxy/SbtftrHBH5yICACx5QnZvq2dZkksZDVSNG7QEjs+Hu?=
 =?us-ascii?Q?VJs77mJhNqA80UXZMZNtmW5NycMJz5WO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N3eML0I3/+cDiNerWUaGPDO8uiUwYxVw7G1HC7iKosT8nSjmQhuInbbLiiJE?=
 =?us-ascii?Q?Ualu25ZHXc5wgBPW4HIHj3N8QN/CPkvcbjA1stI6iHoFFRr4Uwi+0uYc1jGl?=
 =?us-ascii?Q?2rBrm585fT9cmv94RrvLj5StbOYEnqvHOjG5/xAKqZh0zpJgoIUzZC+v+lxS?=
 =?us-ascii?Q?I0dvnaWtm6C8wVDSx3u9y6ttSRPzyeDS3wos2/2WZSHaPY9wuQZjBEmyqnxE?=
 =?us-ascii?Q?D45Ds8PXdm65B/4OYuu/TFMe+tKRwXAW3RTyqyM15Fx6on78DoDT3kyC+7WN?=
 =?us-ascii?Q?wW4hYiVYQTxASiCwngWEol1ZKGs5L+ncqYvcFgNmQRQeLPzgWWuquE0bGTcZ?=
 =?us-ascii?Q?4W/7Jb1jdmwa2LVyS4kfGN0opgbilEHIAceDDmmoLLZusq/Mbw/KVtysxIc7?=
 =?us-ascii?Q?hhVTrcdJDwYYO4X5HiPpuB/CO0NS0nAM2htNGOFAP04Cv9qK7hmUQoIA1QWg?=
 =?us-ascii?Q?/EdjcILIzZQ/+vFi4BC8UgrKNx/MMOAJRRlA9va6P9XyrM0k6IblYvwhIsRG?=
 =?us-ascii?Q?f9Cs7n3PAM/cE+PtqpYwvf91xzwrBxNUsxiN3FaIWM1UTJJqR/zf/uOk78/W?=
 =?us-ascii?Q?7jWb0W7Lf5A5/ZYLrlnzCnTZgVcxbxfAiAMcOXnMIL1OBGPPjfcs5vuAYUAm?=
 =?us-ascii?Q?DVUX3AMYAdBP5eCW7rXeyDoYTfV8Pj9p91LkhvnyluB0aJvXcFPKgCVzSlzr?=
 =?us-ascii?Q?53ZpmGOF08LGuH5JvkON8rIxutpJM6m6r3RTvnNAa2wmq9tYa66+E8jcWx0b?=
 =?us-ascii?Q?f8nDuD5ZIdhvrGiqY5uG5xAssOPY03yzdPiXfqrBocvcDZQfkyXsm3KmIgej?=
 =?us-ascii?Q?LWp5kAzkOY2KUTx6VKHN9UMFQQCcKMyphfBzAsr+tFPiZiEo8XOUCJs6nkeB?=
 =?us-ascii?Q?j4uxtECfumw8ZPsqquxxsQMdg3rvtIaDpa5ZH0tut2z5WU+sOUXoCXMx7dmZ?=
 =?us-ascii?Q?v0cniJfEHwaxujpnz2ByD59qgLzelG8GwE1hDIpAX3Fv9sLA4ZPW45OchjQy?=
 =?us-ascii?Q?GNXMqhDfkCBoNSaV1ya3/kpYl+fdDihG31bF2KVbuo3Vklrfnf/7oHomsSU+?=
 =?us-ascii?Q?LWmECDzgQ/agzf3sVG242MVwGBtlsg8UmPZTfUgGMy04+cmPYUW4KBsl5mko?=
 =?us-ascii?Q?1WA06cxYpgHdaTYaZa+JT30B3mXM6T2jAgh8XWNHNIxIdMZWS8gozlCVQrnW?=
 =?us-ascii?Q?pG5Q6y8PElW/HlSI2UpVXqRissCozBr2dlUl5fnL7xek+6XLLC4aqAj3X3u6?=
 =?us-ascii?Q?JO5IJ2M6W2bY4AmlP1E8ZCDujqWkpmBjsLTj2l9upgqkHpQrkOm+BgvwZtm2?=
 =?us-ascii?Q?jLF9n+TKyKaEl0sl3mIVQrDwmGwMxJkjSiBTNoPJWI+TcfyJt1Ir8WX9ASZS?=
 =?us-ascii?Q?UH8Y8WPmfNurgb4PLoXrkxN0+ca6YhfPfvIK573uvUqzWkYzUS75STg6p3kW?=
 =?us-ascii?Q?iYVaMeRwRDhmF+GGU36itNL2azSfJOashlP9OjoeNKYM1MOrFZcSk9/HbYvf?=
 =?us-ascii?Q?YQQjXzTSP23cgfmi6s6sjay2Zegrd3We3ujdSAoD8k0Dw9Ddtz0tkvFG6KND?=
 =?us-ascii?Q?P8G4ZWqEn4vpgjPy8iwThuamVvMIt7eYGHOJ0ntH37hZzx/1txoZ+I4DwvLJ?=
 =?us-ascii?Q?1wdAy3ZiKJfOdHVLpcrUufD+1NcB6sQBfdkiI6a4Ncnb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 718b0a3d-c073-4988-3248-08de365674cc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 12:36:49.0645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rg1Im+4xd2x1yw+wA3/q577wUCKtljs4oxL80lchoaba0BwY57mW/o7YvI3kpvLRYcMXjbrN57KqXiCtlYNEKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
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

On Mon, Dec 08, 2025 at 01:24:54PM +0200, Luca Coelho wrote:
> On Thu, 2025-11-27 at 19:49 +0200, Imre Deak wrote:
> > eDP 1.5 supports all the slice counts reported via DP_DSC_SLICE_CAP_1,
> > so adjust drm_dp_dsc_sink_max_slice_count() accordingly.
> > 
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 41 +++++++++++--------------
> >  1 file changed, 18 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index f9fdf19de74a9..19564c1afba6c 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -2725,15 +2725,7 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> >  {
> >  	u8 slice_cap1 = dsc_dpcd[DP_DSC_SLICE_CAP_1 - DP_DSC_SUPPORT];
> >  
> > -	if (is_edp) {
> > -		/* For eDP, register DSC_SLICE_CAPABILITIES_1 gives slice count */
> > -		if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
> > -			return 4;
> > -		if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
> > -			return 2;
> > -		if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
> > -			return 1;
> > -	} else {
> > +	if (!is_edp) {
> >  		/* For DP, use values from DSC_SLICE_CAP_1 and DSC_SLICE_CAP2 */
> >  		u8 slice_cap2 = dsc_dpcd[DP_DSC_SLICE_CAP_2 - DP_DSC_SUPPORT];
> >  
> > @@ -2743,22 +2735,25 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> >  			return 20;
> >  		if (slice_cap2 & DP_DSC_16_PER_DP_DSC_SINK)
> >  			return 16;
> > -		if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
> > -			return 12;
> > -		if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
> > -			return 10;
> > -		if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
> > -			return 8;
> > -		if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
> > -			return 6;
> > -		if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
> > -			return 4;
> > -		if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
> > -			return 2;
> > -		if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
> > -			return 1;
> >  	}
> >  
> > +	/* DP, eDP v1.5+ */
> > +	if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
> > +		return 12;
> > +	if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
> > +		return 10;
> > +	if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
> > +		return 8;
> > +	if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
> > +		return 6;
> > +	/* DP, eDP v1.4+ */
> > +	if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
> > +		return 4;
> > +	if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
> > +		return 2;
> > +	if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
> > +		return 1;
> > +
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_count);
> 
> I'm assuming you decided to ignore cases where, for instance,
> DP_DSC_12_PER_DP_DSC_SINK would be set even though we're using eDP <
> 1.5, right?

An eDP sink with a DPCD_REV version less than 1.5 may support slice
counts added by the eDP 1.5 Standard only, but still not indicate that
it's fully compliant with the 1.5 Standard by setting its DPCD_REV
register to 1.5 (since for instance it doesn't support some other
feature mandated by 1.5).

This also matches what the Windows driver does, i.e. it parses all the
slice counts in the DP_DSC_SLICE_CAP_1 register for an eDP panel with
1.4 in the panel's DPCD_REV register.

> The change looks good to me, I'm just wondering what would happen in
> this case.
> 
> Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
> 
> --
> Cheers,
> Luca.
