Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA64984E05A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 13:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3418710E663;
	Thu,  8 Feb 2024 12:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bhnZAHK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EAF10E62A;
 Thu,  8 Feb 2024 12:07:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTX7y+B/GKslQ9zdp55uMnIoEZlBJHiffk0Oq7bGRUV7TQYrDf91iLUM568eah7RcmiI+OgaEwa6G75XploRPtRCDVe+gUCLx++SVrsg1RRzA/ugwSfZRy8YDd3b6kP2RdI2IdNphJadSjSRdIrHb9JVvodOw+2KNtjkWdiFqDdmXgHiLYDfWjQS4p/GBgHyihZQXOWWlXM3ZB4KA9t25sEa7qYltMZMnyEFISGAjDxM/8+bF0cU3wzhLArBZuRIErQokb+ke/72l/P/AY0ubyW79IaSKk1ju55+8uk8pq/9qWoYG19FNzkZli34x7RrbwguZHvSPFzt1c+IR6wr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irxKAIabGC/19cZEO3YxRrxz9U7Qv1Yfhv5Bh2s/W9M=;
 b=BnKacKzOy8Q83gFSvdtIKOlWcoxjrvJBQuuHiWk4vM456S0K2kzqcEVP0KInIAO2rcGNeMlqrk8AqFmSrb0rYhKGDuxgAtr3PKmImBj2Hh3mHjoBENuitSuk1JKNFUHNK9vap/lzO/P7YiX+Bssl0mp6cRygJu9puylEhfc0/yf6jdMCYCZhCVycCnUR4YC93gc9aFyoa0F6kJLcSQbclIdBtlegVASKwHYreLmV2ctLoIrcSCNG6ZLXT3/uapAQcqwl4V5v6cAIw4kn1oiLt51S6NDCCFC5nCeVnPKx+0LWzg4mEQXMKVvBe3hISkAJ66pptL0XjxuwX1kR8+9zNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irxKAIabGC/19cZEO3YxRrxz9U7Qv1Yfhv5Bh2s/W9M=;
 b=bhnZAHK/FWAV1/wEdVHu48NratvNq4XAtv3ELL8y+23KcONKUh/SJemN+N8ISit07AG/2cJOYS5SdFXB2n9S/rSLax/R+jYaAuhDeiFdMXbzdfkLR+ROE8/c0mhOuBqbSdRave21B9WS4Zyj5EDBfvVruw6+HjG97SqtuwubTS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Thu, 8 Feb
 2024 12:07:04 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe%4]) with mapi id 15.20.7270.016; Thu, 8 Feb 2024
 12:07:04 +0000
Message-ID: <86b5d704-9e0d-b989-1469-665e41d9b342@amd.com>
Date: Thu, 8 Feb 2024 17:36:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/buddy: Fix alloc_range() error handling code
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, matthew.auld@intel.com,
 mario.limonciello@amd.com
References: <20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com>
 <07ed1fee-cb73-49ba-bef6-ca16b4c808e4@amd.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <07ed1fee-cb73-49ba-bef6-ca16b4c808e4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::10) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f0680d-ace0-4f56-52bc-08dc289e7668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2xVXO4oziN/u+emF+LUvJJWXOHJ+F6fyl2p+R01MBrTh4xGrd3sZYqv5g6mNaTeXMj7UYQj1ziN9djwnOFtx3X2D7QrZgXtLM5ATvsjCQqxU4JxyK3hJYZWHbNf0kWDq16ctX8Ce+lcQoR2Xl2yBUlSj78pwujrpg4JRNCQslEEVbHLYFSp6cjSVBRdOgBXMNzXe6OpGH+8vHCVygpfKYlj+puEr0OvtT6iSJIeISRtNZ/B+5/jIhDVFINGlHVdVH8f1jiWKjgD+XWnHFmqhFsCWc2d0KKdSqMOX/rVtYgq1wr/5MPnDduIRIxDpfrFZfcYS62xc0fsEJ2DrU3kSvX4Nn3KOf+WGpvJJ62XH6l2BowjDXGAsehKjye7vKyv3Fy2TN+zS4R5yiiTOP/JQUF1bi9h7bgC+CGPMiFQqnPfbOGZs+gREI4fDVpxvJJfM4IfOoQnzeakTIYtMQ01CPzrGNZtJsB70VBOuegAaEc5TXfvdIV1P48xGTjezO+CK9odJDknUQ1BMWHarjYK8TTJGSayXj1djPTZxQ4LmRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(26005)(83380400001)(6666004)(66574015)(31686004)(6506007)(66946007)(41300700001)(86362001)(316002)(66476007)(2906002)(5660300002)(478600001)(2616005)(6512007)(31696002)(4326008)(966005)(66556008)(53546011)(8936002)(6486002)(8676002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFhkbjQxY0RIL0RlVUh0czFSSnJKK1NRNStsaWp0djFBMFlPbldaV1NFRVBh?=
 =?utf-8?B?Qy9ObXpBMEdvMGIyemZlaGVTSlZybU01SVRhUVFNeC9JZEE2UURlYW5CQ3A0?=
 =?utf-8?B?OUpmc0RlSlBKUWhhdU1EMUNGWHdRUXdacnJzYXg4SGRhZnZYTVZNZjdsZ2t5?=
 =?utf-8?B?cnpjZ2kybWJhaklPQ0tQaFRGbXpGbzY3L3pVWVRkaE5MWTl2eUtVcUJ6SER0?=
 =?utf-8?B?ajZmMTlWak54M2NFbnN4cVNlK2U1WmxCRDZXOE9TdFVVWWYwMDhZaUN4b2hp?=
 =?utf-8?B?S2Y2ZlZYWHZMdE4xT3VYUXVOdjVuMjlUOERZSksvT3pxYmFMbG1jamIrcm9N?=
 =?utf-8?B?MHBlSE5MMUZvQXoxaTlwZ1p1clZFaUdiSGhLd2JaVXdJWGhKTWhRRUIyYk0w?=
 =?utf-8?B?Ymk2MytERUVNOUtlbnR0eVloaFpOOTY0ODkzemhLSXRnYTU1RzByRjdxTXYv?=
 =?utf-8?B?ZytpQXE4VDFLSlRsSzVLcDIyVlo4SW92ajdjTW96UEZCK0llUmtndXg5RWx1?=
 =?utf-8?B?NGpPdHkzdElIRE1Jbk44WFB2N2wyRkkzb2VGUGRiQmw1TVc4dVN3eFhTZk1s?=
 =?utf-8?B?WTQydlRXZ1V1ckVEZHpaZ05rLy93Rjd1Z1dLbmZFVk5LTk9WZ2hJQ3RyeG5r?=
 =?utf-8?B?b3pGSWdrQXNIUlR2ZWVlSnRHTWM4cFFHZUcvakFuSGNvRytkcXR0ZVNsS0E3?=
 =?utf-8?B?blF5bmZNUW8rand3SVlqV0dGZFRtSXFKRzl4MkdCYlR5OGdnTUZEUitLUjYv?=
 =?utf-8?B?U3ZhMTNxcm4xZm4zT0ZTaytuRkRSMjVBcFg5MllRenJNT01kMGlwK0w4UElF?=
 =?utf-8?B?TGdnd3BLS3RuY1hMZENzSXFzV2lLSnlMbjg5bnJGbTZZOURSVXdEMzYzRnZH?=
 =?utf-8?B?TG54elpOWUY0NjA1alF4cVJHeDhSU291V2UzYlE0WlNBSE03OThPTmc4eHFY?=
 =?utf-8?B?YjVrWWtWRFc5RCtjSGxWNng1aExlWUNzWlVrQzNibEU5dENlZ3RvZVNwdEpD?=
 =?utf-8?B?U2hBVGViMnZmNHdyYWh5Vy9ueTV0eE1WWk8rWkNOOXdiejZ3MExhTkFJUzZE?=
 =?utf-8?B?ckdWOU0rWTU2cGdsUVVUSlJobHBpYWd3MEVsOURSNU91dnl5WlVMVEJXaWFr?=
 =?utf-8?B?b00rcDNhTzhHbXh6SDdseSs4eUJsMkUzOCt3WmlmUFBJdW5QS1JQcU92UzNG?=
 =?utf-8?B?OXVwd0pzcVZuMnYzMEdyT0VYMThMSkhJMk5BdnVlTmIwdnA5Vkc1K1RyaDB6?=
 =?utf-8?B?V096VUJ3TVV3NkRJdnpnbDVUdldJQWZGeTNVSi81ZlU5UklZMG1ZUnlENGt0?=
 =?utf-8?B?NVRrN2JPWmJYS3JSUHNJaHAvQ2NWRlVzU3BZUHg2anF2R0thdDV3SnRibDlW?=
 =?utf-8?B?NjFVMGsrcTdaL1pzVElhNGZ0TlRaWXo0N011enFDcWl5RmttMjNSbGZHai91?=
 =?utf-8?B?ZlYzTkxiNE9Fc1Avc256MkVVcXNQTWp4eSszVVd3bXZxeFBsUDk0S3BZSVFF?=
 =?utf-8?B?WVUvYitZaXJMdVR5ZHVQOUJnSHB0OGIzSkorcFlLL09GQTQ0bEx1WFA1THYv?=
 =?utf-8?B?YUtDMnlWaVY3V2JoclNVbVVRTVJtMTRzREE4dTVpc05RRWNwaENtNGdQL1Jk?=
 =?utf-8?B?dHJmNSswRHJnTVVxSFVORjBXU291K0QxL2QvOUlXU0NrSU5CVFBNRWtiU0Jh?=
 =?utf-8?B?M2h6R2ZDRjhIT01pd3VCbnUwTFBmekwwZldjWlFNNnY2Z3lXdDJtYzR0MUhy?=
 =?utf-8?B?dTNGayt1YzA1R2hMRk1ONERIVStPOTh0TDZCZTI0T0hiK1h2cXluYldEcCtq?=
 =?utf-8?B?MTFTQkk5ZjRFSnZNWWlHZlZZSVV1b3FjSUs4U2lDTy83SS84YjF6V1F5U0tN?=
 =?utf-8?B?dkFCTmdOL0hSdW5jOHoxT3B5N3BTV1E1eUpTQ1dzeE5nTGVlaUdtcFNLemZV?=
 =?utf-8?B?R01nM2FLckNuQnBWY0t0NGJMK01VYjIzSCtPNkFQUTB2dUppRTc2ekUyL2Zq?=
 =?utf-8?B?VVhiV3BCM29HcU9BYXdNU2cyRno2YWJMbkgrVGFFVVVuMWF4YS9PdkxBQjdN?=
 =?utf-8?B?SHVZMjh0bTN5WDhuQmwxVmVmTXVNTXJLK0xQMWJUTHVpSnN3K011S0w5STdS?=
 =?utf-8?Q?q2t6e7xKVSLNV5/hfoefmifvN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f0680d-ace0-4f56-52bc-08dc289e7668
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 12:07:03.9866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yxm9+d4NHWl0iCiLgw9n6GCLTW056gqI6tCOk1uzhQZTqcJ4vDT9+ulWUWgjF5FMH+8CsQiYC4Aw9OHL0iCEiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085
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

Hi Christian,

On 2/8/2024 12:27 PM, Christian König wrote:
> Am 07.02.24 um 18:44 schrieb Arunpravin Paneer Selvam:
>> Few users have observed display corruption when they boot
>> the machine to KDE Plasma or playing games. We have root
>> caused the problem that whenever alloc_range() couldn't
>> find the required memory blocks the function was returning
>> SUCCESS in some of the corner cases.
>>
>> The right approach would be if the total allocated size
>> is less than the required size, the function should
>> return -ENOSPC.
>>
>> Gitlab ticket link - 
>> https://gitlab.freedesktop.org/drm/amd/-/issues/3097
>> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
>
> Acked-by: Christian König <christian.koenig@amd.com>
>
> CC: stable.. ?
I will check and add the stable kernel version.

Thanks,
Arun.
>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index f57e6d74fb0e..c1a99bf4dffd 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
>>       } while (1);
>>         list_splice_tail(&allocated, blocks);
>> +
>> +    if (total_allocated < size) {
>> +        err = -ENOSPC;
>> +        goto err_free;
>> +    }
>> +
>>       return 0;
>>     err_undo:
>

