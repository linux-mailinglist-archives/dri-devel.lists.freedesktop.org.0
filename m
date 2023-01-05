Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E176365E507
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 06:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7CE10E0DD;
	Thu,  5 Jan 2023 05:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4C410E0DD;
 Thu,  5 Jan 2023 05:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSuRcR/mtCc91UMSAkxdvM+jyMNGFcpbRKllc2tlTV0MY0jjHFKmDoEdTDR5Gx5f+L8D3k5OZUENEl7fPe1RAOe2PSPQvRzfKv4Z1odGiqyDvAi2uE4Gv63bngajvnww8fkNjD+ESZIi3Q+zOVNgMmIXweHep0euHAvG+8AsCRIH3eI72doZNfiFBtea8qTedlljb3lfryCb0C0/+RdDc44XRC66zYqGbxlTAq8877KSrKtJX08Hzi1eg3QzcrHQxXhPtU81Z4hYi1BFyVdzHJyWsI67tNwdtOlDrIGkT2HwVQr0cPovac1MD6ZbDKIfaGukRpei2ShASaNsuLNusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IILg7Y2RnT86nPXxB2sNqs04YIPJUyed3LFztkPG1kE=;
 b=b7U39VrdByYG6kau0zm1pPlSPhdLw32x56KGgmmvDfKGCN0WyDpTLKfNeYktlBcpaA73DNFoO7YCIBFV2x/Vp++jGYiQUSuIIuqrJ172wdHloOrpIyU5/SFxdRUO6++tGhk5NGkRyMpQqSEDzG1lXgCu8BZjcCw7BQZRlNevMerbquAfE5r405u8Y3wFHWJTqxfVv97ohcghfmh3D1uZNUX0CgOVnu5r6SytxShqIJ0OTqgc3Ms+ExEWTmynGCL3beF+w/2UnFp1Ik4LMMoEgKJ1Wiwi3f+iT7qctEPdkOyE7JIyqGKtuXe3GzQo2l2tiLwxs+sv8hq2nrTZonj0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IILg7Y2RnT86nPXxB2sNqs04YIPJUyed3LFztkPG1kE=;
 b=axxwie7dgoVE9zE1cFl4TABaBOuFLCu8XU16UU7NH2f1oxriEKq3SdTDjDj2pwulBAse0G9dqKpTIxWZlWDkLmLJhMHMjYmmHxYD3LAT4fbcR4/W9UxJnD0L6L5GeFPWfRdS3a+TbTWcYts8hdfk7uYmiz4Mu8K8jt30+OKa25c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5796.namprd12.prod.outlook.com (2603:10b6:8:63::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 05:23:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 05:23:27 +0000
Message-ID: <b3304913-e6f4-3f87-e4f9-b31374682d2a@amd.com>
Date: Wed, 4 Jan 2023 23:23:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v6 05/45] drm/amd: Add a new helper for loading/validating
 microcode
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230105034327.1439-1-mario.limonciello@amd.com>
 <20230105034327.1439-6-mario.limonciello@amd.com>
 <804491f0-6e83-dae5-f108-f80950838a52@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <804491f0-6e83-dae5-f108-f80950838a52@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR16CA0053.namprd16.prod.outlook.com
 (2603:10b6:805:ca::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: cfde1117-b92c-458f-c241-08daeedcf9bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lS1eHvd52JyjKfulHkS9lSl8O6tTour2vlgAJTnvN+nyXCtgDJPyj0u4/mkq+cqxw+cPYeuulZ+xh7u4qsiwQRPzedoK0oVlf2aYytxXsdHpiZFzAM+GxUU82yaCp5FVJGl/GDHUTnBCSHw0wjN6vS8XwmAfR9qpimK+IAkeQ2oflbsujES9keOucXyzYYIHtHlMe8pepjedK61OF9C22Fxcmh1dqStePh7xwget/RYm845Fhc9X2qZwGLMW0x4wb7TtJ/3fzFrm8GezzWs16bfbRVo2nqBLJDs8XhhxSp0qbQVgrGBkLyM9wHv8Z7m+tLT0KpPcVLsC9rFJHBNsNAtfZCSIMPEpUE4hmZbhrj+5GpyPgVv75qr0eG93bAOwrb1NerwOKU5PqbNPlF8oh52/A6ViUMbxRRaB/JMferS/QJ+3OGISSItp9ihuu84ig7qEWjwJQd83Blz2MppmDXFTIFyfc9sxcrQDDPlw0YxnXQ66zQXRfZIWeHcsyI68SOH1VJQ4tjvl1saE0TGJTlYt/bzvgp5fFFWUTpekr0XyCggh9vMnrneJ7J30jXTRZEkthti0QLrk9AIxWoJ19lFaycJ4kmMO6QyuXEkvqOq5eGof69VeiC4JrmmaHi3QeXZVa4IllFKlFcVwmdWGoDyQx7bubkDng9zNNTYhtVW9ZpXSMsqIZ6KMVGQa+1rk3xsP96rGEo7FJ4ZWKUQTe+Snyu9cVJ8NZYw1FHHvn/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199015)(54906003)(186003)(31686004)(110136005)(478600001)(2616005)(66476007)(66556008)(6486002)(66946007)(6512007)(4326008)(83380400001)(44832011)(8676002)(8936002)(5660300002)(41300700001)(2906002)(316002)(86362001)(31696002)(38100700002)(6506007)(53546011)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VERoQlRmR2QxZGo2SFFoS244cHBFOXIwQmU4WDZwd1NpTzVuL3lpVEJ3Qm1m?=
 =?utf-8?B?QjJGeVdHcHNnd1pGOExDeU1DZHlxMzZwRW5jZVV3dzZyV2JrOWJlQlkxTnBG?=
 =?utf-8?B?eCtLRmxmbUtJdDBqVnppSG5vQ25nUVB2V2V1N09MN0xzSVE1Zlh1b0V6YTBB?=
 =?utf-8?B?c2FHc1BGdTVyaGR0ZEllOFRxU3RETlhrRVdhMnlqUWE1N1lKYzNOMm55ZkhV?=
 =?utf-8?B?TnBuSTdjOW9Hb0MwVEx3STRTWWs2RUhvSHRQcVBqSE1mU2ZkQTJObEh2c2VN?=
 =?utf-8?B?UUdUK0R3Tkcrb1JLRWovKzY1V0UwOW5BTUZvRVlJRGoyQ2R5QkoxR2JaUUxl?=
 =?utf-8?B?eld0Nk52SVpPOVJaeWZ5VGhuYzI5ZDNTVktiaXhzUEZjODV1NUQ3T3d0UnRH?=
 =?utf-8?B?ZHExQURMc2QzRXZNcXNjRDBNeTQ3dHNOWXhTcnEvdjlJTWxHYVNHcmwrN2xS?=
 =?utf-8?B?QWxVdmlRRWF4dysycWNQYlM2K3FnUjR2cVVieDB6eEd4SFFXRDhHVFFRRmZJ?=
 =?utf-8?B?WTV3dFBEMnRMeXVRQklRUkhreFk4UUhhK1JmM3FQRnpGZnZKT0JmN1JZODJU?=
 =?utf-8?B?UGlUQlF1WjNkSmw5SXdtcEQ2NmVQcS9rcU02aUkxZVFvUG1xQkxkd3VDUUQz?=
 =?utf-8?B?anVQb2tnWnBHSkZROWJZWUxZMUNzUW15Q0IvejNNSXhHVlNpaURoZWM3T21o?=
 =?utf-8?B?MlA1ZWNXZEdvYVZ5aGxUcDBsS2hQb056RXF4eGVGS1dLWCtFdHVHdGlQL2ta?=
 =?utf-8?B?ZnFiYjZWQkpPb3VETzVFRmRtVmJJbUtMc2hsY0p4SDRjck5nZ3B4NnRha1M4?=
 =?utf-8?B?VWpDcjFqanVGOG5MdGt4bFZzMU5jc3VTUk9PVWh4VDhBVHg2RlBQODFidVYv?=
 =?utf-8?B?azB3R09wcnBPMmtwQktGMHBMVFRpcGVHRCtrM3FOdlJicDFKR1A1RDFsOWc5?=
 =?utf-8?B?UnZoWm9jd1RndmI5b1BVZU5NK1dCWHVaRzJEWStTOExkVUJGek00WHdEbnZw?=
 =?utf-8?B?bDNxUVU2TW1RRmJObTN4SVZGS092THZQUmM4cHVqdUpvMUkydWpJWFMzUVZR?=
 =?utf-8?B?TGRJNkZXeGZiUjlCVlVJRXFGNlIzZGdVNzc1SFdKUW5KQVNwc3gvdFZtOUVS?=
 =?utf-8?B?T2tpUE9iSDkyajJ4aTBsQlFIdEt5cEZyRXMvYk8zQzdLSkZZYzB1N05PQ2lK?=
 =?utf-8?B?UHJSMjZZOE1PS0tqQ1pYbkRTTk9vanJrOWpERzlkTVlocWdNVFc3UVkzZjJz?=
 =?utf-8?B?S3h3RU9oWGdrV3FlRUFIdFZKakpPZjJpSFo0eUZvcXlISDhwSHNUVjJ0MHhp?=
 =?utf-8?B?K3JhVUI4aEhKL1dCQzdwc3BpNEJwb1dDTkVDODNPY0YxNmltSEhkVTRlMGpw?=
 =?utf-8?B?dXJjL1RzU1Z5TmVUSFh2bjZjb01abnFJS1lBUFFjd0taaXl5UGswWmhmUUVt?=
 =?utf-8?B?bm9kdjVXenVZd3VGS0JuTVdBcGxNdEN0aGI0K1ZFbmp2QjJyNFhNK3RKaHFi?=
 =?utf-8?B?Q0FmMW9xT2tVc2JSdU4xaHFLZ2hvcEl3UUxUK01sTTRwc2RxMHI1UDExSTdy?=
 =?utf-8?B?N2g4dzJEUHozcDBnREtsUWgyYkRIcHlFUUtkNFJBSDZlMUJ5L29YVTRsMVdE?=
 =?utf-8?B?SWlmdVVsUkZuaHhTVXlSVGZtalo1ZkFVUXBZZ0R5MUtRZjFtQ29ncWpZVFdQ?=
 =?utf-8?B?LzVGYUtVNlhrWCtqNVZwdmNhdG5GMEh6N2hMdWlyOHludXd2Sk5XUkJhNW5o?=
 =?utf-8?B?b2w4Mkh6RUFSVm1paFl3ZXhHRzd0aTFMZlR3Zk9lTkRpcmlBc3QwOVZ1Y2NG?=
 =?utf-8?B?SFAvdTdhNG9GK1BzZlVxSWQ2Ym91UVBHV0pkcm9qWDRiMGFOSUN0M0hMaVdy?=
 =?utf-8?B?cHN6UjFwaytPZEhUYU1RY1p4OS9WdlY1Tmp6MzFlallKTHNSWGRLRzdaN1Bn?=
 =?utf-8?B?cldsRFkxM3JkM0xqbVdhenFPK2s4bGh6WllIWTJEcXBqNjdCdlpoUUNzVHFh?=
 =?utf-8?B?eTZxSlB3d0tSSkxCSVQzTTJXcjVQUXRkWnNJbDJGUVdUcy9PVXB5ZjR6c2pr?=
 =?utf-8?B?RURDd01WUU5LUHpaN3Zuc3VGb0VEQzVYSnhhZU1UeFQ4TGRBWHlpYWtvYTNF?=
 =?utf-8?B?dHBpazdCUk1LbzlhSVRGUkRsd09Fb1ZYeW1PSUpDTDJCRkFHMlVzTXdaYjBm?=
 =?utf-8?Q?43hIvQ/BB7gmKnP5uA8tcW7SZ31nUeeDSMIJyOI+Mg4N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfde1117-b92c-458f-c241-08daeedcf9bd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 05:23:27.7618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOXqo1IStMxTfeDUkCu1yEaWX8QTL7+nsIka/A56PwgZiD2lKcVmAWv7oVMCtH8/Pr9zVnPIxe+cvuMJUDTy+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5796
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/4/23 23:07, Lazar, Lijo wrote:
> 
> 
> On 1/5/2023 9:12 AM, Mario Limonciello wrote:
>> All microcode runs a basic validation after it's been loaded. Each
>> IP block as part of init will run both.
>>
>> Introduce a wrapper for request_firmware and amdgpu_ucode_validate.
>> This wrapper will also remap any error codes from request_firmware
>> to -ENODEV.  This is so that early_init will fail if firmware couldn't
>> be loaded instead of the IP block being disabled.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v5->v6:
>>   * Fix argument to be ** not *
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 36 +++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |  3 ++
>>   2 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>> index eafcddce58d3..8ebfec12da87 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>> @@ -1312,3 +1312,39 @@ void amdgpu_ucode_ip_version_decode(struct 
>> amdgpu_device *adev, int block_type,
>>       snprintf(ucode_prefix, len, "%s_%d_%d_%d", ip_name, maj, min, rev);
>>   }
>> +
>> +/*
>> + * amdgpu_ucode_request - Fetch and validate amdgpu microcode
>> + *
>> + * @adev: amdgpu device
>> + * @fw: pointer to load firmware to
>> + * @fw_name: firmware to load
>> + *
>> + * This is a helper that will use request_firmware and 
>> amdgpu_ucode_validate
>> + * to load and run basic validation on firmware. If the load fails, 
>> remap
>> + * the error code to -ENODEV, so that early_init functions will fail 
>> to load.
>> + */
>> +int amdgpu_ucode_request(struct amdgpu_device *adev, const struct 
>> firmware **fw,
>> +             const char *fw_name)
>> +{
>> +    int err = request_firmware(fw, fw_name, adev->dev);
>> +
>> +    if (err)
>> +        return -ENODEV;
>> +    err = amdgpu_ucode_validate(*fw);
>> +    if (err)
>> +        dev_dbg(adev->dev, "\"%s\" failed to validate\n", fw_name);
>> +
> 
> Missed this earlier. If validate fails, shouldn't this undo the request 
> operation by calling release?

Actually that was original design, but there is one place in the 
codebase that expects that ucode validation can fail, and so leave the 
evaluate of error code and cleanup outside of helper.

> 
> Thanks,
> Lijo
> 
>> +    return err;
>> +}
>> +
>> +/*
>> + * amdgpu_ucode_release - Release firmware microcode
>> + *
>> + * @fw: pointer to firmware to release
>> + */
>> +void amdgpu_ucode_release(const struct firmware **fw)
>> +{
>> +    release_firmware(*fw);
>> +    *fw = NULL;
>> +}
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>> index 552e06929229..848579d4988b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>> @@ -544,6 +544,9 @@ void amdgpu_ucode_print_sdma_hdr(const struct 
>> common_firmware_header *hdr);
>>   void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header 
>> *hdr);
>>   void amdgpu_ucode_print_gpu_info_hdr(const struct 
>> common_firmware_header *hdr);
>>   int amdgpu_ucode_validate(const struct firmware *fw);
>> +int amdgpu_ucode_request(struct amdgpu_device *adev, const struct 
>> firmware **fw,
>> +             const char *fw_name);
>> +void amdgpu_ucode_release(const struct firmware **fw);
>>   bool amdgpu_ucode_hdr_version(union amdgpu_firmware_header *hdr,
>>                   uint16_t hdr_major, uint16_t hdr_minor);

