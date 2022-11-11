Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA76259EA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 12:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855A110E0AC;
	Fri, 11 Nov 2022 11:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB0910E0AC;
 Fri, 11 Nov 2022 11:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4PJAeKUMdZLkLkLpav75txfM15swF3nC+hY34s22UBtv2HPLdQZlTLDI/WA3NL2WN0wFNPohA2qf2SF1mVX7LH0haAU5jtOACara/gg/YVWrVKyHEJ4By+DrV1TY6mPlsnitThfZ4uByINaZV+Ww+BkSc/V+o22Q4++hrK0zzuKz6Yeq8mNEuKKpTrPkEWAlX1iclajgASpXLPTKO05ZC5nzoaYkoTXD9kmnuQ4dx22tcCY5nXpn1uTB0LuVyXOGyBzO+UwzZJodSJR19ekAtWRdnvbQxcHTdMaQYUu9Jsv/B+XCYPPKx+ihdbn4YCCHCjYrw/xmIIpl4eAXLaSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpxmUgpxfK42BNijRIx00abU9v3g7X+iyfuDoOpTkTA=;
 b=DjQ0l1XUOSECJbyjudk8Wx5W+Rt4cYggBzYumWIubcGWrvQAcdoheSpeGerG4vth9xw1OygjWCJN8r8lboMzAu7d0uci8r1x9RGkETPyO77aSUnZ3tJnHtdFb4Dyph5ANh0Ym7FJx3l1AjaDBnqNgpaQrRV8Eymu6v0ZKUdlWK3s+6VemgrwUDiPFEXdtuf76BkEIVztUxIHWYYDmOLS3Ps7vjf/M+LJt2dXnL480cL/Hwrb+PJW7l8eoH/7RiHyZQdcAIyoPjn8qAZu8ttZ6hOA41xS/OebOHHjR2h8g/5IQ6TO0n7Ld0/89Bh9P8ox6FA00b69SDzEA5WQ/btFQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpxmUgpxfK42BNijRIx00abU9v3g7X+iyfuDoOpTkTA=;
 b=JjXl2giIZUbO4xHu2/IE0XwcINHqam1j5+OwVMkI6urkoqyVJWcz3O26qOOQkQQujj0os8scUzWPdSFNxUlpFUR7gkHrfLJHxJX4jvDsmDmqytKSd37aY37+x+/NHIXMSPMhdCHoOKvnzGEM9velJXl0UbCKXfBFjWntZ7478Ro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5920.namprd12.prod.outlook.com (2603:10b6:408:172::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 11:57:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 11:57:27 +0000
Message-ID: <22a00fd8-2489-d803-bea4-e624c355a984@amd.com>
Date: Fri, 11 Nov 2022 12:57:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_cs_pass1
Content-Language: en-US
To: Dong Chenchen <dongchenchen2@huawei.com>, airlied@gmail.com,
 daniel@ffwll.ch
References: <20221110143314.708434-1-dongchenchen2@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221110143314.708434-1-dongchenchen2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 4915db9c-72bf-4886-8000-08dac3dbe796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecR2GgbwuoC8QvqOEwsjCWd47Z1yrPL2gSeFGmMQjeJpNrV0kipUn7ibR3lU1iGr4kZlGkfBz/LU1qhnWhuEP0PTuQqCEcrjA3PvptfdX2tXiGqwEd8714rpCpMeMUfi5YXPJci6NcW+hucsDhJ/QWhodmX0LD9AI9KVp43N702dsjiY6RMRx71pjOoidRkaVwdmnLnF8k/TsuPUb088PkCFeQ179hlCqWS+NI5QV9zUjwevMJar8k14+L3FFUQM1O9MNanbE4t1a4OjGMPpxTipAyexTVxg1HZ7lwsTGnRzJimdTJsFErIwUkW0Td6zmbNkruMUMfQzM+9lGvkqXap9CkEN1RNHVYmDCDfPWZWrQNte1QDcDueda3SS3cz+gXIVEZ/ub4JpRqLzJKPU7AfuADhP4TYpWDOQzMqi2p0zD/S3qIdI0H7pnLrpL5tZFzISfFg9V2NTpsK9smecvM9MPoisvEJNFeoFdsQ2Qi0YKxHpbqLsRtlFxSjSIO3RVyXBLNCRCc0odqJdEt7DP7/fWuog8Q8H3TXspQH54vlVZcx/3p7uLR8FKVSGKR0KLI3bNbi4/gWgqzp5gE6xqHQtGVQoy9zyO+3ujsE/Ccjnn1IzAgaMbDpL/Ty+MfbdIhpnbAPn+LS3G7xnwVPTBnmWWi3rkvBYrqMy6zediA9wH2+Fh5MUy7AJluHBD04lCktfgEOToaut0koDWaDLpHeTqj7/E+1B1z+gg9NcrhNPYWw09oYODq19V1DGOkCO3x2mO5VFlAPxoP1l6t+E1SVcnlQ5Wwt3GAE2dtYDz58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199015)(36756003)(6512007)(31686004)(31696002)(38100700002)(5660300002)(2906002)(186003)(6506007)(83380400001)(2616005)(66946007)(41300700001)(8676002)(66556008)(4326008)(6666004)(8936002)(66476007)(6486002)(478600001)(316002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm9uUHBXaTBmZ3h5dFYyNkxCZTBMb01wWTUwQVdjcVZIYXV3QnFKa0Y0UGZq?=
 =?utf-8?B?REZpOHh2WFR6bHRjVkE5QWFLdkJqYkQwOTVFMC9ydVBCVm1oOUlJMGhURmNN?=
 =?utf-8?B?UjJ6RzlHNWxoNWhCczd2aHhERVk2a0VCNGF3VGNnU3VzTStiTzVHa1dXbzlX?=
 =?utf-8?B?d25KNFhoYXUzWWlnaTFmWGdRb3VxLzAwTGNQelJtS1pyK0xEVUVTTkRYTXJU?=
 =?utf-8?B?aVhxZ3NPdHBueHk5K0pEaXF4RkJxQUNOK1FFMGRKOXVoaTNxMlpDcEl2RzVn?=
 =?utf-8?B?c3lyczhGcXlqdFh0NnZPbUFWT3lKUC9ZU2E0QUk4akxnRmRVaXNJMkUvTXJi?=
 =?utf-8?B?RUZFSG1zQUlPQUVRUEJQU0M4WjRRUnM2ckdFL0RyM2VNNFNHL3QxMXBQWjha?=
 =?utf-8?B?ZnBOUDN5eGtmTWRKQXBPOUo5dEdYem9ac01icUxiaEJSTk5sVEJCTUtzb0p6?=
 =?utf-8?B?aXZaOUNHZ2dZYlFzTjQwbXJkeVRJNXBSK1FqNmJzdlQxaENvcm0rMFNMMjdS?=
 =?utf-8?B?Y216NjhIcGFzNmRQVmY5RjdYS3ZMZnk4czNDcUNFNUZsekN3V0grKzFYY0Ni?=
 =?utf-8?B?SEVDQ0h2VlF1cnoxTFQxNkZOZ0JHTDlseEx6WFgwUWdEcnE3LzBteWJUS0RQ?=
 =?utf-8?B?enQ0SEhZKzFuN2xpOVA4MmRuK1hRM0VTWFJDQXIxd1R3OFEwZmRrR01vSVVV?=
 =?utf-8?B?R3Q3ZFhxZmZ6aS9yUEMzeGZZOCtCalpUczlJbUpSWXBWbDlQdTczSmo5YmNy?=
 =?utf-8?B?YXdiWmgzSUF6NytPM0RDZVBjeFV3R3V3WTFoMGs1N1RIenEyQUNLMzB1NEZa?=
 =?utf-8?B?dGNHS0I2b3RCM3IxOHBsZ0t3NWJVcmQ3QUhpNmh2aEd1WkNjazVzWFpMcExD?=
 =?utf-8?B?R29oRElHd2lBSThLMkh0azJ4T2FxRHI1OWhPMUFUU3IxdXp3a0xkaU13Q2ti?=
 =?utf-8?B?djJQaXVJeThMNVlhZEpHL01FL2pERzE5dXh5cHExbVdESWEvbmxyOHYxS0Zp?=
 =?utf-8?B?S2FXZVVRbFY0eGwwd3JLWFV4SUFPVXJjbUhTeEJjTXM4WmRsUEgvNERZOW80?=
 =?utf-8?B?Y2hGMTl6OFVKSGlwT3FsZzVJR0ZTYmhXMktFbEFYRml4R2F0bUc4WDErUDFX?=
 =?utf-8?B?dS9CdUtpYzF4VndBYS9HenhGZnEza0dmSmJUKytjdktuSlo3N0NVRUZFbWlj?=
 =?utf-8?B?cUxPaTlkcUxkcTUwazlBU201Q2VIWkRxbkRFWWRDMmhaazVjNzhFWHBuc1RE?=
 =?utf-8?B?Vi95SkloNHBNallhVTdRWExOb2JPTDhoUkI0L2RhTndtUzZWRG5Xd3FjRTRX?=
 =?utf-8?B?WDkrNVJLQTl0dFdRbHR0UTZNZDNDTVVweXZZM2RxZEM0OVNzYmlCbFF1Mys0?=
 =?utf-8?B?ZmlTazdTbE52NXVoSUVNd0Q3a1ZNaDM0TG9kaWZ3cDBDb051TnVWTzJUZ3VG?=
 =?utf-8?B?ZjFjNGxwY3JuZFZDUUxiM0srWlNhd0V1RUk5ejdHaHoxVDRidWhDM0JGTy9o?=
 =?utf-8?B?WE1yK1RuaFJnckFGSTRrZml4Q2ZweVVDYnFTbTJuRUpvcXIzTG9VZ2dicG1I?=
 =?utf-8?B?WHpwU1RZYWpvN293MXJST3ZPR3lTYjJFc2FObXVLR3lPQXQyR3NjbjBuaEU4?=
 =?utf-8?B?N0gzd0VQeG8wbTlEOE9QWENTRlBXM004TWQxd3JQSjBBUVlqTlJXbUt0bk4w?=
 =?utf-8?B?cHdkbmduU29qdk0yTmxJT2RjSllWRFg0K2NnOVZwMWlpRFNLbUJYMjN0aGJZ?=
 =?utf-8?B?UEUrMUFPMklrSGNmRVp1Q2Y4ODVFVWR1MzUvSkFYM3BxNVFBRDc5UnVhclN5?=
 =?utf-8?B?MWZsOExaQjFwSFJHQWVkNXZNcURUMXplZmtNRDVqVVB3VlFSNnV2bkdkRHlX?=
 =?utf-8?B?R1N6UnR1V3pnZDViSWcwUGlNemlkRGwzY1dEbTVMd0NibVgrUXJwWDAzckdx?=
 =?utf-8?B?d0FYczNkbXFkWUZYa3JkSGp5YjNBMk04dFpPMjVVNGZKVDFhVDhYUkJWclU1?=
 =?utf-8?B?MnVvMDVTM2h0ak1oTk42bDV4U3NBVVBaUTVheWVjbHoyajFTWGNPSkZRS1pZ?=
 =?utf-8?B?TC9XdnJnZDl5QjA2b2pFa3Vrb2N2Z1VkODI2aG5IL3NlS1lBUHVIM0N2cWZ3?=
 =?utf-8?B?VmZiSS9oRTF6YlBLdk9iUGw3WVZIeXg4MGs1cUJrck9wQ2lKWUJWa1dTOEdy?=
 =?utf-8?Q?HZqd4os17wkd9NoRA9jLRZ+/MlyWqFyHFezzUZ+5zPou?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4915db9c-72bf-4886-8000-08dac3dbe796
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 11:57:27.8563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +p5pecM9XUALHVHu/zoJBCsVfRNaqSxcVizvXZbPZKhCTw8GIJV9Lvyz4OgyMAxw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5920
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
Cc: Xinhui.Pan@amd.com, yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.11.22 um 15:33 schrieb Dong Chenchen:
> When p->gang_size equals 0, amdgpu_cs_pass1() will return directly
> without freeing chunk_array, which will cause a memory leak issue,
> this patch fixes it.
>
> Fixes: 4624459c84d7 ("drm/amdgpu: add gang submit frontend v6")
> Signed-off-by: Dong Chenchen <dongchenchen2@huawei.com>

Good catch, thanks. Patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 1bbd39b3b0fc..0e24d6b80e0b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -287,8 +287,10 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>   		}
>   	}
>   
> -	if (!p->gang_size)
> -		return -EINVAL;
> +	if (!p->gang_size) {
> +		ret = -EINVAL;
> +		goto free_partial_kdata;
> +	}
>   
>   	for (i = 0; i < p->gang_size; ++i) {
>   		ret = amdgpu_job_alloc(p->adev, num_ibs[i], &p->jobs[i], vm);

