Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB37B0638
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 16:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E45B10E195;
	Wed, 27 Sep 2023 14:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3100B10E195;
 Wed, 27 Sep 2023 14:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLgie+xY+RDtePdk6Plv8Zhial2aiUlk0EerPDw8p7a00L6PjbpUS7n4SUugYLGi/+j9F3y0Bcehog4mH0JMDiRpU/VihUiqSFcBTqeTX10uQ2oNfiTjxSd9fPTIYH62/Imj/opB8it2G9y45P/PTkyQIjT9b1zikK8jiU4x2ILlCyxO2XQo5qNh8IQYMjoqF1hFvcx5PX1cShc/6V5yeyTqvELpc2Hx6jTXkO2KZiVGPkrJ68027gGMlETlOgrX/mGQYwK7VkJjd2Ha1MTOEy3OdYzULADO5JC0IalsiNh/2LlN+x/BNMHf5nDFcIGWnR52s8Bl8BOabXoQO7i1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I25ZeCsHBhisf9iXFToHipMAWXO2YeYo/WTXzeN6TS8=;
 b=FZ6gAH/5O9JTJ/dBuZ2pndxpLdrvCJxncM3n/swArdKPx+5V17JM3jP32WxXjiGmUpRzW6PciTxCNoOu9vpa/MN7NyHSmaG81ol6nr6lk37XYoEkl1Gz1kAdIWIAYicXpmZN9GeyQ9RkJ3Lzzdt+rZ9fCE3gQ3WLn+bC2sQW1UMmla8diYXaYVFup3NFy1wYXS7AuNAYLQh/CvaY4CnAGxFGAT7xJ4cp1r5TClPnvr6pCxFPvCTaHok5c0WlOEyhDvP/mI49I73SwWwVwU7eNy3P4LYh9h3wPjli9pJx40690pvrPUusNL+iu7c8TwYj1eBvCN1HyVf/e6vod1leuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I25ZeCsHBhisf9iXFToHipMAWXO2YeYo/WTXzeN6TS8=;
 b=KLNUwkJaYi/78NcEOkj1APwLTxG7PsLqyc4RtJ16Z1uMb4F8emeY0r56dBddBGc4AycXdWw7k39kyKWvKghW27RmMwyWNn3N3r6efB9cLPPT2KbczdioQmBQvihQK2fqcYZpfkHuoFfW09zuJlaxcyqnRXsglLhTOcpLDEzTsHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4853.namprd12.prod.outlook.com (2603:10b6:a03:1da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 14:07:31 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Wed, 27 Sep 2023
 14:07:31 +0000
Message-ID: <7375c718-86fb-4c71-a4b4-b96909181fa5@amd.com>
Date: Wed, 27 Sep 2023 10:07:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Fix null pointer dereference in
 error message
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Cong Liu <liucong2@kylinos.cn>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Tom Chung <chiahsuan.chung@amd.com>
References: <20230926055618.119195-1-liucong2@kylinos.cn>
 <a71a61fb-2330-4fba-85a7-9ba2a3642dc7@amd.com>
 <82ff7880-f323-b208-b52b-90bd568af934@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <82ff7880-f323-b208-b52b-90bd568af934@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0179.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BY5PR12MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e98cb6a-817a-4081-75ba-08dbbf6316db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nbxEKBMzj/2taezYjGrsfo3F0n7jyGMJMoivpxEsLCGy0iiop41ts0zU2/UpPBKuJNO7s/26o34c8yfajAQRoiiPH8LQ0nV0u8Wt5EION9cF5Q3ufE683fO/daJboeljceewZSxBAajer+CEStZWQa6FlWXLlg+3yhD0d2JdRJ4rUOu8vXOIDNIPajglUrifKfulSUFivpfC9C/JDT4bupwBAKzEWBKz8rJn8Pbmw5G5NaOfTQNJLPcHQopsXADNS+E7DLKCbmwiogu4TQL9M8eHYCoki7+hR18PXOmvmIw5C/KiWdYHuFhxsPeqoXe5ENASkxesd119XTBx4863KHEYE6ANzxJkKN/pJht7ICrlukQ3ipULD1jLMxNMaiqRWLR+YPg6jN/24y2laHw2BguynVcdEwXgebuRfjLUMEavaUrMi/epv0rbLbsGNH3hlm1+yXRg/K1Yh4/oUEe0Lc8Efjov4+45ITVIw7i61oXeE070qVLj7Wi7wjZPm0TRQYprA75VO0s3XJ4TdAqGbU70tEzT11nGC3uH/Oc0+5Jxfq61ktx5sc04+KQOzOg+OxJHTd/ibqxxtfeJJT6hIxIxZA3ykjAcjHHJDGkAbsPfR3xI2O12L6w6L4CfXwi/yyfwoX0mSQjIS6dUd6wBHq2qDcWOuqaM6ounT0IbZhs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(41300700001)(2906002)(38100700002)(83380400001)(86362001)(2616005)(6666004)(478600001)(921005)(6506007)(36756003)(6486002)(6512007)(53546011)(316002)(26005)(6636002)(66476007)(66556008)(31696002)(110136005)(66946007)(4326008)(8936002)(8676002)(31686004)(5660300002)(44832011)(15650500001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkY1RU9hekpqc1lzUzlJa2pOQU9KQjJvRHhWZ1VuRkNXcjByZGRwRzFmOFRU?=
 =?utf-8?B?MjFWaDU2Zm5jVDljbVJERmZLTFJSb3AxZG0rSldVV1BTbmVucnBXbFc4M2k2?=
 =?utf-8?B?S3hIU1FtS29RU2dMaVdMb1BOQWlTbGdFTmZ3TEpkOXpZcFJyUmJ5Q1ozeFh5?=
 =?utf-8?B?aU40Z2VYcWhkOXk3bTNITEs2NThDSUxxcnBxY2RhRWYwdTkwSFlialFFWE80?=
 =?utf-8?B?bm1UdXB0cWRSdlJmZDVDRG1yZEk3M1JpdUE4TmpFVU1mZEdJUW8wQm0wbVhT?=
 =?utf-8?B?RHhhRy84VFRCRm1wNkxDZ1NoSGdieS9mTXF0a2tHRVAvUXd0SHFNS3JTN1lW?=
 =?utf-8?B?RUFEV1VlaUdXQk1XTmFPMFdpVFNEa2hBUUFMUnhCeHJ5K1dlQmo2Zk5SZ0tS?=
 =?utf-8?B?QktDemhHWWsxcE5LWWZRSzBxWUxudk9xZ2sySS9jTk9ERHNBZ0JTZFFUbFpo?=
 =?utf-8?B?Qkx6ZU55dXhCNzdiQ0dIQTUwNnBhdVdQWHB1OGtKd05tNWRsdUJWSENXNnVz?=
 =?utf-8?B?K1JNamVzT3dnSWpPSldiN01rM2M0VXJubU45UG01dytTSmNtUDBaQnZnMi9R?=
 =?utf-8?B?bHV5U3RFMzVwcUhPLzFyRjlocHk2L3IrNFVOVXNlcjVDRkk3RkZuRTRYSWhk?=
 =?utf-8?B?aCtpTmhjZElEVStXNjFQTksxY3dwOGF1bFBxcHpWQllJbHBGdXpYcGVoZlhB?=
 =?utf-8?B?Yy9kTWRLNHdnNkpBN01oYlJxQTBxZ2tCd1l6cHYrZjFXVVVtNjdyVmdiekNK?=
 =?utf-8?B?c0RuV1NJYWJBb3licWFHY2pLbEpZdUJyM3QwR2E4UWkrQ29iU2E2UzlnU0xW?=
 =?utf-8?B?NkZpREZTc2VubHZneXJweStaSk1HZFpBOTZSNzZ0RUNXc0pyOTF1UVN0bkZ6?=
 =?utf-8?B?UWNQMHR0YnFMM09UeXpTZHJzVVc3NlFzd0ExM2FPeGNjUStONDhQNmNKQzR5?=
 =?utf-8?B?Qk1YSEdrOGc2cXNkak1vM2RVbFlXaHNvMG9YNVAybU11K1haSUdrcEFxSnIx?=
 =?utf-8?B?N3BDWjJ5K1pNcllsYjdqOXdpT1V1cFFGKzNWdTFNZ0o0NWVXd0N5VFpZbXRE?=
 =?utf-8?B?VkZsYWNEalFROGNSbHYvWGNCZjVVeVREZExTU2lpdTBYK2ZmVW8xNmd4MVNa?=
 =?utf-8?B?ZzJjbmFTQkhWTndINDdMMlU4eUg5Njczeno4V3NqU29DR3RkQnd3eGpnVVdx?=
 =?utf-8?B?dEJiSkxZUDJMSU85WWpnWkQza3YyT0c2K2ZDSDNDWnVxYnI5Sm8yVTcwazJt?=
 =?utf-8?B?RkY3OCtTM016WGhVUVFLYjRoLzlYOGU1MG5MbXBJcS9YMmJ6MGZNMTRydWxu?=
 =?utf-8?B?YU1rWEF1MURYOExSQmUvOS94Ym0waVFSVFFmZ0g3NU1RMllYRnA2R010R0tj?=
 =?utf-8?B?MEh2VW9WTGN2KzFXQkFrRDBxZ3hhdXcyRVNzcVdUZm9lSVBUUDhnQzB0T2tn?=
 =?utf-8?B?bWt5dUQyQzFVWUM0K20xWWRLOG9wUEl3WXJJM2l2QXVFSWFCU28rMEVzbGNv?=
 =?utf-8?B?c2xTU244VlNRbGFGTGk0S1Z0Um9kWHE5enNZNHlSSEUyMTFJUjNRUTZLWU52?=
 =?utf-8?B?V0NxeUx3MG5ETHUvcG43a3UrYkhzQ3V5RDBHREgyazVyNDBrQlVnL0VIbGtE?=
 =?utf-8?B?THVHR0ZrM2hyUjR0Vnliei9SdjJaRWNPd0g4UXhkYlRORkRKeWIzcWN4RStw?=
 =?utf-8?B?V2N3RVFGUDhlL0QvMDNIVk1zM2ZvN0VxcHM3Wk9wY0JEYlpkaCtUa3c3RWNo?=
 =?utf-8?B?ZXQrRUNmdkowN3JNVnJnNmZDZGtFSUgxV3pWZVhTQS9qKythVFBrSS85RXQz?=
 =?utf-8?B?NkhwRUptOSt5SU8vakRGdk5CZU10ZjYvYTdSRjQ3bWx6eVNSNTF3ZlBXeWkw?=
 =?utf-8?B?blk3cE90czJONEpLQXVVM2NGb2gwekZTMmxYYy9QYStvWUpiU0RWRHNkdWx6?=
 =?utf-8?B?ZUpEclk5TzNCaC9VdHNGY25jcVpPR2lOcFFESjk4cTR0OEY5WVRxSUVXNkJE?=
 =?utf-8?B?b2JjOFdQWHY3ZkhhRUdZMHBKL3dBT2RqU05SeXNmdDFYeEhCKzFqUlRLVTB0?=
 =?utf-8?B?a0VLUVdLUjIvOWt5SUdhTE4rU1cxN2crNUUvUTRnZzFiclV4eFZGL3F4ekZm?=
 =?utf-8?Q?z7rK1erZ6dhwDDaqxPxkuFxIy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e98cb6a-817a-4081-75ba-08dbbf6316db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 14:07:31.1123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hxv3LD8iGghs+YpR+JFIftNGDctwFtq/pJs1RK/UhDHKihBEHv4kOKgSnZsEeeuyo/bIm/m9nTZjPJnANVcBXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4853
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-27 01:23, Christian König wrote:
> Am 26.09.23 um 15:09 schrieb Harry Wentland:
>>
>> On 2023-09-26 01:56, Cong Liu wrote:
>>> This patch fixes a null pointer dereference in the error message that is
>>> printed when the Display Core (DC) fails to initialize. The original
>>> message includes the DC version number, which is undefined if the DC is
>>> not initialized.
>>>
>>> Fixes: 9788d087caff ("drm/amd/display: improve the message printed when loading DC")
>>> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
>>> ---
>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 8e98dda1e084..bf52a909f558 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -1703,8 +1703,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>>>           DRM_INFO("Display Core v%s initialized on %s\n", DC_VER,
>>>                dce_version_to_string(adev->dm.dc->ctx->dce_version));
>>>       } else {
>>> -        DRM_INFO("Display Core v%s failed to initialize on %s\n", DC_VER,
>>> -             dce_version_to_string(adev->dm.dc->ctx->dce_version));
>>> +        DRM_INFO("Display Core failed to initialize with v%s!\n", DC_VER);
>> There is value in printing the version number. Let's not remove it.
>>
>> Instead you can probably fix it by doing a NULL check on adev->dm.dc->ctx.
> 
> But as far as I understand it adev->dm.dc->ctx will always be NULL in this case.
> 

Thanks, Christian. We're in the else of the NULL check for
adev-dm.dc, so obviously we can't get the version. Silly me.

Your patch is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Regards,
> Christian.
> 
>>
>> Harry
>>
>>>           goto error;
>>>       }
>>>   
> 

