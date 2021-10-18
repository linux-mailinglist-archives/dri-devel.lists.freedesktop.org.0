Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8F4317A0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 13:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23A96E862;
	Mon, 18 Oct 2021 11:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000E66E0D6;
 Mon, 18 Oct 2021 11:41:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N663q+HsnpDpkphfHGAdShlhGpqR4Q6h3SVXxWr840RZ/Hhr3l7IYoaetymE9CvBGGTir/azYWmoQPxy0ceWsks4+5qDqGFPGKf44NOZSa++3I+/w6B+/SYC8rgCpTzB70kEiF9q19zgm+Xvhh73XRbOW6MhkaVRue309MiZ3M43TJ2tcBwaMYwiPIBxpkzdtCaXdMJp3b031oT7fsdY0uEQLgPzDZPdGOOGVlz99S3JhO0QVZkxWPRXu5A3v9tsNsbDt5q1JQ9JltpsHAt2edvW5pjkGXWE2O+ftDKT+t8b7z/ARc5DspnBK+sqnmV0ZepkZvrVNW1me9D0f9Gxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f+7rxWYSb2P/YzEBbzna3gdROwQbCM0r3kBz7V/idM=;
 b=U8FRjgz3lqeN4MvLQGlvS9PeTfUrTaCL9ireYXb961XCbHFoUp374X7vRd11VTn2sBWJigVNR/rati84PhF5CEcYQolWza1SgBW4/KYwYrTq33R45/uRERIun8UXwIzunqgazc+jDtuQEegD0TMd8/C/MJ9BW9PoTrrUdyEmJREPKvSye44juWbIF6wXxYGrcmmPHhwbjjxwcXzSCJRDgqWBjMcnS/+CJGd3xHfST6oyBXqz4UgHbQ5BTO8kTSv4FFV4GOpFtnfggpXYcLECwN5WqCpF3OWa0jQPe0QmoyUu3b090QRNgOtP02I0FjqjdZpKuh+xy+q+0MS/NifP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f+7rxWYSb2P/YzEBbzna3gdROwQbCM0r3kBz7V/idM=;
 b=e00guM4BCpAJGa6UxRoe5oKyzkcnrG9+M9dZ8BWBOyo4WrxagdBrLZnfeONpBDSPq/eDUnUIQvYoXIbyyOi7cpLnF6qH81WUj3XJJ0nZmDp/NpeNxbsq5EUw0MMVly6bQYqVYVM2jW8258CZgnUDaZsC2mb/90j4NBUBJCFyuZw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1149.namprd12.prod.outlook.com
 (2603:10b6:300:c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 11:41:05 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.018; Mon, 18 Oct
 2021 11:41:05 +0000
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Alex Elder
 <elder@linaro.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211013144308.2248978-1-arnd@kernel.org>
 <25ccdc75-67da-a955-b8ef-641a2f007d13@amd.com>
 <CAMuHMdWKp-v=df0JA_tr-YgNnyfu7NS9dA3Zr+bqwZX9JuBAGQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ad5d95ab-7cb5-aef7-9904-eda0befe8519@amd.com>
Date: Mon, 18 Oct 2021 13:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAMuHMdWKp-v=df0JA_tr-YgNnyfu7NS9dA3Zr+bqwZX9JuBAGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0273.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::13) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:c473:1c84:fac2:c272]
 (2a02:908:1252:fb60:c473:1c84:fac2:c272) by
 AS9PR06CA0273.eurprd06.prod.outlook.com (2603:10a6:20b:45a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 11:41:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc525342-9577-4ec3-c3c7-08d9922c2b1f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1149:
X-Microsoft-Antispam-PRVS: <MWHPR12MB11493E40A422DF907C4808AB83BC9@MWHPR12MB1149.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 70BZRU/ETFwZtajKu4e1IUioyKNajzmRE+/rax2uuE71mjqDtFB/EtDERPtCw29dUFhIT6ph+PLKwLz5qFQf0aI7648K9VxAL6IN6sCFSgVUFMSAHmO0GW2b/eiRUw16+lL1rt4RmFhy/lR3LXPx7phPQHTts172P+VWipHibuizOm9mulHPdm94YxgkXGDDeoG3OUatqkMATeV9mE0wC1Ycl3a5LrVy56kzkkOadaRWetyXtZrJ3uJx9lAaMujZ+hz95yynW0VraJJPYLd9MO4UJ/Bhfa926Z7u5vGICLNj0zafr+onr4M8+MmysKhoGw6TxLXZdvk4qSNmFHbl1BqTEr9hnmsR4kzLqIhqfNvJwkXBqrg2GVZZ7PYJR7SJljKgOB//FQ1qgQa84DQfsA23LqQrp4vLxpBzWjaWOcQsdXqpGbmv1qNvlJvWd0S6QqY1pfYAQFl/cB5xlCv4NGgHzlU/ok6QFt5aXBhL3y3ndWpdTerXSQDQdAwEzlKVNa/8zCuqqRuYu60NkzUsDK2Djx54Se/G6gROGMTHHr0s3j67kEsu4Re2ByD/PobfPCYIeHomGsPJCWikSeO5D/KikjxlXjeagRr4Zzt/bgEDmy3LMMAZzVSoedNypfbaD4CZM0sxTcCkc5pG5fTIP/oaEIo3toyZsRX8Mxu613x2j0gANePI21y1XdjAGkrHPtyEEQkU5Wl36Lq+4VqxcC0ufA3kIR5CgpXk5G8J+b0ydmBWvwBq/Ab8TDJS6GY3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6666004)(66946007)(86362001)(54906003)(31696002)(7416002)(5660300002)(2906002)(53546011)(6486002)(6916009)(38100700002)(4326008)(8936002)(66574015)(66476007)(2616005)(66556008)(316002)(508600001)(8676002)(36756003)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTV3MzRMVlJXSjZDNW1LZHNpOGh4Mm5ra1M5Zlp6MWlpSFJLUUdCei9EQlZp?=
 =?utf-8?B?WEoxTlFMY041bWtPQ0pEN3VYRXpod3RXemUwVE8zWEZjdDR5ZmU3dzdocUIr?=
 =?utf-8?B?THBGS0ZGMTBZb2hTdHlOOHYySGo2T3ViTmJJMXpOLzRJQzc1RGZ2UnVORk1j?=
 =?utf-8?B?cStHbk5vUjBHMmFXMVAzWXlIeDcvUGRTUHFXaGs0cDdybXN4SGo4QnV3SWJM?=
 =?utf-8?B?WHRIYmxNNk9WSzlVSzlESDZySEw0SHZxZjN3bnRMSXg2WE9HMnNLWEJPN1lw?=
 =?utf-8?B?WnNtOVBsbzdUQnBTT0RLNTFsNG1FbTc3QjRIYTRmYU1NQkt1UTRSSExLSG0z?=
 =?utf-8?B?akZOQUlycDN0ZUtLK1NHU25jYXJmMmMrS1NoOHhXUTdvejhjcmdFNER0eWhP?=
 =?utf-8?B?RTNsN0w1STY0ZUxkNW1MbWtvM0hpNlNLUFp4MWRHWjVPSEtvekpjN1FsekJ1?=
 =?utf-8?B?NlpGREYrZmJibDJjVHlybVUwSDBidkE2Q2V0aUx5Wjlpd3Y2NFZ0OXJ6eDNG?=
 =?utf-8?B?OHA3S216YWVraEg2WXJnaVBkN1poODR6MmlvUWplV3JMU0VEVXA2M1g5VC8x?=
 =?utf-8?B?b3lXbDRUTFM1OGNvMmw1Q1FjbFdkd3JoaFpkZFJqL1I2eFpJWm1lTmVxYUs4?=
 =?utf-8?B?TnlUZVVGQ3o1S2t0ZG0vQUN5YUFmenBnc3BveXE3aHI1TDdwbjcwamkxVFll?=
 =?utf-8?B?WUdkdFViMjZGNTkvQjIzRk44ZXlTSHNYWUZwZDVWUHlSYUovKzdRYTNxQTJG?=
 =?utf-8?B?OFkzbTMxOVNHZEx3KzBUTDRPVXYxZzJaekh2V1hrc0prcEw4S1YvTURNdjVo?=
 =?utf-8?B?ZDI4dUdBRzFZSVBlU2NWWHJObnRSOEV6YjZmN0MzOFZpNnhYQVNlNUswRmgr?=
 =?utf-8?B?Y3dBRGtKS0VHSjJwSSswOXFibmZndHp6b2d2MjQxS0dOWW9RSUdQdVhtalIy?=
 =?utf-8?B?am9CQittMDdqV3JjUVhRbUQ3K0tqOFlXdGN0SlhwZ2tKeFFHdDRxYTZvZW5U?=
 =?utf-8?B?UkNCS09zaWFRSkVvb3B6dEtxN2kzUEdGN2xJbXZsT2xJWXVGTTg2Z0gzNTFp?=
 =?utf-8?B?KzQ3Sng0VUh3S0V2WnllQ0k2eFJKWUIwa0psMmJCMWF0RnpTYzlKekZnN0x0?=
 =?utf-8?B?ZzdCVnpKU3FyamwyTjRsVXp3dGxSS0pUUEtJUVo5M2hNajZOOGYxK0R2YXdi?=
 =?utf-8?B?ZForQVlUM3BJelptaG0vNHZoQ1krY0VUNWhtYm5XazNWSFI0Z01sbTdlQXh1?=
 =?utf-8?B?bHNBZTlOTGJ6cU5ORmsvZ2xtUXZrdUVSbHllaWNsWU5Rb3FUbzJkSU1OWG91?=
 =?utf-8?B?bmdTSEdhbFowOWlFejlYWDY3TzNBV0VwQ3FEeEtJOGROR24zbENnSkxlVEZZ?=
 =?utf-8?B?ME1DbnlUdExWdWp3WDYyeTJsbW9DUCtRZ0tJMnprTzRjVG5Bci9YV2NYTlpW?=
 =?utf-8?B?MnkvUU9wMGFWa2hhQU1TdXBZT3UzeVR3dEtLeENnWENlNkZleTc1Q1RDSVFR?=
 =?utf-8?B?YTk3SU45bjJ6Z3QzWFBjOEFhSHhKRWl5Q3NoOUZXMFo1UnVWYmlHWUJkVDJZ?=
 =?utf-8?B?WWx1MURWNGZtTWVSRUxjcXg5alVlb1p4QnR3K2hBUDV0ajhkQmdqZWlKcU54?=
 =?utf-8?B?ZCt2dWx4dmJBRFFzNUduU2tSTlE2T080ZTBWZnd1ZmtiQjBHLzVYeTdSNXdJ?=
 =?utf-8?B?SWtYTDBTWm1yeEswamd1bmwzTVJjMkhnUGJ2anowZjBtTXVtdHRGd1ZpVno0?=
 =?utf-8?B?MWpUcExCTSt3SCtNYkJoY2ZKUEoyYjhORzJXVUU5SkhuTXV0ZWZvRmt4clJ0?=
 =?utf-8?B?Q25tY0RFUzJMNTFpRFlDYkpUZTdmZ3ByQk5jb1h2cWpkdzRCbjFmQmVtYmpZ?=
 =?utf-8?Q?9X7NIe5ANUdLj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc525342-9577-4ec3-c3c7-08d9922c2b1f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:41:05.1873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ek6gLXCSst9w0XAlyqpri4cP2bpIDgwN++FSrmzJrdTqlSaGu3LVPnldATxtQ4y3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1149
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

Am 18.10.21 um 13:38 schrieb Geert Uytterhoeven:
> Hi Christian,
>
> On Mon, Oct 18, 2021 at 1:37 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 13.10.21 um 16:42 schrieb Arnd Bergmann:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
>>> phy code is left out, which results in a link failure:
>>>
>>> ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined reference to `msm_hdmi_phy_8996_cfg'
>>>
>>> This was only exposed after it became possible to build
>>> test the driver without the clock interfaces.
>>>
>>> Make COMMON_CLK a hard dependency for compile testing,
>>> and simplify it a little based on that.
>>>
>>> Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
>>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>>> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> ---
>>>    drivers/gpu/drm/msm/Kconfig  | 2 +-
>>>    drivers/gpu/drm/msm/Makefile | 6 +++---
>>>    2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>>> index f5107b6ded7b..cb204912e0f4 100644
>>> --- a/drivers/gpu/drm/msm/Kconfig
>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>> @@ -4,8 +4,8 @@ config DRM_MSM
>>>        tristate "MSM DRM"
>>>        depends on DRM
>>>        depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>>> +     depends on COMMON_CLK
>>>        depends on IOMMU_SUPPORT
>> We also need a "depends on MMU" here because some automated test is now
>> trying to compile the driver on parisc as well.
>>
>> I have absolutely no idea how a platform can have IOMMU but no MMU
>> support but it indeed seems to be the case here.
> Huh?
>
> Parisc has config MMU def_bool y?

Then why vmap isn't available?

See the mail thread: [linux-next:master 3576/7806] 
drivers/gpu/drm/msm/msm_gem.c:624:20: error: implicit declaration of 
function 'vmap'

Thanks for taking a look into this,
Christian.

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

