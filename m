Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F9448A411
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 00:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A975C10E442;
	Mon, 10 Jan 2022 23:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FFE10E442;
 Mon, 10 Jan 2022 23:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYTlgSMvgX1ficAHeSXsVGLKClgZpHBQYM3+9FYiWNeM9wEBuGa0OP3bosb51eOF/nDVXK+PbEQhhpYJ1ufRC8ZECUxgpCqZTYkEWlJ7ekI6/p8hkNMdBbiZrwFmV8ukccJ9khVOyjcc3WE4btWSc+fLSDthxcs3cLylzM0uFhJHwsL24caMcnuvCJg5mGc+3RDfdAJ1nFrV7Q6u9yaq6Fs3M/yyCTYy5WGkagzUYiJM2EYbv7A9IKNbKi0YFwL/QGxzSYzjF4qoTmqlbRox5+dpPPNQIlAwERX6w3z50Z5q/TvrO6Hqd1Q7mwgsH9EPyx91PFFY0YwjWglgmOlKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gfHuKpmZcPcM+w53wAUPmTZPBiSTXSl/UZygZofhs8=;
 b=UIlyQ6TO8eXIQAi81Goizy68tbWq8KVP1Qq2MKdKfziDNFr3WSC3MuqJtFrEGfN9adKGjTCyQeUYmc8vhqAt7W22W82aDMxcjTPjSYbw6KM2kBWHoPgTlNReYNQ1AmgUwnCQqyy5eEaJpfLmbmUEEj5ICiYgvLNpcW4q3iF2vd324iQMSInA4OJo5dgWTcwg/yZyzMzG2ldSSoFrqUSwfm+/DtsXApBj8rBgR9ciTHQ3hTaXmkRwdlMRs2hSJP3MOioj9I7nzbEGZI2w30u5zi8ZCoeTkSsfJmmbnmW2svPBscF3PLgFrEdrPzidsk7R0r3z1HfbYM8sP7LPHmHzSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gfHuKpmZcPcM+w53wAUPmTZPBiSTXSl/UZygZofhs8=;
 b=Jlz0vFMKQy0F42CkE1hCsH57/JoTrduOF2SeEJi2GfX5vv6DEwfyYyR15dKM9aDRTQnpBTUtJjMXPFk64USus9JRgh/FtfPpD6+/I0XF+REAH5/cQ+2EOETXwSQCKG0a56vUG9qkMHJbnWb8IcZGKjpRrehD6W7sDpJCK2B9Tw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5243.namprd12.prod.outlook.com (2603:10b6:408:100::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 23:58:50 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 23:58:50 +0000
Subject: Re: [Patch v4 23/24] drm/amdkfd: CRIU prepare for svm resume
To: philip yang <yangp@amd.com>, Rajneesh Bhardwaj
 <rajneesh.bhardwaj@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-24-rajneesh.bhardwaj@amd.com>
 <8ac68ab1-b9e6-0000-6415-2b6666ae1c4c@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <94adb83b-35dd-3478-909e-9f8ea77e5657@amd.com>
Date: Mon, 10 Jan 2022 18:58:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8ac68ab1-b9e6-0000-6415-2b6666ae1c4c@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CH0PR03CA0438.namprd03.prod.outlook.com
 (2603:10b6:610:10e::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3ad2d8c-8d7f-4ccd-c188-08d9d4952581
X-MS-TrafficTypeDiagnostic: BN9PR12MB5243:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5243CC9AB1789C702B0F223F92509@BN9PR12MB5243.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgE77P6NfBrKRfntZXADk69iD7SqnmG5Qx6V2N5GEkZmtC1tSZi7p4LiMbxH1wGroodgUucQeGes7TG6AumUzj4nWTgv3OjM3MOB/Rmsh8Z1VpzqPId2ZVrBi+BL0SfqatDRn0nPLBDSGBqMbkX8DxYnFu+AuT7xQmWbh1lEDm5rSmnWlRfPdCWRFcsXBXUAUJacfarksbc6olcoNCpzWTolRTi7IT6mPhbSAIBP7oo3ZeNOYoA0BfPpUHxxV6OCQwEVbgdJ1GueeUMk583394Jot/M7K5hj/kXoWmkRKxR1zvIyQifbdsVnU7rjonWq+xgPcH36mjqeFBzOEh17WODl3Dx1UKpIAM/VDLr2bXLbZXgjWnH8JOYao3sdnAgukzenKNd4i76TcbB/lgYrfJ2PVYAdP0M6NtbewuP/DSPNjXvbWk2JyhVA9rS6xMZcs7oNb0u1o26YPtKXZiOrOb3j1si3AJ7ptF9Fm3y9ncvCGBzXYAN4GU7XQiK0//TDMNQCKgRKI5OmXlHjkIg5EXz5PmYIfpq5m9T/01InEm4F1FroT2xyP0fSvAJ6OtMOWW2XrvqGNQUOWkCdcUhyRY6hi8p50JEq6YyZQY5tvV4cGjBTxtADLskJBmVmM3OEFD/TbuDz+MmwURFZRwAut21lEBxVPxWTOA52T2WYRegj1THkkdaisE8xbyPX4byvdU9Hr48oY7Ug56RYoFvFGCh3ZngFzNHz4FlBjzPwGqYMWyZpKLKGGHR1pH6aMqcE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6486002)(66476007)(31696002)(44832011)(2906002)(86362001)(66556008)(53546011)(36916002)(6666004)(8936002)(5660300002)(8676002)(186003)(110136005)(6506007)(508600001)(38100700002)(36756003)(26005)(31686004)(316002)(83380400001)(4001150100001)(6512007)(4326008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHAzc2xkMjhrcjl4WGZWSDhwN2M3QThyL0pGUjlVVlJDeXRramRqV2Q4V3Bn?=
 =?utf-8?B?VDhHa2J6KzdpWkR5Y0tzQmJyYWY4WnRsL0h2cExSTnlIbVl3dUp4RjhuRHdR?=
 =?utf-8?B?MmZ5bU1ILzIxQlphVGhFOGRkVDV6eUNZZGtwUFZmT1VtcStSQ3NkeVRQWEpl?=
 =?utf-8?B?UVlZNzllTDVUaWRzS3I3eGFCOERZOVJmK25ZNGduV2ZNb05iMi8vTlN1Yy9i?=
 =?utf-8?B?enRROEMzc1pBYlQ2d0E3S0F6VitERXFBdEdvRU9GOHVGcGE3VmRTUVJTd2JB?=
 =?utf-8?B?VUIzZFc5MG9yelgxUzQxOENncEgrVE1GUjVOTnV3dk5IWmlwdDNzcm43VkJK?=
 =?utf-8?B?VlBkVXIyb3VJcVV5cUY3T1RYTkJTQ3BkOUhBbE1tUGxlMjR0b2tzL01yc2gx?=
 =?utf-8?B?ejFyZEJXRzA2d2hrb1BXK3R4QzM1NTdNZzl1NW12QWVwYWRldnN5SmlIUHlk?=
 =?utf-8?B?cjVhSmZ5K1I4VVg4VTg0R0QyWnNTVEM5SG9KRTR0bE9Pcm5aRDl4QTBBcGFh?=
 =?utf-8?B?ZWF6dzlwd1NzblhnUG1xNi83ell1L1R5THVMYjhEVGlBRTBNemZjTkdaNmxy?=
 =?utf-8?B?QWlyZmdDc1Vzc3RSS2k1cThiVklvTXR1b2pMOFQ0Nm8vbThyaFpoSU1tL3cw?=
 =?utf-8?B?SWllOXo2ZCtLNGNqbEhWd3ZwdmRKYmZIOHFpRHNEZEp6SDlNYk1VSTFNbndK?=
 =?utf-8?B?RlQ2VkdvOTFEekJJN2pnMS91c0ZQR0xQeE00YlZpRmtPbTFqYXBrMnRZSFdI?=
 =?utf-8?B?TGV6cmxOWHdzSWdoUmViSUQxYXJtMTBBMER6a1BCS3lQdkRyVUxWYyt6UVNv?=
 =?utf-8?B?bi94ZkRRM0hMckNOSzhhYlhPRC9uRzJHb3k1TDRkUTBqQjVNZFV4WG9DZU5T?=
 =?utf-8?B?M3hFQmRVMExvb280MlRFazlWdXljR0kwbzdLY3oyRGl1Vml5NDNyNzA4azgw?=
 =?utf-8?B?RUExUVZ6SExFZkVsOVhoZ29DbXZWTytJczVQK2hJWHV2bGJXMDNyak1oeXRm?=
 =?utf-8?B?Q2tZaURDTmZMZGtPN1lBT2ZiWFN6TjJNQVVuTUx3T042aU4zT0dzWThCK05R?=
 =?utf-8?B?T29FWDRNZ3N5cTZzQXNhbHF3eFk3elY0N0pUcEt3ZzR1WWJkbmZtVnVYQ2NZ?=
 =?utf-8?B?SlZxVmVncGpZeDh5Nm01cStpYk53N3BkaXFYUlhZNkxEZGlzOW1LWjQ5Q2tK?=
 =?utf-8?B?YzdlTldTMVM4bmYyQlJMaE9YT0I4VHluWDRKbWFYck80azFuWEJtT3Rhbits?=
 =?utf-8?B?ZU1uSFdSR1hxeSt3ZTV4QnF0UG9icFdUY0NscCtIQ29pZWdHS3Y5TGQrSTNQ?=
 =?utf-8?B?d1hhdEJ3dlRsNmhhS24rMFAza25yTjZpMjNPQW1BK1g1Q3NhSmNlYmxQckEw?=
 =?utf-8?B?U0JkWGtBcU90MEdsY0J3V2FHNVh5UjVIVko0YUpmRmxNNDhoZUJOYzZwSkdK?=
 =?utf-8?B?aEQrbkdDUHJCRGI2dGZiUDA4UFdlVFZEMmNZSlZReTBTdWtnU3VxTVc0WDRi?=
 =?utf-8?B?OEw3TGJ2dVIxays2Z2RlZndWZ0NlWldzNjVJbXEydWpHaVZNakkrTHI5N08z?=
 =?utf-8?B?NUJxaDB6WmZXOGRGOVZaNDIzWlVPZmI5ME43MzdpQ0x0N2JWeVExVU5DbDV0?=
 =?utf-8?B?TDhFeG1kdWdGWGE0VDZJT3lHVHUxeWE3eVlWYUVRRlBqSDRIOXhXU3RVNXdL?=
 =?utf-8?B?ZExyUDNiSzhKLzdiRGxTM0srbWpHZk1jemFQMEsrRXRtWDNtSGlDRXF2eGdZ?=
 =?utf-8?B?eVdMckp4ZWd6L1FZOGZ2MDczUEFBdWFlZHdPOVBzTC9RYVpyeERyOFRoOXZH?=
 =?utf-8?B?TlZVbnRBZmdMSWF3TjgvcFloeE1JbE81eDRySEpFa2Z3WkVGNFdMaDErdFdC?=
 =?utf-8?B?ZGlsc2dTS1ZNSFRsOHJVSGpXdFVhRDFZVlFFY0V5UktaNEpGb3JIMnE3Snps?=
 =?utf-8?B?SGcwTWJxN2hmVm5ENDBoN3ZKQm83RUhFc1pjRnFlYkY1RUErYlJ6OXIrT08y?=
 =?utf-8?B?VDh1MEx5MVMrdUpHWkRkRXZhUFZJRkNyYlk0R1BWWlBVM0p5Vk9Hblk3eGJB?=
 =?utf-8?B?NlMyMmlRK3E1VnVnbHdWQkJBZ05SUEdVWmdoNlZZUnhuSlh5a3lKSDU1Z1Bi?=
 =?utf-8?B?NXJGcm9YbnZQdFdEUzFmVTk0ZklSZGJobDIwZjFSM2hORW5GV21mZ2xqN1NR?=
 =?utf-8?Q?21i4lNLPR3XTsPqXslM8/38=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ad2d8c-8d7f-4ccd-c188-08d9d4952581
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 23:58:49.8954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqmnNoSa4ta4MCQbkV6dlUzgfkp4c/+B3giJBRopLSq49rieh0rcF0Q6zylmNFxaFBoSo+4aOI0ulAULxHzNuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5243
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-05 9:43 a.m., philip yang wrote:
>
>
> On 2021-12-22 7:37 p.m., Rajneesh Bhardwaj wrote:
>> During CRIU restore phase, the VMAs for the virtual address ranges are
>> not at their final location yet so in this stage, only cache the data
>> required to successfully resume the svm ranges during an imminent CRIU
>> resume phase.
>>
>> Signed-off-by: Rajneesh Bhardwaj<rajneesh.bhardwaj@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  4 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  5 ++
>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 99 ++++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 12 +++
>>   4 files changed, 118 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index 916b8d000317..f7aa15b18f95 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -2638,8 +2638,8 @@ static int criu_restore_objects(struct file *filep,
>>   				goto exit;
>>   			break;
>>   		case KFD_CRIU_OBJECT_TYPE_SVM_RANGE:
>> -			/* TODO: Implement SVM range */
>> -			*priv_offset += sizeof(struct kfd_criu_svm_range_priv_data);
>> +			ret = kfd_criu_restore_svm(p, (uint8_t __user *)args->priv_data,
>> +						     priv_offset, max_priv_data_size);
>>   			if (ret)
>>   				goto exit;
>>   			break;
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> index 87eb6739a78e..92191c541c29 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> @@ -790,6 +790,7 @@ struct svm_range_list {
>>   	struct list_head		list;
>>   	struct work_struct		deferred_list_work;
>>   	struct list_head		deferred_range_list;
>> +	struct list_head                criu_svm_metadata_list;
>>   	spinlock_t			deferred_list_lock;
>>   	atomic_t			evicted_ranges;
>>   	bool				drain_pagefaults;
>> @@ -1148,6 +1149,10 @@ int kfd_criu_restore_event(struct file *devkfd,
>>   			   uint8_t __user *user_priv_data,
>>   			   uint64_t *priv_data_offset,
>>   			   uint64_t max_priv_data_size);
>> +int kfd_criu_restore_svm(struct kfd_process *p,
>> +			 uint8_t __user *user_priv_data,
>> +			 uint64_t *priv_data_offset,
>> +			 uint64_t max_priv_data_size);
>>   /* CRIU - End */
>>   
>>   /* Queue Context Management */
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> index 6d59f1bedcf2..e9f6c63c2a26 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> @@ -45,6 +45,14 @@
>>    */
>>   #define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING	2000
>>   
>> +struct criu_svm_metadata {
>> +	struct list_head list;
>> +	__u64 start_addr;
>> +	__u64 size;
>> +	/* Variable length array of attributes */
>> +	struct kfd_ioctl_svm_attribute attrs[0];
>> +};
> This data structure is struct kfd_criu_svm_range_priv_data plus 
> list_head, maybe you can add list_head to struct 
> kfd_criu_svm_range_priv_data and remove this new data structure, then 
> you can remove extra kzalloc, kfree for each svm object resume and 
> function svm_criu_prepare_for_resume could be removed. 

Adding list_head to the private structure is a bad idea, because that 
structure is copied to/from user mode. Kernel mode pointers should not 
be exposed to user mode, even in an opaque structure. That's just 
begging for an exploit.

But you could define criu_svm_metadata as

struct criu_svm_metadata {
	struct list_head list;
	kfd_criu_svm_range_priv_data data;
};

Then copy_from_user directly into criu_svm_md->data in 
kfd_criu_restore_svm to avoid the double allocation.

Regards,
   Felix


>> +
>>   static void svm_range_evict_svm_bo_worker(struct work_struct *work);
>>   static bool
>>   svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
>> @@ -2753,6 +2761,7 @@ int svm_range_list_init(struct kfd_process *p)
>>   	INIT_DELAYED_WORK(&svms->restore_work, svm_range_restore_work);
>>   	INIT_WORK(&svms->deferred_list_work, svm_range_deferred_list_work);
>>   	INIT_LIST_HEAD(&svms->deferred_range_list);
>> +	INIT_LIST_HEAD(&svms->criu_svm_metadata_list);
>>   	spin_lock_init(&svms->deferred_list_lock);
>>   
>>   	for (i = 0; i < p->n_pdds; i++)
>> @@ -3418,6 +3427,96 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
>>   	return 0;
>>   }
>>   
>> +int svm_criu_prepare_for_resume(struct kfd_process *p,
>> +				struct kfd_criu_svm_range_priv_data *svm_priv)
>> +{
>> +	int nattr_common = 4, nattr_accessibility = 1;
>> +	struct criu_svm_metadata *criu_svm_md = NULL;
>> +	uint64_t svm_attrs_size, svm_object_md_size;
>> +	struct svm_range_list *svms = &p->svms;
>> +	int num_devices = p->n_pdds;
>> +	int i, ret = 0;
>> +
>> +	svm_attrs_size = sizeof(struct kfd_ioctl_svm_attribute) *
>> +		(nattr_common + nattr_accessibility * num_devices);
>> +	svm_object_md_size = sizeof(struct criu_svm_metadata) + svm_attrs_size;
>> +
>> +	criu_svm_md = kzalloc(svm_object_md_size, GFP_KERNEL);
>> +	if (!criu_svm_md) {
>> +		pr_err("failed to allocate memory to store svm metadata\n");
>> +		ret = -ENOMEM;
>> +		goto exit;
>> +	}
>> +
>> +	criu_svm_md->start_addr = svm_priv->start_addr;
>> +	criu_svm_md->size = svm_priv->size;
>> +	for (i = 0; i < svm_attrs_size; i++)
>
> for (i = 0; i < nattr_common + nattr_accessibility * num_devices ; i++)
>
> This function and for loop is not needed if you remove struct 
> criu_svm_metadata.
>
> Regards,
>
> Philip
>
>> +	{
>> +		criu_svm_md->attrs[i].type = svm_priv->attrs[i].type;
>> +		criu_svm_md->attrs[i].value = svm_priv->attrs[i].value;
>> +	}
>> +
>> +	list_add_tail(&criu_svm_md->list, &svms->criu_svm_metadata_list);
>> +
>> +
>> +exit:
>> +	return ret;
>> +}
>> +
>> +int kfd_criu_restore_svm(struct kfd_process *p,
>> +			 uint8_t __user *user_priv_ptr,
>> +			 uint64_t *priv_data_offset,
>> +			 uint64_t max_priv_data_size)
>> +{
>> +	uint64_t total_size, accessibility_size, common_attr_size;
>> +	struct kfd_criu_svm_range_priv_data *svm_priv = NULL;
>> +	int nattr_common = 4, naatr_accessibility = 1;
>> +	uint32_t num_devices;
>> +	int ret = 0;
>> +
>> +	num_devices = p->n_pdds;
>> +	/* Handle one SVM range object at a time, also the number of gpus are
>> +	 * assumed to be same on the restore node, checking must be done while
>> +	 * evaluating the topology earlier */
>> +	common_attr_size = sizeof(struct kfd_ioctl_svm_attribute) *
>> +		nattr_common;
>> +	accessibility_size = sizeof(struct kfd_ioctl_svm_attribute) *
>> +		naatr_accessibility * num_devices;
>> +	total_size = sizeof(struct kfd_criu_svm_range_priv_data) +
>> +		common_attr_size + accessibility_size;
>> +
>> +	svm_priv = kvzalloc(total_size, GFP_KERNEL);
>> +	if (!svm_priv)
>> +		return -ENOMEM;
>> +
>> +	if (*priv_data_offset + total_size > max_priv_data_size) {
>> +		ret = -EINVAL;
>> +		goto exit;
>> +	}
>> +
>> +	ret = copy_from_user(svm_priv, user_priv_ptr + *priv_data_offset,
>> +			     total_size);
>> +	if (ret) {
>> +		ret = -EFAULT;
>> +		goto exit;
>> +	}
>> +	*priv_data_offset += total_size;
>> +
>> +	ret = svm_criu_prepare_for_resume(p, svm_priv);
>> +	if (ret) {
>> +		ret = -EFAULT;
>> +		pr_err("svm_criu_prepare_for_resume failed\n");
>> +		goto exit;
>> +	}
>> +
>> +
>> +exit:
>> +
>> +	kvfree(svm_priv);
>> +
>> +	return ret;
>> +}
>> +
>>   int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
>>   		       uint64_t *svm_priv_data_size)
>>   {
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
>> index b00576db5baa..e0c0853f085c 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
>> @@ -191,6 +191,10 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
>>   int kfd_criu_checkpoint_svm(struct kfd_process *p,
>>   			    uint8_t __user *user_priv_data,
>>   			    uint64_t *priv_offset);
>> +int kfd_criu_restore_svm(struct kfd_process *p,
>> +			 uint8_t __user *user_priv_ptr,
>> +			 uint64_t *priv_data_offset,
>> +			 uint64_t max_priv_data_size);
>>   struct kfd_process_device *
>>   svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
>>   void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
>> @@ -244,6 +248,14 @@ static inline int kfd_criu_checkpoint_svm(struct kfd_process *p,
>>   	return 0;
>>   }
>>   
>> +static inline int kfd_criu_restore_svm(struct kfd_process *p,
>> +				       uint8_t __user *user_priv_ptr,
>> +				       uint64_t *priv_data_offset,
>> +				       uint64_t max_priv_data_size)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>>   #define KFD_IS_SVM_API_SUPPORTED(dev) false
>>   
>>   #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
