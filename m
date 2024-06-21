Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61998911E7F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 10:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E3810EFDA;
	Fri, 21 Jun 2024 08:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p8sb+ADe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD6910EFD8;
 Fri, 21 Jun 2024 08:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7CT0ls01QasVQwfkaMB/e/Ni3mmpbAfC4an+miTPzhRZmbpxEvB0UFwZeBkv/8WVQdnXZds062ftb948bilOgTdGZGzwhx4C3AvMk15SzjnbC3UxTIfafchiS9bZpw+AIAWwjGCwO2cvmVQhwto6r7A7jQG4AX/CWNQo8QgP2Hr/gN9MTqP8BxbQ4AEkaxB0l8ySJRz83RrJxW1oZORzjOMfM6FAnWguQ8u6HYuySkmLjXmTeaqrp2xoYhFZIOKv3fFQfePGfNVST27iz2JftU80Z7PrDJ1gBTuz1P+Kng3XsZ9aNTo5OHL6GauZcaC2adBtZZUC0MNvZr2ePfpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/89r6vaiJgNIDyO58H+ymKZ93uv1TUIruF8rVTbJjU=;
 b=dxCmRjR5k3s3+WnPTAoWQMGS0PuWW7Ng9/8VkFGrxUHwAXQhAOdp+oGeSG/ap6ZYBtUBfN4eheiXc8xciynfWibBWdNZsuMvXeWmbPJAJsVzkRyVGZBYI52UydFP0tBh+a4WlLyrueYHVceiJ4ksmW8LHMwY25mbfmHCQm2bINEKg7Wse3mXRqEyGucbX9rhX4YEtbDGH7Ej9Lgx7JtoYSrsBhAM346iK/ZUkz0vzqWWNmQ8oYM/RxC1XizREx9GxBXdrpRfvZVDWuNRmN42bLlFii2U95cbwKWaR3/axzcoiVNSvZYu16Ajn3/XUjrtvAZybCzo0ntQ5alauf1Lpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/89r6vaiJgNIDyO58H+ymKZ93uv1TUIruF8rVTbJjU=;
 b=p8sb+ADe3HRKGyeoWOoLqATkzHaHtqpCBQJCs0FZTGMrzH6i8yBLRwO7Sa6iStG2HjOmVGH+WJOBXIto1B5jIANCOHp1PM7kQXuSF0PER9G2Xr8AdCQa6XmzyW0Jlito/iYZkS1nPboRA06tXuEU5seGodtK5INL0saf1JTScJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.24; Fri, 21 Jun
 2024 08:21:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.023; Fri, 21 Jun 2024
 08:21:40 +0000
Message-ID: <d5540c1e-aa66-40ad-ba7c-3c70d3ab3fad@amd.com>
Date: Fri, 21 Jun 2024 10:21:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: Unmap BO memory before calling
 amdgpu_bo_unref()
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 felix.kuehling@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240620145238.25295-1-tzimmermann@suse.de>
 <20240620145238.25295-2-tzimmermann@suse.de>
 <6f0d5bf4-1cb8-491f-b5aa-119dd6edc6d9@amd.com>
 <52f25080-4c56-45cc-b8e9-2ef4910803ed@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <52f25080-4c56-45cc-b8e9-2ef4910803ed@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cab9f63-cc4c-4604-315a-08dc91cb2d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHlsMW1TTURSVGpTT3ZLS0RMcVRodXYzVG1ma0dqci9MbXMrZGlOR0wvSkcv?=
 =?utf-8?B?S3BKbm1STWtKcGQ1UlI4VnRSM0JTa2JYNmdmUWQ4eVByY280VExRQW90RUZC?=
 =?utf-8?B?aEFUdUZoQmdibnhwRlkxNEU1aXdNd3M4ckFVL0VyOTY1QXhDMkM0N0NQNGlh?=
 =?utf-8?B?ci9UZTduOWI5bDE0MHpQWldrNmVnUHhOZit4bytQYkxhL3ErSGR4NUUrNlVG?=
 =?utf-8?B?Umk3N2hpeTRzVWc5d3FsTkNOS1RuTG1FNXZsYUN2YmpnYjU2NDRmU3N4cFFO?=
 =?utf-8?B?aWM5ZEhLb2pwcmg4Mm9KeTUvSjYrK0ZiMEtUeUYxSlF4eWEvbCtzL2JrNzVz?=
 =?utf-8?B?WnZOZGxMTlVKVzhxRUdUdUd4blVBRlFvcDkxUFlZMndhTDEvWjFFQWwwVnUy?=
 =?utf-8?B?WGszVVhxMlN1TWZjRmJjVTVBVS9rcDF0Mk5Oc0paUUZta28yWTVhcEp3cGUz?=
 =?utf-8?B?b2haNU1XUEVZeGRFQkUyMXZsUWtYTjJjNURqendvZFlWL2IzdU1mdFlvSzR4?=
 =?utf-8?B?b1gzUWRCcmlWUE9UZmk3aHl5OUFWYjdTVERJYkd4aEg2cXpNaFcwOFNXay9Z?=
 =?utf-8?B?ditnWWNIM1l5UW4yc0t2VnhpU0Y5NG1OcnZELzFnWGQzT2VQRTZieU9CZTNP?=
 =?utf-8?B?alJKT0t2SFV4NysxS3A0QmpSaXp0SU1rMVMrekFEdllkK0d6dE5Ccy9uaVZ2?=
 =?utf-8?B?c3JsQ3pYRG9kWUdrWDNYUUsva3FkZTZUejBaTDVYRmoyb1lMYlFDUmtLTmFP?=
 =?utf-8?B?QWQ0WWJ3UUlVYngxUWxldXUzRDdSeE01UE9nU2c5TCtGR1VFQkJuaFc3VHZW?=
 =?utf-8?B?cnZETzg5OG9DY1g1dmhlN0xvREFwVllUUWJjRmM4VWpiRmlEaGFDOXNpa1F6?=
 =?utf-8?B?U1M1WWhwTkN6RGdDMW5hdEI4S25PVDFrQjJDNFRLRDRtT0JaOEd1LzA4NG5I?=
 =?utf-8?B?MzBTWVFFQ2owQmp6VkgwVWgwbTc4d29mNzhycEdTNUcyQ21scGdlZXlYWHp5?=
 =?utf-8?B?RWtUQjBvQnlPdVEzSVRJTlQ1NXB5ZmFwaS8wRk5sUjBuTWdUUDc1cjNzYmNu?=
 =?utf-8?B?bmFIa0NiN05Sb1h5ditLUFJyc0dqK21NcW5oV3I0bFJLWHFXZXR5aGFZd296?=
 =?utf-8?B?aG4zZndPRTBOUGc3d1ZyRFBhUkRzYkhyd2c5aE51NER4WmpUbVRCeld2WkRt?=
 =?utf-8?B?d0t1cW41eis5a1hsMUlrZUxUTUJWT2kyaDRXZE4yYnpRRjNpcHJwelhmc2Zw?=
 =?utf-8?B?c3BJTUFsOGRLN05wZ2w3MVNVLzNCR21vN3ZSek16VXVmN1lQazRxVlNuRUZQ?=
 =?utf-8?B?UDdCcmpaRS91YWl4dzZKV3FKQzRXSVpyU2ozenFjU24vRXBzTnVPa3FkN2xk?=
 =?utf-8?B?SDJkS2hsTTNoRGl3R1lqUjQ3NlhCNFArMWdRYnBlaHZPVVBLMC9tMkRod1dN?=
 =?utf-8?B?d01pbEo0aDZZbmQzazgwN3hDVEZBaDJ5aEpRaVJZYm16NitsMlhqelIxUWZq?=
 =?utf-8?B?ejVVbmUySDJKN2lwM1J1WWVVVksyWnhNZzl5cEpUb1RObEE3SnRTV2czVTYw?=
 =?utf-8?B?RUp6azljcDFhWHhJK2J0RmRaSDlFVTBCRy9MMmZxZ3JSRmFYQzBQUi91dDFv?=
 =?utf-8?B?UENtSzhRRE5KQlhsYTFoeDJkeEc5ZkJVZitWRUFaQ0xvdVFZS1pHNk15a1lD?=
 =?utf-8?B?RENKOU5HdE1ydDE5WkdoUVlmRGYveTZXV3JiTnkwTkNrNU4zUjNqSDIzb3pj?=
 =?utf-8?Q?hjrJRRDnIHcBq6ote90UyqWngiUq3rxI1IM04WH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnFNYzdVTDhXOXNqNE5JQ3lpQTgwTk9scDYvYUl4VWVrT2xaZTd6d3l3UmxY?=
 =?utf-8?B?b3p6SHZKeFFtSTd3ejRxRERVTXRwRWp5VVNQbXlkbko1OEloR09hOVdwRmxa?=
 =?utf-8?B?d2tyOXh3SE9uOWxiMnZVVFhLTG40YmhVRVFueWZEbm9FRW1USkZBUVQ2RDh3?=
 =?utf-8?B?WHR3SUc0ZnBRL2JmQzQza1RGRklxZFkyVk1UdWtTQjNrMlY5ZjhJZnhSamRG?=
 =?utf-8?B?K1docmxDSGhiSkYrSGFlR2tscW54MjY2M2ZYZ2l5bjJwa2s2cVNmTEJEa251?=
 =?utf-8?B?SUk4Tkx2djVjRUg1QVlkMFlwb0c4Y3pQdlg5SlpieTR4ZmVBZmJnakYwc1NY?=
 =?utf-8?B?ZUVjQ1o1VGw0Tm14R1lHcEplS0FIdlZGb2pUWVo0TVpMNFczb1QzOEpSblRq?=
 =?utf-8?B?NHV3MjZGY28reEo3WGtOTGN2ampncitkY29BQ29NY1VmVjJ1Q1Q1NENYeUox?=
 =?utf-8?B?ejlkVUMwbGs2OTFTVW9LRTZ4dnRRanRTUEd5eCtCR29ydG5IMTZXZC9JTE5J?=
 =?utf-8?B?VnZWYlZjVjJDUUNqUVUxeTh3UEZaMy95bjlibFh2VWhRS3ZpWUxhTGZ5WE9m?=
 =?utf-8?B?WHkxYVcxZ1MrSmRMd0VDbFFMUlZGUkNDaXFkRU56K1pHNUtXcjNXVTJHRy9u?=
 =?utf-8?B?T1lVWGtPN1hpbERpcUZsR1VaREZIeWFSU1pBU0lNZ2RqMVF4RGZHc2NpckNl?=
 =?utf-8?B?SWJGT3o0bkZvcVYxZU05SUNva1JZOU1XMko1ZGpjZ2R3VHpod0VUOCs2UFRx?=
 =?utf-8?B?NWEyY29yTzN5TG02dFM1cEdFcUt6cmRTTmVJQTdBaEx4NDIyNms1NkxhSXlG?=
 =?utf-8?B?QXduVnlHRlhxVUt5QnJSNFdkYy9Ra2NMVEozVEk4dEIyZHl5MzhRWmQ5TjB4?=
 =?utf-8?B?dzRKYTJDVHA1RHFoWE03WDJNS1pGK0J2T2RHam9sYkN4RUdJYTNwWXFtU3VS?=
 =?utf-8?B?bTNNUHl1Y0FFWTRYczdrQzIzZ29RVUp3N3NWd2NzWm9jSzYwa1NXUzlDUDlG?=
 =?utf-8?B?SXJkK2wwY3k4aU03cG9xbTBGMUtxMGpUZmFDcWloSWFXYzN4ZlhDQzdQY085?=
 =?utf-8?B?UTZIeENkcUFqQmNBMmRlSWI0aS9iWlc0a2lZak5BdWpGaGlaeDIyQ0tpSXNX?=
 =?utf-8?B?Qy9xdlQrZ2NKNWIzVUlUV0pJeFdpdGVFZ01CeFd5UThpNllpbWVPYnRnWURx?=
 =?utf-8?B?VVlZN2Zpd1oybEE2OXU2d1V2M0FLd2ZFZVM3M3Q3WWgxVVErTEtVQnorVWM1?=
 =?utf-8?B?RVlRN3l5STI1b2Z0alI2ZlBIaFpYd04rcC9lYTZ2VVFDOExmQ2VEQlFiOG0w?=
 =?utf-8?B?SkJ5WHZjdzFONUFWVGE5ZEFFOC91a2kzUHdNZ2pCOVRkZEkzbnJxYmdKbVF3?=
 =?utf-8?B?cEdod0t3TllnZzJhS2pqMjZhcjV6SWMrdFFSMVVFS3d6UVNGUExJdUt5VUZC?=
 =?utf-8?B?OFMyQkhVZkdzRVNSQWUvUW51RHd6RzE4K2RYUm1JOE5ESGY1eG1sYml0c3c4?=
 =?utf-8?B?N2V5Yzl6cEY2VmhLUGdEL2V6K3JRc2FpNWFURDhQNFNxTjFTa1JVcjN4RDBr?=
 =?utf-8?B?UEtodEkvTVkzdis3blhSM0FZdW9lMHdFcFdxUmFkUmVsSmVHdmpJTlRGQTY3?=
 =?utf-8?B?cG5BWThEK0hyU1A4b01MTEc1MGtCR2R6Mi91Vm9jNXZ3b24wRy8zWEgyV0VJ?=
 =?utf-8?B?cmpITVFLUmZwRE83dXVFcEJZbDg3bFNjd2NTUFZiQkh6SFpSMElhQ3ROUXkr?=
 =?utf-8?B?MytEcjVEemZnMzI5Y09tdDdGNHR3bTZqMkkrSHFuU3hiS1lGUjI2aEkvU3Zx?=
 =?utf-8?B?QnNTbmVJZG5pOUlpUmoxbmNmVk42TnZHaDE5QXBqb0FwZGZNenp4K21malZR?=
 =?utf-8?B?aTF0Mmg0Um13OXZ5dm1INEdURVNBYUd0VWFzWHhOaldZai9qVmZVOHVCbGdx?=
 =?utf-8?B?Vk14a1lLR2NNRHBBcVpldGdQM1JMOUJRSVcvdGV6UEVzYXhMNjNmTHE0UERl?=
 =?utf-8?B?bUxVeUFnUVdOdWZrYnNvcU1zSW9XVFdReE00MzcvRFA0V25maXJkM1Ztbm0y?=
 =?utf-8?B?WEI4ZFR0TTM2VTJkRWdVeGlxZlJaZTZTaFVxK3dtZ1VTUjZ5TFptckhyd051?=
 =?utf-8?Q?h6SHIrsH2ApnKVKMaOo4JEwco?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cab9f63-cc4c-4604-315a-08dc91cb2d2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 08:21:40.3477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbG2pcl/e1QmBEEHpo/TAMKcN0+8ThE7HDdn+e72XaZNnKw+7hfnSudGmaagqD+D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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

Am 21.06.24 um 09:32 schrieb Thomas Zimmermann:
> Hi
>
> Am 20.06.24 um 17:50 schrieb Christian König:
>> Am 20.06.24 um 16:44 schrieb Thomas Zimmermann:
>>> Prepares for using ttm_bo_vmap() and ttm_bo_vunmap() in amdgpu. Both
>>> require the caller to hold the GEM reservation lock, which is not the
>>> case while releasing a buffer object. Hence, push a possible call to
>>> unmap out from the buffer-object release code. Warn if a buffer object
>>> with mapped pages is supposed to be released.
>>
>> Yeah, I've looked into this a while ago as well and that 
>> unfortunately won't work like this.
>>
>> Amdgpu also uses ttm_bo_kmap() on user allocations, so the 
>> amdgpu_bo_kunmap() in amdgpu_bo_destroy() is a must have.
>
> Is there a testcase (igt-gpu-tools ?) that runs this code?  I've 
> tested these patches by booting and running a 3d game under X11. But I 
> didn't expect that to fully cover all cases.

You need a hardware generation and use case which needs patching or 
inspection of IBs.

Video decoding on old SI or CIK hardware generation should probably do 
the trick.

Regards,
Christian.

>
> Best regards
> Thomas
>
>>
>> On the other hand I'm pretty sure that calling ttm_bo_vunmap() 
>> without holding the reservation lock is ok in this situation.
>>
>> After all it's guaranteed that nobody else is having a reference to 
>> the BO any more.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++----
>>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index a1b7438c43dc8..d58b11ea0ead5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -58,7 +58,12 @@ static void amdgpu_bo_destroy(struct 
>>> ttm_buffer_object *tbo)
>>>   {
>>>       struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>>>   -    amdgpu_bo_kunmap(bo);
>>> +    /*
>>> +     * BO memory pages should be unmapped at this point. Call
>>> +     * amdgpu_bo_kunmap() before releasing the BO.
>>> +     */
>>> +    if (drm_WARN_ON_ONCE(bo->tbo.base.dev, bo->kmap.bo))
>>> +        amdgpu_bo_kunmap(bo);
>>>         if (bo->tbo.base.import_attach)
>>>           drm_prime_gem_destroy(&bo->tbo.base, bo->tbo.sg);
>>> @@ -450,9 +455,7 @@ void amdgpu_bo_free_kernel(struct amdgpu_bo 
>>> **bo, u64 *gpu_addr,
>>> WARN_ON(amdgpu_ttm_adev((*bo)->tbo.bdev)->in_suspend);
>>>         if (likely(amdgpu_bo_reserve(*bo, true) == 0)) {
>>> -        if (cpu_addr)
>>> -            amdgpu_bo_kunmap(*bo);
>>> -
>>> +        amdgpu_bo_kunmap(*bo);
>>>           amdgpu_bo_unpin(*bo);
>>>           amdgpu_bo_unreserve(*bo);
>>>       }
>>
>

