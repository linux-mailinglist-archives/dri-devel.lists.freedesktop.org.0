Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88315968212
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 10:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064B310E257;
	Mon,  2 Sep 2024 08:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="T6JwRSbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416DD10E257
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 08:35:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIFwHmBOFQcro3C4VS+zxc2qIQuIMlyZgKiNr3RbVRJGVxGgfNeii/E4nrqH02qoS3STtDsgGAUNY6I++LRPhJiRF267nqwWRVuQHGb3tWxDKwEgExpRreGXB/aT2B6E+67HNLXpYApbMFguyy9CpfnyjsaKvn3k8VprT5/uzOdizkTvfsxX4NM26PvMCU7bePWKhDb4RNJba81dExi5L0Jkb609RHAMARmtdZxV4uCClaoH0SpJfkjktvwK07N+KoMvlCc0MpfojTxcDiqppOpBpxAL6slD0bnlZtA07yoVQUnk7kfbnJrnPsrqhVXzJWkk/8TdQp8hISi92xHafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQPE8zdDE71ejZiEApuxVUit+/xkFcVoPYnpZq9fLCY=;
 b=Bdy/zG4mbVXUW6pm/RvxR3e088T4Gi8ky6KWGz5nyeoHCYe+DFhs/GFIN4xhZTL2glqXOcY8HaH/7N9bGKRqUTUhs2NDlDyF0XGLRSeCgk7UzTTLitgWt+wf6XpMILMyRIpVzej8DaEC5Gv0CFxmY1/d1KszDYqkWTTATBeGeXfXQp7m5ljozqJdpOyP8K3vpwHhvITJSxKZcMH3b3oA5vjLXjAsOniPABWZ6ZHpgnG1lYpzzrSDni5JIioDtZtDzwst+4paaFdKkX5xHh0qJV2v2pArmXBy+oVLqN8/dqYuxkGZ8DNWufFHKaj1xNPfkqKm4KcHgaISAkpH/amg/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQPE8zdDE71ejZiEApuxVUit+/xkFcVoPYnpZq9fLCY=;
 b=T6JwRSbtr4w4RJL8EPj1AUV4bavT7Yy8+2OCnyU0MVdnLePurLKAWV5QPudHIGFj4kU/ty1R4fcdja0m6K8M3RorkJCTMqRt64qa+GXi11jmLFjUOoX2s+Xx9pGvP7qQHwvGZGo0xZ7nRP3jJvBtjU0RX5shbq/+1aDQZlO4Y80LcQXRVou6vh+rEunsFt+HhJlCqFeo+7UgXALqbzyc+jatqCxvnpX8qv3aWExeORRqdhAh2zkDOs6avub1blJGEAyD6Kh855O+eV7gh1fB0LqzHlMPRYzF3BrPER1ZDsOiQZHh5g0dfYNqPfZoKD4z9ytv0Q4s4xXAr+/nDaPdQw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 08:35:23 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 08:35:22 +0000
From: <Dharma.B@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <Manikandan.M@microchip.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Hari.PrasathGE@microchip.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/bridge: microchip-lvds: Revert
 clk_prepare_enable() in case of failure
Thread-Topic: [PATCH 1/3] drm/bridge: microchip-lvds: Revert
 clk_prepare_enable() in case of failure
Thread-Index: AQHa+Jv3E6nmCX7dPEKp0MFBmfquabJENOEA
Date: Mon, 2 Sep 2024 08:35:22 +0000
Message-ID: <666217c6-c113-449d-bdb9-c3492d770c45@microchip.com>
References: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
 <20240827161223.4152195-2-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240827161223.4152195-2-claudiu.beznea@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|LV8PR11MB8485:EE_
x-ms-office365-filtering-correlation-id: 0e9c0a7d-2b71-46fb-53a7-08dccb2a2fb4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?aTdCRDRxYWk5aUFuMFFWWTgvMFJReHc2Q0M2UnVRWWMrODlrRUlQb3BHUHcz?=
 =?utf-8?B?cWloVjlGemNtYmZkMjZDRGx4TzN4ak5DMVBuRGtDMjF1dWtObUJZdmZLMGhC?=
 =?utf-8?B?c1pkcUZUQjY3UnRmSEt0RmI1d2ZCc2RvUzJBREY0YkhIdVMrZko5QlJCQW9E?=
 =?utf-8?B?bzNhT2VKOVlDTHB5bXNnNXY4Qk8wRHc1dnUyM1JTdkVuOG5sVkZzQTBiUUNo?=
 =?utf-8?B?US8zSUlqSnI4bkhXUHM3VGE2WlpISHBZUGlaaHR1a0Q0eDNnQkNVUFZhdDUr?=
 =?utf-8?B?OHJUZlpzY0NTdWJkNTdRMVptWjE3NWJza3FhalU4ZVVZT05Ma1ArZ0w0Q3dW?=
 =?utf-8?B?b1dLTTVPalNXTTRlR3l4R1ByWEYzRHZpbGYzL2lqL0FzUEg2djhoeS9HMjkw?=
 =?utf-8?B?bFV2RnBDbk1BYjdicmNsdDJucjR3ZjVkS3h3eFZ5QlJhVG4zS1FyUTY3cGVt?=
 =?utf-8?B?dVdWNzFOQy91ZFNKNDdmejZxYlZIWDh6RllRSkNnRFplS1RjdCtIaHlRSkQ3?=
 =?utf-8?B?RGtmQjVLVGZBcytJSUV3cVpuU0xnaFozNUpJcHZtNzlHNXhqZlRqU21rcFVS?=
 =?utf-8?B?LzZxZGRQQlhTN2VrU2pDV1c4TzZOVmk3WTBQYnp0NncwZmVGM3RYbGJQMEts?=
 =?utf-8?B?MjNDb2wxeEN3eERhcFg2VzY1QjVsR1V6MGM5c3NLVTg3NnhmM05MYkhhZ09W?=
 =?utf-8?B?Nm5lTVpiWCtSdkp0eENqaG1MNUxWNnV0THhBTG1yK1RRRnowaTRHbjFNeVo5?=
 =?utf-8?B?dUhFVUdxTThhYnI1K0VIdE03K1NRV1J2YkNTaUZjQkU4Uk53elNSL3Q3c1hl?=
 =?utf-8?B?d01ja0gxMzRxWTcrMkRVdkNPc0tmMlZHOGRnVXZwVENxdEdZVlArajBraUFq?=
 =?utf-8?B?dlVheEw1TDA4V1o5YllsdVFuYjViREZxd1d4dnlmczNFa0dKaEExem1JQXla?=
 =?utf-8?B?bVd6TFU2ZTdZckwvTUV3cWltd28xMGRFNFVJWmdLYmYxQi85RWMwZ25VYTVE?=
 =?utf-8?B?VTEwV1hXN0lmT3JUY2JCbFk0MWMyLzM4WlZXU0VySlJ1T3RMekVjL2NNU0JY?=
 =?utf-8?B?SGhCQktnR3BER3ExdXFjdUxRY0Q5dWVjWmhVN3FxcW1lQ1RqeGlIK3lUSWZa?=
 =?utf-8?B?eGgrR0JES1dYR25ZQlluRGtud1RYMFlGYUk5eFdzaEZWMkthdU9wbUlVdXZh?=
 =?utf-8?B?YzJGK1VNTHYvT2FwWmIwUlJleGpRZjJ4Y2ttODN0Q2NiNzBQK3VwbkdFRU92?=
 =?utf-8?B?VmJLaUQreVArWkhDUEpoZW5xWFJHSHplQ1ZId3dJRjZuSGo4RUx6S0dCUFVz?=
 =?utf-8?B?WVNzYlpuSHpSeTZXSkttZUUwSGFNYzN0MmdTeXBvd2h5VjZ0eEJYNU9kVzBo?=
 =?utf-8?B?b3d0bTgvbWM5VTIzRlRZLzZpZmJHUXB3UVFqeXZyVk53aStVbTBnYUc1WVVC?=
 =?utf-8?B?M0RoVU4xTzVsM1RyT1J2WFhWcDI1ZDlBUHNuNUw3a0lqWEpUWVlTbExPMVgw?=
 =?utf-8?B?ODhDQmtHZmVrdFk4Vkl3Y3ZYaXdiVkNONnFYd21sUHZSQU1rNXFPbHg0SHlt?=
 =?utf-8?B?WXlzOGN5YlZMQlVHeGljOFEvTm9GSnhPSE1ib0h0eEp3VkJPdWhYMEw1SEg3?=
 =?utf-8?B?YXlya1cwTi9BbGcxQ0Z6NEhaSzNnZEZnVnl1SGhtZjBOOXc5MG9RT2MzeEND?=
 =?utf-8?B?L3VwanZBV2xnNG1XZEpzS2xTSERSdVV1cnZQcEd1RThUTGNKd1dYYVh5UlRk?=
 =?utf-8?B?bXBuVWNML2ZlNDgrT0s3WjdVTGlURnIxNkxoTVMyWFdIY3Q1Y05vQWlVd2ZL?=
 =?utf-8?B?QTNaVm5oaWZDUEZwU25mdkt4ZUhsZWVZSm1wa3ZyUWcydFJiNjliL2pqV3Zx?=
 =?utf-8?B?aytHZjR0Umh2WWIrNXJ1bVBZRm9HZlF2dXNRM1NvZWJwb2hFRGRTckxtYnBS?=
 =?utf-8?Q?7vuxrCPvqQU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWY3ZzdEYXlKbjFqS1VzMFZGaGxiVzFGbTRTN1k5THVNbi9STFZtbDdKUWh2?=
 =?utf-8?B?ZHE4UFlaWnBTTlMwZ08zVzNHMWRrZ1dMYXhyZTVjT2xRdlFLS0RnQkl5eVQr?=
 =?utf-8?B?WHBBaDF6QTFxdHcvcGtBdzV4emg1VlVkVGR5WnFZRjJBcjJBWmF4K2pSdWhF?=
 =?utf-8?B?U1dRbnFOWG1NZTN3cEVBSGs2N2QyRDZheXZvc1V6SmU0bmpwMTczR3VkaGxy?=
 =?utf-8?B?RjdvbnhXRkZsVDA1Q1U1TDMyaUd6MEUxNmdlOTlRcVhGQWYrRlVFMWlqc2dQ?=
 =?utf-8?B?QkRNSXVXU3ltYStUYnVCTUcwMVJkeU1WMXhJM0I4QUo2MzAzTlJUSERCVkNX?=
 =?utf-8?B?bU1hWDJ6R2JocWpTUVAvZGhJNWkzcGwvZkhmVWFGYVNEcHZqQ0V1aUMvdWR1?=
 =?utf-8?B?NlB5T2lmWnVSSHJ5VVhsL1VnVTBvdERTQkFuMnVPdmUxZnVhMW5JM3kxb0lD?=
 =?utf-8?B?QmlmMTRBYThBbGtwM3JBU01CSkplb2FDbWZ5dllDb0VXRUZBK3BFaGNnV3lW?=
 =?utf-8?B?d3ZpODlDYWFHMGZtSDZXQUMwT0hLeEsrTFl1Z2Rzbk5MNTNSV0ZReUhrYnUv?=
 =?utf-8?B?Qi8yTHhZUmRseGVyYmI0Q1c3TXFuYU5NYzZQbW5KaG04TlduMmNwTXpSUnVW?=
 =?utf-8?B?dkx0WW41bVlSRk9jd0p6OXVhYzhoejkra25vdlFMMHJPUjZDLzJOMFVZa3RZ?=
 =?utf-8?B?eVdXeFlLcER6WWhJMGowVDBQd1dKdWt0Q2ZIeXdWZ1VFNGJRdmllS0IwUmIy?=
 =?utf-8?B?N3JBYXNEdGlWcldLbnRHN3NqRUw1d3V1Skc5dk9CSXA0Wm5tMkFxL3VTY2sv?=
 =?utf-8?B?cnh6ZWN3VmxnRlpmRS9PVklOVlB0UktQTG5GUUpCejBWaDdZYVdHbm8rYUJF?=
 =?utf-8?B?akxNN21jaEovVjhhMVVEU0wzUmhoeXJacW1UUWp5NkkzU1ZzczYzUDFrd0Vt?=
 =?utf-8?B?NDJtelN2K1pWWWhWQ2ZubjFyV3NtNmlKT2RqQnVmUFNJVTBaQjVvNVczMklx?=
 =?utf-8?B?YzVFbU0rZzU4YVE3NXRlM3FZbUhIaTF0ZmxONUJCVVNFLzI2UDY3TThlVU5O?=
 =?utf-8?B?aVgzOUJHREp0MHI1N3dRbUpCQ0NSbHN2VmVtbVlqa3IzdFZmYnZGVmwrSjhq?=
 =?utf-8?B?OXozQ2ZGQ2JoR1lNSkFoRmp3NFhJMHRhS0hHSk9TK1dIRUh4TmpTV1A3amV5?=
 =?utf-8?B?NmRoVlRBUlVkU3k5WllIRHRUVFFKVUNraFBRSUlCeWY3ZjhMVXNjTlJhRndC?=
 =?utf-8?B?SkRSTHRvSEpMRHdleUtqSEtHOFpMM0tnWS9JNnY0NWdBUkJmeXBiZXY5VTNj?=
 =?utf-8?B?WXRNYzNXTm52ZWdoSHcrcVI0dnJZUjBILzBlL05XNVdRVGFHbEdGZ2JsL2FH?=
 =?utf-8?B?UHc3VnA4bHJFNGtXdTVGaXZmdjQvVFVkenBFVXpqazVJTWN1bkMrcDJlbGJX?=
 =?utf-8?B?QmY0RkMvZFZ0QlY3OTE4S2o1Sm12UkdGV1hhRHQ5bjRmUDdZK1pDZGYvNVN6?=
 =?utf-8?B?cHVtRkUwckI3cSthU0NiWmxUZElQWW4yb1NNSHZRV0RhbXlVRU9yS09Ock1a?=
 =?utf-8?B?REhrNCtXSWRtOURodUJldlRHSHV0R3l2VW5TZDM4V1hNaVNpV2R0T1RSSlps?=
 =?utf-8?B?WWwrZ0VIaU5sOVVwV2FTR2VzM2pVclZFMTdvOGVFdSttS3Y2dHpvdVRXZUh3?=
 =?utf-8?B?UVNSSm5wMGhBaTdqdTE0Z3NlMmFOOUNXLzAyTWFvTi9BczZYTVp3RWZZaWFY?=
 =?utf-8?B?ZlhmNTZrZ25WK0JFeVFzNGtqeHRuM0RlM2NIUWkvbStDbWlxWDh4M291bFl5?=
 =?utf-8?B?M0VLa0pKQTF3eG5FdWg0Mlh4QndaNHkrcHZEMit2NWtjUkpBK2tHbW1Hdjkz?=
 =?utf-8?B?TFkxYmFPVEdvQmNTTFUzSjZsWW1QdGEreEMrUWpmMXhCL0E1MTlqYUNmd21F?=
 =?utf-8?B?N213cnRjazc3YWNkMnU4RjRRYXA3QzV2ZFhWTStaYkJCVVNHTWw5bjF1ekZi?=
 =?utf-8?B?a2NqSHRDR2ZmZTBRS09EZy9ra3hWR2ZPUUpLVEJwQWVkYndySnZEd3FPazVP?=
 =?utf-8?B?UGZKTWRhQkIvcFJmMi9pM09VMFBSSDhTVnFLYmg5SmtNcVVuTSt5UndBYWtN?=
 =?utf-8?Q?5W09E9zLCbCAja1ey5eJXJJxf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <810ABFF39E821D479C3CD0E200E704EC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9c0a7d-2b71-46fb-53a7-08dccb2a2fb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 08:35:22.9116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBYAnxRcFpHTQ1hNf7+hzrWePZO0HOUUgiSwc8Sez5M7UgjCGzxFItaH/lRsx6ftOpdMSaWVvmJh+EooFQ+jVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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

T24gMjcvMDgvMjQgOTo0MiBwbSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSW4gY2FzZSBwbV9ydW50aW1lX2dldF9zeW5j
KCkgZmFpbHMgdGhlIGNsb2NrIHJlbWFpbnMgZW5hYmxlZC4gRGlzYWJsZQ0KPiBpdCB0byBzYXZl
IHBvd2VyIG9uIHRoaXMgZmFpbHVyZSBzY2VuYXJpby4NCj4gDQo+IEZpeGVzOiAxNzliMDc2OWZj
NWYgKCJkcm0vYnJpZGdlOiBhZGQgbHZkcyBjb250cm9sbGVyIHN1cHBvcnQgZm9yIHNhbTl4NyIp
DQo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5k
ZXY+DQpSZXZpZXdlZC1ieTogRGhhcm1hIEJhbGFzdWJpcmFtYW5pIDxkaGFybWEuYkBtaWNyb2No
aXAuY29tPg0KVGVzdGVkLWJ5OiBEaGFybWEgQmFsYXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3Jv
Y2hpcC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2
ZHMuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2ZHMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2ZHMuYw0KPiBpbmRleCBiODMxM2RhZDYwNzIu
LjAyNzI5MmFiMDE5NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNy
b2NoaXAtbHZkcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2
ZHMuYw0KPiBAQCAtMTI1LDYgKzEyNSw3IEBAIHN0YXRpYyB2b2lkIG1jaHBfbHZkc19lbmFibGUo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4gDQo+ICAgICAgICAgIHJldCA9IHBtX3J1bnRp
bWVfZ2V0X3N5bmMobHZkcy0+ZGV2KTsNCj4gICAgICAgICAgaWYgKHJldCA8IDApIHsNCj4gKyAg
ICAgICAgICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShsdmRzLT5wY2xrKTsNCj4gICAgICAg
ICAgICAgICAgICBkZXZfZXJyKGx2ZHMtPmRldiwgImZhaWxlZCB0byBnZXQgcG0gcnVudGltZTog
JWRcbiIsIHJldCk7DQo+ICAgICAgICAgICAgICAgICAgcmV0dXJuOw0KPiAgICAgICAgICB9DQo+
IC0tDQo+IDIuMzkuMg0KPiANCg0KDQotLSANCldpdGggQmVzdCBSZWdhcmRzLA0KRGhhcm1hIEIu
DQo=
