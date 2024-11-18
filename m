Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50B49D0AFE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBCC10E0C7;
	Mon, 18 Nov 2024 08:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="ZfvIv7Mw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB9210E26E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 07:59:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVQIFCRvuotB6xpSsvKlBOQa3wkpH+JHx+IgYbAHxlzyH536S9TiZ+52h457w5iytgK6gbm/2icbf8pn3RGNmazCisgKOFTtKiI0TTByOtEZjXjEQYC6t9wrddKcvTga8NyJ1HABQMZWEPPbVp3JNeSXaWOxBqF/+TJtIL7FgxXS0MY5qlQOzWRXgNJkOPZ8Kdv625UU+TpvWyuOnTt3EMY3c7IxPiPprA9QCu0uQlv4E28Cvd2QDoyzTkkd3XOal9lJHkDEEUzDI1c9Dwstdi9UheKO16T4khk6q0BXeKX+6twgLEfMPsUzQ4lXiZZl4bYpNUV8hJYzsBfUJuJfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBZRqfit9NGyXETTIhSsxRq6Tn/Zc4YCwb3t/i01gc4=;
 b=kDzX48HB1pk7JcR9OouVMcmu3Vm9qf/bVyAm+2S6eJ6J8Qgecx9Qg3wIFqDr8rD7XZZ69Jk50/8ZyCGijN1Vmxa6ZM948Bl18k/rBlBQgMKI6BNxZJU9JcGHMOxKqN6eVeRG/rcRYHF8hEqo5bLUgEIGPD4rNWu9ArhExh88LxKMOWk1LJ8pP4EkmN8Eg/KCzaC1Z8SjhWPDCobMPYjlQNB3H5Ey9ESxeJO1uT7Do1vNjxkOZVvfb5gZmmcSbtcYddZRrsq1xMcUFxFMzpU3KuC5v8ez00CdEONUjMNzHIKSYG0ld+l5QlY+Uix59zRu2kqyzrQJGfayHV56qpQLmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBZRqfit9NGyXETTIhSsxRq6Tn/Zc4YCwb3t/i01gc4=;
 b=ZfvIv7MwGCx/7CFo//UE+D58ePSKU4aco0/S296i2BR9xPLuow9mmSvl05ik5is+QyhMKcUhABeUgBMGIgYMA0vNC4nPq90RGbr4nGUldP7YsL7w1rXRQr9vaNdHXy6pjWILfMcvDTuEi8F4QQicpiLvSIwjQoXetaGcYQfzFDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8SPR01MB0029.eurprd02.prod.outlook.com
 (2603:10a6:20b:39f::19) by GVXPR02MB10943.eurprd02.prod.outlook.com
 (2603:10a6:150:217::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 07:59:38 +0000
Received: from AS8SPR01MB0029.eurprd02.prod.outlook.com
 ([fe80::b4f:3a40:2bc1:3a0c]) by AS8SPR01MB0029.eurprd02.prod.outlook.com
 ([fe80::b4f:3a40:2bc1:3a0c%5]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 07:59:38 +0000
Message-ID: <c1ebe220-1bc4-76ad-8313-88058ef95c9f@axis.com>
Date: Mon, 18 Nov 2024 08:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/bridge: adv7511_audio: Update Audio InfoFrame properly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@axis.com
References: <20241113-adv7511-audio-info-frame-v1-1-49b368b995a5@axis.com>
 <nramdgi4pziet3ypwdi32zolnhdzualv4rpov372s4mfsakdhs@7qjro2oaef7i>
 <d7121d00-4353-2901-e87b-7fef7da5a35f@axis.com>
 <CAA8EJpqbMvevmWZ3AbQOwBbVUOkUPHB_mrv+BtLndAcpLmcVpA@mail.gmail.com>
From: Stefan Ekenberg <stefan.ekenberg@axis.com>
In-Reply-To: <CAA8EJpqbMvevmWZ3AbQOwBbVUOkUPHB_mrv+BtLndAcpLmcVpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0096.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::31) To AS8SPR01MB0029.eurprd02.prod.outlook.com
 (2603:10a6:20b:39f::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8SPR01MB0029:EE_|GVXPR02MB10943:EE_
X-MS-Office365-Filtering-Correlation-Id: 9390b56e-44fc-4475-ef0f-08dd07a6f35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkludThuOEtPbXZxUU84Ym5qNUpKbHd6bWdwV3N4UVdnQ0VxSXpvQit3d3JT?=
 =?utf-8?B?OUd5RGRzTlhUdGQ5LzU3ZmRnUXdEVVZFZDUwbDAxNGJ2NkN6WndScExXaTcw?=
 =?utf-8?B?NndjVFUvQlNCVTJCYi9uN1pkV0pQSXVHRHJadVlOOXMwaE5CSngzU0RVWGN6?=
 =?utf-8?B?M09JVEl0V0pQY2t5bnFkZWwwRUdiNTVoWU5MZGhHL1I3Vno4WjZWQ2RkOXdu?=
 =?utf-8?B?TXl4aitTZUdhdWQ3eFdpUXhiVUpmQUs2amZDU2lQN1I0Q1YxV3FnWnlrUFNv?=
 =?utf-8?B?azlVQ3k5bVV4aVRwU0h1ajBFYlNBOEdIU0lDV1NIb3BqeVVDTk1mS1FUVkxp?=
 =?utf-8?B?Q2JFcFVjQ3NWNytJUnZJZGowNjBnbnNCNkk4YURhc1NwYzhBMnVQSjVJMzk3?=
 =?utf-8?B?TzlPZTVidUpXb0I1S2dGZnJKQ3hCU1cxNEZJV1hPRXFwQWk3dlBFR1NDRFla?=
 =?utf-8?B?eCthTUlSUUV0ZEltcUhEZ1lhZitNZGM1YU43U0l4S0k2eTlKUzFmN1JPWVZh?=
 =?utf-8?B?aURnOGdzUFk2aHIxbktiekZnU2txY0dqTGFJdEpoNmNvTEs2QmZHTGhOdktU?=
 =?utf-8?B?Z01nYzFZS1NCVDBObWVyS0JrcEZzV1N1TzhmUVRLQ3BXV3RUcjRvQ05LTzdh?=
 =?utf-8?B?ZXkwd2tJbVRJai9ZV3grSWgvK00wTUVOZ09CaUhoQVJGNDQ2ZjlFOTVxMW1r?=
 =?utf-8?B?MmpQcmdJM3pzVXlncFV2bXlKZlc2QS9zeWk4UWpma2g5cGROcjlUdG8yclRn?=
 =?utf-8?B?ODZUVXdTdlM1Y3RmUThvUXNaVjd4TWtaRFRFd0J5OUFucEFGLzkrcGdnWWVB?=
 =?utf-8?B?SUlPRit4bytJSEpVU2dMS3RzcE1rWjM2blpYRjgzWHVEU0hYRnByc2hpMUwz?=
 =?utf-8?B?dkFqdE9Dais4M3dLWk9VMTl1TEdkSHB0R0pNazVqVkJtanZCWlR2TXFLV2lk?=
 =?utf-8?B?Y1RKc2x4RnByczhmSFI3cktibUROcHRBc1BZNTRCZzl0UmRYMEFjSFBPNklO?=
 =?utf-8?B?KzAyTFQ1MTA2VktkVm1kbXV6b1B5UWlXT0tRR3ozU3Z3TDUwaUtiRXFQVTBy?=
 =?utf-8?B?YUtDdC81VWkrdmR5bERRUG1sT0RiNkZ6czUxc3UwSXFMa21taEJ2d05qVzJw?=
 =?utf-8?B?aGxRdnFrbUkxRnNvWHQ5OUxmaWl2ZEJrLzJZNmNNQ2M0alR0M3YvSlU3Qjha?=
 =?utf-8?B?SSsrejRaOHIzOXI1aXNXRDJOZ012TjRqR2d4a1ZIYVNwUHdUN3VQa0diSXFN?=
 =?utf-8?B?UHhLYnZ5TityUFEwK0FyYTJ5ZXhwN0tRVmV6VXcrQzh4SnVvUVVBNUVoWTRM?=
 =?utf-8?B?c2Vsc0kxZjV4ZTRxdEN0TkxDVjk1cm9TU2JpeStBVXphbmJvOFI1Ym5hOGsx?=
 =?utf-8?B?dmdSOHRMRUNXb1c5djhBWjRjcFQyRjNYS1V2SHE1Mk9DVEV1aU9Ec1E1TW1x?=
 =?utf-8?B?cXVBOVF5SDZWMDk3alFheXVTU3U4ZUY2Q051Qy9YVE5TbE9BNWdURDZYYU9E?=
 =?utf-8?B?MTZHUUR2eWNWQWtNb1grL2dKRTdkeU5vZVpSZ2l5VGc1SGROQ0tTRGZ3RWY3?=
 =?utf-8?B?b3BmU2tGTVJ0TmNlUXZTYlhqUzYreHZrV2dEWjhRRkJSSmhDdDBIQkFFNlo2?=
 =?utf-8?B?WDZ6d2VjUUxPKzFHWDR2UzAxcDNQVGtXS0w0TmJWR3NNY1FOTFNxdW02MG11?=
 =?utf-8?B?bGg4Q2ppbERXRTR0NWJlMm5FMHpqQ2xibURCbkxGVGpSYlM1anIzb2dEcklL?=
 =?utf-8?Q?6halIZJDKAWYilqoaHgKMHIN8F6nuFDevHwCnpA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8SPR01MB0029.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHJpQS82WVI0QTJ6R29Id21HcU5UanFKRFUzOTNHZ09CWWlOSUN0ME5aRDFK?=
 =?utf-8?B?WVN3QlBKcmVGL3BnVS9SaEJZNHNDY0VYYkJHWVNtQ2s4Zm9GYXNnam9mWXhx?=
 =?utf-8?B?RzBydjk2YWE0cTlkbHBGcHBjaThaYytCNU9pUmQwQUdyOXB5S2FPbmVjcVN0?=
 =?utf-8?B?dWkyQ2s3cjlvVk5oQ1pydnd1RUlyQXdmVGFEM3MrRzMvcG1BaWppT0xBWWdn?=
 =?utf-8?B?aUJwQmM3Nm93ZDBmd2RJSUowc2J0VEh1aldOZGJNeTM2dzF3eEhKMlkyQlVT?=
 =?utf-8?B?ejhxcTVROWtFTzZ6V2EwSnJGa3JpV2ZXY2dsVjY0cG1FcjNvQ3N2OU8zY1da?=
 =?utf-8?B?a292RGxrTmVZbnRQZjZMRzZ0a3BUZDZweUFMeGIzQ0VDclQ0bWVFcU1EaDFy?=
 =?utf-8?B?RklzSHBJWnM4ZnRoWmRieThHQi8vSjd6UGNXdjhrSEVSOWxqVkU4TUhBUURG?=
 =?utf-8?B?ZHJST2pRaFkwb1dzVVFPZTBHSWJOVFlHelAxc0ltV0FuU2MwZTY0WEo1ZmN1?=
 =?utf-8?B?eUhOdTVRNUVzdHAvUW9uNFJublArNnVLeUQwMklRd25ZWGRyWUlXZVlGRldy?=
 =?utf-8?B?K3lLKzVqYWZmc01HNGFuSjNmajhRZzFUd0VvdHVyQUhEcFJsM1NZTFd6QklO?=
 =?utf-8?B?QXc2Tk8rVzNWWmxlRGNNUzVWTjhCdlRWR0JxUG93RTBiUERDeGJCdnRUUDlJ?=
 =?utf-8?B?RlJ1NEcwNnNiblhiSHFOeVVyMSs3SURLMDhDcXNZQThmNDdwQ2h1TWZmS0lt?=
 =?utf-8?B?c0NZcjdMbnFpUVhveWR5dXBHTGtWN3J3dU15OVRxWkZLN2EyekVCcG94RXJ6?=
 =?utf-8?B?SCt6ZVBzVFMrdWJ5WlpadlhjeTNabFF2Wm5iNDVoVy9nT1crOHJ1U0FlbWo5?=
 =?utf-8?B?aEorS1pSUjVSdmFBMEFyK3VodUEyQ083WXVpcnVsOWs2UFRQYm96SlZZMDUz?=
 =?utf-8?B?aDdna2o2WXNnTUIzZjk5NDhPNkYxcnFtVkZkU2xFejJ0T3dNNXJzTWp5bUg4?=
 =?utf-8?B?SWtSNmN3TGJlb3hQSlBVNmlJczQvRHpNNDNIVFQzdWZHU0hIK0lyOUZTZmdL?=
 =?utf-8?B?dFJ4WmRYNHI4UHh6c016ZitwanhXVEZ5UkVGR0YxNlFiZkttL3k2dWUrWnVP?=
 =?utf-8?B?OS9lcHppV2MzWGprOFhGdXl4Qm5xZHcvbW0vamZEOUd5MHlJUTFFdzAwMVdq?=
 =?utf-8?B?bThXYXEvdUtXbXlIL2c4NWxydHphNkFFU2JDL3JkSDlKd1VSTjZIdGhTT1F5?=
 =?utf-8?B?VDBMVnFXbTZaMU04T0owcGFNK3JSVm5ibFQ3ZmNhNlZyYmdzd1hJaVVMWUht?=
 =?utf-8?B?NWErNDNRM3hpZ25FZXo4cXNHWVlEMitNY01yeGFZQnd4Yjd1RjFRWU01QW5M?=
 =?utf-8?B?Z2REdTNjYldVUklsTldTMWtXbWl5aW9hd2hqRE5SSno0OVVXWHErV0tTT1FN?=
 =?utf-8?B?b0ptOUZNMFdQNGtGcjNSNzUweGdvaWxTWCtQQmNLRE52NGNHQkVsQzhXajRt?=
 =?utf-8?B?V3NIMVlkNER6Z1R3Q052VWF6OTFJYTlPa240ejVQQUp1TlBjTzVReTRUMGZl?=
 =?utf-8?B?dzV5NnhjeW8wY29kcWJKTGl4OXpTaUUrUXdrclRHQ0NKSlFScTBoQUVFRkh0?=
 =?utf-8?B?SWtXTXMvRjBDM0hNNUdGRkFUeHpEb2ZsQ1V2WHh6RkViWGpaRXAyNHkyZEhD?=
 =?utf-8?B?TSs0ajF0ZHQxUmZaUnNDNmF3R0RoMCtmdytiT3dPWnJkR2F1MjBraW5mNjhZ?=
 =?utf-8?B?OEl0WDlNNVRSSE80bXRaS0s2cDh4ZFVQeUNwOWN6MEw1R21WdCtrRVhqYTlN?=
 =?utf-8?B?NTQvTmZJSmdhY01tYWVsYUxVeTJ0bEJDRDV6Y1RuaDlaREpVUTA2S3lDNzJK?=
 =?utf-8?B?dEJsemRhVUlzYlhtYTNqck4yeFFjTERMdEtIMDBoQXZMZmNWeDF1Ti83bUti?=
 =?utf-8?B?R2lyc3JuOGY2dzlXcFJ1SWZoejFNODFITy8xYnhZbzFyL3dUc2ZBR1NRRVd4?=
 =?utf-8?B?QStpTWVic21NY1RaWitDTGZPVFVqZ2EwWXNzTlE2TWpRUm5ZVkhuQUJRa0R4?=
 =?utf-8?B?QURDYmV6eWllR21mbEFmMmR5TWtmWUNIaDdxMEV2cFQ3cTBWMDJsdk5hNmhl?=
 =?utf-8?Q?cBes=3D?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9390b56e-44fc-4475-ef0f-08dd07a6f35d
X-MS-Exchange-CrossTenant-AuthSource: AS8SPR01MB0029.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 07:59:38.7400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9Lg+IQX6NM53d803IgtFE4o5vx2IdFiOwDwGxHrefUwYInPsPzFcJlHK+15iKf7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10943
X-Mailman-Approved-At: Mon, 18 Nov 2024 08:35:34 +0000
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

On 11/15/24 20:49, Dmitry Baryshkov wrote:
> On Fri, 15 Nov 2024 at 14:25, Stefan Ekenberg <stefan.ekenberg@axis.com> wrote:
>>
>> On 11/15/24 09:16, Dmitry Baryshkov wrote:
>>> On Wed, Nov 13, 2024 at 08:38:11AM +0100, Stefan Ekenberg wrote:
>>>> AUDIO_UPDATE bit (Bit 5 of MAIN register 0x4A) needs to be set to 1
>>>> while updating Audio InfoFrame information and then set to 0 when done.
>>>> Otherwise partially updated Audio InfoFrames could be sent out. Two
>>>> cases where this rule were not followed are fixed:
>>>>    - In adv7511_hdmi_hw_params() make sure AUDIO_UPDATE bit is updated
>>>>      before/after setting ADV7511_REG_AUDIO_INFOFRAME.
>>>>    - In audio_startup() use the correct register for clearing
>>>>      AUDIO_UPDATE bit.
>>>>
>>>> The problem with corrupted audio infoframes were discovered by letting
>>>> a HDMI logic analyser check the output of ADV7535.
>>>>
>>>> Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
>>>
>>> Missing Fixes tag,
>>
>> Ok, I will add Fixes tag.
>>
>>>
>>>> ---
>>>>    drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 14 ++++++++++++--
>>>>    1 file changed, 12 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>>>> index 61f4a38e7d2bf6905683cbc9e762b28ecc999d05..8f786592143b6c81e5a434768b51508d5e5f3c73 100644
>>>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>>>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>>>> @@ -153,7 +153,16 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
>>>>                          ADV7511_AUDIO_CFG3_LEN_MASK, len);
>>>>       regmap_update_bits(adv7511->regmap, ADV7511_REG_I2C_FREQ_ID_CFG,
>>>>                          ADV7511_I2C_FREQ_ID_CFG_RATE_MASK, rate << 4);
>>>> -    regmap_write(adv7511->regmap, 0x73, 0x1);
>>>> +
>>>> +    /* send current Audio infoframe values while updating */
>>>> +    regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
>>>> +                       BIT(5), BIT(5));
>>>> +
>>>> +    regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME(0), 0x1);
>>>> +
>>>> +    /* use Audio infoframe updated info */
>>>> +    regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
>>>> +                       BIT(5), 0);
>>>>
>>>>       return 0;
>>>>    }
>>>> @@ -184,8 +193,9 @@ static int audio_startup(struct device *dev, void *data)
>>>>       regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(0),
>>>>                               BIT(7) | BIT(6), BIT(7));
>>>>       /* use Audio infoframe updated info */
>>>> -    regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(1),
>>>> +    regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
>>>>                               BIT(5), 0);
>>>
>>> Should the REG_GC(1) still be written?
>>
>> The comment before this line states "use Audio infoframe updated info"
>> and, before my change, bit 5 of REG_GC(1) was cleared by the line I
>> removed. Bit 5 is positioned within field GC_PP[3:0] and that field
>> doesn't control audio infoframe and is read-only. My conclusion
>> therefore was that the author if this code actually meant to clear bit 5
>> of REG_INFOFRAME_UPDATE from the very beginning. In short, clearing bit
>> 5 of REG_GC(1) is invalid since it is a read-only field.
> 
> Ack, thanks for the explanation. It might be nice if you can include
> this into the commit message.

No problem, I will extend the commit message with this information.

> 
>>
>>>
>>>> +
>>>>       /* enable SPDIF receiver */
>>>>       if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
>>>>               regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
>>>>
>>>> ---
>>>> base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
>>>> change-id: 20241108-adv7511-audio-info-frame-54614dd4bf57
>>>>
>>>> Best regards,
>>>> --
>>>> Stefan Ekenberg <stefan.ekenberg@axis.com>
>>>>
>>>
>>
> 
> 

