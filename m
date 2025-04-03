Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D129A7B11D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938DB10EB7B;
	Thu,  3 Apr 2025 21:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gM+o8E4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B64410EB82;
 Thu,  3 Apr 2025 21:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743715739; x=1775251739;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r8vqs8l1SU8cF6FnZYj7qchBs6Az0oLeSO64IzOTKWk=;
 b=gM+o8E4v1WJkWEiJlhXA5iNha2/dMRwAGE8C7kIGW+Q3wQf6qn28mytu
 Niry1YsSJmBp23IzE7J7m6brhNrQNV5fPD8j+SFl//DNqMw0iI8ZSQeiv
 6EiaNghjbXN7Q3O+LCy8V2HpeP7CzR7YscnksGTwg0IuerRS6lQqyuL5n
 DiG8bbnnHXLqErYkR+ZIiMBc9/2u3a1SoyOpIM8hutDbAmybAfh1vOOhi
 cJPK9g64TlhtyAHM/bdgA/WJfymJg4tSC5g+a1k3kQ7ACISJHqxSCNgWU
 VPdq7RDaTgQxdnxwVCH67WFEBEipq/DxzkvMqAbKAY1akth4PiCLXNLdX w==;
X-CSE-ConnectionGUID: snQeLgfmTQKQvGCklz4VtA==
X-CSE-MsgGUID: Jc5GQejOReqUtYCLKaq4kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44862802"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="44862802"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:28:58 -0700
X-CSE-ConnectionGUID: TI3sQgRiS1ezwDBd1zxAEg==
X-CSE-MsgGUID: EWiqwo2xTD2f+7jk216Bww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="127648118"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:28:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 14:28:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:28:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:28:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzyrWwXwHYdAHa3QygSUQKnc3h05M0o/uIEYJoFcsz2XfAPUhlI5g4J6LDVMIFq9wybYfLb6ds/byqhBchOm6dTuQVMku+TtdrfDw9fWaYn8VDWm+2St4RMGOSQfnsmAUqL5bOc0jDgZffAqltk43XGq20uItl4H+7bsaCeU9bxAxKWADCPS95Oe2rIhnTPmMDFlTB7tIgvQb2xmJYkuA9Ah/Wp+srFBLwCkIW9btcUyqfvTZ5EKb2+vOjcYk/k4XFNcSKenwO0y48Q0N+6h83Oup76fhqrUyLr6OrRAZGC+uqO/aoGfS7xdEp+OMJAalGMOjyBTCQ3WAV8dXUkbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSz6NXS/nnpKdyLfwOgE+LnX1gJMOQabNCwBneYt21Y=;
 b=ywj+R2JlCF60DNpLou4c496hIN229JSJY2cfR5WkWdtetTZ6fwzBIPvngpGgtoxn/sEg2d4kK7ecdxFHJIks8olohfiqtYQ0un23SYIeA7Ae+fvKrIKPXpFZmb57e4iC4bQ/ff+K45z+vNon6BZhatkNjCDid8/r+1NgXs0kWXBf+BB2LUKO/P1JAZMCY21lGMWRIe+Bw2icTjYRNLNDktbIpzqdZhqK1aq4xdlnY3oqhoWEw/dNPzkdnYTaSx7zcY8pjRhxj+049uuYBofjYs2TWnAOlnSt19q8QhCpFCQ10/7CoTMtrzEQ4o0mhDDOkvwTJknWfd+7q8+AS0ejPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6764.namprd11.prod.outlook.com (2603:10b6:303:209::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:28:55 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 21:28:54 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 3/4] drm/print: Add drm_printer_is_full
Thread-Topic: [PATCH v2 3/4] drm/print: Add drm_printer_is_full
Thread-Index: AQHbpNansD5tDDGtHUi20+hCbwnZ+rOSci1A
Date: Thu, 3 Apr 2025 21:28:54 +0000
Message-ID: <CH0PR11MB544486C80E512D9FAEBC121CE5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
 <20250403202705.18488-4-matthew.brost@intel.com>
In-Reply-To: <20250403202705.18488-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6764:EE_
x-ms-office365-filtering-correlation-id: fa014e92-9598-4cf8-ccbd-08dd72f68959
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?R0dYPL9jbAzYrt7KWpH7Jeq0+SZLy16huaRClYVMfWzbxB9klloE4iUJ4xif?=
 =?us-ascii?Q?AB28+uiT3a9IIz+70JoJlVm1ANSWSWGKcwkfmyMfbD9yOFNPbAqTqAyhF4Ax?=
 =?us-ascii?Q?ZTS9g2yutu2TuB1KMg2p6O3sYuZUQLRuvYzJ4G6LMHhc0cRJime5DkGZdDER?=
 =?us-ascii?Q?UhYphoa8496Yj05BQmOUvBP25Y6HxmoAEFZkPNlhrqOULXskXJvyegJbF+b1?=
 =?us-ascii?Q?Vds+snvcHAlERvG72TbcVFBUnLRheOPcp01vsh5jY1thuM/LalrfdnULeUAq?=
 =?us-ascii?Q?pc+SxHU5ujO9MoPFXP3GTg3X3lteelnaEAcE/oJjUiW/sYnKwbECm5E6NZc+?=
 =?us-ascii?Q?klbIwhJJNr6fPnjB5dkf60Un3pu0r4lJFTnd4gOqOs+AJHJzezsMdwIXlgxm?=
 =?us-ascii?Q?rHKjmQNm5SmZAw+0piFIBE1fvHR+eG88baX0KJXlCoHX+T2CZBhE0ohwWapv?=
 =?us-ascii?Q?sHSSqqBvsiSHJi1nJjw4ZeXQ1D0mmwgU4yNINawrFEy7MsXK2FQqwREJceBl?=
 =?us-ascii?Q?fTW+vLIk/Zmdbh9RkrVDZGtSiWbf2D7Wcbw2a9kGauRWSe38QSHGvldRm5dt?=
 =?us-ascii?Q?/FIHmfbjHOEHNXwk1hftf1b51XC97q+XDAE6izF7yl6rYLJoanG+Dz5q0qE3?=
 =?us-ascii?Q?RWUvhV6VApEzK1jVnWvCQ+3y8QEdCYm/7rI5UU4FxCjGofE8Rm2ASNy3V0K2?=
 =?us-ascii?Q?9BCEIOmUF+jqQ87vOPL4gXeergrqks3JqnZ44ix5+7CEpBBRJMRtlZGZWg5B?=
 =?us-ascii?Q?7t5LMELb5mF0+LwbFKZOk7OODmfwTn+2DgF2Yda/HZLhsei5Zejvh1qfYi2r?=
 =?us-ascii?Q?xZ1XNs9Bo5luMZf1HMGf/k03bJYqGXTs8bPP3kiDoevlGVse1BdwMVPK65Ip?=
 =?us-ascii?Q?ky+e9WAUJbxNKQhbvpOpiPMesiZ/p2uIrrB3dha1Q+auLAVI5j8re8M3ym1h?=
 =?us-ascii?Q?Rd2JexTmRa98QvCnHVvJ4vKOhtoo0stjZKBRsP1u9HGSmfZhJFnBFpem6mA1?=
 =?us-ascii?Q?NFM3Hju9amXitHbcFqjOYlJWWexgL311lNaEbFBs71/JXUygmR1Qm8VCrwbv?=
 =?us-ascii?Q?haaRq0pB8RtzupbEtY8goghu3lB29vSGrspQOng/tbUFDqLS1NVJb+Ym4mox?=
 =?us-ascii?Q?DT6v9XIXj0ZPA499xHJTPjzqeOHj0DukERJ9H8lZlkqM4cbC7Ux9ghN7DQ0y?=
 =?us-ascii?Q?2mksNm5SLZ0oYkHsEcvZN/pXp8uDT8n3iSYAXBJiXHxrpjTav1PUt4dEAvt8?=
 =?us-ascii?Q?LbMdds6CdagJTJHl2ryr2VL/1i5iSbwszxwAR5eXfmNdQYb+io4jKh13F006?=
 =?us-ascii?Q?cm15kvb0GocO9aI2aPTeXcCgP3LiB6MXDJvt1GGGn/704meTQnuaut1Exdsn?=
 =?us-ascii?Q?Xmb9cL03N43fxjMYGUdnzdOcBzu2z2VzZ4qri//aB0dkeTDA3uBROoTT5AyE?=
 =?us-ascii?Q?0eTTHRST6I+liwrcE/8mkaMhxNVu0t2i?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vUhw04xjL3btZc1uSe12JAZtrAedICFWjbVf8bQo/yZisQqc8mOMrzK5f4VC?=
 =?us-ascii?Q?ytA+4LnDGlo963TCHDDPoU/ymWAYjRshWO84v5apVVPvEQbEa8gCXeEFNzMB?=
 =?us-ascii?Q?fTXRk7YUvkQuS7wdFuwjTAwub6bBBms7yX+IPKT/JjOrQ8t76eH+aiTXMRem?=
 =?us-ascii?Q?w2NR0ZOa7tmsYAzqfu5x2jZ8ZazE9txa+RK7k+T1saGHEmVM1vSreAd/usI+?=
 =?us-ascii?Q?y4vVZgslzfKINzXgGb/2CiQ1AE38max4TSSn/PjQ4KzJMuU+9CTf+XOHtlvJ?=
 =?us-ascii?Q?aKYarR1k7ORPW5pZ1QfhDN9izNr/4YXXhZF1gDLjHDuBKT1pKDxPFSVR6vI+?=
 =?us-ascii?Q?D1/esXWFzsQYAFPmIYTPP72LXcbiBlUEGYXal8/PDKDjoNf95TcsYPdt2Huo?=
 =?us-ascii?Q?VUS+MfL4lbRwdcWGx6oWDleGfmJK+tTr8P38li9oBBfC9zvFndiqKROOT8zU?=
 =?us-ascii?Q?BvSvTvwr/FxSMZvCPlUlO3K63NJlJLAbTWObfoVpWG6vH+mGswIObhJpm+p5?=
 =?us-ascii?Q?ECez1+jJGFWPO1mesdsxgsWxE4dumQRGCvr9aF1YgkxvnbhQYOOX1BS88O1O?=
 =?us-ascii?Q?/jKKGOIDZFdEponlQTjeFFm9BXeKrZ5VsbdfnnYEUTUE9ov2fSWM+BMjeHBX?=
 =?us-ascii?Q?9uAWDYSIHWztKqWXxvGhS8X4Sr2uy1QkLsv/txEX5G/DZ+9SxTlPJnsPmM5r?=
 =?us-ascii?Q?pLkVfcvLMYwyUsKHxust8FkT0uLczdvV8GYaGg4b9sjDei0MP6ixxQfex+1F?=
 =?us-ascii?Q?MJYsoD8WKr4bhAonhstw0bHXmDgs5S0RgA5KmzEyG6kGI/7RNP0t7nUdF19q?=
 =?us-ascii?Q?JVTqiwPXXYHB/kOJgCkWESMbgxo2Mp7/akr8zSnjpLH1P66lBEHWBVQ6MXTK?=
 =?us-ascii?Q?9PTdbN+sQXJpTLAQL8m70E7tIi5sMJFI9TXUaD1lNri1eJs8ewtMUh41Owck?=
 =?us-ascii?Q?5t5PaTbJB420ZrGuSqEghWuqd90Z+Ezvb0jY+QLAP+N90DfLLle+yNRRCHb4?=
 =?us-ascii?Q?R2RSrx/fd91nnszQFEqY3VqlMeNW0NDpUWveYAH2CFsde4c0644RT/a9Kilj?=
 =?us-ascii?Q?hxWjND1iWTl2lOHU5Jzpn2M9lP0kFd3uKi8rRmImPfAGxc3596zgR4zqZxGc?=
 =?us-ascii?Q?9Q1M1b31WnFhctr8Jq6X0ljETmrLIyJ+BYp0VLBVRGhnfv2EXGrIfnc5hDaF?=
 =?us-ascii?Q?hQs/jMctJcBjhEz6DBQr3IHAd5o+p3z4aiHs/wi/FDBP55Oe/NhhIDfNcxbg?=
 =?us-ascii?Q?c88OmD+9DGUHKvdZou3HB542NFYWTEFLuSJGrmDrQvO1DtBcp9/W6RQ6bXx/?=
 =?us-ascii?Q?fwx4VYRP6ppsuJovlVWII0LjRg5i8i+eSzIcG96VUXBomfwvYiWCdhkAUKOI?=
 =?us-ascii?Q?m0Y0twk1v+lVm9GVAiWK88HJG3giz3MrwUvjuYkWIL9f1G/zZOIyQczstLub?=
 =?us-ascii?Q?W0TCr98c5fIu/uv9ig5bK4wWCUFOCDThE99CG5qcXPElmThW8YmO0l/8EN/7?=
 =?us-ascii?Q?T9PybRLLaylwek8L983tRNihyB25iZAwA3N4IGaJ5NuldYmGzG/8lHSunPg9?=
 =?us-ascii?Q?v9k1Bo7RQNEh8+qYMtAHbsia84CMtI4Q2+mcizUw9/3tIo4A/pe5orvugGJm?=
 =?us-ascii?Q?SQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa014e92-9598-4cf8-ccbd-08dd72f68959
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 21:28:54.7740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LZFYvprQuikonMUSqnZrKccxU9Puw2lgrOCDka4RbwHmiEMDsiFYhqYSKoUY3v/RG/v7M0+g6bjQSLGZSdb3gkbPLgbn8yMZ6wiCIohQb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6764
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Thursday, April 3, 2025 1:27 PM
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/print: Add drm_printer_is_full
>=20
> Add drm_printer_is_full which indicates if a drm printer's output is
> full. Useful to short circuit coredump printing once printer's output is
> full.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM, though I will admit that "remain" is a bit of a strange name for the
iterator variable.  I'd almost imagine "remain" to refer to the "remaining
output the iterator needs to print", rather than the "remaining space in
the output buffer of the iterator".
But that's just an aside.  Nothing worth blocking on.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  include/drm/drm_print.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index f31eba1c7cab..db7517ee1b19 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -242,6 +242,23 @@ struct drm_print_iterator {
>  	ssize_t offset;
>  };
> =20
> +/**
> + * drm_printer_is_full() - DRM printer output is full
> + * @p: DRM printer
> + *
> + * DRM printer output is full, useful to short circuit coredump printing=
 once
> + * printer is full.
> + *
> + * RETURNS:
> + * True if DRM printer output buffer is full, False otherwise
> + */
> +static inline bool drm_printer_is_full(struct drm_printer *p)
> +{
> +	struct drm_print_iterator *iterator =3D p->arg;
> +
> +	return !iterator->remain;
> +}
> +
>  /**
>   * drm_coredump_printer - construct a &drm_printer that can output to a =
buffer
>   * from the read function for devcoredump
> --=20
> 2.34.1
>=20
>=20
