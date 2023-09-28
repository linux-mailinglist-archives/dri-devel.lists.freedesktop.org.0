Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D37B204F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A7310E027;
	Thu, 28 Sep 2023 15:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BC710E027
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 15:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kK7Zawv1ipMiKBVVfmupOJ/JX9ymriPasqnQvNk9NujGEfBAltcgICUXXAt8xSngzojA1vEMjqLd54pGPSnwa8Kd6ucc/H4MPHkTISppmmf7Zy2qzqslpiz4cdy7FHmdxeMOibODyUtajIrJ0pLtyWf18Ml10IaWzrWtg/iR9EfWQV9iRLZvAP9oXdRQF8VUu3I2pwhJhyBRZMI4fm6+PcxozNhCcc6czpuGpL718umfIGCo4qn0ZdIQzO8EbpBkacKGO9ppKwhtlyhaoG+qH555ZUSudaS7crad9vlfhMu+yXRV/3Jq1hJjQTV+ZuIao3m45fO84jbS+KOrpreR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpinXQFGzyuggZcpx8Pu/c7dNNId5trbwLhIAm8qn+4=;
 b=Di6Eo0uVDNYvjFkUQLTJUAE1F5P50x+39ExKpu8JOV/NliPTjp+Z7y1xr7JZHFmaj5i2VuT+WucJGYpushM/3dOtEc9K50DWwk1KcvJ47PSCSTsVzQP8Ydo/BXtX5Xx0zyH8CTVrt/AQZfoxwuIojSlFemBImsJPAP4pnDHMvNyQAOYjVqfw+xoXEWw+3WrjPLSrZhZjt8eXC77nyFbHuLLATUb99MSxdBu+wC94TYYFpn9YcaGuQOIYtqo9yHx1TLpN5GzplgktVgh2JesUqhQqLOiV8JtzXX2N0zZI2Gf+nfrlkDK2fRaZ2NAsJ4IO99sfGXMDnKcXaIOeVRsnjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpinXQFGzyuggZcpx8Pu/c7dNNId5trbwLhIAm8qn+4=;
 b=pzO2HKroqaGGsoYCxeAQVCMNHH1KD4MPqVgbHm7iCnHHgmEqu9G2RqdOSULU10hmSZpQE9/D4ROPDwe/60XM4WhYUbhMr+Zz6HGPh+D81hSu/V33LJAGW23rzR1W+qnVyTeX8FKRdeuId/DrowKbueWzA/YgE4jq8ee6KspnCYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Thu, 28 Sep
 2023 15:02:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 15:02:39 +0000
Message-ID: <2553d189-f9ea-6fe5-33af-23389a87c163@amd.com>
Date: Thu, 28 Sep 2023 17:02:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Ray Strode <halfline@gmail.com>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
 <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
 <CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com>
 <e0d0e283-fab3-b023-ecdc-89e5cc913da3@amd.com>
 <d7e3fd7c-410e-46a3-a663-d7f6a41d1a53@mailbox.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <d7e3fd7c-410e-46a3-a663-d7f6a41d1a53@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4044:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9e5161-f8e8-4c01-4317-08dbc033f549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00HCthkvCre6qkpAewnBfWGweBaFLUWQXUhQjcVD5W1q7Uyv7cMcXrUnGDaEzwfdwM6B7l3wavBAmfS77GhUV+l0PuQ/BIQyAJLCAvsusxYKCuj06KtuWPwEvy+LnLHo2K0eR0BpAgtCPdXMUGlNwQwcsuznv+xW1lB9Hu4l3YcD8IcXw4TRXqQU6NR/mctUXubYyPgUF0g1NSKu71FxSinlhLZZb9rNKOrhpYGGQqcOkA+Z7BS19GLucLzYkjHbDN/LyZ12M8qsoM8fh6TtdX9v18nhTECM/VG98V696BcrXE0/CFHzfWOcLdOLbNfum1GklgFSPT1GqpEhXg8NkXOia8ykJg87ERglijWIKfvOUpnlKhVL00UyDaWD5sc16m1h26JJ3fuGmoI6ECG56a6ZLbM96jB6QvxCpgM+92Dt69vmbpeFQGFuT26aEvAzI+Ul4WoryVyQgU+RAWtMwhPQP1WGIavBfFUEQBKK+1E9m0cBhXxyUkYSG5GeLzpKUFHKOEKA2d8QjKgTeh2OtZIpsGqiXbfhLx2qfimr5FH0N4QoOoo9lkCFdFuKPyFG3XC3/PuKat5K3iSdj3QxydQu2A+/tSZdP3FgYWtlKEFIyd8zxJQusVXC4Ub8gSjn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(31686004)(2906002)(4744005)(4326008)(8676002)(41300700001)(5660300002)(8936002)(966005)(478600001)(6666004)(6486002)(6506007)(6512007)(53546011)(26005)(2616005)(66899024)(83380400001)(110136005)(66476007)(66556008)(66946007)(6636002)(316002)(38100700002)(86362001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEJESnBDNnIrUGNHaHQxS0dtYTAzWExMeWRvTkZxRSt3MjBMa2JnQndzZDhl?=
 =?utf-8?B?aFdyYjM0S1Z3UGFOai9QUTB6N0c0bkRMZzl1emQwTkREVWVWeEl0K2dOWTI1?=
 =?utf-8?B?cUlFaGlTWmVvYllXV05RTkQ5KzlBbWQzczU3YXh5ZTdBdGtHdndwMnZFRXQ2?=
 =?utf-8?B?WDVWRWoxQUExbnBuaVMxcWNJYjA1Z2pyYzUwR1p6RnhjSWlhUnhMYUcyUW9N?=
 =?utf-8?B?RUJOV282V2U3QzBWUVVPZFU4TkhtK1RpbkxJckRrR2FZQlNqbUFwa05YcHBh?=
 =?utf-8?B?ZzdCcUVDWFFoNnlIVEV2bm9tRGVYeEV3eUM3VlRFb3pocGhHV1Q5cFU3SVdN?=
 =?utf-8?B?V1Y4U2gxUTJnbzUzM05rMUhTL25PbWRkcURmUUxwcE5ieEZKVENoWGs3UzRj?=
 =?utf-8?B?LzU3dnVJb0ZNS3hqU1RRcGRBWEtHdDA2WnJra0tsTCtHN1JCeUhjZ2hseWVy?=
 =?utf-8?B?K2cyUk5UY01xZm05RVJ2b01MTXVzbTFNYzdZcmdGS1lUWTY2N2piMTlvWUV4?=
 =?utf-8?B?Vmw4WmFQODNuMlZYZm4yZlhIa20xWHpONEpSNXAyN2l3WmZFaXV3ZjJFR1VY?=
 =?utf-8?B?TStjM3pHaTk3d0V0RmdCbWdlcllUbnlucm5nV01KQ1k5MjhkQU5HbXJsS0hH?=
 =?utf-8?B?aVVzVFdWZG1sOWxUNVprMmIwcWlneHkwUkliR0dtQ2EvUTR3NDBJdDVzdWJ4?=
 =?utf-8?B?MUdHQnhFRnkzMVR0ZmNSclBhdkhZbFdQeldNbi93TVkxUzdBcEZ2c1dUdnIz?=
 =?utf-8?B?Y0NBV0pNV3ExUUxXQkluRzdxWlJ5YmdNZGhTQTE2SGorNS80eVpmWlIrV0Ny?=
 =?utf-8?B?YUw1MHJnVitGOFVOc3lZU1I1U0RyTnpWQTljYitrelJlclVia2UwR3BQckFh?=
 =?utf-8?B?RFR3MWZjL3hPemcwTmhGR0tKUDZxRm5TZ1dDdDFOL3pmdTBRNkpCeUNSRG1m?=
 =?utf-8?B?bkRiNjhDYURORGJrbWF3YUNVem5ham5uYXhZVXFJRjVISEJ6TjdibHQ4eEQ3?=
 =?utf-8?B?NHZiOUI3SkN4ejg5QTV1MXVEMU9rb3JKTUtpek1FMlkvSDNKamdjd1pkRzdx?=
 =?utf-8?B?RlN0TGNlU3JMWnJUNk9xSGV0VWVKMkxSTmxHM2NrZ090UDQ5dktGV1NlUlNM?=
 =?utf-8?B?RzhBYThhTHRoSHlUWklKV3dCRGR5dHlHbzRjV3ltS3c1dmM4bkk1a2hpc3g5?=
 =?utf-8?B?UGROQ0RwMGxpSytuMjRWMkxvUGM3S3MzUkd0cFhmZ1UxeEdKR0ZzSUhDdkwr?=
 =?utf-8?B?NGZPU1huU20xdVJ2LzcvcEo2MitMa3I0N0RnV1RiTC8rQzF6bFpOZFlNT2xa?=
 =?utf-8?B?bmoyZzdmMlIzd1JxYkhBcGJhdnJNS09ONDhBU3pWYUtFU0NYQkwvbjFXdzN6?=
 =?utf-8?B?d0VnSlFYc3djbG1nazZRZlJDVU5VK3VPaStpN1BJWWZpSm5vNmNGUWQxVEJP?=
 =?utf-8?B?WG9Ld0I2S0JCYnNmMkZHNyszWTZiT3JxRlJNajQrT2kxWjdaeWZrZ0gzQk5O?=
 =?utf-8?B?cU9MWFc2OEZzQys1MVhqY3ZDaTA2VmFLb3V5bVplK3lIbEJDWk5tTm5VR0tJ?=
 =?utf-8?B?QTRWNGVpczExdGYyQTZDQzhENkRBSFRYR0N1dzVqVjMxbXVNWldyZkowOTd5?=
 =?utf-8?B?MXkxNnRCL2diVkpBTlliYW1RSTRsZEJ3dE9MNWh6NkZJRERUcGJkbCtUaTlG?=
 =?utf-8?B?RUgwdHRMZUc0VjdwVm5UdkFPVVROTWZYbTVyUzl1am9kOEttNDQ1YkprZFl4?=
 =?utf-8?B?eWZ4TUhLMzkzQ3NuZnVYcUkydFEvTHEvUzVvTEYwSzdBTEpkOS9rUGVmVmh4?=
 =?utf-8?B?a0Zxb2lrUit1TWkyTmZTN1BCNEV5WlZQV2w5OUFiYUhqejYrd1dQYktnN2pI?=
 =?utf-8?B?eUZyWTZXeTN0UGI0MlZ4R0hzbWV6aE5TbDhTOXluc0JyekRLeXJUY253UVZm?=
 =?utf-8?B?UXNjRVQ5cExzWUdDWHRHanY2UWNYTmMrTEkwRTBVUzA4ZnhVQ1c5eFZ3cTlz?=
 =?utf-8?B?Sm5zeXNTUFJjV1d4cXMwQW9zMXF1THorbVRJaTdUU3NNak5sT3lDRmh1SVJq?=
 =?utf-8?B?Y1V6RjI4S2oyUVFKeE45ZmN3ZVl3Slpyd2pJN2pRK1B3OTBzdnNuWkdpbUxP?=
 =?utf-8?Q?tQQwbedXJmd5TY7hdb7TYWXjD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9e5161-f8e8-4c01-4317-08dbc033f549
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 15:02:39.6366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vrnn9th3HlF86aO2AswbjyfBDNYouhO22zVfpdLiIcXZMBzr6gfGrtDom0hbBqb8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.09.23 um 15:58 schrieb Michel Dänzer:
> On 9/28/23 15:23, Christian König wrote:
>> What you need to do here is to report those problems to the driver teams and not try to hide them this way.
> See the linked issue: https://gitlab.freedesktop.org/drm/amd/-/issues/2861 (BTW, the original reporter of that issue isn't hitting it with DPMS off but just starting a game, so there seem to be at least two separate causes of exceeding 200ms for an atomic commit in DC)
>
> It's not like GitLab issues get much if any attention by DC developers though... So Ray tried to come up with some kind of solution.

I haven't seen this bug either for the simple reason that it wasn't 
assigned to anybody. Going to grab it and forward it to the DC guys.

That makes the reasoning understandable, but we should still absolutely 
not paper over problems like suggested with this patch.

Thanks,
Christian.
