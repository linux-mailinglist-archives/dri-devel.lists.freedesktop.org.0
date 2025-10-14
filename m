Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AEABD7D06
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7E010E54F;
	Tue, 14 Oct 2025 07:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNZeoCBh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F083810E566;
 Tue, 14 Oct 2025 07:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760425951; x=1791961951;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=045QJEaVeg1vWA3cRO73mFfPUCnw/l9bnGYlX4XBQ2E=;
 b=fNZeoCBhV89A+TCoo46I64LyaM9cVZIWQot881iKmKmYYXigMLNdOf/Z
 fIQoIjoCoOrPJkSA73CnPRoLikSddoxofRt0uPNKPDFUKvuigNyXWyasb
 6eqb2fjHazXJBv7+FuBsS5lN/sHnG0ouM/V+wTd98plzNxpVsluANcHui
 5QgtSwp/ukHVAM+gbTSQ7eEJY3Gt6SNeyfFIiN+rEO+mY+2T5nZYvl7LS
 CmGIm6k5Zj2H/Cy0cUllxx1+J9SZ9Q5eC9JesNxvVSK/4nPWAF1z9kXRZ
 nIw1Nzz/FrfI6NOEkDQZ3IF53M+FwOC/RHyGTT6sJ9QDsIkrihcgg8Ec5 Q==;
X-CSE-ConnectionGUID: rNHH+/95SmudRJ8Xn4DDFA==
X-CSE-MsgGUID: aFoDl9qeTxWzRqSawd5XnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73180932"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73180932"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:12:30 -0700
X-CSE-ConnectionGUID: wgJSaAh3Rde1oLtwLEYrxw==
X-CSE-MsgGUID: ocQfZL1URwmA4hb4cCgRaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="186062285"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:12:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 00:12:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 00:12:29 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 00:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzS1plm2PvvZsJE4VNv8zxBmBaDTLhWwg8+LJ8VDoiILlAoe1A15uN6sKWh595ETRzJDIeEUS7ne9+OH3opBqkpXDGpM4Mz8XaViHLiwX/XwCaglgpwnP1wJ1jC/4KF8YjXLaNNFQbJ0a/itWvCEQFiyGhC20jIDp+X44Z2Y/iez/2YrxlLCaFx4JKf4FnBpYLkrQodaQr/+6GjkTrHpMFu6NunAb6+1Lw0AxhZdAfHOOg2JorSplJ5k7Z/THxP3kLR/bNQsBZTpsVWTQDDVokF9LpSXSqiwvde8E2sZowkWsVKy+PqlxNJL8NRxJhZ1nKASSaw1+k7D+1/v8aC0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV9NniGb3zfczcFmBW1bIC12xC54sJIQkk+z39gtt+Q=;
 b=Xy1sjNJYZfQAd3J1gdk4H0YiZL/mY674Xb3hlODg9mx+tROxcPXu1Bg/OcIgIR0Z9Kq5nkaRy7lxxJdLHohUrOFE8ZiCQWf1rWcCW7W3PXRhlIoY4bFGV1LsEV4Po/Vv4z2nukZIBv+aU7OvTvqeOXZu45ePWPve5B9pDi9sbaqGNbsNmHWEz+U6b8B6JudTWhwVLxZHlWruPyV3RPsHpk2bzSHYAmzMvka1x9lisS6ktErkaFk+VdmoWHw6ET30B69u+Lzt3kRQyqEdYDj9tPfrr0dD5y0IU2RenXGs80n2UZPrhXQr1Z+El/VYGO19Vlv3P3PWEx1MiAkb8j96pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW5PR11MB5811.namprd11.prod.outlook.com (2603:10b6:303:198::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 07:12:26 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 07:12:26 +0000
Date: Tue, 14 Oct 2025 07:12:15 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH 2/3] drm/i915: Wait longer for threads in migrate
 selftest on CHV/BXT+VTD
Message-ID: <uoshfjo7uu4ezvd4ehregiktmf2mabme7qr2wrldxdygy3mmrg@swgp5q4wlus7>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
 <20251008161258.3568573-7-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251008161258.3568573-7-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: DB3PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:8::32)
 To CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW5PR11MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c12fe7a-b81f-4cbd-d577-08de0af10768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFZsUzdGS3NDUjlydThhRmZZT3pBeXc1d0xLUTc3MCtMUFNaTlphR2FjTHlR?=
 =?utf-8?B?TXFhVzJxT1JDeDUzVmQ0U204MzNKSDE2WkNOVWdzdEt0NDZKTU9OSXN0Y2k5?=
 =?utf-8?B?ejhvY2l6WjVYL0JGQmgxNFJHcXk2S0lMYXpnNkxrd0xOZWtIdVlMd0g4enhq?=
 =?utf-8?B?bVFraXQzL0N5RmxGZXVKQ1hQbDU0VVhFODJrQlQycXRRbHdndWpvSkp6OVgy?=
 =?utf-8?B?emVVWUFUTExnUzdIM3p2WVNBYm5JTmtlbG5IbTg4bm5rVlFTckpxbmVoVVRz?=
 =?utf-8?B?TmxEOXo3bEJZeTdLRjFmS01uSkZVcXJoR0NiWHgzeEpsNHZEMGhKWUJNcStT?=
 =?utf-8?B?UDhYUGdlVVE4eDlhL0ZoL1dlalg1RE96NStKR0Fiek9ySThYN2ljSmJqd2M5?=
 =?utf-8?B?YXFwM3JKZmhSMlV6dytYcEs0M3gxOWRwTVNjalF4RnhqdFh0K2g3Y2FLVWNN?=
 =?utf-8?B?RmVIMlNaQXdJMXJWS2NEeThPZ3pBRkhXTEhWazlxb3JncTlOQWFwNEZaVWtQ?=
 =?utf-8?B?VnZ6K1NXTkY3czRyb1ZEQnFOUkIyOTVRVy8xWHIwY3BKNW5vNXJyeTJsUElu?=
 =?utf-8?B?dFU5eEdmZy9zL2diM0JuYkpWK2w3bTU3UWRQRWdiZklkZXZQWGxtQjJsa05N?=
 =?utf-8?B?M2JibldPOXcwU1JOZ1piV3BZOW85VU5ZK3FmdHVjQ1dzZjlKRC9BRm5kY1VJ?=
 =?utf-8?B?eEVxLzZhOU5rcjR5NVNFNXRJOHpVdlBvejNPV3ZaeFRIUnZUQXN3dzBrR0wr?=
 =?utf-8?B?K0t6RWJCUnh4ek9KMlhQUEo5aVhnUENuaHJ6K2c5d2tYRXdLOWJ4STdtNFNI?=
 =?utf-8?B?bUZaa3dCN21BaThmOU9SSEJuSmhETjJpS05xc1BNNHJIL2tUUEYrcVcwL1V3?=
 =?utf-8?B?OC9zRE1Hbkpoc25DV2F1T3lIL2pCNFhTc01INmdvRG1qcWdYUnA1bHNOVFdv?=
 =?utf-8?B?SHNqUFJWOU5iSTJqRjhNNXZFV3d2YnVsSEcxQzJHNUxldkx0VUJjS3FGbkZN?=
 =?utf-8?B?KzE4d1JsTVJQMmg4Ui9MaDlPK0kxKzJRc1ZlL043NGRRYzBycTRGdUpYT1Z5?=
 =?utf-8?B?eVVVREd0ME81TkpZTXJjMDFvTXFqbEp3SVhnNjNDTWpLbERRT0RtaC9wUzla?=
 =?utf-8?B?MXFuM0FkTG5pTGJ1NDBqdDI2aEE3Tko1c3NhSWZ2Rm5HV25ZdVhITVN3bjdv?=
 =?utf-8?B?cWxMM2NvRVZSN2doWnpBRkxmN1hwSW1yYkJwY1RSSTBGV3VLdlBDTHhKTDJm?=
 =?utf-8?B?aDZLaFZNYlByV3BtR1g5cWlWSVZRRUhvV1JQdDc5TUlaRW5kQUMxWFdiNGFY?=
 =?utf-8?B?MEJKc2hYcE4zMWpIaytyYTN3V1o3eVZVYmU1eDBzekdHcFBEYUtkb1dvdUxy?=
 =?utf-8?B?dkY4V2lBaERFVHZ1dGgwUWwzZU1aUlFhamdtZmNPM1NrMmNBY1BxcGx6NUl1?=
 =?utf-8?B?TndTbVd1Y0JPNnc5cit4eTRqY0ZYeG8zZnB4Qzl5OEp3TGd5M2RvRVpwendQ?=
 =?utf-8?B?UnZjSlVuNVp1Rlp2T0IxQndzeWlUMHBaTzZ4SVBCdlJWQ0dGV0hGbnFtMm55?=
 =?utf-8?B?UVZsRkZmYkxrVTR5MG9tbjlCNnliR1d3eGJzS1BLRFRNNVJHbXZBaG9URmJT?=
 =?utf-8?B?MWl0cDVieldlTkxBZXJsdVNNSGxYTkc4VGpUdWwybGw4WmxHL3UxRHRMU2Z0?=
 =?utf-8?B?cGxtNUpsTWo5ZDRseVl6Zy9TYm11dGx5MWN2STRzY1pQUUNmcHp3Vm93bERV?=
 =?utf-8?B?a3VXS2tVYnl4bVluZ0R2T2VSaHVxa1pENmNUcDh6ZEVHQ0FwdnJOVzRKUE0x?=
 =?utf-8?B?blhUOHJpQzBic3lqUUJQaHZqa2lhSmpzQytZam1NSWI2R3R0ZkdJMjJON0pZ?=
 =?utf-8?B?aFc2Q3V3Y2RmTHpGb1hTek9JYzMvVThpdE5CSi9VUUtkMm05M0tkaUFUVU01?=
 =?utf-8?Q?8RSwfXh1o9oqPJ7VDlt4eaZnccKt0r+c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODluR1BNeGxMZS95YVROdGszR1dWZm1wd09GV2o5V1owSHpiWElwbmFaUldn?=
 =?utf-8?B?WlhkSFVWb1ZnclQrS3EzZGFoMXJoOEJSZFNLWWRZeDFSVGRDak83bTdRTW5k?=
 =?utf-8?B?NjZzRFFqdEVSeGpqRXJiODk1TWN1amJNMlg3MW1tY1R0bDl3Wi91ZVcvMnZX?=
 =?utf-8?B?citsT1ViZGVBdURoMEZHazZuZ0k0Y1E3WUY0SlJ2N09KS1BTZWJXeHNxcmNt?=
 =?utf-8?B?UGh5L0Y4WEFxaksxM0lqbmg3WThBM1ljMlZZdWV2WkNQdHlGQllpcUxGTTNL?=
 =?utf-8?B?a000OVJDRWIyQ05TdzlRd3l0dFRMTnR1dFhoZ0VIVTlodFBmRitiQVpjaGQ2?=
 =?utf-8?B?NFJRSDVpMEt3Z3dyTENuSFN4em90UHNheS9GS1JvVWYvUUZncUdkR2o3M0Q5?=
 =?utf-8?B?UVBlc0NQVWI5NjY2Z2U1eDJxbWJpWFNTR3Nld1dQRVpENTBzRjFoc3lkekVM?=
 =?utf-8?B?cUtWckVqY2Q0cW5xcVVSL0hnOFQraWlHTVNPSWhFekRGMlNKMWpoK0VXZ00y?=
 =?utf-8?B?MElMSCt2SnZ3R2ptaTUzT0trMkppS3dmNllSVlBYeVVJaXNMdjliTjIxNVVJ?=
 =?utf-8?B?N0tyWjl6cUFjSFU4bzZVL2Ria2pjeEREcUU3Y1ZrdkE0eFpCWHl3RTlpWWx5?=
 =?utf-8?B?WXgyRmZZSG05MzFxQStaNnUvV0ZRaHhXWllMM3kvL251cVZZbE1sajBkMktj?=
 =?utf-8?B?VHBodC9vSDFyZzViR0wxdjM4Tk9SSkVKU2lXT2dPN1FwM2Y5WXAzajQ3cUZv?=
 =?utf-8?B?WjQxOWVpYXo2bmtVSHFkUzllUFRvYnFiT2UrZnlnYmNDZlRPUWI4algwUjcx?=
 =?utf-8?B?bjlWR29OWVo5OEpGMkhSM1llVS81RjJhUUUzT0hBOGs3QUNZODBXR2Q3b3JG?=
 =?utf-8?B?YmROVmg0WXMzWFp1YStQdHc0RVZqY0JTWC9RUk5JSmlJbVcwcjdqNjJGZ3gr?=
 =?utf-8?B?TFlBbWRINnNYTXRTWnBiMzJ4VEwvOXl0Z2dlYjhXVHRNcWR6UE55Qkp1N3lZ?=
 =?utf-8?B?WFlNRS96SERDblhvQkdOZ09UYktOWUxPNlVmVVpiMDdiZGFjVWpJb2JTZURm?=
 =?utf-8?B?bDEyQ0VFam1zVFlqYnZUaXhONmgybWtPR2R5ZXZ4eGQ2Z1RXSDg0Y2diTWlX?=
 =?utf-8?B?NmJqREV2cDNBNjdDQTZmRzBsWGhDM2g0Z014NWNrM2plMUR2UUJ3bnA1OTJR?=
 =?utf-8?B?QmU3Qm5CczlvOXVRZXRtTllKM21wZFNQRkhObjFoVnM1R0ZhU0k0OU8xUUw2?=
 =?utf-8?B?cjhOK095VEJNcFJtUFR1Qkl6MnZIbU1wb2VhSWUvOFdCT094SDAwcDBMSXgx?=
 =?utf-8?B?UGRGZkdxKzllMGd0R25EVHR6VWhFRllXMEM2c0ZmY3ZFRVVqb2dpUU53V3Zl?=
 =?utf-8?B?WlNIZmw4UXl2b1ozM2FlZGdOQ05nU0ExL283bEpmUk1Ia2dvclhHN1RkcEsx?=
 =?utf-8?B?dExmUDVvUG92cm4wRlk5OUg1T2xMay81cEdzeStXQjdDemZSUmpPejQ0YTRo?=
 =?utf-8?B?SzAzZXFLMWZzYWhnaWZabVR2NnRzT1NKdE1FeG1KRVF2Q3dIbHFzSjlxTWR6?=
 =?utf-8?B?Wk9JbkZwV044bkZBWUVhSkx3SXp3NDllNVY1aUw4U3RMVHZrRk1naXI1TStl?=
 =?utf-8?B?VXlnYVhlN1FkWVdNeXFkU2g4ckdyY1BuYy9DNmx1MnVQdnJqMHIrZ2pZR3JX?=
 =?utf-8?B?NFZXY3BlaUMxaURXQUVlRVREK0lvMFliZk1hMG9SYlgvOFRzNmt6YnpJTTJn?=
 =?utf-8?B?WnI4Zm92MEpZajhqRGRlM3hmYUJ2VFBKeXZPeGpoYTZFaFJNU05WU0RjVEg3?=
 =?utf-8?B?S01wTlVySUUrVVFDUkJ4TzR1OUU4TGJQOE1Ia0tkQ2c1MHpCMXk3TVV1TzRB?=
 =?utf-8?B?VVlqd2Q3UGJ0eStzMFlBMjA3OGptaVFvTDFBN2RjK0RZcS85TkJkRXU3RkEx?=
 =?utf-8?B?WXdDR0tTUTI2QWx2RlY2RmlKVjlvMzBONE5SSXNLMUJkb2tkbkY0M3RMbng3?=
 =?utf-8?B?YjQ2eVk2WU0yZFlwSmxDSlRCLy9jVGFzMk9Mc1dqZ0w1RmRlek9HaTNLbVI3?=
 =?utf-8?B?d3U3MmF5akVQQ3NpRDZSNHN1VzNoZWlGTjhiZWdNenRVSmp5QnM0YXVHMEN0?=
 =?utf-8?B?M2xHOFNwajBQZkR5ZFpuSldqdlowMmhnZUs4OVFhRzNCQnRlQUhJanVPZGpt?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c12fe7a-b81f-4cbd-d577-08de0af10768
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 07:12:26.6396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePyywsfuDY8eVSrijugqQEf42UVIbmfJcSlmSCYxaiJXcgINCiG+fDSI+d/vWyeEX+tv+PybFTdulC7fN60dgcQN2gMlEmwvoCvV3v7B81o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5811
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

Hi Janusz,

> When running on a Cherryview, or on a Broxton with VTD enabled, pinning of
> a VMA to GGTT is now committed asynchronously.
You could also mention previously discovered lockdep issues on
those platforms. I think that would make it easier to link this
commit to the previous one in this series, since there is no
mention of Cherryview nor Broxton in the code.

> That may defer further
> processing of resources that depend on that VMA.  As a consequence, a 10ms
> delay in a multithreaded migrate test case may occur too short and still
> incomplete threads may be interrupted, and the test case may fail with
> -ERESTARTSYS or -EINTR error code returned by any of those threads.

> 
> Extend the delay to empiricaly determined 100ms on affected platforms.
empiricaly -> empirically

> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_migrate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> index 54bc447efce0b..cde755751a0ba 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -710,7 +710,8 @@ static int threaded_migrate(struct intel_migrate *migrate,
>  		thread[i].tsk = tsk;
>  	}
>  
> -	msleep(10 * n_cpus); /* start all threads before we kthread_stop() */
> +	/* start all threads before we kthread_stop() */
> +	msleep((intel_vm_no_concurrent_access_wa(migrate->context->vm->i915) ? 100 : 10) * n_cpus);
Hmm, I wonder if having 100 ms delay for all platofms would
noticeably affect our testing (to have more uniformity here),
but on the other hand 10 ms was established here for a reason
in the past, so it should be fine.
>  
>  	for (i = 0; i < n_cpus; ++i) {
>  		struct task_struct *tsk = thread[i].tsk;
> -- 
> 2.51.0
> 

-- 
Best Regards,
Krzysztof
