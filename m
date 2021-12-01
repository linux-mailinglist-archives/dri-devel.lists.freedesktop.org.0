Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AED64649C8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 09:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BDC6F522;
	Wed,  1 Dec 2021 08:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6586F520;
 Wed,  1 Dec 2021 08:36:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QA8CkNcDBbEzdRzKRcW/wOeXpNw5Yz9sli1Od+pRJxX0rKUVkcx0q41jEqKs3VxOrPD7/3jvV7aAJdryNnT8OjssAY/oBr3fvRTfHuCvszUu/Dn/HPwakURXyTRTk0OB5BJWZfhWR0RyYsr5BM8nBkEhg95FQ4ec2eaFH5epgfqLG2yD2GJm8CUJzpRCgCu2I+QwtcpaX9+V2ZhBVDjL0hLDK6yV8frXn2vFqMDh8htdf2hH0KqHv3g62UZ7NtlpfME1uazbSvbHMPxTpjJ+j54/Ukw9AGvDgdYyPiVhPbWyeYvRWPLWJtnhh7t6AP/LTUl6n3No+dIPuy8DPpdDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFHNpHjjBh/JJ5tESfDgizyTMCmQHgvEJp5ZsprE9m0=;
 b=Ds57BQIofaxAOOaZSHb2sPZgIRdk3FDlNHnmus0CU8Jl9roWXdhKbZYb6CnfP5usols2Yk++QYvjgQuTkg0aCR/wHo7RjiUpnqXG4ID6s8qaEitlrkcpEpWGyOIPo8lw+0ZKDT0HcfUoQgAS0BLTGLZSOyZ+cVzQDQotQNIR5kP6BG//7AdI3Yh6Gdwo7gRiNS2b+SCdvGNRk1eO1cF4icGTw47haSltRulVn4+Kg2Y2wQIVSz8xzk6LfA8UedIkUEqto783smmXfd/h1SE8UK4SdyNF7Wsl4WwhnDLtPagyUqZuN9RlsVSOgI2U63z5FkqM969Fln3r9YSa+mNdkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFHNpHjjBh/JJ5tESfDgizyTMCmQHgvEJp5ZsprE9m0=;
 b=aITTYcWkdKzMQjjY6+JvPg0NMuserML1Cg6gNXn5JQyTJpHPDL7EsoYLlVn3YxahEUsDldy970BfftGKY//738wPsqVUM9tPlpPlO9OH3N5+HUHqm41iHe+C/b52az562+Feyq5FOw8Xp2Zry1qG625oUEdO0SuuD0trZNHxvhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 1 Dec
 2021 08:36:40 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Wed, 1 Dec 2021
 08:36:39 +0000
Subject: Re: [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid establishing a
 locking order between fence classes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <20211130121936.586031-2-thomas.hellstrom@linux.intel.com>
 <c7502701-e85c-39f0-c249-702d029faa9e@linux.intel.com>
 <b440cfbc-2b9a-1aa2-76d6-17337f835777@linux.intel.com>
 <52a7cf8c-59c7-fec0-2274-d19bdc505314@amd.com>
 <57df8b0b-1d65-155f-a9a6-8073bbd4f28f@linux.intel.com>
 <2551da4d-2e51-cc24-7d4a-84ae00a1547c@amd.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
 <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
 <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
Date: Wed, 1 Dec 2021 09:36:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P195CA0093.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::34) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM6P195CA0093.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Wed, 1 Dec 2021 08:36:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3f1989d-d5a7-4cb5-6cf4-08d9b4a5b1c6
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0192:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0192A812D1384515C36A82EC83689@MWHPR1201MB0192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lQ/Hs/xWA4nI+VPQolMLYey071zDb1J8n+psaxoGWqBwoBaXOPst4l8xF4YPg/EY+LrfqZNpHCPY1OpYlDxBgTl8Sck68U0KS9LfM1O2A6wZ7xSjG9ggWnnmEGxcgaTrAOA1S0rpE83WKMzp40BO8NWxK5p2o3HkFIEbUFUUHwdhqvvPlFnShwFOa9jkHf3H9hl9w8gVK4pTyMqQbu15mCBKD5io5vFjsjCCpLe+LnqviehFS78UbKdewLlAY9KHO1vdJVoeYraLm0ctBRCw63UB2fQw78zr2/qG+nEe46aUgEeHz/n6O+NPyBGzJEIb1+w26bFU4W03T7gVcAH3x3C+adnMpKgM6dyrK0rGH8xO8bS6HXXGGrQitUMLbP/Pv3E6RO/ShzFbTwYNuK3HeqBXspdPOAdToSe3Boyw4Gha4kRGeG2Fpucp6pYf/1vc26BhKBPkkRctpscf8V4rFXNutbgQpt/qhTH/bB8srH3D+KceOHQiVrM3seg1l0R2EkMT3qj/jM54zbOyoYfyI2WHPPOBOyur0ABH8sevEYMSP6LNqW+BuKhk4HPRkCkMOxVG4POnBGwBxyUY87MQUOccp5bPoElM5+RTGMaQ8na8YHYEvO/SVB+0Tu8ck1PMCnbYw8cO+vYW/LW5I+n2IsqqaxAowSW7Lwh2ajabgkLPJZ0W6c/eKa+53gTnocNmo4DSQ/U3nD0Z84iJ6c7P6vzqDpdHMshLwI2SPh0riq+x2F7dctPuV2iBKBM7/AdP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(508600001)(8676002)(110136005)(36756003)(2906002)(66476007)(66556008)(31696002)(316002)(6666004)(8936002)(4326008)(38100700002)(66946007)(956004)(186003)(83380400001)(6486002)(31686004)(66574015)(86362001)(2616005)(16576012)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnhndGdJMXdxVVhVaTMzTTVqZ0VUY2k2amVlS2RCL1ROZHQ5cUhoMDZpN3R5?=
 =?utf-8?B?RDJRRWhzYzl1QmIvSzFDdkJqNmI1YUt3TUg4Tk1Md204Rk1wR2I0L3dHcURh?=
 =?utf-8?B?RnJFY3BhZUh5a3VzY2VTMkpaMFozQ3FZM2JhNlVtWXBtSmhEOXRhcGlxdlFF?=
 =?utf-8?B?eEV4OHA4NkVDQ2N1U0w5SnhnVnpoaUxMQmVTYmpoS0laeDRvUTFtYkJDYlRp?=
 =?utf-8?B?VkZxdGxxblZFdldjK3JJeWk2bHRBUDRTQ1dlVGR5SDUxUTBHdlhSVDZLc1lP?=
 =?utf-8?B?Zm55RGhwNG9XNXY4aS9hNStPdGljdjBHRXpmSTZWVHJrbTlncmF5TVFxSkFa?=
 =?utf-8?B?eUhRVTc0bnptZzlUcmZZb25ZL1RCQytoMkY3enFhME5tbmdhd1JNaU82VDNj?=
 =?utf-8?B?N1k4MHUzNGtMT3QyUTJZbHJzV3NkWEJLWU1PaDZ6Rlg1Q0FjSzZBcDl4eWkv?=
 =?utf-8?B?clRWTG1sdkQ0TE01RFg3WXpKbktYR2dvZ05Wd0U4TytMVUZsWktFajVTUWJm?=
 =?utf-8?B?ZEJIeWVZRVVjb0thK3NBV1d5RTVFMGViOU5EK3FyNkVxTE1jRkM3VXUyMzI2?=
 =?utf-8?B?MHFHcDJWa2NKQ3hhYU9qci8xL2lTUVliMFVqajhJckpsbUNyZ0FibjhRNHAr?=
 =?utf-8?B?Q0o2RFppWWJveC8yb2ptQkpwNExuYXdBdjdpSkprVFErYitkcWhXbDBTZ2JU?=
 =?utf-8?B?NG9uM1lJNjVmUmxUUkJveVh5WlkveS9pMzNJTkRjaXI4V0MzeGF5MDFiVzFk?=
 =?utf-8?B?M3NLa2xkL08rUTNXM3I2K1laWUpzYlBTa0VuNjFlNzFYd0loY0lUNEtaei8x?=
 =?utf-8?B?WGJCakhPU1BiOE43OGl1R2FKWU9EajlVWWlGYWxrZHVRTWt1d1RMeWhPS2FV?=
 =?utf-8?B?SjZrakNLSktyODNvWVdUOEQ5cFR4SDAwekhYOUc3L0FHaEhCcmRaRHlXV3Bv?=
 =?utf-8?B?a1FWWmhoVU9hZmpNb1V1UTE0N2dRclpSQXlaRDZNdFpxZGY0WlVLaFpBN2Rk?=
 =?utf-8?B?OHV5MkdxQ0xtalpvTGw2bGtyV0R6clRjT053Ly95NzJtWXhQR28zRVJOV3ZB?=
 =?utf-8?B?dzRlQVZiSE1uQ05WNWxBZGhORmtoNE1wUkw3ZWRINklFb2V2V0V4NTlpQzdU?=
 =?utf-8?B?RGVDTzJKR0huRW8ySkxPWDVld3d6cndDQkNHTEpUaEtQOWZnd3d3QnJSZmR4?=
 =?utf-8?B?RHo0VGdCVnpCMXBkUGZNRWpVS3phSUlRbWJjamNuNjUrQk1PbUdwem9FMkMr?=
 =?utf-8?B?eU9sZmVIbWtCdDAzOWFZZmFjRlR5ZWZteS9OR2ZyU0kzYlo1d2hzdHY2eDND?=
 =?utf-8?B?RGlQeVI1S2NNc1IwbXlBT1c1QWI3dW16MmZVb2tlSGtNOHpkcW5jQittdm5Q?=
 =?utf-8?B?K1RwN2podkNTUlloa2xQMnNJMDl1RzV6WmI4N01TYW5RMURaVm52N1hUNkIz?=
 =?utf-8?B?ZVVXSFppMHAxYnlqQzNKdzVod0JzUHdoTmlkZlB4RTQ5eXJjV3V2SGdoeXp2?=
 =?utf-8?B?RlR6V3VwT1Z2NTd3MnFSbGZabmpjaUVlWWpBY1ZWcHUxQnY0dm1HaW1Ib2hE?=
 =?utf-8?B?MEI1Q293N3pDSk1WQ2tVYzNnRUEvV3VmSm9tOWZjb0s5aWFUTG1HaWREakg2?=
 =?utf-8?B?UXpqcmVUbWszV1ppUDZvU0o1enZZT1VETUhPeU91ZHdQTGRjQnlOSzJhWXhh?=
 =?utf-8?B?TjVHMnlPdzU0OXRDdEo4UmNudlZIbWFydTBBUGtha0liUWlnY0dtdmJwQWl1?=
 =?utf-8?B?M0FHSVVWR0xwK01SdHo2V1FhSitaWUFJRWRnS2IwUUMrWERlb2xLcS9EQXpY?=
 =?utf-8?B?dlNjaWlmdWRNaHFYdDdRaDVFU1pxL3h0S29XdUZURlRwbmNCZThKTzZDYzh6?=
 =?utf-8?B?TzdueDNkQkRPbnI4QVNRMHFEZEJZVUo4c0xvbGlsTENyNFh5NWtkQWY4ZnY4?=
 =?utf-8?B?V1NrNXgrVC9lUmd6SDg3R1lIMnRCVExIWjJTRDVJRC90bEtLRXIxN3RwdVFV?=
 =?utf-8?B?ZkQ0WEtsWjlWZlVFWkdxeGk5NUNPTVp2TzlpLzJDWTNzZmVob3p0Z3lHQ0FO?=
 =?utf-8?B?RFB4dmdJcHJmQll6OVNmQmM3Rm1hemlnbU1xaHBvRHR5SDYzUnhESDBCdG12?=
 =?utf-8?Q?ywPA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f1989d-d5a7-4cb5-6cf4-08d9b4a5b1c6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 08:36:39.6779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G44pPH8+x0V08ioUcGq//iT5pGQMCIbEKf6Q6IY7j66GYJ2/4X1fD4MeIkh78+Mm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0192
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.12.21 um 09:23 schrieb Thomas Hellström (Intel):
>  [SNIP]
>>>>> Jason and I came up with a deep dive iterator for his use case, but I
>>>>> think we don't want to use that any more after my dma_resv rework.
>>>>>
>>>>> In other words when you need to create a new dma_fence_array you
>>>>> flatten
>>>>> out the existing construct which is at worst case
>>>>> dma_fence_chain->dma_fence_array->dma_fence.
>>>> Ok, Are there any cross-driver contract here, Like every driver 
>>>> using a
>>>> dma_fence_array need to check for dma_fence_chain and flatten like
>>>> above?
>>
>> So far we only discussed that on the mailing list but haven't made 
>> any documentation for that.
>
> OK, one other cross-driver pitfall I see is if someone accidently 
> joins two fence chains together by creating a fence chain unknowingly 
> using another fence chain as the @fence argument?

That would indeed be illegal and we should probably add a WARN_ON() for 
that.

>
> The third cross-driver pitfall IMHO is the locking dependency these 
> containers add. Other drivers (read at least i915) may have defined 
> slightly different locking orders and that should also be addressed if 
> needed, but that requires a cross driver agreement what the locking 
> orders really are. Patch 1 actually addresses this, while keeping the 
> container lockdep warnings for deep recursions, so at least I think 
> that could serve as a discussion starter.

No, drivers should never make any assumptions on that.

E.g. when you need to take a look from a callback you must guarantee 
that you never have that lock taken when you call any of the dma_fence 
functions. Your patch breaks the lockdep annotation for that.

What we could do is to avoid all this by not calling the callback with 
the lock held in the first place.

>>
>>>>
>>>> /Thomas
>>>
>>> Oh, and a follow up question:
>>>
>>> If there was a way to break the recursion on final put() (using the 
>>> same basic approach as patch 2 in this series uses to break 
>>> recursion in enable_signaling()), so that none of these containers 
>>> did require any special treatment, would it be worth pursuing? I 
>>> guess it might be possible by having the callbacks drop the 
>>> references rather than the loop in the final put. + a couple of 
>>> changes in code iterating over the fence pointers.
>>
>> That won't really help, you just move the recursion from the final 
>> put into the callback.
>
> How do we recurse from the callback? The introduced fence_put() of 
> individual fence pointers
> doesn't recurse anymore (at most 1 level), and any callback recursion 
> is broken by the irq_work?

Yeah, but then you would need to take another lock to avoid racing with 
dma_fence_array_signaled().

>
> I figure the big amount of work would be to adjust code that iterates 
> over the individual fence pointers to recognize that they are rcu 
> protected.

Could be that we could solve this with RCU, but that sounds like a lot 
of churn for no gain at all.

In other words even with the problems solved I think it would be a 
really bad idea to allow chaining of dma_fence_array objects.

Christian.

>
>
> Thanks,
>
> /Thomas
>
>

