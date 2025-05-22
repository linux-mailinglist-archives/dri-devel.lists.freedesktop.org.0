Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61248AC0CB1
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2A110ED9B;
	Thu, 22 May 2025 13:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TDmbgg/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB8B10ED4D;
 Thu, 22 May 2025 13:26:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAcThFaxFoDjl51a071DtNAtwNCNpLE8G3ngSnVEXxf5rBIJQsRATcF3Ln5CfHppJLW/ZPF8g+VkWciPjOhPz5cKpUESHDX6xMGWD4Dz+vdjoCOMygzHR5ZNqc+dFbuSBoWTeLQWIILPChLhS7M0+UIE4ORNEgRfVz+t755QiVavSbkNF+npO/ndI7bQs7ZgGSv8bPTISUq03N/FlruqaIZNrrRfPbdUfezVo46L4Fwq3epDsVf+UgygYNtewHhtb7GxXzQQACZEqsofI31JXXOf36tNdDtwNGOpBlEQlxi2keyeJV17F2+NCpjvBf7o3ODff0TOHPTykFt3ln6NBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/qDM2IYzF7fTFzYSwrrfZRs5wT3sMuDZEKXYsG3mRY=;
 b=fc5kgB8T/PCzG57aY/k5JSvyJP7rNrYpwd66VlgcILHhtDudOmH7v8XUj1nPMi2WAp5nRskd7xYiCoXAOsK1AshXo3iT9B3XpWAKyoK3tGlh5GdC1w82ATC6YSFtl1aLwmiCY1xgIgeoRR+AihAtMI+6lCSSmfjWzScZbaye2/4a4hl/eLcT7hPWYNMXyLUmDd1rZsnHKpXP49w4r7bafNHFANCxVtea9EqukagigYU22bXKAkfn2uGkdnZBwGgeEDxmjFbKEf8EBruo6P3FQJ4DF7/GLXlhGdlqiPZ303B4lX5kkD+T6Bwd+aniOAA2n6slO1mPtjj13Ywz3lXMcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/qDM2IYzF7fTFzYSwrrfZRs5wT3sMuDZEKXYsG3mRY=;
 b=TDmbgg/8GXh8Pk/ZVE7fKJ+0Zo4Ey/P3uk4OJjO7cSQzmkRLMxTtLiAb6SFqPNFhLoTJAi+iIud1Ixhc2oJjjHqxEYl0tbH41hRHiJP6uqJgUBmpr+HwbraMjVxmNZn8IGw3SBS7uImmbmhmCK5D7//6xCYgMNlS5aW1LjXEMq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 22 May
 2025 13:26:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 13:26:36 +0000
Message-ID: <2bfef16c-0a3a-4ec5-b5cb-20f8129793a0@amd.com>
Date: Thu, 22 May 2025 15:26:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: signal scheduled fence when kill job
To: Alex Deucher <alexdeucher@gmail.com>
Cc: "Lin.Cao" <lincao12@amd.com>, dri-devel@lists.freedesktop.org,
 aamd-gfx@lists.freedesktop.org, haijun.chang@amd.com, zhenguo.yin@amd.com,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
References: <20250515020713.1110476-1-lincao12@amd.com>
 <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
 <CADnq5_M2VDyrBcAZxkYFqE6myJGBKL+aBNL0GNiu=+mfroH+8w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_M2VDyrBcAZxkYFqE6myJGBKL+aBNL0GNiu=+mfroH+8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: b33bf855-b44e-427f-af93-08dd993446fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uzh0dGlHMmMzZEk3cmdCVDlkT3pXWk1UYTZ4T08vKzBJVHlPQXJCM2pTR3Zo?=
 =?utf-8?B?K0FHWlBuclNtVTVuYjJjRjR1QWdTKzg2MnlIN0VTNnRsaDl2NTJYUmVYbmc0?=
 =?utf-8?B?eWdVMFJaeTQ2b2E3WTFXMmVuTFFocHN4bjM3SzZITGZITm54a1NsUmI0bnV3?=
 =?utf-8?B?TUd3MkFkVkd1RGQyOW5VWmxONENyZnRudjhQdVdGcU5Xc0xGM2QvbXl4dVNM?=
 =?utf-8?B?cE15SXM5a05jSnZzSmpKbTlzM3BNcGdVTitMN0RCbDlDMXNnUGtDc0I3QUNO?=
 =?utf-8?B?TlI0cXRMOUhnUys4Nk5JLzNNaG1laldMZ3Fab1BvNSs2eXR3ZVdtaVFxZ1RL?=
 =?utf-8?B?NnZCZGNIRnFabkc0YjBiTHl3Nm1VcFNPYlU3N2p1QkluanExSWlVS3FIRzB2?=
 =?utf-8?B?TWMwMWNSeVlSMDBUQ3hxWElVeVhxU1NJdW5SckZjcTdneHA5czJBQ2V3MVM5?=
 =?utf-8?B?WnJCOGRjdFNRTlVLT3ptMFdlN3F5eHhjQ1FUUFVycjRLaStyVkk0MHI0ZHMy?=
 =?utf-8?B?OFgrZ3lTS3grZmhTWENyRmplLzNTOTRvMEd0V1BVaXAyUWpvbU1xUWxJUkdL?=
 =?utf-8?B?R0dVRnFVd2k2N0kxNDlTODlZKzZJT2VneGtmWGcyV0JuWFlzMkdvdGZGKzV3?=
 =?utf-8?B?RTRSc0IyemNuZHN3OWRSOGw3Vnp6ZHNlbU9JdlZYbmhWb3lwamZ2NWx3M2FR?=
 =?utf-8?B?bDI5dGRlS3UwbXh2NTM4RThuRlBLQUZaME5tanNSMjZWKzN2UlFVY2Npakdz?=
 =?utf-8?B?Mkt1a0t1TUtkRUEvcGtabm91dWJmazlTbUNzYnNWQnJNcUFheWtDZncvdWNu?=
 =?utf-8?B?WUFWZ2IxbUo5UlhJdzVqLy9FaFg5WVJGdFRZQUNZMjFBM3Zkd1VBRWZFMEti?=
 =?utf-8?B?TzJYTUluODF2QTJkRi9ldDVTRERreFhaZGFBVzZHcysvZWd5cmVzcGhQRllV?=
 =?utf-8?B?dWpIdUdlZnNibnRIQWJvOW5XbzF6RGl0cFppUE9qZzVCMTd4OGhKUHlWdHpw?=
 =?utf-8?B?NDdNMTNqTWFKTGQ4Y2pzY2lKYzcvQU5rTWxCTWJvS0taL2srcFVYenhuNWVK?=
 =?utf-8?B?bDE0eTZPWW9UZmJVd01XS0ZvekY5M25sSmFsTyt4emFKbkZkZEdPMXIrZHda?=
 =?utf-8?B?T3l1YXdldHpPMFl5VXNnUERvSFFWSVpCOVdQRzVEelc5Wlc0NWlWMllCSGJ5?=
 =?utf-8?B?akpWYkk0T3laZnI1TXdtdVp2Wldsd1FYS0w2bll3UkJyM0JqWEY0ZjZXNThk?=
 =?utf-8?B?Q3lSQnlLMlhvNFFZYjltRVBuaXNsRFlIbmJyZW9tdEZuSDM4SDFaN1FXbW5R?=
 =?utf-8?B?YVFITnBuTDlHb0tNaEljako4Z3MwMEhIclliRTlGQjRuUEFHK1k1U3VUYW1I?=
 =?utf-8?B?ZWVQN0Q4aHlEWjhhcGM4dGdPMTNQS1V6UmpLQXJINWhRc3pVQmJ3cm05WVpD?=
 =?utf-8?B?OElDZVd2MTVpRkpMU0Fva29DZmU5U2tUdHB3RjVWRE5od0VHVGNHU2IzQUx1?=
 =?utf-8?B?TllaWHpnTTZnSjg2aVdxaFlGYnpid3lsOVVBTXoxbGlaTStlNTYxZ1pGUi9s?=
 =?utf-8?B?UExKQ3E3cFVpQWdpcTJxMk5Obk93dW1udUsyeGNRbWpLVVFwVXJWc21xVGRh?=
 =?utf-8?B?d04rUVBidCtTSi9vZk5PZjJueGZzL1NIbXFlQk01L05JT2tuVU1NS3B1bkVi?=
 =?utf-8?B?L0IvL3ZSNGJsdmJwZUlrNjdWYmMyNlFqUmdTVFk4eldvR0s3NWM3Y0lPR0dj?=
 =?utf-8?B?RklXVzVqUmUxOVA3aHVaSnF4MitWWnR6RzZ1djFuK3FCdVNiQ2tSbDlQUGtK?=
 =?utf-8?B?ei9mcE5ZU05mNFVIK2M5V2R3QXF3MFFVRnFjaEkzMEorZ3ZidmNBVU1JQjEz?=
 =?utf-8?B?STlVQmNMOEV4TDJqdk1lVEN0N25OY29va04rUjN2ekNGM1lzRDY5YnBqSWxH?=
 =?utf-8?Q?VTJIX+InEwo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXk0OW04YSsrTUwzbWhuOGRnYzRQZWpMRXhNMlZHYkp1cFJXVXMyTjIvNkQw?=
 =?utf-8?B?RVowVDVaalBsZmZRSUFRblNtNkYxVm9BaEVaalJ4NStDdFZwV1B2enl1K1Nz?=
 =?utf-8?B?VllycWNtKzZtZDhCcHZHQ25CYXZONCs4Z2wzK0ZCY3VtelB4NFU4N1A0Ukt0?=
 =?utf-8?B?bThRalQ3UUwvZFpoN3QrSG5hZ2dQZlNDdGt1UTRTempEYzdnWkZnYmZSR01E?=
 =?utf-8?B?NXF2bzh0ZHhVZnVZZldMaEk2V20vN24vN1dsTlgxRnFmdE9yVG5BWVBMZjZU?=
 =?utf-8?B?S0xmamxqemprZ3NqQ0NkbUZra3pQcFo4WjF4R2xCenp3ektPMUllR1Q2b0pK?=
 =?utf-8?B?OGxFa3pJM3hxMmhjNU9PcXRyVkR5Sm9BbklrZ0ZvQ3JKaklRUUNIZEJXbmQ1?=
 =?utf-8?B?cXpzZVhuR092K05IM0dIVFlHdUtEUnpEUGE2ZytrTkhqMVFpemlhMUlyZThV?=
 =?utf-8?B?eERPVnZ6RU1PZzBiU3ZOeUFobTZqU0hMMkVUWWV2RmhxV1dTTG9nTVo1WWVj?=
 =?utf-8?B?dTFqcFFxOHRpdTRtdnBiVmtENU83UDZYa0grcklVVHIyd0tuNTFjMWUzQWZu?=
 =?utf-8?B?ZFgxVHkveUFsQ1lZd0J3U0dxYm1PTGIrUXpLWDRSRGlkM3NMZHhwcCtVTzZR?=
 =?utf-8?B?aVlwTFplMTFoU1hNTG5PLzVBejJpamxWOG5ueEhpU1RIa0g3TzhJVXE2MmlW?=
 =?utf-8?B?ZXRQelRPSGRmTjAxNGwyVUdEalZJdnBTU0N0UDFPUWlMTVZtdjl0aU1zdmJ4?=
 =?utf-8?B?M0VKSld4TGNGWXFwcW5QRWZrcE55YnNUU3FNTWp6YkwybjBsM0pCQVd2elkz?=
 =?utf-8?B?VnVCdlFNcVgwbkJOMGJYNXlxWWRyYlVmK0RZYi93ZEhlVmFNWG9ENFQ3Y1ZZ?=
 =?utf-8?B?alVoN2RvMTIzdWJpOHhUeDdOSUdsZXhHRGVGQllsZjJ1enZGMGtwMFBpNTFB?=
 =?utf-8?B?NXNDY1ZZMnlIdnRla3k0K09HbW1Qd1BaYkN0Mm5lR05yeFFrdkhENmNNVmlj?=
 =?utf-8?B?dGYyVURpM0RBenI0d2Fnb1F4aFNDNEFDRCtIUE5WKzR4ZytwSTdPNmhWQTJL?=
 =?utf-8?B?NXV1QkNURmhRMkVpc0ZKWU1rNDVUWkZwOWU4VVRTdjMrUzRnSlpjUGtUVlk5?=
 =?utf-8?B?bENHU0dWNEM4WmxFc1VJaGR0MElxNW9mc2lLenYrWVR0YTZJTm9iMmplSGdH?=
 =?utf-8?B?aVV1YzB0NW9sdkZoN2ptcHl2S2k0QS9ZRGVkbGRTMFRnTk5DbTFaTnlOM1FU?=
 =?utf-8?B?b1YvNGUwSWYwZVl2TDQ0ZW1FbjdaL0dha0hFeGdnOUl3TFJwMVdHOW0rSmNm?=
 =?utf-8?B?V1ZLU0xGY01jV2tKL0lRR3ZXc3hhL0xUS2ZnanZkWjVqb0dlS3g1Y3Q1aC9z?=
 =?utf-8?B?czcyZHZHeENuMC83MmxmdDlZcDRzTjBkUEJmWURLWXFnbjZKQ0dLZEpmWlNJ?=
 =?utf-8?B?UlM4ZlVrbjVtRnpUTk5QamtDWExmL0hZaWdQM0tsY0xaMjRRMlhrZ2E4WGF1?=
 =?utf-8?B?VGF1R0xhS2xsQ0hkM2ZiQUQ1VU9NcWZTVlcwa093NDFmSHlkOG9TaUtZL2RJ?=
 =?utf-8?B?TGdUdW9ud0diRTlRem5KblZNZVlTZk50NjZvdHk3STVEeWJPd0kxM0lkOTRo?=
 =?utf-8?B?VHhXSXpwR01HbnN5Vzd5R2dJa3M5NEVoaHJ5a2ZYZjNwd1hMdFUvaXl2MWIw?=
 =?utf-8?B?QkFXRDB1RC8yZnd2QXd3Qk10VDcyMUpKNTlob1EybitRZjhJRUxkWWpCYllz?=
 =?utf-8?B?MnZRWGRvcnBxRnJWQ2hZb0hyd0UzSXZ4N3NnbXh4UWplM3UrREorWGJwS1FR?=
 =?utf-8?B?c2lkZk5Hdk9YYVpEbWg0a2E2WEoreE0zNCt4dkNGWXQvY0FDUTBEbzI2Vmsy?=
 =?utf-8?B?dXZKWXRjSnF5UWpQcFIxZFh5TkViT2l6WnMwWU1XWTJ2SUExWDQrbC8vckdL?=
 =?utf-8?B?SU8xb0JlQmQ4UCs3ZWJSVkdZTVFmUDNoN0RwdTBScXZ5V0IwUG1UQklxd0xP?=
 =?utf-8?B?U2ROY3JPNE54bHpFbjU2UTIvYW9KMDFKTVZ4bmtrQ3k0V1NzQ1E1U04wRVNt?=
 =?utf-8?B?VzRKWjU4V1lyUElFRVN4SzkrajFyOW5veWhqVC9DVitxYmFueXd4c1ZGSlha?=
 =?utf-8?Q?PIxOkugk1Z0kyu8pYdlK7iyNu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33bf855-b44e-427f-af93-08dd993446fa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:26:36.6976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJma9bPYwcB/PdaDjEeZxJ5lwPFGqkQy5HaN0SnvuuGvVHUnOIoGkukF/Ykbgnfj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247
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

On 5/22/25 15:25, Alex Deucher wrote:
> On Thu, May 15, 2025 at 4:58 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> Explicitly adding the scheduler maintainers.
>>
>> On 5/15/25 04:07, Lin.Cao wrote:
>>> Previously we only signaled finished fence which may cause some
>>> submission's dependency cannot be cleared the cause benchmark hang.
>>> Signal both scheduled fence and finished fence could fix this issue.
>>>
>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Danilo & Philipp can we quickly get an rb for that? I'm volunteering to push it to drm-misc-fixes and add the necessary stable tags since this is a fix for a rather ugly bug.
> 
> Did this land in drm-misc?  I don't see it.

Not yet, it's on my TODO list for today.

Christian.

> 
> Alex
> 
>>
>> Regards,
>> Christian.
>>
>>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index bd39db7bb240..e671aa241720 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -176,6 +176,7 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>  {
>>>       struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>>>
>>> +     drm_sched_fence_scheduled(job->s_fence, NULL);
>>>       drm_sched_fence_finished(job->s_fence, -ESRCH);
>>>       WARN_ON(job->s_fence->parent);
>>>       job->sched->ops->free_job(job);
>>

