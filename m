Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057239CDA8B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 09:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4066710E3B6;
	Fri, 15 Nov 2024 08:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="MIuvpyDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2070.outbound.protection.outlook.com [40.107.249.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA1410E7C9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 09:39:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geP6ciJtVSCsI1tjklGJqTVOCaObdP4ZGfqgdA6Q2dq/k3I7BhH1Nk5Ov7zpyOS0gk9xoHYHsvVZLiHm2HeIin4zoy3dokOaSWPzR1ETf1EtpyPRidcxEvd3E/n/mECrbuWlRdlNAPHrezBBLNudlUDwPp93lPI6JKoTPlBvlPMvkoXe5uBSbvjmk6uLMMpaAKWZPMAntqqGjs4lgMIx0xKEzac6USX3x25AQmKbj63MscYT7Oe5swBgBcKofSDQ8mADWO+o9Q2OR97WFaVat4enYxxLNv6acCopmaY1ocktGx0cyYtwuDL1D2AJQ/ViDqEhMpjGlMEBmLvelks65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8EvWtEao6d6hMqRqEtX62bvgP6Blu47T3zMYNngkTk=;
 b=ruReq9nDaANDYCJNCR9Xwlsblfbj9XfoGQG6w228AP5SDuG61JqpqK4HpaeCq4G6go2WuyqiT3Wn3Xn9J8hm+Crf6HZSNLUagoBvBei5VN1KtbdEsDSAd+iGCG12MY4WpeMh0QKZeBrgmK+YWhby+NHiYFI2/By+hUaOAaSD43bTVL+YFOA2jC3g/VZwRkDy1j1xafuOLTMraGqZTSPD2+8hdo+/tBoOS2Qtc/z0Jyw8OOVi5Ovzpg4dxHLFDGn794jxSyig/AyvnUIAaN3bKmlvddZQ16Kabzh32Ot8kP2yKeU8zRhBpGHG+RwhIHbdHq62q0pREoP/W90FE7m9Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8EvWtEao6d6hMqRqEtX62bvgP6Blu47T3zMYNngkTk=;
 b=MIuvpyDqxDD8+U+U7GRz084E4ZpQ+EGCsUiXMex3qlYsehA2UAEUUZPCRvsCD8x39N1K99aKFrviVUgl+G5YE/8MmSWkUypZjZpVeycWI2AlSJrnmpiLE/GFMtB1IetjvrmQSqvK2+0QsI4Gzv/1joOC1KoXarUSMiGHcquBx/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7627.eurprd04.prod.outlook.com (2603:10a6:10:208::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 09:38:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 09:38:58 +0000
Message-ID: <030c3b0f-9396-4fbb-af4e-cf2cb58ffac1@cherry.de>
Date: Thu, 14 Nov 2024 10:38:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk
 verification
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20240425195506.2935955-1-heiko@sntech.de>
 <20240425195506.2935955-2-heiko@sntech.de>
 <cb73853e-4201-4cc9-9e8a-f977e66241f6@cherry.de>
 <72672888.8f9.1932826549b.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <72672888.8f9.1932826549b.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 450ae1bc-8f00-41d4-3030-08dd0490299b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NktUaGtZeGNWQ3VmUEk1TEEzR3BURndOYWE4WG9OaFpwcGhVbURCTHMvK1hy?=
 =?utf-8?B?VDBIVHpHeXQrNy8ySzJhYUJUWWVtQm5YdGFxUk0zRkZIQzh1SE5aaFF3d2RJ?=
 =?utf-8?B?V2FxTlc5U1ZINzJ2Q1V2UUM5YjNPN3RQN2toVzE3eSsrcmhGaUx3Znkxai9Y?=
 =?utf-8?B?dmJPZm0rZm5qWkpSb3hTOGZ2YUNDWTQ5MVNvT3BBdjgvc0xINERscUpRK3lW?=
 =?utf-8?B?TldRbm10TUU0bTUxcDVLeFhncTZ5aTR4SzRoYkJ6amhpZlZnWGhrUmZ3aUI1?=
 =?utf-8?B?YXFKL1RiNXpEcGhMaTJVdTUrWURiMHlqWG1xTkhqalUzejRFNXA1dEl2cVJ4?=
 =?utf-8?B?akk1cjVWbVpyMDRFZ2lteFRLNnRTZW5EV3Y4Zk0yWWxoaW1tY0c5LzBLN1l3?=
 =?utf-8?B?cks5OTRTOWtRR0tXVFdjakJGc3FFcHljYnN1aTZWYW1VeFhLUGUwUVFaYm1y?=
 =?utf-8?B?OHBwYUJXZ0JWb0V6OXFVUnhvRjYrejJ2RmxQQ0VkbExsR01XVTlIT0RSanBy?=
 =?utf-8?B?MXQwclJaYVp2NlVtcWxuMDNDS2l2UncxbW1oYVRBVjYyM0o2K3FCZDRuY3Jr?=
 =?utf-8?B?UVhpc3I2czJLcnliZ0hQYTZVbnMvN0lSUHFNcG9RWGhjTG43a0s1VENpMkVq?=
 =?utf-8?B?UFJuWFVaN2lxV3RDR3lSczJ4cTNCQUpOS3IvZG5hcExteUx1TE00aVk4Nzlx?=
 =?utf-8?B?UDNpWUlYdCt6c0JBb3MzNkZMb3RnTGp0WllxdVI4TlJrSEVSWlBBWjJHNW9S?=
 =?utf-8?B?OEVkUm4xa3A2ZXlNWlQwdmhBS0NpMmZnbjNVbXNuazUyZ3duT0RsM251V20v?=
 =?utf-8?B?cmtrL3JkVHFuK3ZOS3p0NGVyNXZ0QTJBaDkrV3dZSi9Tb0M0a3FJZ3ZqYXA5?=
 =?utf-8?B?Y3ltU0hkTG9HRVZ4Y0I3R2JxdXVMSW9LdWxlL1ZxU1BwcGZ5a3EwcHEyL0Fs?=
 =?utf-8?B?VVZHVHdVei8zdTRDS1ZBa2tHM1FMQ3NaUnJ3OFUrRm1lODVnWU5WRHdMaFds?=
 =?utf-8?B?dlBOR2RyY1RSRHVwTXI4ZG1TSTVBZWxpY0xvUGxUUjlEdGhqMmVvRmpPVzFY?=
 =?utf-8?B?ME5IYklxTkdsWFVwZXVHVWpjZ0hDWG1mM0FrcHRhRXFJdE5MT2tvUCtaWlV2?=
 =?utf-8?B?QkhUUnIxS2hTeVVWdzFZYXgwUVJnaHVXeFU0WjdVSVhxWncxWGJ4YU1tcHJL?=
 =?utf-8?B?c05QcGsweEZjOVhEK21pOElZZERHZnNxWG11K2RULzh4SUhPWnc2NXVPODFX?=
 =?utf-8?B?U0pTd2V6azBHbk1VVk9KT3dra3NaRGNUYnRDampvSVVpUkV2YXEwOEEyRlhU?=
 =?utf-8?B?YmFSeWJVUjBvcU9OQ3ZYUTFBUDFHUU5KbG9JT3JzdWlLdllkNURHYkNWcC9C?=
 =?utf-8?B?Y2hEZmlXNkxQdE1zYkN2QzRNTTNtUWNKd0o2cGExSEEzQ3pEd1BRa05GcTZm?=
 =?utf-8?B?RHR4M0hZMHVBVm5VL0NLQmY0MGlDbEg1ZnNoa3VNcXlJTGpuRE5kdG9PWlN4?=
 =?utf-8?B?WnAzbXRiTTVzOU12WjBkcGxON01xRVRCeW9rb1dHS3RHTFFlQ2h4amxBSHdS?=
 =?utf-8?B?ZFdZQVpYZ0FSOFJGdHVGaElyQ0RTcWZlY3NtZk43V296TDJmK3Z5MXN0Z1VV?=
 =?utf-8?B?SVFxRktsZ3pJUlFOQ3Vrd0JWeldhV1A4MjAzNjNaeWJsY2NtQytId3lEdG9h?=
 =?utf-8?B?K3g5bGd3V1NyUkY3anR4QnZJaUVsSVpwSXZFZHYzUVp5dlVmVzVyU0hCUlFT?=
 =?utf-8?Q?cASxPu0o35U1Q7wiuAUnNn41ClRypRrd2QbRFfV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3dvSFVFY3J1STZ2QnZCTWJhaDhsYXlnYXNJVlViYUlDU2ZuSUVZL0NMUTNR?=
 =?utf-8?B?TVRuZG5BUTdLYXBBMndoT3RmS3NCWU9RR2R4R3A3NnQ0MVFNNEhRc281WEhE?=
 =?utf-8?B?TGNZUDE5cmpWa2pTSGhTSW1nZ3lXMTd1U2dNSkVCTEZBV01nZU9uZ01Rd0ZW?=
 =?utf-8?B?NE1TR2F6bjVoc0orMjBCOEpUdGNTWU5ZVDFxVFA4NDdId3lFa21tbGwvSi9P?=
 =?utf-8?B?ZmdnZ1VqUjh3L2czWWxYdkZydkdueDAyYjVlVzZ4Qm9vZnp1VDZpTHQ0K1dI?=
 =?utf-8?B?b0lKWi8yM0hKM1NFTElndEozcTROd2FqK3ZEQlA3QVg5b1ZaU2RxTUlMTWRi?=
 =?utf-8?B?amZaZk1rL2J4Nk5ubTVRVHBGM3VTZzlOdTNTUklwMURWMm51MEJ1eXV0Q0sw?=
 =?utf-8?B?ZUtYRWdva0t3OUs3eEtVMzMzUzRsK1czR3pBdllobmtJSzhlbG9nck9JK2gv?=
 =?utf-8?B?U3pGbGF0U1MxajNhdTZDeDBiZHRGcGMwb0g2M01MNFhlcFJjL0I4cHR3aTVG?=
 =?utf-8?B?YTB4OUJIaG1LRlBwRTFXV2lFMXUybmlJRGFnSVBCRG9IOXNoaGY0VklmNFFV?=
 =?utf-8?B?aWtGVU5wRXVZaFFnZWhvQW1xN3dJeUw2QlpHY0l1WGlEMWlrbW1UV2V1L0to?=
 =?utf-8?B?eWRGT0o4U3lzOStMOU4zY2hldGwyZDFvNVJIOElYaXNjK2tFcTV6YkRiaUxR?=
 =?utf-8?B?Qkt0M1RKZDlHS0VzNjJnZkVhSWo5eVVDRWpZYTBQV2puMVA3MlVnVTl4bEtE?=
 =?utf-8?B?US9Mb2poOElpM2F6bUdrTnJCTHMrZ3BXMUI0VUxUdmxuQ3J2WEtFMmhNVjU5?=
 =?utf-8?B?T3MzMVM5LzJaZTBtdWl5eXNXVVpmZE9adS96d0lHQ24rRnZHVmt2ZDl3bHpw?=
 =?utf-8?B?dW1nRVBwY2QwRHdiNkl5VytLeTJ5UWRKdUhUQ2UrbEJjR1JKUlRjbnlteG5u?=
 =?utf-8?B?QWFWLzlqZ3IyYmptRDZaUDl2VEtjTHFVc3Azb3o0alBKaFo1N0crUXI2cit3?=
 =?utf-8?B?dVVoOUgxOE16ditadkNydSt5UHFQdW1NOFpnbUs4N2lvamFvNnEvelRDUFl5?=
 =?utf-8?B?L2tYbnZaSXRXcFhJNG1TcDRyZjN4SEZwL2psd2RzdmZBbTltMDNlQUZ2dHBy?=
 =?utf-8?B?Zi8zMkZCS1RKMVZ1UEE0SGk1aTRUcHk4aXJNMFpEeDI4WkpPeGlHMktpcGdu?=
 =?utf-8?B?TGNtMktTVmxsT3ZEUXdPcEdSY2FNckZSQnliV25NMmlwR1N3bVg5ck9OdGxP?=
 =?utf-8?B?bVU5akdHZ0k5eVJSSVF6aDA3R2IvdjJDYUpTZTl6akFEQlR5L05OZmFsVWgy?=
 =?utf-8?B?WDVHWURmMDZFS25LQm9ZOFRLMDBNYnZNQUczWW10R2FJcE5QZVlHeUZwUm9y?=
 =?utf-8?B?SWg5VEkzZGJyUXBXMjYxQkFHTTBpQWJuT01jd3ZlRmMvN2hRQ0xIVEtudk52?=
 =?utf-8?B?THEwSXhKdHg4ZzcrQVllYTVhSk14RGVYNkpOeVBHbTV5bmZ4QVV2UjJQZDF1?=
 =?utf-8?B?UmpNT0hadUdhUnJERllQdzhqVnA1Q09rZjJ4N1ExOW9NSFh2WkpQTnRvKzEz?=
 =?utf-8?B?TUU3Sjd2b0RQbkdTZ3NzYTJ6a0QvSm1hL3hORnpwM1pZZFFjRElhbWhnNUNz?=
 =?utf-8?B?QmFUNWlVTXQyVmtueGhUMHo2Y3Y4Sm1kRFBCazJCaDlXY2ZVQnZVVTJNUllG?=
 =?utf-8?B?cVFVTzQ1dEgxQkdnRDlXZkNFdk1GVUFWZHhPSlZwMDRaNVpIRGRDOFZNbEhC?=
 =?utf-8?B?NTlFb0VJNWJsVG16bmRVN0tvNFQxaWpWYzZ0ZkJqNVU4WHZpZW54MWZkbjVG?=
 =?utf-8?B?dU8xZjN6Q3R1a1BlMEJCZDJPNDJZaWpOWnJpd1NWLzNveE8wKzJVajlNQ3ZM?=
 =?utf-8?B?bllGbkZqeEFTNVd3cFZBMXUxVnVEamludjFjUFlxZ2gybE1mNWd1cXZVZXpi?=
 =?utf-8?B?YlJlelkxUUtqSjdtaS9tM1VKOGxheHVVTjFza1JRcWlUZ1lJMnF5dzIxc3ZU?=
 =?utf-8?B?Wmk3UU01RE9nQzBHZ1NjMEpzUmZxUEpTUXdYeDdYNk1iUmpHdzFubTZKS2lV?=
 =?utf-8?B?M1ZzVElCSjRDTGxwTm03NTI1dHpMcmU3cVY0NHlQaDg3Q2U0NTRNUGwvSkZj?=
 =?utf-8?B?bEpxeXpPNWpZRVVxaXhhWHRCaWRZaDNYV0RTc1FVd0tWaDZ2TDU0K1FWdVg5?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 450ae1bc-8f00-41d4-3030-08dd0490299b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 09:38:57.9229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/Q59u+mrcwrdkFFW5OZIKK4CfMADPPziABtV/vjk9bG+Xj1K97wWaQGzzrsu4F1YVquz3DuHRP3dfNdHnJhrQ6YzqM4Y13pj5XNbt5YwQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7627
X-Mailman-Approved-At: Fri, 15 Nov 2024 08:33:00 +0000
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

Hi Andy,

On 11/14/24 1:50 AM, Andy Yan wrote:
> 
> Hi,
> 
> At 2024-05-06 15:44:36, "Quentin Schulz" <quentin.schulz@cherry.de> wrote:
>> Hi Heiko,
>>
>> On 4/25/24 9:55 PM, Heiko Stuebner wrote:
>>> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>>>
>>> The clock is in Hz while the value checked against is in kHz, so
>>> actual frequencies will never be able to be below to max value.
>>> Fix this by specifying the max-value in Hz too.
>>>
>>> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
>>> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
>>> ---
>>>    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> index 9bee1fd88e6a2..523880a4e8e74 100644
>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> @@ -1719,7 +1719,7 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>>>    		else
>>>    			dclk_out_rate = v_pixclk >> 2;
>>>    
>>> -		dclk_rate = rk3588_calc_dclk(dclk_out_rate, 600000);
>>> +		dclk_rate = rk3588_calc_dclk(dclk_out_rate, 600000000);
>>>    		if (!dclk_rate) {
>>>    			drm_err(vop2->drm, "DP dclk_out_rate out of range, dclk_out_rate: %ld KHZ\n",
>>
>> It seems the error message is incorrect as well and should be saying Hz
>> instead of KHz. (note also the lowercase z).
> 
> I think kHz is fine, we can find many siminary usage in drm:
> 
> drivers/gpu/drm/drm_vblank.c
> 656:    drm_dbg_core(dev, "crtc %u: clock %d kHz framedur %d linedur %d\n",

The issue is that we print kHz for something that is in Hz, not that we 
print a value in kHz.

The former is incorrect, the latter is fine. We are in the former 
scenario here I believe, so it needs to be fixed.

Cheers,
Quentin
