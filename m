Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C0CC9F13F
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F269910E7CB;
	Wed,  3 Dec 2025 13:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4ztSI4du";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010071.outbound.protection.outlook.com
 [40.93.198.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E1B10E7B8;
 Wed,  3 Dec 2025 13:11:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1yfJuEu71WuX3MGGd0p1PrR4R+LcxW6BYIrTTVtLFAjeRJClQPbGtDGmNv5tUBmcUq3URhsc0n5HJwXQo72i1jCgBBUatyLya90LWY850WScXxdkp7IWqKW2AGU5rTStSoY60XMBIop1nKvok45JwqBzDpwIF/NypdLuO5at+9Z/y1kUUanZtVvO7Dy8fmhSlZPQpd60emi2BdIpUqkmQF0Pt5HjXmGCIS4FVb9+rbcT1/GMOB2/BSWHGDw3auiEhLodMdoGSFxtZ8Qm8uzlw6H+3oRQQj1qDhTahRJv6ql6OL9OAxw2aCX9V5qWCyJi7tTUGPyyGjQiRNm8lHp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaP35qWjY8jtZZiVK7fIyKwGDyCPUNYorqsKIQwajsE=;
 b=bVuBA1/NAfUSRmTVVvbLsFaLgsfh4uGu8NfMLUmjsoqXslZj/BrzIgi7xVeVgLEiDpkLSMZF9UvYZcreOx1r8F1MUzIE9gNdK6BNIkLd3P2MUZaZC1oZSwb9cEP95635ZbewT2Y77lSiy1WvqF/pJ1PfjKK1fOrrP68mHUj7wqZtM+5PR6ZgcfNnAUHr0NY7vd22+mZSKJPBxk14Veo9fIApbnzw+chE2Kk/Atu3bxRr+9OYOV+aRzYP9MNEZLXI6QzJnnlXCCJEB65Z6B4ayxtCod0JRAQxBz2DBhgF3TJ831A1sWviVpnhvfyjrT7HPo6MjViGGs05iAwlEAT66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaP35qWjY8jtZZiVK7fIyKwGDyCPUNYorqsKIQwajsE=;
 b=4ztSI4duYFmiUwpFfwhf85fkoE+iZ6W3uhA2Hq6GAtVSq1/bkxEm+Whyb39Kz0+PwUt0d0TREqFBaJPmlqIlhYpcEoRFin7u3kV0Xej3zBSz7Lmr/pSBroXAI7Evd27zHLcgwunz1/GOBKfHnTV5nWLGkjl3fyfC2x3XnHfa3b8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 13:11:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:11:08 +0000
Message-ID: <ffbc86ce-6e3b-4f2b-913c-fe46225b2c4e@amd.com>
Date: Wed, 3 Dec 2025 14:11:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] dma-buf: Don't misuse dma_fence_signal()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-7-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251201105011.19386-7-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: e6effce9-5df3-4ea4-a7d5-08de326d6c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0tZdm5Kbng5L3gwd1NrdTJZb1dEWTJoajM2T0xXT2hhZnZwS2JEc0k1UmpF?=
 =?utf-8?B?UldsUGNVbndPVnNJRVpCZjI5WHBmeVFWRkNma1M1S0ZBaitZeEtWMVBuYVVm?=
 =?utf-8?B?VGVyYVBZWk1Yc1NKTFhQSG8zL3Bva2FpVDBtSk9vZVVYaDRzOS9TaWRZaytk?=
 =?utf-8?B?SG5ZdlR4RGtBWFJVMWl5Q2tmNmpXeHdEMjI1anJ1eEFrUitpMlpOdU5kYkxt?=
 =?utf-8?B?cnFldGVVQUFCRUM2eHNXOHk5bG5vQWJsSGFLU21Ec3hBMTVqSFFmZll5VVRM?=
 =?utf-8?B?MjZCMkdRRjBnN3VoWWk5Unl2VDQ5cDY1QXExazF1aFk5RHlQaTU1dGdmVXJz?=
 =?utf-8?B?VnNVMVQwa3A4emxicWx5RkkzYTRmMWlvNlBqR1VVdXM0L1YyY1ZvQmFIMVkw?=
 =?utf-8?B?bzZseGd6SzhNN1RjS3licjdubkZQTXJHYXVGdkswMy93MW5pQ0duYlR3NjBX?=
 =?utf-8?B?Z09jay9DdEpmRW9xSkwzMWVWYVhWRngyakJQaUNTUTJsZlFKYVdiVDVPa0ZR?=
 =?utf-8?B?bWFJeGZDY1BrSDhvZzN3eDRmTnZIVk5LVGhSZ0I4RUVhcysyejNSalQxbXdh?=
 =?utf-8?B?NUhJVTRGaXRDb3VMaExBUkZRVmJKNUVidit6VFUxSi9KZzd0T3FzQ2FFcjhj?=
 =?utf-8?B?dUpkRzBqdGt3Wko4cDFTdVN3TTMxcFhIdFZocnpEMVpvb2x0S0R2VW15UGhV?=
 =?utf-8?B?QWVuQ1BOYVNlNm03R0ZMUjRGcTh6NEV2YmFvbU9xRW5yN1Y1NFk2TFNmS2hE?=
 =?utf-8?B?QVcrOWFRM202R2MyS1NPVnBEbmJnNExHZkpTTy92SVVncmphOGtvZVJUVERO?=
 =?utf-8?B?VlpTQWVId2xMY3FoNzhlWDJ4Q2ZaMGtjVmFIeUpUQU9JbWN0WG1BRTJwSXdS?=
 =?utf-8?B?RExNS3lEZ05kMkNIdGEyalUvaVdFc1IrcmVYRkNzSWxub2dLOGUrVm9jR3Vn?=
 =?utf-8?B?eFpIejYvdkdyMzRsRXJrWnkxdHFiemduOFRRUHMzRlRXbWRKbElLQU5DeW8v?=
 =?utf-8?B?bCt5MG9Hc25PK08rUk00K1BBdWRQRzlYWFBicmNORUVEdHpKeUs4M0xyclIw?=
 =?utf-8?B?Q3dRNEhHR0hVT2tiNThOYVNIdjdZTjh6QXhHa3N5UFNTZDJyMzhmUURGNGRa?=
 =?utf-8?B?VWZHUXFidE1tL2pvakFCYzRuNjgwT1N4V3lBUmx5Sy9SUC9vcnNKNGpWYWZx?=
 =?utf-8?B?RExkMmowSVFQZ2FnVTBnamdGU1ZLQ2VnbGZQWkd0WmcwZ21kYUlYMjhsQy85?=
 =?utf-8?B?OU5FOTRid3ZHOHN2ZlRHaGdwdlhoUkE1T1pNSXdpcndTbUtVeG9XbzFuWExy?=
 =?utf-8?B?QnBBVWVsRmd3UEhMdFh6MjcxQXRCYmRmSEJKLzh6ZXlOY1FyVVdyQmZNUUl2?=
 =?utf-8?B?aGdvd2N5NVZmYTV2a01lTDAvOVI0SFFIY0J3ZU1henFrR29kUzRrL1JPZzhS?=
 =?utf-8?B?NTN1cXRjTTNPZTdjSGhTcndrSUtYL0FVSEp2LzZJeEFPWlg3dHZ5ekx0SzVu?=
 =?utf-8?B?Q3diN2FPSjdPWGptRngzcXUxVUtTazdlNW5JUGFaeE9MZUVSam43RVdVa2Rt?=
 =?utf-8?B?N0owNnB6dFhNNnBvRkIxaVAzZnlRUForSUxBTXJ0MjdNVGVMbllLbDg3UVNQ?=
 =?utf-8?B?Mko5SXVrM3VORnFtTjlRTUFDN3dwSFFJZUlSUlBMbHo4RElmVGlvY0pKZE50?=
 =?utf-8?B?R0o2RUtXMFZrNXBOczV0a0NhVklsMEhaUGltRldtUjRUV2wxdVc0VkFUSkFP?=
 =?utf-8?B?R0pUMm92aUhiWEw5QWJaRGZaYkgwSU53RHNDV0hyNXh4WkhtZFJHQjQ0WG5T?=
 =?utf-8?B?L2ZCV25LUDhCbUFjUzRkL1UyY1lhc0RHQVVIL0NVMVNENlUrZGRncDZoWERw?=
 =?utf-8?B?MTgyRndTMVJhT0c4WWhkTkh5WENKbnVDM29kTllBaUxUSGxtTEE2UEJQVVlv?=
 =?utf-8?B?MFp1Ym0vWkFYNkxuamNNUFNtb2h1VW1UUnN5dGVtOVMySjEzZzhTN2lLNm10?=
 =?utf-8?Q?fRCDcaEXuZTwepEa9jn4FkO6lAsAm0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUNmZUFBb21Sbm83N0JFUXlVb1IvaGhpNENoTWZhOXFpVDZxV0xFMlQ2UUt0?=
 =?utf-8?B?Wm9qZTk0TGNzKzNiWHlnNEZuUytDYm40akpuanp5cnRPY3Z0bXR4cW9hNyta?=
 =?utf-8?B?OGtESzlJMWovMVNWaFlZMkI5R0F6Z01CMjBZOXFkSUFqc05jUFNyaXdlVmZJ?=
 =?utf-8?B?V25ScWVPS2JsZ2t4Z0t6UGc0K0xLd3lYWGJlTkZxSC9xTVd3TVMybWZIRTF0?=
 =?utf-8?B?Zm5GQVlsdjB5dGMxbE5QQnJJdnVqWXhHNFhRSHdPSlVBcHJwckRxK01qWE1N?=
 =?utf-8?B?VkRXOTBkYU4xWFYyRWxHWDhwYjh3dER1V2pYR0E1dFNoY3YzYi9oVGpoUGVH?=
 =?utf-8?B?dDhUdHI3YWIwYXpMcVNBRlZQR0ZFT2tjaXdOWkVLOHZYQ3VZYTZRS0djY2Y4?=
 =?utf-8?B?Q0Y5M1hDdnQ4MVQ4UEdQRkxpTFk3RktiM1JRU2xJdm4xSDIxT1hsU25LZmNz?=
 =?utf-8?B?Y2FVVWpsajdteGxBTkhYMG9RNnBiWThuQ0QyUmxBVGxoLzlDcHJlZVNrcE50?=
 =?utf-8?B?YytEZjNwTS9qalByMWpqVFN6WHBtaCtLSlM5dGNNZTlkMmJHV0FwQVE4Zllq?=
 =?utf-8?B?V0xJZEtLVUxlZVFJRlBWKy9EdWJLMmNvYm0rMkhPM2lqaHp0R1Z6K0RyTXpS?=
 =?utf-8?B?R0g1Y3ZCakJrblo5NkNYSFlIcTBFTkZiZ3NOMjJNamRzTFY0SVRNRUFIYk9i?=
 =?utf-8?B?NGhiR2FWZ1ZieVNpWC9OWlY3Sjg5TVRhbHVwWmpCamF0V3BhZXVtNGNPampW?=
 =?utf-8?B?Qy9JenVaNVBRUGZ6Wk9wRytET1VMUXFtUnRsaVEyRnNmN2hJbjFWVzZtVFNJ?=
 =?utf-8?B?Tk52bitZK1N0NWErMXhra3hhRmZQL1l3N2dTTDhHQVgrVU9wZEFHVlA0amtT?=
 =?utf-8?B?elRZVXdhQmRUNnkxbEx2Nk4xRWVpMFc1ZHU3NE5lUllhYlA3azBrRjBpQ2Rn?=
 =?utf-8?B?TWJObTNTTjNRNUdKZFgxS012Zk1BYlIvZXRIS0Y5V1hYVGlhdThScTViTmRk?=
 =?utf-8?B?WCtTd21uL0VkY3I2dFpSY29Jc0U2eXFNZmtBYkFDTlFFeDErWjAwLzBqTFFD?=
 =?utf-8?B?SExyMVN4KzJzY1dXUkZPZ1JTaStlU2M2c0VXMnppQUYzdEhmc05oVFEzQmtY?=
 =?utf-8?B?SUdLaE5pRGRoMEt1NjUxTTBwczkzZ3o2MDZJQVBlU3FSUDlYSG56NEdNcmVu?=
 =?utf-8?B?YWxuL3BSOW4zZkZOQkFyZ2taRHdjQ2JZYmsvRUZEbnNIeEQ4KzErL05Vd0Mr?=
 =?utf-8?B?MGRqSklBVUpCTDFsZjdMU2FaQnVsQklXeGtGQTVZdnRQQnV3TFRuMjZ2dkpQ?=
 =?utf-8?B?OHRKOExrTUp3U0VEZnh0RTRCMm5BVFdGakZJZ2NBek01UTM1TUJiUTBmQk5L?=
 =?utf-8?B?WXA1T00xOVRldUhxZzRtQ1FIZDVURkJxc1RpWTRObXZUYXROR1Z4cll3ZDBw?=
 =?utf-8?B?UEZkNEtPaWlBZ0gwQ2pzWnpyaEo5cEsyS2ZjZFRLM1pPaDFlSTdZQU5aaDFK?=
 =?utf-8?B?cjhncEFhN3p4SXZncktzS2pUMGpLbUlnU2kwenAvdWdhb1REN3JvNXJvRG92?=
 =?utf-8?B?cm1RZW9WM1JMdjVGZTBTY054Sjh3eksrQzBKSVBjWk5iSlRkTC96aTRnbFhz?=
 =?utf-8?B?TkRQNWJYY1hDRmYzME5sTGphbEFkY1hmMjRsbUNibmwxa1VLZ1NvS0lyNlF3?=
 =?utf-8?B?clA4N1FDQ29JRFhsNm91UVBMbDNKYXRsTW03YWhWQ1M3QzhPT2lEandMTmIr?=
 =?utf-8?B?aDJXVnV0WUhjTHRqZE10emw2Tk5LbDN3TU8wSk55eWVFa1BKTWovRmdtaVRL?=
 =?utf-8?B?SzdEek1GUGxoUjYxYzFtTzA2WlFyalF1R2NMeThvWlZqQzd4VzdCTFVRcUt6?=
 =?utf-8?B?ZktQVGhnNy9IbGtjR2RHNFJvemJIN3pnNHMreGROM1pBN21jUGlmNVJoTi8x?=
 =?utf-8?B?aEkvbWJ1TmVQaWo0VWpFR0h2a1RTZXp6amFyNVl2Q0tqMHVVWklLblI0WkZk?=
 =?utf-8?B?RzU4dENudFY5TTdVOFA4V1JQVThoYVJCQVlJMHhBcWtSeEE0Wk1ZWHVaWm1k?=
 =?utf-8?B?eUVSRk9hRHJKWEl1d3VKdTlvTEYzMFJSTm1ZYjk3QzJZRUVzcHozMGxrZ0Yy?=
 =?utf-8?Q?8tp9vdCO2cEYNk+rBxYOvIf4T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6effce9-5df3-4ea4-a7d5-08de326d6c6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:11:08.8613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aycFWEius2dpWGWkXtmAFOXLqbhbx0AKlaS0/yqsKoDZLJ0GB40d85C7kXZZmlrq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312
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

On 12/1/25 11:50, Philipp Stanner wrote:
> The return code of dma_fence_signal() is not really useful as there is
> nothing reasonable to do if a fence was already signaled. That return
> code shall be removed from the kernel.
> 
> Moreover, dma_fence_signal() should not be used to check whether fences
> are signaled. That's what dma_fence_is_signaled() and
> dma_fence_test_signaled_flag() exist for.
> 
> Replace the non-canonical usage of dma_fence_signal().
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/st-dma-fence.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index 27a36045410b..4dbe39c58bfb 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -126,7 +126,7 @@ static int test_signaling(void *arg)
>  		goto err_free;
>  	}
>  
> -	if (dma_fence_signal(f)) {
> +	if (dma_fence_check_and_signal(f)) {
>  		pr_err("Fence reported being already signaled\n");
>  		goto err_free;
>  	}
> @@ -136,7 +136,7 @@ static int test_signaling(void *arg)
>  		goto err_free;
>  	}
>  
> -	if (!dma_fence_signal(f)) {
> +	if (!dma_fence_test_signaled_flag(f)) {
>  		pr_err("Fence reported not being already signaled\n");
>  		goto err_free;
>  	}

