Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A57ABAD4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 23:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BC210E726;
	Fri, 22 Sep 2023 21:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679BF10E127;
 Fri, 22 Sep 2023 21:04:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2W0MCD1KVZyZfNMPRJ6JchK7YNqIg9pgLFjSaK9ar/r3RVNuuXeZMMupqFjAU3Xc6LFc9mlP2YJEqoVJYGkR7NNjS1VEU3xPhEi7Uye4FbTa4GrT3a0snfJzm/c/e4rHpt5BqwxGv7qiKy92XfT3+loRVotoLOzH9a3ttRSZBDwH7eyDsN4ObqVVZoqmvKkduS7MdUDfG/B+frGa094p+y5weVnanrWr0lGo+OXEZ61UfMxAfAGLy13pR86L386i4TUWwKdkovFdxDXvvm4VZV8lfGeM3t9atHsbW+6+iy3lBW37vbVlRBI9CMZ3143DSWYymkWVaXeZZzcNw6w1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsdek7IwP3iBPDvX/dTUw5AMnU3uQT9FB1fVkwkUMQQ=;
 b=hzK/BMOkllMtQyGIuC4Un/XJf//z/g2ISB6d3inV4C7xNgod+eRYbB5qMbL97WGaRFumFjX30gfzTck4prYSokkUaEd58j1cA7p58HqcLKJugv7BfFgaGwMXCPzj30fw1q03eR+SCrOPPEinlzbuQ4M1I6pfI3Bt24HLp05Bo5szvSlGdkbQuCX5mMOD75nVsucYlJ/A6wP+d2uQva/Je9sYxpnUge9VwtttxNrJRP8ynrVHcgq79SoiaSgI3RSAcnsLqyy+tVQZoRGm6aILj6gEERU4WE6ZcGAKPYiLpo2mA55+4lcJT6pjHX/lTy9AgfdDTBDizFcRFxNkZbCHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsdek7IwP3iBPDvX/dTUw5AMnU3uQT9FB1fVkwkUMQQ=;
 b=y1Y9b0GD0UNbT7FlGO67EaLv+zYMnzpA1xqnSHicO0B5H0I0nZVVTWtpvQHC70edXwZOcs9kB1XtBnI5jNMROd+ksctcVRw8/Yd0sCRxxRrjoh1oxLO2uM1q2kVn9lCAn0T3Nf2+n2SLiZRNYBVFeo6vDcmQ5ijWXuRuw9+oOMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH0PR12MB5299.namprd12.prod.outlook.com (2603:10b6:610:d6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 21:04:35 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 21:04:35 +0000
Message-ID: <fcdd044c-07e8-4c16-bcac-14a193867816@amd.com>
Date: Fri, 22 Sep 2023 16:04:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface for
 HPD
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-15-Shyam-sundar.S-k@amd.com>
 <f370fd18-345a-4b7d-b074-550539e7933c@amd.com>
In-Reply-To: <f370fd18-345a-4b7d-b074-550539e7933c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0101.namprd12.prod.outlook.com
 (2603:10b6:802:21::36) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH0PR12MB5299:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0821c2-c412-46a3-5885-08dbbbaf86a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2K0R2/2UwgClt3y7p+kHMINf6+NTmNYJNCcJRsKva7ax6axTAt2krSuWeDHBefb0ju6Q3DRk1+aSdM1IHrxHVFplBBfgmIVxvCwKoIRVX6CcqxZbUcQNzVcLMKFKFKVu9DMJmnetlunqZ9mYLnw/T7YtOqg/TMVXUQc2f4keiUDRubsTLu341ByxPs8TmMCuIa1hUr5LAeTom0FQzLmgIOOvjP9MpJOV7Jf+UsyNRHauBYHxNc9MZhXQYKJG6I45lUiPXIk0lwnGI+4mQIxq9y5w95QPVN7sMwGIftlMz2UftRtqPWAOcdqGyoBpPdpb9QzAHmMHQ/evHggRB3A59NPgUUo9wL+UmdDBlKXiI7b2BkRKfnNJuk5PFl71g3Ssxyi/v140bVs7UNQ/dq57S+JzSccPY30UusNQT1nlRXe40LiQ5scRS+uuMK0yiWl3YpAw9igYUfQ9TtflpYlojdKXz9JVzQNjSewMvi1JimIdTmCJOlSIKIC1B+xIfjD0HbzZ48s0vvMHESOvkCKp7TLZe1DuupDzrsZg5W7x7S61f9Tb9shhcqTYJmHsNWOzBOmZ0t4+491TIYBuD3Rg41ITu0o6VWGCprZ/NvQxrSWVJa8Bf0/gJpRuf0Mx2GFjx4NJgARPZtIK9cfITHRrutODJfbcEseMmCXB2zj7Z9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199024)(1800799009)(186009)(2906002)(7416002)(31686004)(8676002)(4326008)(8936002)(41300700001)(44832011)(5660300002)(66946007)(316002)(66476007)(66556008)(478600001)(6666004)(6486002)(53546011)(2616005)(6512007)(26005)(6506007)(83380400001)(31696002)(38100700002)(921005)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWlQbXlGQXp4STBzNCtiRFZzWXY1aG1aYVhoSHdjb2hselV1blEycnZpTmZU?=
 =?utf-8?B?R1NDRmlHU2ZtVGpLQXZVSlMxaXVWYlB4V1dJVzBlMkx2ME9mMnJxd2V1aGVu?=
 =?utf-8?B?ZWpwdktaRVVmeFdBTnJOT0hmQW5GZFlIakdOcURPdTAvN2lhTmFvbTFWQjJ1?=
 =?utf-8?B?MXVVRmNoM1AwSmZSaHdxeE40K2lFWm13cVRBanNEb1VKMVRSVVREMkJ3YXpP?=
 =?utf-8?B?c0E0Y3ZTUStCRXNsZHNlQTRiZUNWZUYxcjl0MkhqNlcyZjZZK1phWFk3N1JW?=
 =?utf-8?B?U1RQU1d4ZThaOFkwQVk4ZjVMYnFCdXpzNU9XaWJXK01CRmxxMHUwMUptWW1W?=
 =?utf-8?B?QmZBRDFkMDk1UFN6czBxbmFCUTNYdUFEQUFSZHJ3bzNldU9VSGoyT3lyakZp?=
 =?utf-8?B?VDVxQnUzYWlRVXg2bi9CQXZ1Z1JpTC9tRzlVWVNwVkkyR1c5VmFsdDNpL1FN?=
 =?utf-8?B?b296dXFaRTcvdE9ndGJGY0x5dWJSbVRsQkIyL0ZOa2s2SVJBZzcwa2Nzc0dE?=
 =?utf-8?B?Mk5FeWd3QWt0Y0dJaTJtMWNkUjVTcXF2bnUzcXh2UjhjY3JzeS9mekxUNmNr?=
 =?utf-8?B?aTU1QXFDV1cyTHVSak4rQ21Bcm4xR0ZPbTVJV0VZYTZwc2VuNGEvOEdCZ2w0?=
 =?utf-8?B?RHVlT01mWVFvWDI5ZnFSYjVzWlordlp3ZDB0bW0vQ2JZdytZMklkdnVla0N0?=
 =?utf-8?B?ZEtNMWhJeXZvRUl2a3dPa3lObVdVblNZdHlmMmN3UEFhSzYvTmgyWHJZSFAr?=
 =?utf-8?B?WlhqWWpTcWU0Uzhqd2tuR3poTEZNTy9wYXQrMzFpV084STUwZzBWQSsvRktN?=
 =?utf-8?B?Nis2VGtrTFJ0OGpaV3pTejNhL2FycFNyWWtTL1pHZktBWCthWmhhT1c4dlky?=
 =?utf-8?B?blhQVVJ6QjFEa01WOHF4VjQ0UGFTeFVLQUVkaXB1YWo5RFFLOWsyUUVJZC9p?=
 =?utf-8?B?ZGFQaTc2VTdHMmpMRmxWaC9rZFJxSFJPdzNHT3BQYVNyekc2NGplcERNV3dE?=
 =?utf-8?B?SEtBcWpFV0JaTWxZVFdKaHV5QzY2SG1WcmVBVUVuSnFEa1hwVmc5WkxPM3Vh?=
 =?utf-8?B?TFk4UDFYTEZSc0EwS3NoYjF0Q3h6Q0RXeVlJS0RVS1BBM255YlFmcFYzbUVw?=
 =?utf-8?B?eEJTbWp5eUgwcXNZVWI3OGNtOVhna1dGL3JJNEoxUEtFdUlHVnBndE9iMmd3?=
 =?utf-8?B?VWZzdmRJR2NhaTlBSkh3TTcvN1BTenNYTEJnMEdFYkxyd0szWTVDUEcyWXFr?=
 =?utf-8?B?OUVaUS9CL0xvbHY0b1VHenVLVW4zSEloVWpsNVdTN0Z0NHZLbi9oelByNmRI?=
 =?utf-8?B?MXVuV3B5cTFxUnZVU0JjR2ZqUWptQUVyNTlnSzBNaXZHb01HejZJNXVzVE92?=
 =?utf-8?B?QWNEdmEyakVQSE5DNUdYd1VldG1NdXg2aGZldXhWQklUQm40dHArS2V4ZGVF?=
 =?utf-8?B?ZmZ1b1hSUXZ2bllHMmlhMVYxcStHVGo2bHlnOXNNOFhNaXFxMDBnaWNvWWt6?=
 =?utf-8?B?ZElKYXZxckpQNWFkbHgvU213bUxJWTJFQzlxQ2RrczBGNUhPTkg0YUdpVFdq?=
 =?utf-8?B?UTR3MXBLUTJCWlIxSlhTM3oyNmYrNWcrZ0xNbDlucVdrZUk2UitQa2tTUk5o?=
 =?utf-8?B?YTI4WkxHZHdpdVhIQmRFTS8xcmRVYXE1d1FzT1FxUkVpa1RtMzV6Tkx4U1BS?=
 =?utf-8?B?WnRocDJHQ0JZZmxLQjJPczNSMVZHdm1leXpFSTc0TUw0RElMdGdrcWw1U2tF?=
 =?utf-8?B?dDlaSlRKbVpROTFzSysrWHV5MDk2S29zSlh2MXZLZFNKNXB3UEhmSjFVNGlt?=
 =?utf-8?B?TjVoNHpmdTQyRUlrYkMyeURmWC9renhTS3k0ZVZGNkZPL1dTRDV3TUR1Y2Za?=
 =?utf-8?B?RGt2VFhvMXFBbm5aV01LbG9zM1FIRUVxYk5RZUhsNmY0NTFSZDRNcnJkRWdk?=
 =?utf-8?B?YXFBdkc4S0lJU0Z5N3JtMEZpLzRDOXp1STgrK0l1TFBQS0R1RmFnTUwyR2lK?=
 =?utf-8?B?MkVrZXFSK1lSK0hsRHVzbmpHakNVWkl4bkl0aXNBM0FhUUxPM2FNTmpTNkhz?=
 =?utf-8?B?cHlEdWpzaFBxZWxvVUNsMTY1anpiQlJyOFFNUWNaeUxpUHk1Yi9OSDJjcmo4?=
 =?utf-8?Q?bY+WsLBFmyqf4V1W/txK1jok9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0821c2-c412-46a3-5885-08dbbbaf86a0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 21:04:35.7863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wS3t8Er8R4quxSKxBXLgKFBFEZkbUyM2RL10hVcnWkkPn+rjMA2IbxcXa6CKW08hVy0Mdyn7e2TNgaDxEkm0Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5299
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
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/22/2023 14:04, Mario Limonciello wrote:
> On 9/22/2023 12:50, Shyam Sundar S K wrote:
>> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>
>> AMDSFH has information about the User presence information via the Human
>> Presence Detection (HPD) sensor which is part of the AMD sensor fusion 
>> hub.
>> Add PMF and AMDSFH interface to get this information.
>>
>> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>   drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  5 ++++
>>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |  2 +-
>>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 11 ++++++++
>>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 28 +++++++++++++++++++
>>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
>>   drivers/platform/x86/amd/pmf/spc.c            | 21 ++++++++++++++
>>   include/linux/amd-pmf-io.h                    | 22 ++++++++++++++-
>>   7 files changed, 88 insertions(+), 2 deletions(-)

Somthing else I noticed about this change.

I believe you should be adding to Kconfig:
depends on AMD_SFH_HID

>>
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h 
>> b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
>> index 2643bb14fee2..cd57037bf217 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
>> @@ -37,6 +37,10 @@ struct amd_mp2_sensor_info {
>>       dma_addr_t dma_address;
>>   };
>> +struct sfh_dev_status {
>> +    bool is_hpd_present;
>> +};
>> +
>>   struct amd_mp2_dev {
>>       struct pci_dev *pdev;
>>       struct amdtp_cl_data *cl_data;
>> @@ -47,6 +51,7 @@ struct amd_mp2_dev {
>>       struct amd_input_data in_data;
>>       /* mp2 active control status */
>>       u32 mp2_acs;
>> +    struct sfh_dev_status dev_en;
>>   };
>>   struct amd_mp2_ops {
>> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c 
>> b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
>> index 06bdcf072d10..d7467c41ad3b 100644
>> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
>> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
>> @@ -132,7 +132,7 @@ static void get_common_inputs(struct 
>> common_input_property *common, int report_i
>>       common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
>>   }
>> -static int float_to_int(u32 flt32_val)
>> +int float_to_int(u32 flt32_val)
>>   {
>>       int fraction, shift, mantissa, sign, exp, zeropre;
>> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c 
>> b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
>> index e9c6413af24a..9c623456ee12 100644
>> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
>> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
>> @@ -73,6 +73,12 @@ static int amd_sfh_hid_client_deinit(struct 
>> amd_mp2_dev *privdata)
>>       int i, status;
>>       for (i = 0; i < cl_data->num_hid_devices; i++) {
>> +        switch (cl_data->sensor_idx[i]) {
>> +        case HPD_IDX:
>> +            privdata->dev_en.is_hpd_present = false;
>> +            break;
>> +        }
>> +
>>           if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>>               privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
>>               status = amd_sfh_wait_for_response
>> @@ -178,6 +184,11 @@ static int amd_sfh1_1_hid_client_init(struct 
>> amd_mp2_dev *privdata)
>>               rc = amdtp_hid_probe(i, cl_data);
>>               if (rc)
>>                   goto cleanup;
>> +            switch (cl_data->sensor_idx[i]) {
>> +            case HPD_IDX:
>> +            privdata->dev_en.is_hpd_present = true;
> 
> Looks like this is missing a tab.
> 
>> +                break;
>> +            }
>>           }
>>           dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
>>               cl_data->sensor_idx[i], 
>> get_sensor_name(cl_data->sensor_idx[i]),
>> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c 
>> b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
>> index 4f81ef2d4f56..63a5bbca5a09 100644
>> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
>> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
>> @@ -7,11 +7,14 @@
>>    *
>>    * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>    */
>> +#include <linux/amd-pmf-io.h>
>>   #include <linux/io-64-nonatomic-lo-hi.h>
>>   #include <linux/iopoll.h>
>>   #include "amd_sfh_interface.h"
>> +static struct amd_mp2_dev *emp2;
>> +
>>   static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, 
>> u32 cmd_id)
>>   {
>>       struct sfh_cmd_response cmd_resp;
>> @@ -76,4 +79,29 @@ static struct amd_mp2_ops amd_sfh_ops = {
>>   void sfh_interface_init(struct amd_mp2_dev *mp2)
>>   {
>>       mp2->mp2_ops = &amd_sfh_ops;
>> +    emp2 = mp2;
>> +}
>> +
>> +static int amd_sfh_hpd_info(u8 *user_present)
>> +{
>> +    if (emp2 && emp2->dev_en.is_hpd_present) {
>> +        struct hpd_status hpdstatus;
>> +
>> +        hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
>> +        *user_present = hpdstatus.shpd.presence;
>> +        return 0;
>> +    }
>> +    return  -ENODEV;
> 
> Extra whitespace here.
> 
>> +}
>> +

IMO you should add some kernel doc here or in the header as good 
practice for exported symbols.

>> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum 
>> sfh_message_type op)
>> +{
>> +    if (sfh_info) {
>> +        switch (op) {
>> +        case MT_HPD:
>> +            return amd_sfh_hpd_info(&sfh_info->user_present);
>> +        }
>> +    }
>> +    return -1;
> 
> This looks like it should probably be -EINVAL.
> 
>>   }
>> +EXPORT_SYMBOL_GPL(amd_get_sfh_info);
>> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h 
>> b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
>> index 9d31d5b510eb..8a36386e6bce 100644
>> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
>> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
>> @@ -149,6 +149,7 @@ struct hpd_status {
>>       };
>>   };
>> +int float_to_int(u32 flt32_val);
>>   void sfh_interface_init(struct amd_mp2_dev *mp2);
>>   void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
>>   #endif
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c 
>> b/drivers/platform/x86/amd/pmf/spc.c
>> index 5f3ab1ce09d2..97293ae25cf5 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -48,6 +48,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, 
>> struct ta_pmf_enact_table *
>>       dev_dbg(dev->dev, "Primary Display State : %s\n", 
>> in->ev_info.display_state ?
>>               "Connected" : "disconnected/unknown");
>>       dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? 
>> "Close" : "Open");
>> +    dev_dbg(dev->dev, "User Presence : %s\n", 
>> in->ev_info.user_present ? "Present" : "Away");
>>       dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>   }
>>   #else
>> @@ -156,6 +157,25 @@ static void amd_pmf_get_gpu_info(struct 
>> amd_pmf_dev *dev, struct ta_pmf_enact_ta
>>       in->ev_info.display_state = dev->gfx_data.con_status[0];
>>   }
>> +static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct 
>> ta_pmf_enact_table *in)
>> +{
>> +    struct amd_sfh_info sfh_info;
>> +
>> +    /* get HPD data */
>> +    amd_get_sfh_info(&sfh_info, MT_HPD);
> 
> amd_get_sfh_info() is int.
> 
> Shouldn't you look for the return code here?
> 
>> +    switch (sfh_info.user_present) {
>> +    case SFH_NOT_DETECTED:
>> +        in->ev_info.user_present = 0xff; /* assume no sensors 
>> connected */
>> +        break;
>> +    case SFH_USER_PRESENT:
>> +        in->ev_info.user_present = 1;
>> +        break;
>> +    case SFH_USER_AWAY:
>> +        in->ev_info.user_present = 0;
>> +        break;
>> +    }
>> +}
>> +
>>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct 
>> ta_pmf_enact_table *in)
>>   {
>>       /* TA side lid open is 1 and close is 0, hence the ! here */
>> @@ -165,4 +185,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev 
>> *dev, struct ta_pmf_enact_tab
>>       amd_pmf_get_battery_info(dev, in);
>>       amd_pmf_get_slider_info(dev, in);
>>       amd_pmf_get_gpu_info(dev, in);
>> +    amd_pmf_get_sensor_info(dev, in);
>>   }
>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>> index ecae387ddaa6..4f82973f6ad2 100644
>> --- a/include/linux/amd-pmf-io.h
>> +++ b/include/linux/amd-pmf-io.h
>> @@ -5,7 +5,8 @@
>>    * Copyright (c) 2023, Advanced Micro Devices, Inc.
>>    * All Rights Reserved.
>>    *
>> - * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + *          Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>    */
>>   #ifndef AMD_PMF_IO_H
>> @@ -26,4 +27,23 @@ struct amd_gpu_pmf_data {
>>   int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>   int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>> +
>> +/* amd-sfh */
>> +enum sfh_message_type {
>> +    MT_HPD,
>> +};
>> +
>> +enum hpd_info {
>> +    SFH_NOT_DETECTED,
>> +    SFH_USER_PRESENT,
>> +    SFH_USER_AWAY
>> +};
>> +
>> +struct amd_sfh_info {
>> +    u8 user_present;
>> +    /* add future caps below */
>> +};
>> +
>> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum 
>> sfh_message_type op);
>> +
>>   #endif
> 

