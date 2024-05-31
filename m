Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A68D5A08
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 07:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C28C10ED43;
	Fri, 31 May 2024 05:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkZuPYxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDE610E9A2;
 Fri, 31 May 2024 05:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717134719; x=1748670719;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CDcXsfQdidjtWrHqz6MMKyqScD46Oy87pBh4PrRlSIw=;
 b=lkZuPYxQ5T3int09o4q1m7aj0334Wol7x29dddjyAQGc5QR1iTsTFJoS
 VOr8uJK9STDzyj/+KLtt5Slt0w1dHcpliyF3l49AFACdCqkTa7wAmO6VN
 MQaggoJK76B7ZUp6ZF6Of4txqjgFKaUBeh28p79q1D4+aGnxdWYVNpAVc
 cJ5RoNp4eJAWwQAZDkOal3NrEc64E21N/ckQCwv2DZTGuQ/+KXr8mFsx3
 Jc1Q54Hs/gj5Uc6XleraznuX/KblxszqbLY+5w/WFiZ4/bKxA2J6LyAG7
 HW6rc2RrieYc1ktNI4mRQDsEuQnxfSoUW3uptKye9eSLPGQZsoHmcknwP w==;
X-CSE-ConnectionGUID: pvowVYzSQb61YqnuDmW2og==
X-CSE-MsgGUID: Aa07vJcsTbWBb9E1xf5Qpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31193671"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="31193671"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 22:51:59 -0700
X-CSE-ConnectionGUID: Ce++wEEwQVSrY5zvcNq4bw==
X-CSE-MsgGUID: +bqpxn+oQ3eHZy0qvYMtSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36146332"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 22:52:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:51:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:51:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 22:51:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 22:51:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvgIE4OWTuS7pm5fP95F+fRQ8TC6MySGjcpdJ5B0VJKGvC7WvN0Ut5VhPd6/i+CKJ87YVjBrYD7dKcfLaKM07jcISUBLhztv6dmKDNy/bEVAlJLgLptX78FwIT4lOyqt3NptP/MWbQj4p44LihRvRcQrCtwNXZ1bVTsYD5yU4xGMhJ6klB0rEzcK4swD6YO26OJnCdk2awVIUvfcs/A5BfYzdctmltw7zsfujFSmY1joHwr7bz/pI2F/1OR140DC+03R7FkI6C4sIeDvo+AbaxnnFreY2S0gyvIZj55IhW7q9dr8Vn1kbpFW8BjmU63ciMhhYMG9SAr5fHaqsn15tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDcXsfQdidjtWrHqz6MMKyqScD46Oy87pBh4PrRlSIw=;
 b=f8HvVj1cPmNgXGjkLQvAoKbfhO7+A7R7K1NxCdBQ7NEcqlvjSE5sz18veZgfUWK8dBcpdwI196FCj+2caShaRfNWqiJAOvapCT9oRlipgaFxknfR9slJ87pftbT6t3t151hxFSlfab4fXUIDvpLFPlegoyMnXkvvSCHeZz5vQS73D21v4zsrd/ANCRbL78lXbfjEqHz2ytgbYYA4RSSX8cQnOC3BMpjugOnnDI2b4iD0NyJuhATwTw8016R0tIUPVKBWKJNjhzXPv4VhYlPTyueKwL9/shckr7RLTdVHI9rlNGpQIXhbyZbCpjRoEygSY5Tzrieemw9/xhNgYB9c2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 05:51:49 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 05:51:49 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, Maxime Ripard
 <mripard@kernel.org>, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v7 0/6] Link off between frames for edp
Thread-Topic: [PATCH v7 0/6] Link off between frames for edp
Thread-Index: AQHasgYnFyxbzWk8qkSOezp7dI2AErGw2Clg
Date: Fri, 31 May 2024 05:51:49 +0000
Message-ID: <PH7PR11MB5981953F419D06C15BF6A84DF9FC2@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240529200742.1694401-1-animesh.manna@intel.com>
In-Reply-To: <20240529200742.1694401-1-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|SA1PR11MB6615:EE_
x-ms-office365-filtering-correlation-id: eedd896d-fb6d-46e9-f661-08dc8135c3c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?TGZhY0xnZUI3ZkVoR0ZuZnlpMHBZbW9xM2lXaGZ2R2IyNEZaOXVqYm52WVhP?=
 =?utf-8?B?bDcwa3FDbzZXaHZVdVBjWlVVUXdWNnNTYUp1UElUN1RyUkw3UmFPY2wzaHd1?=
 =?utf-8?B?RllnK3pYVnBQMzd1VUZCOE5VOFhOek56dzFrYmY4MTRyTis3dE1YQURhMWU0?=
 =?utf-8?B?ZzZPaEM4OURrbGJRYjZqdHhlb04xY0piZ3htQU51MGU0Uy9ZNzV4ZnhlbjVF?=
 =?utf-8?B?VWZvY3Z5MDlwVmE0NjAva2FqbnJQcjBSWXdqUVhBR3QwdXJ6Mm5RVTBkelVB?=
 =?utf-8?B?TG1jRUMzWmJxMjNZUkZtelZzNy91VUx6R0VacmhmaDUyTm1lZEdGdjV1UUtL?=
 =?utf-8?B?a1Y4bHYzN1BSTklwVnhYTDY0YlNjcE5rTUFVZjZvT1ZQYTUxaVNEMzFqWWY0?=
 =?utf-8?B?eVVpbUsyRkltU3FoY01CYURLc0FjWXpJMmNYdFBSQWhvREpDZXY5dFhLNXdI?=
 =?utf-8?B?ZWhZTlVOcms1K3hRV1g1YXM3UFBUb2Z4dmpwL21iSWZwWVlpUklNV09kYXgx?=
 =?utf-8?B?NUNEb1I0V3ZBbVpGKzhxY2xUNGtGSitIMCtSZEg2TUlPNlRiTjRsMlBtUEZB?=
 =?utf-8?B?cjlWMys4MldFVTI2YzlkVkJKNndGNXRmV25jVzQxTm5iSGZoQ3IvMk1mUVg3?=
 =?utf-8?B?WW5FekpqUVkvOHlBNCtickxjQ1kvNkZ2WmJ3U3BLbTJPV0dqeEc2UFNPY29u?=
 =?utf-8?B?eFJWWExhMWhOczB4UURtNWJUbGxNME1WclRXUG9kUTZrN0UrYnFvSmQvY3Jz?=
 =?utf-8?B?SS82OFZDaTNZZXFieml2QjIvRmhDQ0E2eUxlcCtNUzVPNE1WYTJlV0J1Wk8r?=
 =?utf-8?B?aEpSMDRWdTJtL3gvUFlSNS9YVFlkUDBJLzJ1cVBZSm5LcGx5L3gwQ0themgy?=
 =?utf-8?B?VnQwSzZ2ZXdVM25NRFZZdWZSUjZGZWJCcFBTNGREOE9LY0Y0LzZXTEEvblVB?=
 =?utf-8?B?WmpqSThGUEx4NER4eSswWDhzUzhOakZuQzhSdU1seHliQ1ZvZVRya25RMklD?=
 =?utf-8?B?Z1BlY3g0TnY5MVVsUExqTDZBTUFkWjg3ZVNWM3V5ZGVsaGpPMEFYYTNHZ3Nk?=
 =?utf-8?B?M243YkFzMEY4ZEFGSGdZLzU5NE1xbXZzM1NnN1RkRlZsUHhPdS9ObVc5Wjl1?=
 =?utf-8?B?RFZnYjFubmhyTDhuR0NBV3owVlpmUEZSVTdkdWtQM3o4clQwbDc0WVJhVDk4?=
 =?utf-8?B?dXY5Z3ZmVlZKVUJqQmgyVHpCRCtrbWpqVktSVzhxNzBGMmt1VUZvWlZHczRR?=
 =?utf-8?B?VmpFTXUvRWtYaWxsRVpZK0w4ZDZpdkJ6Q0MvTkdRZHQySmg3dlI2UjRCSTFi?=
 =?utf-8?B?Mm9pQ3psQ1pMdmU4K0tYL2ZkNFVoZ3AzNmg4SVFRTmJ2TkJXUURlSktwb1k1?=
 =?utf-8?B?VVV4ZXpMRkRGT0g1UHdJWUEyazV4ZGs3Q1h0aGlYVEwvcUhwbDdXZnVDMzZ3?=
 =?utf-8?B?MVZpZ1oxTHdIYzJsODU1Qlk2MGxET1crYUx1Q040clpkcTZXNCt5aTNqR3Ri?=
 =?utf-8?B?MndPQkwrcW5Kb1VkUG96a1NDZTE2ZUdIRDVnZ2JTK0xvTjkxTUkrN3ZVSnpz?=
 =?utf-8?B?RVNnTGFMVDd0cXVUK3g0S2NNUytKOTNZREpMQWQxRFFZUEkyNnU0QUN3RVdk?=
 =?utf-8?B?dnF4TGoyaXptZVowQ3JFSnc4S0RwZ093YVFjK0lTcFdsNzFNcnphZ2RYQU8x?=
 =?utf-8?B?WVBFWjVHVlQ4Zml5Z3QxNHJHNmdqSmVvMnlPSDY0SVU0dTgxVHo1OStrUWFP?=
 =?utf-8?B?c2E5Vm00bGpiMEQrbVFXeE4vMXo2dG1SUG9VYUFsK1Q3Q0U1WmVrYnlkci81?=
 =?utf-8?B?aWtHQllUSW5iazl5RTEvQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yml0anY2bjdFdG91clRxTU53eTZleXdFT0V1UEtEUUFQTFVLMmJ2OC9POWM5?=
 =?utf-8?B?by84UGRoYklXWjlDSi9aclBvUUxjaG9ZdnNBVjhkdHFyazgrdjZBcStLNyt5?=
 =?utf-8?B?SFkxNkdwSUhGNUZFSHRFOUJTV1hwWmVVTGZsYUN5V3BoSWZyYjk0aGsvZVZK?=
 =?utf-8?B?dFBEeFkrTHBBeVQ5OHlLMmZoL1NUN2pScjZUOExPaHlyTFpocDNYbmdJRGh6?=
 =?utf-8?B?MXltWW11MzBOdDQ1S1YrWll6WXg1eUQ4R1B2a0dWc3pmUHRHUHZjU2p0RWVu?=
 =?utf-8?B?eC9tTXdlaVlETWZ0a2NTYlNkWnJDMm14d2srcGFtblkwL2FhYWF0M2s2aTdH?=
 =?utf-8?B?aFFmd3ZMTU5rS2gycXBwNWN2aVo4M0RDQU9pV21MM3l3ZGdrV2xHWFhHVThy?=
 =?utf-8?B?OXJGSXdBU3FpR3RQSEtwNFdvVk1tMkZoYUlsZmtUMTVDY0prdzR6V1RuRVNm?=
 =?utf-8?B?bUlzMUZYRnFYdEhCU3plY2lZR2oxOTNIV1pkc0xGZkdpTm9VVVd4SnFwUGts?=
 =?utf-8?B?SkYwM0ZQckVFcEF5Vmx2K1M1Zm4zeDE5bXg2MG8vMmlCbWpPL2J2WndHSjZI?=
 =?utf-8?B?Zi9vLzRBUE1zSk5vUE5IRVpXMG1aZytXZkpuTlQvOFlhcFJaZzF3LzBxOU5Y?=
 =?utf-8?B?Nmg5d0FTTWJOclVNRTI4aGxUOE93MnlpN1dKclBJQkljbzVoQzBVTmFlMFpX?=
 =?utf-8?B?WkU2V3VWRkk3QUt1UlRSVmlldmdjUmxrQ1Nyc3pabm5UblpYemQ3Ri9haXZV?=
 =?utf-8?B?MkNJN3dKOUhsM0UxWGh2eXBtOVhnRkNIcktYeXBUc3Y4VDdKdlV2SFlVUnhC?=
 =?utf-8?B?U1M1SGw1Q2FHRlVwZFBBVzh0YlQxMVk1K3VISzJrN1BSZ3ZFNWhwNVRZNGQr?=
 =?utf-8?B?Zi83ejZYc3hJYlBkM0d0djlNWDNBYUZPUW5EekVmZFR6OVdycDAxb2dJbkVv?=
 =?utf-8?B?N1I5UFhBNEpoS0ZaSHZOTTA4cXk2TldPdTROZDJsYWp2SWdvMEFVUWJnbkd3?=
 =?utf-8?B?VVNPdWpzVmdESXptc3RQNHJOZW1FVXQ0bitrcmlPYktwdFBXTE5YdWpZaFZn?=
 =?utf-8?B?SUkybFlhcGQyRUdjdXB5UnliWWdlU2owRE0yTGRGczVDcThJcU1kQ3dIQ1Rp?=
 =?utf-8?B?d3NvOENtb2J1ZnA2OEtSa3V4UjZ2T0Y4SzkvOWJJUTUzMEUzZk5pNWk4RHBV?=
 =?utf-8?B?cGtVWVMxY08zNEJVR1NsNExyVzJUT3FLU2RXc2FaZ0JOZytTdklBMzd6S0Rx?=
 =?utf-8?B?a0JvOXFkNzVMcW5PNENqaEFuRUFzbkZiL1MyQ0l3R3JxUzZHR2wwOGJMMFVD?=
 =?utf-8?B?eXFsN21TSTBIRWx3dGlMWndtS0FpbkNGaVBZcnFLOWFOb05UdEcwOGhPQ2Zr?=
 =?utf-8?B?V013ZXhBSWlDMTNGbVdvVDMrSm5hUW1YVjZ6aS9TTncxT2JLNEpzcW1tdTlX?=
 =?utf-8?B?T3RKc1EzRWVxN1YvcFFiTVB3KzdFSkM0aFlpR1NJdGtvOVVpSUZneVcrbitC?=
 =?utf-8?B?aEprYm9XL3N0YnZzM2lGMGtPZkVNTHBzZi9TTDhzYXRTcm02U2VMMlByS2xj?=
 =?utf-8?B?RkJ5NnlaWDBQblZTYWxkUWc0V244d3hhQyszb0RNUWdya0QwdzhRYnZ2YnNk?=
 =?utf-8?B?TzBHekZtcGc3bGk4OUEyV0JZeFptUHN3bUI3aXBmZkxNVk5WUXZ1cndOcHF5?=
 =?utf-8?B?QkJxUnpqY2M4VW9LK2FOcFNUdFViVkwrOTl0N2sxNUNQNzBsRzBFQ2FqTEoz?=
 =?utf-8?B?SEovZG01cnBaVldGRWJEYXgvM0c4clpFVVc0MTY3eVMrNDN0eWhySm1LUURS?=
 =?utf-8?B?UkhqQXJDb1Yva3hmNS9QcStPWWtpdWo2ZFptT0k5bEpJbi9pYUxudmNvMTln?=
 =?utf-8?B?U2JBWkIyTyt2UjJwK1ZzQmZ6Q1ZBNmR3cGZYL3FsWTdPUFlMWk5iTkdVUTZv?=
 =?utf-8?B?dXlnMlJCVmRaMkpiRFVmVDQzYUtZOTN5VmVJNlVOc0ZWSHN6bHNMcUVUeEMx?=
 =?utf-8?B?czVrbGprdnFwb1FVRWNsM3hOQ3pvc1RFZW9iQm02ei9NZ2p6bjFlZ3hFbENO?=
 =?utf-8?B?K29Yc2diZFpPSDdxNmFVNVl5bVZ6MWovdzlnaVpTL1JTMVplWWdOenJEQk9D?=
 =?utf-8?Q?7TPx2ON2hkmIo+a23UJmKSrM6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedd896d-fb6d-46e9-f661-08dc8135c3c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 05:51:49.7234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsg9hw6kYxrHiXFTtb8s7QvMf8mRgAMDnCQ33MQYosV9BaGbgWjkMTQaQs/OaWM9DFW397tLdOAdoRR6EC15Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFubmEsIEFuaW1lc2gg
PGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDMwLCAyMDI0
IDE6MzggQU0NCj4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IE1hbm5hLCBBbmltZXNoIDxhbmltZXNoLm1h
bm5hQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHY3IDAvNl0gTGluayBvZmYgYmV0d2Vl
biBmcmFtZXMgZm9yIGVkcA0KPiANCj4gTGluayBPZmYgQmV0d2VlbiBBY3RpdmUgRnJhbWVzIChM
T0JGKSBhbGxvd3MgYW4gZURQIGxpbmsgdG8gYmUgdHVybmVkIE9mZg0KPiBhbmQgT24gZHVybmlu
ZyBsb25nIFZCTEFOSyBkdXJhdGlvbnMgd2l0aG91dCBlbmFibGluZyBhbnkgb2YgdGhlDQo+IFBT
Ui9QU1IyL1BSIG1vZGVzIG9mIG9wZXJhdGlvbi4NCj4gDQo+IEJzcGVjOiA3MTQ3Nw0KPiANCj4g
Tm90ZTogTG9iZiBuZWVkIHRvIGJlIGVuYWJsZWQgYWRhcHRpdmUgc3luYyBmaXhlZCByZWZyZXNo
IG1vZGUgd2hlcmUgdm1pbg0KPiA9IHZtYXggPSBmbGlwbGluZSwgd2hpY2ggd2lsbCBhcmlzZSBh
ZnRlciBjbW1yIGZlYXR1cmUgZW5hYmxlbWVudC4gQ3VycmVudGx5DQo+IGV4aXN0aW5nIGNvZGUg
cmVmYWN0b3JlZCBhbmQgbWFrZSBjb21wdXRlLWNvbmZpZygpIGFuZCBlbmFibGluZyBmdW5jdGlv
bg0KPiByZWFkeS4gV2lsbCBhZGQgZW5hYmxpbmcgc2VxdWVuY2UgaW4gYSBzZXBhcmF0ZSBwYXRj
aC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50
ZWwuY29tPg0KPiANCj4gQW5pbWVzaCBNYW5uYSAoNSk6DQo+ICAgZHJtL2k5MTUvYWxwbTogTW92
ZSBhbHBtIHBhcmFtZXRlcnMgZnJvbSBpbnRlbF9wc3INCj4gICBkcm0vaTkxNS9hbHBtOiBNb3Zl
IGFscG0gcmVsYXRlZCBjb2RlIHRvIGEgbmV3IGZpbGUNCj4gICBkcm0vaTkxNS9hbHBtOiBBZGQg
Y29tcHV0ZSBjb25maWcgZm9yIGxvYmYNCj4gICBkcm0vaTkxNS9hbHBtOiBFbmFibGUgbG9iZiBm
cm9tIHNvdXJjZSBpbiBBTFBNX0NUTA0KPiAgIGRybS9pOTE1L2FscG06IEFkZCBkZWJ1Z2ZzIGZv
ciBMT0JGDQo+IA0KPiBKb3VuaSBIw7ZnYW5kZXIgKDEpOg0KPiAgIGRybS9kaXNwbGF5OiBBZGQg
bWlzc2luZyBhdXggbGVzcyBhbHBtIHdha2UgcmVsYXRlZCBiaXRzDQoNCkFib3ZlIGNoYW5nZXMg
cHVzaGVkIHRvIGRpbi4gVGhhbmsgeW91IEpvdW5pLCBNYXhpbWUsIEFua2l0IGZvciByZXZpZXcu
DQoNClJlZ2FyZHMsDQpBbmltZXNoDQoNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9hbHBtLmMgICAgIHwgNDExICsrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmggICAgIHwgIDI1ICsrDQo+ICAuLi4v
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYyAgfCAgIDIgKw0KPiAgLi4u
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oICAgIHwgIDI2ICstDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAgIDQgKw0KPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyAgICAgIHwgMzAzICstLS0t
LS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICB8ICAgMSArDQo+ICBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oICAgICAgICAgICAgICAg
ICAgfCAgIDUgKy0NCj4gIDkgZmlsZXMgY2hhbmdlZCwgNDc1IGluc2VydGlvbnMoKyksIDMwMyBk
ZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+IA0KPiAtLQ0KPiAyLjI5LjANCg0K
