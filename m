Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A872C0E030
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FCF10E499;
	Mon, 27 Oct 2025 13:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHwDbRhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9DD10E494;
 Mon, 27 Oct 2025 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761571658; x=1793107658;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CO8Cna6fVZz/p/iCnhMfQAItLuq66vzTjiTrzC29KOY=;
 b=HHwDbRhiLmDpVj7Yv5u2mXYSbiWkCKBGjmJFBtfSS8epSw973Z/pFGCt
 j1Z4krNP0GLv32OTyblt3AbfvKZZV4JW/CViPfGO8x0SRwvuon6H2ba7a
 T1ajEN+Tq9TzSuekH1E5qP+L1Y71BBMnPXfWX8E0c/LETvvq6eG62/Zu1
 22w9dd7piZmKH6/tAYmP4WrMQ6WA6xY0KZJzBU8shWYzOmnibLZvSNQx3
 H8ka0HW0fkMtqE9pooPkC4d4Gla7QluHyaOnVWn8HolYFloW2B2g26dGc
 qBVT4zyJN6hXZw3aecAK9ZPrcXDWnUjSDdy+LYGP5+EGipPA6vH9mxE1n A==;
X-CSE-ConnectionGUID: Hmajno3SQDuV2BgbM7xLug==
X-CSE-MsgGUID: yT+5tq2uTfaRVenJ+uLi3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63350621"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63350621"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:27:38 -0700
X-CSE-ConnectionGUID: 7d1oqXSwR02BWN5VPp+dJA==
X-CSE-MsgGUID: 8DT0hgtKT/qY4+d+DVZCXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185510173"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:27:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 06:27:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 06:27:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 06:27:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuDDVsOQsSmDejXXpB/wlFdjd6oEQbzI2vVKQfINuicfiInKlGUi/8FxpdU2+EAmdgaJqOukZiOcD3MHmpi1gfh9Okf6fejJsS0iA8fCeI7HGQPNn4DFwQglwdpGB/TafrXM4rZbvhNsw1MCj/g9y3+p/pNpd6Wo3B/dnXevjjZCpzYUR3uziGiF7500wGVzvB3/La/VC8AHgxu739PWqUHPdrWon+WVg4O1mjN1NKBrGWbftn9Xkxfd6vbwF6aUNRiuZL+W3HFIRLPyOep7XFLQ+hZGMxJFVtsLaLbO/Xz4NYu+8whiWmKvQOpxpR33ELEC//XezOWhOpquWCRG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzpD7/wKPTd8FUHr8V/JoT6ZMNSg5XnDYpSWbcplGJQ=;
 b=JBn3aZBjVySdbNywEZk+8wkiUQOot7HwDTl+U0DWYxCKQk+sl60fYLzNEgzywGjO9Qjvqn0mPt5ENpBhAzbEYLs7T998Re4ObHXKOlEN648sFXKlBQ9ra3RexoEJFBmV4sPi6qu2r/B7q7iLtVppUynusQ/rhmcjqYJYHYV5Q2FD9aaXZ8HKcnsZ+btUF2Wk8oqD2cACvjqXOXvG3JB6SYdBDZ93PthLK8emkYu19Ngjan0uF97120Rhd/OmQYg2z3fxmsP7cxgiX14PcYZiaRw6ALRHEfxM9AuZTxwqn8jPVVH3vtY+7vHO3m+WXGz7fOjL5y0eHPTddr5n0tihwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7449.namprd11.prod.outlook.com (2603:10b6:510:27a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 13:27:34 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 13:27:33 +0000
Date: Mon, 27 Oct 2025 14:27:29 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 06/26] drm/xe/pf: Add support for encap/decap of
 bitstream to/from packet
Message-ID: <bu3iz5igoi3uv3b46n5h4o3hcd5cbqza2idcaa3d3by4ewegjf@5to3q4tltv3m>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-7-michal.winiarski@intel.com>
 <0c76e7a9-c6db-4148-bd9e-a96fcd01247f@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c76e7a9-c6db-4148-bd9e-a96fcd01247f@intel.com>
X-ClientProxiedBy: BE1P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0a3422-aae3-49d3-bee8-08de155c95e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ujc0cmpsUUc5VjQybDlpVXZ5SHBMamtsaUswdDR4aVB5bWFCU1FlcXBSSEVB?=
 =?utf-8?B?VkhkTURBeVZxbUdPdEJ2YzhOS1k3OGo1OFhQZEcrdTlOSnVaSkdNaDFFRFJs?=
 =?utf-8?B?K20vWU9PcXM5VnZ3ZDc3WVQrRFBkMWNZSDNRaXFXekh2bjA0T2p2SUwyNjhs?=
 =?utf-8?B?WmdFYnpOSVZZUUJFdkY3YzVqeG80U25nMXM2c0p4c2sxSFRoemFvTFcycVFY?=
 =?utf-8?B?QWt4L0VZQjR5bWFRRXI3bHBTajRqeFh3Q0xYRmZkbHkzWllRVnJMc3RVV0x6?=
 =?utf-8?B?UncvMGlvWGZ5L2hsTEhJNndQTFRqKzJTam1xd2Z2blFsNXJzTWFzQ2pNVDdw?=
 =?utf-8?B?dEpkK1Jud2kzZk5uV2lPTnQ1dkJoL01EUHlOOVVwRDkxT0dHeHRVU2hNN1NI?=
 =?utf-8?B?b3Jxa0Qxck41NkdpL0xWcUdjeFZyNkJqczBhNHBzSWNudEVaMEQ1T3NtMmpW?=
 =?utf-8?B?Mi8rUlpycEpUSVdZY2xrVmE5S0NHUlNmSkZya0JqRVYyK0Y4QTNpV1ZmeHUx?=
 =?utf-8?B?SjVaZVRmODhwZEZLN1JjMjRXczdIRlMzc0VCYkNzejE5QXBCOHlKVTBHdUtQ?=
 =?utf-8?B?eVZnU3F0SFVQWUNkeDJjNHMzY2c2Qy9HUitJL0FuK0c3bmVmcThyT0x3UzVi?=
 =?utf-8?B?TEpZK0NpTjBmQVRBbWtlYVlKdjlSSGk5Misrb3FOYjAvUCtUL003VWJLeHl2?=
 =?utf-8?B?VEI1TG54SjFtZzdnc0pDMC90a2tBdlR5L1h6ZVNlZW0zSEQ0TFFHL2lic3JB?=
 =?utf-8?B?QkZxQ3IwMzBtMDBDVVlNZE5KTzJuQ0RlNSsyd2JiZm1rUVRtODZCQmdPbVUr?=
 =?utf-8?B?cHVhbWV1OVpjRU9jYUUySVV1SFlSb2JmUWJxL1doM0RZZzRKbFFHRTAvTVVt?=
 =?utf-8?B?YkVldHdWWVRaQW96SU9iRG51dFl0TVprNE9LV2p0YzNOcFl0T2NxMjljQStt?=
 =?utf-8?B?aUpYSnJZMVFXZFM0cXNibG1XKzk0UGIvYWtwd1VENWdLUWJHdnIraHBjSlZt?=
 =?utf-8?B?UUZ5bTdoa1Q0N2p6azlZc3FpYjFtaFNxcVV3azlPeUNQZUp4dUEvbStDUEI1?=
 =?utf-8?B?ZTlsaVB6RmQvZ2tmTVNkTDhSVVNNb0RJcHkwcWpmWkpISlZLeTJvaHpYREto?=
 =?utf-8?B?OVpuZEZ2VnhISHZoWXdKRHZDZkdlanhINTlBWXhwVlpQVkxseWtDc25uZ1Nx?=
 =?utf-8?B?dHIwV2xuZk9HZGlSQ0duOGNRc2piMXNENXpGRkIrTGkwdEZiZlc2WHN5aXRS?=
 =?utf-8?B?SWRiTXVKUitrZUhlMDM1UkZ3Z3M2K1dwM1BFRVdWdmtZeVRHL2J5dzdSU1VM?=
 =?utf-8?B?NElvdFl2R1UrOEJhZzh6MnZaZXUydjBWRlpyVm1NYm93TUZhOThTV2xEaHRv?=
 =?utf-8?B?OXJrcGsvYUhZNElKaFNWbzZjY0RMeVNocUpab0dTMnVUOTZqaUtMTGxiUENZ?=
 =?utf-8?B?dVBwWUNQajVyTUR5c0pLRHV1Nms5aWM1UDdqVkprdFlET29FM3pDSXRRenY3?=
 =?utf-8?B?VEw5KzRNL1E4ZXhvRVRBOEdEejUzQThQcnY4MmxRbHI1UTdPVS9mcGxaRElY?=
 =?utf-8?B?S1hKM3pLUGRJWXRSREppY0RMRktqaHJhRm81ZXJPSnlKZDVUYU9renR3OHpV?=
 =?utf-8?B?c2FReFpvcHE1alhtVmtZeThvM3BoQTc1YXZFNlJOQkJXQ2pwY1Q5MjAzY0dK?=
 =?utf-8?B?bkN0NWd4eVY4TGVQSGd4bTJKM2NyenAxWm9rS0ZyTHJmMjNXZnlxbStZaGxO?=
 =?utf-8?B?Z2xJMnpQaVVTcVRuY3M2Wjd3eStoUmFnZlBIRlkwMkJGL3RUOThZQjcvWEI0?=
 =?utf-8?B?LzZ1WEgyQ3BVNmFjeVRWcHhSWHhHSFZaZ0RwR01UR3o4U2NUM3lSbUcxeUlQ?=
 =?utf-8?B?eERYdUxWUVI0eGUvNlVvMk9rbHRHYU92U1ZMaDVGeWdETDhJenlvMWI0MElY?=
 =?utf-8?Q?4BmCd+8WqVu/WRaBZW0ne1wPDRx2PsPe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWo3djdnM09EaDVRMXc4cWFOZmN0RFlkVFZDcVpUMXlLR3ZEdXpsZU1NS0lQ?=
 =?utf-8?B?dmlHczgvSVpoV1lDNVJuVTRIb2ZGTncyZVIvaWZvcEswWHYzZWJNMmJFaDA5?=
 =?utf-8?B?aks0QU8xMmthQXBPZG9SZDFFZnYzMzU5MVBlOHNPamRxU0d0TWRXb0huU1Ft?=
 =?utf-8?B?VVJJSyt2UGRjMkdybjlicDRJSUdsbWwyWUxBUiszYzV5Vm4xTUtsT0hudmxQ?=
 =?utf-8?B?QXptYjY5MWhLV28wK29vclM5UHJ4Y2hJM1FTNUEybjFLMjd5Y0hRRFVWamJW?=
 =?utf-8?B?d1QxWSt6SW92eEpKS2VpcXprZDUzanBDSmNIVzAwQ1k2WUduSzhaN3lyOEJl?=
 =?utf-8?B?OUViVzE3WnlSYy9La0UvNFhBNFlPNGhFTnl6THFCNjRsbnVUeVdmN0k0c1Ey?=
 =?utf-8?B?dVlkZjgvakpJd1ZoWHF2cy96S21DNTlIcEZJRHJvK2Vnczk1NlU5K253c0F5?=
 =?utf-8?B?MDMwWlpTNFJTcG5rUUhBcTJ0ZFlRYWJDSjhKQ1hiNGNVcW9DTUo0bHVEYXJ4?=
 =?utf-8?B?UTZwZlpBc25BbjYzT2M5SmhRUGNmM250Snl5UTFCNU42akhqWlZMbHRUNjYw?=
 =?utf-8?B?Q2N5VFdlNTNhMUxDcVg0WE9hL2ZiNkp3ZzR6TStOWGw5UDNtT2VwdUthbStu?=
 =?utf-8?B?MUZUaE9kcVA3dy91ZVVxNGNQSWd1eldIVjUrZnZnbENvMjRpZDBKQTJPMjc5?=
 =?utf-8?B?bGNOb0huWExhZW9OL2M0WUNhb0JqbHF2dVREeXFpVTVKUityT0FYc1Qwa1p4?=
 =?utf-8?B?eEhEZjJHTzk3cEthWnZnQzU4dlREelhrRmRyUUZRRnVpUlVTcFZEdy9aVzdE?=
 =?utf-8?B?RGhXbklSZUVUazlYRStxZm5jdm1CUTdEcnkzVHdMNThjZjhzOXI0cmhtcE9C?=
 =?utf-8?B?UjI4Qm9CNEFlY1Z0WlIrODZCWE9PWTI1bUZGanhCb010c3JEYXpORVBwRlZj?=
 =?utf-8?B?QnBDUkpNR0I0QmZ6V2tJazdpUWk5VVUwempUQ2hlNHhxZ1Fra3F0U1FkZnRK?=
 =?utf-8?B?cVVKeTJGMWl6dHMzU0Fmb3lTVDNnSExBTWNucXozWGc4T1J2VHd5ZzRGSFN6?=
 =?utf-8?B?SE1RcnVrTmZkR2xYOGhTQUpsZE1jMmdoc21hOXFmbThnMFNWdTdEdjJva1ZD?=
 =?utf-8?B?dENnUG1YaVRsb2lxTDAvcC8wRnhEM05OcXFBM05IRWNRTnByNGxmSWRJOURj?=
 =?utf-8?B?TENUanhaZE94R0tFT3RhSXFkYjFQcFMwNnBPNkpxdTZhblhxOVFOWDVaZ3Vm?=
 =?utf-8?B?eCtJR3FWNVFZUTh4Zk5ydVl6cU9PRVNSb3cvNUJjblRCb3B3SGxnSW1DUEcv?=
 =?utf-8?B?QXZOdTV2U0orWXpoc3lSUkJkY1hGMlQ4MDZJWXBGUGJUNUs2UXB3LzRmWFow?=
 =?utf-8?B?bXFBVVZzcVVnSGZySFJxUitMa2hzNUlBRVNjbjBmdGNFNlZhbG14WllWRVdP?=
 =?utf-8?B?MTZ5b0hqUm1ZRWdsYjBTZ1Y0TStCQjIvNEpYcDBRUjhyZU9ueHhjZnRHWnF1?=
 =?utf-8?B?MFE2Yi9HclU4ZEN1MUE4ZVVlOVlXQWZraW1ZbDEvRGZiWnVHa2k3KzMyZGdS?=
 =?utf-8?B?ZkRhK3FmemFnRVNNSS80WW5wWjB6Q2pxVCtmdUNjZTJid3NYZjUrdERuMVR2?=
 =?utf-8?B?cUtoQTEvb0hyLzZPUjJJVUZpZGJDdXNablFFWVdmWVpGZWxwalNHc2VrN3pP?=
 =?utf-8?B?TWxDZHpwN2MvVmtlL0g5U0RrM2xNN3M0NXI3SkdwbFZvYWJPZ2tTbnZUN1pE?=
 =?utf-8?B?emVpc1p1eUhmYS9ZaVRoL2RYeWVvQWVkb3dEODVVZmR1RUJYSmxYZ3ltYXJ2?=
 =?utf-8?B?Zk9UTjBRYTkyVGt1SW5Ccm8vekpFTitrbEkvUStnV1lHRWU4OHFTVXBNTDhS?=
 =?utf-8?B?bFdnZmNFZzFUdjMyUGNGRU9YQUxLWS9JbTY4Z25DN3BHYUdqY2FuYlNvbHdv?=
 =?utf-8?B?STlKSTk3TzcrZnNBVFNBcU1FQ0d1SllzdUJYbUhZbWhmTDF6dVdpVWhKa01n?=
 =?utf-8?B?dTRoZjFZZ01FYVFNYWE1ZzJiQzBLbUE4YitUbW96ZEtnYmlKS1BNOS9OUzRJ?=
 =?utf-8?B?alVLenVUVUtoem5NMjB1c3BQYW9uMlJIbWwwaTVUbmR2QWVXSWhxOW1YbHZ0?=
 =?utf-8?B?ODBTdWFhVXRYWVJRN2tJbmZUbWtEL3JtTTIrR1NRd1QyemVZc0FTZDgvREF3?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0a3422-aae3-49d3-bee8-08de155c95e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:27:33.8684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: junSteOedzeC+exb9V3NOKKUHdmrHi1nVj/5+sVSHNpvvpS7GrkAufRA9XaWr0gjfOgmI9J/s8PZFhuftYOgb5NOirM7CMyOPU9KhlsoXos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
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

On Thu, Oct 23, 2025 at 12:34:50AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> > Add debugfs handlers for migration state and handle bitstream
> > .read()/.write() to convert from bitstream to/from migration data
> > packets.
> > As descriptor/trailer are handled at this layer - add handling for both
> > save and restore side.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 336 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_migration_data.h  |   5 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  35 ++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  54 +++
> >  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
> >  6 files changed, 444 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > index b04f9be3b7fed..4cd6c6fc9ba18 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > @@ -6,6 +6,44 @@
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_sriov_migration_data.h"
> > +#include "xe_sriov_pf_helpers.h"
> > +#include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_printk.h"
> > +
> > +static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> 
> other helpers have sep line here 

Ok.

> 
> > +	return &xe->sriov.pf.vfs[vfid].migration.lock;
> > +}
> > +
> > +static struct xe_sriov_migration_data **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration.pending;
> > +}
> > +
> > +static struct xe_sriov_migration_data **
> > +pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
> > +}
> > +
> > +static struct xe_sriov_migration_data **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration.trailer;
> > +}
> >  
> >  static bool data_needs_bo(struct xe_sriov_migration_data *data)
> >  {
> > @@ -43,6 +81,9 @@ xe_sriov_migration_data_alloc(struct xe_device *xe)
> >   */
> >  void xe_sriov_migration_data_free(struct xe_sriov_migration_data *data)
> >  {
> > +	if (IS_ERR_OR_NULL(data))
> > +		return;
> > +
> >  	if (data_needs_bo(data))
> >  		xe_bo_unpin_map_no_vm(data->bo);
> >  	else
> > @@ -125,3 +166,298 @@ int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *data)
> >  
> >  	return mig_data_init(data);
> >  }
> > +
> > +static ssize_t vf_mig_data_hdr_read(struct xe_sriov_migration_data *data,
> > +				    char __user *buf, size_t len)
> > +{
> > +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> > +
> > +	if (!data->hdr_remaining)
> > +		return -EINVAL;
> > +
> > +	if (len > data->hdr_remaining)
> > +		len = data->hdr_remaining;
> > +
> > +	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
> > +		return -EFAULT;
> > +
> > +	data->hdr_remaining -= len;
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t vf_mig_data_read(struct xe_sriov_migration_data *data,
> > +				char __user *buf, size_t len)
> > +{
> > +	if (len > data->remaining)
> > +		len = data->remaining;
> > +
> > +	if (copy_to_user(buf, data->vaddr + (data->size - data->remaining), len))
> > +		return -EFAULT;
> > +
> > +	data->remaining -= len;
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t __vf_mig_data_read_single(struct xe_sriov_migration_data **data,
> > +					 unsigned int vfid, char __user *buf, size_t len)
> > +{
> > +	ssize_t copied = 0;
> > +
> > +	if ((*data)->hdr_remaining)
> > +		copied = vf_mig_data_hdr_read(*data, buf, len);
> > +	else
> > +		copied = vf_mig_data_read(*data, buf, len);
> > +
> > +	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
> > +		xe_sriov_migration_data_free(*data);
> > +		*data = NULL;
> > +	}
> > +
> > +	return copied;
> > +}
> > +
> > +static struct xe_sriov_migration_data **vf_mig_pick_data(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data **data;
> > +
> > +	data = pf_pick_descriptor(xe, vfid);
> > +	if (*data)
> > +		return data;
> > +
> > +	data = pf_pick_pending(xe, vfid);
> > +	if (!*data)
> > +		*data = xe_sriov_pf_migration_save_consume(xe, vfid);
> > +	if (*data)
> > +		return data;
> > +
> > +	data = pf_pick_trailer(xe, vfid);
> > +	if (*data)
> > +		return data;
> > +
> > +	return ERR_PTR(-ENODATA);
> > +}
> > +
> > +static ssize_t vf_mig_data_read_single(struct xe_device *xe, unsigned int vfid,
> > +				       char __user *buf, size_t len)
> > +{
> > +	struct xe_sriov_migration_data **data = vf_mig_pick_data(xe, vfid);
> > +
> > +	if (IS_ERR_OR_NULL(data))
> 
> vf_mig_pick_data() seems to never return NULL, so maybe just IS_ERR() ?

Ok.

> 
> > +		return PTR_ERR(data);
> > +
> > +	return __vf_mig_data_read_single(data, vfid, buf, len);
> > +}
> > +
> > +/**
> > + * xe_sriov_migration_data_read() - Read migration data from the device.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + * @buf: start address of userspace buffer
> > + * @len: requested read size from userspace
> > + *
> > + * Return: number of bytes that has been successfully read,
> > + *	   0 if no more migration data is available,
> > + *	   -errno on failure.
> > + */
> > +ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
> > +				     char __user *buf, size_t len)
> > +{
> > +	ssize_t ret, consumed = 0;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> > +		while (consumed < len) {
> > +			ret = vf_mig_data_read_single(xe, vfid, buf, len - consumed);
> > +			if (ret == -ENODATA)
> > +				break;
> > +			if (ret < 0)
> > +				return ret;
> > +
> > +			consumed += ret;
> > +			buf += ret;
> > +		}
> > +	}
> > +
> > +	return consumed;
> > +}
> > +
> > +static ssize_t vf_mig_hdr_write(struct xe_sriov_migration_data *data,
> > +				const char __user *buf, size_t len)
> > +{
> > +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> > +	int ret;
> > +
> > +	if (len > data->hdr_remaining)
> > +		len = data->hdr_remaining;
> > +
> > +	if (copy_from_user((void *)&data->hdr + offset, buf, len))
> > +		return -EFAULT;
> > +
> > +	data->hdr_remaining -= len;
> > +
> > +	if (!data->hdr_remaining) {
> > +		ret = xe_sriov_migration_data_init_from_hdr(data);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t vf_mig_data_write(struct xe_sriov_migration_data *data,
> > +				 const char __user *buf, size_t len)
> > +{
> > +	if (len > data->remaining)
> > +		len = data->remaining;
> > +
> > +	if (copy_from_user(data->vaddr + (data->size - data->remaining), buf, len))
> > +		return -EFAULT;
> > +
> > +	data->remaining -= len;
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t vf_mig_data_write_single(struct xe_device *xe, unsigned int vfid,
> > +					const char __user *buf, size_t len)
> > +{
> > +	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> > +	int ret;
> > +	ssize_t copied;
> > +
> > +	if (IS_ERR_OR_NULL(*data)) {
> > +		*data = xe_sriov_migration_data_alloc(xe);
> > +		if (!*data)
> > +			return -ENOMEM;
> > +	}
> > +
> > +	if ((*data)->hdr_remaining)
> > +		copied = vf_mig_hdr_write(*data, buf, len);
> > +	else
> > +		copied = vf_mig_data_write(*data, buf, len);
> > +
> > +	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
> > +		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
> > +		if (ret) {
> > +			xe_sriov_migration_data_free(*data);
> > +			return ret;
> > +		}
> > +
> > +		*data = NULL;
> > +	}
> > +
> > +	return copied;
> > +}
> > +
> > +/**
> > + * xe_sriov_migration_data_write() - Write migration data to the device.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + * @buf: start address of userspace buffer
> > + * @len: requested write size from userspace
> > + *
> > + * Return: number of bytes that has been successfully written,
> > + *	   -errno on failure.
> > + */
> > +ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
> > +				      const char __user *buf, size_t len)
> > +{
> > +	ssize_t ret, produced = 0;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> > +		while (produced < len) {
> > +			ret = vf_mig_data_write_single(xe, vfid, buf, len - produced);
> > +			if (ret < 0)
> > +				return ret;
> > +
> > +			produced += ret;
> > +			buf += ret;
> > +		}
> > +	}
> > +
> > +	return produced;
> > +}
> > +
> > +#define MIGRATION_DESCRIPTOR_DWORDS 0
> > +static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data **desc = pf_pick_descriptor(xe, vfid);
> > +	struct xe_sriov_migration_data *data;
> > +	int ret;
> > +
> > +	data = xe_sriov_migration_data_alloc(xe);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR,
> > +					   0, MIGRATION_DESCRIPTOR_DWORDS * sizeof(u32));
> > +	if (ret) {
> > +		xe_sriov_migration_data_free(data);
> > +		return ret;
> > +	}
> > +
> > +	*desc = data;
> > +
> > +	return 0;
> > +}
> > +
> > +static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> > +
> > +	*data = NULL;
> > +}
> > +
> > +#define MIGRATION_TRAILER_SIZE 0
> > +static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data **trailer = pf_pick_trailer(xe, vfid);
> > +	struct xe_sriov_migration_data *data;
> > +	int ret;
> > +
> > +	data = xe_sriov_migration_data_alloc(xe);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
> > +					   0, MIGRATION_TRAILER_SIZE);
> > +	if (ret) {
> > +		xe_sriov_migration_data_free(data);
> > +		return ret;
> > +	}
> > +
> > +	*trailer = data;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_sriov_migration_data_save_init() - Initialize the pending save migration data.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * Return: 0 on success, -errno on failure.
> > + */
> > +int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	int ret;
> > +
> > +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> > +		ret = pf_descriptor_init(xe, vfid);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = pf_trailer_init(xe, vfid);
> > +		if (ret)
> > +			return ret;
> > +
> > +		pf_pending_init(xe, vfid);
> > +	}
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > index ef65dccddc035..5cde6e9439677 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > @@ -27,5 +27,10 @@ void xe_sriov_migration_data_free(struct xe_sriov_migration_data *snapshot);
> >  int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
> >  				 enum xe_sriov_migration_data_type, loff_t offset, size_t size);
> >  int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *snapshot);
> > +ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
> > +				     char __user *buf, size_t len);
> > +ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
> > +				      const char __user *buf, size_t len);
> > +int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > index 8d8a01faf5291..c2768848daba1 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_device.h"
> >  #include "xe_gt_sriov_pf_control.h"
> > +#include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_printk.h"
> >  
> > @@ -165,6 +166,10 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
> >  	unsigned int id;
> >  	int ret;
> >  
> > +	ret = xe_sriov_migration_data_save_init(xe, vfid);
> > +	if (ret)
> > +		return ret;
> > +
> >  	for_each_gt(gt, xe, id) {
> >  		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
> >  		if (ret)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > index e0e6340c49106..a9a28aec22421 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > @@ -9,6 +9,7 @@
> >  #include "xe_device.h"
> >  #include "xe_device_types.h"
> >  #include "xe_pm.h"
> > +#include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf.h"
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_pf_debugfs.h"
> > @@ -132,6 +133,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
> >   *      /sys/kernel/debug/dri/BDF/
> >   *      ├── sriov
> >   *      │   ├── vf1
> > + *      │   │   ├── migration_data
> >   *      │   │   ├── pause
> >   *      │   │   ├── reset
> >   *      │   │   ├── resume
> > @@ -220,6 +222,38 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
> >  DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
> >  DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
> >  
> > +static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> > +{
> > +	struct dentry *dent = file_dentry(file)->d_parent;
> > +	struct xe_device *xe = extract_xe(dent);
> > +	unsigned int vfid = extract_vfid(dent);
> > +
> > +	if (*pos)
> > +		return -ESPIPE;
> > +
> > +	return xe_sriov_migration_data_write(xe, vfid, buf, count);
> > +}
> > +
> > +static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> > +{
> > +	struct dentry *dent = file_dentry(file)->d_parent;
> > +	struct xe_device *xe = extract_xe(dent);
> > +	unsigned int vfid = extract_vfid(dent);
> > +
> > +	if (*ppos)
> > +		return -ESPIPE;
> > +
> > +	return xe_sriov_migration_data_read(xe, vfid, buf, count);
> > +}
> > +
> > +static const struct file_operations data_vf_fops = {
> > +	.owner		= THIS_MODULE,
> > +	.open		= simple_open,
> > +	.write		= data_write,
> > +	.read		= data_read,
> > +	.llseek		= default_llseek,
> > +};
> > +
> >  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> >  {
> >  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> > @@ -228,6 +262,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> >  	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
> >  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
> >  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
> > +	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
> >  }
> >  
> >  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index eaf581317bdef..029e14f1ffa74 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -10,6 +10,7 @@
> >  #include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_pm.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_printk.h"
> > @@ -53,6 +54,15 @@ static bool pf_check_migration_support(struct xe_device *xe)
> >  	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> >  }
> >  
> > +static void pf_migration_cleanup(struct drm_device *dev, void *arg)
> > +{
> > +	struct xe_sriov_pf_migration *migration = arg;
> > +
> > +	xe_sriov_migration_data_free(migration->pending);
> > +	xe_sriov_migration_data_free(migration->trailer);
> > +	xe_sriov_migration_data_free(migration->descriptor);
> > +}
> > +
> >  /**
> >   * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
> >   * @xe: the &xe_device
> > @@ -62,6 +72,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
> >  int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  {
> >  	unsigned int n, totalvfs;
> > +	int err;
> >  
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> > @@ -73,7 +84,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  	for (n = 1; n <= totalvfs; n++) {
> >  		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
> >  
> > +		err = drmm_mutex_init(&xe->drm, &migration->lock);
> > +		if (err)
> > +			return err;
> > +
> >  		init_waitqueue_head(&migration->wq);
> > +
> > +		err = drmm_add_action_or_reset(&xe->drm, pf_migration_cleanup, migration);
> 
> shouldn't we use devm instead here ?

I'll switch it to devm.

> 
> > +		if (err)
> > +			return err;
> >  	}
> >  
> >  	return 0;
> > @@ -154,6 +173,36 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
> >  	return data;
> >  }
> >  
> > +static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
> > +				struct xe_sriov_migration_data *data)
> > +{
> > +	if (data->tile != 0 || data->gt != 0)
> > +		return -EINVAL;
> > +
> > +	xe_sriov_migration_data_free(data);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
> > +			     struct xe_sriov_migration_data *data)
> > +{
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +
> > +	if (data->tile != 0 || data->gt != 0)
> > +		return -EINVAL;
> > +	if (data->offset != 0 || data->size != 0 || data->buff || data->bo)
> > +		return -EINVAL;
> > +
> > +	xe_sriov_migration_data_free(data);
> > +
> > +	for_each_gt(gt, xe, gt_id)
> > +		xe_gt_sriov_pf_control_restore_data_done(gt, vfid);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
> >   * @xe: the &xe_device
> > @@ -173,6 +222,11 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
> >  
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> > +	if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR)
> > +		return pf_handle_descriptor(xe, vfid, data);
> > +	else if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER)
> 
> no need for "else" here

Ok.

Thanks,
-Michał

> 
> > +		return pf_handle_trailer(xe, vfid, data);
> > +
> >  	gt = xe_device_get_gt(xe, data->gt);
> >  	if (!gt || data->tile != gt->tile->id) {
> >  		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > index 2a45ee4e3ece8..8468e5eeb6d66 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > @@ -7,6 +7,7 @@
> >  #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
> >  
> >  #include <linux/types.h>
> > +#include <linux/mutex_types.h>
> >  #include <linux/wait.h>
> >  
> >  /**
> > @@ -53,6 +54,14 @@ struct xe_sriov_migration_data {
> >  struct xe_sriov_pf_migration {
> >  	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> >  	wait_queue_head_t wq;
> > +	/** @lock: Mutex protecting the migration data */
> > +	struct mutex lock;
> > +	/** @pending: currently processed data packet of VF resource */
> > +	struct xe_sriov_migration_data *pending;
> > +	/** @trailer: data packet used to indicate the end of stream */
> > +	struct xe_sriov_migration_data *trailer;
> > +	/** @descriptor: data packet containing the metadata describing the device */
> > +	struct xe_sriov_migration_data *descriptor;
> >  };
> >  
> >  #endif
> 
