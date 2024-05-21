Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3178CB2E4
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 19:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB36210E2A1;
	Tue, 21 May 2024 17:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sRyZkCfT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA5B10E1AC;
 Tue, 21 May 2024 17:28:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYxv2RmFvhawrElHKo9WJvN6cxcC1975KrS2Rb5J29r568bQujNh7mKRh22rPjp/bMkaQDI+ZjqT7jNK5+QGuFQlxIUAXwLn1A0VqSAhfyJ+aD66B6ZvcCuEifIZj8saGBN1RSRplEHVwyLgj4PTZqeHtdfz35+kmdnlQYnVyxUBSlfktLB9ItrjX/mj9nbT+Rb0MbJ6rV+FXThESk4wQwkq5aa2qY5oEA/6lnjEKXUixwlzgpQw4aV6p2taDue3RJbPCkRCg1dwOMzRTr54su6vQeTY0O9ObSKfCKUT8/deyWtKY9snpYYg5H6apTBMMsbFtUA9ZZ0k4429jZJSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDfdrjWj0SndygXIrux6RfAJzx+4wjGuGflhO0f5EJ0=;
 b=m5kMHkzras74NPPc0935Pl2doyCsoEvppXI5aGEdZYPzV9HUUCvN9FLLRkNPVzlUA81I+yBRKHCN9IYhLLy5IjBrb0XZsBS0nkaPLJ2QYco0sbrXNO7jeqisypVFJeFAKRYqPuWjOtS9F2JfrdFXatLnzN75pmNLFxIhRbnnnnNUeo2WC47L58WBMgIojJw/azZ/nBk4T3j71pKYnAWaXLfyZldKYwC0YtSSM/PA445oj52thIWkDthJZq/yT/XlD2cVHD+a/A1+k4bHmM9JlpZy0KLczQ6iqIV+lyB2j2Z1chwt/tbO5+TM9B4ku8kiCrs7DF64AlAlJzApA3GgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDfdrjWj0SndygXIrux6RfAJzx+4wjGuGflhO0f5EJ0=;
 b=sRyZkCfTFqRkmF3BerSfNyUeij8PqexvaNc4PSPW52Iyrt7zX8+yCKaNdbUz2+UaNHBWoIhlt2aNf1qACzpx8GGMT34sSU6yL2FiVMAazG7LuGLvLS+7ofjeTlvSZ+GkJIgZAEz7nx2kviUYyhBu3X84NextR/PAFmCwW8wIN0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 DM4PR12MB5794.namprd12.prod.outlook.com (2603:10b6:8:61::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.36; Tue, 21 May 2024 17:27:56 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::9846:7505:7b05:df62]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::9846:7505:7b05:df62%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 17:27:56 +0000
Message-ID: <55205499-293e-45cd-870c-1ccccd05145d@amd.com>
Date: Tue, 21 May 2024 13:27:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Panel Power Savings property
To: Mario Limonciello <mario.limonciello@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, amd-gfx@lists.freedesktop.org,
 Harry.Wentland@amd.com, dri-devel@lists.freedesktop.org,
 "seanpaul@google.com" <seanpaul@google.com>
References: <20240519130610.7773-1-mario.limonciello@amd.com>
 <-KAO9zJq5vTiesgtw-PMO0lDkSH1tuV271WNqlVuh3ZSkMzKWB9JQJce68-X-GwhD57QilHIBnLxN9k03I3-CMeYQm30NJMLizfyUUxTqHA=@emersion.fr>
 <e3a4331a-307e-4377-a349-8699024f8459@amd.com>
 <CAFZQkGyupsydjSEfv6OgMqPmHm9kMy4HQs7aNvzn77omSN+ZhQ@mail.gmail.com>
 <a35f2f5b-024f-42ed-9d59-48efcf4516a8@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <a35f2f5b-024f-42ed-9d59-48efcf4516a8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::26) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|DM4PR12MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be0b11f-e881-43c8-9027-08dc79bb5a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlhZV2tXUFdSaE1KVTd4RHNLb2t6Tm5VNGpjbXFFWVhKSjdoa1B2Z1pUbWQw?=
 =?utf-8?B?TENkMERkSGY5TkRQbTRQUkJidVlZWGMvc3U0aEFNcjBMbTdGVTZOTlNMeVhW?=
 =?utf-8?B?OTExSGZWazBsTDlZWG5vdFNUMWc0ZUxNRVNyMm95UEhkZXMzTS9UKzNobXVO?=
 =?utf-8?B?U3ZCanFCT3lYTFcxQ3ZlUGtmRVo5cGJuR1JiSDZJSXQra3BTZkw3OENPMVR2?=
 =?utf-8?B?YzVreGlJaldtM3h4WWJKSVFrTlhmeUFYS2hsaWhTT2NMSFl3K0FuNEN1bDFx?=
 =?utf-8?B?eUhubk9vd1RwZncydzV2TXEwaDlwWVNENnRqZW9rWnhXcnNZaFVpeTljc21M?=
 =?utf-8?B?SjN0NmtkSlZsUWtkTkFxbDZQMUlaRVBEaHZYWDJUOC91MUwxbHZUMkQ5dE1u?=
 =?utf-8?B?R1JMdTVsZytndW55MzdnaVFZYjhSUGwzekdvTy9ybjNhcXFnNHhDeGJuRlVU?=
 =?utf-8?B?UHI2Yk5IZmZIOElzVSsvaUl1TVNQU05kc2w2YXRqZnp1U3gxRGVtNEg2SVpt?=
 =?utf-8?B?YlJNRWh2LzgrVmxmYmQ2QzZIN1J1SE9MWGlvRGh2WnlpbzlJazJHY1FJUXI0?=
 =?utf-8?B?RlEzc3RUTHJheFNUSFVCNDVUQTJqU3hBcEJWY2toZXJIQlFyaUdnVUdLU0xi?=
 =?utf-8?B?REVtNmNDeldLVjNBRTlWTEpsdGxXaUU4WG4yV1ZtQW5COEJUTkMwcjBwYUlC?=
 =?utf-8?B?VlRjcUJKUGVXYyt3b08rYVFEVExySXkvcUVGeEVhdWRrOFU5Ym5qUlF4TUgz?=
 =?utf-8?B?WDdTWTkrSG5TYU80dnJSYnNGTTJoS1V1cHNNRXJ0TEpPL201SVQzVi9IMUFj?=
 =?utf-8?B?YzV0MGVubjdYc1lTS01rMEphblM5ajFmdlViM1lUQmQ3eHNMaHlYWm45Y2J1?=
 =?utf-8?B?NFFEWEpkM2k0OHNxT3JMdXNQU0U1SzBvRlExczkrVGtOZmNMWUpyUG5uOTQ0?=
 =?utf-8?B?QlNabkUyclA1VzJyRnd2VVdLeHpGMHpaZFI3MS9udlV6ZTBGODdWRG9hV0VB?=
 =?utf-8?B?V0NIOThrYm5jRGR3aU42T2RrakJ1SFhIL0lua0hSR1VybjlsRmpOc3dWTTQ1?=
 =?utf-8?B?K2p1Z09kKzU2aDRwR1d6VmhLeGpReEM2anFlZlE0WHk5Z0R2QURXWUZNdlJU?=
 =?utf-8?B?OVMwa083YUpGRDdjRURvMWE5cnptb2E4Y0tqdzNmY2xnNzliZkk0VzBMaGRY?=
 =?utf-8?B?cHY1L25UbUNvNlpiS3JxMlowMlNDbW9EN2xFRUcyQWhGNDg3MDVDNWR6WEhJ?=
 =?utf-8?B?dHZsd3NHdzdadDFKMitGdjV0TGJPdVVBYzBsVHZYb0pTMWk1WnRqVFhQMFBr?=
 =?utf-8?B?S3pqODhtQzhodFB1aGZPVjBLQWRtY2kyenJGTGtUQTA0MXEzZVpLZjZrM1N6?=
 =?utf-8?B?UWUydTB1ZFcwWDJPUGFKUGlkTkdZNW5HT2gxMXdLNVpieGpCVGF5U3JvWStJ?=
 =?utf-8?B?c1kvRWVDa2dMbHBKLzN4QXJ0RjNZbzJFYmk0cEltUTZlU2FnZHgrNjdFVWow?=
 =?utf-8?B?eWJpL1RNMWkwekd2THpvR1RpZzNyVjhRN1RoQ2k1WmtjU3E0cUc1aWZ5Y3g3?=
 =?utf-8?B?cEswUEtsTWFaSWJMbTJ4MFo2Ty9UY1N4c0NqSTZIYUJBYXNlbXp1UWhkaW9v?=
 =?utf-8?B?MUZvOWNWUitDd0NwaHoxTUNOdGZKbUs1bGMrTGx1ODVBWmlFcSswTWU3bnhW?=
 =?utf-8?B?a1BaZnVWMlBPcWRnRmw3cDJnY3JFckJoYWJLUk16RFVlMUhVY05mY2dRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVpZSEFIL1JMNEg0c2NlWVltOUpxUThoK05UNWRoWktEY0Qrdk4yZEl1bEh1?=
 =?utf-8?B?SVQvZDVzdjRiWFRIUHh1WUVhZy81NzdQZGd5eHd6VFFxV2Rka3VidGFKZVYv?=
 =?utf-8?B?ZkMrK2FyNElaRWJVeW5CcjFrdmNVZElZNjArR0UzTDd0RWE2YjV6dFd1eDdK?=
 =?utf-8?B?amZ1NmF1TWtxV3lyMGp0Y0JBZ3dxaXZVcTVGa3hXT2NjSVdVb0hvckd5ZDRJ?=
 =?utf-8?B?bkRQRlMzTDRzeDl3VlFlQnI5cWZLUFp0M2MzdXl5U1Yva3VMN2JkQW44YTFt?=
 =?utf-8?B?bkRKN01jdlMrbSttSDUxUlp5aHRoanhZRTY5eTh4QTFwSTJSanlMcEYzSTlQ?=
 =?utf-8?B?QXRsQ2ltWExVaFpSdmR1ZjBIcyt6NEdSUTRLM0NkUWJaQnRkU0Rmd3pOcTlJ?=
 =?utf-8?B?R2Q0dm5uSkhaWUJ6QVZva2crY0ZVOGlmVC9Wd2lUcFVuZGpYVUtRSTlTOW44?=
 =?utf-8?B?dFZwTDNqZWNYY1NOVElVL3hFK0d3YnM3QnU4cWk2NVNuVGxrZUxXeXRRYlNs?=
 =?utf-8?B?WlFOZHVpTWRyQXorMHNvNjRnT0RvajFsU2NxN1RiWjhIUUtOWFFiZ3BCYUVM?=
 =?utf-8?B?Q0V4dWgxYWJqMkFEVTlIaExjYk41WHZJTGxpSzI5dUFhc3YrT2NPeXRvaFR0?=
 =?utf-8?B?VWh0U25NTENxNUVrbnB3Rk03V1QzaHRRcjZBQm1DYkU5TGZzZnlKRFJYQWVo?=
 =?utf-8?B?RUxlN2drM29BQUZSOE9paE10RU9IOWY2SkhjaHljSXlQZnd2b0p0V0xPcHI2?=
 =?utf-8?B?WG5ZcWxyTk9LdmlKaHhoY2tITnVXaVNqUm43MlN2N1laOTNjWks0OWNlMmJX?=
 =?utf-8?B?c25hL1J4dWQvbE13VGhpRytCWCtxZkVkUjI2THRUYS80R3IrS0F2UlM3RHdu?=
 =?utf-8?B?UXdmOGZEZW9wUXlEV3gwZVpRSEVQT1p2WG9ZMDNURDIzVVgwTEt3UUtmUVA0?=
 =?utf-8?B?cFBGZkxlRVVtRjY4L2hXYkltTXVRaDNSVFdxeitGdEZGbDlTakRuVHE0eDFK?=
 =?utf-8?B?VGJSL3ZpTUk5WDVIeGF0MkVzajc5Z2YwMyswajF0Z3BTMXhJQW4xL1hlQUcx?=
 =?utf-8?B?aC85QVJpOWdOYXBzamlVUXVobG5POUluR0pheVNnSGszTXJ2UGRZTmZTdkhI?=
 =?utf-8?B?aDZtc01wZEJqSWZJdzgvbEwyellvQ0djclNiV2JhSk41b0NDOFRSdGQxdU1P?=
 =?utf-8?B?OEVaRXFVR2tXSzNLWXcwK1ROWCtGcDRMdlp2eC9CY25tSm9pdGxLV3dFMkRY?=
 =?utf-8?B?cGhLR01TU2dYMjlQbWFJd2d1U3VMWC9iMFZ2RVdKdmtsUDU0UFgyWXBURjkw?=
 =?utf-8?B?V0ZmWEh4SlIwQUtNYXhQNjFSanBxYkQ3d3lMOUliQWExMDhpYVc3ZUI0YUpo?=
 =?utf-8?B?Nys3K1pEbDlNc2xCbHV4cW1GUzhWZUlVUWcvclprL3FrOEl4TGxaVGxyM3NR?=
 =?utf-8?B?QlcyQ2wzK3k1Wkd4bkhNaU9rT1c5b0lORDFNYzNJaFhJN3pUdUx5QzlRNlJi?=
 =?utf-8?B?MTdlZHZYTmliRWJHSGxSODFlRlFJYVlJVzNDaktNNm5KdWVyY29ReGswNDAw?=
 =?utf-8?B?VEF4S29oczg5ZW16dkd3c3RTdWg4UkpmdVlRS1N2QlM3YTlVaU5mZW96b0Ja?=
 =?utf-8?B?SlR0OUJ5Q052V0l5L0pGUW85K0Z1Y1N1c255WGFxTU5PbElWaXVySVM0OXpi?=
 =?utf-8?B?cHo1Rll4WTg0R2NZZUdjVDl1SjlaWFQ2bjZPRUs2dXlvamtCMmt6VjJLYm55?=
 =?utf-8?B?NHl6NGdqMDVNM3hRd3l2bTAvMStKNkF5VEl0OWkrKzVTUVJOL2dlS3orb3hp?=
 =?utf-8?B?OXZkemMwR3dHRGRDTm84UTBTVXcyeS9yNkc3cXV4ZTlwVVNweCtXdHFFTmdy?=
 =?utf-8?B?eUFJSUY5dE9jSDdDTnNkbmxaUkhyaTlYQjFvVFlIckd3d0VZUjJxNVdXQXNX?=
 =?utf-8?B?TnpvVkRGdEdIaVRNNlFZcWFQdXFLRHYyNFFIRzV5dUZ5MjhqbmVOSkQyU0hB?=
 =?utf-8?B?UVl4amNDTklpR0lId0tyMmZmWFZCRVFUMUZkTUt2VUVFeTY1ekp2UE9lRUNI?=
 =?utf-8?B?VVVqcHQyZERJZFVHblg2Q2pBeHJzcU1Eb1NJWSs5dis3TStlZGVQMVJDNGVz?=
 =?utf-8?Q?lv0M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be0b11f-e881-43c8-9027-08dc79bb5a47
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 17:27:56.1705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMz/hSWUB2hJ+vi/rZlufKTUzuefXU8jea0UbfOqE4d28bbNzyw/SPI5fxVElwbz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5794
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



On 2024-05-21 12:21, Mario Limonciello wrote:
> On 5/21/2024 11:14, Xaver Hugl wrote:
>> Am Di., 21. Mai 2024 um 16:00 Uhr schrieb Mario Limonciello
>> <mario.limonciello@amd.com>:
>>>
>>> On 5/21/2024 08:43, Simon Ser wrote:
>>>> This makes sense to me in general. I like the fact that it's simple and
>>>> vendor-neutral.
>>>>
>>>> Do we want to hardcode "panel" in the name? Are we sure that this will
>>>> ever only apply to panels?
>>>>
>>>> Do we want to use a name which reflects the intent, rather than the
>>>> mechanism? In other words, something like "color fidelity" = "preferred"
>>>> maybe? (I don't know, just throwing ideas around.)
>>>
>>> In that vein, how about:
>>>
>>> "power saving policy"
>>> --> "power saving"
>>> --> "color fidelity"
>>
>> It's not just about colors though, is it? The compositor might want to
>> disable it to increase the backlight brightness in bright
>> environments, so "color fidelity" doesn't really sound right
> 
> Either of these better?
> 
> "power saving policy"
> --> "power saving"
> --> "accuracy"
> 
> "power saving policy"
> --> "allowed"
> --> "forbidden"
> 
> Or any other idea?

Another consideration in addition to accuracy is latency.

I suppose a compositor may want to disable features such as PSR for use-cases 
requiring low latency. Touch and stylus input are some examples.

I wonder if flags would work better than enums? A compositor can set something 
like `REQUIRE_ACCURACY & REQUIRE_LOW_LATENCY`, for example.

- Leo

> 
>>
>>>>
>>>> Would be nice to add documentation for the property in the "standard
>>>> connector properties" section.
>>>
>>> Ack.
>>>
> 
