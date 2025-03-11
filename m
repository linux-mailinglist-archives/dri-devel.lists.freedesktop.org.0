Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C551CA5BB35
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 09:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23C910E538;
	Tue, 11 Mar 2025 08:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="UGeNjDDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013034.outbound.protection.outlook.com
 [40.107.44.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470E410E535
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 08:54:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3ejmcigOu6+F4cYSmsDUo0dD2Hl1ADlPKl7IzbeDtp64oMo+D50RQNgjaYZ3eGBQ6rDpjmhEuASl/kHkNpkUv2qWfMq2SzqmcVSsvvj+aabFwZV+S8aRvQoiHDFC0fDqlUGiXN8nS94mgFkF1k9Oj5QG/L5GhGyYYjgOQpaDNF3C+vbS/5S6VzaKzhfKw4HqSfL9fgRRk6o05megtsFW6A4dkZ+BXFs/Gs1fmWEuppFRkw01KMVE5HzWhVCFlpt5ADUo5h7jkp5C1q72at0rDjk4y0ucwbOfwekgkErYm0oDkZYVTr0MwqztKOZqmSxf4CuW6MZPQYdSRwa8wvv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLBSVZikwdtKaBi226WnPDaJ/bUJZ4WjcykbYu1Tk0I=;
 b=SEAGc+pHdLvl4yIHQvBPQUrk8OTwjfQr16K0r8geHGq2BJTc3SXvPl9YTgIYD0NevgRY78mzjx+ZCBznRFbYrmAbc4SCNiuW+H47y5Po2u/Wzxc3suzh1DY1wQ0XKAQlmTP4EaoJ3gNu1bSDmH2g7noJEjUbzFwTgIK/2ebdqh7LzcvRnwVbsDh6KP9ew0R4LFvMH6dFKO4kdEPd2RKCPgiVPQhK8WmcQvN6DpGEGV0cykrl2MHRdAVIrUgHKMfeIeLxA9SeBa2HK+KlVqn53nITxFENTT20ipcVQWjnnnEaFV2lvLzeTPHKiCF8o6aiTt9nJOhwTYCGIX0TaGeKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLBSVZikwdtKaBi226WnPDaJ/bUJZ4WjcykbYu1Tk0I=;
 b=UGeNjDDdFBxNFPsFl54ac3CXVwQOyX1UIMsO9PzBY9tTO0T7Xh6XXPWMwoD53mHRy2aqLydSFUkNuP5BfW+PI0NttKQ1g1YnXEZ7rBhDNm7+SN5K2x5nAwDSwwLT0uy2PaSPP2FDTc6pwpF85vvGiGKtSAieJKAL450DksF6UfdShEcOQKj4eAA1xMzJjPVB+K8FrxP7wQw0X0BqeCEE6hadXawYKmyAnGWV9g2caMTyf0j12xFQ5oBdu2VmNMPoZ/0Ts+Hffo6S0yH0fLRF0WW2Y3IMaK8OPal5fWZ+wu344vD4pkb8SdZwJC1izFfgFq9OrUfzuVDzq99GnXVj/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR0601MB5599.apcprd06.prod.outlook.com (2603:1096:820:9b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:54:25 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:54:24 +0000
Message-ID: <78cd737d-5e85-4d3c-8bb5-0b925d81719b@vivo.com>
Date: Tue, 11 Mar 2025 16:54:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: udmabuf vmap failed (Revert "udmabuf: fix vmap_udmabuf error page
 set" can help)
To: Bingbu Cao <bingbu.cao@linux.intel.com>, vivek.kasireddy@intel.com
Cc: linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
References: <9172a601-c360-0d5b-ba1b-33deba430455@linux.intel.com>
 <d7a54599-350e-4e58-81b6-119ffa2ab03e@vivo.com>
 <ab468ce7-c8ac-48eb-a6c0-386ea7aa9a0c@linux.intel.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <ab468ce7-c8ac-48eb-a6c0-386ea7aa9a0c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR0601MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: b7984295-c059-4127-7cbd-08dd607a52a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|7053199007|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnAwVEhGb1RnVUpTOTQ3cU1aRTErSlRzcngyZ0pPOVF6Wkh2VnZ6OE5qWDJG?=
 =?utf-8?B?UkVpUThwRWVZRFhTS0M5d3VqMVVNVGxobnBDdllMaFhTaUY4aFFMbThmY0xp?=
 =?utf-8?B?UWhiQmN4a1JVZ0hJTzMwWFRaMTZFN3FBSnZxSEtqMVoxS2E3RUZqSUpUY3JH?=
 =?utf-8?B?NGtkS2F1eC9lWHdnc3ZQa3ZWN3N3ZmpkM1k4eXozUU5iQ2JpSTd4RktnVmpZ?=
 =?utf-8?B?a1I3bWU3L21qR3BHODhsZ2dNaU9YelkyblpvOFpRdFVTTC9DNFN2enUxUjRw?=
 =?utf-8?B?a3pqZW9kQzBGQjMvZzhrSm9aLzRYLy81WVdEdVBGRjFlbTVGZGRPdVMwcU9W?=
 =?utf-8?B?d3Y3b2ZFV2hMelMzUW1PMFlENjdQemlFVGpQSkJWYTgwSnJuNWFQTzR1RVdZ?=
 =?utf-8?B?T1NjMnAvUFFRaDcySFNBRmR4N3RyWHBGYWhCbmlaejBLWGlJMysyanNJRUdO?=
 =?utf-8?B?cHlUSlRIWEZRVWgrdm4vODdQY2s3QTljeXZVc0hMZngxMXBaZEpTbUpKTUto?=
 =?utf-8?B?YkhOdFRiZUtMSzVpanlkTER4SmY2ZUx6OFcrWW5rSGJaQTd5MkU4QzcyWnF6?=
 =?utf-8?B?SzNBQ0s3QVA3NXFuQ0tqelNzTkVjUlpKbVhEd0lLd3g2dVQ2VVJOYTU0UWxF?=
 =?utf-8?B?NWwrUHdsNWhFYVpoblRCaHFUUVR0dFhZR2Zab2Q1Q252djNTQVNiOWFHZVFS?=
 =?utf-8?B?SXh4WHdnMUppMWdqaStDblR4eHBTUWhxVzNDbjZraERlMytSZ0xKd2pnM3Zw?=
 =?utf-8?B?ZzVGMkNjbWQzNkMrelRwWE40NEYwU2Vha0FzODI4dEdXZ3lITHZtN2tQNENO?=
 =?utf-8?B?eGNnRHBVOXBDdzJlRzdZWjJSOWM0OTdML09DRURScnpQRE95VkhaUlVXb2NQ?=
 =?utf-8?B?Sjk4ZmUyYjdSWXRuMVhjUkpUU2VQUHJzYm4wdlc4VlFxcFBaSGNBRlRTUEpI?=
 =?utf-8?B?OGo1aXlvdjlHZmN0aFV3TVZDb0ZITGhiSmxkRUV6WldDek9WdWtaSFo0bUVj?=
 =?utf-8?B?VlZ4aWpVaCtvU1NlY3BCWVVSZnFsOGF2Y052cVVVZW9TelJDVzRDdDBuSFpC?=
 =?utf-8?B?N1RGQndkZTNWTTVIWk1sWW4vbU1ZU21qUjR6YXBXNk1aeDNPdTVTVlN3YXhL?=
 =?utf-8?B?VndSTXl4b0psMk5sbG9aS2JIS3lFRzZvYjhvdFVMV3VOUG9OM1NrREt4TGgx?=
 =?utf-8?B?amV0bzZPT1VUTzJvalBPUk4yUkxHTFlRYmFQNE8rWjBkeUNhRWlVRHRNRGpv?=
 =?utf-8?B?QlB6Um52TDZSUVpSUnNqVnh2bTV1R1lXN2FyeFREbkJ2MTdpSk1welRLRHQ3?=
 =?utf-8?B?ZjVxNyt5YVVWOVMrcFYvNC9RNUowdjU4b1dyV2NMRDY2L1JYSVg1dk45RjRi?=
 =?utf-8?B?TFh4cXZBejdJNloyeTcyYjh3MC9NU2oyWjF3VU9ZN1JvUGFVS1BtUlV1YXFO?=
 =?utf-8?B?QXJmS002YW9rWElBNWRKRkhpTStxRXBlZGVzcHB6bzJPNWE4SS9nVnBaaWtH?=
 =?utf-8?B?cElnd0M4Zng4WVBOSHE1UVVSN0pwOFU1dTVvbTVVL0J5SFBIeUowaGFySWNv?=
 =?utf-8?B?UG1XWTMxWkNZUXVFN2JvdjFBL2k4MEE3SUNGOGV5N2h2VzErN2FqTmpGd01Z?=
 =?utf-8?B?TndybGd4ODB4M2lNRFJHQjYzWGNLSUFKRUpobGtzV3VQd0VaS2V3L1FxeExu?=
 =?utf-8?B?R05nSFREaWtpNjcwSTBNSVFzRWpKM1pRUUdPVkMyZjVjRXVxQzRQTDYxUlFu?=
 =?utf-8?B?cmgvS09LT1NFUkF3OG9QcjVCWkVmK3R1SEhPaVpoWXVIZVVSQmkveFgrbUpV?=
 =?utf-8?B?QlVvUDBlWWkwUkEyYVUvYlZRL0s0WFYyTlZjSTI0dE1uR0YzVlI4VjdleFZD?=
 =?utf-8?B?ZFlSbHk4bmFZY04rZFVkNGM4RnB6ZFVKNm5COERmbXZSOWUxaGZ5azJUM0hU?=
 =?utf-8?Q?HtVhuxMM5MKAkHD8evURQxwei/A/Nphd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7053199007)(38350700014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJrcDhaOWxiSkpzR29icU4wamZaS1ltbWd1WExja1RZc28rV1IxTnRJNExV?=
 =?utf-8?B?L2xlOEUvRzkwSU42blJSUC9nK2FZTlNiamZzWmZOeEs4V2xVb0pFV20rQ09s?=
 =?utf-8?B?dkZxNGlJbUtaUnRNMkFHZndnc0tVeGJYWTRTQWREUkk4VHpJSllFazViZENI?=
 =?utf-8?B?dk5XRUQwQ3Q4Q3BETWlEd3dJVFFsd3NQazN1MTRFbXpkNWNwai92QWhHQnhG?=
 =?utf-8?B?eStPQzRaQURRT2dVNTVpQ1JEd1A2T3QyL1h0ajZvSFRVQitzRnp3Y0VVWWE3?=
 =?utf-8?B?YUdxR2ZCOGFnMGxDbXJVZnhpQUFtVFZjdEFlVjdVNHFNUCtTRjRGTUJUT1ZB?=
 =?utf-8?B?Q2wzazlCT0NhOGdFQUNmUE14ZGc5Y2xmenZvcjhDanhwdldNMUhGYWw3Nkor?=
 =?utf-8?B?NE1PKzBhWHlRMkVSTmFKUU9tWEZvMmMwS2VFM1dWNDcyWnFoUitzQzZuSnZ0?=
 =?utf-8?B?dnRraWptWUFrQm9DZ1ZSMElaVzJtb0R3RS9ZOVdmZGNjYVZTRFF1d01nRnFx?=
 =?utf-8?B?ay9NNmQ2bk1oaFZXRHZvQzhsQmZXcW55bVZ3ZlhtTGFURUt6clc1aG5PWDVR?=
 =?utf-8?B?SlUrckpaU3E4eGlhWld1c2EyTUpXNWxCNElKdWtSRTJmZW5LRXFueVFLeGFR?=
 =?utf-8?B?QlZFMVU1U2JocnNFekUrNjNKVFV4dU1QeUlRQys5eGZIdmE4OGJVWjVaUlR0?=
 =?utf-8?B?K2g2OU9Ga2xHWkZIaHUxdlA3bVBySlJZL01lWHlVRE1oSW5DUkxEa2NLUmt6?=
 =?utf-8?B?ZkdRM3JKeTd2ZjBsQThITm9ubHlrTlQ3dXlyeFB4dytBd1haWUMxWmNRVW1M?=
 =?utf-8?B?WTVhVENXMUs2YythLzFpWXViY1ZkM1VieWtwZmlocGRQQkdVVkliTEI1ejhk?=
 =?utf-8?B?NlZ5ZTNTdkZrdHJHZFdUb2ZIWXhHRU1veGlmWW02dGVlcC9teWcrQllSa013?=
 =?utf-8?B?VG5NZ0wzTkF6VExnSFk1MGN1d1U2Q1ZIMDBHZ1d4NkRlZVVqV1h3L1dJU1VS?=
 =?utf-8?B?UUgrM2pRSTdUUHNrSFlKK2NKcFM3OHVIaG1mODB4NGNtQ0ppdUMyUzloaWVz?=
 =?utf-8?B?YkwrQXZ5eW5XRE9wZzMzTjdLOEtESGRJaXU0ekt3bkJIZkxNY1dWVXRYUXpR?=
 =?utf-8?B?cDk0cmNtblNGZnhpV2hCRWdPVCtQcjdBWmo0ejRYSzZBQVZIUFdCSG1UeGpk?=
 =?utf-8?B?UXR4NWNya3cxQ2RCeTZtbzdkK2tFVjg3YTBDSEJ5aTIrSmtnMzVKemh3bjFJ?=
 =?utf-8?B?c1V5Yzd0L3RjSkdLNGQvYTFneWU3Qkw5NzllQm1aem9HcWNGSXNjcnh3Snkx?=
 =?utf-8?B?Y0VPMEd2ZWpVc1pGNkFObGJId1F2NGVIUDZPdUtia2d1ZlJyRzJnVDdiTFlR?=
 =?utf-8?B?dXJtKy96THpiSll0aVZXUm4wNGIrcC9wNzNWU2gyRW9ibWZxRk5CTFBXREFh?=
 =?utf-8?B?d29MQ2FvakhsM2YzRndvSTlwUzVxMmZJRC8wWjJ2ZmM5M3B2S291US9zMjlu?=
 =?utf-8?B?N2R2OXVvaGNDcDdQVVNHYWdLSHRkeHI0SXBvWUJ1MU14S2JkalVEbjJqTVpP?=
 =?utf-8?B?aXVMQllyVmVVQWdXdFFOWjRCRWN0bktGTkhGT25ZTG9WMmRkV3lORFdFMHFH?=
 =?utf-8?B?SXhDMmFmQkkxYzViT0RWNEpVTHQ4UE9ta2NDbjZwVDlrZGhwRCsxYTAvSThp?=
 =?utf-8?B?T0cxK01VeENWVXpVQ25BTmhCdWcvRVpDT1U1Y0c1M015OVpmWVpXL0xJOEpa?=
 =?utf-8?B?Q0cxWi9sYUt3WW16WktGM0VHTEZZNWp4RUhpelJKMkJNOGdoVGZXOHkySDJG?=
 =?utf-8?B?K3F0NlhmTTJyWGVicHpjWnQ2SzNsWG9IenJvd3IxNXNzeHlGbFZuZUlIZm9R?=
 =?utf-8?B?UHhkVEhqMGRyRFBTSGVLRGp1WThDa0JsRzJUc0RTRmdCU1FKanFETFRQVlQv?=
 =?utf-8?B?Wi82djNQT2ZuVFE5a0I0NzBYbEpjYU9RV3ZPbnphYjk2bFZpZ1M0ZHdnaWU4?=
 =?utf-8?B?TkF6cmdRcUlmM3FUaFhzYjJleXVxZGYzazI4RnVFWlVESFZzbXhLc1JEbHpR?=
 =?utf-8?B?SFhDUCtPdFgxaCtvRFJCa1BNeXBETitCWmlBdWMxTzhNYWVSZlh3NnlVa3VL?=
 =?utf-8?Q?3oUNoSw2IswBsU9YFY672KpWR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7984295-c059-4127-7cbd-08dd607a52a2
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:54:24.6754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84N0DCes1ldf2roAeCwUuxbAajeWOV5IhWjdrAf0mNv12sxavGasolzsAnFca5NVi/yUyVdSEW0FF8j28GolJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5599
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


在 2025/3/11 16:42, Bingbu Cao 写道:
> [You don't often get email from bingbu.cao@linux.intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Huan,
>
> Thanks for your response.
>
> On 3/11/25 3:12 PM, Huan Yang wrote:
>> 在 2025/3/11 14:40, Bingbu Cao 写道:
>>> [You don't often get email from bingbu.cao@linux.intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Huan Yang and Vivek,
>>>
>>> I am trying to use udmabuf for my test, and I cannot vmap the udmabuf
>>> buffers now. vmap_pfn_apply() will report a warning to complain that
>>> the pfns are invalid.
>>> I dump the pfn numbers as below:
>>> [ 3365.399641] pg[0] pfn 1148695
>>> [ 3365.399642] pg[1] pfn 1145057
>>> [ 3365.399642] pg[2] pfn 1134070
>>> [ 3365.399643] pg[3] pfn 1148700
>>> [ 3365.399643] pg[4] pfn 1144871
>>> [ 3365.399643] pg[5] pfn 1408686
>>> [ 3365.399643] pg[6] pfn 1408683
>>> ...
>>> [ 3365.399660] WARNING: CPU: 3 PID: 2772 at mm/vmalloc.c:3489 vmap_pfn_apply+0xb7/0xd0
>>> [ 3365.399667] Modules linked in:...
>>> [ 3365.399750] CPU: 3 UID: 0 PID: 2772 Comm: drm-test Not tainted 6.13.0-rc2-rvp #845
>>> [ 3365.399752] Hardware name: Intel Corporation Client Platform/xxxx, BIOS xxxFWI1.R00.3221.D83.2408120121 08/12/2024
>>> [ 3365.399753] RIP: 0010:vmap_pfn_apply+0xb7/0xd0
>>> [ 3365.399755] Code: 5b 41 5c 41 5d 5d c3 cc cc cc cc 48 21 c3 eb d1 48 21 c3 48 23 3d 31 c0 26 02 eb c5 48 c7 c7 c4 3c 20 a8 e8 5b c0 d8 ff eb 8a <0f> 0b b8 ea ff ff ff 5b 41 5c 41 5d 5d c3 cc cc cc cc 0f 1f 80 00
>>> [ 3365.399756] RSP: 0018:ffffb9b50c32fad0 EFLAGS: 00010202
>>> [ 3365.399757] RAX: 0000000000000001 RBX: 0000000000118717 RCX: 0000000000000000
>>> [ 3365.399758] RDX: 0000000080000000 RSI: ffffb9b50c358000 RDI: 00000000ffffffff
>>> [ 3365.399758] RBP: ffffb9b50c32fae8 R08: ffffb9b50c32fbd0 R09: 0000000000000001
>>> [ 3365.399759] R10: ffff941602479288 R11: 0000000000000000 R12: ffffb9b50c32fbd0
>>> [ 3365.399759] R13: ffff941618665ac0 R14: ffffb9b50c358000 R15: ffff941618665ac8
>>> [ 3365.399760] FS:  00007ff9e9ddd740(0000) GS:ffff94196f780000(0000) knlGS:0000000000000000
>>> [ 3365.399760] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [ 3365.399761] CR2: 000055fda5dc69d9 CR3: 00000001544de003 CR4: 0000000000f72ef0
>>> [ 3365.399762] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> [ 3365.399762] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
>>> [ 3365.399763] PKRU: 55555554
>>> [ 3365.399763] Call Trace:
>>> [ 3365.399765]  <TASK>
>>> [ 3365.399769]  ? show_regs+0x6d/0x80
>>> [ 3365.399773]  ? __warn+0x97/0x160
>>> [ 3365.399777]  ? vmap_pfn_apply+0xb7/0xd0
>>> [ 3365.399777]  ? report_bug+0x1ec/0x240
>>> [ 3365.399782]  ? handle_bug+0x63/0xa0
>>> [ 3365.399784]  ? exc_invalid_op+0x1d/0x80
>>> [ 3365.399785]  ? asm_exc_invalid_op+0x1f/0x30
>>> [ 3365.399790]  ? vmap_pfn_apply+0xb7/0xd0
>>> [ 3365.399791]  __apply_to_page_range+0x522/0x8a0
>>> [ 3365.399794]  ? __pfx_vmap_pfn_apply+0x10/0x10
>>> [ 3365.399795]  apply_to_page_range+0x18/0x20
>>> [ 3365.399796]  vmap_pfn+0x77/0xd0
>>> [ 3365.399797]  vmap_udmabuf+0xc5/0x110
>>> [ 3365.399802]  dma_buf_vmap+0x96/0x130
>>>
>>> I did an experiment to revert 18d7de823b7150344d242c3677e65d68c5271b04,
>>> then I can vmap the pages. Could you help what's wrong with that?
>> Sorry for that, as I reviewed pfn_valid, that's someting wired:
>>
>> /**
>>   * pfn_valid - check if there is a valid memory map entry for a PFN
>>   * @pfn: the page frame number to check
>>   *
>>   * Check if there is a valid memory map entry aka struct page for the @pfn.
>>   * Note, that availability of the memory map entry does not imply that
>>   * there is actual usable memory at that @pfn. The struct page may
>>   * represent a hole or an unusable page frame.
>>   *
>>   * Return: 1 for PFNs that have memory map entries and 0 otherwise
>>   */
>>
>> So, if pfn valid, it's return 1, else 0. So mean, only 1 is a valid pfn. But vmap_pfn_apply in there:
>>
>> static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
>> {
>>      struct vmap_pfn_data *data = private;
>>      unsigned long pfn = data->pfns[data->idx];
>>      pte_t ptent;
>>
>>      if (WARN_ON_ONCE(pfn_valid(pfn)))
>>          return -EINVAL;
>>
>>      ptent = pte_mkspecial(pfn_pte(pfn, data->prot));
>>      set_pte_at(&init_mm, addr, pte, ptent);
>>
>>      data->idx++;
>>      return 0;
>> }
>>
>> Do it give a wrong check? maybe should fix by:
> I guess not, it looks more like warning when you trying to vmap a
> pfn which already took a valid entry in pte.

No, I think here check need pfn is valid, then can set it. If a pfn is 
invalid, why we set it in PTE?

Also, I can't make sure.

BTW, can you fix it then retest?

Thank you.

>
> However, the MM code is so complex for me, just my guess. :)
>
>> static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
>> {
>>      struct vmap_pfn_data *data = private;
>>      unsigned long pfn = data->pfns[data->idx];
>>      pte_t ptent;
>>
>> -    if (WARN_ON_ONCE(pfn_valid(pfn)))
>> +    if (WARN_ON_ONCE(!pfn_valid(pfn)))
>>          return -EINVAL;
>>
>>      ptent = pte_mkspecial(pfn_pte(pfn, data->prot));
>>      set_pte_at(&init_mm, addr, pte, ptent);
>>
>>      data->idx++;
>>      return 0;
>> }
>>
>> Please help me check it, also, you can apply this and then check it.:)
>>
>>>
>>> --
>>> Best regards,
>>> Bingbu Cao
> --
> Best regards,
> Bingbu Cao
