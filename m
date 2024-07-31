Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50019942443
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 03:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4915C10E050;
	Wed, 31 Jul 2024 01:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Q9HyL/M9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2089.outbound.protection.outlook.com [40.107.117.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6A410E050
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 01:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8GOqgA2ct0tEuhp7Y6eiSfSwQ2d4t4SCwJrU3SQV5sSJ6Qzp0dRqWIfVoBeEmfCotSucclM184ufi6Dm0CJrytf1z2ILmkRvL4/2WIw9y8g3dOuCzDhc6kDAlhUVDYoGh7N8FSyt8cxtEUeUbxGlRCh2tLhuVOdd/6bdb5q5lAOVFfokHDaUoVTA6s4xvr3szpcWCv8jvbqgFLlhAi158MpQ29pa1UR3qawBrVhy9hVnY6kQuujKjeNvMIEpzmslFKsEKo5rNi6Sc0VXZG7DsVVZ+R+U1zXBNV3NzONZXOnBffvggHIoxm7m4Jeml9qSHIzSuzLXkVahi1BeMjFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YDV2GU0rwe7jnxnUzF1diyOBQnxDNiuk/IzPf8tt8E=;
 b=EqCJ4jH9X1rT6j0dPpigLKKOMuD1OhR9gKUhJ0IilAzSE5kEbQJcwGFPEns9yo0Xy37bgOKPKMM9xZYpM65FWpJVvoNlA7hK6T9MxDyjZh/GvdwoujIVP6y/ov2dM0SHJ55ZGCJk2KJyCNk9M/PmUpeg/ivZt+2K9tv6XxYiYc89HdUY4i4DhLK4AZKMoL06jXr1rbPcrfNuamfJMhKtfom/FegbAblyjY+WMV5k/g0WEw8XJZ1ngEzt05EyONB/aYwb4sSDkARGrF35L/bK3r/VDmKeIs594jZ1sE17sNV1RTZPRexyyg3sSqnp1OFzfNcUvQ8mIs53w6WWQpWsNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YDV2GU0rwe7jnxnUzF1diyOBQnxDNiuk/IzPf8tt8E=;
 b=Q9HyL/M9oGyUTcBx2BOYH3YwQ6ztPs8GBVfb7duMGmY9yfaI90m+GgOUj/UmlM8Mubk0uSW5K/hDh1o7M+OlQMZf/YLSgjRr+WSMlr+CB35MlR1lQm0PyjMEH/dnFR0ZaZ2IJ/160hloV2H+wJQbLDwAQOMjn/ZdzqOAm2EkZEQ5bpWKG3H2tjwUzVk6tgu5O2ICiDjO/vtqwKnJ+R5eS38j6I64ipYYTQ8WQai783yDMz8OA1WREZ8eDTgrt2xyvsMYdk7Ire1BG5sAzDkG0F9QLcQiu2iHzAynPNKwQR8vlccXK9wdVhgBl2vrUWgWdfXHMExU633tL6u+DGPcBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by OSQPR06MB7131.apcprd06.prod.outlook.com (2603:1096:604:29a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.32; Wed, 31 Jul
 2024 01:47:05 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 01:47:05 +0000
Message-ID: <47beaca6-8118-4458-898a-42fc3286d991@vivo.com>
Date: Wed, 31 Jul 2024 09:47:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: "T.J. Mercier" <tjmercier@google.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <d2f56198-a3c2-4f7b-9d10-616deb348351@amd.com>
 <966651c0-42fc-4827-bf3e-2170dcf4688c@vivo.com>
 <CABdmKX3xoUwVbj1-G1Q7gyi-7r9J8PeW8Y92Od5epRKumYL-qA@mail.gmail.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <CABdmKX3xoUwVbj1-G1Q7gyi-7r9J8PeW8Y92Od5epRKumYL-qA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|OSQPR06MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 5824b455-0801-4d4b-8afb-08dcb102adf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|7416014|366016|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEhVQVlnMnpncTdsc3VOTVhuQ1RUSjgrTCs5M0w5MUkvTytDdnNqb3hxK1lK?=
 =?utf-8?B?a3ZPQjQzby9NN2xTOVNhaXlPSDBvdktYdnBrQWgveHpVTDZzVzAzWGlzYmR6?=
 =?utf-8?B?NkFTdk5HYlg3c29rVGJyTFZ6bVVYeFpqSVB2TEVPZG1LbklrY2VobzhTWDJz?=
 =?utf-8?B?NVBhK08rQTJsenJzc3BUdEN6N1FVU1p0Q09mU1I1OXBSaThBeUQyeFFINkJy?=
 =?utf-8?B?SG1NMmhhUDZ3bzNRVE9RS1NGczdJWWgvRm9EWW1GWXJYdWluVkFxYmk2UFVX?=
 =?utf-8?B?SFFLMDI2WW5HUDFPd0FHK0R6cXBVdFBtWUJ3dENJOXhuS0xuZTNvdzFOcHpz?=
 =?utf-8?B?UWhsaHhhUWZVYm43U1E5anR0TDljV0NibkloY0RXTFAweG05OGJlMUY4eVN5?=
 =?utf-8?B?ejlHdnhZQjlYUEpZOWFuWVc4ZjlHS1ZSKzRJMWtZUmJmak14T1F5alhjMXpE?=
 =?utf-8?B?cjhRTDZJNVowTVpTV21hMUdEbmlPMHRPMS8veCsvejdocXRHTm42TUpRZVZw?=
 =?utf-8?B?QzNKWFduclNNdzNGZ0lRVmFzeEY1Mjd1bmJtak42ZkxsOEFUajhrc0tGbUIx?=
 =?utf-8?B?ZlF5NFRCMEMxWXJIdzJtU1JYankweElrL0gvVlZzSS9KWjBUUkYwaDVmbU5l?=
 =?utf-8?B?R0s4R0xoR2oreC9FbTZGQW5LU2JGdlBhUXNvTXZLY2lrRlFXbWtoREcza2k5?=
 =?utf-8?B?VGxMY3luR3gzeDRUU1d5VjI0TnM4eXRXZlFFT2lKQXR1T3NCdzUrM2Z2V0N3?=
 =?utf-8?B?eVFzQTJhaXVuWldPN0tVU0w1YUUwbWJDaFNPdEpzcGdudGg0bEt0MDZYdUNy?=
 =?utf-8?B?akJVczZPQ1EyZzEvOU1FS1lQajVvMVpSOWgzQks4THhQYnlNU0lWT1Q0LzVE?=
 =?utf-8?B?SW50ME00QjIrYVU3TmJQZnNSd3gyVmUwbHpWeVcwVlNBU21ocWJ3aTk1ZlhO?=
 =?utf-8?B?d0lEWVZoNnlJU243dUEzcmJkTHU4STBZTEdiM0JoUkFRTTUvUTVzMUJvMWUy?=
 =?utf-8?B?UzlsU3M4ZmMvZDhCYzhPV3VuTXdZRkZkdWF6T012VjZFMEZlRXdXZTYxNElR?=
 =?utf-8?B?WlRKSmhVUG1Lek5zNW5BZzhqWE42ZUtVemJDN0NYd2VXVXlJTHlIT0dyclFC?=
 =?utf-8?B?Y2RnbU9RcUNEM0VRckNvcVQ3Q1hkLzN5OEdnY0ZJSDMvZW5randjTzgxSWNY?=
 =?utf-8?B?cTFSNUxpbWl6M01FelFhVzF5cGVHWGZXU0dvSGVxdjNoWG5qcmNpa2plZitO?=
 =?utf-8?B?aWVHdkpLWVpIWStocFovaFR3YlM0SUJUTU9LUXJZM2ZLbnVuaXZiTERnZjNY?=
 =?utf-8?B?aG9SYVFHWEtUZlBHNlBUM3NTV0l6UGhZd3N0ZUUrZUJOQUtIcWM3S052MEIv?=
 =?utf-8?B?K0psV1V5UFZ2RkRFT3loNjF2aTQvOFBqalZwNnVybFpjRTRTMTR3MjBMUXpm?=
 =?utf-8?B?UTdFZzdMYWM2ZTVaN29XRG8yRUVQajNVQThXRDl0TjRBN1M5UndIbDhkWDJv?=
 =?utf-8?B?d0VQM1RuYVZwM3lOWTVlTVBLdyt4VEdkMitTSlExNSszRU9PSDlUdkFhcXdE?=
 =?utf-8?B?ejlwUURFMlZ4OUxnc2Q0Y1E4RTRFQ2dFVG9jblcvWlAxTFlTRFYxUFp0Rjc2?=
 =?utf-8?B?VVZ2WGNoNWs2ZnpDeWlhQi9vWG8yTlpnYkJQSCtpNFQ4bDBCZzN6RUx2c1ph?=
 =?utf-8?B?WGoxUit0R0ZNVjJNYVpwT3M5d0tsaVFwV3pSNDE1b2FSdmg5UmhIOVgvWFJo?=
 =?utf-8?B?eGFHTkdJU3pKYUgzZGpvOGhyLzdndFo3Z3JXV3NzUlNIVnAxTno3ODNiVEJi?=
 =?utf-8?B?Zzc5L1NJeXNKZ1pVWVNUdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGg2dE5YUlBaTzkxQXhJMm15aVdYQUptSXpjYkkzbjFBQkczc3owcGw5SHMz?=
 =?utf-8?B?OUxtbTUzazJHL2VZMmtKa2dSVmdGTEdIbURoLzdXRFp1a2lmc1d0WEw4MUta?=
 =?utf-8?B?RnJLeUo1MCtudEd5bjRBTlRwK3Y4Y0FJczh1TWRSb3J6LzRPRVhrM0J1MklZ?=
 =?utf-8?B?VXAvVzVXeEw5NTN3K0Vsdk10ZXYwMWhTcklCTHRDSm0rSmtRYjVMdk5LbXRG?=
 =?utf-8?B?Ky9UNDRJVVkyK3NMWkNybFlwcDRJQWtuazBpWHV6VHQ3eWZrWFlJOGtUK0Zk?=
 =?utf-8?B?TTR1bGs2dVB6UlczZGp6UzJYVThsTVRXbkZWTGRqUmJ3MGFUam1UTmtNZkZM?=
 =?utf-8?B?dEd6OXF3MUhVWno5aCtIalREbXRNdi9heEExRHFWak10ajRjV3R3VlNPVXZT?=
 =?utf-8?B?RUl6RkkxL0pxdWVuc2UxVndQQ084eTR6am9uNStJSjhOcjdPTVBaZFJiaFVW?=
 =?utf-8?B?bUpIT25TZ2xpN0Q0aXdYZ1VJTXpKejJlbmZXOW9tZE1hMWdIN3FGMTJ5eHQ0?=
 =?utf-8?B?NXA3M0puTHdKMUtZd21mNGl0WG9ZKzMvZHA2SDVOVDFIcDNnZVRqQWVsRzEr?=
 =?utf-8?B?MTd2bjFaeVJZWW5ZdEtLUHBkcExDcURoRTMraVFkZ1p2VGFOTDNkeVlhemJ2?=
 =?utf-8?B?MHZoQ3d4dzRzUThtdmFhVjk5cDdvQmQxb2NmUndGV1dJeVpsMzJYYjlKK0Rw?=
 =?utf-8?B?RmZnTzE5L3MyU1FvREpwZW5KVC9STkVCQTRndHZVRGtNVmplTGc4N3RjdDRN?=
 =?utf-8?B?Ry9jRyszR0thRC9MbkcwZlhObk0waUkxWFFpV0VucUU0QTg4Y0RFczlML1Yw?=
 =?utf-8?B?aitCbFVyRm9yRkx6R3J6eGxzUlRPUnVmeDVYeXpsbkcyY3ZNOFZrdit1cDg2?=
 =?utf-8?B?VVBHcXdFcENmYmRiR2h0TjhGQzlzMUc5YVExMFA1V0c2S2ZKdklnL0Q5ZS9S?=
 =?utf-8?B?S0ZCYWtwZUxHTXZxOHNGTktJaENNVlJSZXZrYStkM0FXaXdDUlBlak5iU2FN?=
 =?utf-8?B?bVZhaGNHdXM3eW1EUkJ2SUxBSXBTWTBMSmVjeDdOdVZsN29WV0w4bVl3ajND?=
 =?utf-8?B?MGczUTBjMHZTY2MyKzlSUXpKQlNGU2luYUpWNkE5MGYxWmRkVFRFSEhDRUJm?=
 =?utf-8?B?U20rMGJ6WnRFOTlZeEpNYUtJdlpFekw3QmdOV05Pb01teXBtRlZBaWJmanpq?=
 =?utf-8?B?Ykp6VnFmZGIxdzI1V2t2RkU3N1BmQnlCUkRYNGNvdml0TEg0QmJLV1JVUlU3?=
 =?utf-8?B?UWxaS1cvcVZ4Wk1jZnJUY1YrTjBmakFvaE1SOFBFbUxmZXFOZUMzMXBROURP?=
 =?utf-8?B?VU9OUGVFWTllaGh4VHlsZUN3MUVyQnR1SFFUbnlhZXNWTzhuOVgzaGhNbnl2?=
 =?utf-8?B?L0lUU2pQcHpaUTNVKy9mWlI0RWtKMUViMUNNYVFsM01kUjZCajRQOEFkM0Jx?=
 =?utf-8?B?eUl4REZxc2VUaU9RbEFmZjJwMUtGcGl6UkRPNGt4MGNlRys1V0YrTFpFUE96?=
 =?utf-8?B?N0RoaWRyQUkvVDFkWlVVY1I3alBtQ1BmM2dpTzFKRER1dm5wNkdweDJqVHJR?=
 =?utf-8?B?RTE4eWpyQnRNK1VHS1FZR0FNamhxVTBnUk5meHVqNkZZYzMrTC9LS2ZtQmts?=
 =?utf-8?B?elRtUGhEbmRlcHRXcTBLb1RUMWRRbUExT0wrMWdzRGlML01ycmo0K3NQSFpB?=
 =?utf-8?B?OFVnQU9SbzJSZC9EVS9rRHl0bWRJS24yZ1Z1aHdBTjQrVnEveGxqMGlQWklP?=
 =?utf-8?B?d3hTMUNtYnJISVJJek5uREhrY1pGUnlqRWdxcVIxN3U4UTNMRVpkQWZjbkZZ?=
 =?utf-8?B?c2FkYmFxZzFDc2FNR0NLMVQ2ZlpXdHVkRUpJK1dPT3ZnRGpseCtzTTQycGpM?=
 =?utf-8?B?aTdDa1c5MklzcXlOTU5PYk9mRHErb3NLYkZwUEJQUHRhYWNqWHJRNG9wOVh6?=
 =?utf-8?B?aFZndThwTXducTNiUkVkd2JBRFFJY0R2dUVUc1FXbVgwL3dlVUptMDI0UEgx?=
 =?utf-8?B?OU9NWVVrbkI2azUya2UyWkg4ZlRyak1laVpvMytyQmcxdHN6S2hrTnovMDZw?=
 =?utf-8?B?RFh5UWdqbDJmY2tobHJqbEY3cS9uQUVrcXFTdnZMdkdESlVVWXdtZGFQMzF2?=
 =?utf-8?Q?EAWamlVCZ0bzube9K23mc6KZ9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5824b455-0801-4d4b-8afb-08dcb102adf5
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 01:47:04.8593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjm0XMRH8FAe3QKsBBmn1/nVR7XXyvXo2iepUUn//b6mZqhHe03/qcz6vpnhK3yiiTZDIdulgo6Iy09pQlkgag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7131
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


在 2024/7/31 1:19, T.J. Mercier 写道:
> On Tue, Jul 30, 2024 at 1:14 AM Huan Yang <link@vivo.com> wrote:
>>
>> 在 2024/7/30 16:03, Christian König 写道:
>>> Am 30.07.24 um 09:57 schrieb Huan Yang:
>>>> Background
>>>> ====
>>>> Some user may need load file into dma-buf, current way is:
>>>>     1. allocate a dma-buf, get dma-buf fd
>>>>     2. mmap dma-buf fd into user vaddr
>>>>     3. read(file_fd, vaddr, fsz)
>>>> Due to dma-buf user map can't support direct I/O[1], the file read
>>>> must be buffer I/O.
>>>>
>>>> This means that during the process of reading the file into dma-buf,
>>>> page cache needs to be generated, and the corresponding content needs to
>>>> be first copied to the page cache before being copied to the dma-buf.
>>>>
>>>> This way worked well when reading relatively small files before, as
>>>> the page cache can cache the file content, thus improving performance.
>>>>
>>>> However, there are new challenges currently, especially as AI models are
>>>> becoming larger and need to be shared between DMA devices and the CPU
>>>> via dma-buf.
>>>>
>>>> For example, our 7B model file size is around 3.4GB. Using the
>>>> previous would mean generating a total of 3.4GB of page cache
>>>> (even if it will be reclaimed), and also requiring the copying of 3.4GB
>>>> of content between page cache and dma-buf.
>>>>
>>>> Due to the limited resources of system memory, files in the gigabyte
>>>> range
>>>> cannot persist in memory indefinitely, so this portion of page cache may
>>>> not provide much assistance for subsequent reads. Additionally, the
>>>> existence of page cache will consume additional system resources due to
>>>> the extra copying required by the CPU.
>>>>
>>>> Therefore, I think it is necessary for dma-buf to support direct I/O.
>>>>
>>>> However, direct I/O file reads cannot be performed using the buffer
>>>> mmaped by the user space for the dma-buf.[1]
>>>>
>>>> Here are some discussions on implementing direct I/O using dma-buf:
>>>>
>>>> mmap[1]
>>>> ---
>>>> dma-buf never support user map vaddr use of direct I/O.
>>>>
>>>> udmabuf[2]
>>>> ---
>>>> Currently, udmabuf can use the memfd method to read files into
>>>> dma-buf in direct I/O mode.
>>>>
>>>> However, if the size is large, the current udmabuf needs to adjust the
>>>> corresponding size_limit(default 64MB).
>>>> But using udmabuf for files at the 3GB level is not a very good
>>>> approach.
>>>> It needs to make some adjustments internally to handle this.[3] Or else,
>>>> fail create.
>>>>
>>>> But, it is indeed a viable way to enable dma-buf to support direct I/O.
>>>> However, it is necessary to initiate the file read after the memory
>>>> allocation
>>>> is completed, and handle race conditions carefully.
>>>>
>>>> sendfile/splice[4]
>>>> ---
>>>> Another way to enable dma-buf to support direct I/O is by implementing
>>>> splice_write/write_iter in the dma-buf file operations (fops) to adapt
>>>> to the sendfile method.
>>>> However, the current sendfile/splice calls are based on pipe. When using
>>>> direct I/O to read a file, the content needs to be copied to the buffer
>>>> allocated by the pipe (default 64KB), and then the dma-buf fops'
>>>> splice_write needs to be called to write the content into the dma-buf.
>>>> This approach requires serially reading the content of file pipe size
>>>> into the pipe buffer and then waiting for the dma-buf to be written
>>>> before reading the next one.(The I/O performance is relatively weak
>>>> under direct I/O.)
>>>> Moreover, due to the existence of the pipe buffer, even when using
>>>> direct I/O and not needing to generate additional page cache,
>>>> there still needs to be a CPU copy.
>>>>
>>>> copy_file_range[5]
>>>> ---
>>>> Consider of copy_file_range, It only supports copying files within the
>>>> same file system. Similarly, it is not very practical.
>>>>
>>>>
>>>> So, currently, there is no particularly suitable solution on VFS to
>>>> allow dma-buf to support direct I/O for large file reads.
>>>>
>>>> This patchset provides an idea to complete file reads when requesting a
>>>> dma-buf.
>>>>
>>>> Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>>> ===
>>>> This patch provides a method to immediately read the file content after
>>>> the dma-buf is allocated, and only returns the dma-buf file descriptor
>>>> after the file is fully read.
>>>>
>>>> Since the dma-buf file descriptor is not returned, no other thread can
>>>> access it except for the current thread, so we don't need to worry about
>>>> race conditions.
>>> That is a completely false assumption.
>> Can you provide a detailed explanation as to why this assumption is
>> incorrect? thanks.
>>>> Map the dma-buf to the vmalloc area and initiate file reads in kernel
>>>> space, supporting both buffer I/O and direct I/O.
>>>>
>>>> This patch adds the DMA_HEAP_ALLOC_AND_READ heap_flag for user.
>>>> When a user needs to allocate a dma-buf and read a file, they should
>>>> pass this heap flag. As the size of the file being read is fixed,
>>>> there is no
>>>> need to pass the 'len' parameter. Instead, The file_fd needs to be
>>>> passed to
>>>> indicate to the kernel the file that needs to be read.
>>>>
>>>> The file open flag determines the mode of file reading.
>>>> But, please note that if direct I/O(O_DIRECT) is needed to read the
>>>> file,
>>>> the file size must be page aligned. (with patch 2-5, no need)
>>>>
>>>> Therefore, for the user, len and file_fd are mutually exclusive,
>>>> and they are combined using a union.
>>>>
>>>> Once the user obtains the dma-buf fd, the dma-buf directly contains the
>>>> file content.
>>> And I'm repeating myself, but this is a complete NAK from my side to
>>> this approach.
>>>
>>> We pointed out multiple ways of how to implement this cleanly and not
>>> by hacking functionality into the kernel which absolutely doesn't
>>> belong there.
>> In this patchset, I have provided performance comparisons of each of
>> these methods.  Can you please provide more opinions?
>>> Regards,
>>> Christian.
>>>
>>>> Patch 1 implement it.
>>>>
>>>> Patch 2-5 provides an approach for performance improvement.
>>>>
>>>> The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
>>>> synchronously read files using direct I/O.
>>>>
>>>> This approach helps to save CPU copying and avoid a certain degree of
>>>> memory thrashing (page cache generation and reclamation)
>>>>
>>>> When dealing with large file sizes, the benefits of this approach become
>>>> particularly significant.
>>>>
>>>> However, there are currently some methods that can improve performance,
>>>> not just save system resources:
>>>>
>>>> Due to the large file size, for example, a AI 7B model of around
>>>> 3.4GB, the
>>>> time taken to allocate DMA-BUF memory will be relatively long. Waiting
>>>> for the allocation to complete before reading the file will add to the
>>>> overall time consumption. Therefore, the total time for DMA-BUF
>>>> allocation and file read can be calculated using the formula
>>>>      T(total) = T(alloc) + T(I/O)
>>>>
>>>> However, if we change our approach, we don't necessarily need to wait
>>>> for the DMA-BUF allocation to complete before initiating I/O. In fact,
>>>> during the allocation process, we already hold a portion of the page,
>>>> which means that waiting for subsequent page allocations to complete
>>>> before carrying out file reads is actually unfair to the pages that have
>>>> already been allocated.
>>>>
>>>> The allocation of pages is sequential, and the reading of the file is
>>>> also sequential, with the content and size corresponding to the file.
>>>> This means that the memory location for each page, which holds the
>>>> content of a specific position in the file, can be determined at the
>>>> time of allocation.
>>>>
>>>> However, to fully leverage I/O performance, it is best to wait and
>>>> gather a certain number of pages before initiating batch processing.
>>>>
>>>> The default gather size is 128MB. So, ever gathered can see as a file
>>>> read
>>>> work, it maps the gather page to the vmalloc area to obtain a continuous
>>>> virtual address, which is used as a buffer to store the contents of the
>>>> corresponding file. So, if using direct I/O to read a file, the file
>>>> content will be written directly to the corresponding dma-buf buffer
>>>> memory
>>>> without any additional copying.(compare to pipe buffer.)
>>>>
>>>> Consider other ways to read into dma-buf. If we assume reading after
>>>> mmap
>>>> dma-buf, we need to map the pages of the dma-buf to the user virtual
>>>> address space. Also, udmabuf memfd need do this operations too.
>>>> Even if we support sendfile, the file copy also need buffer, you must
>>>> setup it.
>>>> So, mapping pages to the vmalloc area does not incur any additional
>>>> performance overhead compared to other methods.[6]
>>>>
>>>> Certainly, the administrator can also modify the gather size through
>>>> patch5.
>>>>
>>>> The formula for the time taken for system_heap buffer allocation and
>>>> file reading through async_read is as follows:
>>>>
>>>>     T(total) = T(first gather page) + Max(T(remain alloc), T(I/O))
>>>>
>>>> Compared to the synchronous read:
>>>>     T(total) = T(alloc) + T(I/O)
>>>>
>>>> If the allocation time or I/O time is long, the time difference will be
>>>> covered by the maximum value between the allocation and I/O. The other
>>>> party will be concealed.
>>>>
>>>> Therefore, the larger the size of the file that needs to be read, the
>>>> greater the corresponding benefits will be.
>>>>
>>>> How to use
>>>> ===
>>>> Consider the current pathway for loading model files into DMA-BUF:
>>>>     1. open dma-heap, get heap fd
>>>>     2. open file, get file_fd(can't use O_DIRECT)
>>>>     3. use file len to allocate dma-buf, get dma-buf fd
>>>>     4. mmap dma-buf fd, get vaddr
>>>>     5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>     6. share, attach, whatever you want
>>>>
>>>> Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
>>>>     1. open dma-heap, get heap fd
>>>>     2. open file, get file_fd(buffer/direct)
>>>>     3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag,
>>>> set file_fd
>>>>        instead of len. get dma-buf fd(contains file content)
>>>>     4. share, attach, whatever you want
>>>>
>>>> So, test it is easy.
>>>>
>>>> How to test
>>>> ===
>>>> The performance comparison will be conducted for the following
>>>> scenarios:
>>>>     1. normal
>>>>     2. udmabuf with [3] patch
>>>>     3. sendfile
>>>>     4. only patch 1
>>>>     5. patch1 - patch4.
>>>>
>>>> normal:
>>>>     1. open dma-heap, get heap fd
>>>>     2. open file, get file_fd(can't use O_DIRECT)
>>>>     3. use file len to allocate dma-buf, get dma-buf fd
>>>>     4. mmap dma-buf fd, get vaddr
>>>>     5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>     6. share, attach, whatever you want
>>>>
>>>> UDMA-BUF step:
>>>>     1. memfd_create
>>>>     2. open file(buffer/direct)
>>>>     3. udmabuf create
>>>>     4. mmap memfd
>>>>     5. read file into memfd vaddr
>>>>
>>>> Sendfile step(need suit splice_write/write_iter, just use to compare):
>>>>     1. open dma-heap, get heap fd
>>>>     2. open file, get file_fd(buffer/direct)
>>>>     3. use file len to allocate dma-buf, get dma-buf fd
>>>>     4. sendfile file_fd to dma-buf fd
>>>>     6. share, attach, whatever you want
>>>>
>>>> patch1/patch1-4:
>>>>     1. open dma-heap, get heap fd
>>>>     2. open file, get file_fd(buffer/direct)
>>>>     3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag,
>>>> set file_fd
>>>>        instead of len. get dma-buf fd(contains file content)
>>>>     4. share, attach, whatever you want
>>>>
>>>> You can create a file to test it. Compare the performance gap between
>>>> the two.
>>>> It is best to compare the differences in file size from KB to MB to GB.
>>>>
>>>> The following test data will compare the performance differences
>>>> between 512KB,
>>>> 8MB, 1GB, and 3GB under various scenarios.
>>>>
>>>> Performance Test
>>>> ===
>>>>     12G RAM phone
>>>>     UFS4.0(the maximum speed is 4GB/s. ),
>>>>     f2fs
>>>>     kernel 6.1 with patch[7] (or else, can't support kvec direct I/O
>>>> read.)
>>>>     no memory pressure.
>>>>     drop_cache is used for each test.
>>>>
>>>> The average of 5 test results:
>>>> | scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns) |
>>>> 3GB(ns)       |
>>>> | ------------------- | ---------- | ---------- | ------------- |
>>>> ------------- |
>>>> | normal              | 2,790,861  | 14,535,784 | 1,520,790,492 |
>>>> 3,332,438,754 |
>>>> | udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000 |
>>>> 2,108,419,923 |
>>>> | sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 |
>>>> 3,062,052,984 |
>>>> | patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800 |
>>>> 2,187,570,861 |
>>>> | sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 |
>>>> 9,777,661,077 |
>>>> | patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 |
>>>> 5,648,897,554 |
>>>> | udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784 |
>>>> 2,158,305,738 |
>>>> | patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538 |
>>>> 1,400,006,107 |
>> With this test, sendfile can't give a good help base on pipe buffer.
>>
>> udmabuf is good, but I think our oem driver can't suit it. (And, AOSP do
>> not open this feature)
> Hi Huan,
>
> We should be able to turn on udmabuf for the Android kernels. We don't
> have CONFIG_UDMABUF because nobody has wanted it so far. It's
> encouraging to see your latest results!
OK, that's greate. I will further study the use of udmabuf and notify 
our partners, and make every effort to encourage them to adapt udmabuf.
>
> -T.J.
>
>
>> Anyway, I am sending this patchset in the hope of further discussion.
>>
>> Thanks.
>>
>>>> So, based on the test results:
>>>>
>>>> When the file is large, the patchset has the highest performance.
>>>> Compared to normal, patchset is a 50% improvement;
>>>> Compared to normal, patch1 only showed a degradation of 41%.
>>>> patch1 typical performance breakdown is as follows:
>>>>     1. alloc cost 188,802,693 ns
>>>>     2. vmap cost 42,491,385 ns
>>>>     3. file read cost 4,180,876,702 ns
>>>> Therefore, directly performing a single direct I/O read on a large file
>>>> may not be the most optimal way for performance.
>>>>
>>>> The performance of direct I/O implemented by the sendfile method is
>>>> the worst.
>>>>
>>>> When file size is small, The difference in performance is not
>>>> significant. This is consistent with expectations.
>>>>
>>>>
>>>>
>>>> Suggested use cases
>>>> ===
>>>>     1. When there is a need to read large files and system resources
>>>> are scarce,
>>>>        especially when the size of memory is limited.(GB level) In this
>>>>        scenario, using direct I/O for file reading can even bring
>>>> performance
>>>>        improvements.(may need patch2-3)
>>>>     2. For embedded devices with limited RAM, using direct I/O can
>>>> save system
>>>>        resources and avoid unnecessary data copying. Therefore, even
>>>> if the
>>>>        performance is lower when read small file, it can still be used
>>>>        effectively.
>>>>     3. If there is sufficient memory, pinning the page cache of the
>>>> model files
>>>>        in memory and placing file in the EROFS file system for
>>>> read-only access
>>>>        maybe better.(EROFS do not support direct I/O)
>>>>
>>>>
>>>> Changlog
>>>> ===
>>>>    v1 [8]
>>>>    v1->v2:
>>>>      Uses the heap flag method for alloc and read instead of adding a new
>>>>      DMA-buf ioctl command. [9]
>>>>      Split the patchset to facilitate review and test.
>>>>        patch 1 implement alloc and read, offer heap flag into it.
>>>>        patch 2-4 offer async read
>>>>        patch 5 can change gather limit.
>>>>
>>>> Reference
>>>> ===
>>>> [1]
>>>> https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com/
>>>> [2]
>>>> https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
>>>> [3]
>>>> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
>>>> [4]
>>>> https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
>>>> [5]
>>>> https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
>>>> [6]
>>>> https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com/
>>>> [7]
>>>> https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/20230209102954.528942-7-dhowells@redhat.com/
>>>> [8]
>>>> https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
>>>> [9]
>>>> https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.com/
>>>>
>>>> Huan Yang (5):
>>>>     dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>>>     dma-buf: heaps: Introduce async alloc read ops
>>>>     dma-buf: heaps: support alloc async read file
>>>>     dma-buf: heaps: system_heap alloc support async read
>>>>     dma-buf: heaps: configurable async read gather limit
>>>>
>>>>    drivers/dma-buf/dma-heap.c          | 552 +++++++++++++++++++++++++++-
>>>>    drivers/dma-buf/heaps/system_heap.c |  70 +++-
>>>>    include/linux/dma-heap.h            |  53 ++-
>>>>    include/uapi/linux/dma-heap.h       |  11 +-
>>>>    4 files changed, 673 insertions(+), 13 deletions(-)
>>>>
>>>>
>>>> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
