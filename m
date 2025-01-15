Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E9FA11B77
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4859D10E510;
	Wed, 15 Jan 2025 08:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amlogic.com header.i=@amlogic.com header.b="jQeSuBQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11021125.outbound.protection.outlook.com [52.101.129.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE2310E4DB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 06:15:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaTxhaMel/aeENRhJfEAg4gFc8KUeS5v8kziuXa4ynWaJ/5WzkWuFezAp9CpOQK6EPsSztENtv0TcQBCRXru7UiiT+3YYAoYdvqV/RsnyRqdxPN/373RsJ+Qd0MCQ5x0rQguOMsoSmVda7j25QArq552y9iTTVnp3x9FIs+U3zJczus32s1/IMOYQqhn/AoWxbAdX5exwnl/A66gbNdI5S5Q70xtExBFJJYgZ86jLWdh7IRnqUbl+LdIg3VmrJhg0E0VzVI0M+Lm3NPR9Sucrs64t6Gm8gmS87FVZRA7V23DVZXEw/B//PohcneiBdYkRouALxYaet1e7MYdWpPuig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMfmEtno/Tkgt2/H3QN1iOtj9flfpa4G1z70unjRL4Q=;
 b=zJQtdG4Q4audEmV8iTwhmqFIs7jqM0Crd2BxG5XpuRbKYBu7iUoQnIYm2LCXxxhPeXofkWluqu6pOL+u9zG1ixeCP2eEq3rDgEr+o4Cjoiz0KHKm8rWbcEoGX4OvXwQpCMmZYAfNh72BBAwKiuv+iJ8GWFIkRFZEwOznxmkHm7qh+sBxCBA+T2tPR7aUn8vsk71FnW012v44UtwMRIRdvlJuilOFDa5lJnh7Uc5xd5JQ7ivmMogZLUl+M/Sb6M4bDHtgIwGLm4N0KnfJZF6TbsT/LdQddXUrk2DBCQiUNe4BsPi73meco0Mu1Tv84j0L5JvRU9/SBD+Vj8L6d6pJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMfmEtno/Tkgt2/H3QN1iOtj9flfpa4G1z70unjRL4Q=;
 b=jQeSuBQRGjKj4Z32uOX4U4SuAe+UzVJk809599nJ+Fc00m8aF/DrPa8Z4nHVeCqolryiWn0HWuAlvj0JPEGMQZSEYyAdllq9S8dAdt1/wE/cTJy13xxPD2lBBBmGynXNl+936pa9KX10iW5uXNtD0dbMdg1sjBkfXtRALYWv+qLNNrLnXj3fuz+5GeK4wWq8v7OYSZ81miqIGQUr3xHH9IdCHJFomL/ajmJeiN/BX2yHGmeMdTWPH/rD8CuH7p09Y9TnFcit6nikeRd/lzDc6+v4I+Yigh1+eMEKxnEbmClS/EMLBodaRx9szOvrMC3N0OoQWUxoFZ270EMs6UZ9jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com (2603:1096:400:33e::5)
 by KL1PR03MB7599.apcprd03.prod.outlook.com (2603:1096:820:cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 06:15:21 +0000
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724]) by TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724%7]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 06:15:21 +0000
Message-ID: <490ebd13-cbce-4a96-8f6e-fac8f3a96199@amlogic.com>
Date: Wed, 15 Jan 2025 14:15:17 +0800
User-Agent: Mozilla Thunderbird
From: Ao Xu <ao.xu@amlogic.com>
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
 <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:1::15) To TYZPR03MB7155.apcprd03.prod.outlook.com
 (2603:1096:400:33e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7155:EE_|KL1PR03MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: b62429e5-a027-47f8-8cc1-08dd352bfd73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZURsRFBPcDhrUFJxU2hxMFFBZnRhdGNyWDdIQlN0NmE5M2xRUFRKSFJrMDJX?=
 =?utf-8?B?SEZmL2RoYVVxY0pJUmxTUy8rZ1VJUWRXVUJhcUxIRTlIWEJaK1Z3Y1FucVpV?=
 =?utf-8?B?elZDbU9LZTBNQXZ6SGlUSDVvcTQvcUJuaGMyNldjMzFoQWlZeTFZa1V1SkY4?=
 =?utf-8?B?TkNZQmRqZDA4aEZjWi8waDArL3QyS2ZqWUZZNEVBeE9Kcmw3bkE1bnlHQW0r?=
 =?utf-8?B?cUhwakZOeXhUdWNJSkJpbG9RRVlVY2k5cnN1OXpNblBUNkdZdk10RHJPYlhn?=
 =?utf-8?B?bHRvaFIyQSs4QTU2a1ZXdndFSDFUWk9lekQrbFNybFAvRVMyZ0tKbWxjWTFl?=
 =?utf-8?B?UnZINmc3WHkzWHB0a0pFN2JWd2pYd3NjM1BVYUpxN2RMb2owSHYwUGxZSkdi?=
 =?utf-8?B?a25MaVJtTllmSG0wREYwUGU5enhxS0tqUytQR3BuSUZXa3o1RHBvQ1VjaE41?=
 =?utf-8?B?UldncE1zT0pqS05TNUJLTk8vL2htdVIwRm9SYmdXeGZKNHhzM2JIQjdpLzg3?=
 =?utf-8?B?THZWVUNzd1RqTWd2YWR0YXJEV0lLUnE4a01nbmNHblZDNTdUSDZTOVNDSS9k?=
 =?utf-8?B?VFlJVmpVVWJNVUc4d3ZlOVNmUGpVeE41dEdMcXMzRVRyT2NLUTA2Qjg3Vkxx?=
 =?utf-8?B?RW1VVzNDSHVMNXEzSlhKRmF4UWIxaGxiSUszZk41ODE2eEFzeC9vc1dOQllz?=
 =?utf-8?B?S3FpSVVYU0VZTFI4Vk1nTjNJMU8xa2NNNnA0bXBDTEV3ZjJXL3d5Rm9MZkNa?=
 =?utf-8?B?SFBuVC9URlRIdnAyUndVYmVVcndjaDNmQm5qMDNVUzlhbUk1bE8xWjRNdHB5?=
 =?utf-8?B?a3JHdXE1QVV3ZzVzUzEzYlRJYmpzSXJYRHlVVVpmTTBNa3o0SmJYVUxha0Iz?=
 =?utf-8?B?RlN5bjhmNnNPUklvR2ZVWmtRc3hKcVRrUFM4T051YTdaS3FMZGtCdDZFQmJw?=
 =?utf-8?B?dHpPRjBIY29ZWnMrVTk1YkZHckN2OEIxN04yRmlyMENqak1nMTl2aDJ6dTdh?=
 =?utf-8?B?Lzd0TmdoR2JpbklLZFErOUE5N2ZFWDZWMjRyVzVjcHJGbDM4K0RXSENCcU9a?=
 =?utf-8?B?bTJMTEJ1c3ltUTdGZDNKRTNXM0p1MURvUis1M09IVXFRMlViMUgvUlN6YUIr?=
 =?utf-8?B?cFcrVDRpc1FsdEtISTlRNTBLem9MSWg0MURETEdvU3NrN01vYjZTNURhZUJu?=
 =?utf-8?B?YlNrbDY3eHpwcWlmNGhHWXlKOGttYzJwQWhYK3U2OS83VHZ6TDFsQ2VnZmVz?=
 =?utf-8?B?K0dwQzhlNnY4UzJCK2plQzBkYmp6bm1zRFhGVWdJbnBuMlJhNWl0VDZJeWhX?=
 =?utf-8?B?RUl6bEhMY0UzbWtJcjNTbzAzZXdYU215UTNhNmVOeldLYnJvY1RGUi96elpl?=
 =?utf-8?B?Wm41dEJQZjdNVXRtNnl5MTczU0ttemxIVWFCandNeS9qMjJDWUk4c0cvTzZO?=
 =?utf-8?B?S0x4L1R5QmJ2Q1JCQVBjeDlVWHZkUDU5RVFhci90OVlrN0N5OWUvcjQ3Y2Vl?=
 =?utf-8?B?Tk90MXRnUEdXdnk2V014SHlpMFR1aDBzbkR0dXFaYnBnLytDZkx1b2dZd0dH?=
 =?utf-8?B?YXpTalgvUVpiS1BxcDdJM1paSVNlR2k5QnVoSUFWUVUrdmVjZURsUkRnVjZY?=
 =?utf-8?B?Y1VjYmdtZ1IvcEJSeHpEWnFUTU1sbjN2eEE0bVNJZXR0VVNYakVwc3pOYVBH?=
 =?utf-8?B?SUNWK2hROFJUaS9NSC8rRTVXNk1HTUY4eDhnSlJoaGp4MEIvZzRSNkUvWGRj?=
 =?utf-8?B?Rk8zQjBkQUZSRTFwREJocWxhREFjOWRBWFNXdU1scEt5NDU4anhJakdUejNQ?=
 =?utf-8?B?NitTR092Z0t2bWFTT1NPUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB7155.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlZCVXVwYXZFdWovSG11eTVGZDlCWVRXUmkyeUhoWnZKdnJCK1lmNGozVERt?=
 =?utf-8?B?MGo2V240elNETlNEUjNyZkJFdDNiWXhjMnczclZtNVJwS3E5NHh3LzEvTTFx?=
 =?utf-8?B?RlZ5Y3Y5Q2tnd3ltMVdoVjJvaUs2NnR1b3MxRVFhL2Vzc3dsdEprc2pESEhq?=
 =?utf-8?B?cUt4M21maGsvckwrUHoybVliNXI4aGF6WmJDVW82L3A2anlLYm03MWxQWjl4?=
 =?utf-8?B?ZUNaYmZXQndkNDBZenpla252Y1U5cGJzOHY5VWxCbDhVWlU0a1JSaUxWQVpy?=
 =?utf-8?B?SlJOY0N0ekk2QXQ2RDhIYVgrTDRWQzdWRW5oYll2MjgvcDUwMC9mNGx6Q05o?=
 =?utf-8?B?eHJrWWtnNVJEYmZnUXhXMk5CVHdHL3d0Y2ZOOVF1N3I1MUk2NEFhSUZWMXcz?=
 =?utf-8?B?d3luTk9LVUFzOEc4T3R6V3cyQUQ5YituOHpwU2dsOHZjaW9DMHd5QUkvaHhS?=
 =?utf-8?B?L003YUVKTW50UU1zT1ZHR2FiNGZubHJheGQxazZ6TklNSVhwT2RCcmhGdVFG?=
 =?utf-8?B?MG9GWkREcWZnU1QyVXNDUnZGaWU0ZVh3TDVGTmg1d1J6dlVVL3dRSmNiN3Av?=
 =?utf-8?B?cVJ4eEhGVzhRNmdBRTJmdkttaWkzNXFjd0xrSEtjWlVhQkNxRlpoS0g3bjls?=
 =?utf-8?B?L3VjM0ZTZFZVUmdzY3VFSkpxeEVKaEZ0YnBnODNjT05FUHRUTVpxSEp5c3Bi?=
 =?utf-8?B?QkJWc05jTC9mTjdHQzBTakNtandBcGduUDVEa1MvbitGa0tBZmFza2VLMEdn?=
 =?utf-8?B?bWt1VjIzKzV0dXdCd0EyTllCcUtGQWFienVndHJmYUdDeGdTQkcweG1aUDA0?=
 =?utf-8?B?cG00VmxGZmlPVk1mWG4vUURCSGRWZHA3Nm9XcUZsOHZXYVNpQUhWS2hDejZ0?=
 =?utf-8?B?UStwalhHY3FyeksrZko0MmpIUk01Y2N5Qm1uU3FoK0hTeDNTZEcwMi9reFhi?=
 =?utf-8?B?OWdsbDZNeGVuVXY5SWkzVXJWTTNweUNhdVBqL09jbzJ6TXc2dkNzdlduUjZP?=
 =?utf-8?B?NkVmbDBPaWFzUndGLzRza1Q3a1ZMYWgrdEt0WDNOOXZwdFRoTDhkd25HSFZD?=
 =?utf-8?B?RGEwUG9DTTR6LzlqR3p6UUsxY3pOSU5EUXIyR2MxUkNwM0JsdVFXNmI0SHQ3?=
 =?utf-8?B?cXhDOXRYaGQ4THFUT0E2bnpnMnhaZzVZRmZhUGU4aGE1QlNPaHJFYjE5bSs1?=
 =?utf-8?B?Z1B2QXc5cTJMZVEyKzlibThrLzdrUDNWSFc5ZkhoMXF6K0RDaG9OQUZCVUdZ?=
 =?utf-8?B?d2xBajl5YTI3WGpjNmo2d3BEQU4wajNYa0JvQ1RhdkJuUVd2bXY2SGduNmVF?=
 =?utf-8?B?RVF5VmYxWkdhQU1YTnhjWHlEVndUaW96ekR4bTJMU0ZhSXlUOW9JTVBOUytk?=
 =?utf-8?B?UmdKUVhHTFhRdkt1NTk0WVpOTFFhVWc1UnVTY2lFSFJBalRLLzhja2pWUGR6?=
 =?utf-8?B?QzR1R2gwZHRscVNJYnhuOXZhR1JxdHgrYmtmQWROWWUyM29NRVRGZVlMeUNB?=
 =?utf-8?B?UG5acFpPaDM4VDZzMTZFNnRzL01nK0pCaS84elpDUUVTcjRtSzZFS0hTQnUx?=
 =?utf-8?B?cVR5WXI3SUdzN0NTdHRwajNPU1hsdld6SERRZDUyc3JORGpkNlg1SXZIK0NC?=
 =?utf-8?B?N1p1bndnd1pld1J6RU9DV01VdGMxbFJZREwwVEtqMzRaNFJSY3FQYXZ6MFNJ?=
 =?utf-8?B?S25NaG9EV3ZmRTJEWjBUVzZPZkxIUGtnd1NXbFpOeGo1cEtqeXlzdE5vazlO?=
 =?utf-8?B?SFkxOERRYTlkRkxaeFpQNERSY3hrSkQ5VU5zNFNaSHkvQ3ZCVGNEVXppYis0?=
 =?utf-8?B?ZUtvSWZCb1JDSTFQblFKWkFhck0zcTVENVpUQnRTd2h2TUtBNUNCVG4zZVFK?=
 =?utf-8?B?L1Qxa2dNWitBbWpOakxBblRHOFRsN0FPY3B3TmRzTURVd3U0NzlNNkNXRXpt?=
 =?utf-8?B?cVhFVTZmOXRrMUhWKzRJd0kzNGtCY3RsR0F0SVJsVDVKdnJ2REd3d0ZSL2xE?=
 =?utf-8?B?VTJhWEtYSlNxSEhFNjduTDNpRnlRZlN0WFJVQ1k2d29JV0dMTDVISzJiYUIw?=
 =?utf-8?B?OWlHY2c0bHVEbzdKQ1hBNnhtMWdMVENyRGlKOVdaUFdKZUltaFQ4Wmd3MkV1?=
 =?utf-8?Q?I0VAnBB0IiLXgYVRKPtilx3Qc?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62429e5-a027-47f8-8cc1-08dd352bfd73
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7155.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 06:15:20.9712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QLpD6HQPNg5dGUuuuf5UwOcbbkZydePv8cfbM1xVfek8wSeJtl4qcoGAQOrXzdTIPYBlY3tHZOwe54KGmYjJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7599
X-Mailman-Approved-At: Wed, 15 Jan 2025 08:04:57 +0000
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

在 2025/1/15 1:50, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On Sun 12 Jan 2025 at 23:44, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
>> Hello,
>>
>> On Fri, Jan 10, 2025 at 6:39 AM Ao Xu via B4 Relay
>> <devnull+ao.xu.amlogic.com@kernel.org> wrote:
>>> This patch series adds DRM support for the Amlogic S4-series SoCs.
>>> Compared to the Amlogic G12-series, the S4-series introduces the following changes:
>> Thanks for your patches. With this mail I'll try to summarize my
>> understanding of the situation with the drm/meson driver as I'm not
>> sure how familiar you are with previous discussions.
>>
>>> 1 The S4-series splits the HIU into three separate components: `sys_ctrl`, `pwr_ctrl`, and `clk_ctrl`.
>>>    As a result, VENC and VCLK drivers are updated with S4-specific compatible strings to accommodate these changes.
>> Jerome has already commented on patch 3/11 that this mixes in too many
>> IP blocks into one driver.
>> This is not a new situation, the existing code is doing exactly the same.
>>
>> Jerome has previously sent a series which started "an effort to remove
>> the use HHI syscon" [0] from the drm/meson hdmi driver.
>> In the same mail he further notes: "[the patchset] stops short of
>> making any controversial DT changes. To decouple the HDMI
>> phy driver and main DRM driver, allowing the PHY to get hold of its
>> registers, I believe a DT ABI break is inevitable. Ideally the
>> register region of the PHY within the HHI should provided, not the
>> whole HHI. That's pain for another day ..."
>>
>> For now I'm assuming you're familiar with device-tree ABI.
>> If not then please let us know so we can elaborate further on this.
>>
>> My own notes for meson_dw_hdmi.c are:
>> - we should not program HHI_HDMI_CLK_CNTL directly but go through CCF
>> (common clock framework) instead (we should already have the driver
>> for this in place)
>> - we should not program HHI_MEM_PD_REG0 directly but go through the
>> genpd/pmdomain framework (we should already have the driver for this
>> in place)
>> - for the HDMI PHY registers: on Meson8/8b/8m2 (those were 32-bit SoCs
>> in case you're not familiar with them, they predate GXBB/GXL/...) I
>> wrote a PHY driver (which is already upstream:
>> drivers/phy/amlogic/phy-meson8-hdmi-tx.c) as that made most sense to
>> me
>>
>> Then there's meson_venc.c which has two writes to HHI_GCLK_MPEG2.
>> I think those should go through CCF instead of directly accessing this register.
>>
>> Also there's the VDAC registers in meson_encoder_cvbs.c:
>> I think Neil suggested at one point to make it a PHY driver. I even
>> started working on this (if you're curious: see [0] and [1]).
>> DT ABI backwards compatibility is also a concern here.
>>
>> And finally there's the video clock tree programming in meson_vclk.c.
>> My understanding here is that video PLL settings are very sensitive
>> and require fine-tuning according to the desired output clock.
>> Since it's a bunch of clocks I'd say that direct programming of the
>> clock registers should be avoided and we need to go through CCF as
>> well.
>> But to me those register values are all magic (as I am not aware of
>> any documentation that's available to me which describes how to
>> determine the correct PLL register values - otherside the standard
>> en/m/n/frac/lock and reset bits).
>>
>> I'm not saying that all of my thoughts are correct and immediately
>> need to be put into code.
>> Think of them more as an explanation to Jerome's reaction.
>>
>> I think what we need next is a discussion on how to move forward with
>> device-tree ABI for new SoCs.
>> Neil, Jerome: I'd like to hear your feedback on this.
> I completely agree with your description of the problem, that and
> Krzysztof's remark on patch 6. This is not new with this series indeed,
> so it does not introduce new problems really but it compounds the
> existing ones.
>
> Addressing those issues, if we want to, will get more difficult as more
> support is added for sure.

Hi, Jerome, Neil, Martin

     Thanks for your review. I hadn't noticed Jerome's patchsets before, 
and he has already done some excellent work.

     Indeed, the current code is overly coupled, with HHI and VPU regmap 
mixed together. It also contains a lot of redundant code, which is not 
very conducive to extension and maintenance.

     We are also considering ways to improve the DRM Meson code, and 
this is a good attempt.

     The code should reuse frameworks like CCF, reset, PHY, and PD as 
much as possible.

     I'm more than happy to collaborate on restructuring theAmlogic DRM 
driver to make it better!

>>> 2 The S4-series secures access to HDMITX DWC and TOP registers,
>>>    requiring modifications to the driver to handle this new access method.
> Regmap buses are made for those cases where the registers are the same,
> but accessed differently. There is an example in the patchset referenced by
> Martin, to handle GXL and G12 diff.
>
>> This info should go into patch 1/11 to explain why the g12a compatible
>> string cannot be used as fallback.
>>
>>
>> Best regards,
>> Martin
>>
>>
>> [0] https://github.com/xdarklight/linux/commit/36e698edc25dc698a0d57b729a7a4587fafc0987
>> [1] https://github.com/xdarklight/linux/commit/824b792fdbd2d3c0b71b21e1105eca0aaad8daa6
> --
> Jerome


