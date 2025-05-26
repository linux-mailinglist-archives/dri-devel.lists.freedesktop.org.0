Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C8AC4321
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 18:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B5D10E32E;
	Mon, 26 May 2025 16:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VWWQ2qpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4767C10E32E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 16:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWmFnUmAE4FWjEvn3sx0YYDbbJR+t1OIElxjhXXvQPHxq07JLsH5vbZq5nWKfqTDD189pPSZXRtguTEbjyEN4D0tKEQJqSGWOlrD/SU4djLmG1aiKuDRgYwDzXV2x0rC+BHZ0cBWd+12EMLaT7rVO7uv5YQzjA8IIRWudEU3DBChsFMi7qMBO9RnVV2yuFGfjCSZ+q9wWUnZVl23Lk/ljX9kcX0K3QqrfaZML4pMp4HycbfY3eUSVAcU1H31HrOt32oFTvraDtorpFOK5AX7VfICPrJs3CWe4HUbQGefUtLtOUTlgUB7YcucxGA+gdOadU7X0so+v39wMVke7Qu0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rV8px/pPwO20P6yizli8DekJk731OyGBSGZaaMNn77g=;
 b=b93iyzV2RQ9GpPYZYznWrGU0lH8mW6Ss7KJB0m6kkg9o35YyPlVO2rUIAxjRNMx1l0cyHbGaEsPPoH4kk79Y91FRh6OxEFKolelOt3cpAcBsFu8wNyLPiSGkDOio3O6Zq86jbZnb48fA+vScjVp9nQDhJg7a98UJ11VjvLJd0w9qa2Xm2iGjPTS6iTCkl6FVgmWxYjEUPATPsGamxh34sbkzSdejt4GjL98uvUH0IxBO/6CN+0qF8R5HRm8qcfKgFmXwVqCfV9cgeBo/3/iegH3JDys/6EEYsY22wC4+HHV1Uc5cROOA4LJiUXroLVsMd0Tkqj7lgnjRvqTwPk2CsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rV8px/pPwO20P6yizli8DekJk731OyGBSGZaaMNn77g=;
 b=VWWQ2qpKqZtQFaY+dS2qCwm05SCWe492PAgt6qHdA4dl/sjn0R18ueI4KSjAK2J9sprbabZVfS+buj8okRE0hcxCExgSxaV85H4OyreRgbdFio8BnoTHeudINMn4KrQOWbC3ayemfAWc57/YDcuMqH6tPmFL3NVfbai2Dp6niaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10358.jpnprd01.prod.outlook.com (2603:1096:604:1fa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 16:43:33 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 16:43:33 +0000
Message-ID: <f93bb774-157c-4514-b7e3-d28d0866ad25@bp.renesas.com>
Date: Mon, 26 May 2025 18:43:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Ripard <mripard@kernel.org>, tomm.merciai@gmail.com,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Adam Ford <aford173@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
 <20250526104902.GB17743@pendragon.ideasonboard.com>
 <209ddc02-01d2-4375-afcf-2c9a55fe8fc1@bp.renesas.com>
 <20250526-cherubic-ambitious-cobra-3c6a1e@houat>
 <7603c3b1-edff-4c02-a4a5-1d5f72720cad@oss.qualcomm.com>
 <aec5d09f-248b-4dcc-8536-89b4b9d47e9c@bp.renesas.com>
 <d695e04c-b2f1-41ff-8510-33529bf5f916@bp.renesas.com>
 <20250526142808.GR17743@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250526142808.GR17743@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB10358:EE_
X-MS-Office365-Filtering-Correlation-Id: f0365649-56f5-4b59-23a6-08dd9c7473da
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkhOSk85RVEySEtrbVVvNk5BQTlGbC9ER3BQMXBWMGhQWEtBUU5MMDZENGN6?=
 =?utf-8?B?TlNzNWM2S3FuRU1hZGw4UGk1eVFzbGVTbStIakY3NmVzNzc1ZGFGeDd2djg5?=
 =?utf-8?B?U1FaemhLSkJaUE05d011QWRzSmJCcmg2aVpLNlFlVHJCRU92Q3VhQXU2SjY5?=
 =?utf-8?B?ay80ZU5JNUtrYUFHaFdqa082dTZvbFprTld2dmVXQnJxS1ZPWCtOU2o5NEEz?=
 =?utf-8?B?RnAvMjYzUHl1WDRoQlVqWEZ5U2VwNFV6SCtsVWlyNFhFMWl3U2pnRlRmQkEz?=
 =?utf-8?B?d0k4b0FMVlg4NitZcWMxZjVDb1ZvWUJ5Ykl5SGJFNmZ6TEhJbmx1OXh1QXNj?=
 =?utf-8?B?Z29YTlFCYnRudHlHZUdWREJqQlhHZXcwb044S3JDMU8yZlZIZlFHVzh1V2Iy?=
 =?utf-8?B?c2xqamFkMy9hNkZkTmlJekVNaGlPODg3MG5jdlBFZUQzbTNhOC9vUkYxOWt3?=
 =?utf-8?B?TVFkekhidXpGY2RNdkJaN01kWThKR1hMTlZtNnpZSEpxcVpkWko2cFBRUitL?=
 =?utf-8?B?TmNQTUt1bmEyUk01dktwcE9NZ1VqTU9MSjFiaFI2aGkybWdNdlhJOW9TQ2c2?=
 =?utf-8?B?Y2E3NUpUMVlpMGpqbjllV1JjNkplMnZxY3RkdVZsSW5FbW04U2l4dGdLS3FP?=
 =?utf-8?B?djhUNnlaZHArOVkwWlZybWlQQWxsc01pMWFWQzdkbVRzVHo5dzRacDVHSStx?=
 =?utf-8?B?aWxYcVlKYjJ6eUNuaHFCY3J1ZUtYbnZiRlB0U0JGcERNcHVzMGhOdTF0VUFa?=
 =?utf-8?B?ZmxHVmdqUS9OeUFGaWNJTnY3dUU5WjBRWHNBNTQ5TDNTSVhHdDNLSGxVbmRD?=
 =?utf-8?B?dnhtbWhnS1FqWDVhcFB1cE45L3ZhbWZqdys1MG5kVGh2TVpJZmh2T1pVMCtT?=
 =?utf-8?B?QUIrbWYzM0pDNTluZnRkSGp6eFZ3NkYxekhReXpyc1NWK1JJSVp1QkwySFU3?=
 =?utf-8?B?WnBFUHBiNnZXa1dDdkFwUjVoc2ZkQVR4YmVHUE5ITDliTklIc2JuTWJVSG92?=
 =?utf-8?B?aFJXdHIyZSswSWgrMmZzWVNmWEFGTlM4Z2RIZUtYNms5dkl4dE81MEtjVU9X?=
 =?utf-8?B?RVhmNGNPckhrd25BaFhJT21WcExwY1hQcDZtczRxZUVZRFdSakYvclI3MHJ3?=
 =?utf-8?B?WGhaY3JQZzNPSzNZdFdPVW5rbG5WNkJ1emkxbWdkRW54NGZENG9JRGp6aFlR?=
 =?utf-8?B?aG5BMzduM1M4ZG9XQXFSQWY3U2U4UmY2UUxyYlpKdWVOV1VNRFlWbWhlS0l3?=
 =?utf-8?B?emhXcVIvZnY5OWp1eTNxaDc2NlM1ZHVXTk14aEJsTHhPNnBoSC9kY1loV2pz?=
 =?utf-8?B?NHRJc0pNZWtkWm9iZEEzOEZacWFqS1ZKb0Nyb2pCSlN2QkxnMnAvK0ZCemxH?=
 =?utf-8?B?VTQ3MVhnWkxkK3I1dlBocncrRThwYkd2cnlVcHpKL1JZMUl5aVQrQjNlTjR4?=
 =?utf-8?B?ZmtXSnRHTmVHVTVUVk1YZzlrT3A1TzFmaW9PNVhLaERTa1JBZnhIalNKY01j?=
 =?utf-8?B?VjRZSldDQ1kwK2FNdzdvaDJFbU80Qnc4SlBkR1VkMHFUaXAzRGUyZk53b2JL?=
 =?utf-8?B?TG0vV0syamlZKzdjYUsrSDZGd0gwazVBaWRubTQrSkQ1N0lXdnBVTVZ5QWxQ?=
 =?utf-8?B?VFE2c3RVQlZER1pJUkNLNjBNU2l5SWUyd0FOUHVmOVcrNFUveW9OdjY4NHJN?=
 =?utf-8?B?aEo2OGI4RmJ5SXJPVVdhUFlPUURZd0kra2EzTTVwUWxXTXhSQUphM1JOSWVI?=
 =?utf-8?B?akRTaUt6ODNGbUdpcXI5aVdTZTJnaU5NTklXcmZoalM5TEJEU2daYU80OGw0?=
 =?utf-8?B?OEl0emE5ZXppYTZ0TFZSZUEvc0MxMTE4Q3FEOUxIVzRUSlU5aEdLZ2o4YkRu?=
 =?utf-8?B?M0VndG5KYXA4NU5iRkNyOGRRYjBEZGFOM1RuNHgwWUp4Rkg0Nm1KSjJDK2sx?=
 =?utf-8?Q?/blgxhw8a/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEJOb0k1UXlVbFR4OVpGeHFPQ3EvNUFqMG03WDk3YzFHMHVSSDBNdWJxa0Uz?=
 =?utf-8?B?eU8xa0RtaDVucnNwaE5KandwMWsvamI1cFBYdHZtbWNQc3FtOTVHLzNUYnk4?=
 =?utf-8?B?ZFFwb1Z6RU90bEpDRjdZWFVDL2YwQUYvUW9oWTA2VEFrcW9MdFZ5WlpkdEQ1?=
 =?utf-8?B?SDU4elM2d3lUajFDS1pBQy9VMVMzRCsyVUFvVVZHZkp4RDBFYzQyalBxc3Rs?=
 =?utf-8?B?UGc4M01XTVRkOFltSlVBSk5YTkI0S2NEdkxPM1lkaHAxZFV0TmNWNmpwbWNV?=
 =?utf-8?B?U2xZTE0yTXIvWk9qb3ZIZjVpSGFPYTBxem1QeEtnSG1jeTJ5MTRtbGRLOE9B?=
 =?utf-8?B?K3JUNE1lUTR5M2N3d1E5UGRuUmdBZ2dUUU0vVy9ZOFNZazRWYk9DZnFQcHYw?=
 =?utf-8?B?VW5uMWFnTmhMajVybDYvZVpmTzJ3aXIzRVB6WXFMZGd4T1Qreml6a1k0M0ln?=
 =?utf-8?B?OUZMUWpSc1AxbjhkUGJON1ArWlRwVGRLMGdGUDlHSS9pUDNwUWQydyt0S20r?=
 =?utf-8?B?NE5WZjhoSFhNZUhuVjJMZkZrblpoU2Z3UWdFNGhkM0FUS2IxMUd6OE4zZGpH?=
 =?utf-8?B?VjhvMGdybHl5bGprS2FFMFdZUDB6bHl5TUtBTnFuMTF3YlZjQmpPK3h3Wm00?=
 =?utf-8?B?MWxNRFVkdnUranZ1Zzl2NHhnSWxBdEhpVzJBenQwTFp5MGV3UGFFYmE4TjJk?=
 =?utf-8?B?cERGUytwalFYeGV3SWt4VXhBUkVjQmZxczJWbk5IQnVJY3h1OG83RTM0UGtV?=
 =?utf-8?B?a0JEV2UrTjA2Q0pMamRrb1VKVjBqZHFobTRmQkFtZ09taUJoVVNxZm1rWmcx?=
 =?utf-8?B?eGI0aHdLUzg2N2gvOVJsaGNoTEhjWDNWSEh6cUJ5QVptOG9DcXo5RUVuaHVx?=
 =?utf-8?B?MXlXWW52SHhxb1RYWURqWXBsSHJBTUI2ZUx2aXNTZDMwMTYraGFzOEpqQTFD?=
 =?utf-8?B?emdlam1CYUY2b0VsRnNHVG9vMzA3VHF3OUZyYzR5L1owSFBKaHNKZGFueGJx?=
 =?utf-8?B?WTN1VE1VNk84YXZtZkpnTEFxc1JHQ05JK2dJL1pUWFIyK1BEY3BTNzIzWEt3?=
 =?utf-8?B?Z3BOT0JmaFZoUC9PVXFGeXNHbTY4czEzekcybXVMQ2MzeDk1SEM5OEpSWFEy?=
 =?utf-8?B?YWdFQkJ3c0szaWY4cEVzVnB1U1pLNXRuSG43M3N3ZzNLVm9iNjByUFBWYklR?=
 =?utf-8?B?UFFMUjlnWWt0YkRzSXhoQVpqQklMMkhRZlorbVhVV0ZyOG9Ca09NSWlMZ1NI?=
 =?utf-8?B?NHo4aVU1VFBSMld3WW90MjNJcTdOVS80TDYvakN0YXluZGN1TkFURUd0TU9O?=
 =?utf-8?B?QkRZZUxkSDVuMXdlZTdmUk50Q1VEbkhkcTRqdWc5eUVWK1pYb2pOU2hTeDE1?=
 =?utf-8?B?c3hHa0FYemxpZSsyMENQZjFaNGRZdEwvWmhKaTFPcjBZdFVmUTJyS2RXUkVO?=
 =?utf-8?B?WThMckpqSy9pblBDcGk0UkVDcEw4WmhyTWdJdGNuTjZUZDE1Rm5wdm9icmNH?=
 =?utf-8?B?a0t2ODRqdUpUdGV2cUlRMlc5a0gvZXRBVnBZVWNmRk05cm15Qjd4MWNwWXVh?=
 =?utf-8?B?VlQ0V1dCSExkRjBvV2FJMjRQeGcyMmdXV1dqVWJGOCt1TXdnUE9tRTcrZFBt?=
 =?utf-8?B?Z3dBRnJuL2pCM1RMMC8weEZnclBjRFRrVUtEdmwwSlZPdWRmblRCekNRdlRt?=
 =?utf-8?B?dXVDVEU2cFc3MHVXaGtyMTJFUkhsVHVhRTBTWmJUa0FabXI0bHdGaWF5elI2?=
 =?utf-8?B?dkhPcTVIZFU5OFYyTi9hd2xmeVdLblBqMzNOSDJCeEJORkd1TS82bkRtNFZP?=
 =?utf-8?B?N0RIZHhiZ0k2QnFRV0YzUUhnWEJQZklzT2swT3VEMFBXOThtRDVINSttam1J?=
 =?utf-8?B?bFdPOEpNSXA3VUxzeUVsbWlSa09MT1drRFNCTERjTExTUkoveldxVEpZY3JZ?=
 =?utf-8?B?WGM3alJVKzM4RnlOVE0vUDdwQTgrZ1pVQ0JTQzB6M0lxVG1nK01mWkxHYVhv?=
 =?utf-8?B?S01YME9LRjBEWXNNRUtaQWdlM1NmT29Eejd1bEdrckx3NHdOVkh1N3pPRWsw?=
 =?utf-8?B?NG1oa2haRUQvYTVUNjJyZ1FIMFp0ZGdMYWpZd3RTZms3WjZxanpUTVJkMG5O?=
 =?utf-8?B?cDNLQm02WWp2OGNFTWJFemY5MUkzMkhZbi90VGgxMDI3UFBXUXRWelBHUUhy?=
 =?utf-8?Q?g0aAjqWtpY4VZOVatsTETkI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0365649-56f5-4b59-23a6-08dd9c7473da
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 16:43:33.4058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2+xO4+zh+2fDQB7zCuxXwaezAMp/HSHlm4csjOxJywf/KgYHOnrKMJef7oEQ/WW/7nsRoy1VwVjdebzHoh/pXgEAmvVVowMWswr0wiNyeNsRJZuAAApq2pghzhOiqyl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10358
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

Hi All,

On 26/05/25 16:28, Laurent Pinchart wrote:
> On Mon, May 26, 2025 at 04:13:23PM +0200, Tommaso Merciai wrote:
>> On 26/05/25 16:02, Tommaso Merciai wrote:
>>> On 26/05/25 15:18, Dmitry Baryshkov wrote:
>>>> On 26/05/2025 14:40, Maxime Ripard wrote:
>>>>> On Mon, May 26, 2025 at 01:19:23PM +0200, Tommaso Merciai wrote:
>>>>>> On 26/05/25 12:49, Laurent Pinchart wrote:
>>>>>>> On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
>>>>>>>> On 26/05/25 11:26, Maxime Ripard wrote:
>>>>>>>>> On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
>>>>>>>>>> After adv7511_mode_set() was merged into .atomic_enable(), only the
>>>>>>>>>> native resolution is working when using modetest.
>>>>>>>>>>
>>>>>>>>>> This is caused by incorrect timings: adv7511_mode_set() must not be
>>>>>>>>>> merged into .atomic_enable().
>>>>>>>>>>
>>>>>>>>>> Move adv7511_mode_set() back to the .mode_set() callback in
>>>>>>>>>> drm_bridge_funcs to restore correct behavior.
>>>>>>>>>>
>>>>>>>>>> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI
>>>>>>>>>> connector helpers")
>>>>>>>>>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>>>>>> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
>>>>>>>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>>>>>>>
>>>>>>>>> Explaining why, both in the commit log and the comments, would be
>>>>>>>>> nice.
>>>>>>>>> Because I can't think of any good reason it just can't work for that
>>>>>>>>> bridge.
>>>>>>>>
>>>>>>>> Sorry, let me clarify and share with you some details:
>>>>>>>>
>>>>>>>> adv7511_mode_set:
>>>>>>>>      - Is setting up timings registers for the DSI2HDMI bridge in
>>>>>>>> our case
>>>>>>>>        we are using ADV7535 bridge.
>>>>>>>>
>>>>>>>> rzg2l_mipi_dsi_atomic_enable:
>>>>>>>>      - Is setting up the vclock for the DSI ip
>>>>>>>>
>>>>>>>> Testing new/old implementation a bit we found the following:
>>>>>>>>
>>>>>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-
>>>>>>>> A-1:800x600-56.25@XR24
>>>>>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>>>>>> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
>>>>>>>> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>>>>>>
>>>>>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-
>>>>>>>> A-1:800x600-56.25@XR24
>>>>>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>>>>>> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>>>>>> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
>>>>>>>>
>>>>>>>> Same result but different timing (in function call perspective):
>>>>>>>>
>>>>>>>>      - old: adv7511_mode_set() is call before
>>>>>>>> rzg2l_mipi_dsi_atomic_enable()
>>>>>>>>      - new: adv7511_mode_set() is call after
>>>>>>>> rzg2l_mipi_dsi_atomic_enable()
>>>>>>>
>>>>>>> What is "old" and "new" here ? Is it before and after Dmitry's
>>>>>>> patch, or
>>>>>>> before and after yours ? Please be precise when describing problems.
>>>>>>
>>>>>> Sorry, you are completely right:
>>>>>>
>>>>>>    - old --> before Dmitry's patch
>>>>>>    - new --> after Dmitry's patch
>>>>>>
>>>>>>>
>>>>>>>> What do you think? Thanks in advance.
>>>>>>>
>>>>>>> You're only explaining above what the "old" and "new" behaviours are,
>>>>>>> and claiming one of them is causing an issue, but you're not
>>>>>>> explaining
>>>>>>> *why* it causes an issue. That's what your commit message is
>>>>>>> expected to
>>>>>>> detail.
>>>>>>>
>>>>>>
>>>>>> Thanks for the clarification! :)
>>>>>> I will send v2 explaining better this.
>>>>>
>>>>> In particular, if the driver needs to have mode_set called before
>>>>> atomic_enable, you should say why moving the call to mode_set earlier in
>>>>> the function wouldn't work.
>>>>
>>>> It might be the same thing as we had on PS8640: it had to be brought
>>>> up before the host starts the DSI link, so that there is no clock
>>>> input on the DSI clock lane.
>>>>
>>>
>>> Some updates on my side:
>>>
>>> I'm not seeing any differences from a regs perspective when using the
>>> old driver version (before Dmitry's patch) and the new driver version
>>> (after Dmitry's patch).
>>>
>>> In particular, i2cdump -f -y 7 0x4c shows me the same result.
>>
>> Please ignore this (wrong address)
>>
>> The right test is: i2cdump -f -y 7 0x3d
>>
>> And I'm seeing the following differences:
>>
>> # WORK:
>> reg | val
>> 0x3d → 0x00
>> 0x3e → 0x00
>>
>> # DON't WORK
>> reg | val
>> 0x3d → 0x10
>> 0x3e → 0x40
>>
>>> Unfortunately, since I don't have the ADV7535 datasheet, I believe this
>>> issue may be related to the functions call sequence.
> 
> You could try to get the documentation from Analog Devices.
> 
> This being said, the above registers are documented in the ADV7511
> programming guide, which is publicly available. They may differ in the
> ADV7535 though.
> 
>>> I agree with Dmitry's theory.
>>>
>>> Let me gently know if you need some more test on my side. Thanks in
>>> advance.
> 

FYI, I've tested the following pipeline:

DU1 (RGB Output) -> adv7513 -> HDMI Panel

All working fine on my side with the Dmitry's patch.
Same driver, But broken on DSI interface(ADV7535)

Thanks & Regards,
Tommaso


