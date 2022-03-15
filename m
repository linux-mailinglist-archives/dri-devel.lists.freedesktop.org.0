Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959FC4D96C0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 09:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2511A10E8B3;
	Tue, 15 Mar 2022 08:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49DB10E8A2;
 Tue, 15 Mar 2022 08:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOjHV/H8jO3Odariovg5MG2SPnzaMNnrKtqg1ZZuvsDaC106SPDgbfLVxdjbAnp1G0GGHy1PPG5qus50fX9k7+rDEXCoYJIraOP7+85ONXU2MOFFk5hTIlXapIKzSONYescDlJfGpXDOm/WVfFW+hqNlyseIxCe8guSlOwcwcNNonu0i9HFD8tggK+1ueCkRbtmmjzFbrxwEOTM6Fi6ldB9rpAYed4n9vFRzJvqya3m6/YwHfDvD7PUz7fa0OWGTVuUYWa1XRnwiwHkEl7AMWm54tx7amp6jZP02PEt46CmASeD7tNPxD3tDOfqvPJokTaNfHE0T2KKPmalnFf1/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sk3qkCKx+s21WbGF3IPRrqZsDSJAecSzF+N/UhmLnhs=;
 b=V+slYuSMxHe1RAd/Z5sBKExiVeUGdPY/utz+JdAMu9BQcefmF3DiBXIc/tBZgcy2UkJntP4uBkB7P8uKHhWAkO/vYwVgVdRMfF5+aN10k2uNNip1EO3eHaQPUq5xQ5zWsNzurc+eEcaiYFkWuVSnBFtxlnnmZUOM0Rrv8XJqA+lWZB54KuayM1RzW7P/AtvP8I5D1h21ketSnpTnSxgDgGhqctznySAYu0Kn50z5ChNcm2NyxmRRIlYkyBWCRIUr9u7sWGuZyHqmrhCCnIF9TAULoaEDq/m5XU6gwtePQLWGblhmYoIu2hlhgv3fQYUElMxp4LmcWBqAdPLswVE8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sk3qkCKx+s21WbGF3IPRrqZsDSJAecSzF+N/UhmLnhs=;
 b=sXamLcpT2hC5F36jNH1k+f505BtoL3tgBHOdK7JFwZ9cPj6mj1Qk6C0YActOl2UMefISoy0mjNZP5L7Xo8PtfbmWEDhS2xLcXOvNEq9cOtc0gm7KSn+JAEDJFWNVrH+1a2ADpCXKHXfvNHrTKtNadqPuF5I7bJIk6HsQLMenHHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Tue, 15 Mar
 2022 08:51:01 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%5]) with mapi id 15.20.5081.014; Tue, 15 Mar 2022
 08:51:01 +0000
Message-ID: <1e410ba3-60d9-6a09-6a5d-625145c1c80a@amd.com>
Date: Tue, 15 Mar 2022 14:31:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220314194049.534471-1-Arunpravin.PaneerSelvam@amd.com>
 <0b9a8cc2-2f34-48c9-7960-727615eb2edb@molgen.mpg.de>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <0b9a8cc2-2f34-48c9-7960-727615eb2edb@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::21) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9f4a384-9f4b-4222-9659-08da0660ee18
X-MS-TrafficTypeDiagnostic: DM4PR12MB5916:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB59167CCE4801CCFF20BC5226E4109@DM4PR12MB5916.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5uHmuxACvboJ65ohxqMoLI1ckYILM0ZvCj5WzmfJZC83BUaqt66jOUzSscm0ZOx+5II+eJFjVeXQ9I5QFMo/Y2XR0B2fK68PU7LOYPFZzzguMoDSV9djJhIXGG67y8VSkUNhtirxgliYWhxBOlcdC/QJC8en00lzla4+iHfASW7kpzBz9S7DP4bLxm51zUc/xbzyX32ijRMF3q+pnj+jNsT2MXXgWnNr8n6yJ1vJLECtYF19OB74yXMzeUsil50raE0f/HuvPb87W3dF558pl25rk8ZyyWeV+DXwwI0JaPQdnAqtbUkyKxxxvFVlbWgsVPOLlsBlGMDFfZqet/A/84qrZm3nBXUAQn54ixctR7NV93pojPJctM/UAOfnp3tWbBC2hrr9DgvAvMA2GnPdmiLVJTucEgOwICu2VABZ9+3sdQ/7Ng8JgZFWBxG5/apak1WYzRKGJQJqrBczF9lx4Vi0ObaMjb2tsrD0ClsY4+EDAQ2mYb0zcYd8WQikZtRIo32tUC8qaQq587pKggsVsu3MZSuiy0BE+0lXKLNO73ajXGg1Z8F4JoN9I+COWE1YoNHV17Hkf+ry9kVXpFLMCcYZyQavBZTNcOo7sXpV9zinTj2r7+1JaqkRimtNZFoXkO0S6rTWlx2Uf9D6oHLtXiTgQAoEpmwRA9nI2oTSBZKanq8fClG+WKzsAoJi2MXBsoKWnkly14+TpMl7zUuuIBO5s3paAnUAufC65klaUow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(36756003)(66476007)(2616005)(66556008)(508600001)(38100700002)(2906002)(6916009)(31686004)(6486002)(316002)(83380400001)(31696002)(6666004)(5660300002)(6512007)(86362001)(4326008)(8676002)(66946007)(186003)(26005)(8936002)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3JHOG11ZVJmOEZWRHpNOHN0SlBCMWZPRFRpaUc1V3lhV0VuZERDbjQyVHBZ?=
 =?utf-8?B?Nmh4TnowVFIvZCtYSWRITDRIMTBzMWpxZVY0UzN0eUlDVzVNOGQ3TUN4NDh5?=
 =?utf-8?B?TitaYjg5UnQ0bWsrNUxJR1ZRVFVVNEFYSHNpbUNxS3BRc2xBVGxMR0lLNWNv?=
 =?utf-8?B?OWZLeVpML0tzTDV0eW54UGdJemZUaENVY0pEZkdheFRlZmptZEFtZzhZVUdu?=
 =?utf-8?B?VXM4ZHMwMkwxcDI1YThRWmpwdk9HUUJ3NnJLdUsreEpjNVN4U24ydTR2dlVv?=
 =?utf-8?B?d1VqSU5iUGVUcXBiSE0rMm5iS3JhTGkzMXg1U0hvOGN3YkdaT1Q2Vm5sTXlM?=
 =?utf-8?B?R3V6a2ZOSDl3S202NGM5bnZlSTRiQW1IVVZhSGI4NE1zazN1QVdhWFZnYUMy?=
 =?utf-8?B?d3dHK015VUhZSDM2dlhINzVxdEFNZ0liVXkyZVc2bVRhUDB3WUFnRGtVekRt?=
 =?utf-8?B?a0l1UlhnTTg1b1BDeXRpa2xYdVRZUWdMVFoveWVWWE5hbVUxTVpVNWU3Y0VP?=
 =?utf-8?B?Tkl2YnNpQk9SU0kraWtzUEhCc0JpODhYZzMvY2h3bHljV3M1Y3FMMGpHMEpB?=
 =?utf-8?B?a2FwQWt0UllHQ1orRTlZT1lZMlRqaEhXYWpvWDhIWDRVMnFORzhTck5rU1dJ?=
 =?utf-8?B?Ym51akRwOG13LzUwWVJJbnNESnNDUDZ5OUNoMVpZcVI0VGZNUkZHdFBFQ1M1?=
 =?utf-8?B?dXd6aHM4b043eWpqeDFtSkJHMjRnRTR5a2hicXBBb3JHWHY0TUFDRmx4Q1Bi?=
 =?utf-8?B?VngrRnZvWk1WbEpDallMQXJIbkxsdFFObUlaRWFUak82Uk5mQWU2aXE5U2ZH?=
 =?utf-8?B?OUtXZThIenRmYW5PZFk3ZDlrczF4cmRwakQwNFlOK01CTjJ5dVJSRktWdEZz?=
 =?utf-8?B?VlJsb1Buam1LblZ3M2NsY2liSnlvV1RadEJQQzZBVndkSFFBaThRdGlPZmVC?=
 =?utf-8?B?OFlWZ2ZHajVLVGVNclB3Q0VYZTRkSWthVTVENU9HZkFGdFJKcTB4OC9INVRN?=
 =?utf-8?B?TXc4TXU2am9TbVFFcVRyVEU1NTdOMTlLT2U4UE1nYm4zK2dibks4MkV2YUdZ?=
 =?utf-8?B?dlg0bFN1NGdZOWc0L05uOGRYVHJoUXR0Z0JWWkMzWUJzazlkaG1xbkVRK1dv?=
 =?utf-8?B?L1V3eGk0Y2k2dFl5ZFJGblhiOFk5VkVUeWl2ZnZhL3ZzbWhUUjZxZ3FzVDk0?=
 =?utf-8?B?dE1tNHY0d2xncXRGMm5abi83Q1gweVUvL0p6Ynk5ZDFndDZnMHZ3Q25OVEtx?=
 =?utf-8?B?OFFwdFhaTURJai9iVFZkQUJ5QmJSM0NaMkZjOG9GbFpyQThJTEY3MjhHZzJH?=
 =?utf-8?B?SjlNOWxiYmpoTllmMmJEM212bTloM0xCbisxMlprenFudG5CaXZha3dGRzdS?=
 =?utf-8?B?UG1HRHBWaERDMFpvN21OaG92NWxFd0lFODZmYVpLQlB0K3FQQUd6NXAxZ3FV?=
 =?utf-8?B?R0ZRZGRnYjJER0xua0h0eGtONURjbjN3NFNENHJBWW9FNXZoNlptZWRTUlRi?=
 =?utf-8?B?bGQ1TU1DbjU0bE9ldHVjeGhwN0VYQnBJcVA4VlphTTJrOWF2MmNucmsvQkhK?=
 =?utf-8?B?d0tIWFhXSm8vdGswOWQvc05reFN0Z3NJTHdxZFBubFhLNlRjUlRyMG1JbjRp?=
 =?utf-8?B?TUNzV0VnZU1TVVo1dWJHNkw3LzFLOTZPdWF4QUdxeUx0VUhSU2lmbVZMYU5P?=
 =?utf-8?B?MDFEZTJIeVBlOHArTUl6OExjTXk2OE5ka21VMHFVMkdwM2tkS05NbXBqbnRv?=
 =?utf-8?B?ZGZNUk50NFREUnJXVmN4eFU3Z0MxMmRCS2JBN2xTem9NbWZSK2lHVC9ZTnNR?=
 =?utf-8?B?NjNCV1liR1NBN1ZqWVRMY3NsT3FieFpzZUZGMjVFWlZLeFpEc3dRaGovYldw?=
 =?utf-8?B?OGwwRUkxMVpKanJqWk0rcVRiTFBmRCtOVnpBNnlySjZyRGhEdEw1bTh1NlQy?=
 =?utf-8?Q?aJbFGQZydBeo4Ao1Z3s86sAg7xgoASg4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f4a384-9f4b-4222-9659-08da0660ee18
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 08:51:01.0530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uyBn+VWY3T5jkunGiqLudAb5QRd4XIctBEiGmk6X3kJEuO/7Mywxh6JjsfnaM08xGQkfPYsSABcM+iyhunM1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916
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
Cc: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/03/22 1:49 pm, Paul Menzel wrote:
> Dear Arunpravin,
> 
> 
> Am 14.03.22 um 20:40 schrieb Arunpravin:
>> handle a situation in the condition order-- == min_order,
>> when order = 0, leading to order = -1, it now won't exit
>> the loop. To avoid this problem, added a order check in
>> the same condition, (i.e) when order is 0, we return
>> -ENOSPC
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> 
> Please use your full name.
okay
> 
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 72f52f293249..5ab66aaf2bbd 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
> 
> In what tree is that file?
> 
drm-tip - https://cgit.freedesktop.org/drm-tip/tree/
drm-misc-next - https://cgit.freedesktop.org/drm/drm-misc/tree/

>> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   			if (!IS_ERR(block))
>>   				break;
>>   
>> -			if (order-- == min_order) {
>> +			if (!order || order-- == min_order) {
>>   				err = -ENOSPC;
>>   				goto err_free;
>>   			}
> 
> Kind regards,
> 
> Paul
> 
