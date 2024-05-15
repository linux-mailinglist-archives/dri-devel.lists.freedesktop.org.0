Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19418C62E6
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 10:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEBC10E198;
	Wed, 15 May 2024 08:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEdOQIqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3323C10E0C1;
 Wed, 15 May 2024 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715761799; x=1747297799;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Lj8pqpACdvKoAmRrEVie2d9KVDRoCPraXWD3GW3Et6Q=;
 b=XEdOQIqPsLxy6cQVoCkAwjCZI0M3lsv7BaSdt/L1LaKTWVNB+r6ovoLY
 vgEPbCcMdVbJ/ARAVbjdIFo8TSkJ653KxYmjDf6IeCuJhliNDdf1Xq8n6
 vki70YYW6Q1FabjyIdMvc1vYiEbqmrgfdcJIRi769nAympDYbu4ojiujQ
 ss3QZtK0aZ1EyKG8Awa+M/fueOPB02+BZ1BarsI8fUts1M/p7482qZlJC
 p8YkVD0sFIhJuRGybFNGWiUoNPHzXb6KlBLvr671gD95/L3dcW2tyl2vj
 e0sOnKgxzx/7hPcGvQ8DRDnrRJLZ0CEAVEaMBHVvuZqe3uVfk+QAd+T7W g==;
X-CSE-ConnectionGUID: tpPP3p0YRSWsLMt4wf2TEg==
X-CSE-MsgGUID: nmg912CFSf+N/vyxvxgkDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11665778"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11665778"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:29:58 -0700
X-CSE-ConnectionGUID: lFe6shHrSlCvtqc7o7gz4g==
X-CSE-MsgGUID: 15zvSmEhRH+4knRtAlCUsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="61805151"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 01:29:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 01:29:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 01:29:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 01:29:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 01:29:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjnL1h8BweGYK2ERsa+j1clI7oX7OKle5pXWS2tpBbZTvgkH2HbiXgl7pyaDlLpR5TQFFSB/QjoUCYIWmwvo0zgnbu3/mnddSoEN3PyWg2LwKGZjiRXIlZIjGVeCdOFxpw8xBD6ni/OTrDPILSzckTdQYwNU8pjpK+7cS7jNiZzqGvJIzW9cHeE9axsZvtinsreJiinoEonpqB8bPH7N/K8lTh93irxicxVganpXSdbfYE8a2k1iHti/RZKl21vzNofxUrmoI4v4GrXC/NNfrXJNqA7ZcDTeG1XfhY1iJsYsYQv7WHhmXnPzxNW4IcLqjRyV1ESGm2fmHl4MFUZ9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lj8pqpACdvKoAmRrEVie2d9KVDRoCPraXWD3GW3Et6Q=;
 b=V/tFaWeEYjwrOesn8jtcySylRCqT65F2h8V+ENQf/sgVJyKq7ihz7SxbQoeYhMw9v8w9yxFRoT4JH2ilD6gz4I09IjsBmOIBmndgZ5I7DUI2jFqlCQMAVA+jAEukvwF01w8Ryeqyw64nIwjXcE512UeoHIfm6V7hBPDU7paojaFTKpNTzaTwMDaTzafh8pe2AcKIBvtWtwSc4wlv/pU8/9XYY2+2oPPcMlpk7VhmvJjC4VHSAaQjORXkeWgzMZPojxNGk5uv+Nsr7hsr4+qCONm+nDt6SdNk5Ax448IXY9wNYLyCRewPoy21nlBWDcDTdc4uyxqjgeqwp/4nP7dEvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.55; Wed, 15 May 2024 08:29:55 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 08:29:55 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Manna, Animesh" <animesh.manna@intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH v10 00/12] Panel replay selective update support
Thread-Topic: [PATCH v10 00/12] Panel replay selective update support
Thread-Index: AQHaor3eudABoY2CRUCFmIUYRiupt7GX/qKA
Date: Wed, 15 May 2024 08:29:54 +0000
Message-ID: <1e97cd6a6b1f695c0609d1ac2b7a0ee38acb41f7.camel@intel.com>
References: <20240510093823.3146455-1-jouni.hogander@intel.com>
In-Reply-To: <20240510093823.3146455-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB4855:EE_
x-ms-office365-filtering-correlation-id: 60ad75dc-3448-42b9-5811-08dc74b932d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Y0crUys5RGptZy81VFBvTWJ4LzJrd3ViZXh5VUpkVGFwRTBrQ2JvcXFEbTYx?=
 =?utf-8?B?YVY3Tjg4TjlFSTlkZWwrREdOSFRYTTV2U2luQThndUlyYWVSbXJwUEx1K0sz?=
 =?utf-8?B?a2RZbTArbk50aUFVc0JlNjFPVUlsTk40V1BiMkFaWitvNFd0SE5lN2tFTDBy?=
 =?utf-8?B?NmJ2OS9ST1V5aTZqMGpoQ2FkRW5iNWIvUHM1Z0pnTkRmY1grdmdVNENpL21j?=
 =?utf-8?B?TEFSVGkvMHkxRmdtL2FxY1lFQy96SWJFRTZVU3pjcmt1bHY0NDBqODNDSGN2?=
 =?utf-8?B?TnhSQnZvUkpmSXpCSHVmTEw3UU9WTlhaN2o3U0F2eElJeDlKR05WVVBLTjNu?=
 =?utf-8?B?d3ViUE5COUFNRGZKWFJiS2tRamY0b2RvNDJvR2VaVWw2STVuZ3BDZlhIQXJ2?=
 =?utf-8?B?VGFMWTlsWEhXMHl1VVdhTTcycmFRZDY3dGFPamdkWjlHaVVyTThyRjYrV3Zl?=
 =?utf-8?B?MHRIZVE5WDZ1UkhUZmVPK1VVdjVKSTZMRlVMdFNFeUxBSmdMWU1LME80dVN0?=
 =?utf-8?B?Tmp0Z3NoNVM2bXRJaXBPVEtyaEF3MzdZOTNsKzkwZitXa3QvdlB2RTlReG1J?=
 =?utf-8?B?Q3BmK1FQTkQ1d1h3MHRIeFJEWnJHVXE3UFl6VGR4ZWxVY2hUN2dkNHNqRlUx?=
 =?utf-8?B?UldWeGF0aHpKZ3pNTVdOR3RTZnM3VE1FUUFJN0RMQysyRVBPSTdCMWkzeFRx?=
 =?utf-8?B?T1hmd0wxSU8wTEdSWStFQzhKUEs4VzRsa2VhYnNIMUE0ai9TS1cyRVNGZUtt?=
 =?utf-8?B?WStqRkZRM0V0YjViUUJoa05NUWFleFhVajVYcHhQdU5tVzJLK0lublVJU2E0?=
 =?utf-8?B?ZW12RkNJejFBNEV5Ym1RT1ViTDRLR0JiZEJnQlk3TGxtQWtwWjBJdjEvN0lm?=
 =?utf-8?B?N3NJZHRMNmlUVjFTd0s3ams0MG5qZmV6MDlGY0JmeWR5bkVvZDJqV2YxaENN?=
 =?utf-8?B?VW1UMGRoeERYTTQ0dDdqTUp1dzdYcmJoQ0hzdGg0QUl6TWVoWitiWkhkdVRm?=
 =?utf-8?B?ektyTHNCTEZCRTQ0RE5HK3RlbGlUaUFlVHZxNHQ1WUpGZUZVVG83dmtOaG1N?=
 =?utf-8?B?NjVmajBrTGM3aTlWcjdlVWZnaHNsd0drYzc1Wi9ZNmpFdXhlRWwzbDZFREho?=
 =?utf-8?B?akRaTkk5LzlDZ3FFRFM2SGRsYnVDazR6VU0xNmprOWRTbUQvT0lkYmpSMnVL?=
 =?utf-8?B?Yi9zTUJQcXpzRkJ1MUJTK2Z5TzFRNXZwNFQ5STh2TmwzT3BJejcxOGdyMVI1?=
 =?utf-8?B?QzhEMGtZT1NaMnU1SUU2eTQyM2lmbnQ0d3hxRU9NMzBLU0RMSGh0N1BUY0NL?=
 =?utf-8?B?TmJTRGl5MW9kMmQzblRLWEVJRGZ6amdNOWk0SGJEejZndFZQcnYzdlJhakt0?=
 =?utf-8?B?UTFzNFFZV2dPU0J1SkFoM3p6TWhBL01palpReG9sM3Q5cm5BVUNSQzZFbko4?=
 =?utf-8?B?eTdtUDU2eWZ0U1NBTlZUVGRYR3daMldFeHpURDBXVlRGQ3JiMTdUYUhRNGp6?=
 =?utf-8?B?RVNiellMMXBiOTJLZXB1eW0wMHYvWWxGWGxHV0NQaUxsU25xSjNkZEhnTVZ0?=
 =?utf-8?B?VXFDWmRjNmVvOGF2cDViZjN1eXBzSXBBYlNEcnhNbDl6dGg1YnA2TDcwWHcr?=
 =?utf-8?B?ME1VVFVXNDNzUTg5WjltUWdxYXNDLzlzbmgvY2RWaUFmTTU3enZoRWNqVjlV?=
 =?utf-8?B?Y3NEYUhJVWUwYWtrbjh1OXVMZzkxNkV4Y2kyRGJsekMxbXBkTllVT2NxblF1?=
 =?utf-8?B?QUZzeXRSVXA4dExKRzBEM1JsYUdVNlFuMjZDNlVDa3dTbVRVWXhHL0lhZUly?=
 =?utf-8?B?TmFKdXJ6VVVoWjgyYzM1Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEdiZytWNExyMHJoTTdIUjFCQ09JQTlaaC9DQzFpOSt6VGhEbTFkZ1h3alVm?=
 =?utf-8?B?akl5aUkwNmtJNGFSWStTRjQ0WmNBT3Y1R3VrVnZBR0R2dVJ6MG5VWWpGMHcv?=
 =?utf-8?B?aEdZMk45Z2w4MWpKL2ZMNm1hc2VCTDBFMEp4QUZ2T0RsYjlISDNERmxvVkFE?=
 =?utf-8?B?QS9DMXQya3JzNWdwVEZJWkVuRDVOK1BZeFU4MWhtc29nekJERUR4Q1B3Vm4v?=
 =?utf-8?B?VVo2bWdtR01uKzJucS9qVTZ4TGJXQi9zVkRjb3QvZWZUQjc2eWFqU0pZSG1K?=
 =?utf-8?B?Ukprd3VCSUFDMUpyajFYSWVSbkwvVTFZczdMNjlCaHBVaGtuRXJlQXRLb0dy?=
 =?utf-8?B?VFhxa1BSWUFVTUNQMm02WVE2QmRLbmxSY0g5cFc1MkdZUFpjUVB2RnZHeFh6?=
 =?utf-8?B?VjRnZHZlOUd6VklOaE1xM2RvV2hnYlpuTHladnZ6S21pb3JYb3JRam1hNE0v?=
 =?utf-8?B?VmtKejVqdE4xTjBrbjFCditvWlFldWhTUmlYZ3Y0R0tkS2J1ZlhPd2FrV09W?=
 =?utf-8?B?VlV6KzRnZHlGbG1PMUF0OStnVnNxdXNQN0M2Y2g2MlpieU1OSUJpT2xzWW5I?=
 =?utf-8?B?RVg3UmpyNExUR0UwWldmQVZrRFRsNjVVdjk1QlZIMDdiY081QzYrWSt3VDBq?=
 =?utf-8?B?YXpmeTlwK0JEY0hzdkFxb3UzQzh0R1E3amp1eVBHMTdOeW9yaGRWcy9UaTdp?=
 =?utf-8?B?L0NkMk51MWt6bmlVU0w1aE1jeW9QWGVaOWtuTHFDcDFVVExWbmZXQ1JBdTAr?=
 =?utf-8?B?b3pOd3pQMm1LcWtEUloxQWo3RExRbU1ZTlE1N1Z2UGVlb1lrbHZzUzM4UGxD?=
 =?utf-8?B?Z2pnWGdHRTdGMnMyUVNyVXZXOFRpcENCdjZWQVp2WDlYRjFlYTRvZEQ1b2M5?=
 =?utf-8?B?U2Iwd3h5Z21LWG9xdFdra3lFSlVjbnYvNzg3TnJtaVJVK25Tbkd0VjVhUE0w?=
 =?utf-8?B?TXphaDJRQVVSQWV4ODB6blpPN080OGdrbGk4RUdWVlR0WG9XUFFSdXZJMXVn?=
 =?utf-8?B?Ung5c2Mzc0VuYSs4aVdLWjhZV0o3aFcxcHpSWkFuR1g4ZDB5NWZTM0hUNzFH?=
 =?utf-8?B?UzJIMW5mUlFRYnN4QUxXUjJ5d0hZUHFpQU51V253alJyRnhSZkhscStiN1Ix?=
 =?utf-8?B?Y1BRanBTZUJnWVNhZnk3bmw5NGVZV1RBcDVYMnF2TFp0QjJuNGhHR2ZSVUlr?=
 =?utf-8?B?djdDK0lGYnE3ZUtUV215SU40YldJNUNJN05nTU8zWCtXREM1SklWT2pQbUJS?=
 =?utf-8?B?dCtzd2orUHN2cCtlN1pFOWUycVVQMXBsV1AxWFB0Y1ZmSENaTXZFRU5VZHZO?=
 =?utf-8?B?NWkxeEJ0akxTTHZlR1BDNjlHVGt3WGM2bmU1YTFIL3hrUVdzZWVzUGxxVmhv?=
 =?utf-8?B?RUdVQkxsUmtncEVpYjJPQ3I5YXBBSnlxL0htQ3B3RnA4RHZkRnlUdjdabk1v?=
 =?utf-8?B?MWdpQ1E5WFFGVEZoclcyL0JRdjBMdXNVV1E1K3VIcjJ6QUUyRnNaWWlBb3F5?=
 =?utf-8?B?Zy9HS013VUxvOGhPckYzbVhjUnBZaEJ2U2JDQ1hDZVlIYnplTWh2RHRNYVJS?=
 =?utf-8?B?T1B5RHRtcnNEamVvWGJldlRBS3hhU0pOWGFCZlNPU25IbytKT1VncTViUTVx?=
 =?utf-8?B?a2VMaVVrY2oxenNQbnF3WWZhRThLSE1ZUEtOZUpnQ2dzYnBhT1M5ZzUzZHpO?=
 =?utf-8?B?Wm9EWWxxc1pDNGFzYTBBZ1BmWVIwTGpHQnl5djIzQ3FmdE50S1VIQjZOQ3k0?=
 =?utf-8?B?YXpVRjRsbnJGQ3VsaCtjaEEwMngwVzJIdDBVMG5iVTlWdFl3bjA0b3I2OTBI?=
 =?utf-8?B?Y2Jmb3AxYkJLOERILy85Zlcwc05aMzBKczdkRVhxd0hIcWZuR2FyRFdhT250?=
 =?utf-8?B?enBkNkJGZUN0aFBTVVZEbG1rdHlMS3JPd0Q0V01mM1BRSWV5enVBaGxhSVVZ?=
 =?utf-8?B?NGdOS0lEN1p3Y0FMM3VSZ3dTaXVzemFZUE1mMTVRVWNCTDVhU2ZPQmJNbDBL?=
 =?utf-8?B?clF0K1E0cmN4NHZYWmNabDhYWTAvOHFPV3d0K3VQRDM4ME5lclNtZ090NzFF?=
 =?utf-8?B?cnN4MTFkM3VqemhZWFNYWjkyYlNWS1RqU05xQ0tvYzQzVXd4a1BreC8zU0tQ?=
 =?utf-8?B?SGRCdjRUMFFFNmVJc0lCZnJaS2dsODJJZlhuYVo2YnljZ3ViaEREMkhsSnNa?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFDEEBF79DE6C24DAB37E0F1E37E63BA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ad75dc-3448-42b9-5811-08dc74b932d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 08:29:55.0005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5Y9VuPBbsFwpkvT7BaHb/2eey/Nf7okxgesYOvPIVnPMys8r2AFw/PFsS8sxS1q6iSHOUxdeKD7Qpb77ZO7Xin2hzUGA9qd46nCRw329lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
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

T24gRnJpLCAyMDI0LTA1LTEwIGF0IDEyOjM4ICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IFRoaXMgcGF0Y2ggc2V0IGlzIGltcGxlbWVudGluZyBwYW5lbCByZXBsYXkgc2VsZWN0aXZl
IHVwZGF0ZSBzdXBwb3J0DQo+IGZvciBJbnRlbCBoYXJkd2FyZS4NCg0KVGhlc2UgYXJlIG5vdyBt
ZXJnZWQgaW50byBkcm0taW50ZWwtbmV4dCBpbmNsdWRpbmcgImRybS9wYW5lbHJlcGxheToNCmRw
Y2QgcmVnaXN0ZXIgZGVmaW5pdGlvbiBmb3IgcGFuZWxyZXBsYXkgU1UiLg0KDQpUaGFuayB5b3Ug
QW5pbWVzaCBhbmQgTWFhcnRlbiBmb3IgcmV2aWV3IGFuZCBhY2suDQoNCkJSLA0KDQpKb3VuaSBI
w7ZnYW5kZXINCg0KPiANCj4gdjEwOg0KPiDCoCAtIHVzZSBhbHdheXMgUFNSMl9TVEFUVVMgZm9y
IGVEUCBQYW5lbCBSZXBsYXkNCj4gwqAgLSBoYW5kbGUgU1JEX1NUQVRVUyB2cy4gUFNSMl9TVEFU
VVMgaW4gaW50ZWxfcHNyX3dhaXRfZXhpdF9sb2NrZWQNCj4gYXMgd2VsbA0KPiB2OToNCj4gwqAg
LSBkbyBub3QgYWRkIGhhc19wc3IgY2hlY2sgaW50byBwc3IyIGNhc2UgaW4NCj4gaW50ZWxfZHBf
Y29tcHV0ZV92c2Nfc2RwDQo+IMKgIC0gdXNlIGRybV9kcF9kcGNkX3JlYWRiIGluc3RlYWQgb2Yg
ZHJtX2RwX2RwY2RfcmVhZCBpbg0KPiBpbnRlbF9kcF9nZXRfc3VfY2FwYWJpbGl0eQ0KPiDCoCAt
IGVuc3VyZSBpbnRlbF9kcF9nZXRfc3VfY2FwYWJpbGl0eSByZXR1cm5zIDAgaWYgZHJtX2RwX2Rw
Y2RfcmVhZGINCj4gZmFpbHMNCj4gdjg6DQo+IMKgIC0gdXNlIGNvcnJlY3Qgb2Zmc2V0IGZvciBE
UF9QQU5FTF9QQU5FTF9SRVBMQVlfQ0FQQUJJTElUWQ0KPiB2NzoNCj4gwqAgLSB1c2UgYWx3YXlz
IHZzYyByZXZpc2lvbiAweDYgZm9yIFBhbmVsIFJlcGxheQ0KPiB2NjoNCj4gwqAgLSBmaXhlcyBz
cGxpdCB0byBzZXBhcmF0ZSBwYXRjaCBzZXQNCj4gdjU6DQo+IMKgIC0gZG8gbm90IHVzZSBQU1Iy
X1NUQVRVUyBmb3IgUFNSMQ0KPiB2NDoNCj4gwqAgLSBkbyBub3QgcmVuYW1lIGludGVsX3Bzcl9l
bmFibGVkDQo+IMKgIC0gZG8gbm90IGFkZCBzZWxfdXBkYXRlX2V0X2VuYWJsZWQgaW50byBzdHJ1
Y3QgaW50ZWxfcHNyDQo+IHYzOg0KPiDCoCAtIGRvIG5vdCBkaXNhYmxlIHBhbmVsIHJlcGxheSBi
eSBkZWZhdWx0DQo+IMKgIC0gc2V0IGhhc19wc3IgZm9yIHBhbmVsIHJlcGxheSBhcyB3ZWxsDQo+
IMKgIC0gZW5hYmxlIHNpbmsgYmVmb3JlIGxpbmsgdHJhaW5pbmcNCj4gwqAgLSBkbyBub3QgYXBw
bHkgYWxsIFBTUiB3b3JrYXJvdW5kcyBmb3IgcGFuZWwgcmVwbGF5DQo+IMKgIC0gZG8gbm90IHdy
aXRlL3JlYWQgcmVnaXN0ZXJzL2JpdHMgbm90IGFwcGxpY2FibGUgZm9yIHBhbmVsIHJlcGxheQ0K
PiDCoCAtIHVzZSBwc3IgYml0IGRlZmluaXRpb25zIGluIGdyYW51bGFyaXR5IGNvbmZpZ3VyYXRp
b24gYXMgd2VsbA0KPiDCoCAtIGdvdG8gdW5zdXBwb3J0ZWQgaW5zdGVhZCBvZiByZXR1cm4gd2hl
biBnbG9iYWwgZW5hYmxlZCBjaGVjaw0KPiBmYWlscw0KPiDCoCAtIHVwZGF0ZSBtb2R1bGUgcGFy
YW1ldGVyIGRlc2NyaXB0aW9ucy4NCj4gdjI6DQo+IMKgIC0gbWFrZSBwc3IgcGF1c2UvcmVzdW1l
IHRvIHdvcmsgZm9yIHBhbmVsIHJlcGxheSBhcyB3ZWxsDQo+IA0KPiBKb3VuaSBIw7ZnYW5kZXIg
KDEyKToNCj4gwqAgZHJtL2k5MTUvcHNyOiBSZW5hbWUgaGFzX3BzcjIgYXMgaGFzX3NlbF91cGRh
dGUNCj4gwqAgZHJtL2k5MTUvZGlzcGxheTogRG8gbm90IHByaW50ICJwc3I6IGVuYWJsZWQiIGZv
ciBvbiBQYW5lbCBSZXBsYXkNCj4gwqAgZHJtL2k5MTUvZHA6IFVzZSBhbHdheXMgdnNjIHJldmlz
aW9uIDB4NiBmb3IgUGFuZWwgUmVwbGF5DQo+IMKgIGRybS9pOTE1L3BzcjogUmVuYW1lIHBzcjJf
ZW5hYmxlZCBhcyBzZWxfdXBkYXRlX2VuYWJsZWQNCj4gwqAgZHJtL3BhbmVscmVwbGF5OiBkcGNk
IHJlZ2lzdGVyIGRlZmluaXRpb24gZm9yIHBhbmVscmVwbGF5IFNVDQo+IMKgIGRybS9pOTE1L3Bz
cjogRGV0ZWN0IHBhbmVsIHJlcGxheSBzZWxlY3RpdmUgdXBkYXRlIHN1cHBvcnQNCj4gwqAgZHJt
L2k5MTUvcHNyOiBNb2RpZnkgaW50ZWxfZHBfZ2V0X3N1X2dyYW51bGFyaXR5IHRvIHN1cHBvcnQg
cGFuZWwNCj4gwqDCoMKgIHJlcGxheQ0KPiDCoCBkcm0vaTkxNS9wc3I6IFBhbmVsIHJlcGxheSB1
c2VzIFNSRF9TVEFUVVMgdG8gdHJhY2sgaXQncyBzdGF0dXMNCj4gwqAgZHJtL2k5MTUvcHNyOiBE
byBub3QgYXBwbHkgd29ya2Fyb3VuZHMgaW4gY2FzZSBvZiBwYW5lbCByZXBsYXkNCj4gwqAgZHJt
L2k5MTUvcHNyOiBVcGRhdGUgUFNSIG1vZHVsZSBwYXJhbWV0ZXIgZGVzY3JpcHRpb25zDQo+IMKg
IGRybS9pOTE1L3BzcjogU3BsaXQgaW50ZWxfcHNyMl9jb25maWdfdmFsaWQgZm9yIHBhbmVsIHJl
cGxheQ0KPiDCoCBkcm0vaTkxNS9wc3I6IEFkZCBwYW5lbCByZXBsYXkgc2VsIHVwZGF0ZSBzdXBw
b3J0IHRvIGRlYnVnZnMNCj4gaW50ZXJmYWNlDQo+IA0KPiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2NydGNfc3RhdGVfZHVtcC5jwqAgfMKgwqAgNyArLQ0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jwqAgfMKgwqAgMiArLQ0KPiDCoC4uLi9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmPCoMKgIHzCoMKgIDUgKy0NCj4gwqAu
Li4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmjCoMKgwqAgfMKgwqAgNSAr
LQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuY8KgwqDCoMKgwqDC
oCB8wqAgMTcgKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5j
wqDCoMKgwqDCoCB8wqDCoCA1ICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9oZG1pLmPCoMKgwqDCoCB8wqDCoCAzICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3IuY8KgwqDCoMKgwqAgfCAyMzcgKysrKysrKysrKysrLS0tLQ0KPiAt
LQ0KPiDCoGluY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDYgKw0KPiDCoDkgZmlsZXMgY2hhbmdlZCwgMTk0IGluc2VydGlv
bnMoKyksIDkzIGRlbGV0aW9ucygtKQ0KPiANCg0K
