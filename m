Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECD4633532
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 07:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6E410E38A;
	Tue, 22 Nov 2022 06:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CB210E38A;
 Tue, 22 Nov 2022 06:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTW9so89s74eJnk3PbK4TBrZX4lhT1nJrRwPIJqfAnXaArKTlqPPyHQIZj4605+ZUWyii8o3bAs33qQdWldANPaluj4MuWMdfMXPrpKhFzOtO/FdESoykrMgdcaL+YGo4wrUMWY4NjDBZrKImvn0V2LKbYoWhgjeVBbLdw1e66zJdp5dykgerXMFY2SvJvixWBPyM5BF2UQb9rW0kukOO3CK+5iclazqOKrYJCGUb4lCNr/Jitz4va2X8BgWlyGAsgDwX7Rh4izc4kFqZgJjodRR0pDIMgh3g21bahaLDeyRpa3BZyNNNvJwyZ7swWolRHUKXC3Hbhxht6flqWDIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WAHtv4MuTP9SsXDRfgY4mqMqAGFZenyloDLp0OcDVA=;
 b=KrxRUtj+NHb4toYInDIG81PivU5OcH7vSB4o2jHmd90QMQfzc5/Rz1doeOtm3cfetIBcLjRm5V98exzRA3eBRrybGEhcu/rvURoMT4rvtSmkCETGgxPRCArTdyln3QDS08lSCri4Ik5gj9EnOVAQCNINRJW4Di2abhSaGE8beTxZ6t0P/52I0pUoLmU/+n6BIS66dY4alHhPr0qFXwVkGKhZ6gSziOMPPz7fWTrejkO668BViMLMFIRbFSrl+zbdTnfRWB3cbGUYseQircMcJRiTXTD+q/XRHoZTrnXig3cO8MW0vlw7Gq2gsCM2Gd5cwhUsmXgqsWMnTttQnTI7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WAHtv4MuTP9SsXDRfgY4mqMqAGFZenyloDLp0OcDVA=;
 b=0F+f2win3VdiTv1JGnUWgAQZKxaX7g/n1stDWtlpj3sNZ+N9HlVtiDIKcKe76gHdmlobote1Dkge1McH+7BPMcWaV0oSket2UDl2f7X2xoJIB1YjElQFUF2jmAyjQhexO7HvMg3ANy3Xogp86RbkgyguS++Xx+ZoiesxTOiePjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4160.namprd12.prod.outlook.com (2603:10b6:208:19a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 06:23:54 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6755:9455:2407:ea3e]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6755:9455:2407:ea3e%9]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 06:23:54 +0000
Message-ID: <ea5b5584-f041-3bfe-f7b7-9cef13e09786@amd.com>
Date: Tue, 22 Nov 2022 11:53:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] drm/gem: Remove BUG_ON in drm_gem_private_object_init
Content-Language: en-US
To: "Somalapuram, Amaranath" <asomalap@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20221116085012.187756-1-Amaranath.Somalapuram@amd.com>
 <20221116085012.187756-2-Amaranath.Somalapuram@amd.com>
 <fa9ecb1f-17a9-c7ce-d25a-42c3860f1b8d@amd.com>
 <4afc480b-a211-dcc5-1b8f-7c097f2c6a7b@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <4afc480b-a211-dcc5-1b8f-7c097f2c6a7b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0223.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::16) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN2PR12MB4160:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c9697d-80f9-43fb-e4d2-08dacc5220f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L56V+6GWqu7DmqU/hxDWj+9ruVyaYUpqG7qrctl2mPQ8EJU/tKE0oZt9thLBVH6fa2J22BtBillBMILPOhGl+I7siO7UByp0v8ZDz6gTGsyJSQbpWTHs9jdXwDJgSzcBjvPSWSiGYvuDg9Qt0BG3ykBo7Z1sBhlesrNVWQVy/ePhxK5WEfiPaq55TNT/CV1Yc2ik4j9U0Mn7PAP1Tz2yUZYBL90Z3SR1OVVIZqa8K9y4YpdVvDPercHMdKaqgTMxjR/cMaqrLXEO9/OvFDnzdpmFl/pqH2pChHbw5uVbrFtHdgYAC+ppmwwnBbkf80a2fJSP4BFwmC7cyZQvPyOnpUP/QRFrLvY+p6CMr29WIIAHqDXpYCxirbXDG7nloq1mBic4p+EAq07cAvVmJOOJUOm+pe3HtDg/QNK7ssTG6E2xn85AGC4INyiTHcCSuR0CjRD2/KdvWcwNGiVOHegUN/ikRGgNyC+qFE3o4cjeKbqWg5RNhKSZmKObe8DqtDdaanY9QOtX1ud3KTt9zJTNNhFI5gs9nNzbk3cNEIm7tdQLCy+62sjAqkeTwSKDvM6E2wC8crUUvcL2IX1tTWSu4H4QwOMngI1NVaRB5nOpnatu4dsoe2gkmHBuxH7DVDM1Mf7CN8JWjNUGiOMANZA1S9lwCne+0LXTTiHTznhuPEB13na+fXOWgNfYE1BSxd8W2dLcLqNQk/FV1RRwGm88hdDGVHCTlpHMF2VQ5dRGr+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199015)(6512007)(83380400001)(2616005)(186003)(53546011)(38100700002)(2906002)(26005)(5660300002)(6506007)(6486002)(66556008)(478600001)(8676002)(316002)(6666004)(66476007)(4326008)(41300700001)(8936002)(110136005)(66946007)(450100002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJCZWl0STZTUm1SeHB0em9neHpNMXZyTmZCNkhaOGJaZXhtYXUwRUl0Vm4y?=
 =?utf-8?B?TFJnK2dJQ3VDQnkxY0RQck1VZVBlZTY5U0VCMVBPUEtJc0x2SWJ0THZwVDRt?=
 =?utf-8?B?dUI0M3AxK1p3aEFpRjlUb3ZUdGwxa1FZOWZ4THA4eHJ4dWt0Z2JCaVRPTytt?=
 =?utf-8?B?MUJFYUhYa1hBbGo4bXR0QXRlM2JkZ1F2VGhpbGNJeWN4anF0aEhFRFpCQytI?=
 =?utf-8?B?Rk9JMjRtQmdYajJoc0s0czZ4bnVHMVhkK283N1dtQTJMZW9VdWJHL1pIb1I3?=
 =?utf-8?B?Sy9ScjhmMWtyN3VKV2pSMStqeUJjWjdNeXhyVXRQRERUa3pzbWlLOHVlMHor?=
 =?utf-8?B?dG80c1dLRkc1VUVtUW5JN0d6cTFnM2JSL0ZtcGUzRFpCejg1SkVQUVk5K2Fv?=
 =?utf-8?B?WWt2U2VqU2picHpDc3Q5WjB6S05BMEZDMEtNbnRSQzV4OXhFMGp4b09oemlK?=
 =?utf-8?B?Vk1YbjBvM1RkSG1vWVJYdnB4djNGTXE1eVM0VHZ0aldsU2J2SGhJNlFnRHZ4?=
 =?utf-8?B?M1Vmd1JSa2Ywa1ovNmpTSVN4eHZ5Y1dmTXM1cGphM1kwSDhOWEt4d3lFck42?=
 =?utf-8?B?SGNKUjd6d2ttT1IvY0RYVFRTNDJTVHdXTVFBTVFvWDVqVitWTXg2WldlQTJ3?=
 =?utf-8?B?Rk10TVNmeHExMVAwdnhpaW1NSWJLTitaekgwWGhGL0wvb3l6ZEZkRzN6Z2ht?=
 =?utf-8?B?QUIwaUQ2TjY3RDZCM3ZKeTE4MmtmK2pqTUdYcDZ6RDhCdkJzZjY1ekVyMVgv?=
 =?utf-8?B?Y3pQb0hNOG80YkxTZGZ4VXhEWjljL1hLYkcxeEs1QWR6Y2RKUitUT0tGV3Zs?=
 =?utf-8?B?Y0k1SGZBZ25YNTNCNENRbjFLcjJTWTN6YWowVTY2eWgvNU00Tkc4dnh2UWsz?=
 =?utf-8?B?QmxmMXNCQXhUU3FGSlBzalR5YUs2NCtYMUZSMVRXbUhoM3ZkSGpIU3J3MTNu?=
 =?utf-8?B?RlMzY3cvZ0QvYnBFdCtUbWtHYWFpdTZqeXAvYUY0S3NEU1MrNEYyMkdiRW1s?=
 =?utf-8?B?YmhTSWpGMUxoT3VmcklNU1hqdGx1RUIvWmxIbTBwM1EvM2ptanlvZzFCdjFN?=
 =?utf-8?B?TzlLMU4rSnBLNDZhd3BBZzBHUjZKQkp0T1h4MTZrVzByeGduczRoSzRJQlhk?=
 =?utf-8?B?THlwWkM2T1lCWWl6V0xScDRRVEdhdTdjNzBRdzJ3MkwzbGw5akR6ZFg0YkZp?=
 =?utf-8?B?U3ZOb2hYR0tUeXpFZVQ5K0hNZmVRZ2Rva3VsSlptcjgyNUlzd0M4QUYwaW5M?=
 =?utf-8?B?TGlwV0llUC80L3BBY3JETklKL0oySU1HTnJKSWo3SUl1ODZndFVRczFKR2s1?=
 =?utf-8?B?OUlOL0JCYTdUU0RDWnUxOFBVVHllLzE4M1AyL1Nhd1RKSHFxYUdRR0lKRCtN?=
 =?utf-8?B?bDZyekw5RVZ4Qm14YzlGTHdoVHBmL2p0VGR1MFJtbEFsZzNyMlo3NDVqaXJN?=
 =?utf-8?B?UzczTHF2RVlSQndhaENaQVNPR2k2Z3hBZlQ5ZzduYTJlOWM1blV5Vkw4cW9w?=
 =?utf-8?B?QzVyRmNiVmdlenFONXBUaXNXR3haalpPVk1YL2tvaHcwWkY2VFQ3TXRrUStM?=
 =?utf-8?B?MExTY0p1dFJDU3luQ2R5RmE3Ymg1bWhHNDBGdm15bkgvQ3lkWTVBUG1EQ0E2?=
 =?utf-8?B?UFBrMVhxNVMxeWUxZFlyTmIyd2VYWmlzTzRPclJZRTVDRDB3VHY0dkFsdXZU?=
 =?utf-8?B?WXp3WkRKNWhjZmxjSGhrd0FxMDdaZHVpaGpuL05ySTgxSnkweENhcXlFVGRS?=
 =?utf-8?B?VHdtZEwyMWpiOVUrUklGajNZRXdBRHlKOEhpZ1lhZzBzN2tBakUxSmlvb2h2?=
 =?utf-8?B?VDRMQmFaaTBMT05MakY1Z2M2VWkwR3Q4OGFuUnFRa1YyY2VGRUkxSFo4TUg3?=
 =?utf-8?B?anhuVFJrTHMyaVhhRUVUQk45OXAvWmdwQmtzaVMyUU9aYVNYSFVlRjlnUG83?=
 =?utf-8?B?ck9WUzBYWWRmamdKTUFTdGdYMmRPbkJTZFBLSG5adUtqRTJzV3VOWWpoVU16?=
 =?utf-8?B?SWFKTWIyanNqbnRuNVlKSmgxWmFYVXNaQ0RRRm5zQm9JNFBzVnMxckc3djRu?=
 =?utf-8?B?V0V6L2V4d01MSyswNUdjY1RBNisxR3AxRkJodjNvWkkzcHYzUVkvOGRqa0NZ?=
 =?utf-8?Q?95qNxqbTSq7FvEDLmAf8lgOxX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c9697d-80f9-43fb-e4d2-08dacc5220f6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 06:23:54.3168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g78W8JsRowZuGZtFIXYdLCu/UaJV87LUy/uYLuK5p3rTUdwMFYEn4F8NaSNmpEhD1ilP3jIVFhDg3nCtngnABQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/2022 10:48 AM, Somalapuram, Amaranath wrote:
>
> On 11/16/2022 2:50 PM, Arunpravin Paneer Selvam wrote:
>> Hi Amar,
>>
>> On 11/16/2022 2:20 PM, Somalapuram Amaranath wrote:
>>> ttm_resource allocate size in bytes i.e less than page size.
>>>
>>> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_gem.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index b8db675e7fb5..a346e3b7f9a8 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -152,7 +152,7 @@ EXPORT_SYMBOL(drm_gem_object_init);
>>>   void drm_gem_private_object_init(struct drm_device *dev,
>>>                    struct drm_gem_object *obj, size_t size)
>>>   {
>>> -    BUG_ON((size & (PAGE_SIZE - 1)) != 0);
>>> +    //BUG_ON((size & (PAGE_SIZE - 1)) != 0);
>> This line is added by mistake?
>
> No this breaks when the size is less than page size.
>
> Now we support size in bytes.
>
I see the line BUG_ON is commented out
>>
>> Regards,
>> Arun
>>>         obj->dev = dev;
>>>       obj->filp = NULL;
>>

