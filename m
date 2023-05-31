Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF657183B4
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 15:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A2E10E4DD;
	Wed, 31 May 2023 13:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C7410E4D2;
 Wed, 31 May 2023 13:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io+Tkzxo7AdKI7kY0sFu/NAYIHhFvWyXtekNUsiOLigomw37/FErruaylMjzgc8PDDzdC/RtdoyHEVbvptfP5O+sItk32go9zEd2pSKFZdRf4nnRNgmr+i2JdcP6N1/C4sGWwI16xw1fEWflPTDX6lGbED9c1BD4E1PkAoDVKsumK27B3kkFhYZdQVcet2oYQ1HRcWRL3HC2G6Q4VKE7YrsNh4vuJLliUDT5I10Zwz3ZNdBbFEnv3N17u6Xf2EXbPPR0kDxk22a+t3RbMflI3HH6Zinm8MwQJvdvqroMgbRl4zNjGIKvV+r+2DKg+R4rmOwiVgEGKvnd2izHJxGwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRCBBWJwymw+MyXODcwHmMJ5QTppJZCKZ+etKs6u2YE=;
 b=J+ZKDVVn1fybe3KdBg/F1GhifxxCd8lk9sLseCI3w7pBHO4Z9o+KFVe5o4pkN/8c59sE2NNfvtMoLLU1xZePSCwAjJXwIfQqSPu43X/qxyuY8aW6F7xwOIAU0Y5jWj0RU2OQsu618xZhF17oEAgDyLCR01fAb0nDJsgfcmE/FUZzL1SSUOiLAOSEsKBoklmD80ZD5sZlBncwVmKdX4kVNlCLNkQRcwgGmCbfVIOAaxca95/Jah7yyhfQEcSr2jxCbkSk791KSrpybPmuxrXoVh40VbUheaPf4l9Q6jJvIsSh6K190fV9LNAFwCb9dXhTOjREwq/NXoGvWtmx7u75/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRCBBWJwymw+MyXODcwHmMJ5QTppJZCKZ+etKs6u2YE=;
 b=OK4FpoQl7bjyGNRobXESPSJ9Xc9Hg8BvnvArAdw6giUEwGfB9uf6Wk4WE/MQnyjKpp8Kl2bWP7EUb6/fNleRAQ2oxPDkCxyLS+I/BWd3rcsMl5/Dk7wE574oM97Q/5uvA5rYt9PQHoCu0zRqLLnAZM9LzKGXMWGL/BdD9PkBDgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 13:51:45 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::cdf:2ed1:1f52:9f65]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::cdf:2ed1:1f52:9f65%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 13:51:45 +0000
Message-ID: <ae769b5d-b08b-7fc2-56ad-49193ad0cf92@amd.com>
Date: Wed, 31 May 2023 21:51:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] drm/ttm: Remove redundant code in ttm_tt_init_fields
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Chen, Guchun" <Guchun.Chen@amd.com>, "Ma, Jun" <Jun.Ma2@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230531053051.3453509-1-Jun.Ma2@amd.com>
 <DM5PR12MB246916A813942FA00CBF5978F1489@DM5PR12MB2469.namprd12.prod.outlook.com>
 <e03d9463-4594-9c33-c773-15c22d2cad83@amd.com>
Content-Language: en-US
From: "Ma, Jun" <majun@amd.com>
In-Reply-To: <e03d9463-4594-9c33-c773-15c22d2cad83@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0198.apcprd06.prod.outlook.com (2603:1096:4:1::30)
 To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|SA1PR12MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ce2ade-2e21-46e0-46a2-08db61de2bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LrfGpM1CEw/H+AoakyvW8dWpNXZRsyoZF/3rDpT9VH+aub9FOMr7+xkGOsaCcNmuMJ9nKMmK95Lwsp3e9EFAH4V7pUA73fUVlEvrA/i9dfx4Tv/O4WTWJp5gyb+/8xF+xhDx5J2sWl7LFODcutj6xMPRuTUVgjUQnNhojTX02BP9kXM25WeSSK0o04W2WHuFpElMlKDH6ArnIORIjCLstGgR8Vk+5nfM0eRi9l75a+naB0H4hv7/vJo39/11I82wqR53PlDPXPTwkXQ4HMY37UCTqzSM5z0Nxe2yY1Ivm6l7pYXEomMWrX/PwsqriAxVCWkobieMMewg2r75bGiQYyIVJqL/4g2YmhMGEauhZHMOynPHaXD4AaISs+/tjn3SURxqOJBuI45u7mPn0R3I9Jt4ZHmhL7U/orhoF/msZ1gRdbhsK/IY8QpS7QMvbj22iDBuJLdZP65F2xh+z2IYqjAXOIYQl1Xhdnx8UxV62gyp1bjkQXespohTbvL0cAsubMQJPSsCAMzfZlpc92LqkzCm9lKfpfCLFVNOtwDCVsdaXiBNEW0RfrdqBCdHJpN8ae3v+jOHyIDdh92mNKZDgdDoZs3WPVWLWsIqlaWb4YHmSsxnbJLcRdtDQq+lXZM+WxW26G+eavvWUpejua/TGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6351.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199021)(186003)(2616005)(38100700002)(41300700001)(31686004)(83380400001)(53546011)(6512007)(26005)(66574015)(6506007)(6666004)(6486002)(478600001)(110136005)(4326008)(66946007)(66476007)(66556008)(316002)(450100002)(5660300002)(31696002)(8676002)(8936002)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHJ6MVUrQktGVHloUjhWL3hNR2dYcnFOVExiSndZRXc5RjRFNUk3REtzQVdH?=
 =?utf-8?B?ejMrUkxLMlJFcGI3UFZUbTA5QVhaQ2pkUzEycGdQVEpvTnhxcU9oMXk0OUNy?=
 =?utf-8?B?YjJ4dGlLTlVQbkR4TENudmZ4dzI2M2ZvQ1NheUsybjJ5d0pMeFl4WW43eG9r?=
 =?utf-8?B?OGw5ckM1dFZtRE9LcFY1dU01blNSUHZtV2F0ZVJKWE1rNkFxZENRU2UvMXo4?=
 =?utf-8?B?eW9vT1A1SkQ0eXBuNVVmQm53OTlQMXRBL2ZJWEFvZWFBbXZwVHlVSThZN1lE?=
 =?utf-8?B?cVQ4MzhGZDBBc0VUNHIwc0dJMGI5dFJFbWdjQ1VReERnSVRqRXF4dXZxVVJz?=
 =?utf-8?B?OHBLWlZSSkxxQml3cWwxTG02Tk9XMGpzOTk0dUROMmprYVhpcGFwZ0QyeW01?=
 =?utf-8?B?S0tCaHp3aFJnd1dLVGh1TkpVZDF6ZFovZzNzYVlRR0J5TFN2a0FQaTc5WUd0?=
 =?utf-8?B?S1RKa0V4cW1NTDlVR3RvRWo2RzBOS2ZxZ0tTWUxOS2t4NUJjeXQ5UDdYR0ps?=
 =?utf-8?B?WVBuK3lMeG1KS0l3Q3NySTUxTitraTMreXRsOS9QVE9OUVB1UVg2WWtQendE?=
 =?utf-8?B?M2xrenpVUVNpTXlDeWZ4Sk1pRnQvMzY0bDBiUnNMQWdZMUNHN1d0T2lYNm1s?=
 =?utf-8?B?SWRWTThKNUZjU2gweXJldFJFOTdmNW5WTnVBdmdLeWIxM1J1L3F6cHVPOEpE?=
 =?utf-8?B?K1RoZmlUZ2s4VGRCRjVUVjdUZkIva1lkVis5NlpBeTFMdXJ4QW95SjZhTmdD?=
 =?utf-8?B?SWY3cFJkSStUM05LdjV5SmFsR2ZBbjR2Y0FveUM4WUc3R1dGNC9CV1ZmUnd1?=
 =?utf-8?B?ZmhYU0dObUYySEhTRVhiSFBlZURvUG1zKzBpWFFPZEVpcHJrSlgyaEI1SGYv?=
 =?utf-8?B?Y3A5TllneXBVV0R3b0YydDM3WGg3TmNZV0c3NFlEYU43cUxpWFA5ZC92Zjgx?=
 =?utf-8?B?Rmw2dHhYdzFqQnhXTUtNQWRNL2xiQWNPQnpBb2wxQ1NYQlMvSUVPMWRpRmVH?=
 =?utf-8?B?a1VsWWlJZE1SeDFHUFcvY3A1bkRVTG51QURBdUQ3VDcrNDBkRjdISjdSSHh6?=
 =?utf-8?B?ck9TNXNENCt1WU0vSnkvZkh0Ti9pdmFqa1lkbDB1NzRjWVZWVFptVWpxQ0Rj?=
 =?utf-8?B?NEpwOWlMd0JhMjh1WTFINXZqZ2JtVUxWOHFUQzZucXFMay9aZFg3TEVmakhw?=
 =?utf-8?B?ZnRrVGNqamRpQy9Ncm00OVp4b01TVnd4OUZkV1BNNldJTS9LU2ZrNHdSVi9Z?=
 =?utf-8?B?OUw1VXZaVUhrN1VXNHhwRzFGZmJxMnlEdis1cmRHWEMvOEFzU0RGZHZydExF?=
 =?utf-8?B?ZjAra3NwRk9ISzhxZjd4bWM3YnQ4eVhlYWFteGNoZ2V2QnZoanoyUkFUZXhR?=
 =?utf-8?B?TU1wV3hHTXF0bXNyWXZxaU95Qm5nR1dHUHlaZUpmbmNNT1kxYzNNc0lCeTlU?=
 =?utf-8?B?eEYvM1JDZ3pGOVc5UTRRc3VRQm9HaVl6VjRRdUZQTWRRNGcra2k4eS9mL29m?=
 =?utf-8?B?ZjhnNEZDRmtEekFMUU50MzdEVWhiZU9OVnJuOUt6SzlSeXRKdHlrTmRoelg3?=
 =?utf-8?B?MjRWMDFHRzlZZGxjNE11MXVCWDZBQ2hCakFoc2Fqb2xLc3BXenUzZTQybU5p?=
 =?utf-8?B?bm1QcFA2c0dKUUdpcGVrcit3cjRqTVBzREppb1NjM3AyUG52bXVmSzVBVDk5?=
 =?utf-8?B?WXVDSTNvQ0RPTUpjYStXWGpNdlJjTCtHRWYyY2NCWWxvV0RZOXhmTFREZTRr?=
 =?utf-8?B?NjVheitaeXV3NnFtdy9mZ1JaQ2tsZzcwYmNDNEVEU2UzR1pEOTlQYktVcTVa?=
 =?utf-8?B?NXA3N0VPc1BLbFB6bFJXMnphUWhMdmY5WXpFSSt5OEZBWTE5c0dyUVF4YVVL?=
 =?utf-8?B?eWFCMm1OSmZURjBWUHR4K0Z1VFRsN3BxaWdnaEJyOXBLYXJjbUFUa3d4QXZ2?=
 =?utf-8?B?UFY3eERtdGVtcURYaUdVYmNLVzdxZkVVVk1mME9DUlBnNzVQRFpQUEQxM0Ny?=
 =?utf-8?B?ckpLanhBL2xXNU9JRWxlRVB0aGU1ZllWaXYrN0hGUU5ncEdEcUJaRGs2ZkRC?=
 =?utf-8?B?VTZDZEJjaFEzVExRZU5hT3IzNlhKVTRkNU91VXNPNUN0a1o5REp5TWlaM21Y?=
 =?utf-8?Q?UiOtsJrEBUVmyvSLSQU+CrF9g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ce2ade-2e21-46e0-46a2-08db61de2bbe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 13:51:45.2234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDecdrwMM/f/fk3khKd9lbdqif23mJlJvbGfSLVrqTYvrwpbuqZQ+U/0q4jJPIiO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/31/2023 4:45 PM, Christian König wrote:
> Am 31.05.23 um 08:20 schrieb Chen, Guchun:
>> [Public]
>>
>>> -----Original Message-----
>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Ma
>>> Jun
>>> Sent: Wednesday, May 31, 2023 1:31 PM
>>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Koenig,
>>> Christian <Christian.Koenig@amd.com>
>>> Cc: Ma, Jun <Jun.Ma2@amd.com>
>>> Subject: [PATCH v2] drm/ttm: Remove redundant code in ttm_tt_init_fields
>>>
>>> Remove redundant assignment code for ttm->caching as it's overwritten
>>>
>>> just a few lines later.
>> Please drop the blank line in above message. With it fixed, the patch is: Reviewed-by: Guchun Chen <guchun.chen@amd.com>
> 
> Seconded, I'm going to pick that patch up and submit it to drm-misc-next 
> with the commit message fixed.
> 

Thanks for help.

Regards,
Ma Jun
> Regards,
> Christian.
> 
>>
>> Regards,
>> Guchun
>>
>>> v2:
>>>   - Update the commit message.
>>>
>>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_tt.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index 02b812dacc5d..45a44544b656 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -143,7 +143,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>>                               unsigned long extra_pages)
>>>   {
>>>        ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) +
>>> extra_pages;
>>> -     ttm->caching = ttm_cached;
>>>        ttm->page_flags = page_flags;
>>>        ttm->dma_address = NULL;
>>>        ttm->swap_storage = NULL;
>>> --
>>> 2.34.1
> 
