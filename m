Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AB2481F43
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 19:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB7810E832;
	Thu, 30 Dec 2021 18:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDC810E832;
 Thu, 30 Dec 2021 18:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4ZwhSrNjxGPAWYQfEzXVWJtoyScCbBIMp6VQeW0Lm0DHMXhfUSDBGrWzD1Fs/2v5tzUShk567dgGkuXaBlazzyt54Qd8OR9YEfwvUgu5jrNIwGYjRiUKl9PGAs1v4LM2DBa+YdMqsOVHzB33HFehWW8UNIHhQ2c8GQGyRJD9nSTriSWl07zOk/DsX9+lmBHOJXk+TNF41Oah3yqI4qEo2l6yWrszBN6nMqdFc9Ae8dODHMvTjV82+QKLOHU2dxvxOcVA3Vy7rs1VDFW7KDJ4capFYuV4Sdm3eQTzfdV8HeaWY0H7qbpbMe8WMG3UrcVl5VprnLpS0ib6bmvdxMkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF7ETeWcOpRMdtXqok2ph65h6EImd84WVfDgb3HVFh0=;
 b=GRY2GXmICZcwbNAoitzsCJeeozxiabOSMHc5D+B1sKKjNwaZmXf/AzR7SvXw2HakARHEnnV4llROSub+m8n7UR7GV0RMWbw3rbo/TS6IVt7elwkzq176cCFIvvokDTSpf99RBZVxMQxy8YiIVbmzR3TaG5Z90am0oDyOiyr1+Tqb4V0AhAOrtNquS7fZxi8bkc4FcBnEr0hg6mZsZ0uQUmOaa7/8JOIlhHASyYqGwXUl1QoiMZ48BqbUCZdnd689gmWZnujPqI15yAKiYVadCkqsMqzAmUxQFALg+PqESjclbx7AW/1OEQUeb7FgKgytcPImN3iYA6NSIliYziYYGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF7ETeWcOpRMdtXqok2ph65h6EImd84WVfDgb3HVFh0=;
 b=zcCdd82hkFdkaguhX+GLwrcSUR+RQi1/pXcNkKNputh/NQEiKeA8Ugvbln88ZeSidNMahymvVrJRUrTVvYmLs9/sJcBXPjx6lPViSfRvJQoze8dcw5GHoKbd54f+S/eOASwfcUCk0N/9Qcm9SQgsWw2myg2iRBq/gTrITb7ILnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Thu, 30 Dec
 2021 18:39:29 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4823.024; Thu, 30 Dec 2021
 18:39:29 +0000
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: "Deng, Emily" <Emily.Deng@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Horace" <Horace.Chen@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <136bba3f-6040-5f70-7fc3-593ec80a5f02@amd.com>
Date: Thu, 30 Dec 2021 13:39:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::30) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d69b0416-4aa9-4e33-368a-08d9cbc3b691
X-MS-TrafficTypeDiagnostic: DM6PR12MB4282:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB42825C357DBD2817534F074BEA459@DM6PR12MB4282.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4kx6lUp/Z4XWVIptjgEwKZJ8d13lZ5XOfTOAwsVCwaaY+Ehif1j/iHL6yV6+/SXSkt2uKVFYiZoSM4cIJBGOeMnehQQ5D82aSmmDD5/OJKv/AcyQdKC7XXV+Yp6zqhUynpwkjQ0G+LG4rHvUN4u1C1oZ61baccEVHoV4BHa96SQQXGowBXgqdqeCEh9/S1CILNJlry7bY3+od8iWTUCPTfwV3PImIKEOuafpg0slB5cnbpUJVHdojFwnvIsdNR2+AYCHqZHZaBgS3e6sn7NLvuHXuzzbcIwNFsw1wD7MROavdaBXVT/8OVACkzqLoCYuTrc92kvtWBBxQAecBioBYtgTnEKSTsnMSLTjY6lamJ7gKnhc8kPu0VYp5ITovF+BLXVD6j2IrCoRPTKrGZt6Kr5oNYkonC1Swo3JAFrMMKKDxVAquDrzeA1O9C4CWd9lB0DM2doDZpiZKN2Rg7s7hnTl4LMS0XEx3639nfx7LyhYAAQUXvqVtJTMn61nePvRG6LfFa/hK1KHFxgeD9tKbwgTPcD1QcFzlUx9eGbDFUCn8dhSs/fRK7nZ6xPprTX/K1cKqZ6+a7d6Y57b5wh/ShQhlHpVJ0rRJaV0syze2yjBmCrEmCEgwAGPi0Dht+ERFZDSS8weiWLL+ETe7+AFohW60f8AauX2bac+e+8449NxNoCSKKgygMVR2OyRLkFsV5zOB6/0gdGw4AvhAcbRzk8sJTuTFhvqxtNj8GO5ZtnW6aePT2ikvcuTE/XsZ9dx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(6512007)(31686004)(110136005)(36756003)(66476007)(66556008)(186003)(8676002)(6666004)(86362001)(66946007)(6636002)(53546011)(8936002)(4326008)(6486002)(5660300002)(6506007)(2906002)(4001150100001)(316002)(38100700002)(921005)(31696002)(2616005)(44832011)(83380400001)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTRVNG9oRGoyWjROdkFtdTVhSlM1eDRJWWxCY1VIUEQ5OXU1eDU1eUJJLzl6?=
 =?utf-8?B?Z2tVMTlpOGpobDVJbjR6NmN6QXppaWFGbnc4ekJJelM5bmNlem03elY4aHEw?=
 =?utf-8?B?QTF1SnFxcFMxUUNET3BiV1l2QXVLeVdQUmJOU1NKN1RFVExkVXVWcm5SS1Ew?=
 =?utf-8?B?TEhNbE5keFNGaDFwRFZBU0t4L2FqYVNUZFd1U1FSTEovOTl2VXcxMWFuNjlo?=
 =?utf-8?B?LzhLeWRqN0RnK1k2azRDQUw4elNPeW5mZXhXWGxLSGkvSnBGWUlsd3pqcVhY?=
 =?utf-8?B?dzlpOU81dURQa2p4L3NEaUNNRzJZaWpETENIR2F1NWt0RGpGNE8wNHcvT3Nw?=
 =?utf-8?B?dHhhbDYyM2lFY2pvdFFvWlZOdEZNditxTk9QekoxLzhWRFJ4MCs2RjJQRnlk?=
 =?utf-8?B?YmloUnpBVDg4bEhiV2ZCNWRwd3FabVVQVFlRT1BONHJMbHlKTHUyRktOVmRB?=
 =?utf-8?B?Zk5SMVF2bHdUUzRmZHNLdC8zeFkrOFcvVHMzRGlPV0ZwSkIycnhPZW0vSWE3?=
 =?utf-8?B?V3l5aWtUQjEvMEhqK1FtMXBUMmhxWG5mai91a2xOT3l5VmlwbEdvcE9DQzNp?=
 =?utf-8?B?VVNBdGpVUWU2MGdFc3JiWndrSmdTMHV1YUVUWmZWN1kxSmVUVERTQnZITXNI?=
 =?utf-8?B?ZUNqam5Kb2h0aGNyWGpQcDMxNHc4aDlGZCtDSkhxOUdLY1VQWVVLdHZaOEdw?=
 =?utf-8?B?aHg3Y0FnanAzMnd4cU9OVnNza1A4bWJYMGRoeEZybUxHa3F5NHE2NXVGZ3V2?=
 =?utf-8?B?T0svbUNjWEFFRHFReEpHRTVxMFltakFITXVuOG54bVJMbHFmSDlIVjhyNHRE?=
 =?utf-8?B?QTJpVThzZ1pPNVVNODZKTWVSdEg0L01HKzE3eko4VjZ2bjlsb3gzREozYXZ6?=
 =?utf-8?B?OTZHUThHdTcyOFRmZ2ZyMWIzTUZXUVJCd2MrdGxRL0JxdjFqci9uSHJiNFdU?=
 =?utf-8?B?Uy9QT1k5MStQdTZQc1plNHZYdndYVEJPMlB0ZWVFMGh3WGU5RHIxRmRkQnJq?=
 =?utf-8?B?Yk54TC9yL040WUM5VFdUWFF1cWMwdEFaNkdxWkp2RkszSEgzSGdBbFlhNnRw?=
 =?utf-8?B?SjU4Ukxoa0VuWmgzUWVlZXdzZ3V3SnFwTHVuTGFIbmorUklzVnJLMTl4TkxR?=
 =?utf-8?B?azJuWGdWeTRVT0Rmd1lrVEpjN3l3Y2xTOEhYVDNtS1ZBbFEwYUlqcUhMUVJV?=
 =?utf-8?B?alAvMjhPZGlTRzM5b0dJRGhFWHU3cHJ2VExjTmkzOTVNeW1lcUZBd3AvdFhK?=
 =?utf-8?B?aUl6cUIvZ1JHQVFudXNOYWxYdndLazFSUC9DUHVmbHpOWEtTWWorSzFiRUty?=
 =?utf-8?B?UjQwOHVRcWg1VkV2N2phelY2M3QxS1VIYytUV1M3UWFuTk9JUDhlbmZBZjVm?=
 =?utf-8?B?dUJLd0NZODlTbXYwc0ZvY256VHZtNUFvak9WbUJ2ZXY0WTEvb3QwZU5GWWht?=
 =?utf-8?B?bUYyc2w5cnd1WDlpcDFoT2RLWXJDVmJpcytVaGk0YTRnVUpNaTFJNDVWRTJ6?=
 =?utf-8?B?a1ErNHZCRGJxNit2QUhCcWp0VHdoZ0N3OVprOSsyaWs0T2g0L3lGUktUS21I?=
 =?utf-8?B?N1pGS3pNY3ZqV0p1eUI4Mm4zVVQ5NDUyRWlRR0lhd0N5YXU5QURqQkk1SjNr?=
 =?utf-8?B?OEZmOUI3MzhNeHNKSXFLYnJST2hwMm1kRnJ4Tko0TklMU0VZdlc3bDBYOE5y?=
 =?utf-8?B?YXE0ZnpCMzBoVzcrMDNRUDFxTEw4U05aVWtqSUhPOEQ2Vkkyd00zVlpHR2hS?=
 =?utf-8?B?OVc3eTl3c1ZWN09IVDJFY0NyV3BSaDRDUVozOGZHQnlWNHZXTVVha3I5SmhB?=
 =?utf-8?B?SmlxU3JCcTMveGVjVkhaODZJbEh6ek1GenZQMDFZYkpGYkthTDN0UDB0UXhC?=
 =?utf-8?B?c1NxbHFhdWU5b2o4b1VXTVB5ZGtqNDVlSmRYWEdFT2hCcncrTVEwZjNNaEhB?=
 =?utf-8?B?S1Bld3VhK0JkbEtFMzg0amxDN3F3MWxDb0NWUHJqTWY1V210cjlKbC8yL0VH?=
 =?utf-8?B?REpOQmVuOUJhQlU1cXp5ZDlhSjJPSFordkcyQVZzU0ZlbXduRndCWHJwaUV6?=
 =?utf-8?B?NmM2bTV0cHBqWlBvTnNicHRzcmpxaGlEZnFWS3ZRNGJJUDN0V1hzWTA0WnlH?=
 =?utf-8?B?bUhlU01ORldxb0g0LzNTODE0Uktqd3B5M2t4TEl3MjNZbGRWdEdreDFTQzU1?=
 =?utf-8?B?YVZMeE1kczVnay83ZzVqZ0hiNVhsQnFXZnRsc0l0bzZPa04rbEMyTEJXbld3?=
 =?utf-8?Q?ztBouemobOkFAB5dS189CIn1KOu1emRwOifGbrLb0Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69b0416-4aa9-4e33-368a-08d9cbc3b691
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 18:39:29.5416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9FSZgVDb9+ymtoJ04k2BtKAuyHZkhxqdK2FG+jZ8MSLVJXNinq3sf1wycWnfStFnwp9NsOCUjHj5V1R2w9KgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282
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

Thanks a lot, please let me know.

Andrey

On 2021-12-24 3:58 a.m., Deng, Emily wrote:
> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>
> Best wishes
> Emily Deng
>
>
>
>> -----Original Message-----
>> From: Liu, Monk <Monk.Liu@amd.com>
>> Sent: Thursday, December 23, 2021 6:14 PM
>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
>> <Andrey.Grodzovsky@amd.com>; dri-devel@lists.freedesktop.org; amd-
>> gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen,
>> JingWen <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>> Cc: daniel@ffwll.ch
>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
>> for SRIOV
>>
>> [AMD Official Use Only]
>>
>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>
>> Please take a review on Andrey's patch
>>
>> Thanks
>> -------------------------------------------------------------------
>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>> -------------------------------------------------------------------
>> we are hiring software manager for CVS core team
>> -------------------------------------------------------------------
>>
>> -----Original Message-----
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Thursday, December 23, 2021 4:42 PM
>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>> <Horace.Chen@amd.com>
>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
>> for SRIOV
>>
>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>> Since now flr work is serialized against  GPU resets there is no need
>>> for this.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>    2 files changed, 22 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> index 487cd654b69e..7d59a66e3988 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>> work_struct *work)
>>>    	struct amdgpu_device *adev = container_of(virt, struct
>> amdgpu_device, virt);
>>>    	int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>
>>> -	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>> -	 * otherwise the mailbox msg will be ruined/reseted by
>>> -	 * the VF FLR.
>>> -	 */
>>> -	if (!down_write_trylock(&adev->reset_sem))
>>> -		return;
>>> -
>>>    	amdgpu_virt_fini_data_exchange(adev);
>>> -	atomic_set(&adev->in_gpu_reset, 1);
>>>
>>>    	xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>
>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>> work_struct *work)
>>>    	} while (timeout > 1);
>>>
>>>    flr_done:
>>> -	atomic_set(&adev->in_gpu_reset, 0);
>>> -	up_write(&adev->reset_sem);
>>> -
>>>    	/* Trigger recovery for world switch failure if no TDR */
>>>    	if (amdgpu_device_should_recover_gpu(adev)
>>>    		&& (!amdgpu_device_has_job_running(adev) || diff --git
>>> a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> index e3869067a31d..f82c066c8e8d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>> work_struct *work)
>>>    	struct amdgpu_device *adev = container_of(virt, struct
>> amdgpu_device, virt);
>>>    	int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>
>>> -	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>> -	 * otherwise the mailbox msg will be ruined/reseted by
>>> -	 * the VF FLR.
>>> -	 */
>>> -	if (!down_write_trylock(&adev->reset_sem))
>>> -		return;
>>> -
>>>    	amdgpu_virt_fini_data_exchange(adev);
>>> -	atomic_set(&adev->in_gpu_reset, 1);
>>>
>>>    	xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>
>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>> work_struct *work)
>>>    	} while (timeout > 1);
>>>
>>>    flr_done:
>>> -	atomic_set(&adev->in_gpu_reset, 0);
>>> -	up_write(&adev->reset_sem);
>>> -
>>>    	/* Trigger recovery for world switch failure if no TDR */
>>>    	if (amdgpu_device_should_recover_gpu(adev)
>>>    		&& (!amdgpu_device_has_job_running(adev) ||
