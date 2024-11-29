Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFCB9DE9E0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 16:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1996410E2A1;
	Fri, 29 Nov 2024 15:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="fZTLxAzb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05olkn2078.outbound.protection.outlook.com [40.92.89.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8410E2A1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 15:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEtPbME7Fgv2yxnO+nFTCNCIRxVsv5XtKi4rBl4SoPgE+Ewxjm4v7iTGU8B2Oza8WRTH96L7Sql5VKLiQ+OJlloPhjb2qG3gkJj9vnV8SWXBQaP7i7jH1Ik70FHWPVbEeiUUgFr1/R57xzV3FC4pvT30s1An9IjgWVVRkNUmo9VMMOgvGvsydooRzCtnS9SvDz1N0m+em8t25df3FpXkp03Doh3DqkNtKSqSU1vUnDCefvlZKXAhITpyxC7z4rja05Ja6o51f0tIztEPx+3Ah7+GkTHhSZQnD/c0IX+UZDacDn7anqPqmmLUgX4y3/G51ixOeNaD6sOZV4DL96Tiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeQdtDxVi6cvx4UvdNfUcwlPIm6QFv3dl0ZNEbiTpZo=;
 b=h0LtyTrChcoQ3OWXzoaq+eAec9MqFeP1/lfDr/+qKZ8UGt3tLv/FI8BbRAaZZEG9AXA+DHA0frjfm23FdB9o6jYFMUBbd6j259u2yqN6q41H55kR//Staq3lwM8QIrSWbsEiUIkBoDKqxkQhMgORFWM0W8I/eetsZt+6tnU9a8NC6Y4BlHgMF25a6NzrlMBuxzAWCTC50Q4lVIK5FdsQjwfOeM2f3MA2fNecg3DZiVydr9R+BuydPhQbNB1PjrmjDHPpME1yUhkSQ1AeOfNfcwrXnjQQVWRV7gw2ypOzUVa2akUuvAeIXltJe/HyJDEJaN/JDJXJZ6SjFmkokV4Mrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeQdtDxVi6cvx4UvdNfUcwlPIm6QFv3dl0ZNEbiTpZo=;
 b=fZTLxAzb0H8XaaSmvj9Ozq3dd9NLmAEpD6HV++NcEfY13IT5tLguWrfUkCoPC9+BsBvS/c46Wo9DjjGxdiXeulqlmR+XtD0Sh73UUXnBZFO6fG/CnuCRk1MzlUjCiFUgJOUNgGQb2kCXbPQD0GjU5LUk+aHNBsOrt2OeuyFL2/hd+D+rh7oPA5CSuU1esH4jbPc1patVUKrmkAJyNQq62GddIFAivVqAlKQglAbxCem6xyQSm2x5MEBk9WyHaDmJnJFseAYynDriVSy2jJJBhHC7ovvOnka997IySstt3wQsT9cTyyFFIalHSdhkq7m/c7p4v3beHcpA3kjd5436dg==
Received: from VE1P189MB1024.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:149::13)
 by GV1P189MB2243.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 29 Nov
 2024 15:44:28 +0000
Received: from VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
 ([fe80::4c0a:a901:4d3c:e0bb]) by VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
 ([fe80::4c0a:a901:4d3c:e0bb%4]) with mapi id 15.20.8158.024; Fri, 29 Nov 2024
 15:44:28 +0000
Message-ID: <VE1P189MB1024A30BA75185CDB5FCEC91E32A2@VE1P189MB1024.EURP189.PROD.OUTLOOK.COM>
Date: Fri, 29 Nov 2024 16:44:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
 <20241125-asus_qcom_display-v4-3-61a4da162406@hotmail.com>
 <7mmnvrgzmqujse4bz2eosdnqmogyvfdi3ei5ez3es562qncks3@yqre7fakszbb>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <7mmnvrgzmqujse4bz2eosdnqmogyvfdi3ei5ez3es562qncks3@yqre7fakszbb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::8) To VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:149::13)
X-Microsoft-Original-Message-ID: <233f0a6d-a092-4edc-98a2-6d99a85e0b29@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1P189MB1024:EE_|GV1P189MB2243:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc3bfd5-46da-4eb5-d558-08dd108cb566
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799003|461199028|8060799006|6090799003|5072599009|15080799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3kzVE5HeU5JcWlmZXY2UVdab0s5Vit0bGF6Z3puV0c5SjN1TWg2dDlkaXBX?=
 =?utf-8?B?cGtuYnRIUFpWanJDbWJwMmozU3pqYnVzbWUrYlRFSEdLZHJSM3k1aG0zeVRH?=
 =?utf-8?B?Z0o2MmsvUlRINlViYitDUk8yUkZpZjVLTkhhVU9MZ0g3QlVsRjNIZ2dpM2Jt?=
 =?utf-8?B?WWRFWW40WCtmMncxbnRsTDVXZXFWMzc0cGVSbmV3SUFJTkpWRlhrQVc3VTBM?=
 =?utf-8?B?RWh1TFZjUFV4NEMvWjFUNG1YUTFOeFFOd0JlOWVjby9OTFQvODFrMkhYM1JQ?=
 =?utf-8?B?eE9ZcnZhM1VyWjhpOFZVZ3NheVhQNTFWZDdER0VQSjB0S0NPRDRPY3VmbnEy?=
 =?utf-8?B?WEMzT05jNitKSXVqNElPNFN4bHpvbUVpeUxidlptK3pHSGtTZmo4dm5ybGJs?=
 =?utf-8?B?QUtQOXlIY1ZYNHArbFVQNzl4UVpMeEgyMHd6ZU54MDZLbnRRMU5uTWY2K0Za?=
 =?utf-8?B?SHJUQ09nbWpyd29JWjVLTGgzUnJaRVZGM25rL2Z4L0Z0bUM3UkZiWGpDaVZF?=
 =?utf-8?B?R1JYYlFzRzVobk5GZ3VLSDJEbUMvRlJIVUR4TkEvYkZZL2grbkt4OFZEVTZ5?=
 =?utf-8?B?NlBwRVNlQWMrNGxKWWY3VGFMaFhNR1dIOFRteEJ2VE5hYzFpRG41S0tTQ3Br?=
 =?utf-8?B?Ym9sY1lXSm9xT3JyZE9kMnNPWnBZb1cvWlVDTW1Jc1BCR1laQ0hYamJxUkhR?=
 =?utf-8?B?M21ibWlla1QwNFcwWXplR1BGMTZZN09IQ2NxTnNxQWU2aHYyeWc4Wk13TDVa?=
 =?utf-8?B?L3l6VEdKVHV6c0pvOWowV1cwM2s1M0lVOWkxWUVLVC8wblJzZTFmdVl6VnJB?=
 =?utf-8?B?WDA4KzFXTXU4eGRhTERKS25oNWppaGZOQ3hQOFhLdXFxTG0xQStoR1NZdHhi?=
 =?utf-8?B?b01wT3pIUDVQaDR3Wk95c2p6ZFRIZ2Fud3FhUVFmTGp1di9FK3hib25kamYr?=
 =?utf-8?B?NmdpWmp1WWlpZWdodjR6cXEzVit1cDFHQkFiNy9pUkpMdGV6T01ZUzUreC9Z?=
 =?utf-8?B?QmlNVnJZZGU5TTZDRHVidnl0OGk1Wm1hdjRWTVk4aTdqK0trdUJiTVhjN3U1?=
 =?utf-8?B?V1hSbkRWdWlZRXY5K2VVUGg4RUpXa2NZcUpYTXVLN1ZGNldRd3pOSVZHa1FD?=
 =?utf-8?B?S3ZYRmhLNlUyQk5zcnczL2VseFlQakFPbnpZTXVoaWxKRzl1dno3SGh1T0Vx?=
 =?utf-8?B?VVVIT1E3SnNLTTBFL3hVS3RCL2hmeXpBanEyalVPRXRJRTBSbUY0NFBQbTd3?=
 =?utf-8?B?YW5hK3RjQ0JzSVlPTGMvUUNOQWVENE8vcHBDTm5RV0xkNGVaUXdueWhPa3d4?=
 =?utf-8?B?azhVakorOEFOL3lrRXJYS2hoREJYT0RJK3d0MG1leVc5UjFtdkRVY0hITldO?=
 =?utf-8?Q?2fjq/O+/TnVtr0g+71ecRkZVCZkiWYg4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjJIRk9aQTM3RWlnb0lPU1VzODcyMHVwd2xyQXpjdERqdTNSRGttdVN2cUVV?=
 =?utf-8?B?aEdJNFVzcFpNTE41eEZQc2pkSEVPWFM5MHl5Y2QycytJSW8zNjM0NzJOYThv?=
 =?utf-8?B?TmF0NE9jY1hXaEhWZUdUSzBOcURmam44N2tQZkMvWllLTFpSMDFkZlhUU0Ez?=
 =?utf-8?B?ZFR6bm9GWnp6Snk3aURIbWRDb0s0Sm1EMGFUNk92UUlBNlNVQnBWSUkrenFE?=
 =?utf-8?B?enZQbnI0SUVJaXpaaTA1MVFESmRhYk9aY2Rqa052VDh1a0cyeWN3N3lKQU1u?=
 =?utf-8?B?S3FEMWYrNXhyOWtZOEtGR0l2YVRmMHhKTWg4Qzhrb3Y5Tlg4TmtoUElhY1lv?=
 =?utf-8?B?QTN6LzIrR0VRZkN4VGVJbkErVFZJWU1mS2lHYStEeDlWR040eThNdWNxV3B4?=
 =?utf-8?B?SW9NbUh3M3Q2TmplWDl5aFp0d2hhbElDcW5hd054dmpHZmFRZjVLMGZEdjJh?=
 =?utf-8?B?MTZuZW1FMXhQYUVhMGVKVUQwYVZiZUFzTzFGa05CeVYxY251Sk53SzNsU2g3?=
 =?utf-8?B?V24xNDY3MDZ6a01jdFk5OERGbnFCN25ZcjJodTB6WWlXem5oNFl6dlNKSmVX?=
 =?utf-8?B?aVdLbE9jWWoyRUtPZTUvbU5ORkJOV1hCS0Y0QWp1blBDUU1FZ2dka3hoSURp?=
 =?utf-8?B?SStEcThHT0t0QytrUVpaNk8xWWpwY29acFFGYlZzNlhmU25haTQ0anR3VHhw?=
 =?utf-8?B?Y0pIRmFuYWFhdndRWFBNUFFJZUpSNGQ2QmdONlhHUTVKK01DSDFtaHVzQk56?=
 =?utf-8?B?NytvU3ZYekowMU4yZUhXSWdQQURZdlE2aEVHMjBTbGg1dm41elFRNDlEa2Fz?=
 =?utf-8?B?dlZSSXY3UFBDMkRJK1h0WmU0VWJpY2RRMENGWnhSb0h1YTN2TXlwc2NQckha?=
 =?utf-8?B?bGdoYk56NGw3Mjc1THRSaXNvUWJndE9pY29QcjBTdzg5b0NPYTAzSXlIYU5F?=
 =?utf-8?B?ZE4ySS83VG9mNklTc1AvNk9kcno5MkJzajNwcGMvSUpWdXRVYnhLbUxBa3NC?=
 =?utf-8?B?aWxXTVJHdnQxRkpLR1haNXV5c3VjQjljMDFxL3liWlpBY21VK0FhL1lSamtW?=
 =?utf-8?B?WnVCelczN3pNUEN3SDl2RmNHSFRCaXQ0cFNPTlFRVDVnSGdPc2xjOUorQ2RO?=
 =?utf-8?B?emtaNDB0cGFpck9PeCtMWlk3QndMdnFDblUySjZ5alJtTktKd1o2SHJUM1JY?=
 =?utf-8?B?NUJMYThrVjJpaWhUY2QyWTNMN3NmWXBBbW1LeDhVQUhrc291NEw4MHFQV0Va?=
 =?utf-8?B?cXV1YWhCYWRjblhXWkVyTGd0eG5STVFwQktyVHhVM1MrWkNPWXV1clJISXU3?=
 =?utf-8?B?L1ZNUmsxR21LcDlPblRFMlRWUDdFbXZnamFxcnVZT0x0R0VtdGptZjB3VFFk?=
 =?utf-8?B?YWxUdzFmUkVSMExyWWRERFJXdlFPK09qZnV4N09wVnY3ek5aK2lZVlhUZ1Ez?=
 =?utf-8?B?RmkweWcrd215Wldvc0MyOWxlMXVQS0V1b1hCS2xiM2hTdUV5Z05zYnJ2V0pW?=
 =?utf-8?B?N0lvZkhpMDRPa0U5MFJZSHRweldLV044OUZBU1ppMVFsbWpzZUNnY2ZDUlNE?=
 =?utf-8?B?VDVDazhsRlo5UFdEQ2JGaUdyeTNKRmFGY3dGMERyenAxaFlNb2Y1dzRxKzZW?=
 =?utf-8?B?SlNFekxmQXNVaVlVNnlUUUl4c1ZwUDZFN1ptTUdFbGhBdDMyU0MvZHFjL1Jz?=
 =?utf-8?B?d1lOQ1NmK1RnVjZFWVZNRWhsZU9IWUJQaW9wVkl0cENuMkk3LzJiV09RRkJu?=
 =?utf-8?Q?Ew0f9wwOS4eWpMvuRD9VY7ZHkni87dzDVg3JB/2?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc3bfd5-46da-4eb5-d558-08dd108cb566
X-MS-Exchange-CrossTenant-AuthSource: VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 15:44:28.6105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2243
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

On 11/25/24 11:29 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 25, 2024 at 08:11:19PM +0100, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maud_spierings@hotmail.com>
>>
>> Add bluetooth for the asus vivobook s15
>> Describe wlan configuration
>>
>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>> ---
>>   .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 164 +++++++++++++++++++++
>>   1 file changed, 164 insertions(+)
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
I'm pretty sure I messed up the pinctrls in the wcn7850-pmu
I believe it should be:

pintctrl-0 = <&wcn_bt_en &wcn_wlan_en>;

instead of a seperate pinctrl-0 and 1
I'll fix this up  tomorrow/day after

Thanks for the review!

kind regards Maud

