Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD489AC343
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 11:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C6510E359;
	Wed, 23 Oct 2024 09:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2y/Zz/G3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E616810E0F3;
 Wed, 23 Oct 2024 09:14:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKgTw2Razk43AB9uKA33gf01gCYOovuoNIXWXgGl8yd73QENBu7s4057J49C+45uPqmZC2yXzY0IzU1Y1ClcaoPpskPExXtrh/LTmnEIQ8Ipi1c/D8PrtYUjA2GTWgY84PKNL0lNPZVkA9VwzrGTxy9SYgKcZiOndcHs6wxlK2ATiiCQa3pPX2fnVokJu1AOjxzDml//malad9pIMSjgAxVW5d2h0819xwvtQcVZkLrP9HtA+eqCTbM254xdk1RShlrv6Mgr3nEk7vwQcXSDXE7zDVOJDO1PA9rqm3Uh+Z9OXAYU6hNE+DAI4oZYclIMa+APua2lTK1cnwR9UhdllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWivCKAThtIP6T5zDfkmkric83oW+Iq9a/j0SQtg4Zw=;
 b=CgY63NmQebdGZ5Hgonc4QibkZViCzB9HwWuH/cjTdScaahX9zrxFE9O0vMGcq+eoEvPGtQ0REqCeHoQ1rRY2lEciU6VKe+8QlMsQYjmYq4EVnafzYX2BKezb2fcfPaeSzXRdub8MybV2Y3aM95STVuipfpvdst3WUkLNzqdlNtkGT9TCLxzGECAkNDfGKzvLnBPle5OkpQ/RWeSPt7A8S/7GkWlwxCA+oCnRaWLbPzwFy1NkkuHq9/UaDGq1aqUtZnWQCadFHM9pR2KHxBGa9P1eBo2Y7V/KmOQYMSRc+UOQtlTZgKopO5yoHURR4HRbhlFpVMUU/m7oeP7IQ/mobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWivCKAThtIP6T5zDfkmkric83oW+Iq9a/j0SQtg4Zw=;
 b=2y/Zz/G3CN67HBBb2xfjGn6PJjiUoTtEDRikejw2T0JM5OMO6CfD1S9KOU+pLf2c78aw8B0+uTViQKAi3liW3X8RcT0BK0T3UcNDz2jJpyOJM0VtY911IOD3kksS8jxBXzRKAG0coEUBpU7fh2T9e0n5XzCCGeQGOJoV4DaYk4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8574.namprd12.prod.outlook.com (2603:10b6:8:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 09:14:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 09:14:45 +0000
Message-ID: <47e4b79b-2c08-4ee8-b472-5482bc159856@amd.com>
Date: Wed, 23 Oct 2024 11:14:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
 <cd2b57c6-1947-4dbd-bae8-ecdb2b42de72@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cd2b57c6-1947-4dbd-bae8-ecdb2b42de72@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a50d94f-e815-4e6d-8257-08dcf34322d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHZSZUNuamJobzQyNzlENEpLRW9Ma0dFQmVkdmhoVFhBbTRsZURNL054RmFG?=
 =?utf-8?B?K2hzeDRxN09JQjRCbndBbytuZWlLeWlESnVicmI0VTQwaXdxaldkNzVRNDRS?=
 =?utf-8?B?UUNQVjhEeUZIdGhWSnR0ck42WnVMYmU1Q0ZJSWxzbHpmY3BERGV6dVBtTUZo?=
 =?utf-8?B?UGNaazRkVDIzeCt6bGFyUjF0VDBBYkU5bytOVG01YXYrV3lETG8zMGJZQUlJ?=
 =?utf-8?B?b296KzdFeTRQdHNSQTZORHhtc1U2UjN5OUJMZS9OWHVlTjVEZjVPc3lZN2dB?=
 =?utf-8?B?cktVeUF5UzdCQk9HMTcwV1BlWEpPUzhZT0I0dnRDQm1zWVdhUVdaTW1JRkUx?=
 =?utf-8?B?YTBzZWZnRjRjS2ZPSlIxendGTUhBdXIrZ1RSUzZzQUN5V2hoaXRRMksxTHB0?=
 =?utf-8?B?aGtlUVFwRElZalFIc2tWUmlMbkhQckp3VEEvd2daV0Y3QVk0OGJJTzhmbWtZ?=
 =?utf-8?B?RWRPeWplcWVydWZtaFN5ZWprU0RsRzJnbW9UUTRvK3RmYURPV3pDWDZrWUlM?=
 =?utf-8?B?MlNVa0orMC9sSUlCYUgrTjJ4eHNpNlVZY0xhcTNNZ0NXVVZyYW8zNjdLbFhi?=
 =?utf-8?B?ZXB3M1hXNVJnTG5zUzVlNmptYzlqbXVxVmtEYzc5U2t1dFUrcStFYWV6S21G?=
 =?utf-8?B?cjZyMWFxbnFMVVRuUDdIdlY5THJCbGZwUzZSaUhoVGVuTjlEMWVON21rUlBr?=
 =?utf-8?B?YjcwajJlbEVubHBxSVJ0WUZPcUU4djVyY1crdno1K1FHcU8wSFJBYlBCdlJ4?=
 =?utf-8?B?d3MzYndjUXlKL0hJeUw4SXU2MkdyNDVweUJ3NGJ4SkNBZDB0dWtKR0NUdXJq?=
 =?utf-8?B?SWZNblUzTm85d0xIWHBwQURjNUtqZWhpamlSdEptZVhyNlFyQmQ5ZHZTL3kx?=
 =?utf-8?B?WFNEY2xuRDRsQjBDWHRKSkZpWVFtNzU0cm9Fc2dCL1ljS2p3azZhd0lDdERn?=
 =?utf-8?B?ajgzRk1jQXRXL1hjTkZPU09ISm9mbmQ2Wi9QbnVqT09ncS9nSTBWZHlGYk1R?=
 =?utf-8?B?R0F4eFl4MHZjbEVPUkNtQ1RkdkZPc1NMVXBQb1MzWGlGNVpIb2FvWk80U25Y?=
 =?utf-8?B?ai9tY2RiSnZEWkV0eUJtQjF6ZzZ4STBUTUM2VldKa2tacmxIMSt1ZDlCN1J3?=
 =?utf-8?B?RVRmTld4RkZncXBwZDVyaG53Q3ZUOWZIOFg5cVdreDA0Y2dUbmJPcEhCcVh1?=
 =?utf-8?B?QjA2SWQrK0ViN1NPVUNrQ0g2bXgvR3RXNEdIMkNtRDI4R0drK2hESUViSXBN?=
 =?utf-8?B?MXAwQjZleVRKYlZOTlhESGZrdkJLLzlTL1REWklPNC9VdE5CRFE5Um4zRkpz?=
 =?utf-8?B?L3hZN1ZibFA4VlhKT3RwTXEvSE13REVySm1TS3ZWNC9OOER1OXBHNTNmYkJw?=
 =?utf-8?B?aDNxU1l5cWJOTVV2UDhQUG9oejVDZTBVOThvcjJGaERINGxSMHZOeDljWVlW?=
 =?utf-8?B?NE16N0ZBMy90bUdSNDVIQlpKa1NSQmpJVHZudnNuMEhZWU8wekFGZVNxOXRj?=
 =?utf-8?B?ZGx6NHJkSTh0Vitqb0hMU0pLSnMrWnR3R0Vsb0VEd2Q5cnd6TnZvWmpORnZu?=
 =?utf-8?B?L1JrbmtKdENiK1JsY2xDTXhDU0pYUVdCeWI0ZXpCSU9QRnhNT2FvTzdIdkNS?=
 =?utf-8?B?dkRRTk5wN25Xa1RSZ3ErSzFKVVdEYVB0OGpxRlg2V09hU0pIUit1OVFpemNu?=
 =?utf-8?B?QWVnUkRyVkNoQ3BsUW1VM0hDU1dranZhYlNoblptbHV3QVVIcFJDOVZVS2dI?=
 =?utf-8?Q?tAauTq6ZSSa7jA6L6XS44h8sVqg3WIl2p/fDTsS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDI3M2lFNzZrUHd6ZFBtYmluMkVUV2RHZXpyWDNRRHNQOHQ5RGpIaUtJY3V4?=
 =?utf-8?B?ck41cnhUTkdqM0VmaGZHelRxSGJ6dGRrSTRrZk9jbEZGcHdSdy9XUWdCQTZO?=
 =?utf-8?B?TDg2R2UxdCt0RmFncUwvOUF0RkE1bWJWRmJ6S2w5aXp4SlJleXhsSXlna250?=
 =?utf-8?B?RkVZaHNoNWhrVnlsaC9qVnJKUm1kSDZWSk13TnRHQXhDVEJHdHpKS3BsOFBr?=
 =?utf-8?B?YUw4bVA5eVF6ZFB4WGt6RlpKR25WRFo0bkRlM2tqSU1oWWNYTjdnOFAvMkl5?=
 =?utf-8?B?RlZqcFNubE9IRHZmdWF2aDlTb2VtZmhuUnBXRERBRTVpRk81cCtTNFFDMXpE?=
 =?utf-8?B?dm5PbEZSZE9PRjRESWM4eEMzTnNyRnIwaytmNEt6VFdEeWhHN0dMTEViZ01y?=
 =?utf-8?B?eklDQTMxYk0zMTl1TVV3Tk94L25jeHNnQW5pUjNGME1kV0pIc0lyQnVFVG1p?=
 =?utf-8?B?RjMzMHJsdWRBb3ZrQmh1VVdJTUp5SU53T2RvWmpjMEhDSFZNYWxBV0h1OWVU?=
 =?utf-8?B?Qi9ZZjR6YUhnL0xlbUNKak9RWWZSSTl3ZG84akVhbGQxamo3VS9rVGZEZURI?=
 =?utf-8?B?WFRxQ0hlZXdSYkZ2TVRTZFl0ci9sclU0SVI5R2c5YkNyeEZGUXdCby8zSE9u?=
 =?utf-8?B?bkNET0xyaXgrTWwvQU1HVnIyczBBVVZiWlFRMHhZcGtnM0FMOHZKYmN4N1pQ?=
 =?utf-8?B?cjJqRXQ5emtBWi96V2ZjZXdyZ0FTOEo3bGlNMzhDNERYWUZ6Y01rclhMZW1K?=
 =?utf-8?B?d1ZPUGVHeW1ZS3BXZkg4cjJYTk5BSU9BVXJPc3QrTnBMeE1pWTJheGd0dVpC?=
 =?utf-8?B?dmhXVTVNYVZ0OGhzNVFzamt0cVVoUlN2bHBsZko5MmU3YjVFZHZJc2V5aDVS?=
 =?utf-8?B?NXJaREJZVkxnNm1ocTZTdzdxdW5jRU8rYi9DNHEzYTBEOXFMNUhNaGRDR3d2?=
 =?utf-8?B?S3VhUndRcEhkNWg0aFQ0UG5FeGY5OUhtOXJSeWVOYmhyZUUvS3lmSUFiQmtX?=
 =?utf-8?B?b1RQbElsRmx5TDhMUEJlSFJuR0l1YzN1NERaSERWdDVQMHR2R1NUUElXcFZa?=
 =?utf-8?B?ZHlwLzFaUmVTcHR4Um41Ui9OK3hhRkxyODJsNUg2T2QwSDZ1VUw0RnM0S25u?=
 =?utf-8?B?cmpydkRsakxndlhvc0c0M2xjUzZ5Z3BLcDAxWmxGdmY2OHkvSC9BbmI3bTkr?=
 =?utf-8?B?SmNSb05zVFlUYWJYemp3YmVxTkpDVWRnbVdxQkhCdDV3bVUyWWFreWoraThp?=
 =?utf-8?B?WXBZbjN4bytNdkc1SXFyVDA2TEVjbU1pSm1YRTdsRU1uMjlDV3NpOGc1aUFn?=
 =?utf-8?B?cC9HYkxoZ3RTbU1zQVRLWlBhRkpsN25tY2ZMYU1QVFZhcE55YXhpZFNyYWVk?=
 =?utf-8?B?YTd6TkNZU2RCdkJCdE8rblZxNFJWKzFBZ1NjSDJUYzZWS1ZrOVJNQUl1cits?=
 =?utf-8?B?Y2VtWVBSM0FNa2VObTRzdW4rYklBOGNyeEpjVVloSk5HTU9JODNpb0J1K2VP?=
 =?utf-8?B?M2c4aER4RG95cVplbkZud21ZQmNsYmFPWU9BQVlMaEljdEllTmQ5cGIreGZH?=
 =?utf-8?B?WG0rSFVIS2xHcmY3UU55Mzhra3VXVU9iZmJlWHFVY1JPanZ1MWEwQ3VQeVMz?=
 =?utf-8?B?Z2t0QnZFYjV0RjBTNGRPd2NBV0lISDNpa3IvenRlK3F6Vjk2blJxdnBQeCtY?=
 =?utf-8?B?aWJabHk4WW8zcjUrTFEwNnB6NmZiYTZFTllXSFZ2dDJLZXRPY25WU0VaSXV2?=
 =?utf-8?B?MnpwbkRLYUFoY3dPb2J5REsxbUp6bC8rWUpJWVJtd0NTNnVNaElTWGw3RmhG?=
 =?utf-8?B?NFl0V2U5Ulh0enFxL0loVHZXN095UExiWFpDczJxU2FoWVR4VFFjaHc3dGxC?=
 =?utf-8?B?OEdtZEJTNDdsZzUxYVhzTDBYZ3BLWEZUNm9hTUY4QXRSNkRVVzB5blp4QzA4?=
 =?utf-8?B?dTY5V1YwTUd1QkVONHhzdHFyYTVZN1VjcWRzR21vWTZXcklpbk1BREVEY1FJ?=
 =?utf-8?B?d3JBT1pCbk5MRUc4RVhyNDl4RERZZWVXUC9kejJXZW1ZOTBhVE5KTzc4Z1Ny?=
 =?utf-8?B?b083QW1HS0pveUhLZjNZMy9wWnUvMUMvUUEwMEpadlJEbkM1SFJmblo3TEtx?=
 =?utf-8?Q?TYQujHF3p3V0igGNos8lR1Cm4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a50d94f-e815-4e6d-8257-08dcf34322d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 09:14:45.5794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFPr4/n0T0lHOXPX3GKhnoT4c4uYCcGT+FN8w9Yp9JAXSd3SiUmBoXA/FeoeFWHn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8574
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

Am 23.10.24 um 09:38 schrieb Tvrtko Ursulin:
>
> On 22/10/2024 17:24, Christian König wrote:
>> Am 22.10.24 um 17:17 schrieb Li, Yunxiang (Teddy):
>>> [Public]
>>>
>>>>> +static uint32_t fold_memtype(uint32_t memtype) {
>>>> In general please add prefixes to even static functions, e.g. 
>>>> amdgpu_vm_ or
>>>> amdgpu_bo_.
>>>>
>>>>> +   /* Squash private placements into 'cpu' to keep the legacy 
>>>>> userspace view.
>>>> */
>>>>> +   switch (mem_type) {
>>>>> +   case TTM_PL_VRAM:
>>>>> +   case TTM_PL_TT:
>>>>> +           return memtype
>>>>> +   default:
>>>>> +           return TTM_PL_SYSTEM;
>>>>> +   }
>>>>> +}
>>>>> +
>>>>> +static uint32_t bo_get_memtype(struct amdgpu_bo *bo) {
>>>> That whole function belongs into amdgpu_bo.c
>>> Do you mean bo_get_memtype or fold_memtype? I debated whether 
>>> bo_get_memtype should go into amdgpu_vm.c or amdgpu_bo.c, and since 
>>> it's using fold_memtype and only useful for memory stats because of 
>>> folding the private placements I just left them here together with 
>>> the other mem stats code.
>>>
>>> I can move it to amdgpu_bo.c make it return the memtype verbatim and 
>>> just fold it when I do the accounting.
>>
>> I think that folding GDS, GWS and OA into system is also a bug. We 
>> should really not doing that.
>>
>> Just wanted to point out for this round that the code to query the 
>> current placement from a BO should probably go into amdgpu_bo.c and 
>> not amdgpu_vm.c
>>
>>>
>>>>> +   struct ttm_resource *res = bo->tbo.resource;
>>>>> +   const uint32_t domain_to_pl[] = {
>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_CPU)]      = TTM_PL_SYSTEM,
>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GTT)]      = TTM_PL_TT,
>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_VRAM)]     = TTM_PL_VRAM,
>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GDS)]      = AMDGPU_PL_GDS,
>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GWS)]      = AMDGPU_PL_GWS,
>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_OA)]       = AMDGPU_PL_OA,
>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] =
>>>> AMDGPU_PL_DOORBELL,
>>>>> +   };
>>>>> +   uint32_t domain;
>>>>> +
>>>>> +   if (res)
>>>>> +           return fold_memtype(res->mem_type);
>>>>> +
>>>>> +   /*
>>>>> +    * If no backing store use one of the preferred domain for basic
>>>>> +    * stats. We take the MSB since that should give a reasonable
>>>>> +    * view.
>>>>> +    */
>>>>> +   BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT || TTM_PL_VRAM <
>>>> TTM_PL_SYSTEM);
>>>>> +   domain = fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK);
>>>>> +   if (drm_WARN_ON_ONCE(&adev->ddev,
>>>>> +                        domain == 0 || --domain >= 
>>>>> ARRAY_SIZE(domain_to_pl)))
>>>> It's perfectly legal to create a BO without a placement. That one 
>>>> just won't have a
>>>> backing store.
>>>>
>>> This is lifted from the previous change I'm rebasing onto. I think 
>>> what it’s trying to do is if the BO doesn't have a placement, use 
>>> the "biggest" (VRAM > TT > SYSTEM) preferred placement for the 
>>> purpose of accounting. Previously we just ignore BOs that doesn't 
>>> have a placement. I guess there's argument for going with either 
>>> approaches.
>>
>> I was not arguing, I'm simply pointing out a bug. It's perfectly 
>> valid for bo->preferred_domains to be 0.
>>
>> So the following WARN_ON() that no bit is set is incorrect.
>>
>>>
>>>>> +           return 0;
>>>>> +   return fold_memtype(domain_to_pl[domain])
>>>> That would need specular execution mitigation if I'm not completely 
>>>> mistaken.
>>>>
>>>> Better use a switch/case statement.
>>>>
>>> Do you mean change the array indexing to a switch statement?
>>
>> Yes.
>
> Did you mean array_index_nospec?

Yes.

> Domain is not a direct userspace input and is calculated from the mask 
> which sanitized to allowed values prior to this call. So I *think* 
> switch is an overkill but don't mind it either. Just commenting FWIW.

I missed that the mask is applied.

Thinking more about it I'm not sure if we should do this conversion in 
the first place. IIRC Tvrtko you once suggested a patch which switched a 
bunch of code to use the TTM placement instead of the UAPI flags.

Going more into this direction I think when we want to look at the 
current placement we should probably also use the TTM PL enumeration 
directly.

Regards,
Christian.

>
> Regards,
>
> Tvrtko

