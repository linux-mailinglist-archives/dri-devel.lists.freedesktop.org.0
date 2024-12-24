Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01339FB9D7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 07:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF0410E1D3;
	Tue, 24 Dec 2024 06:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="e6T+J5jS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2072.outbound.protection.outlook.com [40.107.103.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B8F10E1D3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 06:26:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHU1FgiF9XlDISCgZcRwLCuHH6zNf4rWmB54JzM4S3Ho3hujUQyWLxwR4/8979fV0TA5kwvUhe1DxnxNM1tGrpeXHd2n2FG5LrBqaPa1Uav7YAFyjO+iwakIkzfWczH3U+h/4zbpKTAlgt3cDKRREpcTGP0Yfwx7J4lOdUT96z9XIS+6kqnYWbCmiYaGDGIhQQ/TMMcwbFwaMFO+zelEn+wQV0TEhRS9invinAQO75ezgUKTHLIhgYiidSits8ysw7PwSofcu5nb5Reba4Qs7vsvWZ4vTgu8ZENh9CKLV72s4EXiaaNHTImQzgvPFlkCo+QsxcQ2qXsbqjkED0VKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCuquOZIyks8AYJF+1J6XhCo6Yab44G18WjrXy4phgk=;
 b=djoJ2S7PaqgdYuyxPJRYwmdJPElrCqcDdfLzqcHeggejIqq5bNvXcYMOD432bGZ32+XFVkNn4XzSldl65OnvcG94C9ZBesyBJr2+ix3RNyVlUL69dyuGaCt4oXfyC4DK31FxhtPmqffEjlq1XbtOxMFHCAslxomcIWYb3tb67+wUYybxD/YgqdP/klGjywcAxtwruFy8LjaTZz/bygqmcxNIdCxd2nxasShFFFqs6hTenGggQbYUR91VgtzRxbx7eWewmS6NBMl6stSFYVivkurTsdV3GPyqkes04x5FUteExNgxyT+s407mOJtKzul7SPhHdjFI08/RudV0P3Bvvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCuquOZIyks8AYJF+1J6XhCo6Yab44G18WjrXy4phgk=;
 b=e6T+J5jSiPqMlaqqv2maVrjFLQbWZiS3fsptr9LUp22zttRRaDwwkKkhGuyhuVvVeTTDZnaoR8Nd26cL+KeBn48ssvHAktr/IYY56KCHR7VGXPVoVoPwJBFNjvLzchqMEG7DOPe3ciVmoqRNcvE5FYVOnFcnDLRW7Y3fHtTAvC68oDkdndq/SLEkSawwYq0iY+Cpbav9nKggJb4N66eW5HXCQdZicopjO+oiNIZcjHYLYNrKWum0pzmuFDuZwccVbc0nB1Vq1i2DMDNq22wr8LzuLyggEmIetNeg4D+Dti/sbcQy610b/ETQ/K+ngu6l/QGvPlNcdB3xe829CSEaNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10478.eurprd04.prod.outlook.com (2603:10a6:150:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 06:25:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 06:25:58 +0000
Message-ID: <ba520cd1-3d7d-4edd-9a66-2866f17e5ac0@nxp.com>
Date: Tue, 24 Dec 2024 14:26:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, frank.li@nxp.com
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-10-victor.liu@nxp.com>
 <6mhlb26vdfc7v3jmb7y3tlcuo336x7vkblbkzd5sosd6urirou@bbfalnfisdij>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <6mhlb26vdfc7v3jmb7y3tlcuo336x7vkblbkzd5sosd6urirou@bbfalnfisdij>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0207.apcprd04.prod.outlook.com
 (2603:1096:4:187::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10478:EE_
X-MS-Office365-Filtering-Correlation-Id: eb54ab6d-a61b-4e9e-dda0-08dd23e3d425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzFERjU1YnVXaVBYcGg0U2JSZUsrWit6elE3SGNacmp5eGhWeDk2QlZ3M0Fs?=
 =?utf-8?B?R2cvWFVMellTOE16THdMNjNBQ0crRXFMTjEvR3RuQldUWkZwSEFhaGREeG92?=
 =?utf-8?B?UmdNMWlBNG5NVGlpaUdrZE9NY3pPUHQwNHMvR2pQM2FDTTk5OXJVeXErYkJs?=
 =?utf-8?B?WXZzN3A2MERFeExXUE51QkpLMENpV2pkR2FoNThaTGdjUUxJcmxHeVpEaE5C?=
 =?utf-8?B?UmgrRldmZzNPVHRUL0NjeHM2dFJsRzJRSzQrK0NkS042TUdmcWY5V0RkdnZq?=
 =?utf-8?B?RGZrb1kyRGwrM09zOURlbWhnL25wTzUrRklvY1JrOEw0Rlp6R2h2d2tYcUdn?=
 =?utf-8?B?WnpmajU0ajB6SDFxcWxsdEJ2bjlrUTZDVzlCcGZCUjFiM05DSkZmVy9VSDdw?=
 =?utf-8?B?Snp2NXdqVU5idE1qaFh6bGwzYThibjBFSWoxOUVQUEplWlFWZmlIMzA4TDUr?=
 =?utf-8?B?aWt4RGJTSEVaQVQxc3BzTDZzNFI0bUtmNldhZ0RWeVBzUGUvSjBBOTQwMGlP?=
 =?utf-8?B?Tmhtb2tqeGk0cVpEUTV3cWNXOTIzU3c4WnNPbDZ1eVRQOGh1Q2dnTTY5RC9s?=
 =?utf-8?B?cjZ2N3lFN1YyOThXSkI5U3VQMWovaVZkUFQyOG9PQVgwSGJqZFVyQy9UTFlt?=
 =?utf-8?B?UDQ1eU1DV09EL0MwdGdId1U2ZjFiMlJhNnNYNENpd1hGdkxXQ1hVTFRhdXlj?=
 =?utf-8?B?K0NySHlnb0FtVm94dUJrMk9rRERRTlJEV1IvN3FZRmVrT3lOU0Z3YTJRYUJl?=
 =?utf-8?B?WVkxZStBTUlNeEVpZGozRW50TC84eGsrc3FRbHhaSS95eDBjSlh6aUpuMEhQ?=
 =?utf-8?B?QWpqb1ZNNk9HT01RWWFVandlQmxtblB5OHdzUDJOOUUwYk10Z3pWYXBQMTlt?=
 =?utf-8?B?RHhtS2ZMWGxHRUpwR2ZSc2RWRUV0NkxIei9XZmxvOXd2YVlReExvaFJIbjY2?=
 =?utf-8?B?QzNXMFNlNjJub3hFSHpDL3ZKN0czelVwczQ1RldRZnhvdndYUk1ITFh1ZGd6?=
 =?utf-8?B?bTFZak8vZUE1V3BiT3BlR2FwenArek9vR0V5SkNXQTUxYjZkUkp1ZFpkUy8w?=
 =?utf-8?B?R2IrMnFRSDRoS1ZPdFZxalRiQkg0S0tnVERhLzA0T1ZtUzdsYWVNU3ozTEZR?=
 =?utf-8?B?UExCQTAvYUNnNGI0VmI5blRNTjVwV0kwYnA4b1VwSktiSkJUYnMzSUpPTkZl?=
 =?utf-8?B?bnVLMEpNRjMwZmhreXZVQVVtbzhGVW9ZaWdiSUhoT3h5Yndkak1CUXlRekRC?=
 =?utf-8?B?akZLQ0lLMUNoYzdJQjRmeW5YMzhMT2hRSk9BUk1XZ3EzNFRwcnFPMFZDOTlp?=
 =?utf-8?B?bjZnUXcycHFYTnY1cGJENmVSNjdxdUl6UTNNZUtOUUtWVHlWZFFrYjVPOUdw?=
 =?utf-8?B?MmpxU2JEc1R0YWZ0MjBBRXU0S2xBMXZ6d3QwbnBSdWJwNnl0QnZYWXQ2UWpa?=
 =?utf-8?B?a2lyQTdiQjRyTUJaRGJWL0Vscm5LZldrRmpBbURGeUo0dU5MbHB4SG1xR3RT?=
 =?utf-8?B?UVFtN0ljSTN6OEs0NDk4TFp2VklObWpUbTVaeWtxbHRKMlpuOVFJK3lwSkZW?=
 =?utf-8?B?VENlSmJ2RW5IcXVIUkh5c01wYnp3SkFWcWlWcFBLam1ZUTB3dFZVVXRkWnlh?=
 =?utf-8?B?UkJlTDJEekZtbTJ3UWJCcElmME9RRUMyekZiUlFNbzAzejd3c0lEUjZJUUsv?=
 =?utf-8?B?WXNFN2xRRy9mZUhQcXg4SytrM09tZkgxTmNPUjBKM3E5V1FKelJ5L0hlWmxo?=
 =?utf-8?B?NTFqTGQzSUlSQmxtK2dCN004OHNwR1BHU3J6SmZsb3lMYTk5UG11eWovU1Ar?=
 =?utf-8?B?WmlnSGJOeHN0TnRvM0UzaHMwd2luL3JjY2xCSCs0KzV6enpsZmc2cnVVZGNi?=
 =?utf-8?Q?7p+IHDhn+jT5Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjExQW5uUDMyL0htb2dFN2J3ZVRoZDdpaStVTUFabElIWTBEdzlsaVdxSytR?=
 =?utf-8?B?UlQwditJRGE2S0hiQVMvNUJqWjg3VFcxd3FGMDlDYlh0NCtPaXRwSEp1Y1FJ?=
 =?utf-8?B?SmdIRXRtUXVlZk1scjVlc3haMDZabURpZUYvTFNLT2ltNGh2V1NENDAzMlo1?=
 =?utf-8?B?bThVUjhPVjZFOTQyOGQ0VThSU2wzN2lULzU0RUdOQ2hKV2s5VHJXUzRTTHJY?=
 =?utf-8?B?NS9kWHg2N2hCTnM3MlFsVTNpTUQ4N3dvdDdHc1ZQd0owM2J5bDFWbGJ4K2dN?=
 =?utf-8?B?aWwvQ0ZCaitvaEZXOGdOYlJVMlVXNitTZEl5YmQvTnpBUDJtY0R1WGJJWkxp?=
 =?utf-8?B?REZlNXZRNUxIMW4ySlJialFIU1ltTkZuNmxaWnpCaDBncDIxaWRxQ1ZKM1RG?=
 =?utf-8?B?bFU2TE5vS3YzOTQwRmNoUzMxN1dvZ09scXlvSk1KV1FrOHJZZjVlYmxPWDEx?=
 =?utf-8?B?VTc0VXhaMmFyd3A3Z2FPaFMzSjF4ZXFzYUp2M1YrS252WkVkLzNTTWFYcWlp?=
 =?utf-8?B?WlFwRkJ0UGpQZTRsaytSc1p0dktwamJ1Y1M3eUJtRWorNnM0K3RjZDhrN2p0?=
 =?utf-8?B?UmNabHVxc3FJNGFDdnk4OUpaZFgwMCtGYVJCVkwwL05reERYUlArR3BMZ0I3?=
 =?utf-8?B?dDVkUWNZQWNHUXBMUEtTSEV2VGJmVEhHTGM3RFFaa1JTSzl5SmlGa3E4Tzlk?=
 =?utf-8?B?dEZEYWtBZ09KYU1TLzIrZWh0Zk50VUdKUURmZUxBQSs1UkF5c2pncmVyQ0lQ?=
 =?utf-8?B?ajhLZ2RRekJQRjdzM0RBKzA5Y3hiUlErcmhndkxyVmNmSTk1N25ZSmk5TmFk?=
 =?utf-8?B?WjhUK3RIb2w2ZUhqWHdsRGY3UnZqaUJNckRUYWxjczVhZjhleVg5a2YvTW9u?=
 =?utf-8?B?eXBIL2NCR0lBL3B0RFo2MHNGYXQzdUVub0RrMFFDclYrYXB3RHF3bFUxUWpB?=
 =?utf-8?B?eDd2TWFWdkR3SEVUT0xvV0ZtZlNsUWxFWGMzeUFHRUFSOUVzVEorSk5zUFJE?=
 =?utf-8?B?Z2pFSjRXMng5UEE2Zit5TnlRMTh1Sk1LMm9nWGZmUnQwQ1o1cGpucVF1bmJo?=
 =?utf-8?B?ZDlGKzVlSUl6VGV6eVhZRnpyRHp5NEpQVUMxUm84VnVJS0xmeWNoTkdHY0xF?=
 =?utf-8?B?Z0w2S2xHWGtJSlB6amlJdFg3R1VpRlN2c09pMGRBVTRudnJyLzJDVkViYnh0?=
 =?utf-8?B?MXIwK1JHNU9hM1U0eFZzTGZGMENDZmtLa3ZqZHNCbm9uNHVjOXNHTFhvWDF6?=
 =?utf-8?B?Y2hONmF4dGZiSnNZc3hmL25yYlJKOHc5bDlqSjA0cDIwdjZHcDJ4dnZvZGV3?=
 =?utf-8?B?MGdPZUExOERwTUhUNmdvUmhIRUNVMkdXN1dST2I0aTJFSGNlM1lyQTd1aWJj?=
 =?utf-8?B?ZTRpZDVLc0FDc2M3RzlCbU5lVGRXaCtLRzFsN1hCaVJaUnhLS2ZwZlh6c2ha?=
 =?utf-8?B?Z21ycWNra0RvVkhOUE80bDhFQ1dWZVlNNUlMUkJrQVlmKzl1c05QMldjLzhl?=
 =?utf-8?B?RU9DOHU3SnpYTEN5Yzd3V1BKR1dxVVVVQ3hvcld6dW02WmNod21PdFJlMnRn?=
 =?utf-8?B?b1pmZXBjQ21KM1hSNG1aV0FuNnVmaEhPaDVXU1VqMjhvZEFkT3B3a0pQL045?=
 =?utf-8?B?VHRYVldRWE1Ya1p2NjB5WFZhdzFOc3ZpeDJLRTRvZmJsVXBOSnZEbzBrWjRT?=
 =?utf-8?B?U2xBTEFXOXZHQVF5SldCYkJIcFlpeVJDbzlFR1BCWk9qL3FpcDRQWjM3SmR0?=
 =?utf-8?B?OWxiMm9USlFzUmg2S3RZU3Vsa09sNzJ0RnJhVHY3cktnTEJZaW10NzFhUzhm?=
 =?utf-8?B?VFVoVjRUZ1cwN1RpVlhtcXVLMmFHcWlJamlCbUNsdk40cHloWExQemIrUldH?=
 =?utf-8?B?RDg3TWFRWThDMHBFbGtvWDFrbFBoMUlMRW8wN1ZPRW8vSndyN0tDMlp5Q3h1?=
 =?utf-8?B?OVZBQmJvR2svVHE4dkNSYmpuNDBSQWJsR1VYMXovYWR6a2hzUE5NNnU0dUQr?=
 =?utf-8?B?WjVmdFl6SDNTWGV6SUhPTXZDSnFLY3BRMWZCKzhTTS9sbXFWRjVIQTZjcVZh?=
 =?utf-8?B?SE5neWpOR3BTbDdlcHZSN3hOUWtRMHJLWGw4U2d4UDhsMTNvSW54ZWtneXJp?=
 =?utf-8?Q?EQCXhvCugqSFXAARvkQFpWKPV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb54ab6d-a61b-4e9e-dda0-08dd23e3d425
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 06:25:58.1504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYn7RfJveEqRyRFH1WitS1cpGex8b4yGHO7EejbWlNs+2v1F91wSxPTyh9vHMJqGgiIlq81IV/27bCeE26sebQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10478
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

On 12/23/2024, Dmitry Baryshkov wrote:
> On Mon, Dec 23, 2024 at 02:41:37PM +0800, Liu Ying wrote:
>> i.MX8qxp Display Controller display engine consists of all processing
>> units that operate in a display clock domain.  Add minimal feature
>> support with FrameGen and TCon so that the engine can output display
>> timings.  The FrameGen driver, TCon driver and display engine driver
>> are components to be aggregated by a master registered in the upcoming
>> DRM driver.
>>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v7:
>> * Add kernel doc for struct dc_drm_device. (Dmitry)
>> * Fix regmap_config definitions by correcting name field, correcting read
>>   ranges and setting max_register field.
>> * Get instance numbers from device data(compatible strings) instead of OF
>>   aliases.
> 
> Unfortunately no. Your instances are compatible on the hardware level
> (at least they were with the previous versions, I don't think that
> there was a silicon change).
> 
>> * Collect Maxime's R-b tag.
>> * Trivial tweaks.
>>
>> v6:
>> * No change.
>>
>> v5:
>> * Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
>> * Select REGMAP and REGMAP_MMIO Kconfig options.
>> * Fix commit message to state that display engine driver is a component driver
>>   instead of a master/aggregate driver.
>>
>> v4:
>> * Use regmap to define register map for all registers. (Dmitry)
>> * Use regmap APIs to access registers. (Dmitry)
>> * Inline some small functions. (Dmitry)
>> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
>>   KMS routine to initialization stage. (Dmitry)
>> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
>> * Drop unnecessary private struct dc_*_priv.
>> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>>   interfaces to bind/unbind the drivers.
>>
>> v3:
>> * No change.
>>
>> v2:
>> * Use OF alias id to get instance id.
>> * Add dev member to struct dc_tc.
>>
>>  drivers/gpu/drm/imx/Kconfig     |   1 +
>>  drivers/gpu/drm/imx/Makefile    |   1 +
>>  drivers/gpu/drm/imx/dc/Kconfig  |   7 +
>>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>>  drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
>>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>>  drivers/gpu/drm/imx/dc/dc-drv.h |  29 +++
>>  drivers/gpu/drm/imx/dc/dc-fg.c  | 378 ++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-tc.c  | 142 ++++++++++++
>>  10 files changed, 810 insertions(+)
>>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
>>
> 
> [...]
> 
>> +
>> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct dc_drm_device *dc_drm = data;
>> +	void __iomem *base_top;
>> +	struct dc_de *de;
>> +	int ret;
>> +
>> +	de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
>> +	if (!de)
>> +		return -ENOMEM;
>> +
>> +	de->id = (enum dc_de_id)(uintptr_t)device_get_match_data(dev);
>> +
>> +	base_top = devm_platform_ioremap_resource_byname(pdev, "top");
>> +	if (IS_ERR(base_top))
>> +		return PTR_ERR(base_top);
>> +
>> +	de->reg_top = devm_regmap_init_mmio(dev, base_top,
>> +					    &dc_de_top_regmap_config);
>> +	if (IS_ERR(de->reg_top))
>> +		return PTR_ERR(de->reg_top);
>> +
>> +	de->irq_shdld = platform_get_irq_byname(pdev, "shdload");
> 
> Nit: shdload or shdld? Which one is used in the documentation?

shdload is used in i.MX8QXP TRM for the IRQ names.  I'll change de->irq_shdld
to de->irq_shdload and other similar ones in the drivers.

> 
>> +	if (de->irq_shdld < 0)
>> +		return de->irq_shdld;
>> +
>> +	de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
>> +	if (de->irq_framecomplete < 0)
>> +		return de->irq_framecomplete;
>> +
>> +	de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
>> +	if (de->irq_seqcomplete < 0)
>> +		return de->irq_seqcomplete;
>> +
>> +	de->dev = dev;
>> +
>> +	dev_set_drvdata(dev, de);
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dc_drm->de[de->id] = de;
>> +
>> +	return 0;
>> +}
>> +
> 
> [...]
> 
>> +
>> +struct dc_de {
>> +	struct device *dev;
>> +	struct regmap *reg_top;
>> +	struct dc_fg *fg;
>> +	struct dc_tc *tc;
>> +	int irq_shdld;
>> +	int irq_framecomplete;
>> +	int irq_seqcomplete;
>> +	enum dc_de_id id;
> 
> Why do you need to store it? This patch makes use of it just for the
> registration.
> 
>> +};
>> +
> 
> [...]
> 
>> +static int dc_fg_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct dc_drm_device *dc_drm = data;
>> +	void __iomem *base;
>> +	enum dc_fg_id id;
>> +	struct dc_fg *fg;
>> +	struct dc_de *de;
>> +
>> +	fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
>> +	if (!fg)
>> +		return -ENOMEM;
>> +
>> +	id = (enum dc_fg_id)(uintptr_t)device_get_match_data(dev);
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
>> +	if (IS_ERR(fg->reg))
>> +		return PTR_ERR(fg->reg);
>> +
>> +	fg->clk_disp = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(fg->clk_disp))
>> +		return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
>> +				     "failed to get display clock\n");
>> +
>> +	fg->dev = dev;
>> +
>> +	de = dc_drm->de[id];
> 
> This depends on a particular order of component's being bound. If the
> order changes for whatever reason (e.g. due to component.c
> implementation being changed) then your driver might crash here.
> 
> This applies to several other places in the driver.
> 
>> +	de->fg = fg;
>> +
>> +	return 0;
>> +}
>> +
> 

-- 
Regards,
Liu Ying
