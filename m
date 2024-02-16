Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A4D857C00
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7198110EB1A;
	Fri, 16 Feb 2024 11:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EVRJB5si";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D8410EAEB;
 Fri, 16 Feb 2024 11:46:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHmkFKQ89PeHHVazKJFE1F9ekLqg06M9EMKUZnX184XxGnpGN7NiDlORtDQkd+XEBYwkDp0tWPVgPxY1CP6aa/+K8ht+AeozgfgcFhJ4U0r/ziDwgQMhiMr28cy1RLwlxHdV4oYr6XWI3tNJZP25gAfnDkERJQsTn/qZPzzpyTmX6ePYN2F8Y4Y78NuG58bv6eGWBhrt1X4c9aMBd9Ue3wKT5IjeRoJlyMEoYJAuW8g1AjdYh4tb2geE8vV//kxWI5uUrqkpxSVswscu+na3YTk6/aWy/I0/qgh1mjiSrBbP7VJrzpFJ/h3FYnb2ZX9bGfsVCVWT6vCXdOGvatKdzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWj2WzzwWwc3d2qt4i/klhuPY/eQCUQgcy6jjl//AJc=;
 b=NRYOWdOw80gwfheC7uSmtLRafgf8FQBUFuDv+ByoWweyECj6QOb4E4KC1GJMJnnFZjkqlNikCYLuojRq+NIIQbfxJGjhcxQt9HhJmBhUSEjMqwaf16eXgQ6lRtfQZVx6KjPzwUQ+qQdjd7EEpDb76bP6Gj6colKHekqaLXGU+15oKOqm2ThKjEiucKi3Hz/9L7Ll9kapBo9Jg3StbWh0m3WX9o0F3Ko02Xiw94D//GV+S/czrp2H+HNcUVgY6IxOOByBA/iHOKiBBHYh0qEolGtNFk5DbQTciTLHs/e918xCNeOoBiXmA1jfD9Z3Z2yEbuetyNxqY1EMPhhmN/WZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWj2WzzwWwc3d2qt4i/klhuPY/eQCUQgcy6jjl//AJc=;
 b=EVRJB5siRH/UOI4QKYRTJrwqcP5b4xqEmXztBoWtEESFWTzTPhHPDvKQsZj7BUxOhYghM6tCSYZ2kqiOr11qzIYNs20Y4DtDHvAA3JiNLh+qFNmt3H0l4lN8xbxxOmf5vnfY2ucrXnT0Z3MrmMrF+mR/wMMEQYAKPEbs35EsCMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Fri, 16 Feb
 2024 11:46:38 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6%5]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 11:46:38 +0000
Message-ID: <210c7dbe-7357-47f0-a40a-0c82c3cd96d9@amd.com>
Date: Fri, 16 Feb 2024 17:16:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/buddy: Modify duplicate list_splice_tail call
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com, spasswolf@web.de, stable@vger.kernel.org
References: <20240216100048.4101-1-Arunpravin.PaneerSelvam@amd.com>
 <bb158180-c354-458b-8aab-bb224bcb3fbc@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <bb158180-c354-458b-8aab-bb224bcb3fbc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::23) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN0PR12MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: 92337b0b-6ae6-4373-b37e-08dc2ee4ef46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i4CgoMbvfgvHk4JB3m2+a6OYCHb82MDbuEFV+BZfUiB59JBI9nGGEhPKpaCB093iUUb7Yy8Lw/2CM5abXLT+PcrR9BKP3Kq7JYeuy39R6/43vcKNLpjCnn8a9/f/6Ckdr18d8vLvGG4YoBrxnBMzxzv8fz4DcEP42Ubvsm4F3a6hKPodNpJwFRbxWt/fXjQpbMvjGwyA4/qShYva3+cPO3CMnSURMj0pXa+B2rU4fw9u/5ffg9lq1FJXzbZmoU2F4Ry0MUh8LkshLnmBLjy2xG/HNfKCxsuW1qfsMk//0FfCk2g/39WMZ8r5q8FEBF0qCPSxwKxovT22YGluU9yDXjlyU00V8DtOhtWsCUL2cpzbv9aSx14DzbO7PqlzT2Zt4UNEDY7CoPZ/P69M44R1WzDIJSHvG6oZ5hcX9edqHsOauNbkRWkNge3p7/ituz/qxajI0O+u5ZvOhs/koZwxCmgh0f/qTFgXEbxsYMUkEaZC5Kemy1RcMq4qEB0/HpFTAFwnBWUnETBjZ7uECkhnAmpBbnBzSViq2/X5I7SzrGuiAm0j2p+H7F5pr6vKzx0r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(6512007)(478600001)(53546011)(2616005)(41300700001)(2906002)(66556008)(5660300002)(8676002)(8936002)(66476007)(66946007)(4326008)(6666004)(6506007)(6486002)(26005)(316002)(31696002)(83380400001)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDJUaFhLK3RGbjhGS09pak5wQ1U2Tm9JV1orTUtqUmdFd3l2V0Q2eG9TdzZO?=
 =?utf-8?B?aCttUlBqejg5KzlzRXh5YS9QUUV0T3ZxK3VlSG11TVFzZ05DY0VjWkNFanUy?=
 =?utf-8?B?a0c5bHYreDREdE9lNkJUSWlKdlh0UXQyUXJ3T1p0REVCOGxOQzBNZExBaU5T?=
 =?utf-8?B?RHB0MGZ6MHRwUTEwaXMvWGVXcDRvQ0w0WmluVjZJRzgyNWhCTFNIZzMvYnBS?=
 =?utf-8?B?MlZPMHgxenZndHB5SFd4VTV2b0lnTVBvRGNFdkNmWjB4MDZXS1o1K2VCd0pw?=
 =?utf-8?B?ZjJWd1M4bFM0eUtLd3AvMFJpQlZtSXFNTDFHNzB2RmtHNThvcDlMNlJaYmEr?=
 =?utf-8?B?UE14TGZjL1poaHVMNWxYNTlwc2NjR1dZZFBBVjZLdmR3L3BnbThudXRvbTQv?=
 =?utf-8?B?dkNvNkhuWm56aXdMdE9vWGdhRU4vNmFmQ0lETnlQVzBmTXpYN2tSTmJZNGho?=
 =?utf-8?B?MS9jTjNFQWtCaDBSalBXbzdoYXcvSCtWL25RZmlIcTRVVjdxOXo4NWJ3UWdW?=
 =?utf-8?B?OGN1L1FsOG1RdEhJdnJvZ0xGMTBuNjVMUDd1ZWdIMCs5Q2ZlaVJaT0ZQUzM1?=
 =?utf-8?B?ZWIwWnNKb1VuUzVBNkE3b2d4cnZGaHJ6RER6cUtoWEkzQXcvMkorWU5wQ3E3?=
 =?utf-8?B?b081cHR1R3Q0SzdJaDFmcFo1ajEwVGY5T1k5YkZUbWZTc09UdHhGSlFQYnNS?=
 =?utf-8?B?aTVXVDkrTFJ6QjZxV1JrQzAyN0E3a2U4NWJzOEpCbGZ0dVliWk53QVJqWWxy?=
 =?utf-8?B?eEhsaVp1UzdQNjZySmk0Uks4M1crZnJ1ZTNLQmNIcEVrSnI0eTRuS3daZ2NN?=
 =?utf-8?B?eWN2TlVSaFdwTDJEZFlGc2NWRlNUNjE0RTBQdWM5Rkd6SlJwaFZpc3Z0MlNF?=
 =?utf-8?B?M2RFbU9PdGZ2c1N1L2lWZUpheHpVTTJpdElINll2WlhVNlJOYUo3QVhpUFc4?=
 =?utf-8?B?UWVaSklwVHE3L29KOVZaWklIK0RucHcvZkF6MUF0cm5pVnNFNlZ4RFBxSnNm?=
 =?utf-8?B?QitDRjRvMENjUlpKMXdIQzY2WElqelRhblRaQUZqVlE4L3U0M1VlRGZnbzBB?=
 =?utf-8?B?VjNWSTFvenlKSDN3cG5zdGYrWjZvMXJDam5vekdjN2hMa250UDJZSXBsUmk3?=
 =?utf-8?B?eksxM0dlVUdLazZQNnJwR3ljaVpIWlA2Z0toazVoZzFjTldGSU5KN3E3Z05D?=
 =?utf-8?B?NUNjd1JEWWpLUVdNNlU2dmNldnFiMHZZRi9IYVh2NDdsUE1GcW5sSjVOay9D?=
 =?utf-8?B?T2RtMzYwKzhzSVZSQjJPYlY2WFdSSzY2RXJOU1JhSU1WdDBtK3JuVWdkMW02?=
 =?utf-8?B?ZGVWZlVpUHJKOXV1ZUIwUVEzMlRDeWY3VEJDSzFFeTd4blJHQnFXcUN2Wk9K?=
 =?utf-8?B?SFBLTGdCcmNscm1lOFd2YTg0VExRTTlLakpWUDY0d2prMEExV2hLZHFodWZx?=
 =?utf-8?B?dEdzN1JxV0N4WkNIdThvcHNIeHpXTjJOZjhSTDlORFFDbmVnSTFJMDJLNnI3?=
 =?utf-8?B?TlZydjRsUElYcEV1WjlDOEQ4V2NEMnNtVVdvRk5ibnVWU0MrTCtaMm5LdE5w?=
 =?utf-8?B?M1RYZ1NEZ1NJQS9ETnBIOFBOTm1zbnlLeE56d210eFFRcTJLYnVtOHF5ZW05?=
 =?utf-8?B?UCtIR1piV3BZWThkRXN1U1RzbjBLUWxMVXF2U040cXZkV1ZqOXE2N2FjNHlF?=
 =?utf-8?B?bWxKQTIwMjM1WVl3RG9ScUh4Tkc5MTN6U1ZtMys5UzlBcTg5WEl4QjVReGEy?=
 =?utf-8?B?Q2szbjlKWisrbWNsOVhDRGZ5MFhYbEZXWjN0SENsWWxybGtjRi8vN0hrNnhJ?=
 =?utf-8?B?bGxSME01UVdtU09KR3N4dWtycU9kZTVBLzZKUWdGWmJKZVI1WWlhTXZjZjVG?=
 =?utf-8?B?Wm1qTHBZdVd1NzlLYklHYTA5KzNZYml4b0xhWmVhNlBNYko2SWFBb1EyM3NN?=
 =?utf-8?B?ZERDUUNtMnJOam1EWG0xTTB0d1lmL3NIN09NWDF3QjVPZHA2aHhocWNVcXFY?=
 =?utf-8?B?WlhQcU5DcUl6K2VrSG1ZbTBtSThTcFVybUw3R0tTYnJwcWR5Z1ZaL2hWb1ZV?=
 =?utf-8?B?WEJhY0hUaXV6d3M5ZFZhcm1XRmtzY2ZNR1hqaStUWi9oNUtLaWdxZFFQVjdv?=
 =?utf-8?Q?Bjnj9tR+/jmZMOV1Nk9L1Vdkn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92337b0b-6ae6-4373-b37e-08dc2ee4ef46
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 11:46:38.4568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9fuSh4HQlQxvxuvxzQa+DHHMt3m8No5udoGj8PYP75/z5zxOVAsZMino0qQs785DkNdFaUZdqmy0MAY2vRlsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293
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



On 2/16/2024 4:41 PM, Matthew Auld wrote:
> On 16/02/2024 10:00, Arunpravin Paneer Selvam wrote:
>> Remove the duplicate list_splice_tail call when the
>> total_allocated < size condition is true.
>>
>> Cc: <stable@vger.kernel.org> # 6.7+
>> Fixes: 8746c6c9dfa3 ("drm/buddy: Fix alloc_range() error handling code")
>> Reported-by: Bert Karwatzki <spasswolf@web.de>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index c1a99bf4dffd..c4222b886db7 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -538,13 +538,13 @@ static int __alloc_range(struct drm_buddy *mm,
>>           list_add(&block->left->tmp_link, dfs);
>>       } while (1);
>>   -    list_splice_tail(&allocated, blocks);
>> -
>>       if (total_allocated < size) {
>>           err = -ENOSPC;
>>           goto err_free;
>>       }
>>   +    list_splice_tail(&allocated, blocks);
>
> Sigh. Can we extend the unit test(s) to catch this?
Sure, Let me check.

Regards,
Arun.
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>> +
>>       return 0;
>>     err_undo:
>>
>> base-commit: a64056bb5a3215bd31c8ce17d609ba0f4d5c55ea

