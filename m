Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28B49E32CB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 05:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EF610E29E;
	Wed,  4 Dec 2024 04:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6Wcdw24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8468410E29E;
 Wed,  4 Dec 2024 04:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733288116; x=1764824116;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xcf4ddmvsA36k24BAG+FhphPS20/GlIjjJbx2lSgqkU=;
 b=Q6Wcdw24UmL7uvYJtXkvSa7zM4MfBKt6Z3eBC5r9/xJg6mxk1RNu33Sv
 W0iVFKpzfQmWr6zrBtW1umcf/kcKgmx7xRb9rl6p2bVntIkQdBkq4gWq4
 KGq+FT8TRtRu6fCnZeC85eWJdQquTlXk4d5aAR8lbxwIKvQvtFU8otzg1
 0UStMaHnJTgQp0V9hLdsOSoJ1+fC4FzE7ZLsdcSAdXRcfPi1Suw/Al/ID
 Yl8w/ZmTp8RP8BjEYJM1B8d4xsBH1Vvm73zYFKo1pnTgP2esTQBcJb46O
 CAxgAaXX3c8aLbLh4cdNPwKL8wY0f8aFzLq/7jsX88PSAiM4+9qRQ6bA4 A==;
X-CSE-ConnectionGUID: 1kA56iPGR3C7FviC6/FlJg==
X-CSE-MsgGUID: eRqHWIVYSV6SB+IOQQeQFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="36383742"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="36383742"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 20:55:15 -0800
X-CSE-ConnectionGUID: qJodM93FSsSa7DifaHxbMw==
X-CSE-MsgGUID: xY0NF5RlQdK4KCXRZDdxEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93839327"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 20:55:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 20:55:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 20:55:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 20:55:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSiWzoAQxwF4W32RCwmSVJCOinDU+LdUejsg6GwI5b/H8pMYL6+/y9GBTvQlMHBvJIPRhdGgwUBFmAxLIpATLzfAzFViXdxC46n+MjjYie+CQefv1dkNyQqqcnBVCbWU9SIIHnlblzr5oeTtmYkQx8crpAakVjwUkB+epUdflknn0mtYyGo8X7N4s6ZBktNt+0v0wKbvVez341b6b/b1lCiNbNYSQfG069fqxR2KZTrCWMvOBNv2e+psJHz7copmLWcEMq+WFI/gLQRet0nmmj4AHEEkmXnDFaHIn7ngNutO9/5WDXsXORP4acQx5s92JOh6TIYZg3KGe1wTzM1tZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JbRbONjVpWbqpJrimyEz0zm+YET6mDrn7Zh0oaXDio=;
 b=qtbyYbxCN9pJxkxs95jLYwfuAHwgCpNRsJ9FUTbUUe82n522qnoiElCy/rcNu2FNHPJdrI67u4YR4gihLB+K1MMPfmmXAzNAmP+fCHtopQgpdTRLwTCy/g5JPc79eLvNiykJ/CYHTG6Ck+cvOpHboTaP5fAkbq7g9L1ePc8K3rxl4ukG597QKfZdZ4i9zUz9qOxKC5VTenmG5pdIomlTf9DOBAYHqwmkMNnJLlGp3vyPwVvQ9tFHGpBW3K54RNrhC5o5i2aQP5UF7WVQiKodatN6wQucNgjD1hgZk6fpsLKFYlIfTqcjZrq3RRfGJdxfF0IKWQmMyPFlkJDr+nLlKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 04:55:12 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 04:55:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv6 09/10] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Topic: [PATCHv6 09/10] drm/i915/histogram: Histogram changes for
 Display 20+
Thread-Index: AQHbRUljZw3qyQQQ2kW8h/UsF7/dV7LVhrQw
Date: Wed, 4 Dec 2024 04:55:12 +0000
Message-ID: <SN7PR11MB6750AE15FD6EDD33F28C3441E3372@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
 <20241203055520.1704661-10-arun.r.murthy@intel.com>
In-Reply-To: <20241203055520.1704661-10-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH3PR11MB7203:EE_
x-ms-office365-filtering-correlation-id: e25690e0-2c5b-4946-6080-08dd141fd5e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TkKbTMAY++lGPyCLIq+ctSO9Z3jbD/AF1zXnWWUe+Z2JInUQJMC1GoyzY1ga?=
 =?us-ascii?Q?53ouet4BIFWVU/5aiQu3PD1+ErQbnUQYRc/+XMX/Am52QIJ4pyqR6hFNJXkp?=
 =?us-ascii?Q?kXctnUQgrPLpsTtbiG7ohag18pNypHu/oT3KSNdr+67orWfYqfjG+TOU81tr?=
 =?us-ascii?Q?bDC1EdA3dySHd1u0CjrgglAoQszGgqMSbjwdZuw33jytIR4V5SJYiPymIIwf?=
 =?us-ascii?Q?PCW7rq4ClTCDm6jkMG4A1hkyDmuTdHKFjHu7deUcIccg5ZiAqzdXzPlIVH2h?=
 =?us-ascii?Q?rYBbcbecsGTlY+lKurrWxvLia9KqqkfH9uuzwFcJv+I7C3dY4VJ+pPHa1q/u?=
 =?us-ascii?Q?jX97GMdmUkJMeaXb5vB1QG0FCaCyU8n6XGHxp+qzA6ZGayR+Li2JrUSDhvZS?=
 =?us-ascii?Q?VbsrJpjXkHzoVXpxGPuua+6C1U5rkrYEPKl5guDKGyFxIgaDYYbpL06XgNxR?=
 =?us-ascii?Q?zN6K9DzWlnoq70HnEKeA42kV3DUv6h1y+0D1iTimXqVD+/QrRdNM4ovOeTTo?=
 =?us-ascii?Q?h8WzVWOn4HSz6tlkOPeGnrSjKJJqDa7VK+Xng4ZDkZpyMY7/ro4i2z86IBNs?=
 =?us-ascii?Q?GPrG97QKGQb9WPUw5SXDI83uZNSmvUzhETNI2IIyAOKZafKxnsGQFzuoltGq?=
 =?us-ascii?Q?cePKsKNsaXSLg6nej9i+w2ed8k8nwmCqrfRrVvFLI69dCXpR1kTxI+d2UkzO?=
 =?us-ascii?Q?g5qVo0Ll1phLm26sNLifOmVEE/3bgAsO+C49mlTDMyFKlLCXiM3ydy+w7OTa?=
 =?us-ascii?Q?WdvZh0AdIp1aCvHvOJzNj0Wy4QAZKNDZQPOJkE+rSFQEprPwd0Kn5sCyCs+b?=
 =?us-ascii?Q?mTfPx8huNoxhV7Xi1MzxvkCKm/XjMJQgyQ6tWPYzqcLbPpLal8wwdFUUyeCW?=
 =?us-ascii?Q?yBgE1v1br10ffzHgmvi3bUAqClKcXlzlBO7h9ap8a12nIYAaQV7eMQKAQtOf?=
 =?us-ascii?Q?j7Exj5ffskLTVgU1T8K7qjXYs/1wKxMH6Pwtpx1zVeDoitJBxu/6PWSllst4?=
 =?us-ascii?Q?wxFxsYcLXCJyLYdq9irxKpD9cpUvDkGGZUfPcT5+FoaNi17e3gXBjgBKFMj2?=
 =?us-ascii?Q?OSdkRZN8Rp8iVL4Ew4LVOSBC9JU+k8pUGiHlgQCGgo9uhyLt4d41znNJ1vG9?=
 =?us-ascii?Q?aegh9zmdkY26FjOy1F6lBWYld3M0MJulso9QIT4v51zRWpoGDgq3YouomHbn?=
 =?us-ascii?Q?UcZ279ZvKQdHBoC8rCRni6VUalEE5L86kyJJU3CPsQ28AGUPktW06aukE3ww?=
 =?us-ascii?Q?OjzRfGKEJ/yRU5QbUAGZk5PowODZX1f/WDd5oNugORrY5JTRrJSq5Fgi765A?=
 =?us-ascii?Q?q3ese4roBHUOg36ZBpwMfsuw6rKRT2dgHt8JviU34XwwI1OXKlrT/PoG/o+O?=
 =?us-ascii?Q?jjudmIj3+tGu+Z7zwUQwkmMIkVEya5S31/oYk3SVRfzVmyqtEg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hbCbp1kYJGsDgtsnb8s/6zPMkd77s8m+P0BcBCtLhs2RoHT93uVx6ZJlLJE8?=
 =?us-ascii?Q?uq+wJx2JHhnCbG1etkiXUUsXNm6skshseouT4eKVMret1uvCkE/rv8NhKUuO?=
 =?us-ascii?Q?Krj5fT25hnv2sEQtI8GTYW1RE1kdkegibFlHa2QNp+3XssShVp5EeR4f07K/?=
 =?us-ascii?Q?fBJxwrswYIQ8s4Oc77w4aZxIlRrICryGo1DDn0z7ftcugMg8lwxpvAFfb/Y2?=
 =?us-ascii?Q?Z26KBxYxcsQbcJhwE676tz1FnCW78fMNnbDU6npJAQyIoIruydnhbDFv7boS?=
 =?us-ascii?Q?tXc1Tssv00dONoM+OZJgd7twy4GVoiBoIE9hPd9SO+sosWRZpGNh/WSBBScz?=
 =?us-ascii?Q?tUrfnJRWF5da7CjZoihve4pGs6lt7+IShCe2siw6ijls3azbkZnTodYqMIYW?=
 =?us-ascii?Q?soD8tY9lcvJu8HOmVTTcb3lO3wQmvZb87mpxzam7g+zuNAogneR9v+7hbHAW?=
 =?us-ascii?Q?knmNg/IKWR4wJOdA8qE1RmCMXzDdK9JhnpsnQaZLcBMIjwpZE50X4aVUVfOv?=
 =?us-ascii?Q?1ZATrI6MtZwC1g+bn9KA6vB2qECCx+Me/5gkUYtT4lKtN0ZoSqEG/KTj+AQX?=
 =?us-ascii?Q?G9uvOwLLsiMnIQymgqSNrFISU0Ph1NBe+8OZoLkUyOl4xIoOf2MRtZ0XfJwu?=
 =?us-ascii?Q?QY6wK8kOH5UZnV6PKf+mhOkFOcClXdICIRvEClIH2tLu/aux3nhm/A480v9a?=
 =?us-ascii?Q?ywF6h4gpwqjuITljge6CiQ+vGYYrHovtq0t+d+yr4OtVsVS6pB2Au/z5HGFK?=
 =?us-ascii?Q?7b1MvyK84/iK+4bKz6Xwkd08rtVuHotPD1lFfm8HW3KXVUvOxJAX7MOI1N+X?=
 =?us-ascii?Q?S6QiF5vvS8GLyAEIBHxf9hY6PPocGmoptmmt6vYTMQVYy7H+TaT+yOJYPDEd?=
 =?us-ascii?Q?Nzomzjk1DPgZy0YO1sWVtTFeHwNofMMEdIcB37COYoP3g+nzFQGq/Ug7wTLt?=
 =?us-ascii?Q?aiDGV1pxpmqPN+sBhmmuc7q/aapyQgho4/gUeKMLr8NP2VvOkJA5rOb9whyy?=
 =?us-ascii?Q?rhLTYu/xldLXLbLKH9jhsVmgc2zzasIIEWT0D5q2VPrFcCjIblAeEJZnT/Gp?=
 =?us-ascii?Q?i1IccniG/AQvxm5HnShTxwVAKPF/dMVCHquceBQ+cVRGYahLxNBY+XbK4t6D?=
 =?us-ascii?Q?UcPWemdGodOoLvjY48FmcpRarHf6HXd5USD85EWgD50v+VmlYV8b7nlwiZnf?=
 =?us-ascii?Q?BFas8mRgrRHHhNkNlIlySFg5YDQEAntVY16sztvFirsaddKbJ2ocVpk6UtdK?=
 =?us-ascii?Q?eFVkbJDBly+arxY45zpvM75wkh0N7/1joazjDFxTn3ho+r/8ZsjSRqzO/lK3?=
 =?us-ascii?Q?6YtjZtHCBrsD36yrqtVVYQt8Xip3E+6IiTVLAKzX+kfGWmap4Og8rtiE7azx?=
 =?us-ascii?Q?ymClkR2mgONPNCuR8BH2bwRPFNA4r4jTaImWvdPr73TvHFdtfCFErh6ZPrN2?=
 =?us-ascii?Q?5pjfNnCaihIJO5ZbeblW0qgT808BJfyuxkwT4KbgIR085TLslY9XayFd0jQh?=
 =?us-ascii?Q?qdFJ4gbOnvqQJLx8g0lg4ZFDDun82OSbH8oCnaLSzcsB7YvbSoUJ1tcxP1RE?=
 =?us-ascii?Q?1rhxZAAzx3jzXZbNldrfIlL+szq1n/LCpMHTLwVj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25690e0-2c5b-4946-6080-08dd141fd5e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 04:55:12.1345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbs5OUsrGk41B7toPknLqCCXOVr5bhRKVTr+yG8EuSXfsssSIhAPbhuNh9DpPAsPgP5/eMAqTx3QX5eULKs9VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Arun R Murthy
> Sent: Tuesday, December 3, 2024 11:25 AM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv6 09/10] drm/i915/histogram: Histogram changes for Displa=
y
> 20+
>=20
> In Display 20+, new registers are added for setting index, reading histog=
ram
> and writing the IET.
>=20
> v2: Removed duplicate code (Jani)
> v3: Moved histogram core changes to earlier patches (Jani/Suraj)
> v4: Rebased after addressing comments on patch 1
> v5: Added the retry logic from patch3 and rebased the patch series
> v6: optimize wite_iet() (Suraj)
>=20
> Bspec: 68895
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  .../gpu/drm/i915/display/intel_histogram.c    | 105 +++++++++++++-----
>  .../drm/i915/display/intel_histogram_regs.h   |  25 +++++
>  2 files changed, 103 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index 66006b75efaa..48495480107e 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -29,6 +29,37 @@ struct intel_histogram {
>  	u32 bin_data[HISTOGRAM_BIN_COUNT];
>  };
>=20
> +static void set_bin_index_0(struct intel_display *display, enum pipe
> +pipe) {
> +	if (DISPLAY_VER(display) >=3D 20)
> +		intel_de_rmw(display, DPST_IE_INDEX(pipe),
> +			     DPST_IE_BIN_INDEX_MASK,
> DPST_IE_BIN_INDEX(0));
> +	else
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_BIN_REG_MASK,
> +			     DPST_CTL_BIN_REG_CLEAR);
> +}
> +
> +static void write_iet(struct intel_display *display, enum pipe pipe,
> +			      u32 *data)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> +		if (DISPLAY_VER(display) >=3D 20)
> +			intel_de_rmw(display, DPST_IE_BIN(pipe),
> +				     DPST_IE_BIN_DATA_MASK,
> +				     DPST_IE_BIN_DATA(data[i]));
> +		else
> +			intel_de_rmw(display, DPST_BIN(pipe),
> +				     DPST_BIN_DATA_MASK,
> +				     DPST_BIN_DATA(data[i]));
> +
> +		drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n",
> +			       i, data[i]);
> +	}
> +}
> +
>  static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)  {
>  	struct intel_display *display =3D to_intel_display(intel_crtc); @@ -36,=
12
> +67,27 @@ static bool intel_histogram_get_data(struct intel_crtc *intel_c=
rtc)
>  	int index;
>  	u32 dpstbin;
>=20
> +	if (DISPLAY_VER(display) >=3D 20)
> +		intel_de_rmw(display, DPST_HIST_INDEX(intel_crtc->pipe),
> +			     DPST_HIST_BIN_INDEX_MASK,
> +			     DPST_HIST_BIN_INDEX(0));
> +	else
> +		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +			     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
> +
>  	for (index =3D 0; index < ARRAY_SIZE(histogram->bin_data); index++) {
> -		dpstbin =3D intel_de_read(display, DPST_BIN(intel_crtc->pipe));
> +		dpstbin =3D intel_de_read(display, (DISPLAY_VER(display) >=3D 20
> ?
> +					DPST_HIST_BIN(intel_crtc->pipe) :
> +					DPST_BIN(intel_crtc->pipe)));
>  		if (!(dpstbin & DPST_BIN_BUSY)) {
> -			histogram->bin_data[index] =3D dpstbin &
> DPST_BIN_DATA_MASK;
> -		} else
> +			histogram->bin_data[index] =3D dpstbin &
> (DISPLAY_VER(display) >=3D 20 ?
> +
> 	DPST_HIST_BIN_DATA_MASK :
> +
> 	DPST_BIN_DATA_MASK);
> +		} else {
> +			drm_err(display->drm, "Histogram bin busy,
> retyring\n");
> +			fsleep(2);
>  			return false;
> +		}
>  	}
>  	return true;
>  }
> @@ -69,8 +115,6 @@ static void intel_histogram_handle_int_work(struct
> work_struct *work)
>  	 * Set DPST_CTL Bin Reg function select to TC
>  	 * Set DPST_CTL Bin Register Index to 0
>  	 */
> -	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> -		     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
>  	for (retry =3D 0; retry < HISTOGRAM_BIN_READ_RETRY_COUNT; retry++)
> {
>  		if (intel_histogram_get_data(intel_crtc)) {
>  			u32 *data;
> @@ -165,15 +209,26 @@ static int intel_histogram_enable(struct intel_crtc
> *intel_crtc)
>  	if (histogram->enable)
>  		return 0;
>=20
> -	 /* enable histogram, clear DPST_CTL bin reg func select to TC */
> -	intel_de_rmw(display, DPST_CTL(pipe),
> -		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
> -		     DPST_CTL_HIST_MODE |
> DPST_CTL_IE_TABLE_VALUE_FORMAT |
> -		     DPST_CTL_ENHANCEMENT_MODE_MASK |
> DPST_CTL_IE_MODI_TABLE_EN,
> -		     DPST_CTL_BIN_REG_FUNC_TC | DPST_CTL_IE_HIST_EN |
> -		     DPST_CTL_HIST_MODE_HSV |
> -		     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC |
> -		     DPST_CTL_EN_MULTIPLICATIVE |
> DPST_CTL_IE_MODI_TABLE_EN);
> +	 /* enable histogram, clear DPST_BIN reg and select TC function */
> +	if (DISPLAY_VER(display) >=3D 20)
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE,
> +			     DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE_HSV);
> +	else
> +		 /* enable histogram, clear DPST_BIN reg and select TC
> function */
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE |
> +			     DPST_CTL_IE_TABLE_VALUE_FORMAT |
> +			     DPST_CTL_ENHANCEMENT_MODE_MASK |
> +			     DPST_CTL_IE_MODI_TABLE_EN,
> +			     DPST_CTL_BIN_REG_FUNC_TC |
> DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE_HSV |
> +			     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC
> |
> +			     DPST_CTL_EN_MULTIPLICATIVE |
> +			     DPST_CTL_IE_MODI_TABLE_EN);
>=20
>  	/* Re-Visit: check if wait for one vblank is required */
>  	drm_crtc_wait_one_vblank(&intel_crtc->base);
> @@ -242,7 +297,6 @@ int intel_histogram_set_iet_lut(struct intel_crtc
> *intel_crtc,
>  	struct intel_histogram *histogram =3D intel_crtc->histogram;
>  	struct intel_display *display =3D to_intel_display(intel_crtc);
>  	int pipe =3D intel_crtc->pipe;
> -	int i =3D 0;
>  	struct drm_histogram *hist;
>  	u32 *data;
>  	int ret;
> @@ -260,15 +314,15 @@ int intel_histogram_set_iet_lut(struct intel_crtc
> *intel_crtc,
>  		return -EINVAL;
>  	}
>=20
> -	/* Set DPST_CTL Bin Reg function select to IE & wait for a vblabk */
> -	intel_de_rmw(display, DPST_CTL(pipe),
> -		     DPST_CTL_BIN_REG_FUNC_SEL,
> DPST_CTL_BIN_REG_FUNC_IE);
>=20
> -	drm_crtc_wait_one_vblank(&intel_crtc->base);
> +	if (DISPLAY_VER(display) < 20) {
> +		/* Set DPST_CTL Bin Reg function select to IE & wait for a
> vblabk */
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_BIN_REG_FUNC_SEL,
> +			     DPST_CTL_BIN_REG_FUNC_IE);
> +	}
>=20
> -	 /* Set DPST_CTL Bin Register Index to 0 */
> -	intel_de_rmw(display, DPST_CTL(pipe),
> -		     DPST_CTL_BIN_REG_MASK, DPST_CTL_BIN_REG_CLEAR);
> +	set_bin_index_0(display, pipe);
>=20
>  	hist =3D (struct drm_histogram *)blob->data;
>  	data =3D kzalloc(sizeof(data) * hist->nr_elements, GFP_KERNEL); @@ -
> 279,11 +333,8 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel=
_crtc,
>  	if (ret)
>  		return ret;
>=20
> -	for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> -		intel_de_rmw(display, DPST_BIN(pipe),
> -			     DPST_BIN_DATA_MASK, data[i]);
> -		drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n", i,
> data[i]);
> -	}
> +	write_iet(display, pipe, data);
> +
>  	kfree(data);
>  	drm_property_blob_put(intel_crtc->base.state->histogram_iet);
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> index 213c9f483567..3fbb9c2deaae 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> @@ -45,6 +45,31 @@
>  #define _DPST_BIN_B					0x491C4
>  #define DPST_BIN(pipe)
> 	_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
>  #define  DPST_BIN_DATA_MASK
> 	REG_GENMASK(23, 0)
> +#define  DPST_BIN_DATA(val)
> 	REG_FIELD_PREP(DPST_BIN_DATA_MASK, val)
>  #define  DPST_BIN_BUSY					REG_BIT(31)
>=20
> +#define _DPST_HIST_INDEX_A				0x490D8
> +#define _DPST_HIST_INDEX_B				0x491D8
> +#define DPST_HIST_INDEX(pipe)
> 	_MMIO_PIPE(pipe, _DPST_HIST_INDEX_A, _DPST_HIST_INDEX_B)
> +#define  DPST_HIST_BIN_INDEX_MASK
> 	REG_GENMASK(4, 0)
> +#define  DPST_HIST_BIN_INDEX(val)
> 	REG_FIELD_PREP(DPST_HIST_BIN_INDEX_MASK, val)
> +
> +#define _DPST_HIST_BIN_A				0x490C4
> +#define _DPST_HIST_BIN_B				0x491C4
> +#define DPST_HIST_BIN(pipe)				_MMIO_PIPE(pipe,
> _DPST_HIST_BIN_A, _DPST_HIST_BIN_B)
> +#define  DPST_HIST_BIN_BUSY				REG_BIT(31)
> +#define  DPST_HIST_BIN_DATA_MASK
> 	REG_GENMASK(30, 0)
> +
> +#define _DPST_IE_BIN_A					0x490CC
> +#define _DPST_IE_BIN_B					0x491CC
> +#define DPST_IE_BIN(pipe)				_MMIO_PIPE(pipe,
> _DPST_IE_BIN_A, _DPST_IE_BIN_B)
> +#define	 DPST_IE_BIN_DATA_MASK
> 	REG_GENMASK(9, 0)
> +#define  DPST_IE_BIN_DATA(val)
> 	REG_FIELD_PREP(DPST_IE_BIN_DATA_MASK, val)
> +
> +#define _DPST_IE_INDEX_A				0x490DC
> +#define _DPST_IE_INDEX_B				0x491DC
> +#define DPST_IE_INDEX(pipe)				_MMIO_PIPE(pipe,
> _DPST_IE_INDEX_A, _DPST_IE_INDEX_B)
> +#define  DPST_IE_BIN_INDEX_MASK
> 	REG_GENMASK(6, 0)
> +#define  DPST_IE_BIN_INDEX(val)
> 	REG_FIELD_PREP(DPST_IE_BIN_INDEX_MASK, val)
> +
>  #endif /* __INTEL_HISTOGRAM_REGS_H__ */
> --
> 2.25.1

