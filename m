Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29F27B09FA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 18:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBF710E56B;
	Wed, 27 Sep 2023 16:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F229710E56B;
 Wed, 27 Sep 2023 16:25:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/TmBEeqowe7+jgDsVA94Tq2eal7nTUA+8GmdqQ96xUhBrQ2bV69PzUwb4diY6w2nj8bn5Jl/50RwBG9JEJv2YNdh8bhYUkISvGd1R0c59XQuGToxJ1+2pFWxdRXfRsGKTneNy2U1jYXyXD3YYNW5roSlrB8eQ0VniaJoHjQ6mPzGSsgapoWa9xjhK7FccfTZwOjqFhgPDYKNRwDuQai+9YkSljthXBipqar3JarNOJpvYlRlCAHlVuognRaFfurfmq3DrVg5D3nyJYlYfWFaU4jdDoM5UT9MjQnjaS/TH11+BBj8ldc8JtmNtgOvYAOjfLVKqhGAXcNx6SblY+wFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0Nsa7Qtnrga1lo7WbqdK7bjdH38PJWcNDAlO1V0ocU=;
 b=DxDfSfN8m34XmWqFCj7TeWdHJwsDWtbgI561yrb4DpioJ8msJIjP7GJwMWkM8t3aPX0VnsrYBuXtmu2E2W5pCImfdSPk8V4mRArla1bceQtw48VvP1d7ry09gTTklhnpkLEsXSKMlhiaOem32qMbEqGz7l0yna+9azVw3OvxtZopCE0/AyXvBH1I3/zq9lLLHISq9lMpNNmbMwNGewvYNScajTXPjiaGY7oqlq9zwLbCUjF5StRTuevzpmwIRYkppXhcm8mDLicRivf/n3x91u8A9ooHMXW7shaXoU4mbagW+pZ8Xm6H1vIPIyZX3jS1GLin996QreJtusUTKMikng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0Nsa7Qtnrga1lo7WbqdK7bjdH38PJWcNDAlO1V0ocU=;
 b=LW862p0ysd9+8IalCLozgAnGI3Hl0tGaYAjZNh9e4ae5pdoKBtu0ZW6PFQOiM8xmrjLFVAZgReKyI9hC5aupybSTfgT8QpOhTzRzIlAPBH9zer1hNKoifaluWmYKN8PnBl20A89NXXNUzc6LHC5nvKmdYjYHLcadHbnsm3vx4D8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by SJ0PR12MB7457.namprd12.prod.outlook.com (2603:10b6:a03:48d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Wed, 27 Sep
 2023 16:25:27 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::65a:db41:7713:c60f]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::65a:db41:7713:c60f%5]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 16:25:26 +0000
Message-ID: <c13cf5f2-d768-ffd2-96ed-b395d48dd7c0@amd.com>
Date: Wed, 27 Sep 2023 21:55:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/1] drm/amdkfd: Fix unaligned doorbell absolute offset
 for gfx8
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, shashank.sharma@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Felix.Kuehling@amd.com
References: <20230927161616.3335-1-Arvind.Yadav@amd.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <20230927161616.3335-1-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|SJ0PR12MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 75efb534-231d-4664-2e20-08dbbf765b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l244lEASqiLDB6tQlG+4MzjSYEiiVT0sxE5wjFcaFgfaudNUWoa9RmDPket/prvd9rF/sIU2yCIMINgmh6lqhpX5ACAb+ELsT1e0xf0pix42PWIP6dg2iwWJtjfYM5gIKzsovAJNYCSbwP/kJwj2EdP6s/1VNTJhuUOd2KP5uqPlKAkJ6lv/FNoRjohck1N2KPJfokxiOxcZkWh6j4vRk0wBKSPNPnMqBdPkntTF8oMZjQxfqdJZflZQfEGORIruxjEquVBbVsCdv1kbLtCh7VdJTFbq1KXOWef2Ko7uYUeuqWrhrex70Cbi0oQW5vEbKofX6+NfMweUgqmfYjBD+Nqo1qmcr0p+TZDoMZlXCNNCdyj/3tptIuSnd7Mfgavb7oRSUMyGrFAE+0SWp/ukgQJHn/NETUw4uB+GbOhIl7jQj+3jFKfghusi5+9jRSWKV4bHh2u3rAQwDcQNIxCf/WbBeOgDH7M6Za1C8dFdAayJJh2blSOjAdS0QYKTGhiD3TCQpaMSUtqj4UDG//jTNaxAOeF+6E4bKSqMACKOLe5hSyCz8ROVDTHCJlJbeqdfBGIdpTzW55+lYHD/8/MICyDzRtUSgkmuuSsOYCEC8e22+TncQOUra4erhG1bX4z0zkTXg8Kuh0H/jj5dzJ5lag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(1800799009)(451199024)(186009)(41300700001)(31686004)(66946007)(316002)(8676002)(4326008)(66556008)(66476007)(5660300002)(8936002)(6636002)(83380400001)(4744005)(38100700002)(2906002)(478600001)(6486002)(26005)(6666004)(6512007)(53546011)(2616005)(31696002)(6506007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHNPR2lKaSt0UFFoZkEzbDVVK1ZUNmNiYm8weGQ4T1BHcXdXSGxoZGg4RzVN?=
 =?utf-8?B?NlNIM2pvMTA1LysreUFNRXdianppbEY0V2YwWGJZT09od09uV2UxaDhxNC8w?=
 =?utf-8?B?K3B0RnBDaTlnUXpPTTZFc0psKzJZT0FNbGx6NXNxRHVBNHhUN3Q2dXBsY0gy?=
 =?utf-8?B?cjhKQU8zWHdtY3Y4ZktYakVVclZoekw5WE1YTkhmUmR4MjVMSThyU0tibnZ1?=
 =?utf-8?B?aFlWUDU1OXBNM2JmQ29xVDV1Nis4TEN1WVR2dGNpNjhyakJNOEFKWGdhN2Za?=
 =?utf-8?B?YzNVaHU4cGQrRC9WR3psc3RrOVVSK1gwM0RpSnpteW5mcFlmZU8vMzI1ZkFn?=
 =?utf-8?B?SkZDSVVoTnRNSUhuais3Wlg0NW55ZWN2VTBTR1R2R3k2YWgwMGlsYXMrSTZW?=
 =?utf-8?B?WjFlbngxVmFkclpwbzZGa3lSUytuVFZIUDA5cnRoOHR6aHdTZ0pzSk96S2Y5?=
 =?utf-8?B?eStsb2duS0dGcVY4Y1JsZ3hRbkdCZmZBRUJZdnFveC9OdmZuWWtETWRxUzJu?=
 =?utf-8?B?MzNjSDFjR21QbXNiUUgyaUY2YWM1Z0JoN2VidzNRQVREczBwVXR3SkNHbFJm?=
 =?utf-8?B?RUhHMmRhcXhoWXdxMjFvUndZR3RBVzBIUXlwNGNxaituWHN6dFllSmtIQlBn?=
 =?utf-8?B?R2U3VThVa2YyTmlLOGtibEVQR1FYTXVJcWU3TDJRcW10L2oyTGV6dlRkZzJm?=
 =?utf-8?B?MkduZnVhVlFNanhmQmRyZC9OMDBzUkpuWE1TTXMyN3JKOUVBc1IvSzNMbkhC?=
 =?utf-8?B?MnJPbXFxc3RLNld5TTY3a3BwbGU1dE8yZDRId3NmS1VqeXZLSy91R3NpMVJq?=
 =?utf-8?B?Vit3a1JGL1FaaWVnbW9XbkpkZGx2TXEzVytNeTF4bUdEZHp4V2NrWE1WRmxC?=
 =?utf-8?B?cTYxT2lvS2Z6dFh5YzBYMU5LbGNvaFNvUGViNVZoYVpXbXhyOTFpenA2amlU?=
 =?utf-8?B?ZlRlbmdOVWQwWnhyaFUzTVIwZmlyd0Q1NWo5bjAxYnBZQ2NsK0VrS3ZrNHF0?=
 =?utf-8?B?OVU5UXdOSFY3Q04wbjN4T2RXcUhUeVVpSEo1aFRYTllJeWt3V2Rtck5ZWjZv?=
 =?utf-8?B?emJTQlg3WDF3WW42MDFidzUwRmlCV1h6ZVFycldJcEVQSW9CN21SVHMzMjFw?=
 =?utf-8?B?NTlFWEZWVzl6RlI2ZGU0alBsMzNHQUJMWjhCL09NaStvZ0JsZUUxQlUvSEgr?=
 =?utf-8?B?cVZmNE5OUWNISllOTkxYY0crUlo2V3hjcDJqMGZXa1owQ3hya0VpU2IvY044?=
 =?utf-8?B?R2drc0FNTmxsaFRrSmF5ZVI1a29pUVRhdVNqMDQ2d0JFTjQybHI3M1hNa0R1?=
 =?utf-8?B?aEhXQmJtSjM4dHhPVXUyQTZPc1hjTGZkWVF5Q0QwZzdsWjRFb1RDaXI3SGtp?=
 =?utf-8?B?RHp2NzJwQU9tSkNpUmRFbVBNWXcra3hrY3RmbkxWLys0alNaZnBld1lLTzh6?=
 =?utf-8?B?cTZKL1RHNTRyN2dlQkYyRzhxL2VhbHo4RFQwaFVuMy9NTEJJRzg1aFhwUTd2?=
 =?utf-8?B?N2w5OXNoUWlFU0VTUlRrYWRLbGYxamFFM3E2aElXZXphVXlIQkhXeUIwbWNn?=
 =?utf-8?B?dllISS91bG1yQzB5SU1NTkw2bHNYZU5BbWxEMllKaExFQ011a2VWbkY2ekNq?=
 =?utf-8?B?dzRnRGIyOWpYYkErRGRzd3hvb3REUmJ3aWpFdUQxK0YwWFpZMm01OStBN1hp?=
 =?utf-8?B?QlpZS2RkMUU5eFpKS0J1TDJCdmcvWmlrNXZlMU1uNzFBdXJuZXlDckY1Ukt5?=
 =?utf-8?B?WTBFVEVDTFVXaVFBUmlkZjI1Z0JtQ1lSbkQzY3FWTnoydG5kSFVFV3JYY1pu?=
 =?utf-8?B?czdaWFBwc3pWcGdFWlZiRXVpdFQrTnVJR2tNN2NseVJzQWMrSnJXTnN6MU9Y?=
 =?utf-8?B?S2FHNytsN3ZiVTRYNzIzWTFkNUFJWWYrS0t1bXJtT25SSlk4TSsxY1R6V1Nr?=
 =?utf-8?B?MlhmMXhrWWduL29jWVFBUzMzaDZkeUNyeE1kSnVxbGg3YTNGNjdsWHVPdStB?=
 =?utf-8?B?Q1FuZlM0NnU4REQ2NU9yUU1GZVp5cnVHWkc5eCt4TnJmLzV4SUZrK2lVMEdT?=
 =?utf-8?B?R2JPRElPc2xxc1NzYUJ2Z1lSWjh6eGdUT0Y4S2JETWFDNEJCZVJCVmczbXFR?=
 =?utf-8?Q?ruOiSLEYey/6O7VEUAErMqz/s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75efb534-231d-4664-2e20-08dbbf765b82
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 16:25:26.9259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 056HHw8OGEmdaJWmVVRJDdwCoQT2zGpIfckn/nRtZQKnntYlGXbJGq1GXr3q0t5vmCDtXgMQQzoSL+Z6ZU8dLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7457
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding Felix.Kuehling@amd.com for review.

Thanks
~Arvind

On 9/27/2023 9:46 PM, Arvind Yadav wrote:
> On older chips, the absolute doorbell offset within
> the doorbell page is based on the queue ID.
> KFD is using queue ID and doorbell size to get an
> absolute doorbell offset in userspace.
>
> This patch is to adjust the absolute doorbell offset
> against the doorbell id considering the doorbell
> size of 32/64 bit.
>
> Arvind Yadav (1):
>    drm/amdkfd: Fix unaligned doorbell absolute offset for gfx8
>
>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
