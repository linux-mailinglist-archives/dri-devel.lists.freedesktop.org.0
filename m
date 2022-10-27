Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56160FC0A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A7A10E682;
	Thu, 27 Oct 2022 15:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2A910E0A2;
 Thu, 27 Oct 2022 15:33:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxJ1zB5Bd2mQWwLEeGV67fjESTzJvm+czqldJNMe5wcUxYZpf9S4U5CJIuybVx3UEl0484vgUuBK4j8BtGB2NVmE2pOYSTFootMap37PW/mOcnuHGNn7HvQFznUXzvP+R/MuQxvDraob+K126WCfRYCrslWIic7nUqqeqjyKXw6sTjy3tM6Z/0HwOFw0pAWlqexTwxNYEBqLRQ9nC21bP9Bc5H8mXgJR4BAwukRz6t5lsoo0e10zX3bRLOHTsXp62MjDDtHuo7ti5AxXa1qnygO6W1ia+T8VkfadNIpRXz0j5ULbNWU2e+DHjdXEfcjVtGKeQiN4/OK08+Zy4DRtqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZIRtf4h0jD29MAGe74Z10/hYwofAckkH6tcItJWpOY=;
 b=LxFp0FL58EajddQRB04WRZm4RWC9n+XNvkEa1fOaYdAylcJzEVDbVhCs0+dlyzVXwSgZb/JDedpqXki9mCRvJRu7J8EegqKSdwOQnox4o3GznbcyAxZCCtRW/nrigPLm9iutJuZgxzoAHzZNnNbAsI/rzgDBOeNyMkSVIRul/qoszIsFiXF6nWF5PdeW8dRow7ZidQuvdV1PMUvWQrmI1pycbgzbJmN552JTfhi4ziTfP1nM3yICTGczXvizXa7YJDWeTde4bjdNGeGMRUcYvzv15C9hu4vEkrm1Kd+6ftwEpmFpNz0VJg1j1U7NH7gKhzNHA05ALdIoztluB4YHfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZIRtf4h0jD29MAGe74Z10/hYwofAckkH6tcItJWpOY=;
 b=JzdZPEJoVmEfks6NEf9J2q+MTokVU94JI/sOLnrudr1/bXCm9NtaNEhFJYaWJOlULy7DIfaZVuFXyujSo871ku/Pq9r0DGP39rhdmyYcdCLr+RwY2ybhCemq8hoKnCmOCAcpTu21W8wG2EauPEOr1u9kmy7CtjHAtg+Tx63Ipew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CY5PR12MB6621.namprd12.prod.outlook.com (2603:10b6:930:43::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Thu, 27 Oct
 2022 15:33:47 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588f:c941:4f62:9d89]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588f:c941:4f62:9d89%3]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 15:33:46 +0000
Message-ID: <8a490cf5-6962-75cc-03c0-1d99cfadcc79@amd.com>
Date: Thu, 27 Oct 2022 11:34:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/amd/display: don't print messages that contain %f in
 dml
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221021163412.82029-1-hamza.mahfooz@amd.com>
 <be10fda2-eeef-ba74-0f6c-8ce01e7e2087@amd.com>
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
In-Reply-To: <be10fda2-eeef-ba74-0f6c-8ce01e7e2087@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::20) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|CY5PR12MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f036381-5c6d-48c8-53bf-08dab830a377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GnscEVBu0P3Rm4xfv2UKj5h6ayjtRiOeRntnPl9/QKnRhTKhm0HrDYfHCaK7gPBn+1lhUmGb0f75mURareESr307TnJ/4Q24siK/Mkh8w9i4hNUrO/jSdhOrRKxEOJrotqt3C3xTEed3NUIZJnEC64F5Vyr+18bYeZ+SdivIn87nis8akwCbbrsGSJdaPEs/cszY6f2uTabXKhm+o4cnDs97IY8SEa/xShPzC1y9mDgIm3pSv0KkXWkNlYFi66Yn0PjXoWk7tOt+eNp5sz8Ygx1qWUK3dEio2gTXecTlEbtICrh8EZ4GmiqwrDSQSjVCZEDSavyXXUb+USY13aBkshNTuNY7Q0Id1ikIKIq30B1UaUHcGqQzI4wlWpzWQ+X1IzYHk/+CmB69S1d+lfKZOK5St+h54V1NUkKn9TuoGXd7QbA4aCFifcfhmoW6Ff9rOas5dYlBPDNtHW2R/Jo3KRXpDxMFJiVX1hjNvAgpBr3zT18fxA1Mv8dNq9Kd/sN93yVtUkSuI35YPunmZOMIIMNrnWOYQqDPjCxgzV3mg+ktAzKExuP/AF3GPMMUkcliX3WOOQGMo9fISCh07iHvH07whqVLNKFuCuvDBidXJrqV1DhnKkv+Xb9xhpOB3X7Dg9krNsPz22HZSm+6Dnkn3oT0V1w20rKqQ7jPQx0MIrV01VePGWMyh/9mtxqo1lkHrlp2hrbXgWn9IHHfnPfNnK+tzOPAnFSvLu9kuUwiTzAPt5HQMfooNqkaC+fIW5WlWEzvN+rmV3+xtM1SibEaMSGgpEJmtj9J5OuoDb0Q7lc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199015)(8936002)(31696002)(2906002)(66946007)(66556008)(38100700002)(66476007)(8676002)(86362001)(15650500001)(54906003)(316002)(5660300002)(110136005)(66574015)(41300700001)(4326008)(186003)(83380400001)(6666004)(478600001)(6486002)(6512007)(2616005)(53546011)(6506007)(31686004)(66899015)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjEyQVBCbWdXVENZY3Fxc2luZ3V0bllDbjlwcDRKL1pJaGlJU01jcSt4a0VR?=
 =?utf-8?B?U2V4enllcGU0U1ZHbHY0S2RwVDkxWk9DcUQ2OVFMUGhQSjdTMTJ2Mks0ZDk4?=
 =?utf-8?B?L1dNOVFaQmRDTnFOeExYOFRvamFjYWNJclVkWTc5bEFjcHpMV1F6T3VISmhL?=
 =?utf-8?B?TUxGUVp1ZjVtblFYQzVhQWFnbWFpU3NlMFE0eENXelQrUEtwRmgwS2RMRmRz?=
 =?utf-8?B?K2RrRUJvV3R2SkpJWkFuRytKQ2NIdDBGQzVYZlpOL3BHOXpFdmVLd0ptR0Ey?=
 =?utf-8?B?MmFUMGtkdEY1Y21XZ1FxOE1HL2F1V24vMVNMSTZhclRRSWQ3QUVBUHlBcGVJ?=
 =?utf-8?B?ZlYwUWk4TW0xYktmN09TdGptSGR0eHgxM1RSU2tUTXVtZjRyUzR5Z3ZXbW1y?=
 =?utf-8?B?eEVQYVRXbDZha3cwdXh5QTZOTVp1eXljOUF3ejhtbkM0OVM2eXVVblBVQWxk?=
 =?utf-8?B?d3ZVRmJiNmtZN0t1Q3FIaTE4WkN5NlUxVWFPcHl5NERJUTh0aHY3MDFWbXpC?=
 =?utf-8?B?bE5YcERZcXRBSHVCT1lSWElKbkNKemhOVkhsWlB5Wm12cjhET3VYS2RzRG9m?=
 =?utf-8?B?ek1vam5LTnBkbkp6L2FSUVRjWGdaTWZhZysraUNGV01rYWQ5a1NaeWVzOGFH?=
 =?utf-8?B?QzQ0TjB6dVhIUG9lVWZEa1d1SVg5amVQY1k0THNqeFJXUEM0djNQcTN6VGE4?=
 =?utf-8?B?S0RkSGtEYlc0TzhqSEZUWnNpZXFjZGxZKzZpM3NKTkhrR1RSUFllYU44dmVk?=
 =?utf-8?B?ajBkMVpJMVpxUXdDOVpxN1BMeXdCOVJTSzdFUXFSVkplVlBsa3lJd2tDZlFy?=
 =?utf-8?B?amcrWjB5bU9MWkZDcDY0QWxtTXR0RVFvb1I0QVdSMmlreTVTd0JtM3UzcEUv?=
 =?utf-8?B?bzVuNkFBOFRhTjh2elJ3MEEwaFYxbkxjTFZiSXhaNHVzc1NtY3ZMUTdVS2lY?=
 =?utf-8?B?K3d4SjFKRDdtZ3dWalhZQzVXbmk0UWhndDkrWmNKMCtRalhHaWpxMTl0L1d1?=
 =?utf-8?B?b3dzamZ5VFpaNzUrL0xHb3NXakZZQ3RxZWZqdG5Kbm9Zdk1RSDZJaE1XdVFZ?=
 =?utf-8?B?dXM4cjByYXpxRXlHK0VFYjBiYXpmNE53cklvNmpyTVpiNFVzaXFWeG1WTkRR?=
 =?utf-8?B?cTlFaThJMGJOdW9xQjQwZkxRQ0FOK2ltYkk3QXkrUHRJalRPZ0sxclNtUDI2?=
 =?utf-8?B?aVJwUndCc1F0cTZjbmp2ZE01Z2dFb3VZUndBZXN4bEFRMDZDZ0lVQWd2MFZU?=
 =?utf-8?B?cHRZelgxUmo5Q2lvRThTeFRQRU9jWEJpemdHQlV1TmRCaXR1MEdPOXBodFQ3?=
 =?utf-8?B?SDV2eks2b0E5Y0k1cWdySWp1K09GZ2hvd2s2RmRNeThweXYybzFmNWpuUVJK?=
 =?utf-8?B?TXNxZTVwU0lld2o1OTF3K2twdi9wRkpLczN0L2p4QS8wako0ZlE4djAwb2xP?=
 =?utf-8?B?enZ1MnJPbWF5MmtQenkycXRlVlZuMnVTRnZQRW9UdlFlWEo4bnpGTFRnb0dK?=
 =?utf-8?B?b0xrTDlBVldJcHZIdUMrTzF5Wk9WbHhyWnZPa0xLQy9NZnh0RHhmcXNHeG90?=
 =?utf-8?B?cGxaVU5Pb1E2YnM4MTJVZzNrcjZyUG9US2x2ekpNMEkxMk9PTys0aHpRV0RG?=
 =?utf-8?B?bFlaRXlyK1pQUC9xcmhEQ0Q0KytpSXcvS2pCRGFMQjM2bUkwTDRFMlFvTEgx?=
 =?utf-8?B?bDBDdU9XTlplcldzVEZzckJscDZCcExKTHEvM3p6Ri9xY0Ryclpzd3kySkxC?=
 =?utf-8?B?L3lvaytZZFJLRlgxSy8vQjRXL2pDZm50U2Z4enhKd0dYMmRzcEYxb21DcjRV?=
 =?utf-8?B?cnBkNzlibWdBVGJFSjV4TlQ2akpyTUxubkZWWFI5WE5sdndRNU9vQmN6QnNJ?=
 =?utf-8?B?OXZvNlJ5eWhndDNPVXB0OFdUa3FCSEZOcVBNbWZ2a0NGMVppVFZobWI0YzZZ?=
 =?utf-8?B?RzZyeWVtQWU4Z2JZTm9MQW1OaWJkSUsvOXcrUDJXb1dqbG5PZGFqZkw5YUFZ?=
 =?utf-8?B?YkpHZVFWNGNnQkY4L2NXSkNEaFhxR0RxaUtidzVwYVdkSVZwRU9aeWpwM2M3?=
 =?utf-8?B?SXQ3QjhpNWlZMmNYbk1uUVo5WWFpeXp4Q0VhS0daK0M4emdwWnNWaHRFVU1K?=
 =?utf-8?B?Y2I0NG5hMUtFcUtTbkd2UGszaStuaXNSTHRpaXVjWmloMW8zMmRiRmMzMzB3?=
 =?utf-8?Q?PdtEYcIgNmNqo+cvi7uwwPo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f036381-5c6d-48c8-53bf-08dab830a377
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 15:33:46.8668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPpkspdHomikCFEr5qLdWHJL6EK8lJnIF7uZLRfmvj27i3JQcTKUKvyyohGn4to6H0a8vjbbl2C1mpELy1lk9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6621
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
Cc: Brian Chang <Brian.Chang@amd.com>, Ian Chen <ian.chen@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/24/22 06:04, Christian König wrote:
> Am 21.10.22 um 18:34 schrieb Hamza Mahfooz:
>> Unfortunately, printk() doesn't currently support the printing of %f
>> entries. So, print statements that contain "%f" should be removed.
>> However, since DC is used on other OSes that can still benefit from the
>> additional debugging information, we should instead remove the
>> problematic print statements at compile time.
>>
>> Reported-by: Jim Cromie <jim.cromie@gmail.com>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>   drivers/gpu/drm/amd/display/include/logger_types.h | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/include/logger_types.h 
>> b/drivers/gpu/drm/amd/display/include/logger_types.h
>> index 3bf08a60c45c..f80630adb5f0 100644
>> --- a/drivers/gpu/drm/amd/display/include/logger_types.h
>> +++ b/drivers/gpu/drm/amd/display/include/logger_types.h
>> @@ -30,6 +30,12 @@
>>   #define MAX_NAME_LEN 32
>> +#define __DC_LOG_IGNORE_FLOATS(fmt, args...)    \
>> +do {                        \
>> +    if (!strstr((fmt), "%f"))        \
>> +        pr_debug(fmt, ##args);        \
>> +} while (0)
> 
> This is absolutely not sufficient.
> 
> Linux drivers must be made for Linux, see the documentation about 
> porting drivers.
> 
> So just disabling the debug messages won't work in this case. Either 
> completely remove or properly fix them.

Hi Christian,

We have been discussing and working on better solutions for dealing with 
  FPU code, and we have recently improved a lot in this area (e.g., we 
are isolating all FPU codes inside DML). However, we still have many 
other challenges, and improving the FPU support in the kernel is on our 
radar.

I know this patch does not represent the best solution for this problem 
yet, but it is one step to enable us to keep refining our FPU support 
while keeping all other ASICs working well. I see this patch as an ok 
trade-off to address some of the issues that we have now while enabling 
us to improve other areas.

Thanks
Siqueira

> 
> Regards,
> Christian.
> 
> 
>> +
>>   #define DC_LOG_ERROR(...) DRM_ERROR(__VA_ARGS__)
>>   #define DC_LOG_WARNING(...) DRM_WARN(__VA_ARGS__)
>>   #define DC_LOG_DEBUG(...) DRM_DEBUG_KMS(__VA_ARGS__)
>> @@ -48,7 +54,8 @@
>>   #define DC_LOG_MST(...) DRM_DEBUG_KMS(__VA_ARGS__)
>>   #define DC_LOG_SCALER(...) pr_debug("[SCALER]:"__VA_ARGS__)
>>   #define DC_LOG_BIOS(...) pr_debug("[BIOS]:"__VA_ARGS__)
>> -#define DC_LOG_BANDWIDTH_CALCS(...) 
>> pr_debug("[BANDWIDTH_CALCS]:"__VA_ARGS__)
>> +#define DC_LOG_BANDWIDTH_CALCS(args...) \
>> +    __DC_LOG_IGNORE_FLOATS("[BANDWIDTH_CALCS]:" args)
>>   #define DC_LOG_BANDWIDTH_VALIDATION(...) DRM_DEBUG_KMS(__VA_ARGS__)
>>   #define DC_LOG_I2C_AUX(...) DRM_DEBUG_KMS(__VA_ARGS__)
>>   #define DC_LOG_SYNC(...) DRM_DEBUG_KMS(__VA_ARGS__)
>> @@ -57,7 +64,7 @@
>>   #define DC_LOG_DETECTION_EDID_PARSER(...) DRM_DEBUG_KMS(__VA_ARGS__)
>>   #define DC_LOG_DETECTION_DP_CAPS(...) DRM_DEBUG_KMS(__VA_ARGS__)
>>   #define DC_LOG_RESOURCE(...) DRM_DEBUG_KMS(__VA_ARGS__)
>> -#define DC_LOG_DML(...) pr_debug("[DML]:"__VA_ARGS__)
>> +#define DC_LOG_DML(args...) __DC_LOG_IGNORE_FLOATS("[DML]:" args)
>>   #define DC_LOG_EVENT_MODE_SET(...) DRM_DEBUG_KMS(__VA_ARGS__)
>>   #define DC_LOG_EVENT_DETECTION(...) DRM_DEBUG_KMS(__VA_ARGS__)
>>   #define DC_LOG_EVENT_LINK_TRAINING(...) DRM_DEBUG_KMS(__VA_ARGS__)
> 
