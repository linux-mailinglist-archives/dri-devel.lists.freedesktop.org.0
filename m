Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD4gKSHLj2nMTgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:08:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EC713A890
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47ADA10E866;
	Sat, 14 Feb 2026 01:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="WuoqJ3Tu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11022116.outbound.protection.outlook.com
 [40.107.200.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9FA10E866
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 01:08:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/LaDrih65lR9fX3I5cNPhjh7CtGe6WeBf5+aZpkCssPgvqGTU18r4CQZq9G6xjqjL3tYUJXvE7Zw7B6c9GYihKMMA9MQjD/oqb9v2OHH5EnKjR+aw4bGa231ND+hjUQnJ3b2Wynj4wkKW4Iw/Pdm+zuAL35RgRjv3SLzXujGMlhjVyj9D9C1FLIGMAAHbhF2F28tD6RBRWhGeFKPJwcRM1O9t4tkVm/En6UcRJlwBrhgzyW5QLrAv1O2GUvGaa2dLei4y7ozVSiYn9nDTApRaCR2mNUqAEeBjwcIIAc2AnC/isdhpaBf75G8BMlFbOocU1hMjSikZBX63V8eCZrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPNWSEibndn2UUrSakoYDoI71VsePG72/ou/Q08QsrA=;
 b=MNKhQHmZ4AHRApgsUM/5MDKQaBTUKyz0cXU3PqPclel+eB7hCW5SbzfbCGdZTofLkQ9jYDKwQRV5BMl1ftGbPjgHSiQRGQCmydtBNaIUh2QwZosEnsGG9jUUwulV/BtUJvLHMSkpgfnbhHMQhpgzjgAO3mecmGj9lt8hXwDcGNl2R5ZoofoQfC/mdhfIz1vT/6gYX+scTKg/TCu+VJR3GHO8GRhwU9DZW3nmbA/74iUgwdPAgNsY2cU/+gvcNU2P1/6jDe6C4xWx9op58BS0DLegx+ff4eW0Uu6UemcbglRbjd+BkpsP1pg1W8LnZU3AnvMazobhTwx/deLiTVMhpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPNWSEibndn2UUrSakoYDoI71VsePG72/ou/Q08QsrA=;
 b=WuoqJ3TucYOtE/wzoMcv5TZIqBhA7eMqUTtCYHMQoJwXthWufqjVyEHQDERTTeFOWGPrDnql7xwt9j2Fzd+qHFJX4qatv6f+vJRT8igYN++tK+CM4hKIyjlhHOURn/U71eYeDorlzTY7Mf/CUhnJ2Oj4k8pVfkQAFAUWl5gF/K4=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by PH0PR04MB7702.namprd04.prod.outlook.com (2603:10b6:510:5d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Sat, 14 Feb
 2026 01:08:40 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::d0a9:7455:cb02:ca08]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::d0a9:7455:cb02:ca08%4]) with mapi id 15.20.9611.008; Sat, 14 Feb 2026
 01:08:40 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: bridge: anx7625: correctly detect if PD can be
 disabled
Thread-Topic: [PATCH] drm: bridge: anx7625: correctly detect if PD can be
 disabled
Thread-Index: AQHcmzdDxpu+fAfjAkCBt4rpGFlOvLWBZVyQ
Date: Sat, 14 Feb 2026 01:08:40 +0000
Message-ID: <BY5PR04MB67397D4ADB82B984FC13EB31C76EA@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20260211-anx7625-fix-pd-v1-1-1dd31451b06f@oss.qualcomm.com>
In-Reply-To: <20260211-anx7625-fix-pd-v1-1-1dd31451b06f@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|PH0PR04MB7702:EE_
x-ms-office365-filtering-correlation-id: 097b66db-a6b7-493c-6017-08de6b659702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?bnlLaDFpNGpzRXdUVUQ1WFdkVnhRamtWT3hXWE43WGlkYStvUXJKK0dJWGsr?=
 =?utf-8?B?SGJlZlRLMDA5U01TYlpyZDloc2tld2pMaFVBRGRSbEJrY3NjV2NRMEdMdDBV?=
 =?utf-8?B?cFk5am1RSlUydHNCYXorS1Y4M1RPZmZiZWs4RFkreVRkUHdYOHEvOXJCaCs1?=
 =?utf-8?B?T1VtMGJuODUrVlFvY0VlUU8yTXlJaE82VnRhZU82TW9OMk1NOHZKb3RiWFlz?=
 =?utf-8?B?NTF5N3V5cXg0OFdhblhqSU9qOWJObDFvazdBdWZlZWQ3ZzVyRkVETXhaSWE1?=
 =?utf-8?B?V0Vsc0xKamxPSUFEZGFZL2YwdHRhZ0F6d1o1SlZieUpGNVAwUktxWHNpYVIy?=
 =?utf-8?B?UHNqa3BoRW1DUFR0ekczS25rRWFPWGFxYjZJRjJuZ1ROZ09rcVlpK2NvU1hN?=
 =?utf-8?B?cGNWSmpuNXJxUnBsN0YxbEN6M3FJUXgvQjBsMlYvbmRiVFQ1eThoWWpEa2R6?=
 =?utf-8?B?c3J5c0cxQkFDQk00NVdBTHdWQ0l6bTJLaE0yMW1VQUpTWWdtUGRUeXc4TGFm?=
 =?utf-8?B?TDJiSHR3dDlJMW9jU0NaSHc2TE9sdzdodkRCT3pNbUNoeDAxUnk3aTFSTXpD?=
 =?utf-8?B?eXFQV3ZGcExyYkJFaWRkVEhQb0RBWUNzTE5nbGI2Z0xYVHhKUG44SWw1REV4?=
 =?utf-8?B?amxPMVlnMW5BUVJSTHM3QnpQOTRJazNpc29FV2tWNEdXY0pweFUyeGt3NzVU?=
 =?utf-8?B?OXBtNHprK2dtYmNiRUY2SnNvZVNocEtXZGpVRVJJL1V4M3lTdDB2bGhJcVo1?=
 =?utf-8?B?VUZ1d3MwalpQanFJaUhwWGhEVS9GR3FQTHlvUGJZMEYvU05jZkVlOTdqME81?=
 =?utf-8?B?dlRjcGxDSkZBVFFoRzErQk9hUzdDWUNablBBbDJRRHdtc1R2QlRHRmF2ZVJH?=
 =?utf-8?B?YUhYRGhKbWJaSFZOZXZSd2xBNkR0N2hNVGN6YzJ1WTJtUFN6ZlJoaStQSzlX?=
 =?utf-8?B?ZFFUY2dCUStUd0I5TTlIeTFudVd1OVdxeGFEby9lKzlnL05qWTBkM3JkUnhr?=
 =?utf-8?B?Q0c0aVBTYnBGQzRVb08rakZpalJ5K0dXK3ZyMEtmZDJJMmlnT1FOaVFYTDBQ?=
 =?utf-8?B?YVdYb0N4MzlQa3hZdGVTdXN3WWFOeDBRa0pzTzhCMVArWERVenRDenR5d1Q4?=
 =?utf-8?B?S3o2U2gwZDhQenRRYk8zZzFsWlhMUXppbmJiYzdjdnhkQVFrcVRhaFJlZ0FQ?=
 =?utf-8?B?MG5xZ1BPTkJydVVLTXVtd1BGN2IwK1hKSnlocGdiQWZsV3pMc0VLOUtkTWdR?=
 =?utf-8?B?Z1JLZ3ZBNG5XNVlHTTUwcWMxaTNDQkMwcmNVbjBNclZmeGNZeW9zajc5bnd4?=
 =?utf-8?B?MFBLWHpLN1l0ejJZMlhvb1RPd2tJd3VJRnVVVDNrRHc0MjFxNTVPUFFTQ3Z6?=
 =?utf-8?B?UlZIdXJmSDZ2VEhzMk9lYnpzd3RsUHZtNFhxb0lnUzFsYnZLcExxNVhKRktR?=
 =?utf-8?B?UGlTTHhIU1lqc3hUUTM1OGV1b2FoQ25FSmNKMndxTFRCQ0g3N0pSejBJbStq?=
 =?utf-8?B?OHFQRlJVWVh0VGlOL3EzeHkvdjVoN1VIdzQ2YjArazJodDU1QUxGYzBMRDlE?=
 =?utf-8?B?N1RlL0RpL0l6T0FZdExaSXJTRlJkUGI4dVNmRjk2VVJOU0NnR3JZY3piWUln?=
 =?utf-8?B?UWdZb25aeCsxT241TTBHM2JEeEVrekRobnNNeURDc3ZtWklFR3FzWHdiWW9Q?=
 =?utf-8?B?L3dGYk44elVOdzdOTnVHOG42ZjZuQXo0SWdMRmZianNKWWZVbVlxc2MyTHRo?=
 =?utf-8?B?QngrTlhDbTcwenAzMG9CemFSQlIrL0F3QVZmTmptSGxXeCs4L0pkc1Z5Tjdn?=
 =?utf-8?B?VzZkT2trM284cUJTbDBTUlY4a1RhRmRNdEFOcCs1eFk0eGxIdzNFaHBWTWhX?=
 =?utf-8?B?OUM3UGRsUmMvYUh6MUZISDZOY0FMM2c5WnRDV0I0NDkvdkZpOGtpREdyNHFs?=
 =?utf-8?B?RW1DRHM3SkVzc2paNDZ3aDFhYkxIcU5BTEhncUpSYXJjQkwzSUMrdDV0dkFh?=
 =?utf-8?B?REE2Z2NvVGRsUXVKcWZCN2dxZllLUWI3V2ZhRG1odkYvMHRSQzE0ZVlQbTAx?=
 =?utf-8?B?aUNtZmhTVXBxWklNM0QxS1psSW0wbmg5YlBUaGpzbjlGQ2U3K3JkQ1p2Ym9B?=
 =?utf-8?B?aUtCQXBIdENDUVI3Z2krZUx3WlpXOTYwQ1IzUlhVdTF3QVUzaFdNNnF2cFFx?=
 =?utf-8?Q?OsCB5Y3/0tgiSBlWLmopAwEY65CTjl72ExfBP2A/WRYI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bi9BcEdQL0ZwTHIwMjhlcVphRVl4VkprY2p3TDhaK0Z3UmZ5Rlp4Z3BPSC9r?=
 =?utf-8?B?QTEraXVvZm9UcExoVVJwOU9HSndQL21SdVBYdVVpZEhoOEhoMmNZRXkzODl3?=
 =?utf-8?B?VHBvdTVLUFV4RW1Ka3RnNFlIVHZrRllvOW9jNVNhT054Q1RRcVFHUGdYaWpi?=
 =?utf-8?B?RzFnVWo0RXRpODVBc1dyV3Q1T1Rxb0I3RjJxWTMzd3gwYVJoRTg2VWl4Yml4?=
 =?utf-8?B?bmVvaHBINXAwWXF4dUZhMDFHcWRQUytVTFlkclJzenU3NmphTFErcWpGOTJv?=
 =?utf-8?B?SXd4UkVhYzdHMU9TNWxQNjZwN3VEZzhTR2EvQ2djTmllb3V6bGpFYkZRRy9u?=
 =?utf-8?B?a2ZiRnNxOCt4Vkc1M084UGNsZjJNWlZDRlE4SjdoNys1TzYyTURMTDg5eXJw?=
 =?utf-8?B?RWltQlhZL1JZWUZVTk4zSGJyM1FHa2xiUTk1RGY1RkhYRG1HQ2hUYTNtR0Qy?=
 =?utf-8?B?Y2h6NGkwc00xM21Ycjczb25TNU0rUUswSE9tdnZZa1VHYzZNeU5zK1VBRG41?=
 =?utf-8?B?TVI5enZvb2pGRloyU0JwVWExUDl1dFhucE9KOFBZSUpWNU5xWXlHOHRwRU9i?=
 =?utf-8?B?UzBTZnVBNFZyM29yT0JQVUdHR2I0U0tRMjhaVHMvM1dQVTRrSVY2c0RIUlJV?=
 =?utf-8?B?OUQ0RUVUanM2RXQzL3FVMWpPcysxd0pvd3ZFOHBZZzREcFNYUGxrL05ESDVE?=
 =?utf-8?B?dEUvVWViYVJhQnBpK3ZoMlhSOFhRM0NrUzgzbVdHT1Rwb2k0Z0xLZUovVWdB?=
 =?utf-8?B?VEsxMGdXU2RtWjZ3Nldmb3doeldKNnRJK3BwLytGQ1pNYTdNSW5uaWZvUks2?=
 =?utf-8?B?bUNGdlp6dWgxU3pDakFwS1ZsaHhQcTZUU2RCU2dYeko5SFlkR2E3amZEYUpU?=
 =?utf-8?B?RDF6TWZlNklFOEFDVWFwWHRjcFJlZ05sVGRJdUJnWTlHM1haOWRpOWlHNnNP?=
 =?utf-8?B?bGVKSEZOTEI2QzNGRCs0RHBPQTJtTmpqMzBjOEluK0huNHR0NmJLZnBxVUdU?=
 =?utf-8?B?V3l0Z1lrUk85YTVOSWs3OXpmRzlScllyeVRnbnVFS05vMkk4bENZOU04dXcx?=
 =?utf-8?B?aytWWWxld1VrV2U5VEdPVTlHamlJc0IwcU5LdCtjaHM0SmVZdU9qQTFiV3VB?=
 =?utf-8?B?dUQ4cDllZWw3WEhJWXZzSjVBN2VMSk9rY2VlTjlWWXF2YytYK3RCaHpWSFRq?=
 =?utf-8?B?SkJnTWNFZE1oM0dsUEpxNzNSTUNjejdjblk2NktUdUZuZGRwZ1cxVS94dENG?=
 =?utf-8?B?Z25xdjZJOGloWHFmUGx2U1RuQmdONzdZTEhSUjgydnlPazNMejV1QldENVd0?=
 =?utf-8?B?NkovaVVUSVp4ZTc4YTRqVlIwV2RVS21Dci85OWtiblFHY0NiNWJBTTdUYTRN?=
 =?utf-8?B?Rmp3VFdkaHlPN2lXWmxSb3h2UWM3cDFybUYxTVREUjFHanVyUFFzaXlraUpC?=
 =?utf-8?B?bmcyZ3hBZ0VXQmIvRlUyeHlrWEk1NEp4V0JtcWpzRWxGdXZNOW8zWTBMYkpE?=
 =?utf-8?B?Q0E5UzJ4ZmZpMTJnM2UvNlJKODVCK2Nlb0NTa1prY00ycEtUNjVXNFdTR0RE?=
 =?utf-8?B?Y045eGVVTDUvc2ROcFdOS1VkZ1hXTVdmTzdEY3pJN1AxNnQ0UmI1ZkhIeGVR?=
 =?utf-8?B?ckhyNlR0eXNsSDM2LzlQRjRZaXF4UkZyVFFudXFBdExlVkZDWWwzcGovYXhP?=
 =?utf-8?B?Q05tVzJUTmRxQ1pPbitWY2ZuUC8xeHI3bkhjYm5wRGNCTWt0c1RVTUZINEta?=
 =?utf-8?B?SVBoU2UyVlZSb05jd0xwK2FpKzZHR1Eva2ZHQlQrM0l2TVl3ZVF5aVplaCtR?=
 =?utf-8?B?aGxGWnZGeWcybk9uTWRNOUNTUDdEUXBPSWxFUXN6TExDcFJPUzVVdmtQSDA3?=
 =?utf-8?B?dmVuVlFVV0hRbG41emZXSEhMUm93RzJwOFJwT3A5U3NoS3Bqdzd0WUk2dmJP?=
 =?utf-8?B?RGtrU1gvSFhFUlJVZldXdGpUdUNxdWVJcFlpdzE0cnBubzAzWktlN2dlVzV3?=
 =?utf-8?B?WUNGT3IyeTVXUFZKOVlLb0J3VWl5QkJYZ3FuOEhKbUd1aVdXbzBLcUZFaWEr?=
 =?utf-8?B?b1E1ekh6endWaXQyN21TbFFReG90dGxkSkFzaE1meWhFYm9jRlhIcE1mdzFQ?=
 =?utf-8?B?R1JUMC9VWmpDaTBadW16MGZ6SDRvcHdFTTFkNm1pT3BuTmYxWHMyRlFydEQx?=
 =?utf-8?B?Q1lXdEFXakNlQjFNWU5jQXNkeU9vaC9Yb3orajF2QmN0SkpUcnhHSituNVdr?=
 =?utf-8?B?QWVkZDh6eE4xSzYyUFRGdG02bCtzMGZFRkRWVjNWOVE3dmhDcW13WHpRaWtW?=
 =?utf-8?Q?RcL5ZLSpYrQhJ/Ebic?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097b66db-a6b7-493c-6017-08de6b659702
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2026 01:08:40.2130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRtkXeIXcBcGn48uLcFRF7119oDToRBpJe0QFXkUBRN9ZqQJAgY8LeW+U3SfnKgpZJc2OXSHG1sR1brj/oBHow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7702
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[analogixsemi.com,none];
	R_DKIM_ALLOW(-0.20)[analogixsemi.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xji@analogixsemi.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[xji@analogixsemi.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[analogixsemi.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,BY5PR04MB6739.namprd04.prod.outlook.com:mid]
X-Rspamd-Queue-Id: E6EC713A890
X-Rspamd-Action: no action

PiBEdXJpbmcgaW5pdGlhbCBjaGVja3MgdGhlIEFOWDc2MjUgYnJpZGdlIGNhbiBiZSBwb3dlcmVk
IG9uIGJlZm9yZSBzZXR0aW5nIHVwDQo+IHRoZSBUeXBlLUMgcG9ydC4gQXQgdGhpcyBwb2ludCwg
d2hlbg0KPiBhbng3NjI1X29jbV9sb2FkaW5nX2NoZWNrKCkgY2hlY2tzIGlmIGl0IGNhbiBkaXNh
YmxlIFBEIG9yIG5vdCwgaXQgd2lsbCBub3RpY2UNCj4gdGhhdCB0eXBlY19wb3J0IGlzIG5vdCBz
ZXQgYW5kIGRpc2FibGUgUEQsIGJyZWFraW5nIG9yaWVudGF0aW9uIGFuZCBIUEQNCj4gaGFuZGxp
bmcuIFVuaWZ5IHRoZSBjaGVjayBiZXR3ZWVuIGFueDc2MjVfb2NtX2xvYWRpbmdfY2hlY2soKQ0K
PiBhbng3NjI1X2kyY19wcm9iZSgpIGFuZCBhbng3NjI1X3R5cGVjX3JlZ2lzdGVyKCkgYW5kIGNo
ZWNrIGZvciB0aGUNCj4gcHJlc2VuY2Ugb2YgdGhlICJjb25uZWN0b3IiIG5vZGUuDQo+IA0KPiBG
aXhlczogOGFkMGY3ZDJlNmZkICgiZHJtOiBicmlkZ2U6IGFueDc2MjU6IGltcGxlbWVudCBtZXNz
YWdlIHNlbmRpbmciKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnku
YmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+DQoNClJldmlld2VkLWJ5OiBYaW4gSmkgPHhqaUBh
bmFsb2dpeHNlbWkuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbng3NjI1LmMgfCAyMSArKysrKysrKysrKysrKy0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMNCj4gaW5kZXggYzQzNTE5MDk3YTQ1Li4x
MTU3YTU4Y2YxYjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW54NzYyNS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54
NzYyNS5jDQo+IEBAIC0xMzYzLDYgKzEzNjMsMTggQEAgc3RhdGljIHZvaWQgYW54NzYyNV9jb25m
aWd1cmVfaHBkKHN0cnVjdA0KPiBhbng3NjI1X2RhdGEgKmN0eCkNCj4gIAlhbng3NjI1X2hwZF90
aW1lcl9jb25maWcoY3R4KTsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgYm9vbCBhbng3NjI1X25lZWRf
cGQoc3RydWN0IGFueDc2MjVfZGF0YSAqY3R4KSB7DQo+ICsJc3RydWN0IGZ3bm9kZV9oYW5kbGUg
KmZ3bm9kZTsNCj4gKw0KPiArCWZ3bm9kZSA9IGRldmljZV9nZXRfbmFtZWRfY2hpbGRfbm9kZShj
dHgtPmRldiwgImNvbm5lY3RvciIpOw0KPiArCWlmICghZndub2RlKQ0KPiArCQlyZXR1cm4gZmFs
c2U7DQo+ICsNCj4gKwlmd25vZGVfaGFuZGxlX3B1dChmd25vZGUpOw0KPiArCXJldHVybiB0cnVl
Ow0KPiArfQ0KPiArDQo+ICBzdGF0aWMgaW50IGFueDc2MjVfb2NtX2xvYWRpbmdfY2hlY2soc3Ry
dWN0IGFueDc2MjVfZGF0YSAqY3R4KSAgew0KPiAgCWludCByZXQ7DQo+IEBAIC0xMzc4LDcgKzEz
OTAsNyBAQCBzdGF0aWMgaW50IGFueDc2MjVfb2NtX2xvYWRpbmdfY2hlY2soc3RydWN0DQo+IGFu
eDc2MjVfZGF0YSAqY3R4KQ0KPiAgCWlmICgocmV0ICYgRkxBU0hfTE9BRF9TVEFfQ0hLKSAhPSBG
TEFTSF9MT0FEX1NUQV9DSEspDQo+ICAJCXJldHVybiAtRU5PREVWOw0KPiANCj4gLQlpZiAoIWN0
eC0+dHlwZWNfcG9ydCkNCj4gKwlpZiAoIWFueDc2MjVfbmVlZF9wZChjdHgpKQ0KPiAgCQlhbng3
NjI1X2Rpc2FibGVfcGRfcHJvdG9jb2woY3R4KTsNCj4gIAlhbng3NjI1X2NvbmZpZ3VyZV9ocGQo
Y3R4KTsNCj4gDQo+IEBAIC0yOTI0LDEyICsyOTM2LDcgQEAgc3RhdGljIGludCBhbng3NjI1X2ky
Y19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xpZW50KQ0KPiAgCX0NCj4gDQo+ICAJaWYg
KCFwbGF0Zm9ybS0+cGRhdGEubG93X3Bvd2VyX21vZGUpIHsNCj4gLQkJc3RydWN0IGZ3bm9kZV9o
YW5kbGUgKmZ3bm9kZTsNCj4gLQ0KPiAtCQlmd25vZGUgPSBkZXZpY2VfZ2V0X25hbWVkX2NoaWxk
X25vZGUoZGV2LCAiY29ubmVjdG9yIik7DQo+IC0JCWlmIChmd25vZGUpDQo+IC0JCQlmd25vZGVf
aGFuZGxlX3B1dChmd25vZGUpOw0KPiAtCQllbHNlDQo+ICsJCWlmICghYW54NzYyNV9uZWVkX3Bk
KHBsYXRmb3JtKSkNCj4gIAkJCWFueDc2MjVfZGlzYWJsZV9wZF9wcm90b2NvbChwbGF0Zm9ybSk7
DQo+IA0KPiAgCQlhbng3NjI1X2NvbmZpZ3VyZV9ocGQocGxhdGZvcm0pOw0KPiANCj4gLS0tDQo+
IGJhc2UtY29tbWl0OiA0MDBhODRlMWY3YTM2ODFlZjI0ZDU4ZDQ5YjVkMDdlODFjMTRmNGU5DQo+
IGNoYW5nZS1pZDogMjAyNjAyMTEtYW54NzYyNS1maXgtcGQtNzkyNjA5MTMyMzMxDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQoNCg==
