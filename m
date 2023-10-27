Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1737D8FEE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 09:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A39310E949;
	Fri, 27 Oct 2023 07:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF0810E949
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:35:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAvZhkjmpmtNImx+wnBbKduc2GgrltJ7YrmU1lNYUUV3GLv+tJo4KYYLCIKOqpNnDlAeplCxURCroybwOR2E+6z9Ahic2Gcb9/1DYe/1R4gzt8YrtMfZsLXYcP1/dJp5XU/1bMzWUvvPPnGfMA2ZEe5VJXdyOSUtf3EAUmfsNAJ7jEuXfHkQnEWsmTqSacEWJy8jr6iPQhcD01LaL0NSVcnCJr5dDaXEnOtdG2UqwpA8T+RDqb6UdKTDbhheTnCTovJuQgDpszrRkDtSLzphR3yzTSOmC8fEKsNkIBKHCt/uJliuC9fS0Hgi+FweiPPZRehRxTkAgNnhUii3/ksGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SBj+1AKaz4GaE1BEr44plcmOemA6HSJ8t/HX/MYlEw=;
 b=BmIk5mkLhsjrECnwTH3yvVm2wFIDfObxoaxolOywcepLbfwbUkp8UaJQzDH6Q/kDkjg06ATt4aaYZ/qeNwA0OK6Av3B+ScNVTRcxqX6YIJ2wYdO+6PBnKmg+KhrQfOFDogKOoTm+nZ66d+uf+GxglChpsGRQUbn5aXyo88wYkhDoy5kuF/SKRnhV0g9PuSNLkCab7GMirHThdjJNx49FYmOw9NDGKa2pPLTQHF3nrt7y2YePFk+EPxchTnq+aG8LkpdEO7JWYu8FaulTdiGJjB7vPUglq7AJ9x6ZvX15+mRIPafVi+T9b5njg2m9FgtmXkt2BziExpoHM7tttRKVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SBj+1AKaz4GaE1BEr44plcmOemA6HSJ8t/HX/MYlEw=;
 b=F5KE6Fm6ePzNK6p2IYXT1HbqutpHn7utwJt0ZxuMBkENuh1eYKOSuWemlQ08YOQ28CIhCkIqpxzxAVArt/VFglU3sYlBYm0TK1rtT3AwwRa6RqCPmM0qbCQlHZeOKVGyFu9Bksy1HM6b2hisysPQZNmBiTEt1nQv/WBfiB2A8Jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV8PR12MB9261.namprd12.prod.outlook.com (2603:10b6:408:1ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 27 Oct
 2023 07:35:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::af19:f731:8846:68ba]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::af19:f731:8846:68ba%6]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 07:35:05 +0000
Message-ID: <ff389793-1226-49fd-b599-07dbda0b97be@amd.com>
Date: Fri, 27 Oct 2023 09:35:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <0bc79ae3-04fe-4e85-9fd0-e8b281148390@amd.com>
 <20231027093238.2ff8172e@collabora.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231027093238.2ff8172e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV8PR12MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a9faf5d-d29e-4b41-56d4-08dbd6bf3d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KeMUI7Cpi/VF1rpWapNzk5kRTl7G+kjdcuqv6P8bXghwiSx9KIO/4KqDhu2ZLA8zjzJbEM40bDEwrKxus/+prxd/d99dJzAkpxrUzERjZ4hcgmjsaDOR9goBVLxqWnLqI/phvLsuFbj9aRaEXogmHoRQJNwqz92DC+1tSwUN9P2io4eOxDQQUVNY8pcU9Pu2vIqukqb6PxGQMojazLNtZU8+JYfq/asA+1araDAypfdtglLvqOgCyJEws3BwwL4DvqPk9f3iofA46qltKQyrbdIa7cChTcosj7BuGNwxZH52tQkbqOTDPuSokDUhrbdjJHaS2s2Nq3SnXSZYFM1I854uFj0pQVsBNy9a7OQ9SZ3cxC/D4FzROGUfkTr4mSWd+a/7PekZhlS9CvVyOGF2L4SNgkXxnI0TSdlk8h0GxbgO03Dq0pXNNdO1VUHG7oRzO+V1WiCxIiXqrmZ6DhCJ/wg0IGi0MtH6qzWJDN0FUz5NWMHyVoTgUMjaCk6snGtCEf+5xdYNfyZwkNRJRcfghURI9ez+yboQ6UuQq7uEUeDlv7cCNoaLWGOBeGDmSrbBFKO3LY3MTJf/Hy3kJsqzzcUIsQDyGyyKTzvkmM6l7rEs1wzKCS6dSK7RfEQC9FBOSawxckenAg/wpLCN+tVpmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(31686004)(36756003)(316002)(86362001)(6506007)(31696002)(38100700002)(66574015)(2906002)(2616005)(6916009)(26005)(478600001)(66556008)(6666004)(83380400001)(6486002)(8936002)(66476007)(6512007)(66946007)(5660300002)(8676002)(41300700001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkEwaVFpZWRYaFE4OHY4M1VpdjhNd2VNQ1JEdmE4a08vR0M4cFJxa3liTGdn?=
 =?utf-8?B?WE9kelh1cHZsdnpaM1lSaEYyMHplUXhjbEgzdERnMENXZzZtMXFLaVRFMmhE?=
 =?utf-8?B?aFphK0tWQ2FOcFVQM1l4UDB6SEl1NnBYbTc1Nm1jWGRrZndkTHRwU204RVQ2?=
 =?utf-8?B?cHZ6cy9obDYvR01ocHppZkhLRkxzODQyWWhLQjdSNUhhWDJleEVTQUJrWGIr?=
 =?utf-8?B?V3hrM0JQSy9yaXpTNm5GMXlSRTVwNUZ4VFdVK0lNaEQ0VFZxTytISW9ZREwr?=
 =?utf-8?B?TExacTlxUERoT256RlpHaHlpRE1MNTFTbWJ1UzRkYUxSRmpka0RRVCtiNEJP?=
 =?utf-8?B?d0hMTUNhWjY2S2dJbHhSRzhNOW9yaWxyZGhWUEt0TlF0SmxBZWhIbCtyd2NE?=
 =?utf-8?B?T2hMTVFSc1o4VSticHZLRkl3TzVnd285Mm4xQW5JMmNWZEdMM3lSb2UrMkRp?=
 =?utf-8?B?MVkydzFRcE16QTdoQjZHUWNFOUE3RWFhTGZ5cWZpR0xTV05XWmJ1aFBvMWRD?=
 =?utf-8?B?TzdqR0xLTG04cWJjdlNMY1R0bGF4dHZtN2VzbGJqa1F6UEtVSFo2OW1XcW40?=
 =?utf-8?B?NUNBMEtPR0FuQkRrSkNadEpEK01JWWQ5NGVOc3p6bGRNbCtidkIxdzFoS2d1?=
 =?utf-8?B?RVVTZTR1RnBTcjVEeWpIVFF1UzBZeVpxWm5rcHlleXpRTW1kY2xhaEYxL2hB?=
 =?utf-8?B?YWFpSGIzRXRLcTEySXFMWkxFamFWU2pSVDMrT2Z2ZFg5aHpza0lzT005bUdI?=
 =?utf-8?B?NDF1Q2dmNlova096SXYzRlhuaDFYU2lYMm9HWFhMc0M2SUI4U2F5SDZsZExy?=
 =?utf-8?B?WmRQd2U5b0M0TkZrd0xWWVZpQUZTQlVXUllqdllJQ3hHTHNzZy9scytqMXVB?=
 =?utf-8?B?SkNTeXdURCtsYXViN0ZyOGZxZm41NW5LU1U5M2R2KzZJdXNOSk9RM2svdEdF?=
 =?utf-8?B?eThkdmxGQVg1QUdrWmU3WTZCYVB6SUtYZjlDRkdzbzREQ3h3R3dMdmk2KzNL?=
 =?utf-8?B?WURoMmkyTHlSeUZRVVJYc1phc0gxdWprZEZOdmMrcWJSZGtPWG1peWFuOXJa?=
 =?utf-8?B?WndrVzZUZU8yZEpPeXE0a28wT21FcWN1N1M5ZW1OSnlacjYxUTF5Vit6L3hu?=
 =?utf-8?B?TkU2VjYrZmk0UkVsSGFONUsxTFFZeGRQb0xLY3dRNjAzbmxVVnRKMVB6Zk1V?=
 =?utf-8?B?dEZmaEJpMkpCeHYxNzJYSVRMc2VQTmgzcFZrOGl2aGdRRTJ3Z2RiRzh0VDZp?=
 =?utf-8?B?TGx5UVJhQStoZ0JrbDR6WTd6SS9MbmVBeklES0o4d2hBV2lVaWNDMEpiVnI0?=
 =?utf-8?B?MEJUMEJERjJLM3ZZVmJJYUIxY2Q2bEIwckVheEpIeXg0TWRKUXB2OVJGaVBR?=
 =?utf-8?B?SStZdkNwQUM2ZFI1M0g0TmM5VGIvb0VUbmQ1ZHl3SmM0TS9iYU9CR0ZvRFM3?=
 =?utf-8?B?dnYvRWt4bm1WVzEvOVdmVmExdkZubnRneDBEWVBJL3VVRXBLUXY3RDY1NXRX?=
 =?utf-8?B?bC82STgwUlA4eGs2dEgvTFNsWFhkQjhYQVl1U1pOZVZjRy9PdUhPTUNvQUFS?=
 =?utf-8?B?R3dyTS8rVlBVYjBZeDRRTE9vS0VVMERVbXFXYjY1ZkRzeGNVMFN5UEVCM2NU?=
 =?utf-8?B?WktpUHVBd2JZemR4RXZnYjg3OEdvWDQ1b2orWmh5K3hITXRPU3FPNFRmUlZa?=
 =?utf-8?B?dUdibWg3VXFYaDNVNGZxVFdrQWljV1dCY045TmJpSW5aUTJZNzJMWk5PeEYr?=
 =?utf-8?B?NEZSS1lQa05Hd0NyM3NSOHZoU1MzQzErNE9velhpSlN0R0NNNC9FQm9YanJq?=
 =?utf-8?B?V05QdHRYcm54dHM2Nm1ENkhLOE5aUE9zUHVVbnJNMEFPWHNrK3IrdW9LcnhL?=
 =?utf-8?B?ME14MTZHK0tEcGU0aW5Xa2FiQzlWMlVUYkpWVUYzY2xJcDlKQnFJZU8yL21m?=
 =?utf-8?B?WGlCRGxqVEZrQm41QXFNV1VPQjUzekJ0NWpOV0tqYXdFRjN0NVBCWm5Odzlq?=
 =?utf-8?B?Z2lxRXJPRlMwbXZSVk1tU0xwMWQyeEFoQTZCV3JOcUZUektuVWRIeFVRMFdW?=
 =?utf-8?B?bWp6NmNOamRzamdoNkdHSlZiTjFGRi9sT3ZtcFlrdlpSTnB6QmEyd2E0WkxC?=
 =?utf-8?Q?6oroCqqe9DzJ39FR0yxoqxVl7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9faf5d-d29e-4b41-56d4-08dbd6bf3d2a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 07:35:05.8072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPMrYfznBarPBScv2h2cSoTCeh9W/nznQL1Mdwv2oH5giw9YwVbf97rYGGK/yWlU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9261
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.10.23 um 09:32 schrieb Boris Brezillon:
> On Fri, 27 Oct 2023 09:22:12 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>>> +
>>> +	/**
>>> +	 * @update_job_credits: Called once the scheduler is considering this
>>> +	 * job for execution.
>>> +	 *
>>> +	 * Drivers may use this to update the job's submission credits, which is
>>> +	 * useful to e.g. deduct the number of native fences which have been
>>> +	 * signaled meanwhile.
>>> +	 *
>>> +	 * The callback must either return the new number of submission credits
>>> +	 * for the given job, or zero if no update is required.
>>> +	 *
>>> +	 * This callback is optional.
>>> +	 */
>>> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>> Why do we need an extra callback for this?
>>
>> Just document that prepare_job() is allowed to reduce the number of
>> credits the job might need.
> ->prepare_job() is called only once if the returned fence is NULL, but
> we need this credit-update to happen every time a job is considered for
> execution by the scheduler.

But the job is only considered for execution once. How do you see that 
this is called multiple times?

Regards,
Christian.

> If you're saying this control-flow should
> be implemented with a dma_fence that's signaled when enough space is
> available, I fear Danilo's work won't be that useful to the PowerVR
> driver, unfortunately.

