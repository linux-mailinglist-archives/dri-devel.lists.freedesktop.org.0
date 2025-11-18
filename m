Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8201C6B19E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 19:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A3B10E505;
	Tue, 18 Nov 2025 18:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1BxmSbR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F49210E4F7;
 Tue, 18 Nov 2025 18:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763489226; x=1795025226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fbfdR89GO+7wGXwcAqvxWagcnx97oxlYVj99xf9C8X8=;
 b=n1BxmSbRNHu79K9cjgby0O4yw6QfXGv0u/V5Wl9mpVuic9eBNPWzRY5S
 mbXeJb4+3qFdJuEXbkA59X1BrcffQtddNUxXSrvjMiJRoUIa5OneZeyYX
 4Wn0rUV5IR4pnc5QRfzcghz4MvcRj3sL+BgJc+NRLGba4XKxpc8Mn8mHv
 e7u2MA+ZWc3mWdh4zsYE81DdRDfN6b6eys5Mfdv+XqDLs+juLRfcAviNE
 WuxDCfEDw+3v5oFnbGHvvEM167dFiaDUPrzqlXsDozUw0SM6yLrOuPCby
 NhraEy6FCzZnTjqLBkvcNQrkEpSug+Vrb4g0xdrJAnoXadxSwfBf8SF7k A==;
X-CSE-ConnectionGUID: pSLY5DOoTpSsCiYy4vtVug==
X-CSE-MsgGUID: TUFDaUkXRb+oil/ehRASFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76976665"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76976665"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 10:07:05 -0800
X-CSE-ConnectionGUID: Z6+vfwidTuO9eqzAJ/qvqA==
X-CSE-MsgGUID: Kq30GcpqTgGAO2gRSCxVqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190084548"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 10:07:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 10:07:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 10:07:04 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 10:07:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/hNAwvwIrghtc4eEf23wr1A/EZoz0iKHABkWtV/jCmV2OqjVJR2MfmcRPTViPwc25Z5EVHY3UKm4xCoSFQjQBapAVmnoIdJgAJA16pZ1rffCGrKrzdRNLilrBR2qpIhEGC2A/2hV7dey3/Py1uOploPU5DXwFmV12jBtNNu7gePrYuBUaPwn9+H+esAr8YrqzfZ+1YW7ob6mdYETvTBh6Hb4sGMKlbv3MPj+gAkQ+hil+IQUJU6r1f27Gb6rKVpqD08xZGWsNSBv/1vPaXGravNFWGYQQT3WzYf7eKbPzUjAKNJdCQszWeh/DAc7Stqd6FvhL2fSPwCvR9XkzZmMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLvPKJgv/ffkl5V4LkrK5QsJTEHsKF73yek4Z2I/dQo=;
 b=YiywFubWIHy2buqtI+UrpAlDi87WLDFQes2bYPRCPYoKPQLe7HV1Do7Zqtrpucm4V/A1xzVk7mns+EWEARnxKcIeERzNp1S6iwCeCU9+WlP/emIlPpGnbUPNERE2JGQk+L7iWkCVn/cx8J8K8M41LBvykncgJfgewjMYWQ7drnhntbQR9whGwc0Kjznqyiw/4aXIgvZaNOzer0Q/drn2hvf594HDUlFYAjPHVsqqTmOklas/ZBcac6SGZD0Dn6mO2BsnVJ8UXBpfkeh6XcFPhnIe8DDPGY1aqOsybpAs6b5ritJDv1CCtXobF7x/m6tCOvSIIvXJMS1uxGlHPXqVIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 18:07:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 18:07:01 +0000
Date: Tue, 18 Nov 2025 10:06:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 7/7] drm/xe: Only toggle scheduling in TDR if GuC is
 running
Message-ID: <aRy1wrP2SxxXVQGh@lstrano-desk.jf.intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-8-matthew.brost@intel.com>
 <aRfQ-fh6xxw2sMq_@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRfQ-fh6xxw2sMq_@nvishwa1-desk>
X-ClientProxiedBy: MW4PR04CA0290.namprd04.prod.outlook.com
 (2603:10b6:303:89::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV1PR11MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4dc901-779e-42ff-54fc-08de26cd45eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rnjLG2EvFadaJbvSc9VxDCJqesu5naKjEtQGXUfDx/5WmzOo/XSLfHbLtfgo?=
 =?us-ascii?Q?gwznhL7tO3uSvunlLjhhan6CLKe7iNNzynVR9QKHISCysE3cGBgP20w+Lqtv?=
 =?us-ascii?Q?edyB+adUIIfQWz3TCsCwJvBWGu7isYCibJzCEDFKmeaX76/QwjvPN7/EwE3m?=
 =?us-ascii?Q?ujKQI7indHGk7OFna1av3rGY3iVOnDfy4NPfzJUXMHtuoE6ybmBi+0A14FQa?=
 =?us-ascii?Q?Sx9zF9nYS8dBbbRxvILm6eFSKGyRJWDCUNO6zqIUrSttKQMnOPaY7+02DF0v?=
 =?us-ascii?Q?Cl9ZsPqvhcacspfSm9P/TTKVGI6sOFAfGd027i7f2+eLgDCiQRRlWcoZqUsk?=
 =?us-ascii?Q?TtZ0wWOO+qW91dMftMo5UQeqraMfGNoSaur0CHGUCw2T1HCa+49cbJQ4fdZl?=
 =?us-ascii?Q?rhJisIHCU8ziTCgTLs+Bfg738E60no+LnovIUc4lPSDbFwbjv4A04FRX8yim?=
 =?us-ascii?Q?qQrdtZ5GZmNxm0zHjry8hZ9xv8lirVHmS6xaWvYke/BjhfMtpQtS78RDm3J0?=
 =?us-ascii?Q?rX67iVJb2u1n1V6e5qUtfW0lCqjpvo6TJLlpm99kG+zJWC4zsJMlEiTuDoFU?=
 =?us-ascii?Q?5J/oXtJrhXNhaqfmAaTTrZZ4cCYEd6kE1wSvy9iOsUijR0OaBMED43LjwhAg?=
 =?us-ascii?Q?PymqPn/amyPFoGfGMJ2ifv8XoDME5MrmaVIlwAaHux5JM1XQTBFBBt2/9p00?=
 =?us-ascii?Q?RYVJ0xZb5fYyT5WhEMC2KkzMkhDG3JHz2fo54kxOofodsFUmKRji/fnSWAki?=
 =?us-ascii?Q?r/++16Q/MF4IERQbVGZEIisG9MQkRaNU/CG5SND0X6NaKafSDOOpIiUYrMCE?=
 =?us-ascii?Q?boQ0vDU0/LDLzX46gH4U6yVZifJ8xarkEPs9YLZgw7ncwSQGMhoP2GzGOeDg?=
 =?us-ascii?Q?mNXg34V9Om5uW7ljCkCX6VlWVecT81jLoEuEzs4ekvqZpMTq/16B2rLJmQ7v?=
 =?us-ascii?Q?oufDZ4O30wSL54DV8mrI8R6UIczBG0Vhtq9/hWxZienCqX2AeJ/U5Re3oyiL?=
 =?us-ascii?Q?4p3ibB34UAhLDjIWPqLU0bAQeq7xTWYCIaWLwNg6qfgiiF3piPcvuxSn23O9?=
 =?us-ascii?Q?4fpnZjuwjz04Nbs0rx66W+U5t4gxxy5STt1Hw0pZxqLHbtY2n8QUOf1G8IRt?=
 =?us-ascii?Q?laAKx0UG+BQoBgFVWw6Zg+eefs4Ca3GmDx7BokmEtczBLNn+cFJbrVjB8CUf?=
 =?us-ascii?Q?jE77ByNrzFn2udYSFPQadE/J6Y7U1vUVcadj9S1qMjiXU+co2HQUugYYSJ+9?=
 =?us-ascii?Q?cPBKS7w6d4QUGyAlmT3qBVK0WmySLQaXijVPxaS2e6FgsPszUJhzHhbV/qgh?=
 =?us-ascii?Q?hbu4AjHL4bnqo3aquGZI1cFvXJQmVW4TfILIxTKs7mUN8lsg4ccti23tVsWH?=
 =?us-ascii?Q?JL9adLfjojP0wB2d0SwP5jacmSxregt+TGNfmztX/7cqwExC068pqwkH3w8P?=
 =?us-ascii?Q?DeX7YptAsiK22REnfew/678qcgF/5hEN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NuEDnOtn57rMhbGnX7GO6nX5KPepVioDegxzGGRc834+FoeMCYDGCv/iBHL6?=
 =?us-ascii?Q?z7fpLoAUH26RXntAfua7cTmFnV+F0wU+pETvMlYFKDD6MV/i1YT95VEC4b70?=
 =?us-ascii?Q?+q6sTKi1Ux5xCv43OGDv3Zie32d4UP2mWKy5BXVyVTBIUmGe9YkT0nzQ0EHX?=
 =?us-ascii?Q?IqqTTx0ik4Onbt/26jIlBP9M+DCVm0VQXnHoIl6Gpk6eBM3T43VVFnOWaVAy?=
 =?us-ascii?Q?GIFoiac23v1EQy6Zff0nbiDOkoSZQ2ic4xPrEcupLf3PEAdy8KzOPpYP7PQt?=
 =?us-ascii?Q?vAE5P0VaO10wVNIyP6BruP7gZsxonfFY4oP4dazyliYpFFNU3/Zs6THaRuIU?=
 =?us-ascii?Q?ZOMOYvsNTFJsHC40utBzKH1HkuxX06pPsxZjGR+T5e6jblkYLazpUS+stCN6?=
 =?us-ascii?Q?fiRFhNfKxN/Dw+x6CpQmt4X6/LUKX9URAIPhbnGB8XyTtLEQJ+VrdCuuVk8z?=
 =?us-ascii?Q?NY7W9eXdOF4JlgtydL9Xzh5fThzYIrqeiB6dI/NQdDE7yWjE6PGUffLubjhN?=
 =?us-ascii?Q?j8z9dn0wQJvky1MC1GMGmR506DCwdk/+ju8Hq28+H1+BXJmvuiaP3YNrAell?=
 =?us-ascii?Q?2UK+WvzWMoGuMRIHzGN4hPy30E0V2/bOQq5qb71GkPm9Ff4xDkvipprgXMWG?=
 =?us-ascii?Q?RBYoziheFP6QrguuD2qX4brPMZyzUlQm4dt4U9vuMPZdEMNo4YyAg4VOx4Nd?=
 =?us-ascii?Q?NBqcPozvl6N0+XLQlB5Rz1d//4qrHXT2ajFQaKLs9b514ZKqkzYo4a63n1HW?=
 =?us-ascii?Q?j+qeyKQYLRj+Ls8q1HmojAQ82I/9FFo1dmyOKnb6UAS3ZsJmHr1AlTpli1Qd?=
 =?us-ascii?Q?4oT8+3n1qCYSBx67YJRS5sKK1jpxxKvFwTZVYGVPPY9O5zW4S6RE2pouh6aC?=
 =?us-ascii?Q?+ocz7yU3Pw4/o7Acap0IQkLRQQgEDFbw4FNrpgDmOAZON9BUGpleTO7n6gjU?=
 =?us-ascii?Q?dhvQaTj+brZwTVhzgllXjGNIlmZwDhmUtiUmwJQTWxix2ZQv664XpHC4cozJ?=
 =?us-ascii?Q?3ydiTVhm7Z9Rhd51o9cmjcFngddoD/v5EQhTDq5i4hLHT61jdRnEiV0xEQp+?=
 =?us-ascii?Q?peqPCRiaxixMVPXiB0WeQSXG4n+MXHzVZs37a7X49JV7SGWAANztN9CENsld?=
 =?us-ascii?Q?MhK9dHxi1D3EfWkMBOCo1P3yBFfR/yNsy4EEeHp1Cv1JPZn79HIqfwVUu+jO?=
 =?us-ascii?Q?UEE7yAfy4Kqlr08A3eOkeqrY9uKcVtGKHKNeyhcgj3cru5W/pHoMrQjdIgpI?=
 =?us-ascii?Q?mrYagoBVwxPhWugqjeQ/La29rmVyCUat3nfXbD4b8lfesXM8y2rpjZAyR3hj?=
 =?us-ascii?Q?vndu5YMhVJiHX19foIzXyE+bVPbP+9dN68RctTvi11rkKCH3H4h05/eSaJXT?=
 =?us-ascii?Q?cPpgnk6OeIDr4tN4Xhn9MIr1AoYTP+ev206DzQ9Sl2xzVAYOSyg5yhlAnER1?=
 =?us-ascii?Q?G/CQDSq3VNcwEUrjpAORkvpUAY56rLoC86imAfG6yexfZO66Xi092B6tNdG4?=
 =?us-ascii?Q?7Ms/PceQ6NQx6lccNLBGCaCRC6w4XkrDnHN1U2nTx+01Kex6xK9zpU2yXX3s?=
 =?us-ascii?Q?Ldj+RlMgakmAGHDRSuoM2oPrrVY8RI34QhyzlzIUPqnoHRyAdxj97RE2+R1j?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4dc901-779e-42ff-54fc-08de26cd45eb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 18:07:01.8694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQXOLGj+oKSP8uM0Nu+nAVVbkZOZ+IA4IZqPPZEbj5mkq+jxv6HxFJOg9pCnt1c83qhGRBjSRjCCHUECpW+rkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
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

On Fri, Nov 14, 2025 at 05:01:45PM -0800, Niranjana Vishwanathapura wrote:
> On Thu, Oct 16, 2025 at 01:48:26PM -0700, Matthew Brost wrote:
> > If the firmware is not running during TDR (e.g., when the driver is
> > unloading), there's no need to toggle scheduling in the GuC. In such
> > cases, skip this step.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index bb1f2929441c..ea0cfd866981 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1146,7 +1146,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 		if (exec_queue_reset(q))
> > 			err = -EIO;
> > 
> > -		if (!exec_queue_destroyed(q)) {
> > +		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
> > 			/*
> > 			 * Wait for any pending G2H to flush out before
> > 			 * modifying state
> 
> Looking at the code, it seems like if we skip this 'if' statement (when fw is
> not running), then it will go wait for ct->wq. Not sure how that gets woken up
> and logic might try to reset gt after that? Not sure if we should check
> xe_uc_fw_is_running() here will one of the conditions to wait_event_timeout()
> call cover this case and we can handle it appropriately after wait_event_timeout()
> returns?

I believe exec_queue_pending_disable will never be true, but maybe there
is race there. Let me and this condition for safety.

Matt

> 
> Niranjana
> 
> > -- 
> > 2.34.1
> > 
