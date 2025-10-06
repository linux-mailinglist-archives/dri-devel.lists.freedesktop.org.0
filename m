Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73B8BBEBB0
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 18:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170FE10E436;
	Mon,  6 Oct 2025 16:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNVGUEln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CD010E43C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759769237; x=1791305237;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QzaIwF5Db95W9PnCVV8+vf5EplIfPlBzsSo6IRNgWvU=;
 b=dNVGUElnOUjclqXezDYhkyWlwm5CroPXVvIt49Mf3Qw1UEhjcuCRnmbl
 oGSNukHvV2txb+BSQz0a89O4tFm0HFhK5FQEdm6eyKhmY0TFOlIDbewXU
 AAGw+OENqKMVQUGq3WMyq5lmzOoTsfmd7eItgJ4YsuomvzIQsk+n8Y71y
 6aQS/j661FGV52GnL0HfRajtQsyotnEH3z6mUZMUSj+qK2HZ2PBeKLVuy
 21eEVjOJNyqG6GMDzZ0iyQJY9f7EGQVTASwJ9JqnDIftfkq5YPPuInute
 vlMK0vD8oS05Oa3Dk3nQQzXO/DTcL3S7kqpAi4MKqrqxXsYVuodRqgl4X Q==;
X-CSE-ConnectionGUID: ZtA7ggn1TP2SqQ6oS8Vxlw==
X-CSE-MsgGUID: QPrWoWd6SvyJ//pCs/eEAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="84574806"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="84574806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 09:47:17 -0700
X-CSE-ConnectionGUID: NymL895nS5Ozz0X6Vi1m9g==
X-CSE-MsgGUID: KHVY5AB8QTWXd8B39exTjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="217009928"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 09:47:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 09:47:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 09:47:15 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 09:47:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSqXYhHubdt62IKFuhuHF7qwGolofFmnqtAPp922Nw47ewE3Pm7lMX+JcQm7/jMYqMDWVziIsiI9rkWEisBb6/8JXkKgLQnlvC6ongcSPaDIaAEtZYkibYy3BEB9sTJScvGutkH8+CABIWhI0D0yDf4PebMK2awoLDxGv78VST7OxRXxhaW6ukeWs34LYnvbu/+734WLxJk3amor1fl8VRk0TT36qUPPapOc1abb1w39UNDzPQdOsVYqoKQr6TM9cLMjmfOjmPya9M+AbRBd/LVaSbmVR/fEKoZIbHrCDSVgLBIXGp8VE7t6xNS+qothw/jxnAuET8osF7x7+b89aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzaIwF5Db95W9PnCVV8+vf5EplIfPlBzsSo6IRNgWvU=;
 b=lE2v2h3k7rObHgOnZvR6ouT36Qqwuif11lPD2sEKOo6OPImKuv8nud0yb8GTc8sgqEnZ7qGFqmnp2+0Y7UDA7VbFnaPjCcy1oBIAou28EplD6XWHySuBadl9lyVw0fpngIZBlwsTbV2AGbtZ5VoPrL0ATIzVR67MF6c8c8khSy+YHoeDf/CXy5B0XwvtcQi9VPGg36dL95EzrQLUwTImfDdcUHomJjruOIjE54RVRpqDoL82Xp8GTh2WVdP3prNsohzh5X7g57QmuSoCuRePfMv3aDJtwsJqkWQtg24IgY+mr3DPBZVFYcn4gEU/Wlsa+8TmhTIpfXDwI9y5f1q9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:47:05 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:47:04 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Nirmoy Das <nirmoyd@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>
Subject: RE: [PATCH v5 0/3] Virtio-GPU S4 support
Thread-Topic: [PATCH v5 0/3] Virtio-GPU S4 support
Thread-Index: AQHcNssjusRj1r580EevYVNTwMEx5bS1U2dg
Date: Mon, 6 Oct 2025 16:47:04 +0000
Message-ID: <PH0PR11MB5112C8AA05DA00705DF9B1C7FAE3A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <3ab9a8d4-48d0-473f-be54-de4efec9d07b@nvidia.com>
In-Reply-To: <3ab9a8d4-48d0-473f-be54-de4efec9d07b@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|SA1PR11MB6967:EE_
x-ms-office365-filtering-correlation-id: 9268867c-62a0-401f-3993-08de04f7fb05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OUF5dVpKcG5wb3BBeUFUSXlvb3NvUU1WTHFDOEZHbnNONkJaZ2J0RGROcEdv?=
 =?utf-8?B?OHREWHJudWtFVU11WGxhc29ZOWp3dkhFSG5UT0I3M2R5UEN3bHBhTURjTDBV?=
 =?utf-8?B?VW01KzRzUXVkY1pEMk42Vk1OVFViRWtsWjRQVHVHczNYR1ZGYTgxc01pbG5H?=
 =?utf-8?B?SFhqSUg5VUNnRTZuN0Q4R3ZBWjRFOE5Fc01mSHgwaEJMS3lNVWNNcUlITFpI?=
 =?utf-8?B?TlFkK2Q5bDYvdDg1WERWVjlmQkJIMXpyVEtTZlRKeDFGSStBL1VzVjFHT1Fh?=
 =?utf-8?B?VVhuK3VXbFgxMk5LcEtSQmowVjB6Mkh1WWhwK0UveG5pNko1US9QcVlYSUpx?=
 =?utf-8?B?YWRJeVhmYjUyK200VzBwMmRTdlBwOUJYbkU1YzFmMjlXYWd0VW50UEdoWXZl?=
 =?utf-8?B?N21XdXlXM2hFb1BNTDRmaUtlUkJrOFRGRVlHUW1tNGNNYmtKQkZ0N2NyR0M5?=
 =?utf-8?B?bVprS0NuMTFDZytQVnRaeVcvZFFvdHcxTEN4TWhZU0dIVm5OcGlmc01FMTdT?=
 =?utf-8?B?d01FVUd3S3VmTHArRHBYR21NMDBRYnB1RFBFL3Y0WGoyOVJ0RzU2amVIeGpN?=
 =?utf-8?B?b2o0aTdabGRPUkN1dHNCMStYVk5zcVFBV0JkQlZDaHVKQ1RTQzdxNFlhNkxZ?=
 =?utf-8?B?OXpWcWltMy9YWkpXZTBzcVF5Q3d4SDBaeTNIWEgrcHlMNmtVN1ZucG1WeHF3?=
 =?utf-8?B?U2cwMmxDTHdpYWZuTzJHM2VVWjAybHBSc1hHZEhLalB3MnE3TFlmLzQ3NDBt?=
 =?utf-8?B?VTA0OE41L0x4U3A4cnp1Vm51c1B4ZWZWblpGajViY0J6U3V6ZUFqMXhKWUFH?=
 =?utf-8?B?Znk1UHJBV0l4eHZjL0IwT2V5eElHUU1ZZlVKUGZTa1g3dzdncjNQdTVvTE5n?=
 =?utf-8?B?dFFZbHVsTkNkNDN2T2V5Q0tuUnlGcVJkNkpuSC9odGEzYVFhdnZsUHA4Z0NE?=
 =?utf-8?B?bUk3d1RlbDkwa2N5b1NJdHV6WEJZS2o2QlNuaGc2T3VaUkVGOVhwK3VqRXEv?=
 =?utf-8?B?SDJBZ3NHM1J0VW1KQU5hZnUzOE9wVmZURUgyTWluNlliVnJOUkd0ai92Q2xz?=
 =?utf-8?B?N1JCZjhMZ2VzY1kxRTcvcW5yM0ZPZktSV1JvZWhjR1lCK01waXJDSjdjOVQ0?=
 =?utf-8?B?cmpJalB2Q0RUNWF3NkxmdEtadG85M09aTjVVZHB1RGp4RUpvV2Y2TlJmUm5y?=
 =?utf-8?B?RUx1NFJXell4WnZwZHFTSUNzVWFXNHVrOGg1ZnZvaGtKcjJGbjBwRlltK3VD?=
 =?utf-8?B?d29iUEtrK0QvM1ltTDBpR0R5NTdrNEdTdmZyQ29GOTdPaHIrckRXeVNkZDJw?=
 =?utf-8?B?MXNmUTVweUc2VldZbEVabnFBbXlCR1BQVzhnSnZHakpkdGZvcUNsOU5hT3Nv?=
 =?utf-8?B?Uld6QXIvU0JUYUh4d3hWNTUzeXJVMFBaclRKbkVlRnB0REFUN21FNWRNM2Y3?=
 =?utf-8?B?d0REN3JJTE9ZbFZGK2FuSWVMT1l0cFJvNkJMUVlTeXp1RGlGR1hZdE9VOTF3?=
 =?utf-8?B?UDBLdmFzdk1OQWloYUprcGNVTk1lYjdCTWlKcVFkeWMrVnJJelMrVEMxZ092?=
 =?utf-8?B?SWRyNkZubXZUdk9rVlY5QTdFVnJLOW13dDMyalB0akZjWncvN29UODYwVlRJ?=
 =?utf-8?B?MFhXQTFablJWdCtmNDV0M2RXZVJVNVQyU2d1cUp0RkRnWTkwbEY2bVJ3OWtP?=
 =?utf-8?B?OTRCcUlvT0gxTjJPMWtoclhodE8zQkxrbDJ3WGFhTFR2ZXZRVm9uZlgzWWxB?=
 =?utf-8?B?NjFqN0NoTzI0L2M5ZVlWZ0NlWERXZ1NpNXhMYlJFSVEvdlRLTU8xNm4vVzdr?=
 =?utf-8?B?eGtGcFkxaGdFaGdadFdYTGF6czJnZklRSkdzTEdwQ2lzRTI5K2Q1WWJDNnlI?=
 =?utf-8?B?dCswWWtFUWNlekNlaThMdWJxT2YvSXhxczVRQVJKMS95OWt1ODNpS1RPdHQ4?=
 =?utf-8?B?czQ2MHBMWVlmeDQ1R1NBb1JSUnpFV2JGTDRSU2M3akNyTmFHSUtlNk51Y2kr?=
 =?utf-8?B?T2d1aEZ2Vmw5dEo2TUNCdkE1emVZbllhSzlxMHZYbnFKQitYUjlDWTd1dFFo?=
 =?utf-8?Q?5eAfOd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1BjMkJzTktOd29LdWhxU1NyZ2VqMkJGOHhtMDNWV2NhcXU3RDI0Vjh5RDl0?=
 =?utf-8?B?TTc0YmJNbnZnSVg3ZW9wOWtuQnp0enRuR0dOK28yV3pXclJ0Yy9tbkg3QTVC?=
 =?utf-8?B?NHZGd0w2N0lwL09DYXJZOUkvblBBanptK2U1b1czZGdFYXN1bDdNSjE5RGlT?=
 =?utf-8?B?dEN1SUxkdklxOTVqQnQ4MVJRMmFPUXY4MU8rNkJSb0Nxay9QQW9vYSs0L0pS?=
 =?utf-8?B?QVpVcG5xV0JjN0xSVThEeEJycFZlNW8wNjRzVUl1OGJvODNUSXBjRVRjdUxa?=
 =?utf-8?B?Ti9vMVd2WkhPQlQ3OXJKM25BSFh2K24wOHJpL2hMd28weWVEeEo5aW1TbVpR?=
 =?utf-8?B?bW1YRGNIS1dJUkZralk4OTJ1OWhzWlBGbVBTdThHSHFzNDh6Z21mNnVaUkZP?=
 =?utf-8?B?cEg5VmlNT2E5dVBwb2dnU3NYMVNaWlBLcWt2cHdKQjRGSDVodGZ6YWo2UDRX?=
 =?utf-8?B?cHdzNDl0cDhHMkdKRU1BOXF4VjlGWXhMZ0cvd2xmd2gwcDlFWC9uM29pVDVE?=
 =?utf-8?B?SXZSVVJGOXpwa1E2QytGaDZVR3cxOElGblZmVjg4Wi8weS8yQ3Ziem1SbXZY?=
 =?utf-8?B?clN3ZlB4a1habWZPMllyZUUvalpQMnl4VkhkM3BQb2tQWmFKeEY1bzcybDRv?=
 =?utf-8?B?aWpOYmFkRmovWkViWXM1ZXNQRk1ydDBuOE1SL1dNdVNkcDdyY1NqYkhEKzdz?=
 =?utf-8?B?anhqT1JjcVI0Wm5kZGMreUNLYlplZThZVDNzNnVleU5UaUt5ay9kdlg4ZHhF?=
 =?utf-8?B?ZERPR3Radk1SQ2VNZEdCdVV1TTdZVEdidEJlcUpRazIwQ0l1STRsREltQzVZ?=
 =?utf-8?B?eFRxSjhXdWovNDRLdUtHY3ZFa1RnU0NVSnFQeld4UjVQVlFya3ZMUnFRbVNq?=
 =?utf-8?B?V2NHVUxadFlIVHoycUtqZmtyS0MyTDNjMDFtRjFKUlNWaWRQS1lTdFBrN253?=
 =?utf-8?B?Y1dMSGY2NVkvNDROZjd4dG1UZnorWGFOL1RJOGdRTG53YUN4RWVud1BGTkQ4?=
 =?utf-8?B?Ulo5OXY4TFBzMGtwcUUyekllRnVIZU1tVHozVTR2NUxGeUN2OTdGTUw3K1FU?=
 =?utf-8?B?clk5YTNZR3ZsZm9KWlc4M0Nzdm04MW44ckNnaTdqQ3pnQllKVTZFWE1ZTUxO?=
 =?utf-8?B?UEJmRDh3TDZMUTA1YURkNCtUa2xSeklYMGRJNmNjKzNXc21xczUrRUFDaFZj?=
 =?utf-8?B?SHRmcnhoT2pKdGtCQ3dDRFJ6bGl5M3U2Nk16MTdodEF0M202MkV6TUZvc05a?=
 =?utf-8?B?NHRtZHd5ZXJPcFBmWG41UERLYXoxTjBVcnd5dUkyZW5qZGhXK3hJVUZQREll?=
 =?utf-8?B?aFZUWE5aUnU4eGZDRkExWkpHSHkwM1JOVkRXdTRHOWY4MFQvbEpLQ2FHNkp6?=
 =?utf-8?B?aFl4WExjZEhXUitBektvN244VFRJN1pzenJvRTlGd3NCRXkvT1JKSUUrTnp2?=
 =?utf-8?B?VXB2bC9aeDNEMlpkQTdRVGozN3ZsbHZpV1krMnJYekg2d3RQbzNlYkxSZXV0?=
 =?utf-8?B?TkFMVGJIUXdrbkh0RkJsZFNVemZuWk4vSmlXVnErZEorUlBRdStmMDNWMVc0?=
 =?utf-8?B?Y1BCa2V4dWRISkU1NzB2QkIycmRVUUpMUWpmTXJ5VzYwZDhVQTQ2VVp1UUJp?=
 =?utf-8?B?WEg5dnVvaEJkOExyZUhZS0tqTSsrcG5NTVBRQkRRU0NZMVFzRWVpaVVzSGxI?=
 =?utf-8?B?c203MnBXYi94cVdINWE4K0haZFFkT3dvSXNNbXY0Yy8wWG5Wa3JCaStZc2pv?=
 =?utf-8?B?Z0RPeDFNcVh0YlBYblAxbDZ6LytWamoxMitLOVRYVDM5UFpFVGEzd1ZoVW9N?=
 =?utf-8?B?TDBVM1F1aXN1R0dTWkxMbjdYM0t4dGVUbFlnMEdMazhieXFkME5UU1Y4aUFS?=
 =?utf-8?B?cG9IN2FFbGYzOEExUVcyR1V2d3hZRTNQMHUxWWRya3g2U1pHejNjMkc0bnln?=
 =?utf-8?B?K2ZDYlNkcFNrZENpQU1HZ3MwcElxTWc4UEZlRUhrb1lXblp4VGVGR3cwL285?=
 =?utf-8?B?NFJXaW9xOHJDL3NCb2RKSHk5SmJXYzY5R1NYMFR2UTB2RjBSVzJyZDQyVkVT?=
 =?utf-8?B?VVVuYUlVTnpQU1U3VnZMbFpXRU1kZ296eU5KM1VKN2NsNkpYVjBaSkptYmF5?=
 =?utf-8?Q?cB0ewt67D8XixB7TgPkFik5UQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9268867c-62a0-401f-3993-08de04f7fb05
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 16:47:04.7709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2PVkckhC7iM2zNJprUXbyP+adHYGuXCwV673tytrezxYIvsLyBLilcwF8++7Y36b8nq6UZ5orokqehIoD8SyIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6967
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

SGkgTmlybW95LA0KDQpUaGlzIHdhcyB0ZXN0ZWQgd2l0aCB2YW5pbGxhIFVidW50dSAyNC4wNCBM
VFMgaW1hZ2UgdXBkYXRlZCB3aXRoIGtlcm5lbCA2LjE3IHcvIHRoaXMgcGF0Y2ggYXBwbGllZCBh
cyBhIGd1ZXN0IHdpdGggUUVNVSBsYXVuY2hlZA0Kd2l0aCAiLWRldmljZSB2aXJ0aW8tdmdhIChv
ciB2aXJ0aW8tZ3B1LXBjaSkiLiBBbnlob3csIGl0IGlzIGEgZ29vZCBpZGVhIHRvIHNwZWNpZnkg
bW9yZSBkZXRhaWxzIGluIHRoZSBjb3ZlciBsZXR0ZXIuIEkgd2lsbCBpbmNsdWRlIGl0IGluIFY2
Lg0KDQpUaGFua3MhDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwLzNdIFZpcnRpby1HUFUg
UzQgc3VwcG9ydA0KPiANCj4gSG93IHdhcyB0aGlzIHRlc3RlZCA/IEV4YW1wbGUgY29tbWFuZCtz
dGVwcyB3b3VsZCBiZSBuaWNlIGhhdmUgaW4gdGhpcw0KPiBjb3ZlciBsZXR0ZXIuDQo+IA0KPiAN
Cj4gTmlybW95DQo+IA0KPiBPbiAwMy4xMC4yNSAwNzozMywgZG9uZ3dvbi5raW1AaW50ZWwuY29t
IHdyb3RlOg0KPiA+IEZyb206IERvbmd3b24gS2ltIDxkb25nd29uLmtpbUBpbnRlbC5jb20+DQo+
ID4NCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBpbXBsZW1lbnRzIGZ1bmN0aW9ucyBmb3IgLmZyZWV6
ZSBhbmQgLnJlc3RvcmUgaG9va3MgZm9yDQo+ID4gdmlydGlvLWdwdSBkcml2ZXIgYXMgd2VsbCBh
cyBwbS1ub3RpZmllciB0byBoYW5kbGUgb2JqZWN0IHJlc3RvcmF0aW9uIGluDQo+ID4gUzQoaGli
ZXJhdGlvbikgY2FzZS4NCj4gPg0KPiA+IEZpcnN0IHBhdGNoIGFkZHMgYHZpcnRncHVfZnJlZXpl
YCBhbmQgYHZpcnRncHVfcmVzdG9yZWAgZnVuY3Rpb25zLg0KPiA+IFRoZXNlIGZ1bmN0aW9ucyBo
YW5kbGUgdGhlIGRlbGV0aW9uIG9mIHZpcnRpbyBxdWV1ZXMgYmVmb3JlIHN1c3BlbnNpb24gYW5k
DQo+ID4gdGhlaXIgcmVjcmVhdGlvbiBkdXJpbmcgdGhlIHJlc3RvcmF0aW9uIHByb2Nlc3MuDQo+
ID4NCj4gPiBTZWNvbmQgcGF0Y2ggaW1wbGVtZW50cyBhIG1lY2hhbmlzbSBmb3IgcmVzdG9yaW5n
IGB2aXJ0aW9fZ3B1X29iamVjdGANCj4gaW5zdGFuY2VzLg0KPiA+IFRoaXMgaXMgbmVjZXNzYXJ5
IGJlY2F1c2UgdGhlIGhvc3QgKFFFTVUpIGRlbGV0ZXMgYWxsIGFzc29jaWF0ZWQgcmVzb3VyY2Vz
DQo+IGR1cmluZw0KPiA+IHRoZSB2aXJ0aW8tZ3B1IHJlc2V0LCB3aGljaCBvY2N1cnMgYXMgcGFy
dCBvZiBoaWJlcmF0aW9uL3Jlc3VtZSBwcm9jZXNzLg0KPiA+DQo+ID4gVGhpcmQgcGF0Y2ggYWRk
cyBwbS1ub3RpZmllciB0byB0aGUgZHJpdmVyIHRoYXQgaGFuZGxlcyByZXN1Ym1pc3Npb24gb2Yg
dmlydGlvLQ0KPiBncHUNCj4gPiBvYmplY3RzIHRvIHRoZSBRRU1VIG9uY2UgdGhlIGd1ZXN0IHJl
c3VtZXMgZnJvbSBoaWJlbmF0aW9uLg0KPiA+DQo+ID4gVGhlc2UgY2hhbmdlcyBlbnN1cmUgdGhh
dCB0aGUgdmlydGlvLWdwdSBkcml2ZXIgY2FuIHByb3Blcmx5IGhhbmRsZQ0KPiBoaWJlcm5hdGlv
bg0KPiA+IHNjZW5hcmlvcyB3aXRob3V0IHJlc291cmNlIGxvc3MuDQo+ID4NCj4gPiB2MjogMTBt
cyBzbGVlcCBpcyBhZGRlZCBpbiB2aXJ0Z3B1X2ZyZWV6ZSB0byBhdm9pZCB0aGUgc2l0dWF0aW9u
DQo+ID4gICAgICB0aGUgZHJpdmVyIGlzIGxvY2tlZCB1cCBkdXJpbmcgcmVzdW1wdGlvbi4NCj4g
Pg0KPiA+IHYzOiBQbGFpbiAxMG1zIGRlbGF5ICh2MikgaXMgcmVwbGFjZWQgd2l0aCB3YWl0IGNh
bGxzIHdoaWNoIHdhaXQgdW50aWwNCj4gPiAgICAgIHRoZSB2aXJ0aW8gcXVldWUgaXMgZW1wdHku
DQo+ID4gICAgICAoRG1pdHJ5IE9zaXBlbmtvKQ0KPiA+DQo+ID4gdjQ6IE5ldyB2ZXJzaW9uIG9m
IHBhdGNoc2V0IG9ubHkgY292ZXJzIFM0IGNhc2UgYmVjYXVzZSBsb3NzIG9mIHJlc291cmNlcyBp
bg0KPiBTMw0KPiA+ICAgICAgY2FzZSBjYW4gYmUgYXZvaWRlZCBieSBza2lwcGluZyB2aXJ0aW8t
Z3B1LXJlc2V0IGluIFFFTVUNCj4gKGh3L2Rpc3BsYXkvdmlydGlvLWdwdS5jKS4NCj4gPiAgICAg
IFRvIHNraXAgdmlydGlvLWdwdS1yZXNldCAoc29mdC1yZXNldCksIHZpcnRpby1ncHUtcGNpIGRl
dmljZSBzaG91bGQgYmUNCj4gYXR0YWNoZWQgdG8NCj4gPiAgICAgIFBDSUUgYnVzIEFORCBhIFBD
SUUgb3B0aW9uLCAneC1wY2llLXBtLW5vLXNvZnQtcmVzZXQnIHNob3VsZCBhZGRlZCBhbmQNCj4g
c2V0IHRvICd0cnVlJy4NCj4gPiAgICAgIChlLmcuIC1kZXZpY2UgdmlydGlvLWdwdS1wY2ksYnVz
PXBvcnQseC1wY2llLXBtLW5vLXNvZnQtcmVzZXQ9dHJ1ZSkNCj4gPg0KPiA+IHY1OiBSZW1vdmUg
dmlydGlvX2dwdV9vYmplY3QgZnJvbSB0aGUgcmVzdG9yZSBsaXN0IGJlZm9yZSBmcmVlaW5nIHRo
ZSBvYmplY3QNCj4gPiAgICAgIHRvIHByZXZlbnQgYW4gdXNlLWFmdGVyLWZyZWUgc2l0dWF0aW9u
Lg0KPiA+ICAgICAgKE5pcm1veSBEYXMpDQo+ID4NCj4gPiAgICAgIFByb3RlY3QgcmVzdG9yZSBs
aXN0IG9wZXJhdGlvbnMgd2l0aCBhIHNwaW5sb2NrDQo+ID4gICAgICAoTmlybW95IERhcykNCj4g
Pg0KPiA+ICAgICAgTW92ZSByZXN0b3JlIGxpc3Qgbm9kZSBpbnRvIHZpcnRpb19ncHVfYm8gc3Ry
dWN0IHRvIHJlZHVjZSBtZW1vcnkgdXNhZ2UNCj4gPiAgICAgIChEbWl0cnkgT3NpcGVua28pDQo+
ID4NCj4gPiAgICAgIFJlbW92ZSB1bnVzZWQgaGVhZGVyIC0gZHJtX2F0b21pY19oZWxwZXIuaA0K
PiA+ICAgICAgKERtaXRyeSBPc2lwZW5rbykNCj4gPg0KPiA+IERvbmd3b24gS2ltICgzKToNCj4g
PiAgICBkcm0vdmlydGlvOiBGcmVlemUgYW5kIHJlc3RvcmUgaG9va3MgdG8gc3VwcG9ydCBzdXNw
ZW5kIGFuZCByZXN1bWUNCj4gPiAgICBkcm0vdmlydGlvOiBBZGQgc3VwcG9ydCBmb3Igc2F2aW5n
IGFuZCByZXN0b3JpbmcgdmlydGlvX2dwdV9vYmplY3RzDQo+ID4gICAgZHJtL3ZpcnRpbzogQWRk
IFBNIG5vdGlmaWVyIHRvIHJlc3RvcmUgb2JqZWN0cyBhZnRlciBoaWJlcm5hdGlvbg0KPiA+DQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMgICAgfCA2MCArKysrKysr
KysrKysrKysrKysrKysrKy0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9k
cnYuaCAgICB8IDEyICsrKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
a21zLmMgICAgfCA1MSArKysrKysrKysrKysrKysrKystLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYyB8IDYxICsrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTc3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
DQo+ID4NCg==
