Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A4BB44DA9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 07:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C8510EB1F;
	Fri,  5 Sep 2025 05:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dFpVAml2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011036.outbound.protection.outlook.com
 [40.107.130.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0E510EB1F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 05:45:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNtpwQw8Ol5j7utF4rfcDz2bAnia4Zz9OiQY5v7tR1PS7vOE3BiYhdX1bp/xrDSwfXCXZw4jbDp0iMrKDDUlsddG4OIOZmBtBMCQ9hYW8AGwd4r3IE21eUei84K7tdTJWXQEiYdtlZOg6tzynL7VxDlPnp252EwBlyWttuTtgLhBuJrFwDHseHs286xtSbp/OF9pYkujBgqhM4D74AFmQaYngnIpKhImmFLMBnsiNXR2qIWSCi2nvaYtjEQnewgS8Y2aLD0pSNMOxIgjLehlNLzfZCqRqn7wDKkDcZ9rGZ0h+brzRStabIKPQuSGA23gfoaiP5MsbDgyv2kqQSTVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geDtwz2bdIjehCl+cPq6Kkh42W6ImDs7az96EcxMwOs=;
 b=Alok9xMg2zHnM0s0dKJq/KvXoLbI4OQ3FS3uWzxpnVp/tjbgcizM4Uz8f7j8pgb1Ga+hAO9QUuRInrXnHeDDMVfJQJj0rhKYJhgSnRz/AJtu17+IenN2lJlsm711kQnOtDnxPT3SM14TwBgpm8edJ5Rr+DeVvvTBD9a0hSPOzrQo316a8+V4+liZMIXEAeUbvrHuwb2JhBF6nsuE5eTaimojFf9UHvkzrTY7zfH9/9ljfNsrzwwlFJKC6qFJarPGr/YyIf+F8+LRz1/suWHlWVgFkhMfDq1Ht7vaFrkeknOZqRomftu4Ll91WOOPyQ0X/vvR99ePcE6GnUutCOhCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geDtwz2bdIjehCl+cPq6Kkh42W6ImDs7az96EcxMwOs=;
 b=dFpVAml2W4voL7MJJ7lQG218NDfDJR8VT0K1aVHewbOss4DkyKFWHALLEQinWZqKDINGgLOQgHtOB5I5jRm/MjWDTY1DkmhW3y07ENYlImymPRHk8yGHx2osASQfV/h4qQKZMsJy9aOWlCbPiIootc68FdQ9G3nVfYF7TzKXbqT7SxB1QmDOoQTnhCprbHL33C82gtyzsHt+M7awRsWAFJv/ORPuGjnhXLrACyWYBVt64h34tfhZw/7zE2xxAwQ4K9TDhCmYwUowR3IrXWLKZK3a8P20lLn9p3Wghl0vlnWMggai464CgySA6zSCkyfGQqWQHZw4yAkhJq0VcNRmhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9698.eurprd04.prod.outlook.com (2603:10a6:20b:481::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 05:45:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 05:45:26 +0000
Message-ID: <023ae7ec-77a5-412f-bef5-105350561354@nxp.com>
Date: Fri, 5 Sep 2025 13:46:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support HDMI vendor specific
 infoframe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250904-it6263-vendor-specific-infoframe-v1-1-6efe6545b634@nxp.com>
 <6i7eyxajmelu3x4ckvwifmizln6jzybt6ykpwlefna3k3noop4@e5zdvzor24fn>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <6i7eyxajmelu3x4ckvwifmizln6jzybt6ykpwlefna3k3noop4@e5zdvzor24fn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4f235a-4372-4c54-3645-08ddec3f69c8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|19092799006|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnhzMlVBOEJZMklBUDZDQ0tFYmdQZ2hpRXVqL0U3S0hTVnp0VFRtc3VMRzZO?=
 =?utf-8?B?NktrZWVsTnRsejJNWUlsNWN5YmY2c1YwU0lOTllwdnBvY1hQemVuRC9hVitW?=
 =?utf-8?B?ayt0M09pcDI2R0NKMzZSdFNRYU1PRitaelhKc3pydXIrblo5WkFaOTA0akVM?=
 =?utf-8?B?byt2TVdFWUFpSnJWODgzL3hsYmtyNW9nRG8vOERUK2Q2UzJLYS9pdysvTkRp?=
 =?utf-8?B?V2RIaHVvOHA1N2dvUTF4a0pQOW9xUTBpNG9FRGVUVFE1QVJWVStURlVSZUF1?=
 =?utf-8?B?L2VWVThaQWVYUDdTNlNUd2V3SFRCMXIwWjFSd1QrMXQxR1VQZzB2Z2NnVzlJ?=
 =?utf-8?B?YWhKVXNnajVyNndVbWlDeEZkYnhzWkJncVpJMVVobDA4ODQ4eXptSjB6L3E1?=
 =?utf-8?B?N29uTnB2eFZ6aHJPUnpNRFBKUzlIY2laNmEra1FpbUtmV1dYTG83RndaWU10?=
 =?utf-8?B?bVpNSGxIb28yZjBjb1V0Q2JoWkJ6Z1VRZ2xBS2g5WERTOW11Nyt4c0VmbHRW?=
 =?utf-8?B?VUp1Wm8zWnR5MlNrSDEyMGI3TXhUQWwvS0NHOXRvYlVvUWMxZXV4K0xTV2lm?=
 =?utf-8?B?UTBvOFhSNEJ6UmpXbUJjallQODg1Yis0S05OdCtLbWdlbkhDdElhZzI5Ritp?=
 =?utf-8?B?ZHVZLzJXYkFvdHliQ0Jaa0NLQUJ6TGFPSzZaSnFPSUVnTThKTWE0MlY2ZzJX?=
 =?utf-8?B?VGRyc3RrQzFGZXdsUnFwcWxkWkdOcmN4M0ZlTnlUaVp1S3ZGS0RsOUpOOFBJ?=
 =?utf-8?B?WW5IN1RQRDhZQVd2RWhzNUpIa3luVkhyaUJXemRreEhMeTY4REEvUzRCK2lu?=
 =?utf-8?B?ZjdkWlpJZWNlU2pyRlFwV2dhNFJRdnI4bG8vMXh3TnQvZFRUNnE4M3dFd2JV?=
 =?utf-8?B?RVduQmZZRmx1ZjNhVG5rM3N4T2xGRklTN0ZsbFI3c1lVQktsMWxMVDdBZFh1?=
 =?utf-8?B?YzhqRXY3WEFZcUhZQUE4Ymt0NnZQSjk3WkFnc3F3c2lNZFI3QlQ2NWtsUlVY?=
 =?utf-8?B?Sy83UU1LU2NScXM1b2F2TEJrY2N5Umw4MDdsMldFZUZsUFRkYkI0dnNDM0Mv?=
 =?utf-8?B?SGV1TmRjSEpBNmlLOW5VRHljWkFDQ2w0eVBxbjBsVEt1VzhPbE1nNkhUeDMx?=
 =?utf-8?B?NU8vNENUcjJZbGhsbndLK28rcFZEOVVqYUZvRGYzVVdDS1haUERPVFcxT2x1?=
 =?utf-8?B?cGtVNERlb2VhNnNTRzBuaEZwK3JWWG56MDFPS3B2elJUVHVUb2dRcHlpNUk3?=
 =?utf-8?B?WmNjRmlnME84TmIwMGZhNGYvbFdlazVNQUl5MTdsWmZBRXFWZ1Faa0xWTmI0?=
 =?utf-8?B?WC85c0MzQkt6NFVFOVl1RVhrcjFnemFOUE1INW1wbHJRelVWNHBWRDJMYVB3?=
 =?utf-8?B?bEg3amwzT25Id0dndnNyZlFOK3pNOFpyZnd2dDczUmF5Mkg0NXd1SHlFeGJh?=
 =?utf-8?B?Y1FDQ2Yxd2RVWEU3ZGhhUU5mM09pa3JTbVovRElOMENOOERsU29iakEzcElI?=
 =?utf-8?B?MFpIOXV5UlRZVUZxY2ltUTRnVGZVWTVpNnNKYktQQkpBTWFnMWdYWjJiQXhD?=
 =?utf-8?B?c2NRMlUyeWlScHBZZk51c1hKNW9JcGVuU1ZoYlhLc1BHbW4vY0pLVEJXLzU3?=
 =?utf-8?B?UFNrbzZvWHJQcXV5KzdIOEhYaUFmcis5OHRGNFNKRW1TTTN1SFl0cVpkUTI2?=
 =?utf-8?B?enNOdWxrM29FenRNMEcyWUIwek1oQlgzMzdrMzY1Yk1RdUJpVUdhWURyM2xR?=
 =?utf-8?B?Sjk2ZlVKZms2QStqdDYzT05qYnJxRFhoMFdRQnFlQitVWHhpeTErbGFZazRN?=
 =?utf-8?Q?6Ad67JxRX7nh5o11V46JP/GrFs0EZ1aMqSQKw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2dBbG9nNytzS2k2N3hHSmRUVU1jMTFYUGNQMVB6YXNKUkxuajdwTFBmazZD?=
 =?utf-8?B?UktJUFZ3a1ZCL05MRHh0SllvNzFzbWRsOHNib0dXNTFvSkFOYS9iYjNEcEIx?=
 =?utf-8?B?U0IwN2hrU3hIWFhRZ1VzNkllU2RDdUhJeEJ6Syt5a0NsOXJiYzRCODd6Y2Qz?=
 =?utf-8?B?MTVlUkVSQzA3a1hjY2FjK2xmWlZ1WFU3N2t3YVJ1bWFWN2dUZlI3WGJOWHp4?=
 =?utf-8?B?OUN0d0xOR2JhQUV5SDZYdVJ2WW5zNFFjTmpMTGJMdVVxME54b3FLK1RSTU1j?=
 =?utf-8?B?b2R0YkQ5dzZNb0dTQ2FXMitOanRqVEJ4ajdCdk1YazZydGJZVGM1c0xGOXB4?=
 =?utf-8?B?andvc2pvamJYZHhwOWJIaW5USCs0WjNiV1lBdTYwaEQxN21zN2Vwd0k1MUcy?=
 =?utf-8?B?bjcweWNTeXBWK1dJS3BKQ2c4M2ZFQ3VqWVowbnlXRWxLM21pcEtENTRaalFw?=
 =?utf-8?B?eCtFWnllR3lxdkhwTGkxQkQ5TWcxb3A2MnN5Q2FjTWZFRkNSSnZ4RWhLWGZE?=
 =?utf-8?B?dWF6cGJYOFdTSUduVmtPNVMrWXZCazF0ZXNhSExFZlNaSm9GUG1kT0xhT2x1?=
 =?utf-8?B?L25TS0Y4MVdOc0tZUG8ybmx6Skxtc25icjQybTBEK0VDQU4zZjFBZ1pGR1Fi?=
 =?utf-8?B?aFo0NXB4MnpCbGZLdm4rUzcvRG9idXQ5dkV0R0RqeThKVGVlMVNXdGNWZ01V?=
 =?utf-8?B?L3RTcEs5YlIwSzVpV1lhRmtmZTJ1SGVUQ01LZCtwZFpCRFZWS0s3NGM0NmlI?=
 =?utf-8?B?bEVrSzhNaSs3bnhXNXVURm5HVFZubG1RVTBmV0xucnc1ZGxSL2dqTFZGQS9m?=
 =?utf-8?B?b1hWbHhiVDJ6aWtzMGpkcmxBNkFxNE9pRnNLZExGRURTNE9HM3JmQWhrZkxt?=
 =?utf-8?B?REZvblg1bUYrcTVNbVlkWlBCVVY3dC9mTDN4RWJhMkJTbTJxTHphbmh6UytJ?=
 =?utf-8?B?MVFGaVBqUTF0cjc2bFNKYXF1OWJObVc0NFBreXVCeFVkQ1lCSVNPWVdQazR2?=
 =?utf-8?B?bWJybDg0VFZBT1JRdHVNU2tzMkFwdVhwRmREUzI4MzlMUzFEcHF6UnlPUkhl?=
 =?utf-8?B?L1pKRlpIU2dsTFhzTXRVNFI4ZFZTakRHT29saGxKam5CanBDalVOTFMySy9J?=
 =?utf-8?B?TXQyalJzUXZvdUVkMmZxdkdscTN4T3hIK2NnODM5MnRUWTJGTjlGOXREcFZq?=
 =?utf-8?B?eWpJaUhUbXp6QXJGcHd3eGk0R2pPd3BtL0hROWFVRldPeDJhRmpyZ2FOeExF?=
 =?utf-8?B?TktjK3JsOHY0RVRaUis2SEtJWjhMTUNTOXdMUXlQeDJCSWVOeVp1U3hHaFdk?=
 =?utf-8?B?QktWWDE0SlB4MlROTCtJWVV4SlYvYUo2RUFSZk4vRGozd3htUTlZQnMzZFF0?=
 =?utf-8?B?dzRER0g2a1NQOGpVZUdTak9VUWtnUjgwNWpYV2dFbEJRaEI2ZXkzTlllOEhh?=
 =?utf-8?B?Qmg3Q242dEpFemxhMVVkSTZ5ZGs4M2hsWlJnNUxYbVVPVk53ZFZGKzZDMmY2?=
 =?utf-8?B?Yjd5Wm01RVJyMjlUR2F3SGJjMXdhMnZIeWc1R2ZvK3FPTTFSL1NVT0NQRDd0?=
 =?utf-8?B?V0RpR1ltUWFoSkFnNUU5cTU5bCtuRm4yaXEyYkd5TENqbG5yYUVEN0VPTHIz?=
 =?utf-8?B?MGZUbG5hbTQ5THZmZTFvbStkdmVNRFEyWi92NWtoQzlaN1lZYmZqUG0yWVdL?=
 =?utf-8?B?MDRoTzkyQUdmMjlnaXFvNnQ4MUlvTzZTOHl0VjJBRWM0c3RGZ0VMalRqRmtw?=
 =?utf-8?B?cjlwTHFBQjdGaGVHL295cXY2ZUNhaCswWU5kVFRydWk1SDBGWDJuL1NDbnVC?=
 =?utf-8?B?Z0xrWFJVRCsrdUozQjZoL3d5U0VnT0ZHNXNMUlI5SXIwMFhpdldwRXpHajk0?=
 =?utf-8?B?Q1UvRVU3K1VWZHJQVkROeUh6VnVML3BCOHAvK202VFhKWEk2cUpzaXN0T0pJ?=
 =?utf-8?B?ZDJ1NTREaktpaFdXVk9wYW9wNGtvaUNGL283Q0FYeGN2OXhWb2JOaXlEenY3?=
 =?utf-8?B?MVZaa3VwUzZuemp0ODNYL3ZwWVdadmVjUHVDdzdERmRsemhHaGVUa2NCVGRw?=
 =?utf-8?B?RW5PdXVDOU9hSDVqSHNvK2Fyemsrc2w0ZEk4QjRqRko5bjBOY0hlRjZuN0RJ?=
 =?utf-8?Q?n2d+Qi1N3d+cW6NhWubbZfoI8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4f235a-4372-4c54-3645-08ddec3f69c8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 05:45:26.6278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALvVyg06FgzBQum3ZXfjzIyfAiUxgaM+JfgavJr7Sx0ZxDZc5qlza7Qfbw+5+jx+2dSKwJJzUG9I00lMQUjF2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9698
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

On 09/05/2025, Dmitry Baryshkov wrote:
> On Thu, Sep 04, 2025 at 05:10:02PM +0800, Liu Ying wrote:
>> IT6263 supports HDMI vendor specific infoframe.  The infoframe header
>> and payload are configurable via NULL packet registers.  The infoframe
>> is enabled and disabled via PKT_NULL_CTRL register.  Add the HDMI vendor
>> specific infoframe support.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/bridge/ite-it6263.c | 72 ++++++++++++++++++++++++++-----------
>>  1 file changed, 52 insertions(+), 20 deletions(-)
>>
>> +	case HDMI_INFOFRAME_TYPE_VENDOR:
>> +		const char zero_bulk[HDMI_PKT_HB_PB_CHUNK_SIZE] = { };
>> +
>> +		/* clear NULL packet registers due to undefined default value */
>> +		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0),
>> +				  zero_bulk, sizeof(zero_bulk));
> 
> What if you move this to the probe function? Then there will be no need
> to write those registers each time the infoframe is being written.

Good idea.  But looking at drm_hdmi_vendor_infoframe_from_display_mode(),
hdmi_vendor_infoframe_length() and hdmi_vendor_infoframe_pack_only(), the
payload length could be changed in runtime according to display mode's VIC
and flags(see DRM_MODE_FLAG_3D_MASK).  And, IT6263 supports HDMI1.4a 3D
formats according to it's product information[1].  So, it makes sense to
clear HDMI_REG_PKT_PB(5) and HDMI_REG_PKT_PB(6) here which map to ptr[8]
and ptr[9] in hdmi_vendor_infoframe_pack_only().  For v2, I'd move the
NULL packet registers bulk write to it6263_hdmi_config()(i.e., it6263_probe())
and write zero to HDMI_REG_PKT_PB(5) and HDMI_REG_PKT_PB(6) here.

What do you think?

[1] www.ite.com.tw/en/product/cate1/IT6263

> 
> LGTM otherwise.
> 
>> +
>> +		/* write header and payload */
>> +		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0), buffer, len);
>> +
>> +		regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
>> +			     ENABLE_PKT | REPEAT_PKT);
>> +		break;
> 

-- 
Regards,
Liu Ying
