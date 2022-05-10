Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16E522251
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 19:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA2610FC7D;
	Tue, 10 May 2022 17:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBD710FC7D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 17:22:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyYqLUxLZXDx2EiJHPK8B+a7Yz3jzcyzSXilrTm7TA2Mai+blku5i6Ozsu4Ju3c21xS+lm/60VOV7MWytfWYnymXEh/AfwrqcjbaaZ9qTFjy6TcG88SxceugVJaZc1Ngd1/7tYCMvqU11tpUE2vGGb1pfTYS9vzspvkemsg+lBo+eeVsMswUNhYJoaZSP3BrWA9kWlw+gg+AT8FuO0te0vokJuJxj3ar2F1+0KbIgF9bAb2tTs9seI6lstg7qGOweS3XE+UsQYG7XlbNAMfQSHv8vxOf0tAj3I25rG2tQI0b3HuRZ59hzf0hxQUxDPwgm2wmoXmxTkOhMPWLzy80iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGYjx71YOIPqYQO2UTzNzsJ/4sCmtM2mGQxpEUNuNZI=;
 b=Mv4QPW7HUHmuRY/FtNGD7j6u5shN2BQhEmvl9bmehflE2AjPExZ3Gj7tRdJ8GwI0CiiHCNw4nADrGASY9W3OhYMv4QcJZoGTaSD2T/9EhCUyQ0EuwdeBi38SM07Mb/sCJhkPDY4Bzg0v0VKj9Jhrg3+SGhny0qkH3LMR1jDodWvTOZaIRBjndeuRiavn0kQisqWYf1AZSrJ8E7H9p4H5krWZ2oegbduXR2R+fmJbmNzQ4EGNR8VEkMSb7+JrS9FiyZ9InObDzbgXWMqWCnP4xTko4nt6QB1V52XsewvR5Wb6aUCVXw7ouqcVzkQ2fm1JOYCuiDsWQL5wvsNxVUi7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGYjx71YOIPqYQO2UTzNzsJ/4sCmtM2mGQxpEUNuNZI=;
 b=Q/t/atXxmpD+FS5N+gFV1q4atrIXnBgevMHAEFdHZ22NrpDqDU7Vlbm6gGw/rK6hszsSwbM/BbEiVuJ8+M0AkZg+A1qvS1FHtfedUrwVhX+PYT4wXMBqLQ2X5hGkrK/Lg/4HcNR1PCTkOmTUS+IAe50Ryb7h4uUxBbku3vT8I8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5100.namprd12.prod.outlook.com (2603:10b6:408:119::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 17:22:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 17:22:20 +0000
Message-ID: <2a0312d3-d576-b5be-c823-938b38096523@amd.com>
Date: Tue, 10 May 2022 19:22:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2] dmabuf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org, hridya@google.com,
 daniel.vetter@ffwll.ch, tjmercier@google.com
References: <1652191562-18700-1-git-send-email-quic_charante@quicinc.com>
 <4ac55be2-7d55-2c3b-0d5e-f61c02c62792@amd.com>
 <6dc59fa7-5885-9ed1-54c3-f2d112786312@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6dc59fa7-5885-9ed1-54c3-f2d112786312@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0601CA0054.eurprd06.prod.outlook.com
 (2603:10a6:206::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b544507-32e0-4132-35de-08da32a9a3a8
X-MS-TrafficTypeDiagnostic: BN9PR12MB5100:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB510064851B425C67DE6CC96883C99@BN9PR12MB5100.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbgnFydIg+XeTV79otyBBEqF1APqBqAYCYdHqubmUWl9Imw22t8c92yNcOJHtMFeNl6D3b/qZa1iz5Ng+7xBiFCY0Kt5guNoF3HDREQcww5YHt6vemBuVfMjXlEEVtdiZTLhej2VwvG2ncDOe3f334Q6TjkGZlHF9r75QIv78Edpf8/RTMFL1waDAUeDbchnVZ++DC+1EP8P4qMLtdZk3gOuEw5jOEnFvLIQBPrGv3EzWPirK7Z+zBZ88dzWkSpf6T6ZMcALeyj5Xa40ZeM0LC/MMmYHYkL03LcxtFgaoNIUY5KSramhiSUzpvlc/0plbMDBnPDFU1+wMj4W5nCrJU5RKQHSJ+ySErZ5A1ShEVwPx3rxKaK8G/ZFFXpCKcagBxsjNQAf2jIFcGtLDBZmz0bRSf80/pwUazsiT9r0/xGA6m4qqyANCLp8ImTPd+1t8CE6CtNTh30j2K8COEqk0NCK8nCjwha+Lkt0PJ1xGb1pQVxwg/u8C69z7Ub/+VThuGn4PBNfkHCqlRyhFyq0HPhRg7MshPUFie65Vft3VHCWg6KVqlgk1K5DCJj2FPcNHjHRevtCe6CakXFgy29Sp+pNE1Kip+aprl73Apj55dcGOglt6CdL1Gw3w3JgATluDIbo2VpGaX71b49hcssq88EV1i03du1yxXhVul9JSQ3OUmNAkw0DpVPpUoYiOew11tlXKEY8nLi7SlVU0tMCNjfC6l6kTQVdEU1Ar93Z+uA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(31696002)(66556008)(2906002)(508600001)(38100700002)(5660300002)(36756003)(186003)(31686004)(7416002)(83380400001)(8936002)(4326008)(66476007)(66946007)(316002)(86362001)(2616005)(8676002)(6506007)(6666004)(53546011)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWpzNy9lOW1vRTJpRWEzZTFGSnJOSVVqNm5SSmcyTTUvSFNUNCtDSk9tWDRn?=
 =?utf-8?B?NWZ0NnErQlpSeHRQcklldGRPaEF0bWdYWE9RS21LSmNQd1NEeHhrZDB4RnAw?=
 =?utf-8?B?VXRLZ1ozRnVNam94NWszblY1djR0WEZxcHplTzdXWUcxZ0FEd2o5aHNQT2JV?=
 =?utf-8?B?ck5TK2hMTWdUcXlKSkFkQThGTkFhUU1nYi9kait3Wi9ySFdVZmlQc2RjdWh1?=
 =?utf-8?B?QkNwRFFkNDVSaitFcHorV2w0UHdGQTVDdnc4NE14cE15aFErTm9kcXByM0JG?=
 =?utf-8?B?bUZqMXhXTzJTMjBxL3M2UjRnRWpSU3FMRWUxRWwxd28wNXRUOEVFRUd4ZlBh?=
 =?utf-8?B?bVhXdi9vRzNQQzhWM0FrNWpjeU8wMmRCSS9uc0l5VE1aVTZMby9EcVZocFlQ?=
 =?utf-8?B?V3RBajJTVTZ5Yk9CRXFlK0Q3bGcvMG1JTzh0bHJ1MkxaZHdPTmNtaFZUZGt5?=
 =?utf-8?B?bG9ITTBUQkVHSnZlQlJYbjNFL0Rrdk51WUhMbU4rNnpENmRYVnIwaG56R3pr?=
 =?utf-8?B?Wkludk9aNkpIMElwZkpyRGdzS21scFVDN29jZ053TWF1ZkJFUEVPTkxvS2VV?=
 =?utf-8?B?M2FDQzNFa2NnWS9HNzFzZXJPdXBoNlVRZXJBZ3pzZnB5ZFR6U1BsMlFNc3NO?=
 =?utf-8?B?YmkwVUxiVDdZVFY2ckZNWTJtTEUzMW5zdWcybm15clRCWTBuKzlRU0lYN1Vp?=
 =?utf-8?B?dldESTZCTUYxQVU5TlNJNEs1VC9QQjBEbmlHMUVRWGZxQ3JmOVo5OEl1UitZ?=
 =?utf-8?B?cjNMRjJMYW0zTXBWWTVpcGlwRHBGVjZQREdoak51QlFIcW5xdTRMTko5dkpC?=
 =?utf-8?B?NGE3MGdEQ3IxWTA3YmtpN2lWSTFzRmZCUTJOL0RXbFYrbktqOGczRXZCZDRp?=
 =?utf-8?B?NzVNSmJDcDVNUXhZTXBHS0svR01FREhySkFzb25jZWN6UGtVNDQ1dW5qKzlw?=
 =?utf-8?B?TmNEMEFNUFNYTHdoOEF6ZGFkai8zMWhrVWZocGNiV0J5dTN6eUpTa1gySTVI?=
 =?utf-8?B?ZUpsa0VjakJsQ25IbktLVFNOTjFMTkRIT1U4T0s2M0M1emI3UTBRUHdpQUpL?=
 =?utf-8?B?cFgxdkFTdnhhUnpqUmtIZlFmdXVpNW55bEw2MktUUUN6Vmk2c29Pcm9MRno4?=
 =?utf-8?B?bUlMYUQzQ1Y2Nnl2VDBXZzFsckNPVlQ5ZjJEZ1R2bjJhOHF2V254ZnhGeCtU?=
 =?utf-8?B?TFp1dk9SY0orT21uSlUvanJlOGxOSU9ieVZSNVR1UXkwbmhtKzJpQWtPRlQ3?=
 =?utf-8?B?amlybGhZV01sMTBvZEdtVkd5blN3ZGpVb1c0MFNLaUYvcmtOekVBSCtkYVlE?=
 =?utf-8?B?NWgzM1dMbEtZVTBqNzZYRXVhU0J0Z29OaVpmazJkNUp2RE9xa3Exb3BieVB5?=
 =?utf-8?B?VHlSZDVsbjZQWWdOSXl4ckhXNlIxT1NqYS8xTXhTUm9OWHdKQWdObzNIOEwv?=
 =?utf-8?B?Sm1wUDA5UjBQV2l3ZmkvSnZIbGs5T3pPNGdpajlRdXpGeFZJcjE2SVJ6S0Vn?=
 =?utf-8?B?ejlTaGFCcWFUN25Jd1hwak5teGtpOGhqVmR3Q1pRWWpEWUdRcU1PU0RzM25P?=
 =?utf-8?B?cCtkZ0VIVC9hVjExL1hBWFFWMlFjRUJ3azg3OURxZkRvVmpTeG9uQzFicnov?=
 =?utf-8?B?bE0zZkxybHgydmlDUWYwSXdUZjVWVk51L2VLR25zOHNVNmd6UzdCNnh5VXNj?=
 =?utf-8?B?VXBDaUtXWERCU0NDYXg3TjdZbC9tVWw4WjEwZVFJSDQ2Vkhid3RkU2NQc3ZV?=
 =?utf-8?B?T3Byc0dCaUVyeWx0eVM1NW9Dc29QR3RYRWpPL25QSTB0MGh3cXY3STlIS092?=
 =?utf-8?B?QVg5SFRhMHVKTkNqYnJWWGZMb2Z1b1JzU2xqRjR6dmNCcnMwUjdpaStKTHlW?=
 =?utf-8?B?Y2NHdG00TU9GZU00Nmx6bExaREQ4WkdJMEZiYSsxeFJyY1VaZTRqR1lBaUN0?=
 =?utf-8?B?VkRrdFArMHFqemgyd2JsOEc2Zm00U29JbkVSM3M5dWJpeWN4Q2tlTmdTMktV?=
 =?utf-8?B?WHlwQ1BTUHFnZU9sZXQvczRWdnV2OVNYQ2FEeUhmbUs2aEs5Q1M0QzhTZjB4?=
 =?utf-8?B?WXd6Zk9peTNGd0NsWWRqS3VxUHVodDNIVVVRRktIUGV5Nm9iNSs0R083V05M?=
 =?utf-8?B?ZVcrWEgySlpYQVpPOEJGZ2lJOVN6MWpXamNPQzhVT1dJWFRMdDBhWjVIajZJ?=
 =?utf-8?B?KzBjNUk0c0NybWtQKzJHOTZxbTUwb2Nkang4eDFGaVg3Zm9FakcrbEdtRlBr?=
 =?utf-8?B?bHk2SE80bG5nRlU1UEtsUmR4VjRsMEoxamdPYXFTbnZsUUY4NksrQlRyaE5a?=
 =?utf-8?B?bjVMNDRsUjVGWlhlV0hyQ3hhVENlanFRcnYzb2pMemNsRHpyeDcrNFhhNU5w?=
 =?utf-8?Q?CsPy7/M+ZY0/iUVQS6zV+Gpvyld2prsW/bJ5HQyoENMO8?=
X-MS-Exchange-AntiSpam-MessageData-1: A/zJbmyMIvfhSg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b544507-32e0-4132-35de-08da32a9a3a8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 17:22:20.5105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qt2xu/He98DdoyQ74L7xKEjK/WLtkIUEKlBt2N+SYrpYpsgAOvev9wKFHnFesL2E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5100
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.05.22 um 19:14 schrieb Charan Teja Kalla:
> On 5/10/2022 8:42 PM, Christian König wrote:
>>>     * The information in the interface can also be used to derive
>>> per-exporter
>>>     * statistics. The data from the interface can be gathered on error
>>> conditions
>>> @@ -172,6 +172,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>    {
>>>        struct dma_buf_sysfs_entry *sysfs_entry;
>>>        int ret;
>>> +    static atomic64_t unique_id = ATOMIC_INIT(0);
>> Please move that to the beginning of the declarations.
>>
> Done. Any scripts I can run at my end to catch these type of trivial
> changes? checkpatch.pl didn't report this coding style.

Not that I know of. It's also not a hard requirement, I let it mostly 
slip in the drivers I maintain. But upstream people sometimes insist on 
that, so I want to be clean at least in driver independent frameworks.

>>>          if (!dmabuf || !dmabuf->file)
>>>            return -EINVAL;
>>> @@ -192,7 +193,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>          /* create the directory for buffer stats */
>>>        ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype,
>>> NULL,
>>> -                   "%lu", file_inode(dmabuf->file)->i_ino);
>>> +                   "%lu-%lu", file_inode(dmabuf->file)->i_ino,
>> Why not just use the unique value here? Or is the inode number necessary
>> for something?
> This will ease the debugging a lot. Given the dump, I can easily map
> which dmabuf buffer to the process. On the crashutilty I just have to
> search for this inode in the files output, just one example.

T.J. Mercier just confirmed my suspicion that this would break the UAPI. 
So that won't work.

This needs to be a single number, preferable documented as such.

Regards,
Christian.

