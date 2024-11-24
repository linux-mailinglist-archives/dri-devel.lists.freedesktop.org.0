Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E181A9D766E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 18:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF96910E58B;
	Sun, 24 Nov 2024 17:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="chhyFUda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03olkn2087.outbound.protection.outlook.com [40.92.57.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE7310E03A
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 12:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFq0uNUDEpm7Y5WFj75TJA9jeF2tXg51F7B+mQ6b+FJso6MQs1LLUYIZxb9Jq7Foq/66B5lPl6vuVsxSXmT0ZgH1RkuIBv2MqbelzxYq20h6v3iPBLFahW1SxqikQ47fsBUNtwvOgBnyPgOm5H3huBs6gbxuJhWRBvaA6zWgmCmi6yudvSuCGcuZuDPw0WVM3qOP9+KiOh6VHb2pO4BNX+s87OQr2Fvai+BldL8xyiqiQJgyxviIfdRNf0+nGdXOsEhBdVfX+ZgYs7a3MvCppbVYwcw0vcRgrF+ojjUC5szu87lOfqPakmFzPzv9xn2UcSzNjL+IeJeqPSqsEb72tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGGS3klio0UUsKLYs6iSA54Yomidx+mPyy/obJ3W4EA=;
 b=dpbUPsxAjpDEKCncHhFB/fkzGXUhLc8wwlQz8gcZEkpaTa3TJJ8ss4/PBAidtyKS0YAt7sxdvJT/RNHObhPJXf0TdXVteBViUBHuKwyQYsWlqYKVfpktTsDVq4NN86azuXbKEljTsl985DOUVy8CMTFi0vXNhXseDxt71pSwZRV0H/GJj6Y1Arb0aZk3e4FPwWka3JZBvHnhYg0BFgcJSmXsrDsZv+CT/H36wGv4AHcUvVb5WCOhZGufz9rp0mCWM5ROtOX+JSkPpLhgXE+F6x+ysMTdq3fc5jkszcNCkoVLtgBB5ozc3Owe96Hv4HvHKvBYdoBawUGVVWz/VXKj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGGS3klio0UUsKLYs6iSA54Yomidx+mPyy/obJ3W4EA=;
 b=chhyFUdatmLzocY2Of5KWOhAh/xQqL3ompjOF+w9A7QQmm6s1cDuBC6FTld/JGLbfqoeOWfG9eU+g6f0uB/TWpIR72JvSofhOOJJ4XwUXhZc+ti6gCJmDZoUYWoJYpRAaPeIR4lW1Q03BLfVyBp6XD5QSPdw2P4cQX1xpuYdDa6fAMCEIr3Bh7bGSm6d6RIdcpo4APjegzoniJ2k5R5KHa1CjaCSA0b4szBCD8eIMq423QBH4yw/vZTOxEmnO0Kr9X1EwdxiO2sLEf3gp0wiRkR6vIhOKIBp3OfVaWj9Wwmaw8pZkILH9jQz76DYMZMgFmR0lonxq/kUHpX4ajDORg==
Received: from VE1P189MB1024.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:149::13)
 by AS2P189MB2470.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:595::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Sun, 24 Nov
 2024 12:29:04 +0000
Received: from VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
 ([fe80::4c0a:a901:4d3c:e0bb]) by VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
 ([fe80::4c0a:a901:4d3c:e0bb%4]) with mapi id 15.20.8158.024; Sun, 24 Nov 2024
 12:29:04 +0000
Message-ID: <VE1P189MB1024FED800B8291EFAA52B15E32D2@VE1P189MB1024.EURP189.PROD.OUTLOOK.COM>
Date: Sun, 24 Nov 2024 13:29:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: samsung,atna56ac03:
 Document ATNA56AC03
To: Krzysztof Kozlowski <krzk@kernel.org>
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
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
 <20241124-asus_qcom_display-v3-1-002b723b1920@hotmail.com>
 <k27rqbfvuon3uppgyhcfhcmlqv7ritbn35fmhuljnw2ievqnia@rey3cljv2p2n>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <k27rqbfvuon3uppgyhcfhcmlqv7ritbn35fmhuljnw2ievqnia@rey3cljv2p2n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0091.eurprd04.prod.outlook.com
 (2603:10a6:208:be::32) To VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:149::13)
X-Microsoft-Original-Message-ID: <90015c1b-f654-4460-a4d7-af0c2123d500@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1P189MB1024:EE_|AS2P189MB2470:EE_
X-MS-Office365-Filtering-Correlation-Id: f511afa6-8780-49b0-218a-08dd0c83957c
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|461199028|19110799003|6090799003|8060799006|15080799006|440099028|3412199025|4302099013|10035399004|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THB5bWNHeTAySHBsV21SWnExRUswdmVDcENwL2s0VHRldDBDRWI4Y05qUGE3?=
 =?utf-8?B?N1NtcHhwbzU2L1pJTUJqaXpUMngxN2tUTHBXNXdaUGFKU3J3YWZoWEVQZExU?=
 =?utf-8?B?b0N3SWdmSVorL0dOWUdTSFJxRVR5YWprUkJmN0I0NGxvS202RWlaclhqYzhJ?=
 =?utf-8?B?Rm9OVXFwUWh1Nk52dVZmVHhNYlo1aDhIdnprU1ZySytBalExYzN2eGNra25H?=
 =?utf-8?B?Uk5FTGFOaGtUL3lnU1BsYmQxQXlDM0tWZ0puSjh4aG5SSkltcVdkcndGK29q?=
 =?utf-8?B?eUR4dkQvWG03enpZYmYveHRyZzdwZm1TSWFZaXBDRkQ4UmgrVGcwRGZQL0tr?=
 =?utf-8?B?UVVrTE9aYW5SQlVrQU9BeVljbTVzTGdrbDdMOXM0U0FJNGdpYitXVmgvc0RV?=
 =?utf-8?B?OHd1OTVQa0toSTV1K0dNQXAxMTlZZml4QTFvSkhlNllaQmNhaTVPYnZodTFa?=
 =?utf-8?B?L3dGWDR0TWs3NFd4bFE0VVZ0K3djbDJra3lVUEdxSDBMYjdDYWJHVGwrQ2Nn?=
 =?utf-8?B?dG5HNmEydjRwa0U4K2xOd284Wm5lTGg5VkRPSGZrbjZQa2d4d1NXcE5JaFVE?=
 =?utf-8?B?SjdvMlJ4TW1zREdSaUYyRHJld0o5NGRZeWRrVG4wQWM4ODBmNFJjOEErd1FP?=
 =?utf-8?B?czRrSGpqK0FmTDRpQ0FDaHFlT2R4KzVsM2hCUXZJNjFhZzkzVFh0Y3lIOXlF?=
 =?utf-8?B?OENMNmJlK2x2OTd5UDlxOXhJMGlRTDlLeE1QdFZ6eEhmQU5CWjczb0JJSGoy?=
 =?utf-8?B?VU94d090YW9XdWQ2aE42Q1VnZlduS0wvTGZvTG04cGh0U3NqaXhBNFEvOFcw?=
 =?utf-8?B?YW9xT0I0aVFHN3dQdkd6djNreDVjM3UvaGVxZFByd1JwQ3hhWU9kdDdNaFR0?=
 =?utf-8?B?cUx2SDM4SlM2TGVJVW94QW5Wa1pRMFdQM1BnY01EaHQycnhQUXUvV3NFTXpl?=
 =?utf-8?B?dUxuQWNpYzlUWTJNR3BLY1JXR2JIMXFhbzMrZHRwOVlITm9pbTUxY2cwNldt?=
 =?utf-8?B?d0RDQjJrRmxHUFlWZ21tY0YvWkFEc0lWTlJuY3Bmb2d6eVJVaUJTSDBwSlA3?=
 =?utf-8?B?V3ZGeWw4b0tqSlhGR0kvMTR1YllXSHJaUVpIRVM5bU1TTVlrMnV3TGo3Q1JN?=
 =?utf-8?B?MkZxUXVCaC9mQ1UwNkNuWW9acC8yWnR2VlNKWkRkYmRRWHU5L2Q1SDcxeEh4?=
 =?utf-8?B?NmxMdW9aQ2xPVWI0aFI2VEtmWFB0U2l2S2FzUGxDMkdDQU1aUXdDdEpqQkxB?=
 =?utf-8?B?a0gxZmQ0QTIwU0pHU1NHdWplWFZESVg4WTYrOUpVZ0xHdCtqODlTNGdCZnhL?=
 =?utf-8?B?VmJlTDhPL08xMDVQRkRIam9qSzh4MHpkSGNOV0Z5RktWYmVaTVc3S2pVeXVs?=
 =?utf-8?B?aGE1U0xkSWlwOW83QU90SWFsU0hSQlJpczdvbXRueWZXT0xUVGZhU3AyR0cr?=
 =?utf-8?B?UkJRUXI0SEl3VzJGQzA4dEM3RFN6eDZTazdSVThleURBcGQyR05kZjMvY0Mz?=
 =?utf-8?B?TDBnd3M5cFVXZWR2blh5V0JrMnlHdHJYNzB5VlV4bFNrVllnRm9TbU5hOEFu?=
 =?utf-8?B?dUIxUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1ZLOStTdUZmVEhqUzE0VTVwcXNXZW9xSWJxeEJDd0t6d0Fzci9RT01kQTRR?=
 =?utf-8?B?NzNLZFhyTVdNaldzekFRdktFaE1UTFU5ZklRemdMN1pkUE1FbkRzOGNHRitF?=
 =?utf-8?B?VXk4U3lzdko2Vi9KaXcrajRUYzIzS0Z5Z2dLVW5xSlNJY1JYak85d2VSMDRE?=
 =?utf-8?B?K2JicjdhaHczSHRDQVJSNGhsVnR5TVZnMVhyRDlPWVUxaXhnMkhHdm5wQkln?=
 =?utf-8?B?SklsZVdpR0pPaUloZE9nS0lNdmtSVWgxVjRZN05yVThYNU9DSUIwbklqK1NO?=
 =?utf-8?B?TEt6NU50dkNLY0tBRnNCRFlVWDhqZE13R2x6bWF6MTByNmRnOHhnQUpXeTc1?=
 =?utf-8?B?Q3RmWGZKMVZHTGY3Vm1IR28ycGI2TDFkWmxXU1VyR3UvZmc2U1I1RDBUbjJQ?=
 =?utf-8?B?S202RXprYVM3aytXcHpxVGJnY21pOC9OcXAxU3k0WUFHTE1oaDVCT2hYemlO?=
 =?utf-8?B?emhzYmRtd05tZ2FvYytzSllEa1NQakVRd2tnaml4WEZPTFgyZlNMbW9XWUxt?=
 =?utf-8?B?dm5JVmx3d0hPRXJiOXBLRXRFRDJta29qa2s0aXZuTFZld1B2cE1PUmsxWStP?=
 =?utf-8?B?UlhsMjZNYUJCN1lDYjdEbkt4Qm1qOHpKWGdXTVlXWnZFQzlGaGpOZzZJMGJ0?=
 =?utf-8?B?STdyYjk3ay81bks0SFhvaEp2YlJtRVlIZUs1RUJWK1VPTDQrVWtHZmtmRUhQ?=
 =?utf-8?B?UGRueDQvUENvOFhYY0k2L3c1ckFQWlJxRmFwMjZteTVNVG5oZGROSzZ5cU1W?=
 =?utf-8?B?TWk3Mlg0SzNPTFFhenkrOUV1bFIybEVGVWx6UG1zTklrR0I4UENqWEZMK1Js?=
 =?utf-8?B?SE41Nk9VRlowYldtQ0xmT0JoUU9uRGJQMUZRd1l3Rmc2V01HUHAxZ0tVWWhi?=
 =?utf-8?B?cEpDaUIxVWhEN0hna2hxWWM4cm1TcXZEbk1pQVI4RE1DWkEzdVhBVFU4WHly?=
 =?utf-8?B?WVo0SHV2Rm81bCs1WnZLTlM1ZHFKdnFtKzhYMDV3enJvcXE1cjFJeTY4TGNw?=
 =?utf-8?B?OEFYN3Npei9mcHB5WFRYY1NYZEFvVWJ3WEN6N1I5eHRTWGpMNlU4Z0l5Y2lO?=
 =?utf-8?B?dXVIbXoyYTZuUjNVMjRpTFBMUUxhYUJzMWdabFRjSTBPL2JzYk5oeUdid0s0?=
 =?utf-8?B?b0oySkkzSk9qUlpFZ3c1ak1BU2JWdWFjaEU0RzdLWGFYcldOa25mSTdWYWgw?=
 =?utf-8?B?eUlHc1lleUVYajgxR3hlS25ScFdUM0EwekJpcFViWkZ6WHVZT0xlOWZtTGFV?=
 =?utf-8?B?V1pLNmxsMnFqbG9QdVRwS0xyb2xVMmxNRm5NZ1BuNENSN0l6ck9SY2RhYSta?=
 =?utf-8?B?MERrVHFSM0tES0lRZkVScUJXUzY3Yzh2MU5WeXpjVkNSbWhzMGFxNWMyeFBX?=
 =?utf-8?B?M1pEMGUrQXc5U2hpa0REd0F4QUN6aGxueFJPR05Td0gyTlRHYVQxT2FjK3FB?=
 =?utf-8?B?YTlXcnV3eFUyUmlFSU42UXo3ZC93MTM2MmtGTm9BN3RQbE1pV0N6Vi91WmFI?=
 =?utf-8?B?R1N5WTNSQ2FvQjV2WHRYeTgyTzFMYkN3SjNxdnY5NXY4SG9YMzl4MVhJY0pw?=
 =?utf-8?B?UjNJRHlRMVBPWFhiTDh3QWJEYzAyd1NFVkh4aU9XLzlBR0ZHUCt0Y2RmeHhB?=
 =?utf-8?B?NkpWSHJ0dDFaTnBTOFdHZWJkRTZSVEtrVThjSU1lVmJCRlUrbUUyeUJPeDZa?=
 =?utf-8?B?dTV6UkcvWjhDMmprVG9Cb2xmTWNJUUNKMHJIaEhkNEhjam51WGFZUkFxN2NS?=
 =?utf-8?Q?IFuwLwFXMsRpT+vIJt/n0NAfpxf84CRlgPygy4i?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f511afa6-8780-49b0-218a-08dd0c83957c
X-MS-Exchange-CrossTenant-AuthSource: VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2024 12:29:04.7520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2470
X-Mailman-Approved-At: Sun, 24 Nov 2024 17:12:55 +0000
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

On 11/24/24 12:00 PM, Krzysztof Kozlowski wrote:
> On Sun, Nov 24, 2024 at 11:00:57AM +0100, Maud Spierings wrote:
>> The Samsung ATNA56AC03 panel is an AMOLED eDP panel.
>> It is similar to the ATNA33xc20 except it is larger and has a different
>> resolution.
>>
>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>> ---
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation: Please add
> Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
> or above your Signed-off-by tag. Tag is "received", when provided
> in a message replied to you on the mailing list. Tools like b4 can help
> here. However, there's no need to repost patches *only* to add the tags.
> The upstream maintainer will do that for tags received on the version
> they apply.
>
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
>
> Best regards,
> Krzysztof
>
I did indeed completely miss it, only focussed on the correction, Should 
I make a new version?
Also this is my first time replying on the list so I hope this goes well.

When I add one of these tags it should be in the commit message of that 
patch below three dashes?


Best regards,
Maud

