Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B93B253EA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 21:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16D110E7B4;
	Wed, 13 Aug 2025 19:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HdaQgdvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B31610E798;
 Wed, 13 Aug 2025 19:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rh1E8dL+hwrH8X3g0BnEkctKgg9GBmNzGdXmu3xrzMlZSZcC7GHXKl58cCUQhSC5BxyzOXlaA+yylG7Z9vLBx2xZVhTtWpxyGNW3oz/m6NrbfvvXdpkhtiWjJSyTzXoImVbfPyUI/9CIESVNK+IbW0m6wBi4bwHz9/uhKp2hXomBkubFFw/aOdM5HWoOx1IbiZQaiPNaZ5FteYjxPLUk9LvxrtV+vk3Z+EbFUTNPVqS5a5aTtJysQ6A3a1dLbPuwunphjus/gh3RhZwIRNufCbaPLRzkrpY17YpAujGVKHOM9DUIWZ6eT2L1J9Z9NHdVURPOCrCvPW1dCE3mKNnlkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsTXogc79jo8PQSIVreG5MnRW5mq+qa+KkQvM5GIqwM=;
 b=TAoCSyHJOzYtPWinC0HoSaAMMzjOhyc3CleLXBOwsroRxXC5tmj+HFxwouG5OXgGM82YU+ca8jMNnY27ueSG/JLP3ssh5taGVqOvcd+h3OwUz/HmjWWMjN7ekk+mH2EvJoH8zePob9rgblJfHH2gbOfHX7Fu9KXLB8VSGT6o/gqfxAMXGwO6UQ8+pHkXYLpYze3ayzD+0kAFg1IO04iKKSiIy/BhZPvFLyxCVarctc43LwioRmcB1Zs5Wr6HWF7oDjbEiAlbXY/pnNkHnwC87OvzOcJJNeSyuRpgLw3nfz1FGuOcB4s0dJJekEpJDXaTgWK6BMgwSWB5MdV84Iu9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsTXogc79jo8PQSIVreG5MnRW5mq+qa+KkQvM5GIqwM=;
 b=HdaQgdvo1WdSKbYXgHiSRMLiJsUQWrOSWnuuf6UmqygGKlbV8/JqHDxYvqD73GneSJYMTs1uVe94ciWM1dg3geO36NO+dd3DVLnoVSnB07sqqXDQz1q2LvvYJBO0jT20m55LFO9RyyU6SEMovXerVtUH8M/xBzd+fd3h6eUBCGMcVCQXhceKqVMKzIFYHJ/XQdnk0RPkk+luOgFsIqr+pkR8yl4mXm7Ds3nKIOwNGW58+vveDzsMWeGV58UViu7ZrgDG1nSla23FrYurRadLjOwD6/e5K68CpYA3CkZ4giwdo6Ui4kFNFZmx9o+Ef1Sen1vH8zoIEt6yhXvQfbSm8g==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by LV3PR12MB9119.namprd12.prod.outlook.com (2603:10b6:408:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Wed, 13 Aug
 2025 19:25:06 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 19:25:06 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "timur@kernel.org" <timur@kernel.org>, "imre.deak@intel.com"
 <imre.deak@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>, "dakr@kernel.org"
 <dakr@kernel.org>
Subject: Re: [PATCH v2 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Thread-Topic: [PATCH v2 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Thread-Index: AQHcC9Dlo/MqfhDpGUmJQ/Eb0aHgwrRgOoEAgAC9zoA=
Date: Wed, 13 Aug 2025 19:25:05 +0000
Message-ID: <4043ff4aefc218fdcfce6bb47c9b4d7d29a1d29e.camel@nvidia.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-20-ville.syrjala@linux.intel.com>
 <98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk>
 <aIOIX8W6olY8ryTN@finisterre.sirena.org.uk> <aIOTaOA6bUelUtBm@ideak-desk>
 <aIPES8pWAdCVB07L@finisterre.sirena.org.uk> <aIdPW1a5OgTlHweN@ideak-desk>
 <CAOZdJXWKs0ZWjpiOKFOZRn8UiSsFnAsQ86f=KaCYJwhuvqkDDg@mail.gmail.com>
 <aJxHWM8LBLcV5SDD@ideak-desk>
In-Reply-To: <aJxHWM8LBLcV5SDD@ideak-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|LV3PR12MB9119:EE_
x-ms-office365-filtering-correlation-id: 02041bf9-bf4d-4bfb-8624-08ddda9f1bfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eVdTYUQ5R3Fkc0JoNjVqdWpIOHQ5L3l6WnNCZ1RpOW4ybWszQ2lDNllGM3BG?=
 =?utf-8?B?VFlQS3J5bmkrUExSRXpHSWkrRTZDTTVTMkwwRjdHbVFncGV5ek1PaUVHSDFs?=
 =?utf-8?B?WmxEcmZsaWlGOGs1SjJ6eUdOR0doNExTYUVXOUhKbC9nR25uZ2ZkdWNFVFFI?=
 =?utf-8?B?MzZiVFFlbWlWSnljdWdZZHJSZVUxSUZFcVpMTDVzbDQxK0tvaGVZKzBqTCtU?=
 =?utf-8?B?MVJzZFQva0IrekY2aTZKcGl1S0MxYitaeFQ0Zmx3dWZwckY2QU9ZaUplcU9U?=
 =?utf-8?B?QTh0Q2JuZ1lZRDZBZ0tHZWIzOTdZRllBVFRSUVgwWVMxcktwc2lNRDVMNFlx?=
 =?utf-8?B?U1p6dEhKb2gzbCs4NzVpQWhYQWJHZ25xWUVZby9XY3RkM0hhZHVlWWdaZlpP?=
 =?utf-8?B?TndVdEZzTURZckNKNUV3QkpUZDloUlhaMlBFVHVOMWt3NlJlajM2TTNuNSth?=
 =?utf-8?B?dldka2NudVhuZ1NkQ014ZVNHRlFmeGkyY0pORU1xZFErN0ZQOFpZa3NDa3h2?=
 =?utf-8?B?Zk5FMXB5a2pPQjBLNUhMc3pETm90c01zRmVCSTVEYW1hTXZiamgrNjlvMEla?=
 =?utf-8?B?SDdrRGNLMlB3UFJYTHA0eUg3bkFLQUdPc3VCSjJvS1F6OStzTDFhQ3ZUNE9r?=
 =?utf-8?B?SHRNaWx6T1VXRVROQTE3MlZjVURCN05IenRyL1FTSlhvNng2Vmp0Um41L0ll?=
 =?utf-8?B?VjBJNHYxYUV1NWJITERpaHhaczltYWJOKzZXK3RBTkFsWnFwTlJBb0NkOEtl?=
 =?utf-8?B?TlVQdFBEU1RWdFMzUzVQL3o2b3hIV1h1REh0L1hlUUR3eGR3aGNqNE5Kbi9t?=
 =?utf-8?B?VFFpWWJJcXRIaU5VZ3hxSkh3OTdZNEpnNjdKMW04eStKK2FrQndhNFBXTENo?=
 =?utf-8?B?NlhUcVJweEVKWGlJZjBPU0hGeWIrQnhoZ1o3VVZvSnNISytuTTRZbzBnaFVX?=
 =?utf-8?B?Uno0N1dxQ2RXZUY3dmoyVUZIeTd1MHhMV3pMYVZOMDJjMVNUSGhJdUlQYTlY?=
 =?utf-8?B?a1JUcE1JN3ZJcFpZbStrbnBRUHRnNWhiZVlzeXhlMTZrOFgyQnI0dUl2Y0JX?=
 =?utf-8?B?c2dXbjBpQzAwUEo3WGRDQ0RNSUsra0txR2ZYZTY2bGJSa2NTQnE3amI1bHdI?=
 =?utf-8?B?QlRQNXJCN2FXb3Y4Sk5XcEJBclFueS8wOWZ4amVKYnR3bHd4SXVSKy9XQ3NE?=
 =?utf-8?B?MVVWdjNMYzdkejRwTmZ6NG5LNDlGelI5UEpvZ1lLWElBbWtiK1Bqb2kvRnJD?=
 =?utf-8?B?MTFIajltN3FXNmZGMjA4QmJzSDloMDE5RVBCUXlITklkWVpSendXaW00YmRw?=
 =?utf-8?B?REQzaWtTYU5Bcld1d2ZyVEV6N2NDcGdkSFhESlJ3elVtVkJEZ1piY0lXMVZV?=
 =?utf-8?B?VVFlZ0t3NXpCVFM1NDFheUdaKzFQcWJ0SEdiMklycjQrY05FMk1DM2VqS25U?=
 =?utf-8?B?UnRaOWRhU2FyYjQ3ZzE0bDF6VTR2SXpNWndjR2ZLWHNNclF2Wm42dGNyOWJS?=
 =?utf-8?B?SnhHejJveWV2eDFaMGgxN3Q4SHNTSndtdFo2SWkzZ0tmelRUNERTcDRMdXBR?=
 =?utf-8?B?clZ3VjMzQlB1TlAxU2hUdk5xcU1qMlNrQm5MTHpnbU92UFozYVQ3dDdiYXEw?=
 =?utf-8?B?dVVwQUMwYXZmTTBVbUVLVGhBYjduMGg5VFBOTGc2Q3V0MHFRbkMrbDM5djFp?=
 =?utf-8?B?NzJhV2haMUZ4WGplSlNlTlYzV1J0ZXFUZDM4NXBiNXZnT0JmN1kyTmxjanp2?=
 =?utf-8?B?QUVXajFwOFRxUWZSL2czeWpLYnRZR2k1M3RNeDNMOVRiQ21ISE1MdXgwZ1Bh?=
 =?utf-8?B?N09mV1dNOGNIUUtaV0FUQ0F4SG5iMWo2d3JqQWZwcGc0RE80eFFBUzhZREl1?=
 =?utf-8?B?WmdnTjY3M0VQanV1dGNYTjJFb1BvY2I3U0J6Z05nT2l2OThxc2pzZUtPZXN1?=
 =?utf-8?B?Sko3NjJDRlhVa0wxNXp5MzUvMmlSbVpPMExpNGFxRXR0NUpjNURjQnN0bGt6?=
 =?utf-8?Q?0nuVw5j7yzQ9vxbXTsSu7YYzC/FiwQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXhZMlJmald4RVlGMXkwemErUFlIRFBQMm9lY2IyQjVlbENjSGpiOG5IcXZW?=
 =?utf-8?B?eXpnYkQ4TFBrWkFycC8xSS9IOFhzRUJteDlzU2puZ1BWeVZyOWtPNVFFVWZj?=
 =?utf-8?B?VzJPSEcyS2xjNUJNamMzb3pzeVZEbXdTUkN4eUtRVVZxdm5WbjB5c3ZFcTIr?=
 =?utf-8?B?ckw0a1Q4OFF2a2hqSjZKVnYvWXlaWHFKdEhGcnE5REl6VHBUeEtTMDlHU0dW?=
 =?utf-8?B?UkhBNFVYdXhSd1NvaFVyZjNuMjZ3MEhJWStXSW1TM2JJVUNldDNScEd4cGFn?=
 =?utf-8?B?b1pzQ2dDRDZHeDRmaDNXRllwWXlUK2RKVG8vMEpUT2U5TmpFRkpxWHlqamQr?=
 =?utf-8?B?UXE3eXZTZE5ybzJsTStjRjNscktBT1lmbWNQdFl2WmcxQzRlNnFhK2N4MHNK?=
 =?utf-8?B?c2I1QVdwcFp1YTVRTmsydEpRV2xmMVpnQTBwZnJoVklwL3dOditxa0pHRkQ0?=
 =?utf-8?B?Wm9pQUNsaWljUkF4L1dJOXpNbFhWMVRyT2xyNkRNSG1lNEZpb21SZmtMbGc2?=
 =?utf-8?B?ZWQxOXdZNklpbW1NM05hNHhDSVJYSkZRWm52eU95N1F3Z3NTbU5XaVZ1NzlP?=
 =?utf-8?B?VkI5cmVnYmhxTlhXM3d5M2lONlUxdnJ1NFB3Slk3elcvZjZLcGx6bTdxRjA1?=
 =?utf-8?B?WHU0ZVlMeXZoSmNPV1dyNEk5MllHNTNEcXQ5VzdFUTVQWjZiTG5mRG9SbHB4?=
 =?utf-8?B?NElCWHRQRno2akRJVTRPVkw4YWJpb29UN00rR0dOa1NVSkhnZytZZG9oOHZV?=
 =?utf-8?B?QjdMVkFNSDdBZ3VqSDNjeWFuRVVOSDZZTmRyN2tiZHVpS0xtVzl5Zm1KUDU0?=
 =?utf-8?B?cVBrc1BTbkRqSHJDZlZzRFR5d3NhTEJ1LzFUWEIzTmJFVXUvaWdBRHVuVStt?=
 =?utf-8?B?cVA3ZjdTdXdxRWs4a2s3V2ZNVVZxQzhBcGxjUHlOdmVyeGtHT2RVdGVmRDMv?=
 =?utf-8?B?cFJNNGllTWtNMzZaZ0ZNcWlQNHAwdWE3dVFURW1oVGFhdHBlL0cwSHh5dlVn?=
 =?utf-8?B?TkRkS0NIUHdQK2tTbVM3bW1PSTBMdVhGUG1XZnZ6WUIyeG5Jc1RIZmNTQmhV?=
 =?utf-8?B?bjhpOGVmaFR4aEI1SFJrR3czVVRkcTZrYTNva3U0MFIzV3Q3emN5RjFRMitu?=
 =?utf-8?B?S3J0a21Zejd4ZEx2Vkhvdk1XbFdpd1NOU0F6bGJxOWJvUzlDeVpqRTg2Y1Jp?=
 =?utf-8?B?aEFBa2x5cUFGa0luR2dFSjlTL2NoTFJxNUhzQ3BNSHEyazRObUdiN3ZDQzE5?=
 =?utf-8?B?bWYwd0dQS3hPNjhUanlVbysvclBBTWt1MG43UGFhanRZc1VUQUY2RHhBZ2V5?=
 =?utf-8?B?R3J0OEtLeWFPT0ZheS9PY2hoMFlETnBYYTBNMnlONXoranZzb3dvL0t6MHdG?=
 =?utf-8?B?MnM1WEo0cVNkVERROWc1ZGlxaHRQL1IvZFVZNCtUOEJEUVlHbGdYKzdJbEVY?=
 =?utf-8?B?ZEUxNFJ0Kzh2QUpIdkxpbDZJT1lTVFdKS281RDJHVzJiOElCeVVOMTQxWk1C?=
 =?utf-8?B?aEFRK0dFRlgzUWkrczhvVjg1L0UxOXlxcy9odUxvWjFDdkcxVllhcWtkWk1O?=
 =?utf-8?B?b1JXd0REcm5jS1hMa3NudHg1emQxQmhOdTdDYWxHNTVqS3dpNWhJNXZtYXZX?=
 =?utf-8?B?Nk11Y1QzWUVHWkU1ZjJUY21hT2RpZGVXZzAxZFN4WlJKenN1U3BrQmFKRXMw?=
 =?utf-8?B?UG9XcVcrS0lSbHl3TGhXUUx0aEQzQmFWM01remx6ZVlnajAxRTVndWpwVk9h?=
 =?utf-8?B?TXYvb2dCTWFwcWs5cmw1ZFBrdnJkejVxQmFwbitDZzhqWnB6MUIva0lCRnRJ?=
 =?utf-8?B?VkF5M1AybkM4bjErMTN2cEdFbHZYWk5tUFBmMGtZaVQrM2p2NU94b2tqcmQ1?=
 =?utf-8?B?eGtCTGY1eXloMlh4STFXY1J5Ym9KYlZIVW1IL2RZczZDSG1RK2x0SjhHbDhI?=
 =?utf-8?B?M0UxNUJ1TVJZTWo1M094bzgweHVsTEp6MDhwZDFYQjdKR0RPZ0tvdUFjY1Ur?=
 =?utf-8?B?eVRYQTI5WkVuSERFWmRwZzE4R1M4WWpNbTRBMmdPYzMyalJzSmlkeUxBVGZW?=
 =?utf-8?B?TFE2UFV6Y1JmcnhkV004Nk5BQ0FyalU4NExndHVmSWdkdVBOSVFudHZ3Ujdr?=
 =?utf-8?Q?3gchukmyZljolHWJfe4wXNI2O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EF14A5AC765CF4EB21842EF83F3C361@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02041bf9-bf4d-4bfb-8624-08ddda9f1bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 19:25:06.0184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZxlvX/UEBuGhUEQDkVHC/bCOx7LG/ien15Yw7BjLkuj6owjXY4kt0ZzB9jnKaksh5Nnv1ntx04m4GPptUcWlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9119
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

T24gV2VkLCAyMDI1LTA4LTEzIGF0IDExOjA1ICswMzAwLCBJbXJlIERlYWsgd3JvdGU6DQo+ID4g
ZmItPmZvcm1hdCBpcyBOVUxMIHdoZW4gZHJtX2ZyYW1lYnVmZmVyX2luaXQoKSBpcyBjYWxsZWQu
wqAgVGhpcyBpcyBpbg0KPiA+IHRoZSBkcm0tbWlzYy1uZXh0IGJyYW5jaC4NCj4gDQo+IFRoZSBp
c3N1ZSBnb3QgZml4ZWQgYnkNCj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJt
LW1pc2MvY29tbWl0Lz9oPWRybS1taXNjLW5leHQtZml4ZXMmaWQ9ZDJiNTI0YzkwNjQzDQoNCkkg
dGhpbmsgSSBzZWUgbXkgY29uZnVzaW9uLiAgVGhlcmUgYXJlIHR3byBEUk0gdHJlZXMgb24gZnJl
ZWRlc2t0b3Aub3JnOg0KDQpodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlz
Yy8NCg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9rZXJuZWwNCg0K
