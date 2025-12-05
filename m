Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8C9CA78D0
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5880710EB0A;
	Fri,  5 Dec 2025 12:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AlOgvDaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CDA10E26A;
 Fri,  5 Dec 2025 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764937177; x=1796473177;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+i75vuIuGCNjtfst/K8DuagZQrbtIdbRoSUugMXz5H0=;
 b=AlOgvDaN4tvbVzQaxSmt6bPt1Ao3kBEY/FXFf3gZ9XxvZGnpV8yew+Ci
 T322I1CHJv1JgSR0xYG0LUwWVbZ+Wsjd0OkNsKBHYedJABURLg3xgdf2j
 jj9qrX276GUjfyccDEd+CrqnsUa1b4S7MadatxkvJnSu7Dirj1f5GgJdp
 s39ZXr529cE/RHFSzUxUnu9oBEFlziFbTc5OKDY5lImQa7bFYEBm6mpDx
 Mfke/jHIrO3AZwChbPlCmLEZi4MWugUpNF4pxBMi8qrMIxw7W4oh7af5G
 A/S4YW40iCfMC1AFzxbt1/Y4H+8Z0cVjJD67hI1oQcpCQUdnTK5P68TMC w==;
X-CSE-ConnectionGUID: rHka5iTCQpS1/3IgQpmqOA==
X-CSE-MsgGUID: lv9KDNl7RvWUPv2RtG6Spg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70819450"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="70819450"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 04:19:37 -0800
X-CSE-ConnectionGUID: y54GKSikRM24chFEH8onCQ==
X-CSE-MsgGUID: xKIk6DbMTA2mi/rD3w77hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="225939094"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 04:19:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 04:19:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 04:19:36 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 04:19:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kiftez5Zq7oMCs4ep1XQO+DcCEsoKf0N9udl8XN34GeEVJJItXGgR8M8mM+4zWzopzgpuVPAjT1ZRPPtJ9no0m1D6pfcQPL9st/Ic3tMpeAtMeHFzqhDGTXFnkTip3Crm781svnrmR6Npf+sSYS7wA+1D2/OgcbRIByVgHIYhJ+SmTIEZDyl7X0MH7FoIPnHsjStrNdbWYpOCUmiecib98vKVYA3Z9P4kWGGYKz1VH3gM1vcyUQmhGPelm2V0bCAZEPnh7wIuAe6X3w24viY5cF1lDlR6r9zJWC6oEJLzFTiD8umSGDJ1PItJnGOVqXmM+2ucbn7iZQatT4XXX9dlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsKgZepUS19XB3/wgrLPkHs9XzvW3okfHHVrquyhcek=;
 b=MCKVcIdBUKXeix+Jh4yKqSIJ1mQRoDntAJn7RJHlwQPD2Gdql0Gko9KUCrzcChP8chVvQ/6ho6WTTVrGdssRgW/UHw2u9AsX4grFO/lOr02nuF27eKDVnVtL7P+cXaH82edCD9lTxjk2t7Ux+imtYGPzyS2mNN640EPeTaHNoBhPBhj8OeU6bzmE1JYkNaxGQK2x8lpHnXqFcaKjMctJ7j0PR4B4J9a5OtocvAp7uaDludXrGg3CPLiL5yaXEbVsWVkHw04p0kCLPKywPENRuss+jgpSYmq/+bCwu+eh2kcq5vh0Op9Xf1uz9LgGWomM+vxDVjynUwGbvreD7ChIwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 12:19:34 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 12:19:34 +0000
Message-ID: <4827cdc3-014a-4085-bdf5-558c282cc9cf@intel.com>
Date: Fri, 5 Dec 2025 13:19:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/xe/vf: fix return type in
 vf_migration_init_late()
To: Dan Carpenter <dan.carpenter@linaro.org>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
CC: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
References: <aTK9pwJ_roc8vpDi@stanley.mountain>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aTK9pwJ_roc8vpDi@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0252.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 92373fc5-8379-4c2b-6cbc-08de33f88ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGZZeFRxeFlHUzdQS2h3YzJkajlyalp0UVpIYzhSaEJsaFB6UytxblpZdWIw?=
 =?utf-8?B?bWQ2NTAyOU5iemVhVWZ1V2dnUVUwUWRTSjIvK1N6akVmUDQyVHNjMzkxRDc5?=
 =?utf-8?B?eVFNMlZCYk5NaEdTdEw4RlNYeURSYlpoTk5jUW1wVmpwYlF6TmlUVk1UQTRy?=
 =?utf-8?B?MHUvWEtCNlJSMDFyNTEwUFgwREd0UnRiYitpZ0hKYjZRQzJTN0RBSFRDSG0w?=
 =?utf-8?B?ekVPdUVzOTJmREJXdnNLOExiOVZOaTNRZ0srMkU5ZFErWExraU5EMEtRSTJ2?=
 =?utf-8?B?VjVQN0Nwb28yTE1JMnJpTGlWZThEdUhvdXdyM2JPanE4WGt5RlhtdkJtaG80?=
 =?utf-8?B?cTZHNnp2MzQ0bGY2bncvUmUrZFM1S2VBejhZNlE0SEpnNXZaa3c0ZUZFeTlY?=
 =?utf-8?B?V21GaXpVZ2pJVENOL3h3THRUWXBxRkFmS09Sb0Jrc0JHUnRxT2tvaHQvaHZZ?=
 =?utf-8?B?clFNcFRxV0VmWWNTbzBzbVZCVXFwalNaODdnYWphTE1iYjluNmZkbGNJeXRU?=
 =?utf-8?B?ZDZkNEIrTjlKRVdpTEtRUXUwVVNweGd2d1c0UjZpUXM5NUVOWnpDclhsQUNX?=
 =?utf-8?B?ek5oYXJiYStlYTAzcml0bmgzVmFZWTE3eUF3VVp0S3IyYlBLU2dKTHRwWEs3?=
 =?utf-8?B?cEg2RXBJODRxTU5zVENVZlVLUDNsUFlQZGNXZkZCMlVmWmdDSW1tRDVKaUNV?=
 =?utf-8?B?dHI4bkpBRXBVMmpsNXA1c0t6R1Y4dGMyR2k2YnJDK0ZVZjVKbm8zbXFvWFNB?=
 =?utf-8?B?cWIxdE5KWGtFbTV5V0dmWFAzcWZ2ZWU5YlJ1dncyNjk4ZGRMQUhPY3B1c3lH?=
 =?utf-8?B?YW0rZjlKd0VTQ0RVS1FiMlFJckN4S0pyUWpxdGQ4SytNblZzaTNib0UrZ3Bx?=
 =?utf-8?B?Mmc4aVpiZWg2Q0U2TEpZTVVMN0VFOTA4ZlNzU1Zud3hFeThJWEtjZlNzVTdC?=
 =?utf-8?B?ZCtqRktCRUJ3VXFUT0VYcWd0akdKd0lpZWFUa2ZzeWhtVVJ3NHN6RHc5ajBN?=
 =?utf-8?B?NS95UUVURFpRaGQzYUVLMkFrMUhOQzhiN0d3YjBLMUh4WDFEcEpjZTBVOXZL?=
 =?utf-8?B?WjR6bjR6dy9rQmhxeHV2U1BMSG5KMVcyeklwVTdaa3d1WklKSUVxQzBteDhQ?=
 =?utf-8?B?Z21GT01CcG1BZWl0eTBMRHFXdkV2UEFHS1NIMUNOUGZZMFhKZyt0WU9JK21i?=
 =?utf-8?B?MFV2dnU2NENobjQ5U2VpcDdEck5zSkY1b0UxMlBTcEFic1QyZHBlR3RGMENB?=
 =?utf-8?B?RWtYaEpETHhtcmpsVWxWSmNYN25VZEpXek9KdlQ4d09ERFpRUlNEdkRIRG1Y?=
 =?utf-8?B?bTR3em91M25vODZvVmxNcTJxTHpwOHBSdVBOcllWRkVuZFlVVlJ5WVgydEpQ?=
 =?utf-8?B?blhNbWlaUkdPU2wwQVVob2FEVXdTVjdUTktNQUIxaDRQdjVMZjV6SEtoV3hG?=
 =?utf-8?B?dVlHYlp5cnNkdlNXTVFpbEtIRkdrUHcwR2U3L2RkdnRDc1ZiK3ppb2xPNzZX?=
 =?utf-8?B?VU10cVpBTjlmeHRxeStyYVpoWTNKL2JIN0RQSzdjVm5xWC84NjNBNlRIdXBP?=
 =?utf-8?B?aloxb1FpUXd1VUM0MmQ2cVErWXhkQUxUaE9JUXl3TnFYekExdnp4SDlNcGox?=
 =?utf-8?B?bUZtL2RzeGdnTW9TNnBCaFVsMllQS051WnZtRmw2eURWMXcrdlFLaG9qZWVP?=
 =?utf-8?B?Qm82QTQ5VGR3MklER2xXNnNQS2tjRE5ER0M4VDdxNzZlSHpUcWJxVWYrMUcz?=
 =?utf-8?B?ZGdGU05QTlFEOGJUWVJPaVNiTElHQlpFRnd2RDNPRlhSNTFiazdZSElFSGhs?=
 =?utf-8?B?K1p2Z0lPSWNuNVI3YXplREY5NXJnSFFqTjN0VDh4MkRGeHZqMWw1QlZGQS9D?=
 =?utf-8?B?bC8rVmRpZGNkZHhSd2tRYTZka0VFVi9xSUNlcHZicHlYaHNpQk05THFYOTd5?=
 =?utf-8?Q?37fbfP736Kcerg0N3w8CAlbWdq757x8x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnRnY0dTa3l1RlFlZjRZTk1Cdk43cldra1c1S3Fsc3JYMGVpWk5tRUtMRmtL?=
 =?utf-8?B?OUZoWXJ2U3Y1cTB1TU9peU5Ba0V4WDJWYld2RjAxbWtjSHR5eCtseGwyT3pJ?=
 =?utf-8?B?RGdDVkxsbGJ0RjVwcEVmL3JnOHNDVnRkZDJBUDk4K1c4b1dmN28xTWFEN3FR?=
 =?utf-8?B?cWUxbktHeGZSenhncXpwSVVBc3ZmQXcxbFo1R2VUVmZ5bFhEMVFTSnVRK1N2?=
 =?utf-8?B?cFNEMWk3MytuYWpGMU5iazltVmM3eG1yV2lWUXNDUnh6WlVSbTNXbjYyUnNH?=
 =?utf-8?B?dEFNaUk1a2QyRlZnTVFOeGFwNHozaUtVb1ZnZzlGdFpvOU9vc0ptWjNkUnI2?=
 =?utf-8?B?WWlINkt2YXRQb3kwbDFnc0hYakw2aGw3OFprNjlGcS8vVEZidGg3M0ZIUHJX?=
 =?utf-8?B?M2NBZXpVWEVDZjZQOXQ3bEVlcndGWXpsYzlIYVhmTSt3dGRFemZKeWg1QVd3?=
 =?utf-8?B?TWZMazAvZUQrRDlVSHR2N3dWK1ZsOXJkeUI1RTY4dmRKS1RBTUh4NmU3UUVX?=
 =?utf-8?B?cGR2MU1Ebno3c1VWLzF0ZFFIaTdLaVA2bW1ZOE5sTXNtTzltc210NmpBakVB?=
 =?utf-8?B?UitnOTJWbDN0cDdVYTBpM2ticUhvY29jaXJLQWwvdDVhZnRiNDAxc3lyaXN4?=
 =?utf-8?B?S1k3N09wUUNDUDg5QmppUXg4SngrVkxhRzV5a2pJb1QvOVNrZ3pxWVRIQk02?=
 =?utf-8?B?a0dyZlQ3aUdTQk1hL1ZmSVlHUE9XR1I3SmVSK1hqTGFEQWt1T0RhRnV0ZGdq?=
 =?utf-8?B?dXNTYUxTQjVJRFlRbDV0WEJOSGszU3A1VkhOZmVyMGQ5VVdlSkxIbm9ETEJ1?=
 =?utf-8?B?bmc1OXhremlFb1ozdW9oZEp2RTdMYWE1YTNiRXdkc1VabE5EYXZwZXNUUGZo?=
 =?utf-8?B?bU5jZWxaUnF2SktMcWpCL3pnQlhQVFM4MkQ5MEZCM3NaenV0Q2grV0RlWGdE?=
 =?utf-8?B?eWwyY1F2WEpMY1hWTGY1ck4zNnRLbHBiaFVicFJ1S2oreG9tcW91dkJEa1hL?=
 =?utf-8?B?UzhIc1BHallJdWFlMkdNeGxaekJuS2FFUlFJTndWK2FtVTFxRlU0VlNsYS9v?=
 =?utf-8?B?Wms1Nk5CNFVKeUZuOEt6Qm1kVmNCdHBmTjBoSy9rUFZjazBUd3BDc2pzaEx1?=
 =?utf-8?B?VU80ajhUNXQ3V0tpL09WUitUYmlhMWdvY1FpRkJ0VHdVQ01ZWHY0R1RGZkFM?=
 =?utf-8?B?WGk4OWZjM21kdWZhZWtLSURiZXlmRXM5V0xzeC9scEUxODY3WnAyODFZT1VZ?=
 =?utf-8?B?cy84ZC9HZC9vbE5OSHRJVVRaZE11ZG9nU2hPbUoyUUN2cER3MXo5VTNreUVw?=
 =?utf-8?B?VStGb3o1bmQ1amk0U25yajNKMVVzWmw1N1FUWmMybUQrOXJOdWJNTHl4OENl?=
 =?utf-8?B?N2hscjR4ODIxMlBDeHgxSXJqRWptVEdJV2JoU0cvamNOSWFYaEYyMUFWZ3Bq?=
 =?utf-8?B?SU1vLy9UWkhaS214U1JmdURBSXpHdnVuTFU2dnZoMDhZWFFteWQyNUxYMU9K?=
 =?utf-8?B?TnhXS2Z5SlVVMjJBVzB2ejBOc0M5MytMR3FUUjZ1VVVCQlB0U0Y2MmNzT0hj?=
 =?utf-8?B?Y2h1Z2w0MVZzZlNuMWlwMkkxSzR3Q3F4VVUzSzU4VG5pS0RwRTJ4cWkxT1ZH?=
 =?utf-8?B?SVpQZy9pVENTZ0xad1NVOGFmMzdZN3dRaFNtaEtJTUxBb1I3MjdBV25HNyta?=
 =?utf-8?B?VjVSdWd5b1dGdC9Ea2dCdkR4OUVHMTZENUFaTHlPaVZnNjA2N0JsQ2dYMS9Z?=
 =?utf-8?B?eUpsZlpIK01PWGZXcEdtaXpFSWZ3a2dwVVN3ZUFUU2VLUS9odmJqSmRWVktQ?=
 =?utf-8?B?RkU3M21zUjEyTW5MdWlXN0Z0Y3BOVEdJN2NkMWNXUElBVXNuVG1uZHF5Q1FE?=
 =?utf-8?B?WGxFK0pzN3dMVUMvQytmUHhpaGRvcGYweTZZSmFOV09laWxuV09oRjNwT29i?=
 =?utf-8?B?WEN0cXVkVUtzOUpYNjhQOGd5K2ZSL3QxNTN2Y3RwTTMwMnZvVWNWZTdlRCty?=
 =?utf-8?B?bzQ3emRBVFRQZVVCdWhhSk8zZ3lORHlmZkw2NzBXaEVMUUU5cW1INDNyTTVp?=
 =?utf-8?B?bHR3RGRYOUNBbTJ5RGlTK1RaekZSK0xKaHF0YlczWWR1R3QvaXVEQk93ZGpE?=
 =?utf-8?B?bDVROCszZGdHRDJvQlcxY0hna0psWTR6cXB5WWFoYUxqVnVnVUk4ajIvMk5Z?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92373fc5-8379-4c2b-6cbc-08de33f88ccf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:19:34.2385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liestCtwpnKlGplNWccxzLNDc+7N3vkmfYmq5O8Xt7D6c9uGMr0amelA9EUXE6U6FtcBPSmVOGwvr4D2uBY+c8KDa0IKPcpR7qPbaazDdCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
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



On 12/5/2025 12:10 PM, Dan Carpenter wrote:
> The vf_migration_init_late() function is supposed to return zero on
> success and negative error codes on failure.  The error code
> eventually gets propagated back to the probe() function and returned.
> The problem is it's declared as type bool so it returns true on
> error.  Change it to type int instead.
> 
> Fixes: 2e2dab20dd66 ("drm/xe/vf: Enable VF migration only on supported GuC versions")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 86423a799d57..1b75405b8d02 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -226,7 +226,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	vf_migration_init_early(xe);
>  }
>  
> -static bool vf_migration_init_late(struct xe_device *xe)
> +static int vf_migration_init_late(struct xe_device *xe)
>  {
>  	struct xe_gt *gt = xe_root_mmio_gt(xe);
>  	struct xe_uc_fw_version guc_version;

