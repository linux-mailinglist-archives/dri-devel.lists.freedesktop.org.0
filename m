Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E61199675F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 12:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF4710E11E;
	Wed,  9 Oct 2024 10:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bN8Kmoie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053A610E11E;
 Wed,  9 Oct 2024 10:34:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sImgFw48x2c6anAFI59xLYI3Nyg6YcyYj2p66Mcq7zIEmnJadIzBi6o0WC7uvHYdvC86LPSD/vXRRx9mZ+dI8YtwIGOXqOJug6LnnMKXPG4AjXx442fG39kNJN0gc0GLpps9Ks4seC9247NV6dMVkAbOES3T+7TkK1BdScdpBiNtFVAa0vRuu0UGYa01xSMS0zYvbf4io2Ui+CD7758abt/GlaSmxy28p20MARFFbtlwGsOGh4pGrOPacTJyXZGcOgHRb7G3OZ4fEBq8cNc2QPl1Ms+CnDgIKKs2ZrMyDLjb5BM+bdYbqiJhgwgviIosCxDD3E4u419rwhACiu9K7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEYGj+Rg3ayRYaCyHJMLkbxp+8y+NGqvt0OnbBStO4c=;
 b=r+r5a1h4srdOwLtdZKykKnbtFn6a32aHuFydK8IbPI5g6FXYVRLSQyubv5T57IXNSPvrrFGcWa9Z04djINHUkyysOsNjY3eZT1TlbE9l9GvemKNZ9t1252CNRStKGNF4f4MBOHo961gzHf//xwKbZjZqXp753EvdghYcYSg7UK7mm47Gh1WpERtdv14Ycz5YsOrPDpE5079uejmz/Q+UmpgX36blFOZSYNTHMHEWPpbqTf4DWo3+3C5+KibcdPSCwcsSDAXsvfeZ2exmXsL+r63p5DshhmU+NlP5xjFjiYMp8GEjLFt/57Q+3r3DdrRSU4sVYSvvz8CSoeDUJHN1Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEYGj+Rg3ayRYaCyHJMLkbxp+8y+NGqvt0OnbBStO4c=;
 b=bN8KmoiemSJFpwypBgOtYm1mc/H3V4rX0/flo3Npdyvw7+zXCEv525LxeyydK4nx/Ber3vrfb7PK2A9CovCuBt0/E9/0CeM78k/z82p1FP729fZMdYKJtq3D+0omZvNE5E01hpiAZMEmxG/n3a+2cyThz5Epo7IpE3h3qUnKXVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 10:34:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 10:34:31 +0000
Message-ID: <8588f179-9a69-44c3-aedc-0670ef948068@amd.com>
Date: Wed, 9 Oct 2024 12:34:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: prevent BO_HANDLES error from being
 overwritten
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Mohammed Anees <pvmohammedanees2003@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Wu <David.Wu3@amd.com>, Felix Kuehling <felix.kuehling@amd.com>
References: <20241004235904.8605-1-pvmohammedanees2003@gmail.com>
 <d9a3fee4-bb14-4162-95b1-06177d0a9949@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d9a3fee4-bb14-4162-95b1-06177d0a9949@damsy.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 529c99b2-22f9-4b3a-c0d1-08dce84df571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azlkSEtrVXRCcloyYXJSeUdPQUlOc1pBTHFZME1kVjVWbGsyZFlvUWxveXZ6?=
 =?utf-8?B?djNxUFU0OFdhL21TejRVd1RnSDA4MVJrTVY3aldtK0ZJMVBwMWpxakJnN0Fq?=
 =?utf-8?B?UFhSM2JHQmRDZ0hUMTVBOTRCeExsSStFS0w4ZzZNUVY2cXkrRFlmL1d3bVlk?=
 =?utf-8?B?ZDNqVEVmRm5sWStnQ1QyV2s2K2h5QkhQSnpoLzlRNXJ1Ukx3R2RjRVYyS2Fi?=
 =?utf-8?B?OHd4bVQ5VE12cmhPOGZ3UitrZk5NdjlHTkN4YU13a2pKcnUyUG9hd3FtT1VE?=
 =?utf-8?B?elU5dDFjQ240Z0syQlF1S2xrWlpCbk9LVUNIT005dzU0eWJ2blJ3QVQyQ1U2?=
 =?utf-8?B?aFcyUUlYRTR0bEhLeTA3RHpzOWVFOW5LV0EwaFpXZ0FTTVQrQXFNWDU2YkE3?=
 =?utf-8?B?blViRW5ueVRxVThvSXF6dlc0R2pOaTllY0FsSzhWTUxKbjJpelRXMThkOHQr?=
 =?utf-8?B?K09uQjBMOUJGR2ppcnNDLzV2VzlibmhhYWppU3RWTWl0UHZvZ3VRZ0RrVkNz?=
 =?utf-8?B?MDMzRzJNVmxHVlAyeWl6NHN4dHVzWi96VzVvYXdTOUZjQVhEclE1QkhjanB6?=
 =?utf-8?B?RUFicWYxTmtSNzlpQW1zMlFKWDJiUnFVZnNxb3Z1Mkp4dlpPVHZkcVlyN0tm?=
 =?utf-8?B?ZUd0RWxMQWxhSXUxdHgwbmtURk83R3ZYWDNJeU5DV2tWMktqYUJrcEhHUEVT?=
 =?utf-8?B?OXJ3eGF5dk9hL2lRa0Z3RmdsazNJaUJra1RYSWlrNDBqcVF2dXhkeW0xNTRI?=
 =?utf-8?B?bjE5a2RDQnA4dmd4a0YxSzU2b04yTXdhRDE3Mnd4aVNVWkFUS1ZBaTJuaWc1?=
 =?utf-8?B?YXRQU3hNN0tBeURsaDY5b0djSkxhQ1NBTDZZc0tVL3BNK1lJeUl6TjQ5ZlY3?=
 =?utf-8?B?WkVNREEvUCtPNVFIM3crUFordXMxb2ExVWV3ejFOMDIyUm5ZcGhaT1BRTnZt?=
 =?utf-8?B?SHk3OHRxUmVZTWhYZlBOWFlxN3lJQ0tpUUYvOUp1OGZJMWo0U2w1blhVcExz?=
 =?utf-8?B?Smc2N3VleFN5M3Z3SVJrUU5QTEhUbjBYNWVuZHNXcDdsYVFxQkRzdVd4QjNT?=
 =?utf-8?B?bEdQTUhxdHk4Q0kyQWRHZCtmTlh5QVJnNFJJcjhtTzNLOFJGMlhaUmxielF1?=
 =?utf-8?B?d242Zk4za01jVlVrc010NjM2QWdOd3dCZ1pJeDVpSjQvRHFZYmJjRklyWWht?=
 =?utf-8?B?SzZ4MVhMNEdQV2s0MVhPb1VOSUhNVlFwY2M5ZCtmT3Q0bW4zRWxHQzFrWitP?=
 =?utf-8?B?K2MrRU8xMVg3MFRmVWVlT1ZPNFE3LzhOSGg5VUo4NGUwSEdFcnVqaDlBdmpV?=
 =?utf-8?B?ODg2dXcrVDYzODhPNnYxMkRIR2ZnZWJaVDdEVjlvOGFMaUtMM0tXVVNzOUdX?=
 =?utf-8?B?eTBUNkxWS216b0Y1cGNLZVc2dUtieVlSNHl5RGdJQTdhVmx3TUk2UDJyQUE3?=
 =?utf-8?B?YjJILzk0aHFDY0pYQXczZFljVyt1UE1qU3RNdk02WE01WWR3S01oaEtPOHkz?=
 =?utf-8?B?L3BhdnlyR2JtcmorcW1sMi9yb0ZvanpVWGpYbHZySFlkNlRMUUVtUzMwSHVK?=
 =?utf-8?B?YnVWTGNyYkxXV1NtandNZTJyblh6NWg1OEwrSUNtMktyc2hXS2EzUUN2blR2?=
 =?utf-8?B?SWRiMmtMTTV1VmJWYVdtdzZiaEo5OVg4TDNtcG9sTEdnazVlTyt6Z1gwRU5H?=
 =?utf-8?B?LzlzOW54VThNOCtpWVVneUJqalFvTktxV3BRNHd0MWRZT2FIUWliTU5BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHpobm5QbXJVQ2d4SVpUa28wQWFnbUxmWk16Q0NGdWZTa2tUQ2xQY0JnbmRi?=
 =?utf-8?B?WkYyNmo2VkRlTjhyWjFoTldnT0RDQ2NqTHhYRGRmdzhhL0Z4ai92U3cvUmc0?=
 =?utf-8?B?NG4xVjRHNXpFU1J2RVE3UEdxTTZaRmtHamgyRWJxOEFyaUxML0hxdmsrb085?=
 =?utf-8?B?eFZFSDVoOGcydTVvNXN6eDMrdmZGYmJlWm4xZUdFTmZjcTZvaTQweHkwbXBF?=
 =?utf-8?B?cXBEUUlHUmNKK1FIcU5IaXVaem9BTWNtMDM1UHl3bHNnQ3piOFQrSzd6NHNO?=
 =?utf-8?B?ZzVZVVJsaXplQitySFNLSDBVTzJJRm1BWTQxdS9rdGlnRGJGUVlSMVkxUm1Q?=
 =?utf-8?B?YlFZU0ZFbVZaOU9vdWcxK2h2R0l1ZHhITDNkVC9DT2lsRE5yUlhuV1RVSE1J?=
 =?utf-8?B?TkZ3UDBpYXdRREc0QTZJTzQybjd5bTh4WEFCWTFEdzFjVmIwYk1KbS9US0lG?=
 =?utf-8?B?dkYwNjJxQzhkT2o5aEUrV20vNWk1UG9BSmVUNTBLTC9xSHk2ZC9OZGc2U2tE?=
 =?utf-8?B?ZHliREUwdzJsck43ajRWdUNxNS95UEhQTkp2ZDZzcktYQjB0bGpaNGFZZnMz?=
 =?utf-8?B?UjBYQzlWcWxOMis0UjlPT05IeE5JbUxpVTMrdjdXamwrZjBzaUVpQ0psU2ZV?=
 =?utf-8?B?dDZGRjNaUkRIblh3L1h4UXN3TStFUEZocTVpa3RObmE2dVVJUlFZQWtOQWww?=
 =?utf-8?B?cnhsSDJLK29BazYyb256anI1Q0NyRlQrcVRMeEE5V3ZLVFdNU3pQc1IrS3hm?=
 =?utf-8?B?ZTg0Z3ZncFozakl1b3hTM01NVndoZm84a1VXaWdBSFlRNHU2U09UV2w1ZjNQ?=
 =?utf-8?B?R2kwWDFFSnRCZUNieC9BelZmaWYvUEhOUVMzSUFCUjhleUQ4ZXkxdGN2a0d0?=
 =?utf-8?B?RUZVSWFTY0hGSlZ1dmJtbCtJT25qOEVCKy9QRjAwdmEyL1NkbkpQMS9ZK2pC?=
 =?utf-8?B?cHpVZGx5QktGemMvVjhiQ0xkcm1oeHVoTE5WSnNDd2RQYUlPYnhOQ0YvS1lm?=
 =?utf-8?B?QlZMcmM4eWJ5VEFxWDBwUkNmRmdneVNRRWtKM2dDaDZlZjBBckRRQ0llejBw?=
 =?utf-8?B?M0E4c0xLK3gxQmJOR2JGd3FETE0vOVN4N0l1aktteFlmeCsvTjZkbld3ekhi?=
 =?utf-8?B?MWdDL3JKYUVuRE5nWnhLTklEenM0K05kTWkrbDVzZ2Q1NURiV05wNDBMZVBh?=
 =?utf-8?B?bUJkTXovcW5oZGxlc0hITDlRTXhOei9zM1RuNTZqVXZJK2swUVRNTEdVejZ1?=
 =?utf-8?B?U1VUUndIRC9vOUN6MmtQNHUwUG1kbWhpVGNxbGdYMTA0L1VHLzZoNElVRjZI?=
 =?utf-8?B?dG1NTlNqTDFmZ1hHTE1EcWVEdkNlQU9GWkFiQXJJSjg2aHI3d0xTTDFXQTB0?=
 =?utf-8?B?bytzK1hzWHRnVzI0NTgwVlBBSWwvNHJVNWRqZUdVZktYd0VGVjN5RVl0TGxp?=
 =?utf-8?B?b09oUVBxNmJzZ2Z6YmZHSFFBUW56TXZucENvbzF0UzYzanNlT0IvZHU1K2ZQ?=
 =?utf-8?B?WGdWd2sxZVhYd2RLSUJuMmh3OXIxeDVMVUFGTmJPVEtkNmF6eU5kbmoydGtx?=
 =?utf-8?B?Zm11clJMclBDaWxLMXFaRkprbzNCQzdjb3NPSGVjaFhwdGxpRDQxM24xeWhu?=
 =?utf-8?B?ZCtVek03MTNkRnpaR3dhZUhhRmxpMi94NitnRFZGd0ZRVWltLzByOWwrR2VM?=
 =?utf-8?B?UTd4VFIxYjMwWFZucklJYlEyemdpcWFveXBVa3d6c2h1YTJFdEMyeHZrTTVs?=
 =?utf-8?B?Sms3dGUrZ25TeFBGUVZrR0MveHpIcGNZQ1dsOG5wRzNnMkRFdEYvZytueEF4?=
 =?utf-8?B?clZYWHFBR3RtVVg1KzJaT0ZtUE9jdDJFZWlHaS9Wd08xejI5OXhqTlRTWVls?=
 =?utf-8?B?WkU4a3lMNENGNXlHRkg5M3A5bFVmNFNCTmFzb01zbG4zN3dnQWN6MGxyblVa?=
 =?utf-8?B?MkV6N3prcForMFNxdytYYnlPcXNBU3VoQnprcEVyUWg3QTNVd1ZnbFJsKzcx?=
 =?utf-8?B?T1NXTnk1N1Y2cGNMWWU0dDRxK0xoL2VEck1Kd1J5QnlyMkcwTGVFaUxYOEVL?=
 =?utf-8?B?eC9ycERaQUlMTXNqYlpZTzVuUHB5cUpUZDJod2N4bkh0S0g3YVJYK0lLTXRG?=
 =?utf-8?Q?gNzU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529c99b2-22f9-4b3a-c0d1-08dce84df571
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 10:34:31.0152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uva8Wh3SDSwmxtDQS3CHmIby9SaPsEKn+r7UJOyI1BLqJ5aNjn/5uhc96UyVVeMa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044
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

Am 09.10.24 um 10:22 schrieb Pierre-Eric Pelloux-Prayer:
> Hi,
>
> Le 05/10/2024 à 01:59, Mohammed Anees a écrit :
>> Before this patch, if multiple BO_HANDLES chunks were submitted,
>> the error -EINVAL would be correctly set but could be overwritten
>> by the return value from amdgpu_cs_p1_bo_handles(). This patch
>> ensures that once an error condition is detected, the function
>> returns immediately, avoiding the overwriting of the error code.
>>
>> Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 1e475eb01417..543db0df9a31 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -266,8 +266,9 @@ static int amdgpu_cs_pass1(struct 
>> amdgpu_cs_parser *p,
>>               /* Only a single BO list is allowed to simplify 
>> handling. */
>>               if (p->bo_list)
>>                   ret = -EINVAL;
>> +            else
>> +                ret = amdgpu_cs_p1_bo_handles(p, p->chunks[i].kdata);
>>   -            ret = amdgpu_cs_p1_bo_handles(p, p->chunks[i].kdata);
>
> My bad, I've merged the wrong version of the patch.
>
> That being said, I think it'd be nicer to follow the same pattern as 
> the other checks and do:
>
>    if (p->bo_list)
>       goto free_partial_kdata;
>
> Since "ret" is initialized to -EINVAL already.
>
> Also can you add a reference to the broken commit in the commit message?
> Something like:
>
> Fixes: fec5f8e8c6bcf83 ("drm/amdgpu: disallow multiple BO_HANDLES 
> chunks in one submit")

Yeah agree with Pierre-Eric and also please add the same CC stable tag 
the original patch had so that it gets backported ASAP.

Thanks,
Christian.

>
> Thanks,
> Pierre-Eric
>
>>               if (ret)
>>                   goto free_partial_kdata;
>>               break;

