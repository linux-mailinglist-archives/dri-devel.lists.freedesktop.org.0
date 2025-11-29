Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C34C94815
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 21:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3074B10E225;
	Sat, 29 Nov 2025 20:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mg2/9bSD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97B710E225
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 20:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764448577; x=1795984577;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qUpASK/ocLOR3EK6Et8q2vt+PtbbCahZe7VtUlMtnuY=;
 b=mg2/9bSDOjXDhZcDEba3v2lBT3/Wwf20XAP0lg3daVDwA4vhiGn2GBUy
 qCw63EdKxWdP+810fg8k9jYUbYxu4+54FsEOgX6e7ZwuZsy4dTPCdV3NO
 RxDRxw1C1f1FQ9JTSZbcTkZW2BlXmTca7H1Ajt35MU/8rU3ZTvj5XJdTX
 /LdyP/wPsmec/XsL3UuBQo5V6RbbhYArLcNDBvpy9jT9Z6ub01iWk2yJC
 XfOMyfGEX/qdb7P/OJsjb1EP0ERkHJqdnCkFF9fv9NMhI9M67YvdedsFM
 0m5PxXIStjZ74yleelYXwQUXhA6T+3AvMa/CrQqdiB403NsGtyC/fPsfO g==;
X-CSE-ConnectionGUID: V34reMqHQrq1w5uJzMdPig==
X-CSE-MsgGUID: epQ/NZBsRJObT1ANitLc7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="77787818"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="77787818"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:36:17 -0800
X-CSE-ConnectionGUID: 0WM2f/aGS6ST6AND6WXM1Q==
X-CSE-MsgGUID: w12OVrzBQgKKRogqsRgL/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="230994163"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:36:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 12:36:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 29 Nov 2025 12:36:16 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.12)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 12:36:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoIykbaXPknexH7NX2FPSCsi5225sCEyRcSBoLmzmHQlvXLZZpmOaNMOznULCyMuzenLGEPAL7lIolst26Au+D7Hu2xnDpL9a5uCuZpAtY1S87topT/+AX11bsXUgiHzw5KbomnKWH5OJ7XOjmUnMeZi/tVG2zvxuByQlF0gH5qjV9D5nzqWlvUS5u1Eej3CprPvxjPSON9TSeSqUONHSFawwY0UKUzPUN+hvqnc6XDMzlR5PC1IJC7J995L/xGitFbrCjIXQY0ATT3YWdEIAZMha7H1YVYFy6+Cnj58P49wW6CvE2wYiud8RDHcKogBH4MIt4OOn1XdmNqa2unOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7P1UiANOHr7nfcvWEBvn9+VyYMgEtCCp011DKDaTBhA=;
 b=pk3Hp/Lk5RlHlbHIzHYxrRFID8fAbl8SzgTP5omM4USaw9Heau2nSF0VhcKPyTpGZax223+s3JVErDBku7w2XpSssbqWKy1FMba5/ERufrltg4m/jbv9XmRCHdiMNC5P7H6R25TrpIj1rLRz0Eb9dY/HzrKkuzPKZl+uP7fBH6yd+O6n3V4ixfThZIWIvaHgNgTa9gfdsJB1/73syx28N6FkuqbMiht9FD1lcfYMbhpS3xrACl4oEwNM0iDla/ts6TWIsYxbdqR0r3umT4EfgwzSQy8p+NlWA2eDz8aXNp/GHdWJdEdOK711pRMYRqmg++wB/nGprf5NZSksiTzHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 20:36:15 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3%5]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 20:36:14 +0000
Message-ID: <ef8c17a9-9582-4463-9b01-0de1a6234923@intel.com>
Date: Sat, 29 Nov 2025 22:36:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel: habanalabs: use alloc_ordered_workqueue()
To: Shi Hao <i.shihao.999@gmail.com>, <koby.elbaz@intel.com>
CC: <ogabbay@kernel.org>, <gregkh@linuxfoundation.org>,
 <linux@weissschuh.net>, <akpm@linux-foundation.org>, <tomer.tayar@intel.com>, 
 <easwar.hariharan@linux.microsoft.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20251102122511.21141-1-i.shihao.999@gmail.com>
Content-Language: en-US
From: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
In-Reply-To: <20251102122511.21141-1-i.shihao.999@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::18) To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a465a6-fd44-4a72-dcc1-08de2f86f0c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzdHV3RHSFRkV2tZWUxCSEI5dXR3OUVxYUVmdTF4WlpQZnVzSmJWZFdNeE9T?=
 =?utf-8?B?aVhFcjkreGNQQlB4V1JrczlOV3FSMkczTXMvTTNvWExBaVNxaXJyQ3BlVi9Y?=
 =?utf-8?B?MUVJK2I3alRVZG5ZbXVjZkpVbDdnZVl5V0hjS0dpWUdGalNhWW1XdEhEK2Ru?=
 =?utf-8?B?SnFCNU9wK25wQk4wWjZJWFhuYU5VdGVlbExOQnJRdEpUNnlpQ3VlMzN5ZDJn?=
 =?utf-8?B?REo5dWRBT3RSSU03ZUNNYXBTMFFzYzVZU0FTdnUvZUJwR2lpM0s3S2JhL09w?=
 =?utf-8?B?VGdXRDU1bTN1YzhuK0lDK0JkNW1kaVAvNmxFWWxDMDdFWkFPSVRTcEl2dTlV?=
 =?utf-8?B?aXV0bDJ3c0xpRGlsRExaRHBvYWVNb2JwaGFwVXZlMS82L1lRSHI4eXRYWEdQ?=
 =?utf-8?B?OXlrUnhUcmFsVE1iaHpNOGt5NHlZVUZ6QlJQakhjeG9CT1dXKzl5bGU0Q1lW?=
 =?utf-8?B?bUdlaVBKN0dMR240ODVJcVR0OU9xK0l3TzRzOEZTRU1scmx6NXh2STQvV2Zh?=
 =?utf-8?B?aEJLOVg3elpBN0JubWhYNm5DUGZpQUxrd3MzYWtldTVoQ1l2R1NlVStiZG5a?=
 =?utf-8?B?d3hBZzZlZDExZUNvYmRmMnRLN2RhalF5T2dSU1l5RWUwcC9icVFETnZMUzho?=
 =?utf-8?B?Rk9FbGxEbzZTT253SVprYXhyOUtHTTBHQTI2YjFWcXJkZk5ZYkZOUFRXendx?=
 =?utf-8?B?NC93N0Eza1lyYWdNVTlZZ3I2VElzd3l5TnhnejVmbGZiaWpvTEl0ZGdCVjhL?=
 =?utf-8?B?M0lUdUNMZ1VqTmg5TDhKTXc1dFVVNllEZEZ2NGxsY0RoNWN2UjEvYUQxM0pj?=
 =?utf-8?B?WDkvWHJObWE4SkN1RDVuVlFxVFlzaXJIWmNXK1A3VW1FMWNlT25LQXFLbnBT?=
 =?utf-8?B?OElUSE8xSGxMekJUbld5Wm55YnhpUm9SdDFGTHBSOE5ZSEZlQ1gzN3ZrQVAw?=
 =?utf-8?B?STJCU0ZjeEhFRzM5K09QNFZFOVk1cEtYMHd6WkJXblBickY4Y1BSVmZKMzJV?=
 =?utf-8?B?QUxnZXlpV29VdHFoY1BZaHgrbllaTmprNVFHMzhVM3lHWm4rOU9BTGJUZ1Vk?=
 =?utf-8?B?ekV0R0RWeDNLTnFwYmw0WHpUU25mdlZpc2JpdW82MGdaSUM2TjZJUlhVWmtr?=
 =?utf-8?B?UVBlNXhLa2o3UmpwWXVDU3dFNDQ3SEI2ckdBNUo0RjB1eUwybVlTQzJmbzNX?=
 =?utf-8?B?OVM5TllXS0VKSXhyVjB6Q0dVcDJsOWZldFp5eXRLNHNwamw5QU1jeHJ3WENR?=
 =?utf-8?B?Y2hCdjMyZDZJQ1JyUFhUb21ackNHak5rdDcxYXVQNXA2dk1TSGtsZmVpN2hl?=
 =?utf-8?B?VlRMN2JlaWNrNWVmcXZ5OTVoYzZNTTlha29PU040RGlvZkdvcVZLSkNzdmZx?=
 =?utf-8?B?Wm9rVEd1a3c4Rkt2cmdtaS9PdDRGMnVFQm5HR3pkVHpMQlhnVnk2N05vQXhD?=
 =?utf-8?B?cUxNUnNWeG5IOWtEU3c3bmkzaDNrQjBlaVhCYkVRelI3bkZCS2Z1UmNVaHZO?=
 =?utf-8?B?eCtJaXRYOWJ0eHJLQTQ2b3dYRVZNUisyTHY5ZmhhemlFTmxydU5VM1I1NjZu?=
 =?utf-8?B?VjNVOWMzVnJwdjNEUk1jUE1GOFdTOTN5dFZaM1JzaDFFMXVId0JkZ2hjYjIy?=
 =?utf-8?B?TWtQbHFGK1YrV1c0cnM2T2Ntdll0TXNNOHJBRUU0bWZldTFzaW00NzZMUVFN?=
 =?utf-8?B?b3VaR29vSG5NNmhiYnQvMysvdndiQk1SZ2NnbFRVd3U4NVQrUmRQYVdBMUln?=
 =?utf-8?B?SWlheWZpRklZNXlPVXBaMDVUZEwrekZkeW5KeHVtemRDYVBKMGJlQy9mV3Zl?=
 =?utf-8?B?Rm1wSFFNbkcvYVl5L2tEdEJIZHFuUmtTMlFwUjJwR2xXQlQ1cW5sV0t5MHNp?=
 =?utf-8?B?VVJQdlB6Umd3bUlaTGVTUU1yemFzTVJCaG1XU0Nad05EelQ3S00wQVpQT2Js?=
 =?utf-8?Q?Us4bDDBZ9mVbU3ruIcDbjZD1cVLbygrt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUp3WGQwTzhmTFltZnFEcUhiY0Exek11OHJPSTh0T1FFcDFQVUwyVk1Rek5L?=
 =?utf-8?B?VENhUTlvUHRuV0dxNW5kWkwweDZzOU5QWU8xampHbHlWRVp2djlJU0JKa0Qz?=
 =?utf-8?B?bHZXTmpDSWJwZ2RVeFhCZWZHdEVqbm16WVhJYTBZWXMwcGRMbDdCS2ZyLzB1?=
 =?utf-8?B?cXRNQU9xUndma0k5RTMxc1UwdVpjbDhjdEMraGZJRFo1N0ZvMzgwcmswc2dZ?=
 =?utf-8?B?TlovamRTZmhSNUZGTlgxVEsvcFpOWW1aSjhmRzVUVEtCbVVXR0R3U2pad2tB?=
 =?utf-8?B?NHgrcnJkd2pKVGpja1VCRDdOSzl6RzJmUkJuam9waDExdEt1SnBNc0JxYitK?=
 =?utf-8?B?Y3VQZ1l6MnM2RTI1Y2licHpBM3QvRmdRdnMrMm5zS1VIZzd1UnE3K1E0Y2hx?=
 =?utf-8?B?SjJQRmJuUDJJSCt0dENrMWFsZ3BML0xkdzliU3pWemxWRDNheHJBZWdpQzlM?=
 =?utf-8?B?cWUvNDJKblZiMnZjUXlXL0Y4ZW5UaVcvZmFITjJCSnhlUkhGZ0JsakpxVmZm?=
 =?utf-8?B?L3doVFViWjZydTVxdWN5c1RNUjFyODVLZjNHeFlrVzcrVjNHRlZXcjQrMFlC?=
 =?utf-8?B?eVZxU1RTNCsySU5PNFlCNVVoY3VZODhuMmxYVXhjTHdUVVlYaE81S2t4K0c1?=
 =?utf-8?B?M1htQWNYWFM1T2hTL0xLQWRWcWtnM1kvWndjSks5VVZIYUFWOC9TZDU3V0VC?=
 =?utf-8?B?SDlQY2NKdy9Bb0J0RnRGc3RCdlhkdElpZ3pGc0drVHljVm9vT1EveEpsSXZC?=
 =?utf-8?B?V0Z3YVBaVUtuWXp1MFUzNTllQlprUUZVZWhUZVQzME1XSno3dFpBSncwM1Zm?=
 =?utf-8?B?UTdzdkc2b1l4OCtlcXZPM2tvaWF0WE9uT0FnQWNMY0tCVnBhZnNET0tvdnF4?=
 =?utf-8?B?ZGpTelA3OEhubGs4dnZFdnJxUVJIWDM0ZlluNFdnRi9QMTg4aFFCWmQ4dmFo?=
 =?utf-8?B?T1hwMERyTlVkd281R3AzOVZTTVhFblBaekl2dWZQVmRoaHhZWGpPUnAzQWx3?=
 =?utf-8?B?Nk54L2s0QTVOY1RYb1hKMm9UbTd3Q2JoMkhrMklmTHRVcFJiRWRxdGExZnVR?=
 =?utf-8?B?b1pFN3BGSGNRbXNFRmF0RTVna2Q4Y0F5ZVlQMGFVcERVTUx1ZFpzN1d0dDR3?=
 =?utf-8?B?czFySFhwdXlxcFVlOEdpNVVMMDA2dGY2d3FEekxZS2NLZ05NR3pXdEk5aTdX?=
 =?utf-8?B?cE5DZVQ5UklVTlVxRFBlN1JzMmZhNEs5UXB4OXFYNE0xdTd0UFExNGkzTHhC?=
 =?utf-8?B?cU1hMklTdkRHUkVOQ3pmQnZubktnVDV4SkpTMWc4bTdNTGdVYWtheGlhazFs?=
 =?utf-8?B?cFY4VS9RZjBJWkhtVXlkVmZZMWJIb0krNEtzYkZzemM1cXYvQm5lZzZVR3Jq?=
 =?utf-8?B?aW9MSE1iNXZkTzNHV0NiSXJQRnRGOXlpdXhJQVhZR3I3L0N6NDdaNlNzWXVJ?=
 =?utf-8?B?WWk4eEdDWWhHaXUveSs2Vnh5SkJycEJmZTg0UFhuSG92czdlZlBKbmkrNHVv?=
 =?utf-8?B?L2FBa1FlZzBudEtjaVZKZFFLc2Q0UGZwdW8xRzNEaHZ1RFNWWm5ydm01OTQ5?=
 =?utf-8?B?bi8yVjd1WTQ3ZkhTY0xrcFE1OVJLaDFWbEhSN3Z3RldLZm1FMEpkMFBrRFhj?=
 =?utf-8?B?OWw1RU1tR1dHalV3T3E5KzJGZGtFQ0lnc0pmMDZ0WXFIenVBSENHb0c3a2Jh?=
 =?utf-8?B?U25FYmNFenV5dDRnNFRlM0RvN04veXdjbW1JM1hnTEQ2aWVPQW96WTA0N0lG?=
 =?utf-8?B?S1B2b1d0ZUVJSXdGeUliWWpxeGgyYWozZ2JtMVdsdEtHN1NadzlocmxlRi9r?=
 =?utf-8?B?bE42WGxBaHRKWDdZM0NuZGxVcnR3OU1nNlF5VzNRZmZZd1dLeU1NMVhtck1z?=
 =?utf-8?B?ejV0bU9IbXhONlF4MHdFVEpBaFpxOXBPT0hzbDFyL0MvSlBkUEpVd2c4N1po?=
 =?utf-8?B?TjV5eHR1VndDSzlaajIrSVBMbVBIV2FIdFk2Mkk4UGpneGdEZm9FcXl4aVox?=
 =?utf-8?B?U25NQ0R5ME5IdUtHNkg3RFFGU3N4b1VKZnAzTTNiKzZNdVRzcnVrZUk4VkQy?=
 =?utf-8?B?UVhNWnF4REpaMmt2SU5qbEpyS240cEl3cHVQdmNrU2lXai95ZTdRQjN0Umll?=
 =?utf-8?B?Yi9WSEJNSWhsMTBPWC9UREQ5K0lpVktFeFRkZzlsVldGZGp2SHZSYlRKVnMr?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a465a6-fd44-4a72-dcc1-08de2f86f0c9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 20:36:14.8420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmo7yy7MNpDLD5ub9IqNQC0Amnn0beYhmBRZuLF/gKCcDsadhEg+x11c7uxSpKP0iILFlvXLnbVljetqKGtxNc9dZYTcGM29fTC0bKaXL6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
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

On 11/2/2025 2:25 PM, Shi Hao wrote:
> Replace the deprecated create_singlethread_workqueue() functions with
> alloc_ordered_workqueue() since it aligns with current workqueue API
> modernization efforts. The conversion is safe since destroy_workqueue()
> is used for cleanup in both cases.
> 
> No functional changes intended.
> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>

Applied to accel/habanalabs-next, thanks.
