Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF8A4809E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 15:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D1910EB00;
	Thu, 27 Feb 2025 14:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f8MOLIcl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E204D10EB10;
 Thu, 27 Feb 2025 14:11:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9/feadt6XhCw69tQ7UbD20OQ9744G0WlwOtQF0Eq4GWyCy2MHAQXxIOPn1GJZnC6xARTKPgTm+DoqUWJEgWQxxpgkCZ/vYrp6IilJkTjoUDH7TLIlWmMjk2uqsRp4B6BG7BHxXln4qVcNjXL96mOj5D0T4IaIOzjXcLHWOb2IT/65ILGfh1+PWvFGlqT/WZZ76drLsRzPaNnODXPR0+XZ1Ru7zjHanPeO6So+Sj0TPhbllr1lugTOfmjJGtg48eLL9eOTmp+uITAjNKKy5G3CX918wdIMuosu4s+BbdNdUYKNFhRr7EKrwdwq5yTHk9gvLNoehYm9FwlFwFanxFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NUV1hR0XainCcwEiXbyQP9gSmrUhALUAPtof3yHvic=;
 b=esa9DKCmykD0cZRdC3P44+l2qanhC2CFHX9pkysDFUQINeCsoZnVj+H4pbIHgXZwTIHEhO3PB27oYlMtYTdNQhMGXbRstEG4Jy70x/kSZ+ffkk/bcpvblikziKPACdeCqrOcCnf+FZZmox69yaSCqU/E2T4Y8DjtIoeZKfYPIgsJ3oYnrP+iB0l4x9Ugq38WRx7qsda9ARZcqlq5lLLZ9T3tMFlz/SdfSrf6559Gh+gRhn8mrmkg1LT6qoQ94LmShrnArUJb80CkfXo2ERR9W8pa13kAaJQffONj8IWQq7Cwbcdf0xpQbK0IZ7p9Mwke5R/++3/yMiDc0hwiCrka7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NUV1hR0XainCcwEiXbyQP9gSmrUhALUAPtof3yHvic=;
 b=f8MOLIclAIvCYvbQkPNbODk2umCnCdB8YWKbTa8OOPOaWMLe7wjc0BASwpQJLZckpblaO5W9fmpS0aWUK4z3OJgNX2edd25m+DbaWMAX/Bn757io2cg6vOYviOS49y6jgimkWvQTkuio+274x5rS0Hi6xwssCuQJbusukF2pUwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7376.namprd12.prod.outlook.com (2603:10b6:510:214::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Thu, 27 Feb
 2025 14:11:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 14:11:44 +0000
Message-ID: <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>
Date: Thu, 27 Feb 2025 15:11:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>
Cc: intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <Z8Bf9HRqOg7B3W79@ashyti-mobl2.lan>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z8Bf9HRqOg7B3W79@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0182.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 091b2efe-b0b1-40b2-9dba-08dd5738aa79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3h6KzZZVmlUdll1alJNWStsTmRIMDJucXY4cHVzbkk0RHJnNEZoQnRXVUtR?=
 =?utf-8?B?QUdVQSt3VUZpT3lNdW1CcXl3bTgxcVR0VDJVdnZPTmtXWlBFVXpLZGRQUlZR?=
 =?utf-8?B?V3JwT1piZ0lWMUd3WVN3RXl5Uk9yL3lnTW0vNVpxUXVTV2lPOElGUUZBbEV3?=
 =?utf-8?B?aUU0Tzlxb0U5d2VaT0k5NjJWMnNJNEJTQWVDZU5FbUQyTmJwWkUvVG5ZbVpK?=
 =?utf-8?B?ZmhVTXpld3NTSkNYMXMvZHoxeDBoRGwwK3pzc3d5NXY5YjAwTlF3Z0ZiUjdt?=
 =?utf-8?B?dEt2Y0EwdG1QTXVJQXBTQ3EwTC9CU1FnQXY4T0Z1Vi82VnpnenUyWitjUnhN?=
 =?utf-8?B?K3JETU9ieUo5U3V2VFBNVmlUaCtROStrS1V1emdEc2FvR21zRGlYZG9ocWZs?=
 =?utf-8?B?bW9TdDdVbWV2ZTN0UjUvZ1Y2RCs0Zm91KzcrelZxQjhaaGQ2WE5vZlhYamVa?=
 =?utf-8?B?WTRuNERxb01xY2IvUnl6cmsveHdMS3ZVMFB3U01SSEtUQWVEYWQxMEl2SXAv?=
 =?utf-8?B?SEsrWDVFNG9CTFJSM3VsOGNqa003QnVuSXN6cTRhNHM1c04zT1M2OGYzYjg1?=
 =?utf-8?B?ZndDS1A1ZTNrSklXL3ZvaEwybW1nSzNEK2xucDgzZGZnMTkrMVg5R05GV2sy?=
 =?utf-8?B?c2hYak9COWZEdThvMkd5RW1KZ1pzZzVidkJvT0wvVVJIOFpYUTc1ZkR1TFJy?=
 =?utf-8?B?YmgyUlU3K3VvR0prdW44YkVBQU5Ya0NkUUg5NWJxYWhiV1E2aWFuZ3J2VTdq?=
 =?utf-8?B?NDhHVjVvTXZKL2tTZHlSQWtlbGppbDJHYWtaamFWQ3VEd3JtNnh2cERlKzJu?=
 =?utf-8?B?WnJvSm5EY1dGa3Q1QXUvU0dyMjR1ZnVZTjNIdU5KNmpaWUVvZ1RpOTRtSWhw?=
 =?utf-8?B?Ym11aDVkaFZ1Tlg4L1ZxTnZLWHp4WTlCbElDdXJWd0lwdVJnZjRSZ3FqQ0wz?=
 =?utf-8?B?dXAxM2luWWY4OWVGOERHNXlFU2JvczRIdkY5NjRpeDJmeEJwVURhWWphaExT?=
 =?utf-8?B?L0wzOFV1T0NRU21rajMxYmFWOGxGMEwyTFR1VCsvcVVSaFl4NEVJVHFMbkJX?=
 =?utf-8?B?NUp2Sk9CZ25CSEZYYmprOHpKcnZybjAycVl4eldCQkdXRjdCMEZDeFh6OHhE?=
 =?utf-8?B?cnpoZU8zbDAxbWEvTUI3WmNYVVlzem9vTzdLUENXOHNVRUl2NWNtZnVyR1Jh?=
 =?utf-8?B?eHpYUmZYREdNZ1FmbEVXSHJSU1IvWlFyVnBrRmZ3UVZjMlowSmlCR0R1enNN?=
 =?utf-8?B?dkhkTThvWmxsU1VBSGlnNmttNUgvQ3pFdkw0ZGNsSzcrSkx2aGRoS2xnYUdX?=
 =?utf-8?B?RW0xRGxCQTVTZkkwTmpaakVEbi9wVVdqN0ZKZGNGSjU4ZEVjWENyVEIvMVVC?=
 =?utf-8?B?cklZS2VGZjFOeEZMT0wxSkorbUprV3JtS0haU0Z2U3ZUUWc4L1NyK3ZRVm9l?=
 =?utf-8?B?b0oxTTJIQ0g2dnM1Z0FxRHVXTDRsc2V4RC9WZVlkZlpMZmdyQzZaY2EzQjZy?=
 =?utf-8?B?eGFqNXc0Z0I1c2huVEU0TzFFQUg3RjJMdEREOWhrK0tMR0pIR1I0WjJxWTYz?=
 =?utf-8?B?RU9FSEVJOEVId01COUZHUlpsWldFbEYvTmtzbk8rRkltUFRDSnV4ekJpZ3FI?=
 =?utf-8?B?ZUkwYm96MmhmaFlLb3R1OVJuQnJkWGd0c1BaWWZPVjB4ZWtjWlBTS3lqdWdG?=
 =?utf-8?B?NnE3c3Z5SWFEUndFdmwxbEE2WG91RXJmZ3RNQVRLbkZVSGlzUHFiYTMwelFX?=
 =?utf-8?B?RlRrb1djcTE2YTdOVDY1anVrMElMcGt6ZFZnTVNrSWdQbmVmT3dKMGZqWjdi?=
 =?utf-8?B?Ky9lNkw1Y3poSDkvRWZEQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckQ1SWkrNVBTMFEwTjdHVzcwdGtwQ0VPdnE5Tm1ENUFsWldsVXZYQ25GWnk5?=
 =?utf-8?B?ZS8zYUFybUlYNlpzY1lrVDN5aHVmMi9OeVMvUkFJNVN0UWNMRUlldzdvV2N2?=
 =?utf-8?B?VTdaZUxzMEUxNFFMUjFDZDhZb0RLMFAwdEJGS3VpTnY3SW9rMmhta1ZnN1ow?=
 =?utf-8?B?R1c0WGlZYjkzRVJzaGpUYm9USm00aDZxRVRKL2JkNHBhdGoyQ1ZRdGNDVXpu?=
 =?utf-8?B?cHZxS1ZZVmxUQ3RTMWl1aFAvOVpGRXc2QmRZZzBIQWtuUEU1d0ZtVjNxUUdV?=
 =?utf-8?B?WWZOTHlEZ1lTTkZPSWNKSFAwczYwTDNLK1RZK1FvWi9vUzdlQ3pIdW8rdzE5?=
 =?utf-8?B?SVNnWEpTYWhjY1Nod2Qwei82ci9JTXA0dVRNa0ZrbElNb1cwc0NIbWNGUVAv?=
 =?utf-8?B?bXdJU0Z6ZXJ3c2h5eS9vRnVCTURUUXZCZ1VML2NjOWYvRE1jUGg4bzErOHQz?=
 =?utf-8?B?S0pPaDVzb3hTZlhIczBwZHdJcnB1c0Z2QTZqUzJOKythV0dTb09kNThNK1Rt?=
 =?utf-8?B?UDVMR3RCcytLTHNZWG0vM1Fsb1RWVGsySi9vaGUvTEJFN3cwVGxZTHNMYmsr?=
 =?utf-8?B?ci96YlYwbytsRGEydzRTOEw2RFJXREFKZTQzTlZuTWx5L1Iwb2VHT0c5UjVW?=
 =?utf-8?B?QVJXWjdES2pRdzhWNjBKQnlFVm5sVEFaVHpsbDRrSEZxcVBJMVdhY3dYQU9i?=
 =?utf-8?B?ZlJiZzd1NGNNVld1SU9jMER5cmJ1akJFNUVDd0RBRFRDYmdDK25QVnBlNGN3?=
 =?utf-8?B?Z0trWnJYNDJ2bXZIV3E0d3puN2x0elJqa21neXJkUzJmME5OZXc5QUhvRjBF?=
 =?utf-8?B?K1JOclE4eXJUbHRtT0x2U0tLdnpBVFJFRUVUSzhJM2pLejBSQUVhdUorZ3FH?=
 =?utf-8?B?YUNTTjE1ZkdkZGlYMGxlb1YwM0RrNXpUQW5LbXNxR3ZIN002bDRUbXZrdVFV?=
 =?utf-8?B?M25EWHRra3F2K0w2d3cxZzlVL3ZiNGhaTjBiSEx0MWc2UnhpU0w2azhIcnc3?=
 =?utf-8?B?VExVejg2a2NQUUpZa01JRkhvUjdEZkZKWGgvRVA4VXZIYnowbENhaWhuelhl?=
 =?utf-8?B?WG1MT3Z6OWdtUitZU2xtdUdtZUVYWjNwYTR1KzNQMTE4NnRWaU1PNjhIcnpB?=
 =?utf-8?B?YmtueGxXazFxTEx0UXVrOHhuM1drcUdVNWlLNStuSTUrd0I1Nk1lUG1RdGtQ?=
 =?utf-8?B?Sy9yNWdqNVA3Y3NScXhRb0J2WVZ5ZzF3dFFFbllyVThoT3E1K3ZXbTRzTUpo?=
 =?utf-8?B?TDdrenQ3Mm54a2JlVWtsOHY0VjVlZ1hnSkJvVHhScUk0UUtBRUFnTjVocGxZ?=
 =?utf-8?B?ZkJWTzFnckF5WE5TTDliRUFLUGhObGVNOWpUQjJjc2ZYMCtuRUh1NU9jM3Mv?=
 =?utf-8?B?dXZaclNNNTZEWFQ5SjlSSUtDSFN3UVhncm0wcytYbU11UDg4akwyd243d2Er?=
 =?utf-8?B?M2IxNTdGL0JLY1lObktqVXlkeWVQL0xybjNhU0twWHRTbkQyaWxIYkh3R0Z1?=
 =?utf-8?B?cXFNYnlRd0RPNkdBVTFBY1FYYm9iVTZxTWY3eEpIbk5oZ0NlSWNNbDlVODNz?=
 =?utf-8?B?cnl0UFhKK0JoRHg5NE52RURURHBmd05WS3pMaVk5N3FuMlFwS1M5UnYycFR0?=
 =?utf-8?B?RWxGVDg1YjVqQnh6Y1VsVUxUTmVHQUEyWUxLb2tkSDY4dE9kTTNndklrdEh3?=
 =?utf-8?B?dXp5d2dJYks1WmgxM1k2Y09GWXFKak5yTkFWUm1aQlNsam5McG9rOEpoSkth?=
 =?utf-8?B?bGVOeUdmc0xYM3AreUcwM3IxTFFNYWREWFdvUzVZaGR0aHFKQnhoa1ltcThi?=
 =?utf-8?B?U3F4d04yYkNBa0VSM0NkTXp1bWhmbXg2ZXpzOWFXNllSbzZZYWtCNTdrckxT?=
 =?utf-8?B?VWhZdXViTUNKcUhUUGQ0ZFBxcXJIV2RScVpvY09odC9HQWMyaEN6TWJEUUt6?=
 =?utf-8?B?MmFxbFZrVHpDZEowTzRnNVREYUF5eWhDb0dkRzBUT0Y1QTM5TmxqK3RzQlQy?=
 =?utf-8?B?bG50MHNhZXhIRTlYZXR3QUdmazB3QVJSRkljRU1TY0FEQkRqSGF4dHJmMmhO?=
 =?utf-8?B?UTJ0cXVKTEpZSUp0bi9ETklvZVdmTGdSUFBkZmdXSElDMTBnRUM0OVZKajdZ?=
 =?utf-8?Q?aMMQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091b2efe-b0b1-40b2-9dba-08dd5738aa79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 14:11:44.8313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7frCywHZglwsuj4SZzf6y+N7i+zk/VaGTVuoB16lvIIyeyYVZxEvOwng2yXf0AY1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7376
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

Am 27.02.25 um 13:52 schrieb Andi Shyti:
> Hi Nitin,
>
> On Wed, Feb 26, 2025 at 09:25:34PM +0530, Nitin Gote wrote:
>> Give the scheduler a chance to breath by calling cond_resched()
>> as some of the loops may take some time on old machines (like apl/bsw/pnv),
>> and so catch the attention of the watchdogs.
>>
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
>> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> This patch goes beyond the intel-gfx domain so that you need to
> add some people in Cc. By running checkpatch, you should add:
>
> Sumit Semwal <sumit.semwal@linaro.org> (maintainer:DMA BUFFER SHARING FRAMEWORK)
> "Christian König" <christian.koenig@amd.com> (maintainer:DMA BUFFER SHARING FRAMEWORK)
> linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
> dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK)
>
> I added them now, but you might still be asked to resend.
>
> Said that, at a first glance, I don't have anything against this
> patch.

There has been some push to deprecate cond_resched() cause it is almost always not appropriate.

Saying that if I'm not completely mistaken that here is also not 100% correct usage.

Question is why is the test taking 26 (busy?) seconds to complete? That sounds really long even for a very old CPU.

Do we maybe have an udelay() here which should have been an usleep() or similar?

Regards,
Christian.

>
> Andi
>
>> ---
>> Hi,
>>
>> For reviewer reference, adding here watchdog issue seen on old machines
>> during dma-fence-chain subtests testing. This log is retrieved from device
>> pstore log while testing dam-buf@all-tests:
>>
>> dma-buf: Running dma_fence_chain
>> Panic#1 Part7
>> <6> sizeof(dma_fence_chain)=184
>> <6> dma-buf: Running dma_fence_chain/sanitycheck
>> <6> dma-buf: Running dma_fence_chain/find_seqno
>> <6> dma-buf: Running dma_fence_chain/find_signaled
>> <6> dma-buf: Running dma_fence_chain/find_out_of_order
>> <6> dma-buf: Running dma_fence_chain/find_gap
>> <6> dma-buf: Running dma_fence_chain/find_race
>> <6> Completed 4095 cycles
>> <6> dma-buf: Running dma_fence_chain/signal_forward
>> <6> dma-buf: Running dma_fence_chain/signal_backward
>> <6> dma-buf: Running dma_fence_chain/wait_forward
>> <6> dma-buf: Running dma_fence_chain/wait_backward
>> <0> watchdog: BUG: soft lockup - CPU#2 stuck for 26s! [dmabuf:2263]
>> Panic#1 Part6
>> <4> irq event stamp: 415735
>> <4> hardirqs last  enabled at (415734): [<ffffffff813d3a1b>] handle_softirqs+0xab/0x4d0
>> <4> hardirqs last disabled at (415735): [<ffffffff827c7e31>] sysvec_apic_timer_interrupt+0x11/0xc0
>> <4> softirqs last  enabled at (415728): [<ffffffff813d3f8f>] __irq_exit_rcu+0x13f/0x160
>> <4> softirqs last disabled at (415733): [<ffffffff813d3f8f>] __irq_exit_rcu+0x13f/0x160
>> <4> CPU: 2 UID: 0 PID: 2263 Comm: dmabuf Not tainted 6.14.0-rc2-drm-next_483-g7b91683e7de7+ #1
>> <4> Hardware name: Intel corporation NUC6CAYS/NUC6CAYB, BIOS AYAPLCEL.86A.0056.2018.0926.1100 09/26/2018
>> <4> RIP: 0010:handle_softirqs+0xb1/0x4d0
>> <4> RSP: 0018:ffffc90000154f60 EFLAGS: 00000246
>> <4> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
>> <4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>> <4> RBP: ffffc90000154fb8 R08: 0000000000000000 R09: 0000000000000000
>> <4> R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000000a
>> <4> R13: 0000000000000200 R14: 0000000000000200 R15: 0000000000400100
>> <4> FS:  000077521c5cd940(0000) GS:ffff888277900000(0000) knlGS:0000000000000000
>> Panic#1 Part5
>> <4> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> <4> CR2: 00005dbfee8c00c4 CR3: 0000000133d38000 CR4: 00000000003526f0
>> <4> Call Trace:
>> <4>  <IRQ>
>> <4>  ? show_regs+0x6c/0x80
>> <4>  ? watchdog_timer_fn+0x247/0x2d0
>> <4>  ? __pfx_watchdog_timer_fn+0x10/0x10
>> <4>  ? __hrtimer_run_queues+0x1d0/0x420
>> <4>  ? hrtimer_interrupt+0x116/0x290
>> <4>  ? __sysvec_apic_timer_interrupt+0x70/0x1e0
>> <4>  ? sysvec_apic_timer_interrupt+0x47/0xc0
>> <4>  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
>> <4>  ? handle_softirqs+0xb1/0x4d0
>> <4>  __irq_exit_rcu+0x13f/0x160
>> <4>  irq_exit_rcu+0xe/0x20
>> <4>  sysvec_irq_work+0xa0/0xc0
>> <4>  </IRQ>
>> <4>  <TASK>
>> <4>  asm_sysvec_irq_work+0x1b/0x20
>> <4> RIP: 0010:_raw_spin_unlock_irqrestore+0x57/0x80
>> <4> RSP: 0018:ffffc9000292b8f0 EFLAGS: 00000246
>> <4> RAX: 0000000000000000 RBX: ffff88810f235480 RCX: 0000000000000000
>> <4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>> <4> RBP: ffffc9000292b900 R08: 0000000000000000 R09: 0000000000000000
>> <4> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000246
>> <4> R13: 0000000000000000 R14: 0000000000000246 R15: 000000000003828c
>> Panic#1 Part4
>> <4> dma_fence_signal+0x49/0xb0
>> <4> wait_backward+0xf8/0x140 [dmabuf_selftests]
>> <4> __subtests+0x75/0x1f0 [dmabuf_selftests]
>> <4> dma_fence_chain+0x94/0xe0 [dmabuf_selftests]
>> <4> st_init+0x6a/0xff0 [dmabuf_selftests]
>> <4> ? __pfx_st_init+0x10/0x10 [dmabuf_selftests]
>> <4> do_one_initcall+0x79/0x400
>> <4> do_init_module+0x97/0x2a0
>> <4> load_module+0x2c23/0x2f60
>> <4> init_module_from_file+0x97/0xe0
>> <4> ? init_module_from_file+0x97/0xe0
>> <4> idempotent_init_module+0x134/0x350
>> <4> __x64_sys_finit_module+0x77/0x100
>> <4> x64_sys_call+0x1f37/0x2650
>> <4> do_syscall_64+0x91/0x180
>> <4> ? trace_hardirqs_off+0x5d/0xe0
>> <4> ? syscall_exit_to_user_mode+0x95/0x260
>> <4> ? do_syscall_64+0x9d/0x180
>> <4> ? do_syscall_64+0x9d/0x180
>> <4> ? irqentry_exit+0x77/0xb0
>> <4> ? sysvec_apic_timer_interrupt+0x57/0xc0
>> <4> entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> <4> RIP: 0033:0x77521e72725d
>>
>>
>>  drivers/dma-buf/st-dma-fence-chain.c | 14 +++++++++++---
>>  1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
>> index ed4b323886e4..328a66ed59e5 100644
>> --- a/drivers/dma-buf/st-dma-fence-chain.c
>> +++ b/drivers/dma-buf/st-dma-fence-chain.c
>> @@ -505,6 +505,7 @@ static int signal_forward(void *arg)
>>  
>>  	for (i = 0; i < fc.chain_length; i++) {
>>  		dma_fence_signal(fc.fences[i]);
>> +		cond_resched();
>>  
>>  		if (!dma_fence_is_signaled(fc.chains[i])) {
>>  			pr_err("chain[%d] not signaled!\n", i);
>> @@ -537,6 +538,7 @@ static int signal_backward(void *arg)
>>  
>>  	for (i = fc.chain_length; i--; ) {
>>  		dma_fence_signal(fc.fences[i]);
>> +		cond_resched();
>>  
>>  		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
>>  			pr_err("chain[%d] is signaled!\n", i);
>> @@ -587,8 +589,10 @@ static int wait_forward(void *arg)
>>  	get_task_struct(tsk);
>>  	yield_to(tsk, true);
>>  
>> -	for (i = 0; i < fc.chain_length; i++)
>> +	for (i = 0; i < fc.chain_length; i++) {
>>  		dma_fence_signal(fc.fences[i]);
>> +		cond_resched();
>> +	}
>>  
>>  	err = kthread_stop_put(tsk);
>>  
>> @@ -616,8 +620,10 @@ static int wait_backward(void *arg)
>>  	get_task_struct(tsk);
>>  	yield_to(tsk, true);
>>  
>> -	for (i = fc.chain_length; i--; )
>> +	for (i = fc.chain_length; i--; ) {
>>  		dma_fence_signal(fc.fences[i]);
>> +		cond_resched();
>> +	}
>>  
>>  	err = kthread_stop_put(tsk);
>>  
>> @@ -663,8 +669,10 @@ static int wait_random(void *arg)
>>  	get_task_struct(tsk);
>>  	yield_to(tsk, true);
>>  
>> -	for (i = 0; i < fc.chain_length; i++)
>> +	for (i = 0; i < fc.chain_length; i++) {
>>  		dma_fence_signal(fc.fences[i]);
>> +		cond_resched();
>> +	}
>>  
>>  	err = kthread_stop_put(tsk);
>>  
>> -- 
>> 2.25.1

