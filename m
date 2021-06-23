Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD69A3B20D0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 21:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1A6E979;
	Wed, 23 Jun 2021 19:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03296E979
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 19:10:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQhlGS+i+Z6zq0hByQgZEpC6WNEA0MwFSbH9oM7HSWbACKykYFNzzV7+oQdawFJa62PW4MO1w3l/PrqiXZjUDmgRkzxSyJTXsDJT7NUiGi5jFz5MlcVBgI2Jkz92SSsHqQDjpBmyoYu1kbRiZUgkHmKzYVhMKmMxr5Kyn7fjqZhAq7eoI7nbLJ7UsJ60BiCFoPm5fHIdus19jL80e/n0IpnBcYJx5m+AQRK0ctc+7S5yi0UHVqIuD0lulU7vx8FomzEPA/+K5A9sWY9NNjY93cpmPVhHald2mX4UEo4eUkqj0g5EZE0MsalzUWSnhZXIYTHMirokZE+CCWg/mABjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7buE8yv/Lbe2N62AskybfRZTuy4UTTPIA+mvw/6VjJM=;
 b=VmrlUWxsrgqVMouwOloSda+8nsuvI4CFwQeBXvcuzyEvPqgfE3b1Nvu82iNoY6nERnFhlp28cWWFqVg6h9fs/de09eAPKsZrGoejmPaRdN3Lk4t/27/5x2QpyuTarpNgILqd537LDYupPnV6UbpOnXo+FIUH7YmRYXyBKmYvF4RuWPskFNOaO+5QMKozcR+m2lhQfmtS7SBwCb2CI0hSgq5bmV2ZgwiiNakhqrnSaJ76DixtKFNTq2NNbsVvY1EEgWq9IlIn8dRdMG5eAjYszunHWaCKI6vez0xOp0Nu2zMXBfF5/zR1f2t5ne7hBtN/llUdeAAVII1BOkhfn9Uoag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7buE8yv/Lbe2N62AskybfRZTuy4UTTPIA+mvw/6VjJM=;
 b=G2PMqICT44isfOk8xy9GvwGmjNrIOxjNMd/srdcXUuQXaXTdgYqoolZmeClsaKOhSwghutxU6aYFBdidOSHdYnFWAs/hbjNLRJxVn/1nAuwXqT0UPVe5ZZQg6NfRuwcbbP3ECo4k+CSVo7rPKOihePcsP9UxnM2NLyWiC57v2is=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4541.namprd12.prod.outlook.com (2603:10b6:806:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 23 Jun
 2021 19:10:36 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36%5]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 19:10:36 +0000
Subject: Re: [PATCH 1/6] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
To: "Das, Nirmoy" <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
References: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
 <fabc2a74-37ee-7a45-25a7-178f2faf6c29@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <c2776487-7f83-5aba-2862-f276448b5772@amd.com>
Date: Wed, 23 Jun 2021 15:10:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <fabc2a74-37ee-7a45-25a7-178f2faf6c29@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:7312:c882:f465:2b2c]
X-ClientProxiedBy: YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::22) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:7312:c882:f465:2b2c]
 (2607:fea8:3edf:49b0:7312:c882:f465:2b2c) by
 YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 19:10:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7fd083b-23d5-4fdc-6585-08d9367a94e4
X-MS-TrafficTypeDiagnostic: SA0PR12MB4541:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB454136FBFB7148C2D63F6EB9EA089@SA0PR12MB4541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rk4AtALiAmY8xJQrCqomCPPDgaB4ZiV5IG/Xqi1d5dG8BQ0nQ6tQDmaKyd4DE3/fIcwJ5QeRX+f4YmeqyH8a3HdsdFjh7TGP+vVK5TiwYbos4SVzHnfFcUOLmjbTtChQZHMFTB3Ru9B99C/Mi+qC7V9e41sL1CGnEJpsObSLBjL44Z0l+BfGQa+FJXQaHEVV70agCMf8IM9gxnf7xxDLcm9l0Qx9zFgcs5kIpn9PraOxyjFLdi5wVgr7+JiR0qshinN5BdxHqgrWNWQQUFk3DT46mQLIb55kqwZtnCS4NPaA6klTUJ5kGb08GZv717Bz+46AeP1VC/kzByB2BqtHxvlcyDGd1ulifRVRv62L/mARgBqzzbzSeaFDSRhEc9eeAMhFDOl09DBsx6Z8gAh2zHHRhzWsY0r8ApC/TJZP7XvwSOMGOeUs58hi9bRMjVWAc1IzpXjzh0WHh7I2W8FDlZSfwEW9b4gORsflbyOLPtd5BCEKCzcLobH+oewYXTKKRAENG572xyIbANkIxGiAlXXG9Nz6XVtQDnhk7XAc+hxkqXsAlwFr28+1n73MYKhancyVGwLspsrcm8z+nCiNMp6SsIFMEs+FyEFFBvQWlccnVqn2h316sNCJAK10GfyYyNvhdxvC/zp32tHHgyr15Lrb/7PTehz39A9KRiNY6gq2IvR83JRxMpx2ypjjiBB9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(83380400001)(66574015)(38100700002)(54906003)(6486002)(31696002)(2906002)(86362001)(478600001)(316002)(2616005)(44832011)(8676002)(36756003)(16526019)(186003)(31686004)(53546011)(52116002)(8936002)(66946007)(4326008)(5660300002)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjRidmQ4S25hU1hCYmRUNXlZMUcwdWROeHprRWxQUEUrUmpIQ1pCRzVkaXc4?=
 =?utf-8?B?Qm14bGlSVjBVWWxiZGhZL1NYRzc5aWlvU0IxVmhzM0wrT3hZVVp3TUQ2WkRp?=
 =?utf-8?B?dXZuTC82QVJVMXJOb1E5MUN2bEZySjNPVEFUUDdPNzdXbEozWXJiMklYdGxi?=
 =?utf-8?B?MllVczIzQ3RudnQ3b3ZBaDZrQXI0YTFyVzhWa1RlcTVPY3V3dlN0enhHUjRO?=
 =?utf-8?B?djZudm5HTVJ6MlA3dUk1OTFGMVdoeTRZdUNmMHBxNXN4N3Z5YVFOQm5PYVJQ?=
 =?utf-8?B?U2YrS0R1K2E0REowdHpHbDBUWSs5NWVNVzBFb3FHYVBCbEZSbkhQOG1ZZk44?=
 =?utf-8?B?OXZHNWdRaE0yYk9KenRXZCtOdVdSUnV5S3pCV3p2RE1WNW9hY09PUWtWdExG?=
 =?utf-8?B?OWIySk53UGlZKzEyY0RjUSt6YklxWUU3YTBKeWdjcFp5ditSNTkzNkFIMXpy?=
 =?utf-8?B?Q3NyQ3QrM2psK2JhcUVQcEp6VHBNNGQxa0JQVVZZeXo1VzFVRzkyQW5KcHhC?=
 =?utf-8?B?VGxndmRENWdpZDVlR1p1ZnliS1gzVWFJTDBaeVZ1ZVFaMG51RzlRQmV2OGln?=
 =?utf-8?B?amUyQml4T25vNE5mcE9lVWNTcG02bmJrSjg4Slp5UTlHMGlEUkd5b1NPcERB?=
 =?utf-8?B?Z0hueEFZVk05Qy84eTFpaTd2MlkwcDRpd1BxMW9jTmFIY3gvZEJXUEU3Wjhx?=
 =?utf-8?B?Y3dLOGMxQUd6TllkTGgvNDN4M2RJaWx4QjJVdVg4MmFKbk9ZSWdkaEd6Q04r?=
 =?utf-8?B?VkxwM0xPTFBFcVlET0Nsd1ZrZXRjcVBydC8wQWhiSWlBSXlCOEloc1N6RzJh?=
 =?utf-8?B?SVhubEdoeHVnSG9WRUsrM0Z2SVJ6S3VpODQ5cm5aSzRDcmJ5RnA0b0Rhajlr?=
 =?utf-8?B?T01kdzRReThHL0Y1elZkYjZ5VzVPYStuczB4TkpnQkpVVjF6bU9DTkMxc3E3?=
 =?utf-8?B?bFNhb1ZLTXFIcmliNjFPbVlFNzNyQ1lOM0pESzVmd0VrYWFvM3doR1dqbVBC?=
 =?utf-8?B?WStUY0RUbEg0QmUrUG5ZYjczdm5HVlNyUlJpUS9FTGdYZ1FZek9BMDQ0T0Jr?=
 =?utf-8?B?RFNoTXpYMzFYSHM1N1dwR2U3SnZkQzdJQjBvYktnSTViNUVzdjlSYmU4dE1k?=
 =?utf-8?B?czlnb091ZjExUzNtaWJUQjRXRFV3MytiTnZKbnQzb0NsS0dhbVJTTTFDdmdL?=
 =?utf-8?B?aHJTdm82TWt5Uk9iL2VIaG8zVm9NeDV0YmtYZ3IvMkJtL2QyL09TRDhBSVM5?=
 =?utf-8?B?bEpKdG9yM1phcnFTOG9va04xbVFiZGRMd2FGSGlMcUNsMFpNbDdmdThjS3N3?=
 =?utf-8?B?TlFnRlhUZFhIeC9Ea2RVUU5DeFdQSVpMYjlDNTZuNVBlVHFramI5bmJ0dEc4?=
 =?utf-8?B?Y3FubGZNNkNjVkdZZjFHR2RmWUgrYXBKREtIUTN0Rm9QcnpPbFJVc0RaR0Uy?=
 =?utf-8?B?ODZqV2FTVC9jaXg2WGw0eWlpUDdFTjBqZGVtTFNBOUV2MjIzbGgrV29KWnlR?=
 =?utf-8?B?TlZ5N2lNbGlwbjkwdXZyRlpvOUNOSXhYNGZpQjlBS1JaS3djQXF6ZDZPK0di?=
 =?utf-8?B?VzN5MTRvU3JYUHUycUxuZ1p3ZytrRnhBSmVIemxOS0NYelB4c0dSQnYzR1J2?=
 =?utf-8?B?WmtEQmpHTFF0Y0YxWjlwSkJ2R3phbGQvRUJRdlg4TlRlQm0rWkVwcTlYVnhl?=
 =?utf-8?B?NWJFT242R0xoZVI0enFwRERPWWY2RWY2aEhUUFJxbHZYanBGaGhBQ2lqbk0w?=
 =?utf-8?B?U3M0c2JaUHd1bEdtZmI0YkRQMnowOVNTTVRNZGxQQU1PdWFBTW8rWGZCRmtY?=
 =?utf-8?B?bURxQlNVTGlIajlERWlaN0lkRTJuRWk2ZitYaWI2cEVtY0N5bXRoT3o4enZx?=
 =?utf-8?Q?/GO7uS7gMozlF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fd083b-23d5-4fdc-6585-08d9367a94e4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 19:10:36.4080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8dDv39wU1bdCLP5sBTYh4YY/yIF4xePkFWxFGhqn1dUTs497GBBH77ZgLgdGPB89hOdxCkoKopBukDQpkAvZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4541
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
Cc: "Olsak, Marek" <Marek.Olsak@amd.com>,
 "Christian.Koenig@amd.com" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Nirmoy.

Pushed to drm-misc-next.

Andrey

On 2021-06-23 2:18 p.m., Das, Nirmoy wrote:
> Tried on vmwgfx and amdgpu, everything looks fine. I would have love 
> to do a kfdtest as
>
> I think kfdtest does bo movement tests but it seems kfdtest regressing 
> even before this series. Trying to debug that.
>
>
> The series is Acked-by: Nirmoy Das <nirmoy.das@amd.com>
>
>
> On 6/22/2021 6:23 PM, Andrey Grodzovsky wrote:
>> From: Lang Yu <Lang.Yu@amd.com>
>>
>> Sometimes drivers need to use bounce buffers to evict BOs. While 
>> those reside
>> in some domain they are not necessarily suitable for CS.
>>
>> Add a flag so that drivers can note that a bounce buffers needs to be
>> reallocated during validation.
>>
>> v2: add detailed comments
>> v3 (chk): merge commits and rework commit message
>>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++
>>   include/drm/ttm/ttm_placement.h | 7 +++++--
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index db53fecca696..45145d02aed2 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -913,6 +913,9 @@ static bool ttm_bo_places_compat(const struct 
>> ttm_place *places,
>>   {
>>       unsigned i;
>>   +    if (mem->placement & TTM_PL_FLAG_TEMPORARY)
>> +        return false;
>> +
>>       for (i = 0; i < num_placement; i++) {
>>           const struct ttm_place *heap = &places[i];
>>   diff --git a/include/drm/ttm/ttm_placement.h 
>> b/include/drm/ttm/ttm_placement.h
>> index aa6ba4d0cf78..8995c9e4ec1b 100644
>> --- a/include/drm/ttm/ttm_placement.h
>> +++ b/include/drm/ttm/ttm_placement.h
>> @@ -47,8 +47,11 @@
>>    * top of the memory area, instead of the bottom.
>>    */
>>   -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
>> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
>> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
>> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
>> +
>> +/* For multihop handling */
>> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>>     /**
>>    * struct ttm_place
