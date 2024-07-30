Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2F94057D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 04:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB0410E49C;
	Tue, 30 Jul 2024 02:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IRRFDmNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C54C10E49D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 02:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6fiwcswBxqYdIA28koLuInpBWFD6EuRpUwshjMxKi35Y8jJTqzpMHpkggkzEzxociD3hOGh9rISjYuVhSbl4pXS2AaB+iFY3hI0jCWST9b1q/91n1HoggayPvIKFGbwqjICn6thg91iWnfChwU8k6+Z/thrP6Smfs2zgRw5JpUeCBs2N6u10+rp21Dap7enTq8KogfQYkDYMd2fvPDDheoU22rUy67Pld8iT/1OdAoGovJe6wXTDOeK2KzsDvQwJwiTGPkDNSylYvQbXLBD+zuLLkvjpGWP94hLHuqzU4niRSHrljrXXXsLybzpwexrDseHV3SRQmY4lyo8bF8Kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARWLxu2Y/w1UsMdvTXbBk+blJhCd2KJRwmitIbURASs=;
 b=qGEuI6YLdDJfeGGwWoSPAqqeYaHInDvsDrc7zvLVs0o3Q6YqfGtqy2P7/HJUKmjzgGL0mtJM9823+KeKEklkZST29syeF4dBpt17ab/ESuy9UGiHx5Y/znNQCtH9iRccHYqq/U4DIckHHJ/ofule699vuuT6HRLNS1x73XuP1dHdWZxqcDcdEUAnPZhQVCX7fLinkXxau7f/KoOe5pKsmr7i+x0f7ohQvn7Dpys+X9CGcrGa2uqaIe3neEUH04Bnh3LM7fHKXaBp4Ws9EEtAIAkol6+tpdkdGrJJLRqrvxOHbkcvp7L7/Qkfnaj99mrnxS2K1/B72nEX2fXNxeP2Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARWLxu2Y/w1UsMdvTXbBk+blJhCd2KJRwmitIbURASs=;
 b=IRRFDmNKzt61omvttjl15RK9zTHn7bPpTnvMf5Mp928r8SF117OuLIZoSfEmKmhwoc+JR8ZtCMj7wreTJvXH8+56Du9+SWh/MJiwZBYjXheKWDxcmsYUwAprHu6N25h5sfvfBvGELjfp6DGYslHrdNEM3iRqBQrTevjAJ0TvEo0Zg9Z5JvCMrPvKyeFzi24/GehjTBCsVcNm0twhHOqnFBjkp20Pz9iCXgDOMEqnq7m0P/0AStMl+my+jO0hQvlkGZb3vEQHCuabVFfQlo++CNdDEZb8/3VPFVB+o22u7H3rhffiKKLa5AopQ8ROIrqz3vlX069jWDOtq+ZdM6c26A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7703.eurprd04.prod.outlook.com (2603:10a6:20b:23c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:48:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:48:10 +0000
Message-ID: <15ff5315-57a3-46ae-9f1d-f707165294e2@nxp.com>
Date: Tue, 30 Jul 2024 10:48:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ARM: dts: imx53-qsb: Add MCIMX-LVDS1 display module
 support
From: Liu Ying <victor.liu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, saravanak@google.com
References: <20240726065012.618606-1-victor.liu@nxp.com>
 <xoj4sypxndql62k64ztmco5ufddeysp26fyc46prwr4ezik223@sssy5zmefwtg>
 <2488314e-7a0f-406c-acec-ee106038f238@nxp.com>
Content-Language: en-US
In-Reply-To: <2488314e-7a0f-406c-acec-ee106038f238@nxp.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5227ce-0d08-43ec-d6d2-08dcb0420c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmg4NFE3R2NCMXJqSng3UFRTQVJiTVBJVk05TVBCQWZ3L0Q2TTJ3OUlvVnJr?=
 =?utf-8?B?QmFOSlNkUDE3WkM5TVQ3Q0liaEVLS2tESGw5QkNock1mUzE4VHl2KzlIMTNW?=
 =?utf-8?B?TTlxZ2xTaTBob1FjckpkdXNEQzVSVUFmUkVITUhKZk11N1pleDhSS3dVSHFy?=
 =?utf-8?B?MmlYMFByZDVHYnh5OXJneHRBOVJ2dVIvM3NwQ0Nhc1c5RzFJQTZVMXlReFo3?=
 =?utf-8?B?bXNkM1phVURvYWJ3bCtaWVVSTXhVekU0cnc5SjdNRVNTN1NaaUhoTGJob1Bv?=
 =?utf-8?B?bGVDcEpMUjVRdFVmam9IeERqTktXa1M3WWlMV3hXZXF3S0xPbnYxUWdLeGNR?=
 =?utf-8?B?WTR3YnJNSFA5eklhU0IwWUxzQjIwbDl5bUJJdWpFek1lSnpKVHVsck5ObTc1?=
 =?utf-8?B?VU1wSFAvNTNaUWpKc0VyNGIwZnR2cHJZNEpibENodGRNV0pIKzZQZjdORm0v?=
 =?utf-8?B?NjM1MUFZYXRYcDV5TVNreHdac3hPMkd1VktCUnNUSjlVVGM1TWdYZ0w5Ui94?=
 =?utf-8?B?eHhsdUJrWmZnYUlnMmtEWkxvRXZ0L0xYMlpha3FGRUtHTXhTaXppeTQwbVhJ?=
 =?utf-8?B?WXhONS92MnpZbTE4UW4vOEhRWnNCRHBVQ2RpMlltb2JLUTBXdFY3dFNEQUdB?=
 =?utf-8?B?SzRpa1AzYkxHNmZaakx0QStkdWJOWE5xLzlBUkJodVBkcFhWZTJhZFRteE9l?=
 =?utf-8?B?ME9SM3RkOU11ZUtEdWE0V2tWcEpkOXI1ZFRhb0NQUXZGWFo3L1JEUmIvcGt6?=
 =?utf-8?B?eGx0c1g0dFV2TEl2TjUxWm4yZmFkeldzVTlTVUozQVl5c2VVZ0pDZzlFeC9G?=
 =?utf-8?B?aFFXNG9LWHM4YU5zeHkycHZ3MUZtMGUzODVVL09KRExQRUVNTGo0bnkxLzQ1?=
 =?utf-8?B?YjhGZ3NYd2tPVEJ3bndWeHBQcHM2bTVIUW9XVVFVRHZsUGh6b3JoUHMzK2E2?=
 =?utf-8?B?ZzJDc2ZSVUtaOEFkNy83QVdINlNQL3c2czZ6dE5HcGs4eDRWUE1JSmczYU1J?=
 =?utf-8?B?UlcySFprNTZYUGdPS3JRMTNkMTdTM0V6RVFTUkh0QkxyeFIzRGtyV01wMDFp?=
 =?utf-8?B?b2xkN09PaTB5RUdlaCtDNEZRckwxcXR4Y01GV2dYRmpaYVRRRU03Z2FjZnlY?=
 =?utf-8?B?YlRQdjh5ZXVYaGpqRnRDcEVmNnQzeHd0YjA3NEM4bEcvM1d1Vk53TmVBZGZj?=
 =?utf-8?B?NTlONGNWbUxPWmtNK21raHdQYkdsKzJ4dklCMFAxTVhnREs4bXozcndHUW1F?=
 =?utf-8?B?bndnQ0txaVBMN240ckpXL00xSFp0S0Y5Qnpnb1V4MVpLWlRIWHhUTHV1RnB4?=
 =?utf-8?B?WUFROGFWaDMwTFR3WEtuejdiNWVVT3hSclBiSnllLzBIOWNUcXg2OU5PTmFO?=
 =?utf-8?B?enlvQjNpQ0tUWmhEY1lvazcyTkNrMjJzSzU0YlUyTVZZTnRrL3dKNW8vZzl1?=
 =?utf-8?B?bmNrbEd0ZDVQbkJPNmxxMFlNTzEySG5Xczh2YjY0OHF4UFAxRHBJZTdzeVAr?=
 =?utf-8?B?Zm1zc0p6V1hDS0YrK3cvMXZnVVZrTGZtbTc1UVhEN1BBNXZRS0VzYjg5bGtl?=
 =?utf-8?B?NWlIbGkrTXRLRzcwNVJoN0JKWVg0UVgxb0NkR055YkxWUFZlZGlvRGphOFVs?=
 =?utf-8?B?a1RydVNUN0JmTG5sMWdVN1ZKZTNXZVN0VDlYNnZ5N2lWMXQyM2JsdWIwc2RH?=
 =?utf-8?B?S3pydTJrdlN4N2ZnNDd2andqY2htUnRUY3VrRlNSenc2ZEM5cUxLQWxUbG5C?=
 =?utf-8?B?a1VoZHFBV01OeVl1WjlxcmJHeHV4SDdWLzlMLzltVytvY1pEdTEzREN4M3dl?=
 =?utf-8?B?Z3QwUVIyS1RINmpHVzNzQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVBIVngwcDdFaU9hSTNmUGFRbDFBRFcyTkNSdHYyMVZONHVWcGJIbG1nZ2Y0?=
 =?utf-8?B?SG9XSjZtKy9KUzBSeExNQ3FsR2pWTTloNTFuaDlqSDEzejVFMHQvUm1udTZC?=
 =?utf-8?B?dkNvdGFvaWU4L05OY003c0xTNEQ5MDE0V01MYXlCUlBPNXc1SGNKSEtmNTBS?=
 =?utf-8?B?bVJweUcrczl4OUFTdnFVeEZrMmdUK2N4c3hQczNLNGNzSUthNUpQT0VnQ1JF?=
 =?utf-8?B?OWtoeGRHQ1QwbElQWGVFL1RYR0JhajBsUUNtZTBjQ2VQZVpHM054TlFaUjhL?=
 =?utf-8?B?QlN4K3lEUFdPL0xacmhWZXluSUlwa0R5N0lQWU5kc0VuSHpleXowMlpBeVJH?=
 =?utf-8?B?dzVzK0E1NWlUZU9uRmxBY3prOFZlQ3Jvdm9lbVdaRDhiQll2SUN6WWg0bEM1?=
 =?utf-8?B?QkdvWkdpSTNoQzc4a2cydEYvdk0zMWNYN3g4YTJ1NE52dkNjTmthK21mN2NC?=
 =?utf-8?B?b0dkemtXdEZOYmpLNS9CR2YvTDMvU21ZOWxwT25vSU9zOWJoYSsrSWpObXFz?=
 =?utf-8?B?d2FMY2tRMnBRYmFveGQyUGlEZHlTaGtITkJ1WmszNXhjN2g3a2dZaUU4Szlz?=
 =?utf-8?B?SERTUE4xSDhIWWNaK1BNMVFyRURhTUdxWFZ1VkpaN0RRK0xsMXRKQUFUaHE5?=
 =?utf-8?B?cFNCZFlqdkJiV29xRFpKeXhrY0M3VDQ4bzU3WEh5VjVEeHdlZjhac2t3MU9j?=
 =?utf-8?B?VmNKeEt0blhlZlp6cWFoOEh2d0FLaFEwc1V6SVlqYzJsMmpTdnhkbzdmU08w?=
 =?utf-8?B?V0VQOXV3OXlpWWRnSk1vZWoweGl3REo3aE5KNldwQ0ZiR284MUhkYS9Zcnow?=
 =?utf-8?B?MUNHUTFRUUFKOFJwSUxzbGtkcmlFZnZCZ2N0RTRZS3Z5NXFTR2ZJdjd3N214?=
 =?utf-8?B?c1BoMzNZMmswL0Foa3NjcUhWV2ZHVzZMWEw1K3k3TkN1MTR5T3k1bjFIc0Zi?=
 =?utf-8?B?TzBzTTFaVFVLRzkzTTNIQ2RJWXdMQ0gwdU1CWUVRYVhrQnQ5Rll2cG9wRG43?=
 =?utf-8?B?aFcxc05vZWRNZG1YajdJbURYWEFLQUFVc0hJdnQralBsNU5raTJCcDRZQjgr?=
 =?utf-8?B?RlhTV29DZ3BnRWxpSmN6U3NuaU55Sm1yOVFjQUNXakZGbzhZQU5SZ0JzZG10?=
 =?utf-8?B?cWlueitpRVZ6dHRKdFAyT1MrT0RYSzdjT3RHcDhtYmtnbVBmWjNOdm1XVjhm?=
 =?utf-8?B?c2IzRW0yR3p0RmpiMFlSOFdPRG1vczljbzN3LzU5TFhvSFptbnVtU1l0eVEx?=
 =?utf-8?B?MlNsVTZoZTlwQ2FzN0YvWkJyY3UzbmZ6QU1BN1pwRjByS1hhcGFkc3pFMmxU?=
 =?utf-8?B?VnRsang4ajhZU1l0ZEt2bW5VVFZBUmxxQ0FUeWNUcndlL0NOVUxIZUNTaDVi?=
 =?utf-8?B?Ny91QzZ4Umk1UmpPNmNoWUpOVStTR1BjVjdzc3pYeFVJNnhIZytKOEUrZTc4?=
 =?utf-8?B?OUJCMm9VUlBvL3pQQTFndStvQm0rNUR3N2pRTVYyZW1zam9yTkdhZUhYS2Vm?=
 =?utf-8?B?eFFaeUJEdjdHOXdCa2dTZGxaRU5PUHNYekNuWjZHd0JId25XVDA3N3J2bC85?=
 =?utf-8?B?dk1Id3hCYVFEQkdVNzYxckhkMXVPMWxxcnR2SjBNbFZhWWU3ZDdrbVk0cnJE?=
 =?utf-8?B?SmRmZFB6QUM1K2kwQ1BQcWUyT0RCNFlkRlM1aTVmajhKNXA4N0NCZDFGd1hw?=
 =?utf-8?B?U0w0SzY1dXQ4QitzaVJzc2Q4bngwMVRmc1NsN2dhNWRhdGpLZHVHcHVuSlUx?=
 =?utf-8?B?VmNaOWUwSStmNStScEhiRVQ3aFQvU3E4ZEV5ZVpSekJ5czRmL1ZwRlhpSEpC?=
 =?utf-8?B?UTBDdk4vU2lJRWVOZDZObFEvZVJWeloxdTdwaTdndjlkQURic2VqdEk0WkRU?=
 =?utf-8?B?cXFKditEb05kRVpSdmQxOUlTQlA2MWg2aTNHZkx2RTlVZElNa1JOcjhuZFdv?=
 =?utf-8?B?bkpDV0NMdTdsc0FVaWRiTDBYLzZWLzNqR3pNK21zWFRKb2NUL3FJZzR0Y3Mw?=
 =?utf-8?B?M0M0d3BtUVpBVllqSk1iRVZ2LzJqODhXSHBML1hiQ3NCZFdUWHg1V1NKNnNE?=
 =?utf-8?B?QzdQSGRaUkNzZGIyN25qOXB6ejFkUkJOSUhLNnhjZWNoeGd1Ky9XQmRWMmFT?=
 =?utf-8?Q?Pus9yvxq4oy1CIVsYZ0FHAeOv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5227ce-0d08-43ec-d6d2-08dcb0420c4a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:48:10.1757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWUN++Lf6inuzlPUvCDFsbvffLSYsPV04ikw41H0w1TwGGfZzcnGR4X3+sO9x9+s/gaV5qOjfMmUDuM+ejI1mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7703
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

On 07/29/2024, Liu Ying wrote:
> Hi Dmitry,
> 
> On 07/27/2024, Dmitry Baryshkov wrote:
>> On Fri, Jul 26, 2024 at 02:50:12PM GMT, Liu Ying wrote:
>>> MCIMX-LVDS1[1] display module integrates a HannStar HSD100PXN1 LVDS
>>> display panel and a touch IC.  Add an overlay to support the LVDS
>>> panel on i.MX53 QSB / QSRB platforms.
>>>
>>> [1] https://www.nxp.com/part/MCIMX-LVDS1
>>>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> ---
>>> I mark RFC in patch subject prefix because if the DT overlay is used, both ldb
>>> and panel devices end up as devices deferred.  However, if the DT overlay is
>>> not used and the devices are defined in imx53-qsb-common.dtsi, then they can be
>>> probed ok.
>>>
>>> With a dev_err_probe() added to imx_ldb_probe() in imx-ldb.c, devices_deferred
>>> indicates 53fa8008.ldb and panel-lvds kind of depend on each other.
>>>
>>> root@imx53qsb:~# cat /sys/kernel/debug/devices_deferred
>>> 53fa8008.ldb    imx-ldb: failed to find panel or bridge for channel0
>>> panel-lvds      platform: wait for supplier /soc/bus@50000000/ldb@53fa8008/lvds-channel@0
>>>
>>> It looks like the issue is related to fw_devlink, because if "fw_devlink=off"
>>> is added to kernel bootup command line, then the issue doesn't happen.
>>
>> Could you please fdtdump /sys/firmware/fdt (or just generated DTB files)
>> in both cases and compare the dumps for sensible differences?
> 
> I fdtdump imx53-qsrb-mcimx-lvds1.dtb and imx53-qsrb.dtb.
> 
> I see three sensible differences.
> 1) panel-lvds node position.
>    For imx53-qsrb-mcimx-lvds1.dtb, it comes very early and is next to
>    'compatible = "fsl,imx53-qsrb", "fsl,imx53";'.
>    For imx53-qsrb.dtb, it comes later and is next to panel node in '/' node.

It turns out only 1) panel-lvds node position matters.

I can reproduce the issue with imx53-qsrb.dtb(no DT overlay) if I put
the panel-lvds node before the soc node.  If the panel-lvds node is
after the soc node, then the issue doesn't happen with imx53-qsrb.dtb.

The ldb node(LVDS display bridge) and IPU(display controller) node are
in the soc node.  Maybe, the order of the ldb node and the panel-lvds
node in DT blob matters(be my guess).

> 
> 2) properties order in panel-lvds node.
>    For imx53-qsrb-mcimx-lvds1.dtb, it shows
>    panel-lvds {                                                                 
>         power-supply = <0x0000001c>;                                             
>         backlight = <0x00000030>;                                                
>         compatible = "hannstar,hsd100pxn1";                                      
>         port {                                                                   
>             endpoint {                                                           
>                 phandle = <0x0000007d>;                                          
>                 remote-endpoint = <0x0000007c>;                                  
>             };                                                                   
>         };                                                                       
>     };
>     For imx53-qsrb.dtb, it shows
>     panel-lvds {                                                                 
>         compatible = "hannstar,hsd100pxn1";                                      
>         backlight = <0x00000031>;                                                
>         power-supply = <0x0000001d>;                                             
>         port {                                                                   
>             endpoint {                                                           
>                 remote-endpoint = <0x00000033>;                                      
>                 phandle = <0x00000017>;                                              
>             };                                                                   
>         };                                                                       
>     };         
> 
> 3) No 'lvds0_out' and 'panel_lvds_in' in __symbols__ node for
>    imx53-qsrb-mcimx-lvds1.dtb, but for imx53-qsrb.dtb they are in it.
> lvds0_out = "/soc/bus@50000000/ldb@53fa8008/lvds-channel@0/port@2/endpoint";
> panel_lvds_in = "/panel-lvds/port/endpoint";
> 
> BTW, reverting Saravana's commits
> 7cb50f6c9fba ("of: property: fw_devlink: Fix stupid bug in remote-endpoint parsing")
> and/or
> 7fddac12c382 ("driver core: Fix device_link_flag_is_sync_state_only()")
> avoids the issue from happening.
> 
>>
>>>
>>> Saravana, DT folks, any ideas?
>>>
>>> Thanks.
>>>
>>>  arch/arm/boot/dts/nxp/imx/Makefile            |  4 ++
>>>  .../boot/dts/nxp/imx/imx53-qsb-common.dtsi    |  4 +-
>>>  .../dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso    | 43 +++++++++++++++++++
>>>  3 files changed, 49 insertions(+), 2 deletions(-)
>>>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
>>> index 92e291603ea1..7116889e1515 100644
>>> --- a/arch/arm/boot/dts/nxp/imx/Makefile
>>> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
>>> @@ -46,8 +46,10 @@ dtb-$(CONFIG_SOC_IMX53) += \
>>>  	imx53-ppd.dtb \
>>>  	imx53-qsb.dtb \
>>>  	imx53-qsb-hdmi.dtb \
>>> +	imx53-qsb-mcimx-lvds1.dtb \
>>>  	imx53-qsrb.dtb \
>>>  	imx53-qsrb-hdmi.dtb \
>>> +	imx53-qsrb-mcimx-lvds1.dtb \
>>>  	imx53-sk-imx53.dtb \
>>>  	imx53-sk-imx53-atm0700d4-lvds.dtb \
>>>  	imx53-sk-imx53-atm0700d4-rgb.dtb \
>>> @@ -57,7 +59,9 @@ dtb-$(CONFIG_SOC_IMX53) += \
>>>  	imx53-usbarmory.dtb \
>>>  	imx53-voipac-bsb.dtb
>>>  imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
>>> +imx53-qsb-mcimx-lvds1-dtbs := imx53-qsb.dtb imx53-qsb-mcimx-lvds1.dtbo
>>>  imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
>>> +imx53-qsrb-mcimx-lvds1-dtbs := imx53-qsrb.dtb imx53-qsb-mcimx-lvds1.dtbo
>>>  dtb-$(CONFIG_SOC_IMX6Q) += \
>>>  	imx6dl-alti6p.dtb \
>>>  	imx6dl-apf6dev.dtb \
>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
>>> index 05d7a462ea25..430792a91ccf 100644
>>> --- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
>>> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
>>> @@ -16,7 +16,7 @@ memory@70000000 {
>>>  		      <0xb0000000 0x20000000>;
>>>  	};
>>>  
>>> -	backlight_parallel: backlight-parallel {
>>> +	backlight: backlight {
>>
>> Nit: this seems unrelated to the LVDS support
> 
> Do you suggest to do this in a separate patch?
> If yes, is it worth adding a Fixes tag?
> 
>>
>>>  		compatible = "pwm-backlight";
>>>  		pwms = <&pwm2 0 5000000 0>;
>>>  		brightness-levels = <0 4 8 16 32 64 128 255>;
>>> @@ -89,7 +89,7 @@ panel_dpi: panel {
>>>  		compatible = "sii,43wvf1g";
>>>  		pinctrl-names = "default";
>>>  		pinctrl-0 = <&pinctrl_display_power>;
>>> -		backlight = <&backlight_parallel>;
>>> +		backlight = <&backlight>;
>>>  		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
>>>  
>>>  		port {
>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
>>> new file mode 100644
>>> index 000000000000..27f6bedf3d39
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
>>> @@ -0,0 +1,43 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +/*
>>> + * Copyright 2024 NXP
>>> + */
>>> +
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +&{/} {
>>> +	panel-lvds {
>>
>> Nit: Just 'panel' should be enough.
> 
> Nope.
> 
> 'panel-lvds' is needed to differentiate it from 'panel' in
> imx53-qsb-common.dtsi which is a DPI panel.
> 
> Using 'panel-lvds', procfs lists exactly the properties needed.
> root@imx53qsb:~# ls /proc/device-tree/panel-lvds/
> backlight     compatible    name          port          power-supply
> 
> Using 'panel', more are listed.
> root@imx53qsb:~# ls /proc/device-tree/panel/
> backlight      compatible     enable-gpios   name           phandle        pinctrl-0      pinctrl-names  port           power-supply
> 
>>
>>> +		compatible = "hannstar,hsd100pxn1";
>>> +		backlight = <&backlight>;
>>> +		power-supply = <&reg_3p2v>;
>>> +
>>> +		port {
>>> +			panel_lvds_in: endpoint {
>>> +				remote-endpoint = <&lvds0_out>;
>>> +			};
>>> +		};
>>> +	};
>>> +};
>>> +
>>> +&ldb {
>>> +	#address-cells = <1>;
>>> +	#size-cells = <0>;
>>> +	status = "okay";
>>> +
>>> +	lvds-channel@0 {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +		fsl,data-mapping = "spwg";
>>> +		fsl,data-width = <18>;
>>> +		status = "okay";
>>> +
>>> +		port@2 {
>>> +			reg = <2>;
>>> +
>>> +			lvds0_out: endpoint {
>>> +				remote-endpoint = <&panel_lvds_in>;
>>> +			};
>>> +		};
>>> +	};
>>> +};
>>> -- 
>>> 2.34.1
>>>
>>
> 

-- 
Regards,
Liu Ying

