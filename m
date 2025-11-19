Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4E2C6DA1D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01D610E5BE;
	Wed, 19 Nov 2025 09:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7b9fkSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9927710E5B8;
 Wed, 19 Nov 2025 09:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763543752; x=1795079752;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=VRd534ISdzOKCm81Cax46UUHEuzQyq7ANdvX1QhPFsg=;
 b=K7b9fkSmKsTnXcJerwKsTgEhTnMpII+RluslWL+fWfWQYgDqotNKlQjM
 wF6Hlvd+wVoPqLt9SEGrID0mXDM1X/wfWn/D8PXEdRnXulG9vHqDf2XpM
 bsvglYSiLz0OyfHeCqZoSRS/MorFBDlFEWB1KlMtxKfeOOVUwWgdYCt8V
 q0By70/sBrsxJ0n3HkOLl3V/E2luoH4PD6UwauHpdf5GtEFJuWgJQ+igA
 EI+wNvLr7ba7LkS1S2osx3syAA7bFhQj1xLysOWjiZRSCj//DpM72naYb
 xqilHgI1eGUBs8kGWD5RVu/dcZuPaR8gssW4XS4COma2My3KLfxahqKoM w==;
X-CSE-ConnectionGUID: amsYZxNuTPuAi9V5cW2lHg==
X-CSE-MsgGUID: erZL7ncFR7+VNr5l0csnKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="77036304"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="77036304"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:15:52 -0800
X-CSE-ConnectionGUID: Czcfaw4sTnCaRDwm861Adg==
X-CSE-MsgGUID: F5ZsVfmyQDurLVDUIuksKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="190802324"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:15:51 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 01:15:50 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 01:15:50 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 01:15:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPI02YZK36PpgjMw0C7chlSt7RPuaDJM6Ho91DYlu4KUkI7D6GrzgqUOQwj+TvO/IdFqCkxsz6JjR+IdVTXkq0sPdTHQ85Bx0v2gCqt6xoz4ZjYNi1jQPnJkVSrQKOkykggfDmO3/JVU+0OS06jIRHK6L6PKTUFQ1Q81WA8UIj6MU3jzKXPiBdElNuYj1CaeBPtl40TfCekEDCoD9FOnaBKW+KbzdQRXob5LU/ttEJfgRZWd8w3By27mIJLAYUF4ujEFQ638nDnWpxM0Z66Sd9D0Mv5F17casFlo43GqR3PlBqjQ/21r2TFvUOMNHYs/w53MRVqyIdVrt5jEhASFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptd2nbdlUlImQAF+GB7XiXmurgLglxjO+N7d0RDK0Gw=;
 b=CPIc7vfH3eO1q7N06pVG5vEu4DeGhipzlMGWn0KbKoP6W6TtUaKsyMWG2ZUep99rDp9Z/3e1a0QhoKX+goHHauv3wet0MMSWTfM2ZjCVyS+1Pie8SFc0niYAzPRYtU/YHz/T73prRn/Vbxmq3nms1eYsIqXWBIN9V/LZhk8Xr3NmQ2VYL/4w/0Vl6AvwbzA3JICUf/uZTQd+4yqdDVye+bYnEgNDrmjJq6NcNWs56+nP3da07+EHgorK+viTU05NzWOY3pVMnNsDpIxCqGSIsVkKNb+wuuGr4ZrUAILKkrej1iaHp0B0T3kQl5BB92srJ1C0ke1kGMyH9laV9jlGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ5PPF64191BB3C.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 09:15:42 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 09:15:42 +0000
Date: Wed, 19 Nov 2025 11:15:35 +0200
From: Imre Deak <imre.deak@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Ankit K
 Nautiyal" <ankit.k.nautiyal@intel.com>, Arun R Murthy
 <arun.r.murthy@intel.com>
Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Message-ID: <aR2Ktz7kijkKG1qg@ideak-desk>
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <aRWU-ovOdSRUQI-B@ideak-desk>
 <689e22d69f7ad9be4f4a78b5194d8c4965be8ca8@intel.com>
 <DM3PPF208195D8D4E9B5E427A947CB14523E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aRr0MJbOaHXMXEtO@ideak-desk>
 <DM3PPF208195D8DBBC8B3E4D82648AF4AE6E3D7A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8DBBC8B3E4D82648AF4AE6E3D7A@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-ClientProxiedBy: LO4P302CA0013.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::20) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ5PPF64191BB3C:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ecfb3a-ed20-4591-9ef2-08de274c36a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Et50zkvJbLX3mqFj5ZcQNtaCxe7sQmuxIGEnx3RcDRYPjUSwjbdTgQuHmrws?=
 =?us-ascii?Q?Ks8BMdT+c5gPoLw/eLu2qzfs8R+qNvAmdb0ATWS3dWvqssgn/AfQ2a9iq9Wn?=
 =?us-ascii?Q?+/T/jBQ/1zgUqzYZuK5Kw/uBHeiVAKcu0j65TxUFEUka99QVu0Akope8VIg7?=
 =?us-ascii?Q?o1qIIJhc0gpBJuBbDhj7r9qf9kFHetg3nxH2qntyz1q4iI6HfiJYZUaZhPTL?=
 =?us-ascii?Q?LTI8iqGZmHegetSlBTMf3lPCFZV1vAMJ9zscdPCpFEcUswWlpkkps/lrc2vR?=
 =?us-ascii?Q?eib/aJUMJtn+/y6CqPm5ShAsIeUKFv+N21nGsLvJZUOKz8v1YCESiwc8BJK2?=
 =?us-ascii?Q?baTFpQHBa+VZr25KZL/MjJi+SyjU2AG+nWCfKBEaFhw56Rc1GaLj/cwCIK7N?=
 =?us-ascii?Q?ARCi9DMPVrYN7p4LT/67qv3vokNV7ptAHkt/sdLq8czw3BkMaZ9B0DGgSyKv?=
 =?us-ascii?Q?O9htURCgKjWGVR75Qlkk2KfQuOvlGHeSHgqxRIleHhJ8WqLL6jeuvzIInPiF?=
 =?us-ascii?Q?jUpnJzWw4ibcT4KYlfbxXx3Ohe/p2CcAh5CBTG5BT97gmoAMFhdwhZ4RTm16?=
 =?us-ascii?Q?rVPyHnhx/9lDskQdBYW5bJvB8tL7lLeyX3Fe/ESScjNxQQ8Y6oYO7xCCj9dy?=
 =?us-ascii?Q?GyQScmGaRfGCc6VSzqLMKOONrrmS2LfSWhSh2vGybeyhY5/8Gin5XIbwis8o?=
 =?us-ascii?Q?aWqYz7rxCrGSmI1XY18xa+om24ro/ii5ZwG7cZMwAFiuwDuUjRUYxSA+paoN?=
 =?us-ascii?Q?wMl5Fg81RZNXz+NLwpqPbMvSgNceNVuWeEEluHrsJxbWXchD/kUzm93VdXLM?=
 =?us-ascii?Q?XKJu88FXTo55F3gCYBYUIgbJb+8Z4dWyCkSZ1d9kBS5AC+3Ax7+M56CpKXQA?=
 =?us-ascii?Q?zlH/KEI/TBo7ONmMgkA2J3FcBKuCqV+xUXFziDItLA9a0Qci02AuMeap11Vr?=
 =?us-ascii?Q?Qk3P3qWjWTRNPVYeC1Op5QFJHYkgD8RmEgZFxU0AfDSsKhhyt93+4UWQgoDX?=
 =?us-ascii?Q?NDBlwtSHK+hmdmNeLjVkdd9uIRDE8PTxR82HinFULUJYHZnd1Bhc4LWiGfxv?=
 =?us-ascii?Q?8FBc/0wf+y42kdNYCgtQOVe8KtmmMxC87sPvYBeShyQpx+oPFeU6IuGIsIgS?=
 =?us-ascii?Q?0ZThDcoE7X01ZDfiRgrSroyF5VYFSBR2QtqokBN/KrOdNspwSSGojgClo644?=
 =?us-ascii?Q?HKQYeEsg7ikWjOb5WhoBYzUfGVJYB5z8pXjHfMwz8Rr45SLTxmrUiL4FzHR0?=
 =?us-ascii?Q?8ag8mV4et+qh4zmwsaa342/MG8WkwrCPEkBOW2wmvvZWhIrZwTYVIgBgOswI?=
 =?us-ascii?Q?Vf+96wNU0AoWpYQHEsONLtE7e8mU5KPUokJjFmYac3CpPIK5ErFiSDWFp0ep?=
 =?us-ascii?Q?UTBr4lwSf+MtQgnATLuuAYVSiyOi9D0NX35Zw2qAa/3IE5eHG80febl6RvZY?=
 =?us-ascii?Q?CYWTKVVn9QrYc1CTUnVhjldQL/fhGkmx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?arJF9rY1UYwmp38g5U39JcjV0O4ur6M6tdIp5p+wS0byAT50WdykjoaFumAX?=
 =?us-ascii?Q?le0vnEYAN01lMLFTcGrsX71WNedFkTu9lDPwXZIerxwsz+XW68zVg4h20YJQ?=
 =?us-ascii?Q?z+HXkWir+MJt6mqY/DaKjtFWsUpSSetY0x0b3v+kbCb1mfcD4ChVAFrW4WE0?=
 =?us-ascii?Q?FbkZKbaCsZufo4LZMkPxlSnGIUAMqZiXDS4hcHJHu1EqzvlUasRR3numM+ay?=
 =?us-ascii?Q?wuucsOEkIqEqHouRMwYOy7BvMnnkFT4vX9FgptSrhH5rqv98SRH4t6uKXny9?=
 =?us-ascii?Q?JRLNmBZrn9rqY4gb3EIxMzm6fUOJJI5Oya9RVSA9ps51W8VIY4ZeWPlT5ehU?=
 =?us-ascii?Q?b4eVhVJu2s3BYNnQFTYWb65RkaBKu4I+OcLAPHA4mzItlf1hSSwg7F9v/L2C?=
 =?us-ascii?Q?+7CFoAqCGSqoW1b+d6OZA9bN1ho5BGt29UtOlWAfnxaYkzPwi5e4uIt4GpCi?=
 =?us-ascii?Q?erLitdU8ZIEXcHjtAiK+SjCmLw+Jscx1Zm21WFkNTSSktk9EFRjyeGlVYwnn?=
 =?us-ascii?Q?u291gxo/divfI7rUvIzldBHvG+HueF4BQkTjh4KsD7CphrK8FDhbfKSEISqe?=
 =?us-ascii?Q?2ZOHxAIlzhnbwzJh+3FeR9H+GQBYkljX35YQZEhMWevgl21qXtox2u6RQP4G?=
 =?us-ascii?Q?dLMvmiCNQOwvMSFWgtblU+L12HAI6hK08b63aY5+9OQn2SahcU6yz77ucxNq?=
 =?us-ascii?Q?l4RqFPqroq22k2Vy4Oo7+Jws0e4r6YJOsl8lbsNfVsJadMUi8Nsy0gMqsyez?=
 =?us-ascii?Q?bo/Cy/XMDoBikKjTIgpiMwu2E/bHqaiG/0ymmLiC9C5QH3sWr9V+duCz2fJA?=
 =?us-ascii?Q?yvFsXc1uPHcmZfIDC0lWLq0sXohs9XUYDsfEUjJuV33xCMcT9diaxYY720/7?=
 =?us-ascii?Q?ju81uEUcuw/eFUR/i7GX8z37kubhcOOHcKqvsPJI47L9r29imJUv+uT2nNOV?=
 =?us-ascii?Q?3N0KT1wa/ExGQZ5HaluoVT34VGIMYPql70AHo6iAdttxo93KDgdb7pLL3OiY?=
 =?us-ascii?Q?k9OxaW6hHoFRL/3W5W/Gdq3BHfnaQSG9izwlQZMVrxTID4llIF7g2r7dirSV?=
 =?us-ascii?Q?3Pc78UWkaJxlEj+LxCmFUuI+ZwByowvJyu6HEozutB6TdlAN5SW3Tc2dE7sl?=
 =?us-ascii?Q?jlrYU6rX3YcqO4/bVFekgkD3cS9pDauO+b8NY4YEvBxpr8jd1aVawQANdWO4?=
 =?us-ascii?Q?UJ3ANU6nOmWcPuchKfLPargL66Syk+Z2xUXaK/F+X3KtVgO9Hm8hunkmHPnC?=
 =?us-ascii?Q?UbhNKUFmxTsKFa8I4xeXkMUcv6pIwdQjFTLRLUu1r1Mpu8MmpY1ItGZOZsgD?=
 =?us-ascii?Q?tyojBL1LBO2tQMvP/gOqbI3Kdk674I1840HRXB4FWP0M7XluHKcSctmPUXum?=
 =?us-ascii?Q?Djz0zwAeeBFJWyCd6UpdZhJ+Xyry3czCLI0YMPRg1sf5ekt3MrFtAzCN2xIW?=
 =?us-ascii?Q?8e2EBT+HvYsQ14rbaJWcAXFSKPjm3KWv2kixb7oZYotN2xqvdPQ6ou69wP9l?=
 =?us-ascii?Q?frXhG3rrsZBKrbFOeGm+RalXPJg0ffYA2VGb+6FZpWd8bZULM96wJ/AAXmQG?=
 =?us-ascii?Q?aj+QVtTDTALPxAQkP0sLrK5IhOvJjT+yXl2IsEdmBlDnyAw17aNscy9D7zEl?=
 =?us-ascii?Q?M9+6xGwWFB7FnYiZ3+3ckIH2M1ebYmnB3EX+S1+MTMC+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ecfb3a-ed20-4591-9ef2-08de274c36a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 09:15:42.6114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mM9QwCReLOHy+jKUO4SKPUyPqaDrVrjOyKySjVokezC+z075fKottJ0JZK8MZoAN4j06kc3+gFPkRrpKtivPvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF64191BB3C
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

On Wed, Nov 19, 2025 at 09:38:10AM +0200, Suraj Kandpal wrote:
> > Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
> > 
> > On Mon, Nov 17, 2025 at 07:09:38AM +0200, Suraj Kandpal wrote:
> > > > -----Original Message-----
> > > > From: Jani Nikula <jani.nikula@linux.intel.com>
> > > > Sent: Thursday, November 13, 2025 9:55 PM
> > > > To: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj
> > > > <suraj.kandpal@intel.com>
> > > > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> > > > intel- gfx@lists.freedesktop.org; Nautiyal, Ankit K
> > > > <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > > > <arun.r.murthy@intel.com>
> > > > Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0
> > > > vcpi
> > > >
> > > > On Thu, 13 Nov 2025, Imre Deak <imre.deak@intel.com> wrote:
> > > > > On Thu, Nov 13, 2025 at 10:09:19AM +0530, Suraj Kandpal wrote:
> > > > >> When releasing a timeslot there is a slight chance we may end up
> > > > >> with the wrong payload mask due to overflow if the
> > > > >> delayed_destroy_work ends up coming into play after a DP 2.1
> > > > >> monitor gets disconnected which causes vcpi to become 0 then we
> > > > >> try to make the payload = ~BIT(vcpi - 1) which is a negative shift.
> > > > >>
> > > > >> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > >> ---
> > > > >>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> > > > >>  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > >>
> > > > >> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > >> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > >> index 64e5c176d5cc..3cf1eafcfcb5 100644
> > > > >> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > >> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > >> @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct
> > > > drm_atomic_state *state,
> > > > >>  	struct drm_dp_mst_atomic_payload *payload;
> > > > >>  	struct drm_connector_state *old_conn_state, *new_conn_state;
> > > > >>  	bool update_payload = true;
> > > > >> +	int bit;
> > > > >>
> > > > >>  	old_conn_state = drm_atomic_get_old_connector_state(state,
> > > > >> port-
> > > > >connector);
> > > > >>  	if (!old_conn_state->crtc)
> > > > >> @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct
> > > > drm_atomic_state *state,
> > > > >>  	if (!payload->delete) {
> > > > >>  		payload->pbn = 0;
> > > > >>  		payload->delete = true;
> > > > >> -		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
> > > > >> +		bit = payload->vcpi ? payload->vcpi - 1 : 0;
> > > > >> +		topology_state->payload_mask &= ~BIT(bit);
> > > > >
> > > > > This looks wrong, clearing the bit for an unrelated payload.
> > > >
> > > > Agreed.
> > > >
> > > > The logs have, among other things,
> > > >
> > > > <7> [515.138211] xe 0000:03:00.0:
> > > > [drm:intel_dp_sink_set_dsc_decompression
> > > > [xe]] Failed to enable sink decompression state
> > > >
> > > > <7> [515.193484] xe 0000:03:00.0: [drm:drm_dp_add_payload_part1
> > > > [drm_display_helper]] VCPI 0 for port ffff888126ce9000 not in
> > > > topology, not creating a payload to remote
> > > >
> > > > <7> [515.194671] xe 0000:03:00.0: [drm:drm_dp_add_payload_part2
> > > > [drm_display_helper]] Part 1 of payload creation for DP-5 failed,
> > > > skipping part 2
> > > >
> > > > <7> [515.347331] xe 0000:03:00.0: [drm:drm_dp_remove_payload_part1
> > > > [drm_display_helper]] Payload for VCPI 0 not in topology, not
> > > > sending remove
> > > >
> > > > So it's no wonder the port's not in topology and everything fails.
> > > > We obviously need to skip payload_mask updates when the VCPI is 0,
> > > > but that's just a symptom of other stuff going wrong first. Perhaps
> > > > we could do with some earlier error handling too?
> > >
> > > Yes I agree the question is how high will the error handling needs to be
> > added.
> > > A lot of weird things going on here.
> > >
> > > 1st one is how is it finding a payload which we do not create while we
> > > call destroy function
> > >
> > > 2nd how is VCPI with id 0 possible from what I see VCPI are 1 at least
> > > that's what I gather from
> > > drm_dp_mst_atomic_check_payload_alloc_limits.So what are we missing
> > when we create a payload?
> > >
> > > Imre, Jani any idea still new to how payload creation work so am I
> > > missing something.
> > 
> > A VCPI ID will be assigned to a payload during an atomic commit only if the
> > corresponding MST connector is still connected. If the MST connector gets
> > disconnected by the time of the atomic commit - as in the above case - no VCPI
> > ID will assigned and the allocation table in the branch device cannot be
> > updated either for the payload, as indicated by the above payload
> > creation/removal failed messages.
> > 
> > I think the fix should be not to clear the VCPI ID if it's 0. Valid VCPI IDs start
> > from 1.
> 
> Hmm then in that case should we just return 0 early if vcpi turns out to be 0 here.

The payload should be still deleted, so only the clearing of VCPI ID
from payload_mask needs to be avoided if the ID is 0.

> Regards,
> Suraj Kandpal
> 
> > > Regards
> > > Suraj Kandpal
> > >
> > > > BR,
> > > > Jani.
> > > >
> > > >
> > > > >
> > > > >>  	}
> > > > >>
> > > > >>  	return 0;
> > > > >> --
> > > > >> 2.34.1
> > > > >>
> > > >
> > > > --
> > > > Jani Nikula, Intel
