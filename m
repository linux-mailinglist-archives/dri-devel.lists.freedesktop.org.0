Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B9E3F04C4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 15:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0486E5B2;
	Wed, 18 Aug 2021 13:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4996E5B2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fatnMxYZXGPePtsKp16BZe1SJNukM4je1Git6db6sw5/evWtcAV4+l3QnIH/tSqZTLkoeprM6xk4ZS5rXyOWyX3HUAVCHulkon7apiAp+zLjaHSDo5UCEDAV2OCJBLCMdYjevEKGWKnZBDBbsX1B/xDwaMX3lCC0wZZejdzKNyjOWx2XC4GyLms70MXrgQMgLlJdMqvDP/M8sChnFCPqK1eST8Y4WyYMBpeS82AZwzUjB5FMph4zDraJBjRQUFQRu62VCtSmfCP59LBw7bw9HZSPNpUiAFSxjPtqGOJrFwV083hLzxJXl8VrJnucv171ocNIkU7az0mWouaE49EQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SqWGiBXzv/mSubuXPn5ffUgr2OrrExZ4thuxey+BoM=;
 b=KpBFW0j574zhe2jMsM6KSDXaxQkGLRV3I3k2eIvRdUB+zBS1R9+B4N/xSUDbpuiOOppzrbkYkIbZ5WmRLckHNq9nDVsdQa5YONTAOyGK/6N9w4yxUKAX2ZgcCsVwZhZLyEJitWIymIhbnK7U9KCgEFwGAnGj6pdxz7ovevhC9/Jl+GBUXvpLmvXAGSzhCL6InoVpySjCvIkGh8uKWMhJ9ObwbWtTs/BnfHpYF1tMMGOylXexalx3omfF2eZ7i62hmwwEWstaZFAPuJVBbYkJxk8GYT5g8ObdxRaOPmK65QCNtr1TB5208VlXzUAEc9WC3K7/6ywe3c6JmUuvT1YM+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SqWGiBXzv/mSubuXPn5ffUgr2OrrExZ4thuxey+BoM=;
 b=ZFL5JVL4IQwA0pOiBwL1o/AwL1OGMTCzhegT5Z/3znKj+2Dcolb9gYh5xeBbfTLr8yj0SHTK1eE+nawfQRUM+CJ+X86PyjEq1+E42kaif4yfzMn5mBUgqmu5xPIL2pMm5ZAteNpRNfZVvftdfgIRNVaakZKLRdMB0OSdkKE69cc=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 18 Aug
 2021 13:28:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 13:28:25 +0000
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: return -EINVAL if dmabuf object
 is NULL
To: "Sa, Nuno" <Nuno.Sa@analog.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Rob Clark <rob@ti.com>
References: <20210818115810.274084-1-nuno.sa@analog.com>
 <9a63b45f-6fec-6269-ae16-8604b08514de@amd.com>
 <SJ0PR03MB6359C318092E0CB99D28D85099FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
 <ed0bf7fd-de49-f94a-3eda-0c1fac50153a@amd.com>
 <YR0BMCMFcwXLjNAe@phenom.ffwll.local>
 <74802a7d-9105-006f-bcd8-3bbf97035704@amd.com>
 <SJ0PR03MB6359BBEC317B7DD637C9509A99FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <378ced6a-ae1e-259e-7a9f-ee3acb98e9d5@amd.com>
Date: Wed, 18 Aug 2021 15:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <SJ0PR03MB6359BBEC317B7DD637C9509A99FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0101CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.55.180] (165.204.72.6) by
 AM4PR0101CA0059.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 13:28:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bd0356e-7c71-44a7-aa01-08d9624c0e57
X-MS-TrafficTypeDiagnostic: MN2PR12MB4374:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4374422FA2BD475ED885ABD283FF9@MN2PR12MB4374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bodSRKaCE8W4QrxSA7IjhyNz/TGsD3EShIO46DN2ed6clLUWMNIHtahPiev+UXeYAl1HFiPtVHlhV3d8zrxjbjWLvyT0kZC0G/hEAuEBxyWhhRnBhOiSdt6BhhEHCZqj6JkaYEVDL/fJ8+pY1Wwzecr5Zldy9TdPYBSGMmlmpp/j2jnbTONIsjctjaXRpocLkBRuNbVu7Ue3zrS2tseMaO1M+DFiMYCZVVMNhwV185de0INeROElkbAShhrCr/muhz1qP5WWaqDbSu7wUCtlpdxqpvGDzQFosHB+A9vl44g9eColU2Glvlmedt0/vomOrsBy8n/cjdzsCZbKS7UBxvqKOisMsWw/0u7T4xt1dARakmlucGS3Hbdo3geuUbY7Hi1Ki4KWmh9AUAVnvwMyah05VdidmJURrI3NErDEBAeG6WliPcTp9kGNxhikYm+oA5T0nKo2BMX7w+gOhtJDIFVNVlfwzvqOXw3iaDa0jFbaqtR5u5yI2yJwNxxSUV8hRMxToKMwxgv+hlYON7tcWfYbh1J9XDf5sngwKnomUHYsaRZrHAThTnj+EF3lXom/43LuQPO26Hf2SGM9JSj0F/ZRR+w2eiBDt8fNYy2YIS499cRFI4kCTd57bYU0cBKSSOmLLKBVx5if+ipnMnh1wQhdqR2OmQ33amXCz2/0T31Bj66R7Elgl2emh+kLR6KlgqNLjN3NRzF4ZT5+H52Wbg98+RhjIO1OKE4G+GEyLjwMsP3RpehtzbC7iQG/+iLG889f4vbBKPgEs7zyfafOQdR6D+DmgUqsh44n4lrrgMI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(45080400002)(53546011)(5660300002)(6486002)(316002)(8936002)(6666004)(26005)(19627235002)(66574015)(186003)(86362001)(36756003)(478600001)(4326008)(66556008)(54906003)(8676002)(38100700002)(956004)(66476007)(2616005)(31696002)(66946007)(110136005)(16576012)(83380400001)(31686004)(2906002)(966005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC8wTlFhR3J0ZTRHVWpEYVpjVTBhV3hDcTVTYitrUjRKNjNqTUpGZGxmSkEy?=
 =?utf-8?B?aVhXWDgzZzhmN3ZIQllVUVh2Z0h1SmY2M3pmeGlkSzVVSWY3d2NjemFEWm5r?=
 =?utf-8?B?V2pUVGx6R2VvK2N4cWdsTkNQSEpvcGk5N1JZQWprNFZ1M2lwcStmbzBNazF6?=
 =?utf-8?B?UXY5dmhWYXMrSFJtQkdpWkRxRmpkRTI4cmJjbnpFOVl3MWxaWlRlMjNSMTBO?=
 =?utf-8?B?cThZbWZzZlR3cGU3SDNHYXdseFk0eCtxc3NmZTJpL2J5ZHRaSFNtamw0bHhy?=
 =?utf-8?B?UlRkTWkxZmVtQWFxUk1qYW5kQ2NsbWhSckw4UUNpQ1ovZDAydTZFUDNERDgz?=
 =?utf-8?B?RndON04wd0N1TkdYYzE2SGdCTGhpN2Nmc3JTcFBUbWlSZW1wcFFvekxNZzk3?=
 =?utf-8?B?OS94ZDNHV2NtMU9kR0FTazZLMkdPKzNCVlFlSUtxbFd6WE5QbzlrM3Jwbms4?=
 =?utf-8?B?cFhMVHZ4dXBsVnA0aGpUNHduQi8rWHlNT0g0ZUo3K3FTMElPbXlscXFmcmp3?=
 =?utf-8?B?TTlhTTRUSVhXRXNaWXFqMXVTeUh1KzNBUndsVUpFUnNvWkxNVWt2eXJyZE0y?=
 =?utf-8?B?TitMMTF2RWlYclJhZGQ3bjUzdFN5SjB4T0c3bzNsYXVnQXhNV3JlSzd5ODgv?=
 =?utf-8?B?SU1QL1drY0FBaS9OVFR4eXJIbFpEVlcwVE5hWDc4OThRSWNSeGdsWjNrYzBt?=
 =?utf-8?B?ODFVNTNnS09kUjFrR3VJQzljYmkybVBYTDlWNGlTZUIzTDEwTjRud0lVaXRD?=
 =?utf-8?B?dkhFRE9ZU0dHcC9wbmQrZjZNL1ZNNDBUNmNXNjE1ZW5VWnhWMjRPZkJTMXZ4?=
 =?utf-8?B?V1lhQi9TSExQU3o3WVdXNG5JWWpqL2dDNlFQVEI0MDRpVGpCRVVCR20yeENt?=
 =?utf-8?B?WjRINURWVnRwMFFtNExUdVZKWVdCeWwrSVVoU2w0VjlWRXlhSE1LUkNGTFRP?=
 =?utf-8?B?R2kvY0ZtVXRCbHVxbjZYMUxXSnZWTksyM1FNYkFuaG40eFZLUDdQbFFlbmRG?=
 =?utf-8?B?bEw1a056MG9tcEg1Z2tDMXk0ZkpuMDJwUFhvR2dUSUNoazVmdU82TUhDdjYx?=
 =?utf-8?B?c0dRcUtGWDdZV0dpK0FRMmxMVktIS3hwSUdOTnpCYUt3Z2lQYm5OQVNvYmU4?=
 =?utf-8?B?YW5OQ2MyWDJUWXhWMTRvaldRRER4ZVB6cFlGR05NL2hjVXh0NlozQXVrL2ZN?=
 =?utf-8?B?bVBlODNZVXlKS01sWlpNK0dYOGg0algwOGRPVnhoT0xYeHQ0SE1PYnlHb1RH?=
 =?utf-8?B?RjhSK2pNV1Z1RXkwaE8zSk9KdDUwVjQvNjAzNkJpSVhpZDNpUkc0aG45SXFw?=
 =?utf-8?B?RWpkVTdsMUlBY2ZJbmtvTzcraEVzRkdjSkRRbTFQRi9XQ2N5T2hSTkVYMjFS?=
 =?utf-8?B?T3ErVlJpbVNUV1lWZlJCT2V3ZUFtTGd6cWNjNi9wRUhrS0Y3ZWR4WE1vVXM4?=
 =?utf-8?B?bFd1ZmN4T2xpUkhLVU1TSWZFOXVNTXd1RFhkQ0JhMzhBMDF1ZTFuTFV2VHEz?=
 =?utf-8?B?MWs0NnArNzJ3R1V6aDRZSFBVUzNiWUlIMnFOQXVKY3J4bzMrNXcxWWVicUQ4?=
 =?utf-8?B?RFpQOVRDTnF3NHdFVThZa0NwL3VUdENLQzNYRmNxU2F1Znp1VFVHS3VCeE5u?=
 =?utf-8?B?dXN6WnRZUmk4bEI0bGFDUEttR09ZTFFES2xCUjF0RUxhMzIyYVB1TjErK3c1?=
 =?utf-8?B?NlpKb1lYeE4zY3I3b05PV0NiR3dlVnhDTjJ1QnZKaCtkNTFyYjk5UFdhRVBo?=
 =?utf-8?Q?C3Bgbhy/zfdAonRk772o6Eb5wyDuQ48xfkpBDvD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd0356e-7c71-44a7-aa01-08d9624c0e57
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 13:28:24.9207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqrH7NB/lMP7SEcNq+aGivtxhE7hE/sVb4pkK3fSjruKY1nw3lWkxxMNRYELal3D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
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

Am 18.08.21 um 15:13 schrieb Sa, Nuno:
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Wednesday, August 18, 2021 2:58 PM
>> To: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Sa, Nuno <Nuno.Sa@analog.com>; linaro-mm-sig@lists.linaro.org;
>> dri-devel@lists.freedesktop.org; linux-media@vger.kernel.org; Rob
>> Clark <rob@ti.com>
>> Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: return -EINVAL if
>> dmabuf object is NULL
>>
>> [External]
>>
>> Am 18.08.21 um 14:46 schrieb Daniel Vetter:
>>> On Wed, Aug 18, 2021 at 02:31:34PM +0200, Christian König wrote:
>>>> Am 18.08.21 um 14:17 schrieb Sa, Nuno:
>>>>>> From: Christian König <christian.koenig@amd.com>
>>>>>> Sent: Wednesday, August 18, 2021 2:10 PM
>>>>>> To: Sa, Nuno <Nuno.Sa@analog.com>; linaro-mm-
>> sig@lists.linaro.org;
>>>>>> dri-devel@lists.freedesktop.org; linux-media@vger.kernel.org
>>>>>> Cc: Rob Clark <rob@ti.com>; Sumit Semwal
>>>>>> <sumit.semwal@linaro.org>
>>>>>> Subject: Re: [PATCH] dma-buf: return -EINVAL if dmabuf object
>> is
>>>>>> NULL
>>>>>>
>>>>>> [External]
>>>>>>
>>>>>> To be honest I think the if(WARN_ON(!dmabuf)) return -EINVAL
>>>>>> handling
>>>>>> here is misleading in the first place.
>>>>>>
>>>>>> Returning -EINVAL on a hard coding error is not good practice and
>>>>>> should
>>>>>> probably be removed from the DMA-buf subsystem in general.
>>>>> Would you say to just return 0 then? I don't think that having the
>>>>> dereference is also good..
>>>> No, just run into the dereference.
>>>>
>>>> Passing NULL as the core object you are working on is a hard coding
>> error
>>>> and not something we should bubble up as recoverable error.
>>>>
>>>>> I used -EINVAL to be coherent with the rest of the code.
>>>> I rather suggest to remove the check elsewhere as well.
>>> It's a lot more complicated, and WARN_ON + bail out is rather
>>> well-established code-pattern. There's been plenty of discussions in
>> the
>>> past that a BUG_ON is harmful since it makes debugging a major
>> pain, e.g.
>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Furldefense.com%2Fv3%2F__https%3A%2F%2Fnam11.safelinks.protection.outl&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C6355660e526b4da23fa408d9624a0160%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637648892261202104%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=pkZg9vDm4RTgmAD6vtugsLmUuL0fG9ExgTWedxOxCW8%3D&amp;reserved=0
>> ook.com/?url=https*3A*2F*2Flore.kernel.org*2Flkml*2FCA*2B55aFw
>> yNTLuZgOWMTRuabWobF27ygskuxvFd-P0n-
>> 3UNT*3D0Og*40mail.gmail.com*2F&amp;data=04*7C01*7Cchristian.k
>> oenig*40amd.com*7C19f53e2a2d1843b65adc08d962463b78*7C3dd896
>> 1fe4884e608e11a82d994e183d*7C0*7C0*7C637648876076613233*7CU
>> nknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
>> CJBTiI6Ik1haWwiLCJXVCI6Mn0*3D*7C1000&amp;sdata=ajyBnjePRak3
>> o7ObpBAuJNd08HgkANM9C*2BgzOAeHrMk*3D&amp;reserved=0__;J
>> SUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!A3Ni8CS0y2Y!qiDegx4svPUMZrvnzUo
>> X7VKvvFpDcedH9gYbRCiWfe_N3fw4zpmA54qxefvMiQ$
>>> There's also a checkpatch check for this.
>>>
>>> commit 9d3e3c705eb395528fd8f17208c87581b134da48
>>> Author: Joe Perches <joe@perches.com>
>>> Date:   Wed Sep 9 15:37:27 2015 -0700
>>>
>>>       checkpatch: add warning on BUG/BUG_ON use
>>>
>>> Anyone who is paranoid about security crashes their machine on any
>> WARNING
>>> anyway (like syzkaller does).
>>>
>>> My rule of thumb is that if the WARN_ON + bail-out code is just an if
>>> (WARN_ON()) return; then it's fine, if it's more then BUG_ON is the
>> better
>>> choice perhaps.
>>>
>>> I think the worst choice is just removing all these checks, because a
>> few
>>> code reorgs later you might not Oops immediately afterwards
>> anymore, and
>>> then we'll merge potentially very busted new code. Which is no
>> good.
>>
>> Well BUG_ON(some_codition) is a different problem which I agree on
>> with
>> Linus that this is problematic.
>>
>> But "if (WARN_ON(!dmabuf)) return -EINVAL;" is really bad coding
>> style
>> as well since it hides real problems which are hard errors behind
>> warnings.
> I agree that doing these kind of checks in the core object of an API is
> abusing parameter "validation". I guess a good pattern is having the
> warning and let the code flow. But since these checks are already all
> over the place I'm not sure the way to go. I'm very new to dma-buf
> and I was just checking the code and saw this was not be coherent with
> the rest of the API so I thought it would be a straight easy patch... Well,
> I could not be more wrong :)

Well that existing stuff might actually depend on this is a really good 
argument to keep it for now or at least until we have a consent on what 
to do.

> Anyways, depending on what's decided, I can send another patch trying
> to make these stuff more coherent. At this point, my feeling is that this
> patch is to be dropped...

At least for now I would hold it back.

Thanks,
Christian.

>
> - Nuno Sá
>
>> Returning -EINVAL indicates a recoverable error which is usually caused
>> by userspace giving invalid parameters and should never be abused to
>> indicate a driver coding error.
>>
>> Functions are either intended to take NULL as valid parameter, e.g. like
>> kfree(NULL). Or they are intended to work on an object which is
>> mandatory to provide.
>>
>> Christian.
>>
>>> -Daniel
>>>
>>>
>>>
>>>> Christian.
>>>>
>>>>> - Nuno Sá
>>>>>
>>>>>> Christian.
>>>>>>
>>>>>> Am 18.08.21 um 13:58 schrieb Nuno Sá:
>>>>>>> On top of warning about a NULL object, we also want to return
>> with a
>>>>>>> proper error code (as done in 'dma_buf_begin_cpu_access()').
>>>>>> Otherwise,
>>>>>>> we will get a NULL pointer dereference.
>>>>>>>
>>>>>>> Fixes: fc13020e086b ("dma-buf: add support for kernel cpu
>> access")
>>>>>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>>>>>> ---
>>>>>>>      drivers/dma-buf/dma-buf.c | 3 ++-
>>>>>>>      1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-
>> buf/dma-
>>>>>> buf.c
>>>>>>> index 63d32261b63f..8ec7876dd523 100644
>>>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>>>> @@ -1231,7 +1231,8 @@ int dma_buf_end_cpu_access(struct
>>>>>> dma_buf *dmabuf,
>>>>>>>      {
>>>>>>>      	int ret = 0;
>>>>>>>
>>>>>>> -	WARN_ON(!dmabuf);
>>>>>>> +	if (WARN_ON(!dmabuf))
>>>>>>> +		return -EINVAL;
>>>>>>>
>>>>>>>      	might_lock(&dmabuf->resv->lock.base);
>>>>>>>
>>>> _______________________________________________
>>>> Linaro-mm-sig mailing list
>>>> Linaro-mm-sig@lists.linaro.org
>>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Furldefense.com%2Fv3%2F__https%3A%2F%2Fnam11.safelinks.protection.outl&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C6355660e526b4da23fa408d9624a0160%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637648892261212099%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2B7ORg3ZL932Gf%2FQzZdgcJTb02dm5dIL0YaAR6mtAQ2c%3D&amp;reserved=0
>> ook.com/?url=https*3A*2F*2Flists.linaro.org*2Fmailman*2Flistinfo*2
>> Flinaro-mm-
>> sig&amp;data=04*7C01*7Cchristian.koenig*40amd.com*7C19f53e2a2
>> d1843b65adc08d962463b78*7C3dd8961fe4884e608e11a82d994e183d*
>> 7C0*7C0*7C637648876076613233*7CUnknown*7CTWFpbGZsb3d8eyJ
>> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
>> *3D*7C1000&amp;sdata=0E5L4Kid5ZPeKT8Uxx7K61fBXmI4TOsz*2F5IL
>> sFpLB*2Fo*3D&amp;reserved=0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUl!!A3N
>> i8CS0y2Y!qiDegx4svPUMZrvnzUoX7VKvvFpDcedH9gYbRCiWfe_N3fw4z
>> pmA54oQstzSNA$

