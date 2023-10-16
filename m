Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 979517CAD21
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A517910E220;
	Mon, 16 Oct 2023 15:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ADD10E21F;
 Mon, 16 Oct 2023 15:15:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRUUj1sz8EpIuTEnFvE05bQpRxHuc4udqNtLlsOg1Pukh5vcKNNiR4xYc0hO5qQ4qP4JYSW5k46p4yxIasIThIspE34fzrGxEnpcsF4xEPr7cWrwIGd5F+sldlv5edqCGxyWSlPTGtj42KgCEg5/vZjPmK+4tEKPARSrltqAw9WYp5aMEQa5fCMXo5iZMIEWFpBD9STaO75U3MZ5H/bBAX4BjE1Lc6g7Fx0nTy1vNdeKry7wvNne95WHaKv8M2lvPJr4GpyRKd6hpMill1YDCytC9N4mmj5/18z6rEKJjD6wCUQdyo/gtq45vvIgML5G2Q/c+KE0SP2uLQOyvkYCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hUeuEHwNipwNdqbtCdRT9GjWd7Oxl+Kjx/XnARTsyY=;
 b=E21aGe8KUYtXtV68PidhOQuOVC6AWc66JUy6SjcGngqDFBatqaW4e3i+stamjz6mjRjZGhqRDy9RIF6LdtYCMNTtT6Dw7Dw7aGQ7RhfA+0ECnRn3gie3vEqb9PJztiYh15YnW58U/gs9bsBlQO2yn99JBEnlTUlxEW/A6R9bAU6BJevZPyIg+mGOQfv6Di+0ls8sOQqzndssv+R3M0RKncFFiDAqclZdwn5QfDNEj9QATPzRG+L/Pz57DNgCPjtibc6xX2ZhOF6pZDOHLQQYVK6F26zwE6nJZTMRoKJSruOw5u6SZ6eRejvW87zX7Egq1ezjTjbqjwwJHxCUiMoj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hUeuEHwNipwNdqbtCdRT9GjWd7Oxl+Kjx/XnARTsyY=;
 b=aJvd2Q1UDlz5G7XT/XLyBmvBDCyOhirjPdeaiBqL4b9slxDYAYOeGrenLVx0WfN6khNt7Ai/2MtRA+pVWZwme2EaQYGEYTIO1V7RHFXcLGn8JA12WkKxMSJQu/nPeBVinHTpG7s2yh73q5XQSjA3foOkj7SihtRyw1nj7aRUzzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL3PR12MB6523.namprd12.prod.outlook.com (2603:10b6:208:3bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 15:15:43 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:15:43 +0000
Message-ID: <aa84df09-e380-4fc2-86cd-51f443a97f9c@amd.com>
Date: Mon, 16 Oct 2023 11:15:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 6/7] drm/sched: Add drm_sched_start_timeout_unlocked
 helper
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-7-matthew.brost@intel.com>
 <89fe70c0-5fc1-4023-ba41-32ad130b72e4@amd.com>
 <ZS1PTWsvr8DFNnLj@DUT025-TGLU.fm.intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <ZS1PTWsvr8DFNnLj@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0007.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::11) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: dff8e235-670c-4a94-c433-08dbce5ac41c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FJVjvWq5dKfAJl5sgfmPqOHSbU6sCbvnguYJZjzP0aZHVEmLEOrHUFoJKdeV6vQCtlVivMw8MrqLAMhN4MkPLcXgsac0oYwBPN0i3zcx/DdeyQn156zVDftfZKCc53nv75rD9o334+lpFp17a2fULDsJu8Kr3n1PgufRHCvc6a5peYthndZkdJxxGPL6WiJ8yuBnc3lSC3jcqK0JCFDTRlnb6TNjZc36Gc4RRXtLEHfbJtxiwEyhSlvFrhXwqFEjUiDi0yytBJiy6MB2XLzpV5A+OhzUvevVlxkBzyknQa2gx/hMr4+g4CzOO0C2+okKjEu9npcLSjiJ/rsXPSFn/qtQcmBSXne1fFUBJBOixWKYpVp1lk0Fxju7xVhnKHygTDK3Z7gQGG3r+Rumj16wAbry9RkU87zPQ2eIBgGh7JB6drVa52n5Be7HKlnbZlnYsYvRpmLD6PdJw+kb2hjO0wzwytFtkXBsWkxtHe+Vo3AzjPBl2TZVk+uypzywQ/gV8v9shVIHkG4PG1Vxd8Wl/bakvKZ02kf4wZalJiWdSlpVpBZzhPlqoqZeCAS5JD2g2TK6DvYNpuZ/WP0abKQT+9S/Azh2GvCcreZ8iYippjEE0JEHCBPeeur51iCkOL+v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(86362001)(36756003)(31686004)(66476007)(66946007)(6916009)(316002)(31696002)(38100700002)(66556008)(83380400001)(53546011)(6506007)(2616005)(26005)(6512007)(4001150100001)(6486002)(4744005)(2906002)(966005)(8936002)(478600001)(44832011)(41300700001)(8676002)(7416002)(5660300002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bERCYXEvNm51L3F1d2V6SW90NERTNWRHc29kZGEwZ0tYZU1YMnZ4S01XMDdo?=
 =?utf-8?B?c2FucnZRcU1DTHcvV1pxWVpjVVBFb3BFVkJ5QjMyLzlaZi9INEF6eWtvOWdR?=
 =?utf-8?B?OTNWVlZqNHo3UWN2WnZ2OTU4V2JjWDVJWjRrSTZyRkowZWJtRXdYckc5NXhO?=
 =?utf-8?B?Z2Y5Qm9ySm90aHR4TzlDODcySExuMWttRXlZdWY3aUdVeHR0dzlOZFNnM21B?=
 =?utf-8?B?S2s0L2NWS0tyN3o1Q1VZT3IraEZNZHBrSjdpMXNUakdJRHYxZ0tka0Q1UmpG?=
 =?utf-8?B?R1BPbi83dU0rcmJFUkk3dUhXUXNpOVBZTmdJMVB1M1l6Ky84am44T2JpY0xa?=
 =?utf-8?B?WTQxMzF1MHIxZUJNMHN0akNOZ3hFVGRRd2VMUUNBT2s1TnFUNUo0UzNTb1hY?=
 =?utf-8?B?UGt3VDVYbGsrZHdLNk1MMTlRZ3BBcXErVjhNbXZ0QXVJTlp0N2RsN1RaQ2Va?=
 =?utf-8?B?a0pLcTI4cWV4dzhWd3NGaGlPd0JENjdSb0hnYnp4NGRhaTdxTm5GSFc1MHcr?=
 =?utf-8?B?T3FacytFeGwvNmF0NnJyYWZTdm03bVZPc3pkWmNJNjJ6ZExoWXZTcXZ3VFlT?=
 =?utf-8?B?eFQxb0owTWVvTXFrQmc4VSsrMmFmL2JOZmxwa1JUeXkzYU9pb2hXQ2lOMTlN?=
 =?utf-8?B?a09ycysyOGFVbWYyVk95dkIzaG1ha3NBNWVBSHlpaDRhT0ZvdzZ0YWIrQTlP?=
 =?utf-8?B?a0xLTUJIdnBJaU5QQUhXZWxicXVGL0l0OGtUVm1iUXpkcC81ak9iendtTGhS?=
 =?utf-8?B?K3lLcmlKUlY3UkZnMW5obEhYcmpBbU9nc1hSTHhuS3U1alRBR2M1ZHVWMk9E?=
 =?utf-8?B?Uk1PL0M3YlFRcFF3WTRJQ0dmc3BoV2hMSXRObkwyVkJFVnVTdkdmV0Z2RW5x?=
 =?utf-8?B?eGxJS3Vyblg0U05NekRmS3VVS0R2L00rWktLSXVvUVBiOS9JbjlYTVo4WDB0?=
 =?utf-8?B?N014NEdoZmVZNHBuWXdZUlpwZnhzVmdoRFN2Vkxkb0tRdVVxdGQ2N2tlOS9t?=
 =?utf-8?B?ODRsaWN6Mm1CS0xZbFFWeFl2a2xEdDVMKzU3a1VjMnFXbFI0Ym5zNjhOVU11?=
 =?utf-8?B?KzlOTnR1dE42WGlDVnlCSFAxSXExM3BSUklhY0M0aXp3M1owUjZiTVNSdE82?=
 =?utf-8?B?TExOTysrY1RIQTJXcWI5OUZldVNVaGlKSXlobTc4WEFHWWRVak1ZZmFVOHlX?=
 =?utf-8?B?NDFXa2I2c1JJbGV6VEtiZkJpUU8xYlFhaEsveHh2QnV3TndrNjNjU0pFQW8z?=
 =?utf-8?B?MlZqR2xvMGhpK2svbWtGdzVVUk16V29GM25VeDJtSU00cHlFTzh4OTVmYTQr?=
 =?utf-8?B?ejRzdkRpZWhnVnR2a1BtRUQ0L21LRERZbVRyNm9SVFhBUFNyUVlXb01oMGdS?=
 =?utf-8?B?NlFYaGFBeEl5cE1XeU9SL0MrOGNFUDZZQ29xMzlFUVRBdWRyQVF0Y2t5V3Rx?=
 =?utf-8?B?ZG9ZYXlrMUdkYkppZmQvU0pHeklBTUxKdW84clJHY1czUFk3RzZtazQ1ZTJK?=
 =?utf-8?B?dDdvUnVmWTk2NE1HN3Q4M0swajczNkYwN2JrL3hYYldvaHFUMlNsRk1MV01K?=
 =?utf-8?B?NEI0bXhjOUtoK3NpVGJWci9ISkFHVThFak5jSTF0bENnbzhpSG1OU1VlVzRs?=
 =?utf-8?B?L1Nnak1LVkhsUFN3ZnMwYzd1TVIxSVZ5MDlhS09neko0TXRKQTMwSUljYXFl?=
 =?utf-8?B?WDJQek5HbitteG5iR2pjaHpxN0JFRXBoK1lURFhUUk1taHh6WWZyVXlQYWQy?=
 =?utf-8?B?anVVOFcxOHBod3g5RzhpUlJsZ1d2ZlJVNkEvNFlsNXkwL0IvMmpNNXNYQ3V4?=
 =?utf-8?B?Q2VQOHhLbUF4Nk5qa0RRblhWb1Y1RERjT2xIQXQvaEFlK0NPRTBzRVhLaUNY?=
 =?utf-8?B?UExRd09EbVhZTXh4MGxWaDA3Tk1qZU9SOGVveERoV3pDTUt3K0Qxa0lDeDZ0?=
 =?utf-8?B?b2xlcUNoTXluOUcwRFZEUUxZSUNqbU1PM0ZoRXVwMlc2QUdvWm8vRXVCTGhZ?=
 =?utf-8?B?VTc2dVJxaHBsR25sUjBWSE4xQXNYRGZSSGFUbW85ZHFSTHFER0lLcTZFVDkv?=
 =?utf-8?B?RU9hcFVLM0o4YjN5bkV2UDU1Z2JnVmRVYzBUNUpBMzF2ZysvRXUwaWhTNXdC?=
 =?utf-8?Q?JzMw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff8e235-670c-4a94-c433-08dbce5ac41c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:15:43.7113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYMsPtCENRtFk/kXm8LGWTdkG52wl+57R5wZHF2y/v++3x+md/j3G5ikbgkk5vMX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-16 10:57, Matthew Brost wrote:
> On Fri, Oct 13, 2023 at 10:52:22PM -0400, Luben Tuikov wrote:
>> On 2023-10-11 19:58, Matthew Brost wrote:
>>> Also add a lockdep assert to drm_sched_start_timeout.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>>
>> I don't remember sending a Reviewed-by email to this patch.
>>
> 
> I believe you did send a RB:
> https://patchwork.freedesktop.org/patch/558222/?series=121745&rev=6
> 
>> I'll add the R-V to the commit when I apply and push this patch,
>> after replying with a R-V email.
>>
> 
> Is manually adding a RB ok if it is in the correct place like it is in this patch?

If you've received an R-B email and you're reposting the patch, you should
append the R-B tag at the bottom of the other tags, like a tool would do it.
-- 
Regards,
Luben

