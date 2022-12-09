Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF92A6480F7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 11:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B4A10E513;
	Fri,  9 Dec 2022 10:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E953A10E513
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 10:27:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miDU+slRLmKSkWpSiIoSCp92jZQo9T3NJhoquMSrGFxNuvQUcH8xI10WK+sX5iIo2eIvss6m9ZVbaJUE1oIxMyjkXpvhp+qf5JfxU9EjRp+SB4Lidde1QS/XHH++s6YFNK4HgSU4dhuTm/k0GWlbvpS1oQ7D8tpWmSUT+H3gux9FQtrkU4sK74FtWBCDT/bzuALMRf86nv6T81tYG6iscX86FopYwA7LmICtPza4YnM4ZrqRD+6+zqR0R0xSIHajImauhmuR/qpomS1eSWQapWJ1zT1bHwP2L8ssKP5Mof/3DhrnfCYs4XF4HTwpYncUZUCq8qKiNvLJ4NBE8p8UnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VacTkpZdOWSwOp1I3RbrcweqEw8LYWJcnCbjup4qfIM=;
 b=h4JQXgVrbhIFO0XFRfVqqNqvaEe27n7GKzdzdlsBdtY0vftLNPZ/Y05YUpoQ4S5cHUfNK0+ERVRbm/uud7249DfjPn8hCgn1XK16uvyIrK64kYCpGSstNxRs5xxgfOymC+M8NhFlU1/PZiOtiJbkwSJGLwgY+GnWiwBFSYvHJMN6axEuyITc51Hd+xTreog5aEelszg5uhOIxsq+KmQ61n69YkZCY6VEFt4nwrasu/Ulx1cE8olaze539G/CIbFXh5AW+y2dxIZOu1biIdKR/vMlMXwZqZpZe0Qvfkcmv+5CnnY2rxwj9fVv1QTG38G/D1FW27xOxXXGMVmH0fa29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VacTkpZdOWSwOp1I3RbrcweqEw8LYWJcnCbjup4qfIM=;
 b=crusg1AvXTFvEIOQMB2cUzs2Ci645LWs+tyDyah4Ba+3J3jsIFWrhI1/uktQBr5y82mlyA0JFtFdQotBodSzYjemp2Wf8pinLL9KyD+IKojvw2zgcEXmCqMFsRoxYPY3NSgONcx5IUlnrfAOq4DTdJOeS0xnmE/gZHrCPX8a2a4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB5616.namprd12.prod.outlook.com (2603:10b6:806:22a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 10:27:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 10:27:50 +0000
Message-ID: <a4f56b61-7609-5424-b04c-9462764ac73b@amd.com>
Date: Fri, 9 Dec 2022 11:27:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
 <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com>
 <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 92045ee8-a364-4bdb-4d9e-08dad9d0059e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fd405KGiXX+HA6N3C8Lth1x6fYviI7mCgpRXwec9xCiQD8uaRJnmFdcPFImimeSz7S/BYrP2b7bRA54C/jk61zUGPw6uxk9yW97HOL91cTYKgBCv+OWthPD/bvs9WuodaoBmf5vxqShwBwFbEfvxV0ezJWOpjMuTT4AlMcyMJkeYdkyqMMDI9UgPYswG15fFF9Tr4gmBTxoNS4Lt7oCRMp+8Zq0q0aXlH7h/24W3hEC2rfUV4boPKo0ijTGg8aawrPMCSFhktzEDGiYQm3n+E7uO2XM3XYtQ9jfmZpctCzCLYAj1eNyBhv5fEAGHIEq01y/Y8Gj/aDfp3FPFmL2UclOUjFMRZWmffvxEDQu3LbKYR53QrYS+4th8eQN7gu1gjoGGVZXulYOIXOWmz0Qb73qpPqiJsQprNB0x0a2D9dioqK67NTner5+R2O8QxWKtHb8zE/3CSl1OkHduNvau/gkwwLRwZkDNQdvw4ZhS+LbyrLA0eZ5/G3A2+vzllpnHBsaqzSdHw0CkdQcwmq4rp5wELMBRD7osc2AwZSGSVwL8/wJTxqOhan5uvOVLomOIIPn150I/sO/Q7d2IBjk/QVsczSbxnlfNjGksCZn3zLZCHtgxqTZRntDdI/U90oiCS0CZ5zledWgAt4ku0IeeLaj7iDDzkfcwfdUNyP2DbvwGzZuc5XlVPXo11gCTdUnuNQ3XNPk5sKBYqkHb8alvK+63PsMGdqVjEhkpkKpQ4uQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199015)(7416002)(30864003)(31686004)(5660300002)(478600001)(6666004)(6486002)(38100700002)(6506007)(41300700001)(66574015)(36756003)(31696002)(86362001)(186003)(83380400001)(8936002)(6512007)(2906002)(66899015)(6916009)(66476007)(66946007)(66556008)(2616005)(316002)(8676002)(54906003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWt4bEdVcVQ2K2kxa0JGUXhHZVBXeWRaMFprYjA1OWNOUStsYzd6QTFHZWpz?=
 =?utf-8?B?b0JtOG90WkMzK0ZrTWxyVHVrbFgvMXRPbjBuWDYwNmJwbWgyNFFDbjZGTEEx?=
 =?utf-8?B?YTFOU1BIQ001MVUwUTNyNmo0QTd2RkpvbG8zRTJzVFh0TjVTZDdoc2JyMWxQ?=
 =?utf-8?B?RDlMRERldm9UVmF3T1FTUTY0dXc0djZlckk2NzRkNEg1V3B6ZHBhZ1FyMHV6?=
 =?utf-8?B?Yzl4KzUyRkYwMytLWHEzOER2Y1huUUhwYVRGMG5aWmNHdHNWRGZuRmdWME10?=
 =?utf-8?B?V0paa3NuQUloNUdzb2hOZzh2YjB0amVUbjFCSnBTVUFHSjVRczVTVmNuTTJn?=
 =?utf-8?B?MGNCalpCMXpSVHg4bmtxcllIRVpQaE11YlArVEMxQnFuVzc1V2tQbFZRdU90?=
 =?utf-8?B?TjZtYnRFazZGT2lvbFpQMExyYWw2ZDl3NDJHZ3VhdTR5blZpS0hIZW9GQkF5?=
 =?utf-8?B?ZjFFcGxlck9VUW1jeGhFTldaekhXekJJWG1XVXc4c0QrUFJCclNOUjJ5SUYw?=
 =?utf-8?B?L1hoVmhPTTNJdjM0MHI3RzFLUktHczBKYnFpVUpRTHdRRFdqbUhCL1NoMTZ0?=
 =?utf-8?B?eWtjVi9FYWJGTkxLNGNGNHRCaVFnUzVVV3pnTzRSb3pRS2F4ejhwYUh5aE1N?=
 =?utf-8?B?RjFYQkpQSWd2SndKaDJ4bExwN2F4bFM4bTJqSWRETGN3d1JsOUJUSXcraVVQ?=
 =?utf-8?B?NWErVHBsMFBDQytDN1hwS2RJaVhCZU1nWm5FTmtER1gyWFByVzNwZWt0V0Mx?=
 =?utf-8?B?RFVVT2ZVaGllc2lzeVJKemVPUUlKRUptQ1NOUnRWRSs5dHBOWElsM1V6Njkw?=
 =?utf-8?B?dnRaNjZCdTd4eGJmZUNPUzFYRDFscWprbGxhaWtGY3B5STluMlZVd1JVWHFX?=
 =?utf-8?B?eWRiOUJMRmQxdGdBVi9rZzV5bVlycW43MWZSOXpoSkh1V1VTUHFXSThUOC8v?=
 =?utf-8?B?aDZ5SnVDbHY4YzlmQmxTQ2VNMHptcHhLL01tcHYxY29DK0g5cndpME5PNDVm?=
 =?utf-8?B?MTQrV3FLSnY4RHJWbnNvR0UySlNxcDZ6QUQ5VkdvVTAwWTJYUVVub0lRYTJU?=
 =?utf-8?B?QTF3SnJFbFVFWU81YjYvOEp0SnZlMFMzQVFFZ0hZbnhDRXZXbFlXTVY5cVQ0?=
 =?utf-8?B?QlQvcmUyNmYrSTJiUFhRcFZId3gxSVcwRktENTJUdm5CaE4rM0k2Mmo0Qlo4?=
 =?utf-8?B?S09wRGRSNTJqZmtlMzFqMDJtR3BzTnNTUHZqLzl4L1dFaFpLUmNLdHlheVhX?=
 =?utf-8?B?WUJqOGFHcmpnc0lhdzlObzFxSFhwRlEzK3AvcXlVbkV6L2hnRSs0LzA5NlpL?=
 =?utf-8?B?Wm5FZkRNZnZCc2VNNUI4aFhnUFgwamFTWnNZQ1ZnNjN2SlBiN2RMcmVMeE5O?=
 =?utf-8?B?STUzbjkvM3N4eXpOMFUvbURpZ0s0NFJiSW9mT09TOGpyMk1qRlN3RFNWUVph?=
 =?utf-8?B?RUdUejlGSVlTZnRsUS8rVUhERE5mSGdVZ0FoTU9wTDNpa3hHbHRrbnZZenUy?=
 =?utf-8?B?dlZKY2N5MGttRFQ1MTMyQ3IvUnZsY1VRd2t4c1FIeGlWQkh3UHZla0RKMHVT?=
 =?utf-8?B?OTZXOFpPMDd5bEp1RG9hYnJDSEJ0WkZWc0p2dHF4aSs3SklYRjdYYkdibGJu?=
 =?utf-8?B?OFppN1EyKzROSnR2WlpMVlNENmZtVElWTkxROVdRRjlFTnRFL0paNHR6VVRm?=
 =?utf-8?B?R3NDY2RoT2U3cVhtNHU3Rys5S0dXZ2gxWDZsWVZEQlZsMFY0M1lPb2JTNXRZ?=
 =?utf-8?B?Q2FBZW5xRm40anc1NXl3Nmh5akc5TWtjRDU2YTBxOU8xOUZjYm9VcWhmWEVv?=
 =?utf-8?B?ZDNMRTdhWDBzVFRHRnRsZTJpK0loMHFwWDdSbVY0M0Z5SENpazNYM2l1WWVC?=
 =?utf-8?B?eXdSMW5YVi9lT1pjT1hkZFF1V0EzNkNabFMvelAyRHZld29GTVROMTg5ajRh?=
 =?utf-8?B?OUE5Rkt3WnBuVzcrTDJ4NW40cmNrWXdROWFZUTAvT1FGdkNZdDQvaHZhMksx?=
 =?utf-8?B?dm5PdnB0Q0Z1aVdtdVN0aUI0TzlnVUpRME0zSXp6Rmx3R1hCNGU0ZjVSVUVF?=
 =?utf-8?B?c2lJVjd1SUtLaTFYc1RTdHB1UU5sdUU3UHJZU1dvYW90emxpa3ZZd3djVWhG?=
 =?utf-8?B?QWNQcW5pVHdHaHRpUlV5d0ZwMnV6bEVLVFNNdmVTNGt5QXhKcVpnYU5jYzhE?=
 =?utf-8?Q?emUnwiT7ApDe31T4zG73i6JeKgWUe2g5wlObwGb1E1vL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92045ee8-a364-4bdb-4d9e-08dad9d0059e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 10:27:49.9375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuvQ6vg+vJYH+OhjzaqJY23omEuo21EIzM6NzlRjtxHzu2afm5/CLt+3TpLOwBTs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.12.22 um 09:26 schrieb Tomasz Figa:
> [SNIP]
> Although I think the most common case on mainstream Linux today is
> properly allocating for device X (e.g. V4L2 video decoder or DRM-based
> GPU) and hoping that other devices would accept the buffers just fine,
> which isn't a given on most platforms (although often it's just about
> pixel format, width/height/stride alignment, tiling, etc. rather than
> the memory itself). That's why ChromiumOS has minigbm and Android has
> gralloc that act as the central point of knowledge on buffer
> allocation.

Yeah, completely agree. The crux is really that we need to improve those 
user space allocators by providing more information from the kernel.

>> 2. We don't properly communicate allocation requirements to userspace.
>>
>> E.g. even if you allocate from DMA-Heaps userspace can currently only
>> guess if normal, CMA or even device specific memory is needed.
> DMA-buf heaps actually make it even more difficult for the userspace,
> because now it needs to pick the right heap. With allocation built
> into the specific UAPI (like V4L2), it's at least possible to allocate
> for one specific device without having any knowledge about allocation
> constraints in the userspace.

Yes, same what Daniel said as well. We need to provide some more hints 
which allocator to use from the kernel.

>>>>>> So if a device driver uses cached system memory on an architecture which
>>>>>> devices which can't access it the right approach is clearly to reject
>>>>>> the access.
>>>>> I'd like to accent the fact that "requires cache maintenance" != "can't access".
>>>> Well that depends. As said above the exporter exports the buffer as it
>>>> was allocated.
>>>>
>>>> If that means the the exporter provides a piece of memory which requires
>>>> CPU cache snooping to access correctly then the best thing we can do is
>>>> to prevent an importer which can't do this from attaching.
>>> Could you elaborate more about this case? Does it exist in practice?
>>> Do I assume correctly that it's about sharing a buffer between one DMA
>>> engine that is cache-coherent and another that is non-coherent, where
>>> the first one ends up having its accesses always go through some kind
>>> of a cache (CPU cache, L2/L3/... cache, etc.)?
>> Yes, exactly that. What happens in this particular use case is that one
>> device driver wrote to it's internal buffer with the CPU (so some cache
>> lines where dirty) and then a device which couldn't deal with that tried
>> to access it.
> If so, shouldn't that driver surround its CPU accesses with
> begin/end_cpu_access() in the first place?

The problem is that the roles are reversed. The callbacks let the 
exporter knows that it needs to flush the caches when the importer is 
done accessing the buffer with the CPU.

But here the exporter is the one accessing the buffer with the CPU and 
the importer then accesses stale data because it doesn't snoop the caches.

What we could do is to force all exporters to use begin/end_cpu_access() 
even on it's own buffers and look at all the importers when the access 
is completed. But that would increase the complexity of the handling in 
the exporter.

In other words we would then have code in the exporters which is only 
written for handling the constrains of the importers. This has a wide 
variety of consequences, especially that this functionality of the 
exporter can't be tested without a proper importer.

I was also thinking about reversing the role of exporter and importer in 
the kernel, but came to the conclusion that doing this under the hood 
without userspace knowing about it is probably not going to work either.

> The case that I was suggesting was of a hardware block that actually
> sits behind the CPU cache and thus dirties it on writes, not the
> driver doing that. (I haven't personally encountered such a system,
> though.)

Never heard of anything like that either, but who knows.

>> We could say that all device drivers must always look at the coherency
>> of the devices which want to access their buffers. But that would
>> horrible complicate things for maintaining the drivers because then
>> drivers would need to take into account requirements from other drivers
>> while allocating their internal buffers.
> I think it's partially why we have the allocation part of the DMA
> mapping API, but currently it's only handling requirements of one
> device. And we don't have any information from the userspace what
> other devices the buffer would be used with...

Exactly that, yes.

> Actually, do we even have such information in the userspace today?
> Let's say I do a video call in a web browser on a typical Linux
> system. I have a V4L2 camera, VAAPI video encoder and X11 display. The
> V4L2 camera fills in buffers with video frames and both encoder and
> display consume them. Do we have a central place which would know that
> a buffer needs to be allocated that works with the producer and all
> consumers?

Both X11 and Wayland have protocols which can be used to display a 
certain DMA-buf handle, their feedback packages contain information how 
ideal your configuration is, e.g. if the DMA-buf handle could be used or 
if an extra copy was needed etc...

Similar exists between VAAPI and V4L2 as far as I know, but as you noted 
as well here it's indeed more about negotiating pixel format, stride, 
padding, alignment etc...

The best we can do is to reject combinations which won't work in the 
kernel and then userspace could react accordingly.

>> That's essentially the reason why we have DMA-buf heaps. Those heaps
>> expose system memory buffers with certain properties (size, CMA, DMA bit
>> restrictions etc...) and also implement the callback functions for CPU
>> cache maintenance.
>>
> How do DMA-buf heaps change anything here? We already have CPU cache
> maintenance callbacks in the DMA-buf API - the begin/end_cpu_access()
> for CPU accesses and dmabuf_map/unmap_attachment() for device accesses
> (which arguably shouldn't actually do CPU cache maintenance, unless
> that's implied by how either of the involved DMA engines work).

DMA-buf heaps are the neutral man in the middle.

The implementation keeps track of all the attached importers and should 
make sure that the allocated memory fits the need of everyone. 
Additional to that calls to the cache DMA-api cache management functions 
are inserted whenever CPU access begins/ends.

That's the best we can do for system memory sharing, only device 
specific memory can't be allocated like this.

>>>> We do have the system and CMA dma-buf heap for cases where a device
>>>> driver which wants to access the buffer with caches enabled. So this is
>>>> not a limitation in functionality, it's just a matter of correctly using it.
>>>>
>>> V4L2 also has the ability to allocate buffers and map them with caches enabled.
>> Yeah, when that's a requirement for the V4L2 device it also makes
>> perfect sense.
>>
>> It's just that we shouldn't force any specific allocation behavior on a
>> device driver because of the requirements of a different device.
>>
>> Giving an example a V4L2 device shouldn't be forced to use
>> videobuf2-dma-contig because some other device needs CMA. Instead we
>> should use the common DMA-buf heaps which implement this as neutral
>> supplier of system memory buffers.
> Agreed, but that's only possible if we have a central entity that
> understands what devices the requested buffer would be used with. My
> understanding is that we're nowhere close to that with mainstream
> Linux today.
>
> // As a side note, videobuf2-dma-contig can actually allocate
> discontiguous memory, if the device is behind an IOMMU. Actually with
> the recent DMA API improvements, we could probably coalesce
> vb2-dma-contig and vb2-dma-sg into one vb2-dma backend.

That would probably make live a little bit simpler, yes.

>>>> The problem is that in this particular case the exporter provides the
>>>> buffer as is, e.g. with dirty CPU caches. And the importer can't deal
>>>> with that.
>>> Why does the exporter leave the buffer with dirty CPU caches?
>> Because exporters always export the buffers as they would use it. And in
>> this case that means writing with the CPU to it.
>>
> Sorry for the question not being very clear. I meant: How do the CPU
> caches get dirty in that case?

The exporter wrote to it. As far as I understand the exporter just 
copies things from A to B with memcpy to construct the buffer content.

> [SNIP]
>> Yes, totally agree. The problem is really that we moved bunch of MM and
>> DMA functions in one API.
>>
>> The bounce buffers are something we should really have in a separate
>> component.
>>
>> Then the functionality of allocating system memory for a specific device
>> or devices should be something provided by the MM.
>>
>> And finally making this memory or any other CPU address accessible to a
>> device (IOMMU programming etc..) should then be part of an DMA API.
>>
> Remember that actually making the memory accessible to a device often
> needs to be handled already as a part of the allocation (e.g. dma_mask
> in the non-IOMMU case). So I tend to think that the current division
> of responsibilities is mostly fine - the dma_alloc family should be
> seen as a part of MM already, especially with all the recent
> improvements from Christoph, like dma_alloc_pages().

Yes, that's indeed a very interesting development which as far as I can 
see goes into the right direction.

> That said, it may indeed make sense to move things like IOMMU mapping
> management out of the dma_alloc() and just reduce those functions to
> simply returning a set of pages that satisfy the allocation
> constraints. One would need to call dma_map() after the allocation,
> but that's actually a fair expectation. Sometimes it might be
> preferred to pre-allocate the memory, but only map it into the device
> address space when it's really necessary.

What I'm still missing is the functionality to allocate pages for 
multiple devices and proper error codes when dma_map() can't make the 
page accessible to a device.

Regards,
Christian.

>>>>>>> It's a use-case that is working fine today with many devices (e.g. network
>>>>>>> adapters) in the ARM world, exactly because the architecture specific
>>>>>>> implementation of the DMA API inserts the cache maintenance operations
>>>>>>> on buffer ownership transfer.
>>>>>> Yeah, I'm perfectly aware of that. The problem is that exactly that
>>>>>> design totally breaks GPUs on Xen DOM0 for example.
>>>>>>
>>>>>> And Xen is just one example, I can certainly say from experience that
>>>>>> this design was a really really bad idea because it favors just one use
>>>>>> case while making other use cases practically impossible if not really
>>>>>> hard to implement.
>>>>> Sorry, I haven't worked with Xen. Could you elaborate what's the
>>>>> problem that this introduces for it?
>>>> That's a bit longer topic. The AMD XEN devs are already working on this
>>>> as far as I know. I can ping internally how far they got with sending
>>>> the patches out to avoid this problem.
>>> Hmm, I see. It might be a good data point to understand in which
>>> direction we should be going, but I guess we can wait until they send
>>> some patches.
>> There was just recently a longer thread on the amd-gfx mailing list
>> about that. I think looking in there as well might be beneficial.
> Okay, let me check. Thanks,
>
> Best regards,
> Tomasz

