Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2980619BBD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 16:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B91D10E888;
	Fri,  4 Nov 2022 15:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9615F10E8A4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 15:33:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjY4vSsV2GDj0mjaULk0odSek7O1Z1gloBeNVKOamiSWuBssmbfBMpxNSHmYuHS/NGPGi4ItinLAKhEGCfi+AEM2d9NtZxzqbsfZT4CMlkml+HiaIshMcmp06F7uxVjK4vcvdgOLTYSDM9fH5WBCIZDfkmhcSGbr6ESX7/xLStE6rlBipepOfCihu7DDnYhXZrP6NlwN1dlEVqnesmkyCrS5IrfVBERJzuuS6Ey4ilNJNELuMBh92uGg+GSG/KwBxJM1KeDDhfjPe3/e6JaMPxE3QBg6Vrvy9Czr4yJhyekIhcMrUb78i1bXNYZvVsGKPo6vKUF4TOtjArxdFxMSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK1JLLsD2SMiEmkUuU+KT54F1DnbJBid3uH0+dRBYiM=;
 b=DAopX/FjWcmspNCulaBsvjqcCH2fBpoaFshmvdHhM2cDWieaGZyIkylzGuTFVKKhELMkt+dQEGvWZFAkI2RmPvtdGKmRjyd24WWnEyIJtbkYr5Pb/YZSt/KmXIwEsU4+BUuY0EGustYWMk9xbRKQIhTuwBjnQ7zsT0OhlT8nY+/CSE4qWfrImxy8FB32CZ9IksOWYfQdiWYth0ed6dwCtUGEuHyTHR/x5xN//W5YuLCKrrk7QS110jvocGN3UI34yZReCRVMRhfPAOpkUCH6/dECBydEiIwdx784SuUYW/JPM3TJN5iGhoQrr7ZLABovpVjSx7MHjsH1gU/aCiAk6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK1JLLsD2SMiEmkUuU+KT54F1DnbJBid3uH0+dRBYiM=;
 b=FpC7DGGorUe1av7dXdicxLuLt3zOYDUw8qFRJhLL64ZHT/ho2kHDA4opRpKQQVVBT49K6x2pvE7aFIplFcb7oMLb3kjbZsULS5gfgF2xjx8a1UgFr0t3LdmCOuBos/0/6kmfLuBwxF7XwC7uSix00WaNsKVDFrZq2yzExG6BB1N0rm0+CxnBSV9RlHvu5hw/DLCQ8UDT21cMAqQ7WC/duvqOVryWXaQzvXU1JkKuPF/iG6wJOWG3dynNRcQg7MRsWMCH3e2jDIwGC4FVwZxV05sI9X4aHYSZr4gwFbkM6RU2KxUpwag8sg35PlNrH7oKBSG7jFC9DrgutmqtwMuttw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.22; Fri, 4 Nov 2022 15:33:27 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960%4]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 15:33:27 +0000
Message-ID: <ee3073ba-d621-8b02-c986-3cf44cfbba96@nvidia.com>
Date: Fri, 4 Nov 2022 15:33:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 1/8] memory: tegra: Add API for retrieving carveout
 bounds
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <cyndis@kapsi.fi>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <20220920081203.3237744-2-cyndis@kapsi.fi> <Y1aP7kDi8cJUTcGN@orome>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y1aP7kDi8cJUTcGN@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0482.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::7) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW3PR12MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebdf984-858e-4729-13f7-08dabe79eb02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHfYe+xqUN6VVsGO1kQvwHq772wah0iJXiC6a2w/vczXmSjmO+xlz/TCjI/LdH2otTdXkWZbQt/iN417clYinUSpZsVq9tt+xKhCbM2Woe4pGtJRvuouy15MTdhO4/m5fzGXQKhyEhMIP6dNBxMdhKfYN+ctmCvbl7CLjXGkDzsHtwFFI5q+BRPiCb2d6FzTDcnhEt8w41q4anprt6QLfcZ3e6LYUNjEBHoctbRIV2kny9TfLPBDHWQ3EpDf8SNbw8uamzbWeYbGGDiO56Pg+fU8fYQMpWljuZlRjT+NOBZ2s7NJm7u/jlGoCEv+7/YEdlDkBRyzaowz38VH2ZWoF2VroAHRV9DeSiBAe03065RNyaO3mntOelIhsoL3O+vxXnjYYpjMlYNNCwUCeK5OrHQZAmplCJ6cgswhoBSr9tYiR/hyOKzziKF3r1vk7AsyX3pGDoM6OUztKRH6VeHcimc9EGeBuIBfBmNOJZYMJohYyoWmJhGLKTNszPT6gZEXeLL22JW9Y242T2igBiV13ELj7UJCTovREMliRHZHkmSdH2P7pne/Z3EFrW9x0yqHBuYsLy78RO/H8wK324qxFar5ZXKeal7hmT4UpOCFvwwa+xXSR1/9t/9Pw1Nex9a3gvXFmYT0mpy0h0ThBbDlCkFk7n6nsKw8VfwdytlpPzKTIaN0YESBXDvWJBCHQl3H41ubR5F1IeuAnjwvEweUw9F2wvF4LCcOf0w1jZTj7kIXblrTLwUwHGj446lwOZfIcfomjxSME1jaIcgjB+87+my9r/QfD/ogo9T8hNd+uas=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199015)(5660300002)(31696002)(7416002)(66476007)(66946007)(66556008)(4326008)(2906002)(2616005)(41300700001)(8936002)(53546011)(186003)(31686004)(6506007)(6666004)(6512007)(478600001)(86362001)(6486002)(83380400001)(36756003)(38100700002)(54906003)(110136005)(8676002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWV6OXhGMFQwVVlueVJIcmhudlRmUHNhT1M0akhKeHhvYVNpYkh5VVc1NC9M?=
 =?utf-8?B?ZEVJMGFaaUJnQTYzbDNmOUEzSlpRYUdBSUFnL2lobTI1cjh2Q3ZpVHA0Y3Yy?=
 =?utf-8?B?UWZFbjN3MDJoaXo0T0VidXVTM1J2aFNsME5DbVBOMFZkT0JrV1dNUFVrMG1r?=
 =?utf-8?B?U0hQYUoySU0vVll1SVkzL3B1STZkeFFkbXVGang0YkJzYTNHT1dhN1k1NE9s?=
 =?utf-8?B?by9LYVlBN0o3RVRSVCtpMXgzaW9OK05XUkRXeUdZYVV0bm04MlNIWXdsQUhr?=
 =?utf-8?B?b084YTFzaml1SWczbTJaMUY4SGQ4S09jV05XcXJCWHZHc0JlRkhVNkZBS3Jo?=
 =?utf-8?B?M05iT3lwQVVqMzJXcU9mUVJIbjRSVnRsaHZWWS8vejJPQU80ZXJTZVRnbVUy?=
 =?utf-8?B?VkEwdXluM2dWL2s2M0pGa1NoSkZ5eHIwZHNQcUpqbHdEQ0wrNGl0WnBrNjE5?=
 =?utf-8?B?d3hnQmIybEZROWd5OG03OHV0cXhTZTNXdkNISGVxcTlMM3VmNTlLbk1QaUZ3?=
 =?utf-8?B?QWZQdFlwS3h0Zkh3SWRwNFJvUWUvZDYwTys3WnpOeVFpZSszTCtnZDJSMWY0?=
 =?utf-8?B?bjAvc0RQc1k3YzRNekdQdzJKZ1hqOTJxRi95aFNvMGdmaXVxdjA2dVBxb1pO?=
 =?utf-8?B?UGJCK210UC95UWorZGhxdFZyVWRHZzFMZEF3ZzF1b1JTNHpzMU5YMnBCajlB?=
 =?utf-8?B?UDRraXhra01IaU90cTFaeHZaQnpEZi9uTVJvcXEyMVJ6aFd5RXJzNEExYytI?=
 =?utf-8?B?a3lEbThBRFpCSG96Sm1mUlZ1SXNYS0xQRmFqdGNCWjdwMHV4aC8vblFnblo3?=
 =?utf-8?B?UHR3eXk0c1JZdGdhZlhZWU9JblM5aitkVXNiMmJPZTBEK1hGNjgvam1Sa2pK?=
 =?utf-8?B?ZDRCNEVoMDhCcTZwdzBRQkZ2UW5qeFZreGZMQnYrcHovMFphU0E0OG9pM29s?=
 =?utf-8?B?eitvTFdoTys0VDFGbzNWVFpZbWR0QkpZL01yWUFyVXcweWZlL1RiZ2JBL0NQ?=
 =?utf-8?B?U3N0WGsyTlQ4SDljbVlNSjBPaGRONDV1cTlyVlV6cis4bHE0NkZqUkRCRW1s?=
 =?utf-8?B?Zkp4RTdzS0kzOXJackpwcXd4ZWlvSEFJYU9sZ25KQURHbnB6VlB6NHBYNm1i?=
 =?utf-8?B?dkRCeVZRT3lDUDBHYkgyM1B2bk9Zalk0a2I1aDZQMzVNM0tFdDNnYmhHR0Nv?=
 =?utf-8?B?L2RNWjFHaWR0TW5ua0JHWC9mUklDaStVL1A4ZVQzdThCZU9WclAyRnZqSTNa?=
 =?utf-8?B?VCs3TGFMdFREWEFSeTVOK2pxK0dCRkd6djBqRVV0bHR1OU1NQWZYTlhYM0tY?=
 =?utf-8?B?YjNuUzBmcjF3Nk96bFRKQ09sQUdpQ1pUUW9nZ1l0dVV3NHhEd2g2U1pBdExS?=
 =?utf-8?B?Q1BjZWJibGdyU3JWK1RUUjBTNTl5YURTeXFRQ0ZJOWZicEc3ekFOMXdPSW5K?=
 =?utf-8?B?V1FJaEoyZjF3YmNENDlZSHNIQjF6UFVVSVpoM3VwbFFwYVV6SDFZNm5HNWRV?=
 =?utf-8?B?VzZNMm9LVkFaa3Q4ckNHMndabVorc0hxYVBGdFd1YWpGR3oySk9tY2hhNFU1?=
 =?utf-8?B?V0lwZm4vSGd3cmpTVDJNZmx3N3RMODRRL0VyMzJ6cXFJUmlZU3RHY0ZLbkdK?=
 =?utf-8?B?c1E1Y0ZaalNUOEZtcms3WWNnNTJwT3A2aU1zMitMekN0NDBCMEI1aU9QRWtR?=
 =?utf-8?B?MDBOVEY5QTdpdmxPcnZCWWxlVVZoRExoSHdLbGtmUHlzWVNqVWxBQnh4eisr?=
 =?utf-8?B?Q3JXbzNaVmJtb0RDTkV1S3FXQmRaM0pzZzNaMk81eVh1WDRuaTZZdDlBenJz?=
 =?utf-8?B?MkFzUVZzMHl2bUt3T1NwVjVxYmoxN3lWTUd6ODZYRXBPT3A4aGpmbXh5aWxE?=
 =?utf-8?B?NkVKSzBJSm9JNWJMU0lOTzF0WTVNSC9NR0VVM3JYcXFaNVZpRDBKdmNsSlRw?=
 =?utf-8?B?K0R4eXVIT0t0UDZROXEwVm9BSnFobDR5dVRORUJmaEY3dkx2ZzBVanoyQnFR?=
 =?utf-8?B?ZmlFVENIZG12VksvcytmYnZJVEZHaVpXOVdJYTVtWW4walJiaDlBSitTODdm?=
 =?utf-8?B?cDVOMEJ1NGUxWS9RdWVZY1lET2RqUXd6dlpYRjVGb3JMYnByK21vRXVsUGFy?=
 =?utf-8?B?cCtjR3o1UWNueUZwRkNacXNhN3hVU3VhK2xmWDhoaU96VDIzTWV2cGVJZlZQ?=
 =?utf-8?B?YWVtWTMxa0dxaGgvLzNQMjBucVFNVVJkNklEWUpRMHIvckhPWlJ5WHBuWC9I?=
 =?utf-8?B?THhJYktxWnZKMUtaSUYvNHpTc3NRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebdf984-858e-4729-13f7-08dabe79eb02
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 15:33:27.4916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiifiCoOfhGN9wMuXl2sZc/pnDP2jd3WhEH3Oi9TKwAxFnPB+mJVeyB1eSC3RrCpggwXFbm3NWxd/47e8PHFcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry, Krzysztof,

On 24/10/2022 14:15, Thierry Reding wrote:
> On Tue, Sep 20, 2022 at 11:11:56AM +0300, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> On Tegra234 NVDEC firmware is loaded from a secure carveout, where it
>> has been loaded by a bootloader. When booting NVDEC, we need to tell it
>> the address of this firmware, which we can determine by checking the
>> starting address of the carveout. As such, add an MC API to query the
>> bounds of carveouts, and add related information on Tegra234.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v2:
>> - Add check for 64-bit phys_addr_t. In practice phys_addr_t
>>    is always 64 bits where this runs, but it avoids warnings in
>>    compile test.
>> ---
>>   drivers/memory/tegra/mc.c       | 25 +++++++++++++++++++++++++
>>   drivers/memory/tegra/tegra234.c |  5 +++++
>>   include/soc/tegra/mc.h          | 11 +++++++++++
>>   3 files changed, 41 insertions(+)
> 
> Krzysztof,
> 
> I've applied this to the same tree as the patch that uses it for now.
> Let me know if you want me to put this on a separate stable branch for
> you to pull in.

Any update on this?

Thanks!
Jon

-- 
nvpublic
