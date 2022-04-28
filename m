Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4405139F0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 18:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9D610E85D;
	Thu, 28 Apr 2022 16:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF13610E881
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 16:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nc/38n1+IkRPKlk+awlt//KoF/gHWn+gWQp0Ol/4PO6Y9D/Bh8byrYEVfJD3t4SOUnm3yCtewH/RR+WTdjsTcQIKzELbMNcWdtzCqTCctqLWTP5gg3lvtvR029P2XJfOa1axzvs0rfjtbtebd2YOajxSJfafPAh2H8BKKyGu9uoUD9yH/KUg1iZSSVv59oEmH6wPXbRJshY/xYIQ52MTvAjkuFqSRWlZYEThkyis+XQKxEHn1d7bLIE/eMKtaUKFRQyvxWmrr6Yqmf12cdpvFAyyU1E+rwOqqWl4hhtuRKBVsWuflPq0XqfzePn+LqtLXNTFchXHZ3LjGSsDf35wpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xU8B9Rbv5PhUbwBAyRWoRIc9U0Yf5WF+BNzFurmDmI=;
 b=NjCdbqynoTQNwE7bB+TyaV6Fu2R1Ey7WWYenmGgItFWnUfvKNZ0SwXpo8uw7RN1Fu9bkxyAOqQDAcF0zHYKECKcjwG/CoF+ct9hVzXe1afy8R+x6ggdtXB6OuhhN+/z9CmCg93JEsbie1dtBVJJP0x4epGhYb5fMp3usi4/1TQ+Jdw4Pdy/lcsRewRgns4d91oTAp9Nfq5fsGmpQRa5Af6UaGmSxxHQ5+IlQ0g9Irz+ifYeWhAdKCt9xhkceyBjuMPfzffY2hU4SQNPXAGJPC91FcYQpR0iRjJ0Oxx4tyWbcAzbwGKUZJJbmMlrf9KpZLylKptL5UKQhSNaqFbZTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xU8B9Rbv5PhUbwBAyRWoRIc9U0Yf5WF+BNzFurmDmI=;
 b=dn00QErDwggI2X4MhdkNj93AbwqyWPyoT/3RjMGTkbVn3ZTquLDiuC17++sQg9ETwnV/8OppoBXHHfTMGo7k1MQGb+xszcVv/E4rnHRcMJRjy6q5drZc6jcVlEAZ3tYnnBN4EAKkj/+1ckYxFvpPoPBpOzi+1jm6ZAXpdMvK8L2D1UUTgST2i4FruQrqGxXJMFIjnh+TwhLn7DnOEQWmsDKYKAEOU1u5yM2xUTwUOauUVTh06u2jfAaZvazvl/4S052BmNewcTThYT3aJAL1QCvh71YQM/y56jQoRVlo/HV0xLzQIQGtSvo3mvGC/jCxWcL3eBfSqOS4Hb+YMKm4ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB2777.namprd12.prod.outlook.com (2603:10b6:5:51::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.18; Thu, 28 Apr 2022 16:36:03 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::a4b2:cd18:51b1:57e0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::a4b2:cd18:51b1:57e0%5]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 16:36:03 +0000
Message-ID: <aa55c03c-6d22-9718-a2a5-28d9ce114954@nvidia.com>
Date: Thu, 28 Apr 2022 17:35:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/4] drm/nvdla: Add driver support for NVDLA
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <YmqgailZKIuY7zTZ@orome> <beacfd71-ebd0-7fde-187f-34b7a42a47de@kapsi.fi>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <beacfd71-ebd0-7fde-187f-34b7a42a47de@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c0507a8-f328-4627-b834-08da29352f54
X-MS-TrafficTypeDiagnostic: DM6PR12MB2777:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB27779A2434F9382D2A0B8F58D9FD9@DM6PR12MB2777.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4l4DiKlnU8tEJpUMNwjjdG2EoO5YIGoJ/R5WfERGKu3bLey7YKSzU85TVl2YMMVDzLTjZDs6gNsBzQYpfuZHt9687PXch/zHrPzR0PrLhldqrxwnxlzhEK52PFh6dnZsRtu5gzlEE9RZ5iOo1yH+p2aglttyKAklrWaIoNFo11+1toeTGtwPQij9WFwgN/xy5x9zobqEiKxh0mPFO5k5C+ZAmMQP45vCBw0krXG6fEdyXoSV53KBR8ZLUDW7xYCrQGn0/CdF1JT5pB4OXkMYIXJ7AhNIdpiy/W1Zbl8eh4NWJuW50B0EQEj7pu8fcw48McbnjxV4qfkstFgMqVhZjcXU68DWcd0vIJGUJMizNU6b9BUmI1cH9L9HZNFBwlVv543jWWLGAeglAabLaS7xpQCrO3nQEb8FURal6OW7aO+AA0ZcCSNyNRTojwKfDkyz4AXUjLEAH7vAjrKMT7ukJuyazqgcw1UYEuUwLO2wRwGC2cGEB38QarcDjZ99556phE3fa59MzmthivXLu6ZcjKRYb32QwIBnBh8J2gBYi3O0/X/MTQ9S5O68fCDo4KF5QOwC9enjvuAezD00dFDFJVAzKYG/w1SHvTeFp6e3CXZODMr6EfNBwzhRfdOcAwRYT0UjijuVDAwoKZngSe6ABr/5zzBC2+OB5bXRPg6vZmOzxyXTYTiKj+JZog/ehI2xXpsotKrV2LOrcKdPBWU8fJogy4eJD10YFJxnGfvXdjpVjC6Yq4vOezshsoEnn6RQ1ozoOPiGR96pNpbG0tP6I6oJrTElJ4Uc/yi7+5tkTxwFQKIAWpU94eHOt1Pztrbx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(110136005)(38100700002)(316002)(31686004)(2616005)(5660300002)(8936002)(186003)(7416002)(36756003)(6666004)(54906003)(2906002)(66556008)(26005)(86362001)(31696002)(6512007)(6486002)(53546011)(55236004)(66946007)(83380400001)(4326008)(8676002)(66476007)(508600001)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0xMN295RE5kbFEwV3JpVlI1RFBMUm4vOXNjeXpLL0J5alYvemYydW1NOHJP?=
 =?utf-8?B?RVdpMHpDUDJvRXBPYld5SXk4MFBEeFZFR1VKNDZTODhhN09iOTMrYjJKVnk5?=
 =?utf-8?B?OXdQK3F6L2NCeEpRK2RiTzZsTDhzZnp0ZGR3NGJxSjBvMTl0UU9pd1lpbmhq?=
 =?utf-8?B?eXU5ZEo3TVBqbWMwamZlWk5BbjlQa1p3RENxcDdxdWVBQlY0OWtTZGxhVDg3?=
 =?utf-8?B?YVlLdzZOSVNuY2d6VWhCQnhrWmwvbHZHWVczY2lBTlFadytPdTVCNlYzVmla?=
 =?utf-8?B?WTRNWVI0SFBCREk3bEpsNkxUWkhGeGZkVE8rLzI4WUVKOHJPZUw2SFhKNGVX?=
 =?utf-8?B?QlZjNDhQMWR4YUxNNzRjVDBwUHJuRFdKOHBPMXp6MS9wSCtEdngxemtiY3kz?=
 =?utf-8?B?K3FnYk9OaWxuTkppb2VTV0F6NitmWGxuYndOS1Yxc2tvYzVhVlRMWmI1UmZV?=
 =?utf-8?B?KzRBRithVnhIMjF4UlVJRlhjNzZ4WFYyWDBrTEtTN2hKSEo1RHErbmhydWVT?=
 =?utf-8?B?VCttZldMSlVCTGYxWlp1ZU0ycVBQeUNmMTExam5GWHowSUllakRXRkx4Z1Er?=
 =?utf-8?B?MUtna1hwNk9PL2VUMFpaOS9qVUx6b1pQcEdnNkhTNitFeTlWZGt6VUZaS3p5?=
 =?utf-8?B?ZUdPWXBuRksvd1ZoT2xjWVFsOVZRbVQ1TG5icjdheEo3Y25ZQTdveVRTaWNS?=
 =?utf-8?B?ZEMydXRWbU5LV1VYYU41dm9ZWVBEVnpMYWtxNWJveHBzcVZpeURJWnVWM3JT?=
 =?utf-8?B?SjRYN3Q1UWlLVXhGVnVFcUx0VktIWG5Ib3AvWTlJaE9acFFPUWpTbnhlNEg0?=
 =?utf-8?B?NDhobVR0VEVtNVZRZER2WE1MSFNrUWdiQVdvcGZMZmg0N2VKNjdGaGZzRXY4?=
 =?utf-8?B?NGtPd1doZ1RGanZweURGUkpUWDMzNE5vUGVoenUrWDVMOXBxN2w0OXdhczdY?=
 =?utf-8?B?c21mWFpJMm00bzNsNVdhRytOOHVUOFI5bGs0NGNwRlc1ajViTlgyL2FsWmk5?=
 =?utf-8?B?TlkvTHBmOC8zOHplbCt1SW9Na291ekNLSXFPQ2tYVGNvWlg0aVB5bTlWeGhV?=
 =?utf-8?B?RGNlcDlJN0pRQzNCVis1SnFVSVd1Y3hlRjZtdlBra3JDUzN0M2RBOE14b1ZN?=
 =?utf-8?B?WmVQekRxc1NGOGRUb3RqVTF3QXZHZndycE9jdWxOaHM5VDlwR0laUzdxalNq?=
 =?utf-8?B?SnhXTEd3RWluRDJwZ1VySmJObkZ5UmgwUWhJZ0E5bVQ1NE8xczVjeHVMVnRW?=
 =?utf-8?B?aVdIbEZmS0dkaGFBeGFEVy9zdGsrVTA5M2gzcWkvQS9YS2UyTkFrUFVBamRB?=
 =?utf-8?B?WE5CMnJWV2dKZGZPOVRSNEcyUEZ1ZkhtbEdXeVp5dS9Bdm1oeXpsTFpvbm1K?=
 =?utf-8?B?Ynl2L2JwQnhVTUI3ejJ2cFkvdWx3cnRqUGthQzRQRW5wcVUweWRQYmkzQ0dl?=
 =?utf-8?B?MFU4TnJuOHQyc1ZETTNNZW9hRjJyV0RKMkNHR3FQekFkT2Y4Y0hvRERQVnN0?=
 =?utf-8?B?SXRnSDV3bWRzTGpVYVlNNkNiTlF0UVdxdWc0RmFHRVd1M1laSkdWVE5yQXVH?=
 =?utf-8?B?QUE2bm5pVDBFT2JNS0pyVjFZa2lHZDNVdm1LeEs0UUxCd0o5djRLNnlvQjc2?=
 =?utf-8?B?b1F3dnJIdE44Vk1uREl0WVhkN0NnVmFEWldyNWhBL3QxNDYxNUhNL2sxckdr?=
 =?utf-8?B?VllDNHljeDZKRWNQUUt1bzlkeXBJUG1DMnRMdE5QbVg0NkZSMXVkN0ZIUG9j?=
 =?utf-8?B?dm9ndGpoRWRNaFlvSVJIME9xQmFFQ2xoaGd2OC9YMVFqVGszelJkUHoycXBW?=
 =?utf-8?B?RDFQL3lZS0R0djF0YnNjOGVrTEd6RVVnRU1pUFlRT1NnM2JvQVZJeHBnSWNC?=
 =?utf-8?B?cEZYalRFQzJSaVE3ZWJ0dC9iOFRrUFYwMHBTYSs3eGlXMGZ5T05xQTBTeGRT?=
 =?utf-8?B?bktmWlZ2VWNjTXEzbHB4a1lXTVIwS2l1bmhhdkphVXVnOXhKaXBZZHpSUExF?=
 =?utf-8?B?c1JGbmtmcXBRdVJJOFlBNUZ5RWR0Vng1UndVQVNGUDJYS05SNHRackRFSUcw?=
 =?utf-8?B?VDFVbW00SGpHbGRXWmVocDhGRk84b09KWjlTM0M0STRBSVFPNXUrZGZKRmFK?=
 =?utf-8?B?MWEwRElhemZDajBvTTlUdVZqVnI0a1BlL2J0SXNvcElvUE1PQk1vMm11S3JS?=
 =?utf-8?B?V0N4b0FZMnVxa2o0cEVhd3Byc1hkck54aFE3YVgxS2p1U1pVU0hScmozMmU4?=
 =?utf-8?B?STNvWFJBTTBuMEcxUmFZbVBKV1VsYUdOMFNkZ29XR3dLbDdZeHcyWUZPVEpx?=
 =?utf-8?B?czY2bjByNUxFYVNtUE1rY00rM0piOE41T1V0UmxpTWh3b3lpbjcxUVBsbnJU?=
 =?utf-8?Q?BIrjzXabZpO3Tyb4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0507a8-f328-4627-b834-08da29352f54
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 16:36:03.2620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNN4wpcEadnvZ0b94W+Uf4gv1kCODmMRpCt8wN/jkgGydzOzkDWbebp8mJ+4K2mJwOejaBvwZ9LNdV02+EVOBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2777
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/04/2022 16:56, Mikko Perttunen wrote:
> On 4/28/22 17:10, Thierry Reding wrote:
>> On Tue, Apr 26, 2022 at 02:07:57PM +0800, Cai Huoqing wrote:
>>> The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
>>> which is integrated into NVIDIA Jetson AGX Xavier,
>>> so add driver support for this accelerator."
>>
>> Hi,
>>
>> nice to see this work going on. For subsequent revisions, can you please
>> also Cc the Tegra mailing list (linux-tegra@vger.kernel.org) as well as
>> the Tegra platform maintainers (that's Jon Hunter and myself). This will
>> make sure that more people with an interest in this will see your work.
>> Not everyone follows dri-devel, linaro-mm-sig or linux-media.
>>
>> Thanks,
>> Thierry
> 
>  From a quick glance it looks like this driver pokes DLA hardware 
> directly which is not the intended programming model on Tegra hardware 
> (there are Falcon microcontrollers that offload task scheduling and 
> synchronization from the CPU). The hardware is also behind the Host1x 
> bus so a simple platform device is not sufficient.
> 
> Was this driver developed against some platform with OpenDLA hardware 
> (i.e. not Tegra)?
> 
> If so, we'd need to verify if the hardware matches the hardware in 
> Tegra194. Also, this driver may not be ideal for Tegra platforms since 
> we would lack the hardware scheduling and synchronization facilities. It 
> is likely necessary to have separate drivers for OpenDLA and Tegra's DLA 
> integration.


I believe that this is derived from the following github project ...

https://github.com/nvdla/sw

Jon

-- 
nvpublic
