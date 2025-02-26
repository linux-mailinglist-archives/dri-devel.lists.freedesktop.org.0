Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA77BA478BB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 10:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F4810EA5A;
	Thu, 27 Feb 2025 09:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 884 seconds by postgrey-1.36 at gabe;
 Wed, 26 Feb 2025 18:39:21 UTC
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593D510E9B9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:39:21 +0000 (UTC)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QAl4Bu008485;
 Wed, 26 Feb 2025 10:24:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 s2048-2021-q4; bh=1v90LLA9Z5y+7CKhNS3IY9Kq86AM8YYZRLFssSnGWxA=; b=
 cFyhDjBwHLIs9fof2iJX4o2CRhB6Z0csBbrUCMWrblC2UOHx+BJ8yCm2z81V4h4T
 hePSVVwwsf3LrxeOZL8MYR8sHrg1GNKkPzugxknkoAnn98/RcBkj7Zyirmk6pj6o
 ROHYvimGNwrQsJchbZJK4V5B8J1vPDwWEHkU+JshEErHnMGqW/xcL7FcuZyQRhWc
 WilW+JG1GJxjImGIuHjejH8Y8jMRln7cn5GsQWZlnzRRkH0sk+MKSGc/wcqRkqHn
 CfSKqP/9yBFujRJp1FOPuwAuRSPUpCWlmTgZSS0j81/w55W4bZXX65yYBqqOXnEP
 WqhvvaJy31mYzBVSfIvXeg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4521gn2x2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 10:24:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpcdooUD9n2HEidvoAK1MRZ4VaHZ4Cp4uC8g6CHnVmCLIJf93d9n22qBcBMLrCJLe2sZosOMVM2VjBDpBC1ahBCvnZOyIrTR875YM9/l3Lk89xYb0tao0AkelNjMy4Uur5QLkRPtmjHsVkT7Qjn2DcteL48z+kR4SZ25a6I2nO87Ib8Wot/L7+qexEnL+tYbIfe1FKQcl2IP+kIWzLeurO9NxpXBcXqQ9ey5yTrWLfR1LZZcF+3AUeKOxLv2BOHn+9mjae+MAXBsBuW9pWXgKn7Ha6gdcHk0GpBaLZyAFTfbDn0AoSk3YapvNqiav9NZncncQ+vHrifdlzYTvwnRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwUFO4ymfTpR/RwikV5Hd3QAd3pWNMnHqzjiRNtDfjQ=;
 b=vUJsmB10TAUeahmBwDgOJSUGfaPk1Wz/MBiBDyMdMlz4uLdCNXOHJsyqo5huI1+WEpFzOyEHzbnJR7wC7SA5nPSmNozWVeh9pg0ndO+jrvMAzIkpxcwxOjFW6wk+ZictW5pv/yr07lT09N5qzsZ2cAMa5yiPM/K1y+lJkST6gUywFEOtExVbVSsDmTDLikABPG72eO56He1fEDVEmVrJmWpr/mnwDMw5mVahrtYwPH2mwOfrFHE0wvaztXcFvTuO+6J7AbIdVgRvyZIPgTd+K6obPj+CdFrV8Lfu2/o9NNQFAy9uuq0Pi8FXsRM7y73M3XQFqizezMB9njv9G5Ykyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB5258.namprd15.prod.outlook.com (2603:10b6:806:22a::12)
 by BY1PR15MB6079.namprd15.prod.outlook.com (2603:10b6:a03:534::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 18:24:24 +0000
Received: from SA1PR15MB5258.namprd15.prod.outlook.com
 ([fe80::a29e:a332:eb15:993c]) by SA1PR15MB5258.namprd15.prod.outlook.com
 ([fe80::a29e:a332:eb15:993c%5]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 18:24:23 +0000
From: Wei Lin Guay <wguay@meta.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
CC: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>, Dag Moxnes
 <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>, Nicolaas
 Viljoen <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Simona
 Vetter <simona.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>, Maor
 Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6O5Loc/d/3VGEWjEKeLiKCgu7LpIlYAgAE6MQCAATnSgIBqC0IAgAQGnoCAAK/FgA==
Date: Wed, 26 Feb 2025 18:24:23 +0000
Message-ID: <BC19B19C-1B58-49EA-9D21-8CA02D6A42DF@meta.com>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
 <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
 <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5258:EE_|BY1PR15MB6079:EE_
x-ms-office365-filtering-correlation-id: 07138c42-1f01-434d-5e94-08dd5692cbb2
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dXBRMzVkSkVlYklZZFNOQTIrUFlLYXlMK09iaGZoY083bjAwZTFjRHovV2pa?=
 =?utf-8?B?L0NmUFZLS3NsSzN4RlJVdTV1K3NNTjQwSE9JNzYxR3E0RW5yYXZzZHkyZzRD?=
 =?utf-8?B?U096RG92aXZ2QWtKQ2NsR1BWeUI0YWtET2EzNWRwWUVQU3pXcEx2dzhLV1NJ?=
 =?utf-8?B?N1k1MytMWTlDZHhXYlEvVUFpVklOSGswUlpNWW1oYkpaSUorQ2ZtemZBLzBQ?=
 =?utf-8?B?QVA5dlJQdGNvcXV1YmZLY2xkaDNlOEFLOXlGeUFnTGFrRFhGcDV5dDA5TmxV?=
 =?utf-8?B?VzJOdHNXTzNnTkI2dENQL25KRjBHeEFpZ3d1Z0lDRlByVXlKbThNd014bzhE?=
 =?utf-8?B?MzZFUkxvQkQwTjIrU0ZFUUY5NVVyWW0zYnY3QmxRUEt2Y0tidERtRUFJVmxq?=
 =?utf-8?B?L0hPalprYlJGK0YrczRCWUlwbTlmbVNpOWUwWEF0NXNtL3A0ZUNiTkJoSDg2?=
 =?utf-8?B?bi9LTUlYek1VS2FUcVZ0WkYvbkN1ak9yVUcxeGl6RUY4bElMcDhxZTZvdHUx?=
 =?utf-8?B?ZlZua29Gczd4SkMwMHFxWXF0RGRZZUtXRklvWkdGSytidndrZElndUE2NlVX?=
 =?utf-8?B?UnZCazFDclV6N2hWLyt0cy9RY2pyVzIvaFJXNE15S1VQN211RDRzYlpINVlX?=
 =?utf-8?B?aUZFUHFCdkNXMHVVMU1sWFZ1MVZRdVZNcHc0bmREMW5HR2lGbDdrSXFKUjhs?=
 =?utf-8?B?ejh2S096NTZJVkR3ZGUzMm1rdld4Z3EwSmF0Vm16TFJKQmF5c1c1LzU3L1lK?=
 =?utf-8?B?cWFVeFlaeUJYL0Y5YytRdTgrRS9MamJPUTN4WjlTTHVLSkFDMStNRVA1ZXM0?=
 =?utf-8?B?SUJyVWFJWUl4eUluN3FXdkpnMFhRZUxjaTFQQTFXNCszOUtKR09uS1l2dnRF?=
 =?utf-8?B?M0h4d2NCYmx2bkFRRkVweE83MlJrUkI0T0hPZTlPSEsyMGxobS9CaFdLMHg1?=
 =?utf-8?B?ekhCQmg3dTNLMVQ4N01sdnorTzdxZ1pPbHltK2ZpZnVndmU0SlZUQ2NiR2ph?=
 =?utf-8?B?Z25vQUJ0STlLd1dvWG9UK3dLRzIwMXAxVzh0YlJSL25SZktJckZHdmRCTCsw?=
 =?utf-8?B?Kzh2SEo0TzJWa1dhc01RVTQvZlBEdmFlZTE1bk9hMGxCMmZUQXRVSEpEb3VH?=
 =?utf-8?B?dEVKSm4vTnBkcWRsSHZWM0ZoY0pnbjY2VnZ3VnlBN1d6M0JtOFpRd2ttT0RU?=
 =?utf-8?B?ZVp5Y3dnd1p2YWl6U3hNeXFjbkVEYmhydk8rK3haalFEYjg1UHR0L3dacERU?=
 =?utf-8?B?L0hNSmZtdEs1NCtFWGlDUjl4RzY4akVYSTFROWVxNis0TGNmN1EySE1hWndB?=
 =?utf-8?B?NHNCWEdyMjJWd1NaUUZuQ2hsekpuQm1Xdk9idG12YlE5ckVxWXJ3b0lUK0VY?=
 =?utf-8?B?ekh6TEhpMW94dVBJL1dObFIwYXJTQlNCQjd0Tm5lSHZ2SStkY0htUFF5OUp2?=
 =?utf-8?B?ZFoxUXUrS3NSQjd4WVZnSHYvWXpVSTFjSHJudXNVMWRIcWZheENCR0h1Q3lQ?=
 =?utf-8?B?YUFMeVZIRHIyWjEzbkNoOTE0UWs0bFl4YlJvYnpETDdUUnUveFI5SS81enlw?=
 =?utf-8?B?WThpTmllZ3c0L2U4bklsSUFlQTlWU3RER2NYNDlSQWQ4UjNleFVLUU9vdFZr?=
 =?utf-8?B?OXNSb1JmQVRxTFdRK1JnVTUrZ3BUOWRHUkIyamEwcWJzd1dmWFhydEV2aC9F?=
 =?utf-8?B?R01ULzE2VVFpVlB4T2YxN2JPa3c1V3BoQWNWZFVRYkpxcHRVcmRjK1Z6S2Q4?=
 =?utf-8?B?NlUyaVVsTWJoSXhKYm5xa2NSWTI5OXJDQk1EWXRqNVhzVVpLSzNzTkhIRjlv?=
 =?utf-8?B?Wmk4VkJLQWgwTEt6dHlERzQ3QkZIdnJidzJIS0M4c01WYkRVemRMdGNVTXdo?=
 =?utf-8?Q?UyG57Izw+l9AK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5258.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1dXT2xqUFlpRkZIMytoYXBVMFZPWEVKVHFVMFRWRm5uSld2UjlLRVFPT2Fr?=
 =?utf-8?B?Smhubmxma2Q0MnZIeTNFbnJkdDVxc3BjRGRmaVdQd1pRWHBwZ012cHlqN3RP?=
 =?utf-8?B?dlBzWG92emNYcGQ1NVljTDR0aVdsZDFoTWp3eGRNOXMzMFpNdW5pT2c1Z0Zp?=
 =?utf-8?B?VGNIb04xNHNScDZBb0ZSaDdXODdHZ0JwYjljZ3BCKzNIODgwbHVCcXJWNmRI?=
 =?utf-8?B?b3VXM3ExR250VFFWVlZzS1JhQWxTUXdHMzBJejlocGhCSHRrVTJFUVUzTk9N?=
 =?utf-8?B?bWJNLzBWMW9RczQxNXZzanMvTkM2ekRMQ0tOelVwWUFBQ21aQTNDZnd3QWpI?=
 =?utf-8?B?YU1KM2JwS2tOcHRqUkhiRXF4OEk0Q1lCS1YyMEVEWFBCVjV6VUhuREpXd2dO?=
 =?utf-8?B?RmJDdmxHTFUyYVJSZHBGWklzUEJkT09MS2kzN1lXTXZlUUlOckV1RFFhRkVY?=
 =?utf-8?B?VEl2M0NTbmJxK09oakRqU0VvekR1b3IwWHMzOUxZQ2dGVTJiNzZOVWhlcXZH?=
 =?utf-8?B?bmxGWjl1UTRPSlBRWWM4ejBkb2JUbFhDcExDSXVmV2lNRU1tSjRXZmFEV2ZW?=
 =?utf-8?B?SU1GR29IcE9CaER0T2JnYW1oMEZLZ2dsdEVWNWxlY0pMbDFnUnpjWml5MFox?=
 =?utf-8?B?a3lpLzYxeG1uczIxaS9LOGMyVGpuaXczUHpDK1E3S2RyQzVkRVplZ3lEL3dt?=
 =?utf-8?B?Vk9Wdy9Fcmh5S1NzZkpvd0ZwdXRZMFlNbWFDQStDN0diOUVueDRPN01tbDBI?=
 =?utf-8?B?UE1VYm51NHpzRmxnOUYyeitaV3BWZndPMHE3b1N4dU1CN29MczRtVzFQRTNn?=
 =?utf-8?B?VlBPbk8xcHRZaGxqMTQyVGpYWVdWdjRxZDh1ZjJGZExSTWxIKy9vYTJBUzJT?=
 =?utf-8?B?Q1NGOWtLa1J6b0JTUUZQMTlQRUJlSlFJL2JkU2YrR3dHNjNaUUtkOTVGUy9J?=
 =?utf-8?B?OWl3UTJKNXprRTFaMGhzQjVESEJQd1FxSTVCbTBFWGdDOU1qUlpuUWkrTzZJ?=
 =?utf-8?B?TStaeTJHZmF6cHVjSWpZamcvQlVmNUhyS2U0aGRTOWsrOEpnRitvbVgxQ2JE?=
 =?utf-8?B?S2VpUGNBU2JsUEtoRTd6NHIxdld6c0dPcWl1V25RUE1STm14SUZsM0NPRzda?=
 =?utf-8?B?NUQxd3NSc3VaR0lGb2JtV1ZEYnZCSWp1WGV0NnYrdmNlZGh6QjZmNmgrYUlZ?=
 =?utf-8?B?NS9sdmdYeWtEclJ4YWNRRGdKeGNBdUFVMWNqa0tGSkQwZVcxRUhPTlFDWWM3?=
 =?utf-8?B?ZkpUZlZZNDk2WEsvb0ZNZVdDM0xqTXlEOWZLM1dQUTFVcDN0ZWZNZXpaSEtF?=
 =?utf-8?B?OFE2R2ZjWXZNaGNEOWRnOTFsZEpjT1FoeEhmRUVoNWdqYVZzRVRTRDhkQ0tT?=
 =?utf-8?B?OU9udTdQVytxRGh5by9ETlhSYkYvZk1xT2tkY3RxTk9WTG1mK1lwWVhNYXNj?=
 =?utf-8?B?dkJoKzdZeHhhZjBsUnRXNGM1Kzc4bS9QYnJXYUVzSUs1UXdVYWd6Q2hRUEtL?=
 =?utf-8?B?UkNFdmtxeGl2aUp2ZkRiWXEvOWFLOHJuT1F4SnBGQWErMUFyd2VmaHlwOGxP?=
 =?utf-8?B?YkRrRkJtSjROYUJVTzZFM3AvU05pTTArMmVybnZGTElJNXBCMWpXdEVJcFMr?=
 =?utf-8?B?RW5ncUhtczZzaFFXc3NScFV4bEhhM29XMWpleGl6LzBqNEIxOCtQTHJKUjBQ?=
 =?utf-8?B?c2ZTcHlMNkxYSzZETkhpVU9jQ1ZhRW5iZDVyNG11aHBPN1FZb1F0R29hc0li?=
 =?utf-8?B?N1I5UjU2MGZmcCtLeW5ONytER2J6cnBseWR6amo2YjZCeG5GZVIvQ09QOXBt?=
 =?utf-8?B?YjhKRGJoemNEUDFGcmVzNFV4RTFyRy8zaU4rWElaQXBLUENWNVNTODRQMFFS?=
 =?utf-8?B?UzRaZGkvaUlZdGxmcDRQcEJ0bGlmQVo4LzZCTzFvS0FwSDdZSm9BSjBIdU03?=
 =?utf-8?B?aUUwNGJzTENXV3QrRE9DNlVqNzcxMkxxSGFGOWtTZWNXSTI4RytNNE1QbWZS?=
 =?utf-8?B?WGV5eXBuOEZMR0lTRDQreTBnWDRBTUlVM3VJTXYxQmxMVWh2bXp3MzZlanFI?=
 =?utf-8?B?V3ZhZ1k0enMyR09aWmdOdGZsTm8vZmZHL2VIOUd1V1pKNytxWCt2Sm1OcFdp?=
 =?utf-8?Q?fXifQeW5+nJmX1ZTpEyJ/Vjl5?=
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5258.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07138c42-1f01-434d-5e94-08dd5692cbb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 18:24:23.8541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BqUuPrY7qtEjiT3oiv2x5438TjGv/sAN7+61U143Cm9lRcC98niDIXukDAG6pMrl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR15MB6079
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-ID: <DA2F20DD2FB2F748B05E5689728AB06D@namprd15.prod.outlook.com>
X-Proofpoint-GUID: xzNx7cUKt7O3qjrlKBL5lmrW9y2c4CoR
X-Proofpoint-ORIG-GUID: xzNx7cUKt7O3qjrlKBL5lmrW9y2c4CoR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Mailman-Approved-At: Thu, 27 Feb 2025 09:10:01 +0000
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



> On 26 Feb 2025, at 08:55, Kasireddy, Vivek <vivek.kasireddy@intel.com> wr=
ote:
>=20
> >=20
> Hi Wei Lin,
>=20
> [...]
>>=20
>> Yeah, the mmap handler is really needed as a debugging tool given
>> that the
>> importer would not be able to provide access to the dmabuf's
>> underlying
>> memory via the CPU in any other way.
>>=20
>>=20
>>=20
>> - Rather than handle different regions within a single dma-buf,
>> would vfio-
>> user open multiple distinct file descriptors work?
>> For our specific use case, we don't require multiple regions and
>> prefer
>> Jason=E2=80=99s original patch.
>>=20
>>=20
>> Restricting the dmabuf to a single region (or having to create multiple
>> dmabufs
>> to represent multiple regions/ranges associated with a single scattered
>> buffer)
>> would not be feasible or ideal in all cases. For instance, in my use-cas=
e,
>> I am
>> sharing a large framebuffer (FB) located in GPU's VRAM. And,
>> allocating a large
>> FB contiguously (nr_ranges =3D 1) in VRAM is not possible when there is
>> memory
>> pressure.
>>=20
>> Furthermore, since we are adding a new UAPI with this patch/feature,
>> we cannot
>> go back and tweak it (to add support for nr_ranges > 1) should there be
>> a need in
>> the future, but you can always use nr_ranges =3D 1 anytime. That is why
>> it makes
>> sense to be flexible in terms of the number of ranges/regions.
>>=20
>>=20
>>=20
>>=20
>>=20
>> Also, my understanding is that this patchset cannot
>> proceed until Leon's
>>=20
>>=20
>> series is merged:
>>=20
>>=20
>>=20
>> https://lore.kernel.org/kvm/cover.1733398913.git.leon@kernel.org/
>>=20
>>=20
>>=20
>> Thanks for the pointer.
>> I will rebase my local patch series on top of that.
>>=20
>>=20
>> AFAIK, Leon's work includes new mechanism/APIs to do P2P DMA,
>> which we
>> should be using in this patchset. And, I think he is also planning to use
>> the
>> new APIs to augment dmabuf usage and not be forced to use the
>> scatter-gather
>> list particularly in cases where the underlying memory is not backed by
>> struct page.
>>=20
>> I was just waiting for all of this to happen, before posting a v3.
>>=20
>>=20
>>=20
>> Is there any update or ETA for the v3? Are there any ways we can help?
> I believe Leon's series is very close to getting merged. Once it lands, t=
his series can
> be revived.
>=20
>>=20
>> Additionally, do you have any repo that we can access to begin validatin=
g our
>> user API changes. This would greatly aid us in our software development.
> Sure, here is the branch associated with this series (v2):
> https://urldefense.com/v3/__https://gitlab.freedesktop.org/Vivek/drm-tip/=
-/commits/vfio_dmabuf_2__;!!Bt8RZUm9aw!5AqOvAz6XDQHodYKrX3ALs11b3JitInzCLzn=
NijS7PEQ2wsvhUbx0bF91aTlC-832qGyYJkZnPnV77r0u99IpQ$=20
>=20
> Note that, the above branch is based off of Kernel 6.10 but I think it sh=
ouldn't be
> too hard to forklift the patches onto 6.14. Also, here is the Qemu branch=
 that
> includes patches that demonstrate and make use of this new feature:
> https://urldefense.com/v3/__https://gitlab.freedesktop.org/Vivek/qemu/-/c=
ommits/vfio_dmabuf_2__;!!Bt8RZUm9aw!5AqOvAz6XDQHodYKrX3ALs11b3JitInzCLznNij=
S7PEQ2wsvhUbx0bF91aTlC-832qGyYJkZnPnV77rIbSw9TQ$


Thanks for the pointer, Vivek.=20
>=20
> On a different note, if it is not too much trouble, could you please repl=
y to emails
> in text (preferred format for emails on mailing lists) instead of HTML?

Apologies. It was an issue with my email client setup again. It should be f=
ixed now.=20

Thanks,
Wei Lin

>=20
> Thanks,
> Vivek
>=20
>>=20
>> Thanks,
>> Wei Lin
>>=20
>>=20
>> Thanks,
>> Vivek
>>=20
>>=20
>>=20
>>=20
>> Thanks,
>> Wei Lin
>>=20
>>=20
>>=20
>>=20
>>=20
>> Thanks,
>> Vivek
>>=20
>>=20
>>=20
>>=20
>> In addition to the initial proposal by Jason,
>> another promising
>> application is exposing memory from an AI
>> accelerator (bound to VFIO)
>> to an RDMA device. This would allow the RDMA
>> device to directly access
>> the accelerator's memory, thereby facilitating
>> direct data
>> transactions between the RDMA device and the
>> accelerator.
>>=20
>> Below is from the text/motivation from the
>> orginal cover letter.
>>=20
>> dma-buf has become a way to safely acquire a
>> handle to non-struct page
>> memory that can still have lifetime controlled by
>> the exporter. Notably
>> RDMA can now import dma-buf FDs and build
>> them into MRs which
>>=20
>>=20
>> allows
>>=20
>>=20
>> for
>> PCI P2P operations. Extend this to allow vfio-pci
>> to export MMIO memory
>> from PCI device BARs.
>>=20
>> This series supports a use case for SPDK where a
>> NVMe device will be
>>=20
>>=20
>> owned
>>=20
>>=20
>> by SPDK through VFIO but interacting with a
>> RDMA device. The RDMA
>>=20
>>=20
>> device
>>=20
>>=20
>> may directly access the NVMe CMB or directly
>> manipulate the NVMe
>>=20
>>=20
>> device's
>>=20
>>=20
>> doorbell using PCI P2P.
>>=20
>> However, as a general mechanism, it can support
>> many other scenarios
>>=20
>>=20
>> with
>>=20
>>=20
>> VFIO. I imagine this dmabuf approach to be
>> usable by iommufd as well for
>> generic and safe P2P mappings.
>>=20
>> This series goes after the "Break up ioctl dispatch
>> functions to one
>> function per ioctl" series.
>>=20
>> v2:
>> - Name the new file dma_buf.c
>> - Restore orig_nents before freeing
>> - Fix reversed logic around priv->revoked
>> - Set priv->index
>> - Rebased on v2 "Break up ioctl dispatch
>> functions"
>> v1: https://lore.kernel.org/r/0-v1-
>> 9e6e1739ed95+5fa-
>> vfio_dma_buf_jgg@nvidia.com
>> Cc: linux-rdma@vger.kernel.org
>> Cc: Oded Gabbay <ogabbay@kernel.org>
>> Cc: Christian K=C3=B6nig
>> <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Leon Romanovsky <leon@kernel.org>
>> Cc: Maor Gottlieb <maorg@nvidia.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Jason Gunthorpe
>> <jgg@nvidia.com>
>>=20
>> Jason Gunthorpe (3):
>> vfio: Add vfio_device_get()
>> dma-buf: Add dma_buf_try_get()
>> vfio/pci: Allow MMIO regions to be exported
>> through dma-buf
>>=20
>> Wei Lin Guay (1):
>> vfio/pci: Allow export dmabuf without
>> move_notify from importer
>>=20
>> drivers/vfio/pci/Makefile          |   1 +
>> drivers/vfio/pci/dma_buf.c         | 291
>> +++++++++++++++++++++++++++++
>> drivers/vfio/pci/vfio_pci_config.c |   8 +-
>> drivers/vfio/pci/vfio_pci_core.c   |  44 ++++-
>> drivers/vfio/pci/vfio_pci_priv.h   |  30 +++
>> drivers/vfio/vfio_main.c           |   1 +
>> include/linux/dma-buf.h            |  13 ++
>> include/linux/vfio.h               |   6 +
>> include/linux/vfio_pci_core.h      |   1 +
>> include/uapi/linux/vfio.h          |  18 ++
>> 10 files changed, 405 insertions(+), 8 deletions(-)
>> create mode 100644 drivers/vfio/pci/dma_buf.c
>>=20
>> --
>> 2.43.5
>>=20
>=20

