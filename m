Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940BC8CC530
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 18:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB54D10E098;
	Wed, 22 May 2024 16:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xuB0CZRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63C010E004;
 Wed, 22 May 2024 16:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpgjGZmSl3w70hJOyuQwmiHDprlbQbCAQ0nu20m2++lofivza05j0ZqYraGN2+yrpvoc56bdCVfbXZ71AzQysEI6y6XXcetmO8+gLXHH5FQnbHbxqPrXIvGZpXH8AcQfV7+kLAaDA4vxVGycw297eEhMCPUz1deiJ6uxr8le26Kp2ajNi7h6umkkBJzyc1naetg6FjSIM/p6V2/fvSY/fpq/M/fj0nFMZ4U+d/1k3wWVG5eCgeWsXqXhSXaks34HIHaF1p4L90pw4R8/TFxorkC93VMTy28U3AhPNqu/FiwCaPH8tqle5P+qgb7JuNcM/sDxxxLhPXbYtbXraY1cKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oulgn5iq377umlzXe+h7gCQ+vaRW0hRcQqqhNo1+fOc=;
 b=Pp5VtZzC1Xxu3p2FBYoyYi00ZZNPK3ARaahqqRo/hxPw4ANYBYNKZLhwFTh/6aFd/zqm8+k1hClOVlaLSdyJ8VBIOdOIf5B3sOs+aGluCMYcNVte3JSTLAXTMDCNozgnt3oGxuQglnDehEnK35ZZLt+Ylt1HI0Yn6unJJnRKdQoebMVkBtXVJKGJCAZsyYZygrieKxNWhoUqRETmb+Nrq9JoEHkVbToeAqFdHOaTJZQbI2pdtCgKf4MWwSf9pQ0O0b8BwrpRTv0Hj5X175a/WOSIGy+nbbMoA5eh5hifvauBVz9wprMDgqxZZ/fckUxv3Bn6/Jh6JFxxuuKAes4Znw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oulgn5iq377umlzXe+h7gCQ+vaRW0hRcQqqhNo1+fOc=;
 b=xuB0CZRokxVe/GL3wutOgy2gQAvdSrATaDJ/qWY3rHi/w9FPlyFhI9laP9xu/yymcJYQGyycZwPTSJ3WQCGyu7WX0J0Ga74XP0YAXGeci7hj9mSk93Xi6EADiXpkic053C58y8BvOuz6xtBZWe+LRFYpOkmDOmR3fHtUlKMN/jY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4485.namprd12.prod.outlook.com (2603:10b6:208:269::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 16:52:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.037; Wed, 22 May 2024
 16:52:58 +0000
Content-Type: multipart/alternative;
 boundary="------------IE0O8de0FxZKqjMitUAptQ1Y"
Message-ID: <e0fb45b9-69a8-4e36-a518-30380583fcd2@amd.com>
Date: Wed, 22 May 2024 18:52:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 13/21] drm/exec: Rework contended locking
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-14-thomas.hellstrom@linux.intel.com>
 <fb9efb6b-fd2f-424e-8c9c-8ca590ee714a@amd.com>
 <3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com>
X-ClientProxiedBy: FR4P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4485:EE_
X-MS-Office365-Filtering-Correlation-Id: c42c22e6-e144-4d40-a348-08dc7a7fa1ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTFmb1kwc09OMSt6M0lxZ0RzTTdwd2w0YkdScEI1Zm50MHRLa05wQm1tenZk?=
 =?utf-8?B?TkFhSlFRckxBek9LQXFibFpGVmJPM2xGTkozcE9ka3NuM2RkeCs1OUtiZ2ZE?=
 =?utf-8?B?MkFoaEpkV1ZQMEtQcG12YTVpNVFMamFRQzJFbmI5QTA2M3ZzUDIxVDlKZjQr?=
 =?utf-8?B?REFzdGRlN2dqdjVWcnpKZG5wU3J0akY3bmhHU3J2OHd3K3hZZWIzWll4b2VQ?=
 =?utf-8?B?UHIydjZSNFgvdEZ3dXd2M0pNSkJ3K2o5cUMyUDdFcEtYbHgvZjBnUGhlZjlj?=
 =?utf-8?B?bDdaUi9Ib1JvT2Q5TXlCNU0wSjBtUXVXSXp2dmxVaTUxRTV1eE1KZTJrUC9y?=
 =?utf-8?B?TWoxSHZtbGpESzNaZWlGMlh2VnVHQ05HS1Y5bDY3NzhBYXp2aW5RYkFnQVY2?=
 =?utf-8?B?MzdrNUhQdWozN0pJcWQ1cDBrZWkvZjFzbjhxMkFYa1ovcE9kdWhHQ0VpUkhC?=
 =?utf-8?B?aXVWYVJkekc4M3JPL2VFZnp5YnAvMVlzRVJEUWx5QUtKWkZ5eUZmWkRuN1Z0?=
 =?utf-8?B?NXBMZ0E2aG9GRS9lbEx6UDhOQVlsQ2xqVGlHT1hnRkdjbERaTDhYUUJxbGVR?=
 =?utf-8?B?bEVHTy9HTGJQQTJoRTAxTVlJR0ZpcEV6dUhNaE5JYk9MRXBmRWVLTUxIeFFL?=
 =?utf-8?B?YUtTbmIyYkdvSVZUeGcyL0JvSUpRY2xZbWpGU21xVnk0SzRZQWhHKzlOS1lE?=
 =?utf-8?B?MXBpR0JUMlhWdEtUbEtLbHFPZVg5dlNoc3k5Q0dIN3RjZ2lmODVHTmlLcXM1?=
 =?utf-8?B?VUQ4NldHVmU0MzdlTzNUZitIc21kUk95a1F1aUljblhqaHl5cDVpZU00bUF2?=
 =?utf-8?B?dXRHVU5VL0d6MTg0UFBwbGFWc252a3p4anowYmE2SW8yemExT1Z3d2k2eFpW?=
 =?utf-8?B?MldzMHN4eGJLY21GUWdYRFc0RVd0WjhxWGQzcjdlcDNjbFlpR2hvYnNxNmNo?=
 =?utf-8?B?MkVGbzBPN1pjK01pRDl2VE5RUklMRUhXQTYrY0FiVTBMRWJkQjlEYjhvcm0r?=
 =?utf-8?B?RFd5SEU1SmErc0Z6aFlaQVEwSGluckU2MkNTQnZGY0dvTmcrdHpTYWdRMlhK?=
 =?utf-8?B?b0M4R1J5RVF2MGFZdU1YMzFCNWFmZm9QRGVZUnZKYS83Q0dhUjFVN3JKQjJF?=
 =?utf-8?B?TzR2bGU4R3lWd2o5VWJkcjlNOU5IdmcwZkt1MTBSZ1YxNXhoem9OU3kvSFpt?=
 =?utf-8?B?dVhIL1ZoQU9ZRUlLS1JpZEd0Z0hyMTZxcGVBbG13VVZPYjhOSlNhZ2t5cUty?=
 =?utf-8?B?R2tMWCtKcVBwU2Nzd21Xd1dRTEtmbHRvdExJMy9aTmZxY1Vha0pES2RneWhh?=
 =?utf-8?B?MlByWlYyZE5VcXY2WW1PVVJkOGxxUzFvdkdvZTU4SUl2cUkwcEJsWlAwUEZk?=
 =?utf-8?B?U0N6K1B4WkNadldjK1RrVmE5eVFNdnNLYzhmSDdNZ2p3N3JQMWZhZVJlVW1t?=
 =?utf-8?B?TnVWT01KQWFOeGtmNDliVnd2djNzZkpOdVFhK2pFaWhGWHphL2JzSzVBVTd0?=
 =?utf-8?B?WkVsRDFLbTVBMlBBMWNmbTB2OFJjNERIS2s4L09odS82cFNnYjJURnkxMXNL?=
 =?utf-8?B?LzhpR0lyODRuNHowb0NUNk9JemFQd1Q3eEpKU0s0UGsrYjR0YUduNXBlM3VE?=
 =?utf-8?B?WXFhdTJvY3R6bWRTbk9DckZGeEJkWFUrNk9lL3FiSitmem1ZYUFEREVob3Zz?=
 =?utf-8?B?U1Y4VmdyYnNHVVJpbU5HelpwK2hlNzRMYlZwYlRNWCtXdzRZUktROFlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2VDVVlyTDg0Wms0MEpLUHoxRTVEamc5R202WmgyM05iemNMRmxqLzFnMWUz?=
 =?utf-8?B?cE1Yck9aV1QraGxrVXpFN2FaWnFaeDZjZjhFRDEzeU5VeFA4SUdyQWM0a2hz?=
 =?utf-8?B?cDkxaW5XNkYyditWNHRCR1BIMmFzVkVEY1BTMkxiaUV0TEtKUGU1Si85UWty?=
 =?utf-8?B?U04yWVN5dUhMYXR6Q3dkMDNXNnVlSFdFNktoSmZ5eUo1MlpKd0JwVXRHWG1Y?=
 =?utf-8?B?c3dCblhUSk5tU2pQbTh4cXMvWk9lQTcvdEJZTkVqNTBIVERuYkN3SkdrZkdw?=
 =?utf-8?B?RVJ2c0VwNlYwbkNTZ2RxdDFGbmQxOVlLcGRLZUF0OVlQTFRraWxCZlNqOHBK?=
 =?utf-8?B?ejZ5aUdTd002VjBqSWFnMC83dnovakl2WlkwUG9YaXJLYlR2dm9Ua29FRjcw?=
 =?utf-8?B?RWZ6MnRKRVJhRjlBOS8wYzduM3JLK3F6ZnkrbUhkZ3RWd0FKQWxPYTZCQ1Nh?=
 =?utf-8?B?b01sY3l4MEF3Ly8zUXZORkt4a3FNK0ZxeEhDMlJUNWphbE41UkFIaDZPNVRo?=
 =?utf-8?B?b3F2ODlMdEp2YW5CTzlDNllaTVZtNkZkV2E2N0VqcFZwMi96R1E5NE9mUzJT?=
 =?utf-8?B?UCtwaUdmcmhEdFhMcFBOdHQ4ODdMT0xkaEdqaG5jRVAraXV4RUdUYTFuTitD?=
 =?utf-8?B?L3lWZFNlWkVTNEk4MGt1MXRVYXhTQnE5WnZsOSt2bEJyMFViQTBBZUR3dThD?=
 =?utf-8?B?UDFJYUJESDd4MUZZR1E4RnlmVExNNkVhdS9lUkxtZnNER0g5OXpIWm9QczNP?=
 =?utf-8?B?K2MzS29SUHpOQ2NISk8rOERRbEY3U1NacEViK0hTTm5tQ2xuSXpxZWIzZGdH?=
 =?utf-8?B?T3lTZU9XLzJvelVpM3FVRERNc3FGWWliN2gxNHdDVUZoN2JnWklMNXdQVzZx?=
 =?utf-8?B?US9xWXBjZUFlbFRRaEtKaXpaOGUyek95TGRYcTVKMXZZcUcrR3NKcEg0ZDRB?=
 =?utf-8?B?SHM0L29iN21IV0REOXpReUFJWFZXYy9wSHJFelZVMTdHWmtBSnhKT2tuWTg3?=
 =?utf-8?B?THQ0Y1YrQ1BqcXhyaVZSNVV2NmRQUDZmRDd6a2k5dXc4KzVmUFFVU1B0UEcz?=
 =?utf-8?B?WXFIZHdJcmEvQzRGaXlEOHltQmNObHhIYjhqM3orMC92RjN1Z1YvdEkzRTNZ?=
 =?utf-8?B?MXFpVG83eHVvRUl3YUM2bVV0TXQ2TGdpWE5KZ0lBRkRuclBhZ1FscHZORDk4?=
 =?utf-8?B?STdkeUFJSlEwQWJoNTZrN2Y1NWJLS3JSZDJrY1JuVW0zM2pPblRnTEhpdVI1?=
 =?utf-8?B?amVuTmhaY1hmNG5mc0VQeDZKczRuTDBGenNuR1hqUnlsQ293V0pJSFNjaDlj?=
 =?utf-8?B?RFlpaHVOK1p0T2N2TS9BYjRJN2JCWnNJM0FzYWhhaEhxaFpxRXpGWGVKdHFJ?=
 =?utf-8?B?d1hiOVlzT0VwQVZ4MkY3SEs2U29Edk5nMFNvY0IvQlFOaDV6VFFDdTQyV1Uy?=
 =?utf-8?B?NFlXYWxtU1E2R0VuN0UzSzJoN3NqdERLZXR6RjhDRElKMHo3QVFCVGNucGEx?=
 =?utf-8?B?SWplVCtTTjQzMSsxL1NMeEZPWHkrVEkvaWFCV3BRbWpaNHUyN2xKczFqejg3?=
 =?utf-8?B?SGJ0MDZZQU9PZ0xhSzFCR0dBbmFzRStQWm8ySnBudVlzK0l4VmpSeFFsK0RK?=
 =?utf-8?B?OHIzTVNoVDF1L0JqZURPOFBTclYwZnVYZzltZ1FQbGNLZlk2Nmh0Ui94ZGQx?=
 =?utf-8?B?U1Y5NVptN0ZkU2UxejBKcGRkNzhVeE9mQ0o4blFSU3I2a0pERTN0TXRTcTZr?=
 =?utf-8?B?SGgzVUlkTkswM2RoMTJmZWZ4YUZnWWkxSmZIalB2QzRMMWtHOVRSakorRXQ1?=
 =?utf-8?B?N2JvOXI0dEdhN1pKdXJGbVNvSXVUUGsremlsdG1xVWVTUldGSm5PU0gxZ3BH?=
 =?utf-8?B?MEZyTW9BekFzMGpISWpIOVQ2andITi9ZTGZWMTZ5ZTBZMlFtU0VGSlBGQ080?=
 =?utf-8?B?S2NNZTNKcnF0bVVCWmtrVVZ1SXdOZDlDQnZHKzZHMUlHcWhrdGxYWC95eGxq?=
 =?utf-8?B?TFExSkprUnY4M0V6bnBlUklrWFFjSEx4Z2J5QmdZaXFjZFhPb3UzMnJIUFhz?=
 =?utf-8?B?L0p5LzIvU01hYklQbVVMNGdFcEtENktRQko1Z1BxUW1jVVNzU0gzWlFkWm0y?=
 =?utf-8?Q?/SlJ6b3Upk+eXotG2kjx+KCUI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c42c22e6-e144-4d40-a348-08dc7a7fa1ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:52:58.0625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0yGfaEQbz5e+szcHU2QjqxL86juKRoaHRmvOAI56yowjWAraYMUojfKjUZRqAhU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4485
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

--------------IE0O8de0FxZKqjMitUAptQ1Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 22.05.24 um 16:32 schrieb Thomas Hellström:
> On Wed, 2024-05-22 at 07:52 +0200, Christian König wrote:
>> Am 21.05.24 um 09:16 schrieb Thomas Hellström:
>>> If contention and backoff occurs during a drm_exec ww transaction,
>>> the contended lock is not locked again until the next orinary
>>> attempt to lock a dma_resv lock. However, with the introduction of
>>> drm_exec_trylock(), that doesn't work, since the locking of the
>>> contended lock needs to be a sleeping lock. Neither can we ignore
>>> locking the contended lock during a trylock since that would
>>> violate
>>> at least the ww_mutex annotations.
>>>
>>> So resolve this by actually locking the contended lock during
>>> drm_exec_retry_on_contention(). However, this introduces a new
>>> point
>>> of failure since locking the contended lock may return -EINTR.
>>>
>>> Hence drm_exec_retry_on_contention() must take an error parameter
>>> and
>>> also return a value indicating success.
>> After thinking more about that I have to pretty clearly NAK this.
>>                                    
> I thought we were beyond upfront NAKing in the first reply :/

Well my memory could fail me, but I mentioned concerns on this approach 
before.

I was a bit annoyed seeing that again. But could as well be that my 
response never got out or that I'm mixing things up.

>> It's an intentional design decision to guarantee that at the start of
>> the loop no object is locked.
>>
>> This is because Sima and I wanted to integrate userptr handling into
>> drm_exec as well in the long term.
> First I agree the interface looks worse with this patch.
> But I thought generic userptr handling were going to end up as a gpuvm
> helper (without using GEM objects) as we've discussed previously.

We might be talking past each other. That sounds like SVM, e.g. on 
demand paging.

What I mean is pre-faulting during command submission like radeon, 
amdgpu and i915 do for the userptr handling.

For that you need to re-start the whole handling similar to how you need 
to re-start for the mutex locking when you detect that the page array is 
stale, the difference is that you are not allowed to hold any resv locks 
while pre-faulting.

That's why it is a requirement that the drm_exec loop starts without any 
locks held.

> Anyway if still there would be helpers in drm_exec for some other
> generic userptr solution, those need to be done before the
> ww_acquire_ctx_init(). The contended locking here is done after, so I
> can't really see how these would clash.

Yes, that indeed was a problem. The ww_acquire_ctx_init() was 
intentionally moved into drm_exec_cleanup() to partially prevent that issue.

I haven't fully figured out how to do handle everything exactly, but at 
least in principle it can be made work. With this change here it becomes 
impossible.

> Still, If we need to come up with another solution, I think it's fair
> we clearly sort out why.
>
>> I think we should just document that drm_exec_trylock() can't be used
>> to
>> lock the first BO in the loop and explicitly WARN if that's the case.
> Unfortunately that's not sufficient for the general use-case. If we
> want to keep the ttm_bo_vm approach of dropping the mmap lock when
> there is contention on the bo resv, we need to be able to trylock on
> first lock.

Mhm, why exactly do we still have that dance in the first place?

I mean we have sorted out the mmap() and dma_resv() locking order long 
ago. See dma_resv_lockdep() which is enforcing that.

>   Also bo creation is using trylock but might be able to use
> a sleeping lock there. But if that sleeping lock triggers an -EDEADLK
> (DEBUG_WW_MUTEX_SLOWPATH) we have the weird situation of referencing an
> object that never was fully created as a contending object.

I wanted to eliminate that as well by not validating the BO during 
initialization any more.

So bo creation would then be:

ttm_bo_init(bo)

drm_exec_while_not_all_locked() {
     drm_exec_prepare_object(bo, 1);

     ttm_bo_validate(bo);
}

if (r)
     ttm_bo_put(bo);

return r;

I have that on a branch here somewhere prepared, but never got the time 
to clean it up.

Regards,
Christian.

>
> So the only really working alternative solution I can see is that
> drm_exec_trylock simply fails if there is a contended lock and we'd
> need to live with the weird bo creation situation described above.
>
> /Thomas
>
>> Regards,
>> Christian.
>>
>>> Cc: Christian König<christian.koenig@amd.com>
>>> Cc: Somalapuram Amaranath<Amaranath.Somalapuram@amd.com>
>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>> Cc:<dri-devel@lists.freedesktop.org>
>>> Signed-off-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>> ---
>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 16 ++++-----
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6 ++--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  4 +--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  8 ++---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  8 ++---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c     |  4 +--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  8 ++---
>>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  2 +-
>>>    drivers/gpu/drm/drm_exec.c                    | 35
>>> ++++++++++++++-----
>>>    drivers/gpu/drm/drm_gpuvm.c                   |  8 ++---
>>>    drivers/gpu/drm/imagination/pvr_job.c         |  2 +-
>>>    drivers/gpu/drm/msm/msm_gem_submit.c          |  2 +-
>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  2 +-
>>>    drivers/gpu/drm/tests/drm_exec_test.c         | 12 +++----
>>>    drivers/gpu/drm/xe/xe_gt_pagefault.c          |  4 +--
>>>    drivers/gpu/drm/xe/xe_vm.c                    | 10 +++---
>>>    include/drm/drm_exec.h                        | 23 +++++++++---
>>>    17 files changed, 92 insertions(+), 62 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> index e4d4e55c08ad..4a08a692aa1f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> @@ -1152,12 +1152,12 @@ static int reserve_bo_and_vm(struct kgd_mem
>>> *mem,
>>>    	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>>>    	drm_exec_until_all_locked(&ctx->exec) {
>>>    		ret = amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
>>> -		drm_exec_retry_on_contention(&ctx->exec);
>>> +		ret = drm_exec_retry_on_contention(&ctx->exec,
>>> ret);
>>>    		if (unlikely(ret))
>>>    			goto error;
>>>    
>>>    		ret = drm_exec_prepare_obj(&ctx->exec, &bo-
>>>> tbo.base, 1);
>>> -		drm_exec_retry_on_contention(&ctx->exec);
>>> +		ret = drm_exec_retry_on_contention(&ctx->exec,
>>> ret);
>>>    		if (unlikely(ret))
>>>    			goto error;
>>>    	}
>>> @@ -1199,14 +1199,14 @@ static int reserve_bo_and_cond_vms(struct
>>> kgd_mem *mem,
>>>    
>>>    			ret = amdgpu_vm_lock_pd(entry->bo_va-
>>>> base.vm,
>>>    						&ctx->exec, 2);
>>> -			drm_exec_retry_on_contention(&ctx->exec);
>>> +			ret = drm_exec_retry_on_contention(&ctx-
>>>> exec, ret);
>>>    			if (unlikely(ret))
>>>    				goto error;
>>>    			++ctx->n_vms;
>>>    		}
>>>    
>>>    		ret = drm_exec_prepare_obj(&ctx->exec, &bo-
>>>> tbo.base, 1);
>>> -		drm_exec_retry_on_contention(&ctx->exec);
>>> +		ret = drm_exec_retry_on_contention(&ctx->exec,
>>> ret);
>>>    		if (unlikely(ret))
>>>    			goto error;
>>>    	}
>>> @@ -2619,7 +2619,7 @@ static int validate_invalid_user_pages(struct
>>> amdkfd_process_info *process_info)
>>>    		list_for_each_entry(peer_vm, &process_info-
>>>> vm_list_head,
>>>    				    vm_list_node) {
>>>    			ret = amdgpu_vm_lock_pd(peer_vm, &exec,
>>> 2);
>>> -			drm_exec_retry_on_contention(&exec);
>>> +			ret = drm_exec_retry_on_contention(&exec,
>>> ret);
>>>    			if (unlikely(ret))
>>>    				goto unreserve_out;
>>>    		}
>>> @@ -2631,7 +2631,7 @@ static int validate_invalid_user_pages(struct
>>> amdkfd_process_info *process_info)
>>>    
>>>    			gobj = &mem->bo->tbo.base;
>>>    			ret = drm_exec_prepare_obj(&exec, gobj,
>>> 1);
>>> -			drm_exec_retry_on_contention(&exec);
>>> +			ret = drm_exec_retry_on_contention(&exec,
>>> ret);
>>>    			if (unlikely(ret))
>>>    				goto unreserve_out;
>>>    		}
>>> @@ -2875,7 +2875,7 @@ int
>>> amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct
>>> dma_fence __rcu *
>>>    		list_for_each_entry(peer_vm, &process_info-
>>>> vm_list_head,
>>>    				    vm_list_node) {
>>>    			ret = amdgpu_vm_lock_pd(peer_vm, &exec,
>>> 2);
>>> -			drm_exec_retry_on_contention(&exec);
>>> +			ret = drm_exec_retry_on_contention(&exec,
>>> ret);
>>>    			if (unlikely(ret)) {
>>>    				pr_err("Locking VM PD failed, ret:
>>> %d\n", ret);
>>>    				goto ttm_reserve_fail;
>>> @@ -2891,7 +2891,7 @@ int
>>> amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct
>>> dma_fence __rcu *
>>>    
>>>    			gobj = &mem->bo->tbo.base;
>>>    			ret = drm_exec_prepare_obj(&exec, gobj,
>>> 1);
>>> -			drm_exec_retry_on_contention(&exec);
>>> +			ret = drm_exec_retry_on_contention(&exec,
>>> ret);
>>>    			if (unlikely(ret)) {
>>>    				pr_err("drm_exec_prepare_obj
>>> failed, ret: %d\n", ret);
>>>    				goto ttm_reserve_fail;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index ec888fc6ead8..299e46a6d934 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -897,7 +897,7 @@ static int amdgpu_cs_parser_bos(struct
>>> amdgpu_cs_parser *p,
>>>    
>>>    	drm_exec_until_all_locked(&p->exec) {
>>>    		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec, 1 + p-
>>>> gang_size);
>>> -		drm_exec_retry_on_contention(&p->exec);
>>> +		r = drm_exec_retry_on_contention(&p->exec, r);
>>>    		if (unlikely(r))
>>>    			goto out_free_user_pages;
>>>    
>>> @@ -905,7 +905,7 @@ static int amdgpu_cs_parser_bos(struct
>>> amdgpu_cs_parser *p,
>>>    			/* One fence for TTM and one for each CS
>>> job */
>>>    			r = drm_exec_prepare_obj(&p->exec, &e->bo-
>>>> tbo.base,
>>>    						 1 + p-
>>>> gang_size);
>>> -			drm_exec_retry_on_contention(&p->exec);
>>> +			r = drm_exec_retry_on_contention(&p->exec,
>>> r);
>>>    			if (unlikely(r))
>>>    				goto out_free_user_pages;
>>>    
>>> @@ -915,7 +915,7 @@ static int amdgpu_cs_parser_bos(struct
>>> amdgpu_cs_parser *p,
>>>    		if (p->uf_bo) {
>>>    			r = drm_exec_prepare_obj(&p->exec, &p-
>>>> uf_bo->tbo.base,
>>>    						 1 + p-
>>>> gang_size);
>>> -			drm_exec_retry_on_contention(&p->exec);
>>> +			r = drm_exec_retry_on_contention(&p->exec,
>>> r);
>>>    			if (unlikely(r))
>>>    				goto out_free_user_pages;
>>>    		}
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> index cfdf558b48b6..8b2b86c7a6c5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> @@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct amdgpu_device
>>> *adev, struct amdgpu_vm *vm,
>>>    		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>    		if (likely(!r))
>>>    			r = drm_exec_lock_obj(&exec, &bo-
>>>> tbo.base);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r)) {
>>>    			DRM_ERROR("failed to reserve CSA,PD BOs:
>>> err=%d\n", r);
>>>    			goto error;
>>> @@ -114,7 +114,7 @@ int amdgpu_unmap_static_csa(struct
>>> amdgpu_device *adev, struct amdgpu_vm *vm,
>>>    		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>    		if (likely(!r))
>>>    			r = drm_exec_lock_obj(&exec, &bo-
>>>> tbo.base);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r)) {
>>>    			DRM_ERROR("failed to reserve CSA,PD BOs:
>>> err=%d\n", r);
>>>    			goto error;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 67c234bcf89f..17e16c971e21 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -239,12 +239,12 @@ static void amdgpu_gem_object_close(struct
>>> drm_gem_object *obj,
>>>    	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto out_unlock;
>>>    
>>>    		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto out_unlock;
>>>    	}
>>> @@ -776,13 +776,13 @@ int amdgpu_gem_va_ioctl(struct drm_device
>>> *dev, void *data,
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		if (gobj) {
>>>    			r = drm_exec_lock_obj(&exec, gobj);
>>> -			drm_exec_retry_on_contention(&exec);
>>> +			r = drm_exec_retry_on_contention(&exec,
>>> r);
>>>    			if (unlikely(r))
>>>    				goto error;
>>>    		}
>>>    
>>>    		r = amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto error;
>>>    	}
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>> index 5ca5c47ab54e..1b1a5147606e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>> @@ -1221,12 +1221,12 @@ int amdgpu_mes_ctx_map_meta_data(struct
>>> amdgpu_device *adev,
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		r = drm_exec_lock_obj(&exec,
>>>    				      &ctx_data->meta_data_obj-
>>>> tbo.base);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto error_fini_exec;
>>>    
>>>    		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto error_fini_exec;
>>>    	}
>>> @@ -1292,12 +1292,12 @@ int amdgpu_mes_ctx_unmap_meta_data(struct
>>> amdgpu_device *adev,
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		r = drm_exec_lock_obj(&exec,
>>>    				      &ctx_data->meta_data_obj-
>>>> tbo.base);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto out_unlock;
>>>    
>>>    		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto out_unlock;
>>>    	}
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>> index e22cb2b5cd92..72b8213e352c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>> @@ -77,7 +77,7 @@ int amdgpu_seq64_map(struct amdgpu_device *adev,
>>> struct amdgpu_vm *vm,
>>>    		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>    		if (likely(!r))
>>>    			r = drm_exec_lock_obj(&exec, &bo-
>>>> tbo.base);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto error;
>>>    	}
>>> @@ -138,7 +138,7 @@ void amdgpu_seq64_unmap(struct amdgpu_device
>>> *adev, struct amdgpu_fpriv *fpriv)
>>>    		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>    		if (likely(!r))
>>>    			r = drm_exec_lock_obj(&exec, &bo-
>>>> tbo.base);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto error;
>>>    	}
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>> index e01c1c8e64c4..63392ce43945 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>> @@ -89,12 +89,12 @@ static int map_ring_data(struct amdgpu_device
>>> *adev, struct amdgpu_vm *vm,
>>>    	drm_exec_init(&exec, 0, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		r = drm_exec_lock_obj(&exec, &bo->tbo.base);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto error_fini_exec;
>>>    
>>>    		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto error_fini_exec;
>>>    	}
>>> @@ -152,12 +152,12 @@ static int unmap_ring_data(struct
>>> amdgpu_device *adev, struct amdgpu_vm *vm,
>>>    	drm_exec_init(&exec, 0, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		r = drm_exec_lock_obj(&exec, &bo->tbo.base);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto out_unlock;
>>>    
>>>    		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>    		if (unlikely(r))
>>>    			goto out_unlock;
>>>    	}
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> index 386875e6eb96..a3aa7fd22f6a 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> @@ -1499,7 +1499,7 @@ static int svm_range_reserve_bos(struct
>>> svm_validate_context *ctx, bool intr)
>>>    			vm = drm_priv_to_vm(pdd->drm_priv);
>>>    
>>>    			r = amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
>>> -			drm_exec_retry_on_contention(&ctx->exec);
>>> +			r = drm_exec_retry_on_contention(&ctx-
>>>> exec, r);
>>>    			if (unlikely(r)) {
>>>    				pr_debug("failed %d to reserve
>>> bo\n", r);
>>>    				goto unreserve_out;
>>> diff --git a/drivers/gpu/drm/drm_exec.c
>>> b/drivers/gpu/drm/drm_exec.c
>>> index 2da094bdf8a4..3770a5d30213 100644
>>> --- a/drivers/gpu/drm/drm_exec.c
>>> +++ b/drivers/gpu/drm/drm_exec.c
>>> @@ -28,12 +28,12 @@
>>>     *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>>>     *	drm_exec_until_all_locked(&exec) {
>>>     *		ret = drm_exec_prepare_obj(&exec, boA, 1);
>>> - *		drm_exec_retry_on_contention(&exec);
>>> + *		ret = drm_exec_retry_on_contention(&exec, ret);
>>>     *		if (ret)
>>>     *			goto error;
>>>     *
>>>     *		ret = drm_exec_prepare_obj(&exec, boB, 1);
>>> - *		drm_exec_retry_on_contention(&exec);
>>> + *		ret = drm_exec_retry_on_contention(&exec, ret);
>>>     *		if (ret)
>>>     *			goto error;
>>>     *	}
>>> @@ -48,7 +48,8 @@
>>>     */
>>>    
>>>    /* Dummy value used to initially enter the retry loop */
>>> -#define DRM_EXEC_DUMMY ((void *)~0)
>>> +#define DRM_EXEC_DUMMY ERR_PTR(-ESTALE)
>>> +#define DRM_EXEC_CONTENDED ERR_PTR(-EDEADLK)
>>>    
>>>    /* Unlock all objects and drop references */
>>>    static void drm_exec_unlock_all(struct drm_exec *exec)
>>> @@ -131,8 +132,7 @@ bool drm_exec_cleanup(struct drm_exec *exec)
>>>    		return true;
>>>    	}
>>>    
>>> -	drm_exec_unlock_all(exec);
>>> -	exec->num_objects = 0;
>>> +	exec->contended = NULL;
>>>    	return true;
>>>    }
>>>    EXPORT_SYMBOL(drm_exec_cleanup);
>>> @@ -194,6 +194,27 @@ static int drm_exec_lock_contended(struct
>>> drm_exec *exec)
>>>    	return ret;
>>>    }
>>>    
>>> +/**
>>> + * drm_exec_handle_contended() - Perform cleanup before a ww
>>> transaction restart
>>> + * @exec: Pointer to the drm_exec object.
>>> + *
>>> + * Unlocks all held resvs and re-locks the contended object.
>>> + *
>>> + * Return: 0 on success, negative error code on failure.
>>> + */
>>> +int drm_exec_handle_contended(struct drm_exec *exec)
>>> +{
>>> +	int ret;
>>> +
>>> +	drm_exec_unlock_all(exec);
>>> +	exec->num_objects = 0;
>>> +	ret = drm_exec_lock_contended(exec);
>>> +	exec->contended = DRM_EXEC_CONTENDED;
>>> +
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL(drm_exec_handle_contended);
>>> +
>>>    /**
>>>     * drm_exec_lock_obj - lock a GEM object for use
>>>     * @exec: the drm_exec object with the state
>>> @@ -209,10 +230,6 @@ int drm_exec_lock_obj(struct drm_exec *exec,
>>> struct drm_gem_object *obj)
>>>    {
>>>    	int ret;
>>>    
>>> -	ret = drm_exec_lock_contended(exec);
>>> -	if (unlikely(ret))
>>> -		return ret;
>>> -
>>>    	if (exec->prelocked == obj) {
>>>    		drm_gem_object_put(exec->prelocked);
>>>    		exec->prelocked = NULL;
>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>>> b/drivers/gpu/drm/drm_gpuvm.c
>>> index f9eb56f24bef..0923d6ae18e2 100644
>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>> @@ -1254,18 +1254,18 @@ drm_gpuvm_exec_lock(struct drm_gpuvm_exec
>>> *vm_exec)
>>>    
>>>    	drm_exec_until_all_locked(exec) {
>>>    		ret = drm_gpuvm_prepare_vm(gpuvm, exec,
>>> num_fences);
>>> -		drm_exec_retry_on_contention(exec);
>>> +		ret = drm_exec_retry_on_contention(exec, ret);
>>>    		if (ret)
>>>    			goto err;
>>>    
>>>    		ret = drm_gpuvm_prepare_objects(gpuvm, exec,
>>> num_fences);
>>> -		drm_exec_retry_on_contention(exec);
>>> +		ret = drm_exec_retry_on_contention(exec, ret);
>>>    		if (ret)
>>>    			goto err;
>>>    
>>>    		if (vm_exec->extra.fn) {
>>>    			ret = vm_exec->extra.fn(vm_exec);
>>> -			drm_exec_retry_on_contention(exec);
>>> +			ret = drm_exec_retry_on_contention(exec,
>>> ret);
>>>    			if (ret)
>>>    				goto err;
>>>    		}
>>> @@ -1346,7 +1346,7 @@ drm_gpuvm_exec_lock_range(struct
>>> drm_gpuvm_exec *vm_exec,
>>>    	drm_exec_until_all_locked(exec) {
>>>    		ret = drm_gpuvm_prepare_range(gpuvm, exec, addr,
>>> range,
>>>    					      vm_exec-
>>>> num_fences);
>>> -		drm_exec_retry_on_contention(exec);
>>> +		ret = drm_exec_retry_on_contention(exec, ret);
>>>    		if (ret)
>>>    			goto err;
>>>    	}
>>> diff --git a/drivers/gpu/drm/imagination/pvr_job.c
>>> b/drivers/gpu/drm/imagination/pvr_job.c
>>> index 78c2f3c6dce0..6e0ce6c4576c 100644
>>> --- a/drivers/gpu/drm/imagination/pvr_job.c
>>> +++ b/drivers/gpu/drm/imagination/pvr_job.c
>>> @@ -574,7 +574,7 @@ prepare_job_resvs_for_each(struct drm_exec
>>> *exec, struct pvr_job_data *job_data,
>>>    	drm_exec_until_all_locked(exec) {
>>>    		int err = jobs_lock_all_objs(exec, job_data,
>>> job_count);
>>>    
>>> -		drm_exec_retry_on_contention(exec);
>>> +		err = drm_exec_retry_on_contention(exec, err);
>>>    		if (err)
>>>    			return err;
>>>    	}
>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
>>> b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> index fba78193127d..01992b43ea4b 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> @@ -259,7 +259,7 @@ static int submit_lock_objects(struct
>>> msm_gem_submit *submit)
>>>    		for (unsigned i = 0; i < submit->nr_bos; i++) {
>>>    			struct drm_gem_object *obj = submit-
>>>> bos[i].obj;
>>>    			ret = drm_exec_prepare_obj(&submit->exec,
>>> obj, 1);
>>> -			drm_exec_retry_on_contention(&submit-
>>>> exec);
>>> +			ret =
>>> drm_exec_retry_on_contention(&submit->exec, ret);
>>>    			if (ret)
>>>    				goto error;
>>>    		}
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> index ee02cd833c5e..0c871634fdfb 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> @@ -1350,7 +1350,7 @@ nouveau_uvmm_bind_job_submit(struct
>>> nouveau_job *job,
>>>    	drm_exec_init(exec, vme->flags, 0);
>>>    	drm_exec_until_all_locked(exec) {
>>>    		ret = bind_lock_validate(job, exec, vme-
>>>> num_fences);
>>> -		drm_exec_retry_on_contention(exec);
>>> +		ret = drm_exec_retry_on_contention(exec, ret);
>>>    		if (ret) {
>>>    			op = list_last_op(&bind_job->ops);
>>>    			goto unwind;
>>> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c
>>> b/drivers/gpu/drm/tests/drm_exec_test.c
>>> index 81f928a429ba..28558fdb08df 100644
>>> --- a/drivers/gpu/drm/tests/drm_exec_test.c
>>> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
>>> @@ -63,7 +63,7 @@ static void test_lock(struct kunit *test)
>>>    	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		ret = drm_exec_lock_obj(&exec, &gobj);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		ret = drm_exec_retry_on_contention(&exec, ret);
>>>    		KUNIT_EXPECT_EQ(test, ret, 0);
>>>    		if (ret)
>>>    			break;
>>> @@ -83,14 +83,14 @@ static void test_lock_unlock(struct kunit
>>> *test)
>>>    	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		ret = drm_exec_lock_obj(&exec, &gobj);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		ret = drm_exec_retry_on_contention(&exec, ret);
>>>    		KUNIT_EXPECT_EQ(test, ret, 0);
>>>    		if (ret)
>>>    			break;
>>>    
>>>    		drm_exec_unlock_obj(&exec, &gobj);
>>>    		ret = drm_exec_lock_obj(&exec, &gobj);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		ret = drm_exec_retry_on_contention(&exec, ret);
>>>    		KUNIT_EXPECT_EQ(test, ret, 0);
>>>    		if (ret)
>>>    			break;
>>> @@ -110,13 +110,13 @@ static void test_duplicates(struct kunit
>>> *test)
>>>    	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		ret = drm_exec_lock_obj(&exec, &gobj);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		ret = drm_exec_retry_on_contention(&exec, ret);
>>>    		KUNIT_EXPECT_EQ(test, ret, 0);
>>>    		if (ret)
>>>    			break;
>>>    
>>>    		ret = drm_exec_lock_obj(&exec, &gobj);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		ret = drm_exec_retry_on_contention(&exec, ret);
>>>    		KUNIT_EXPECT_EQ(test, ret, 0);
>>>    		if (ret)
>>>    			break;
>>> @@ -137,7 +137,7 @@ static void test_prepare(struct kunit *test)
>>>    	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		ret = drm_exec_retry_on_contention(&exec, ret);
>>>    		KUNIT_EXPECT_EQ(test, ret, 0);
>>>    		if (ret)
>>>    			break;
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> index 040dd142c49c..20ec1ab1b52d 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> @@ -200,7 +200,7 @@ static int handle_pagefault(struct xe_gt *gt,
>>> struct pagefault *pf)
>>>    	drm_exec_init(&exec, 0, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		ret = xe_pf_begin(&exec, vma, atomic, tile->id);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		ret = drm_exec_retry_on_contention(&exec, ret);
>>>    		if (ret)
>>>    			goto unlock_dma_resv;
>>>    
>>> @@ -543,7 +543,7 @@ static int handle_acc(struct xe_gt *gt, struct
>>> acc *acc)
>>>    	drm_exec_init(&exec, 0, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		ret = xe_pf_begin(&exec, vma, true, tile->id);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		ret = drm_exec_retry_on_contention(&exec, ret);
>>>    		if (ret)
>>>    			break;
>>>    	}
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c
>>> b/drivers/gpu/drm/xe/xe_vm.c
>>> index e2ec148c9c33..335524e803e7 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -501,7 +501,7 @@ static void preempt_rebind_work_func(struct
>>> work_struct *w)
>>>    		bool done = false;
>>>    
>>>    		err = xe_preempt_work_begin(&exec, vm, &done);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		err = drm_exec_retry_on_contention(&exec, err);
>>>    		if (err || done) {
>>>    			drm_exec_fini(&exec);
>>>    			if (err &&
>>> xe_vm_validate_should_retry(&exec, err, &end))
>>> @@ -1052,7 +1052,7 @@ static void xe_vma_destroy_unlocked(struct
>>> xe_vma *vma)
>>>    	drm_exec_init(&exec, 0, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		err = xe_vm_lock_vma(&exec, vma);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		err = drm_exec_retry_on_contention(&exec, err);
>>>    		if (XE_WARN_ON(err))
>>>    			break;
>>>    	}
>>> @@ -2148,11 +2148,11 @@ static struct xe_vma *new_vma(struct xe_vm
>>> *vm, struct drm_gpuva_op_map *op,
>>>    			err = 0;
>>>    			if (!bo->vm) {
>>>    				err = drm_exec_lock_obj(&exec,
>>> xe_vm_obj(vm));
>>> -
>>> 				drm_exec_retry_on_contention(&exec);
>>> +				err =
>>> drm_exec_retry_on_contention(&exec, err);
>>>    			}
>>>    			if (!err) {
>>>    				err = drm_exec_lock_obj(&exec,
>>> &bo->ttm.base);
>>> -
>>> 				drm_exec_retry_on_contention(&exec);
>>> +				err =
>>> drm_exec_retry_on_contention(&exec, err);
>>>    			}
>>>    			if (err) {
>>>    				drm_exec_fini(&exec);
>>> @@ -2884,7 +2884,7 @@ static int vm_bind_ioctl_ops_execute(struct
>>> xe_vm *vm,
>>>    		      DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>    	drm_exec_until_all_locked(&exec) {
>>>    		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm,
>>> vops);
>>> -		drm_exec_retry_on_contention(&exec);
>>> +		err = drm_exec_retry_on_contention(&exec, err);
>>>    		if (err)
>>>    			goto unlock;
>>>    
>>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>>> index aa786b828a0a..fafb40d96e38 100644
>>> --- a/include/drm/drm_exec.h
>>> +++ b/include/drm/drm_exec.h
>>> @@ -51,6 +51,8 @@ struct drm_exec {
>>>    	struct drm_gem_object *prelocked;
>>>    };
>>>    
>>> +int drm_exec_handle_contended(struct drm_exec *exec);
>>> +
>>>    /**
>>>     * drm_exec_obj() - Return the object for a give drm_exec index
>>>     * @exec: Pointer to the drm_exec context
>>> @@ -113,15 +115,26 @@ __PASTE(__drm_exec_,
>>> __LINE__):						\
>>>    /**
>>>     * drm_exec_retry_on_contention - restart the loop to grap all
>>> locks
>>>     * @exec: drm_exec object
>>> + * @_ret: The current error status
>>>     *
>>>     * Control flow helper to continue when a contention was detected
>>> and we need to
>>>     * clean up and re-start the loop to prepare all GEM objects.
>>> + *
>>> + * Return: If no loop restart occurred: The error status.
>>>     */
>>> -#define drm_exec_retry_on_contention(exec)			\
>>> -	do {							\
>>> -		if (unlikely(drm_exec_is_contended(exec)))	\
>>> -			goto *__drm_exec_retry_ptr;		\
>>> -	} while (0)
>>> +#define drm_exec_retry_on_contention(exec,
>>> _ret)			\
>>> +	({							
>>> 	\
>>> +		struct drm_exec *__exec =
>>> (exec);			\
>>> +		int __ret =
>>> (_ret);					\
>>> +								
>>> 	\
>>> +		if (unlikely(drm_exec_is_contended(__exec)))
>>> {		\
>>> +			WARN_ON(__ret != -
>>> EDEADLK);			\
>>> +			__ret =
>>> drm_exec_handle_contended(__exec);	\
>>> +			if
>>> (!__ret)					\
>>> +				goto
>>> *__drm_exec_retry_ptr;		\
>>> +		}						
>>> 	\
>>> +		__ret;						
>>> 	\
>>> +	})
>>>    
>>>    /**
>>>     * drm_exec_is_contended - check for contention

--------------IE0O8de0FxZKqjMitUAptQ1Y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 22.05.24 um 16:32 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 2024-05-22 at 07:52 +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 21.05.24 um 09:16 schrieb Thomas Hellström:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">If contention and backoff occurs during a drm_exec ww transaction,
the contended lock is not locked again until the next orinary
attempt to lock a dma_resv lock. However, with the introduction of
drm_exec_trylock(), that doesn't work, since the locking of the
contended lock needs to be a sleeping lock. Neither can we ignore
locking the contended lock during a trylock since that would
violate
at least the ww_mutex annotations.

So resolve this by actually locking the contended lock during
drm_exec_retry_on_contention(). However, this introduces a new
point
of failure since locking the contended lock may return -EINTR.

Hence drm_exec_retry_on_contention() must take an error parameter
and
also return a value indicating success.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
After thinking more about that I have to pretty clearly NAK this.
                                  
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I thought we were beyond upfront NAKing in the first reply :/</pre>
    </blockquote>
    <br>
    Well my memory could fail me, but I mentioned concerns on this
    approach before.<br>
    <br>
    I was a bit annoyed seeing that again. But could as well be that my
    response never got out or that I'm mixing things up.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">It's an intentional design decision to guarantee that at the start of
the loop no object is locked.

This is because Sima and I wanted to integrate userptr handling into 
drm_exec as well in the long term.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
First I agree the interface looks worse with this patch.
But I thought generic userptr handling were going to end up as a gpuvm
helper (without using GEM objects) as we've discussed previously.</pre>
    </blockquote>
    <br>
    We might be talking past each other. That sounds like SVM, e.g. on
    demand paging.<br>
    <br>
    What I mean is pre-faulting during command submission like radeon,
    amdgpu and i915 do for the userptr handling.<br>
    <br>
    For that you need to re-start the whole handling similar to how you
    need to re-start for the mutex locking when you detect that the page
    array is stale, the difference is that you are not allowed to hold
    any resv locks while pre-faulting.<br>
    <br>
    That's why it is a requirement that the drm_exec loop starts without
    any locks held.<br>
    <br>
    <blockquote type="cite" cite="mid:3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Anyway if still there would be helpers in drm_exec for some other
generic userptr solution, those need to be done before the
ww_acquire_ctx_init(). The contended locking here is done after, so I
can't really see how these would clash.</pre>
    </blockquote>
    <br>
    Yes, that indeed was a problem. The ww_acquire_ctx_init() was
    intentionally moved into drm_exec_cleanup() to partially prevent
    that issue.<br>
    <br>
    I haven't fully figured out how to do handle everything exactly, but
    at least in principle it can be made work. With this change here it
    becomes impossible.<br>
    <br>
    <blockquote type="cite" cite="mid:3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Still, If we need to come up with another solution, I think it's fair
we clearly sort out why.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I think we should just document that drm_exec_trylock() can't be used
to 
lock the first BO in the loop and explicitly WARN if that's the case.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Unfortunately that's not sufficient for the general use-case. If we
want to keep the ttm_bo_vm approach of dropping the mmap lock when
there is contention on the bo resv, we need to be able to trylock on
first lock.</pre>
    </blockquote>
    <br>
    Mhm, why exactly do we still have that dance in the first place?<br>
    <br>
    I mean we have sorted out the mmap() and dma_resv() locking order
    long ago. See dma_resv_lockdep() which is enforcing that.<br>
    <br>
    <blockquote type="cite" cite="mid:3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap=""> Also bo creation is using trylock but might be able to use
a sleeping lock there. But if that sleeping lock triggers an -EDEADLK
(DEBUG_WW_MUTEX_SLOWPATH) we have the weird situation of referencing an
object that never was fully created as a contending object.</pre>
    </blockquote>
    <br>
    I wanted to eliminate that as well by not validating the BO during
    initialization any more.<br>
    <br>
    So bo creation would then be:<br>
    <br>
    ttm_bo_init(bo)<br>
    <br>
    drm_exec_while_not_all_locked() {<br>
    &nbsp;&nbsp;&nbsp; drm_exec_prepare_object(bo, 1);<br>
    <br>
    &nbsp;&nbsp;&nbsp; ttm_bo_validate(bo);<br>
    }<br>
    <br>
    if (r)<br>
    &nbsp;&nbsp;&nbsp; ttm_bo_put(bo);<br>
    <br>
    return r;<br>
    <br>
    I have that on a branch here somewhere prepared, but never got the
    time to clean it up.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

So the only really working alternative solution I can see is that
drm_exec_trylock simply fails if there is a contended lock and we'd
need to live with the weird bo creation situation described above.

/Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Somalapuram Amaranath <a class="moz-txt-link-rfc2396E" href="mailto:Amaranath.Somalapuram@amd.com">&lt;Amaranath.Somalapuram@amd.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>
Signed-off-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
---
&nbsp; .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c&nbsp; | 16 ++++-----
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 6 ++--
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +--
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++---
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++---
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +--
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c&nbsp; |&nbsp; 8 ++---
&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_svm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp; drivers/gpu/drm/drm_exec.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 35
++++++++++++++-----
&nbsp; drivers/gpu/drm/drm_gpuvm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++---
&nbsp; drivers/gpu/drm/imagination/pvr_job.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp; drivers/gpu/drm/msm/msm_gem_submit.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp; drivers/gpu/drm/nouveau/nouveau_uvmm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp; drivers/gpu/drm/tests/drm_exec_test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 12 +++----
&nbsp; drivers/gpu/drm/xe/xe_gt_pagefault.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +--
&nbsp; drivers/gpu/drm/xe/xe_vm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 10 +++---
&nbsp; include/drm/drm_exec.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 23 +++++++++---
&nbsp; 17 files changed, 92 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index e4d4e55c08ad..4a08a692aa1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1152,12 +1152,12 @@ static int reserve_bo_and_vm(struct kgd_mem
*mem,
&nbsp;&nbsp;	drm_exec_init(&amp;ctx-&gt;exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;ctx-&gt;exec) {
&nbsp;&nbsp;		ret = amdgpu_vm_lock_pd(vm, &amp;ctx-&gt;exec, 2);
-		drm_exec_retry_on_contention(&amp;ctx-&gt;exec);
+		ret = drm_exec_retry_on_contention(&amp;ctx-&gt;exec,
ret);
&nbsp;&nbsp;		if (unlikely(ret))
&nbsp;&nbsp;			goto error;
&nbsp; 
&nbsp;&nbsp;		ret = drm_exec_prepare_obj(&amp;ctx-&gt;exec, &amp;bo-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">tbo.base, 1);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;ctx-&gt;exec);
+		ret = drm_exec_retry_on_contention(&amp;ctx-&gt;exec,
ret);
&nbsp;&nbsp;		if (unlikely(ret))
&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;	}
@@ -1199,14 +1199,14 @@ static int reserve_bo_and_cond_vms(struct
kgd_mem *mem,
&nbsp; 
&nbsp;&nbsp;			ret = amdgpu_vm_lock_pd(entry-&gt;bo_va-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">base.vm,
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;						&amp;ctx-&gt;exec, 2);
-			drm_exec_retry_on_contention(&amp;ctx-&gt;exec);
+			ret = drm_exec_retry_on_contention(&amp;ctx-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">exec, ret);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;			if (unlikely(ret))
&nbsp;&nbsp;				goto error;
&nbsp;&nbsp;			++ctx-&gt;n_vms;
&nbsp;&nbsp;		}
&nbsp; 
&nbsp;&nbsp;		ret = drm_exec_prepare_obj(&amp;ctx-&gt;exec, &amp;bo-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">tbo.base, 1);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;ctx-&gt;exec);
+		ret = drm_exec_retry_on_contention(&amp;ctx-&gt;exec,
ret);
&nbsp;&nbsp;		if (unlikely(ret))
&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;	}
@@ -2619,7 +2619,7 @@ static int validate_invalid_user_pages(struct
amdkfd_process_info *process_info)
&nbsp;&nbsp;		list_for_each_entry(peer_vm, &amp;process_info-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">vm_list_head,
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;				&nbsp;&nbsp;&nbsp; vm_list_node) {
&nbsp;&nbsp;			ret = amdgpu_vm_lock_pd(peer_vm, &amp;exec,
2);
-			drm_exec_retry_on_contention(&amp;exec);
+			ret = drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;			if (unlikely(ret))
&nbsp;&nbsp;				goto unreserve_out;
&nbsp;&nbsp;		}
@@ -2631,7 +2631,7 @@ static int validate_invalid_user_pages(struct
amdkfd_process_info *process_info)
&nbsp; 
&nbsp;&nbsp;			gobj = &amp;mem-&gt;bo-&gt;tbo.base;
&nbsp;&nbsp;			ret = drm_exec_prepare_obj(&amp;exec, gobj,
1);
-			drm_exec_retry_on_contention(&amp;exec);
+			ret = drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;			if (unlikely(ret))
&nbsp;&nbsp;				goto unreserve_out;
&nbsp;&nbsp;		}
@@ -2875,7 +2875,7 @@ int
amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct
dma_fence __rcu *
&nbsp;&nbsp;		list_for_each_entry(peer_vm, &amp;process_info-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">vm_list_head,
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;				&nbsp;&nbsp;&nbsp; vm_list_node) {
&nbsp;&nbsp;			ret = amdgpu_vm_lock_pd(peer_vm, &amp;exec,
2);
-			drm_exec_retry_on_contention(&amp;exec);
+			ret = drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;			if (unlikely(ret)) {
&nbsp;&nbsp;				pr_err(&quot;Locking VM PD failed, ret:
%d\n&quot;, ret);
&nbsp;&nbsp;				goto ttm_reserve_fail;
@@ -2891,7 +2891,7 @@ int
amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct
dma_fence __rcu *
&nbsp; 
&nbsp;&nbsp;			gobj = &amp;mem-&gt;bo-&gt;tbo.base;
&nbsp;&nbsp;			ret = drm_exec_prepare_obj(&amp;exec, gobj,
1);
-			drm_exec_retry_on_contention(&amp;exec);
+			ret = drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;			if (unlikely(ret)) {
&nbsp;&nbsp;				pr_err(&quot;drm_exec_prepare_obj
failed, ret: %d\n&quot;, ret);
&nbsp;&nbsp;				goto ttm_reserve_fail;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ec888fc6ead8..299e46a6d934 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -897,7 +897,7 @@ static int amdgpu_cs_parser_bos(struct
amdgpu_cs_parser *p,
&nbsp; 
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;p-&gt;exec) {
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(&amp;fpriv-&gt;vm, &amp;p-&gt;exec, 1 + p-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">gang_size);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;p-&gt;exec);
+		r = drm_exec_retry_on_contention(&amp;p-&gt;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto out_free_user_pages;
&nbsp; 
@@ -905,7 +905,7 @@ static int amdgpu_cs_parser_bos(struct
amdgpu_cs_parser *p,
&nbsp;&nbsp;			/* One fence for TTM and one for each CS
job */
&nbsp;&nbsp;			r = drm_exec_prepare_obj(&amp;p-&gt;exec, &amp;e-&gt;bo-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">tbo.base,
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;						 1 + p-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">gang_size);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-			drm_exec_retry_on_contention(&amp;p-&gt;exec);
+			r = drm_exec_retry_on_contention(&amp;p-&gt;exec,
r);
&nbsp;&nbsp;			if (unlikely(r))
&nbsp;&nbsp;				goto out_free_user_pages;
&nbsp; 
@@ -915,7 +915,7 @@ static int amdgpu_cs_parser_bos(struct
amdgpu_cs_parser *p,
&nbsp;&nbsp;		if (p-&gt;uf_bo) {
&nbsp;&nbsp;			r = drm_exec_prepare_obj(&amp;p-&gt;exec, &amp;p-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">uf_bo-&gt;tbo.base,
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;						 1 + p-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">gang_size);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-			drm_exec_retry_on_contention(&amp;p-&gt;exec);
+			r = drm_exec_retry_on_contention(&amp;p-&gt;exec,
r);
&nbsp;&nbsp;			if (unlikely(r))
&nbsp;&nbsp;				goto out_free_user_pages;
&nbsp;&nbsp;		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index cfdf558b48b6..8b2b86c7a6c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct amdgpu_device
*adev, struct amdgpu_vm *vm,
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
&nbsp;&nbsp;		if (likely(!r))
&nbsp;&nbsp;			r = drm_exec_lock_obj(&amp;exec, &amp;bo-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r)) {
&nbsp;&nbsp;			DRM_ERROR(&quot;failed to reserve CSA,PD BOs:
err=%d\n&quot;, r);
&nbsp;&nbsp;			goto error;
@@ -114,7 +114,7 @@ int amdgpu_unmap_static_csa(struct
amdgpu_device *adev, struct amdgpu_vm *vm,
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
&nbsp;&nbsp;		if (likely(!r))
&nbsp;&nbsp;			r = drm_exec_lock_obj(&amp;exec, &amp;bo-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r)) {
&nbsp;&nbsp;			DRM_ERROR(&quot;failed to reserve CSA,PD BOs:
err=%d\n&quot;, r);
&nbsp;&nbsp;			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 67c234bcf89f..17e16c971e21 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -239,12 +239,12 @@ static void amdgpu_gem_object_close(struct
drm_gem_object *obj,
&nbsp;&nbsp;	drm_exec_init(&amp;exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		r = drm_exec_prepare_obj(&amp;exec, &amp;bo-&gt;tbo.base, 1);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto out_unlock;
&nbsp; 
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto out_unlock;
&nbsp;&nbsp;	}
@@ -776,13 +776,13 @@ int amdgpu_gem_va_ioctl(struct drm_device
*dev, void *data,
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		if (gobj) {
&nbsp;&nbsp;			r = drm_exec_lock_obj(&amp;exec, gobj);
-			drm_exec_retry_on_contention(&amp;exec);
+			r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;			if (unlikely(r))
&nbsp;&nbsp;				goto error;
&nbsp;&nbsp;		}
&nbsp; 
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(&amp;fpriv-&gt;vm, &amp;exec, 2);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 5ca5c47ab54e..1b1a5147606e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1221,12 +1221,12 @@ int amdgpu_mes_ctx_map_meta_data(struct
amdgpu_device *adev,
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		r = drm_exec_lock_obj(&amp;exec,
&nbsp;&nbsp;				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ctx_data-&gt;meta_data_obj-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto error_fini_exec;
&nbsp; 
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto error_fini_exec;
&nbsp;&nbsp;	}
@@ -1292,12 +1292,12 @@ int amdgpu_mes_ctx_unmap_meta_data(struct
amdgpu_device *adev,
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		r = drm_exec_lock_obj(&amp;exec,
&nbsp;&nbsp;				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ctx_data-&gt;meta_data_obj-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto out_unlock;
&nbsp; 
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto out_unlock;
&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
index e22cb2b5cd92..72b8213e352c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
@@ -77,7 +77,7 @@ int amdgpu_seq64_map(struct amdgpu_device *adev,
struct amdgpu_vm *vm,
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
&nbsp;&nbsp;		if (likely(!r))
&nbsp;&nbsp;			r = drm_exec_lock_obj(&amp;exec, &amp;bo-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;	}
@@ -138,7 +138,7 @@ void amdgpu_seq64_unmap(struct amdgpu_device
*adev, struct amdgpu_fpriv *fpriv)
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
&nbsp;&nbsp;		if (likely(!r))
&nbsp;&nbsp;			r = drm_exec_lock_obj(&amp;exec, &amp;bo-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index e01c1c8e64c4..63392ce43945 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -89,12 +89,12 @@ static int map_ring_data(struct amdgpu_device
*adev, struct amdgpu_vm *vm,
&nbsp;&nbsp;	drm_exec_init(&amp;exec, 0, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		r = drm_exec_lock_obj(&amp;exec, &amp;bo-&gt;tbo.base);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto error_fini_exec;
&nbsp; 
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto error_fini_exec;
&nbsp;&nbsp;	}
@@ -152,12 +152,12 @@ static int unmap_ring_data(struct
amdgpu_device *adev, struct amdgpu_vm *vm,
&nbsp;&nbsp;	drm_exec_init(&amp;exec, 0, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		r = drm_exec_lock_obj(&amp;exec, &amp;bo-&gt;tbo.base);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto out_unlock;
&nbsp; 
&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec, r);
&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;			goto out_unlock;
&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 386875e6eb96..a3aa7fd22f6a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1499,7 +1499,7 @@ static int svm_range_reserve_bos(struct
svm_validate_context *ctx, bool intr)
&nbsp;&nbsp;			vm = drm_priv_to_vm(pdd-&gt;drm_priv);
&nbsp; 
&nbsp;&nbsp;			r = amdgpu_vm_lock_pd(vm, &amp;ctx-&gt;exec, 2);
-			drm_exec_retry_on_contention(&amp;ctx-&gt;exec);
+			r = drm_exec_retry_on_contention(&amp;ctx-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">exec, r);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;			if (unlikely(r)) {
&nbsp;&nbsp;				pr_debug(&quot;failed %d to reserve
bo\n&quot;, r);
&nbsp;&nbsp;				goto unreserve_out;
diff --git a/drivers/gpu/drm/drm_exec.c
b/drivers/gpu/drm/drm_exec.c
index 2da094bdf8a4..3770a5d30213 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -28,12 +28,12 @@
&nbsp;&nbsp; *	drm_exec_init(&amp;exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
&nbsp;&nbsp; *	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp; *		ret = drm_exec_prepare_obj(&amp;exec, boA, 1);
- *		drm_exec_retry_on_contention(&amp;exec);
+ *		ret = drm_exec_retry_on_contention(&amp;exec, ret);
&nbsp;&nbsp; *		if (ret)
&nbsp;&nbsp; *			goto error;
&nbsp;&nbsp; *
&nbsp;&nbsp; *		ret = drm_exec_prepare_obj(&amp;exec, boB, 1);
- *		drm_exec_retry_on_contention(&amp;exec);
+ *		ret = drm_exec_retry_on_contention(&amp;exec, ret);
&nbsp;&nbsp; *		if (ret)
&nbsp;&nbsp; *			goto error;
&nbsp;&nbsp; *	}
@@ -48,7 +48,8 @@
&nbsp;&nbsp; */
&nbsp; 
&nbsp; /* Dummy value used to initially enter the retry loop */
-#define DRM_EXEC_DUMMY ((void *)~0)
+#define DRM_EXEC_DUMMY ERR_PTR(-ESTALE)
+#define DRM_EXEC_CONTENDED ERR_PTR(-EDEADLK)
&nbsp; 
&nbsp; /* Unlock all objects and drop references */
&nbsp; static void drm_exec_unlock_all(struct drm_exec *exec)
@@ -131,8 +132,7 @@ bool drm_exec_cleanup(struct drm_exec *exec)
&nbsp;&nbsp;		return true;
&nbsp;&nbsp;	}
&nbsp; 
-	drm_exec_unlock_all(exec);
-	exec-&gt;num_objects = 0;
+	exec-&gt;contended = NULL;
&nbsp;&nbsp;	return true;
&nbsp; }
&nbsp; EXPORT_SYMBOL(drm_exec_cleanup);
@@ -194,6 +194,27 @@ static int drm_exec_lock_contended(struct
drm_exec *exec)
&nbsp;&nbsp;	return ret;
&nbsp; }
&nbsp; 
+/**
+ * drm_exec_handle_contended() - Perform cleanup before a ww
transaction restart
+ * @exec: Pointer to the drm_exec object.
+ *
+ * Unlocks all held resvs and re-locks the contended object.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_exec_handle_contended(struct drm_exec *exec)
+{
+	int ret;
+
+	drm_exec_unlock_all(exec);
+	exec-&gt;num_objects = 0;
+	ret = drm_exec_lock_contended(exec);
+	exec-&gt;contended = DRM_EXEC_CONTENDED;
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_handle_contended);
+
&nbsp; /**
&nbsp;&nbsp; * drm_exec_lock_obj - lock a GEM object for use
&nbsp;&nbsp; * @exec: the drm_exec object with the state
@@ -209,10 +230,6 @@ int drm_exec_lock_obj(struct drm_exec *exec,
struct drm_gem_object *obj)
&nbsp; {
&nbsp;&nbsp;	int ret;
&nbsp; 
-	ret = drm_exec_lock_contended(exec);
-	if (unlikely(ret))
-		return ret;
-
&nbsp;&nbsp;	if (exec-&gt;prelocked == obj) {
&nbsp;&nbsp;		drm_gem_object_put(exec-&gt;prelocked);
&nbsp;&nbsp;		exec-&gt;prelocked = NULL;
diff --git a/drivers/gpu/drm/drm_gpuvm.c
b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0923d6ae18e2 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1254,18 +1254,18 @@ drm_gpuvm_exec_lock(struct drm_gpuvm_exec
*vm_exec)
&nbsp; 
&nbsp;&nbsp;	drm_exec_until_all_locked(exec) {
&nbsp;&nbsp;		ret = drm_gpuvm_prepare_vm(gpuvm, exec,
num_fences);
-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec, ret);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			goto err;
&nbsp; 
&nbsp;&nbsp;		ret = drm_gpuvm_prepare_objects(gpuvm, exec,
num_fences);
-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec, ret);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			goto err;
&nbsp; 
&nbsp;&nbsp;		if (vm_exec-&gt;extra.fn) {
&nbsp;&nbsp;			ret = vm_exec-&gt;extra.fn(vm_exec);
-			drm_exec_retry_on_contention(exec);
+			ret = drm_exec_retry_on_contention(exec,
ret);
&nbsp;&nbsp;			if (ret)
&nbsp;&nbsp;				goto err;
&nbsp;&nbsp;		}
@@ -1346,7 +1346,7 @@ drm_gpuvm_exec_lock_range(struct
drm_gpuvm_exec *vm_exec,
&nbsp;&nbsp;	drm_exec_until_all_locked(exec) {
&nbsp;&nbsp;		ret = drm_gpuvm_prepare_range(gpuvm, exec, addr,
range,
&nbsp;&nbsp;					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm_exec-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">num_fences);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec, ret);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			goto err;
&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/imagination/pvr_job.c
b/drivers/gpu/drm/imagination/pvr_job.c
index 78c2f3c6dce0..6e0ce6c4576c 100644
--- a/drivers/gpu/drm/imagination/pvr_job.c
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -574,7 +574,7 @@ prepare_job_resvs_for_each(struct drm_exec
*exec, struct pvr_job_data *job_data,
&nbsp;&nbsp;	drm_exec_until_all_locked(exec) {
&nbsp;&nbsp;		int err = jobs_lock_all_objs(exec, job_data,
job_count);
&nbsp; 
-		drm_exec_retry_on_contention(exec);
+		err = drm_exec_retry_on_contention(exec, err);
&nbsp;&nbsp;		if (err)
&nbsp;&nbsp;			return err;
&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
b/drivers/gpu/drm/msm/msm_gem_submit.c
index fba78193127d..01992b43ea4b 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -259,7 +259,7 @@ static int submit_lock_objects(struct
msm_gem_submit *submit)
&nbsp;&nbsp;		for (unsigned i = 0; i &lt; submit-&gt;nr_bos; i++) {
&nbsp;&nbsp;			struct drm_gem_object *obj = submit-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">bos[i].obj;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;			ret = drm_exec_prepare_obj(&amp;submit-&gt;exec,
obj, 1);
-			drm_exec_retry_on_contention(&amp;submit-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">exec);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+			ret =
drm_exec_retry_on_contention(&amp;submit-&gt;exec, ret);
&nbsp;&nbsp;			if (ret)
&nbsp;&nbsp;				goto error;
&nbsp;&nbsp;		}
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index ee02cd833c5e..0c871634fdfb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1350,7 +1350,7 @@ nouveau_uvmm_bind_job_submit(struct
nouveau_job *job,
&nbsp;&nbsp;	drm_exec_init(exec, vme-&gt;flags, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(exec) {
&nbsp;&nbsp;		ret = bind_lock_validate(job, exec, vme-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">num_fences);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec, ret);
&nbsp;&nbsp;		if (ret) {
&nbsp;&nbsp;			op = list_last_op(&amp;bind_job-&gt;ops);
&nbsp;&nbsp;			goto unwind;
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c
b/drivers/gpu/drm/tests/drm_exec_test.c
index 81f928a429ba..28558fdb08df 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -63,7 +63,7 @@ static void test_lock(struct kunit *test)
&nbsp;&nbsp;	drm_exec_init(&amp;exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		ret = drm_exec_lock_obj(&amp;exec, &amp;gobj);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret = drm_exec_retry_on_contention(&amp;exec, ret);
&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			break;
@@ -83,14 +83,14 @@ static void test_lock_unlock(struct kunit
*test)
&nbsp;&nbsp;	drm_exec_init(&amp;exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		ret = drm_exec_lock_obj(&amp;exec, &amp;gobj);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret = drm_exec_retry_on_contention(&amp;exec, ret);
&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			break;
&nbsp; 
&nbsp;&nbsp;		drm_exec_unlock_obj(&amp;exec, &amp;gobj);
&nbsp;&nbsp;		ret = drm_exec_lock_obj(&amp;exec, &amp;gobj);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret = drm_exec_retry_on_contention(&amp;exec, ret);
&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			break;
@@ -110,13 +110,13 @@ static void test_duplicates(struct kunit
*test)
&nbsp;&nbsp;	drm_exec_init(&amp;exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		ret = drm_exec_lock_obj(&amp;exec, &amp;gobj);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret = drm_exec_retry_on_contention(&amp;exec, ret);
&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			break;
&nbsp; 
&nbsp;&nbsp;		ret = drm_exec_lock_obj(&amp;exec, &amp;gobj);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret = drm_exec_retry_on_contention(&amp;exec, ret);
&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			break;
@@ -137,7 +137,7 @@ static void test_prepare(struct kunit *test)
&nbsp;&nbsp;	drm_exec_init(&amp;exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		ret = drm_exec_prepare_obj(&amp;exec, &amp;gobj, 1);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret = drm_exec_retry_on_contention(&amp;exec, ret);
&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			break;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 040dd142c49c..20ec1ab1b52d 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -200,7 +200,7 @@ static int handle_pagefault(struct xe_gt *gt,
struct pagefault *pf)
&nbsp;&nbsp;	drm_exec_init(&amp;exec, 0, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		ret = xe_pf_begin(&amp;exec, vma, atomic, tile-&gt;id);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret = drm_exec_retry_on_contention(&amp;exec, ret);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			goto unlock_dma_resv;
&nbsp; 
@@ -543,7 +543,7 @@ static int handle_acc(struct xe_gt *gt, struct
acc *acc)
&nbsp;&nbsp;	drm_exec_init(&amp;exec, 0, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		ret = xe_pf_begin(&amp;exec, vma, true, tile-&gt;id);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret = drm_exec_retry_on_contention(&amp;exec, ret);
&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;			break;
&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c
b/drivers/gpu/drm/xe/xe_vm.c
index e2ec148c9c33..335524e803e7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -501,7 +501,7 @@ static void preempt_rebind_work_func(struct
work_struct *w)
&nbsp;&nbsp;		bool done = false;
&nbsp; 
&nbsp;&nbsp;		err = xe_preempt_work_begin(&amp;exec, vm, &amp;done);
-		drm_exec_retry_on_contention(&amp;exec);
+		err = drm_exec_retry_on_contention(&amp;exec, err);
&nbsp;&nbsp;		if (err || done) {
&nbsp;&nbsp;			drm_exec_fini(&amp;exec);
&nbsp;&nbsp;			if (err &amp;&amp;
xe_vm_validate_should_retry(&amp;exec, err, &amp;end))
@@ -1052,7 +1052,7 @@ static void xe_vma_destroy_unlocked(struct
xe_vma *vma)
&nbsp;&nbsp;	drm_exec_init(&amp;exec, 0, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		err = xe_vm_lock_vma(&amp;exec, vma);
-		drm_exec_retry_on_contention(&amp;exec);
+		err = drm_exec_retry_on_contention(&amp;exec, err);
&nbsp;&nbsp;		if (XE_WARN_ON(err))
&nbsp;&nbsp;			break;
&nbsp;&nbsp;	}
@@ -2148,11 +2148,11 @@ static struct xe_vma *new_vma(struct xe_vm
*vm, struct drm_gpuva_op_map *op,
&nbsp;&nbsp;			err = 0;
&nbsp;&nbsp;			if (!bo-&gt;vm) {
&nbsp;&nbsp;				err = drm_exec_lock_obj(&amp;exec,
xe_vm_obj(vm));
-
				drm_exec_retry_on_contention(&amp;exec);
+				err =
drm_exec_retry_on_contention(&amp;exec, err);
&nbsp;&nbsp;			}
&nbsp;&nbsp;			if (!err) {
&nbsp;&nbsp;				err = drm_exec_lock_obj(&amp;exec,
&amp;bo-&gt;ttm.base);
-
				drm_exec_retry_on_contention(&amp;exec);
+				err =
drm_exec_retry_on_contention(&amp;exec, err);
&nbsp;&nbsp;			}
&nbsp;&nbsp;			if (err) {
&nbsp;&nbsp;				drm_exec_fini(&amp;exec);
@@ -2884,7 +2884,7 @@ static int vm_bind_ioctl_ops_execute(struct
xe_vm *vm,
&nbsp;&nbsp;		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_EXEC_IGNORE_DUPLICATES, 0);
&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;		err = vm_bind_ioctl_ops_lock_and_prep(&amp;exec, vm,
vops);
-		drm_exec_retry_on_contention(&amp;exec);
+		err = drm_exec_retry_on_contention(&amp;exec, err);
&nbsp;&nbsp;		if (err)
&nbsp;&nbsp;			goto unlock;
&nbsp; 
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index aa786b828a0a..fafb40d96e38 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -51,6 +51,8 @@ struct drm_exec {
&nbsp;&nbsp;	struct drm_gem_object *prelocked;
&nbsp; };
&nbsp; 
+int drm_exec_handle_contended(struct drm_exec *exec);
+
&nbsp; /**
&nbsp;&nbsp; * drm_exec_obj() - Return the object for a give drm_exec index
&nbsp;&nbsp; * @exec: Pointer to the drm_exec context
@@ -113,15 +115,26 @@ __PASTE(__drm_exec_,
__LINE__):						\
&nbsp; /**
&nbsp;&nbsp; * drm_exec_retry_on_contention - restart the loop to grap all
locks
&nbsp;&nbsp; * @exec: drm_exec object
+ * @_ret: The current error status
&nbsp;&nbsp; *
&nbsp;&nbsp; * Control flow helper to continue when a contention was detected
and we need to
&nbsp;&nbsp; * clean up and re-start the loop to prepare all GEM objects.
+ *
+ * Return: If no loop restart occurred: The error status.
&nbsp;&nbsp; */
-#define drm_exec_retry_on_contention(exec)			\
-	do {							\
-		if (unlikely(drm_exec_is_contended(exec)))	\
-			goto *__drm_exec_retry_ptr;		\
-	} while (0)
+#define drm_exec_retry_on_contention(exec,
_ret)			\
+	({							
	\
+		struct drm_exec *__exec =
(exec);			\
+		int __ret =
(_ret);					\
+								
	\
+		if (unlikely(drm_exec_is_contended(__exec)))
{		\
+			WARN_ON(__ret != -
EDEADLK);			\
+			__ret =
drm_exec_handle_contended(__exec);	\
+			if
(!__ret)					\
+				goto
*__drm_exec_retry_ptr;		\
+		}						
	\
+		__ret;						
	\
+	})
&nbsp; 
&nbsp; /**
&nbsp;&nbsp; * drm_exec_is_contended - check for contention
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------IE0O8de0FxZKqjMitUAptQ1Y--
