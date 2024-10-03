Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D098ED38
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 12:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B272710E194;
	Thu,  3 Oct 2024 10:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5KOlYYxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9B110E194;
 Thu,  3 Oct 2024 10:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hS/RBUigmfgiLTZWmOBpIMizrM8pMx1W4uJBiXauGtvlWZAcRvXYOXowKGmH9zDtPH451kYYcAklth2GaTPfCHejXwjaWXGfnoNz2WthbffBwjtJ+DVDkForTqj6SHtiTgHpebFVNd3fATCb+he7Q9mEXWuI1JeMBGQmiFMYo3ivXjJ82VhMhld1NYIAQV/v6QnG1Tu8He7RMOMs800sDJC4lUu1Dkv+mQz5xjcsVwwN5lSXkNI05qmyomgCoW2EJkZ0F+7NdoD6zoQGlQv3PVzOaRndu5f0LiwlN4jz0ULE74P4D5eyXQZp/czvMZJAsJGsXID4dR7pHVjNczEGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dOj7GPbRS78JGzFuk4pBUT+iB/9qnCyV9nzAaE6nvI=;
 b=EOerEUd8Dh77toMF7oM4NPLH1aOfomNLVItiKr1ZRUYsktb3YCJrJDeFciCEaO3kf7F8KcmwSQU+mldUoq/z2skuRCnUAcTU9PIRhQ4noSYV4QXO6tJdUztM9uxLNt7qrsGaqapcSuIO5+1VH/lRfuDchsTJjDvie6RMLX5E6bMAIYSRpAvRuuhPGlsV7TsmtKiktScKlM5EC2oX0ocLgeZrwiYC+oyiX8WdV0cFfqiILZEOmNmbaGVcJpVDy8kBiAo6oT9BXdH6uMza+IeF/GCzROBVwkpHFP/0uMwAXPKZGq5cpVz0DtbphitJEjVvCRABZE6AcDKlTBBd+IeiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dOj7GPbRS78JGzFuk4pBUT+iB/9qnCyV9nzAaE6nvI=;
 b=5KOlYYxgYTcN5ELLmDXVj6p5sn2lqBAv5KrFoT72Yb+61kNIy4I0Agvjh07fJjiY8COEmRb4IqRX15OVgVDStJyGMhPYsg9CtafKf5vpPp2xt8UTS7B0/l6dtgdK0KqrRTqYY4b926IKEHIzLpHTC6jicFwbn+Nf3TsD/F0kH9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22)
 by SA1PR12MB6821.namprd12.prod.outlook.com (2603:10b6:806:25c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.28; Thu, 3 Oct
 2024 10:44:13 +0000
Received: from MN0PR12MB6293.namprd12.prod.outlook.com
 ([fe80::49ac:e84e:ea32:d743]) by MN0PR12MB6293.namprd12.prod.outlook.com
 ([fe80::49ac:e84e:ea32:d743%4]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 10:44:12 +0000
Message-ID: <c344f4ac-1ff2-4250-bf31-c17430675751@amd.com>
Date: Thu, 3 Oct 2024 16:14:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v2] Fix unintentional integer overflow
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com,
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, sonny.jiang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com
References: <20241003102623.11262-1-advaitdhamorikar@gmail.com>
Content-Language: en-US
From: "Sundararaju, Sathishkumar" <sasundar@amd.com>
In-Reply-To: <20241003102623.11262-1-advaitdhamorikar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::16) To MN0PR12MB6293.namprd12.prod.outlook.com
 (2603:10b6:208:3c2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6293:EE_|SA1PR12MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 504f6c73-6262-4c5e-03e3-08dce398519a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1ZrYlFjbzJONWcwaVFoQUc5c280aDBpRktZYVpHMm4rMEUzdFlhMUNvTS9o?=
 =?utf-8?B?RjdMUTdONzFkZHNHL2tudG5UZ2J3U3RHdFlBd0RhWlJwRG4zQklscnJwVzRn?=
 =?utf-8?B?TldIb0hHb0F5d0IvaUI4NTUyeXo3SzRRVmRwdjROTlZ0RXBkWDk2ajdJVUlT?=
 =?utf-8?B?QzFhdmlPelVXREVYbjB6V1M0MXBzMUJoZFBOOHdRTy9IMGNLaHNiN1BlRzg2?=
 =?utf-8?B?VWpWTUZjWm1nNU1hMHdFMGJFRUx3R0k5RzdIang0blkyaCtQQzlEZ0ExS3J5?=
 =?utf-8?B?YlU3aldtdWI5RDB1b3NJei8xcHdDdjNaZlI1WmlaWHl4cDNVUTFleks3ME5Y?=
 =?utf-8?B?N2QzTCthMmE2SVF2a083RjV2eElpL3F6Z0lxN2ZuNGpFM0M4VjkxMlcxdzcw?=
 =?utf-8?B?cEdZVGl4amNUOXJZRWJrRkk5MEExYjIzY3Q5ZFdLZC81NVRCVTMrRDYzRTVZ?=
 =?utf-8?B?MzdWdDhZcEdJck40L0ZCajUvMjdHcmM5UnQwSzdlMXR3RVhmOVlyYy9ERGN3?=
 =?utf-8?B?K1RXSTlWaDJWNUczZVc0VjdwRlRFSzR1Z0s3U1duN2xPMytDUlh1VDNPYVVB?=
 =?utf-8?B?cWlMK3JLdC92MXdURE9nSFovSGFMcWRjYVdQaGxJUWlPM0JrZit0NlJzTXVO?=
 =?utf-8?B?b000bjNGNmI0eWRZUDQ1M3B2NzhuQTVJVnVmU04wbGNDUlNMTVl2elFnMlpL?=
 =?utf-8?B?aEF0cStmTzdlb0tZNU4wYmFsMHA1cFpSSE1NVGd3Qi9TdUVzTDNQUGgxZUg5?=
 =?utf-8?B?SzNQTk1MSkxjTW44cUg4UHFtU1owOS93TXFsM1AzM0ptcHhPaHpqeG45ZHR5?=
 =?utf-8?B?RFZzR3dEWFNWdE94NXZXT3ZNMXF5YWFGRmdwbVRBaURuV044TWNUQTB6bFJv?=
 =?utf-8?B?VUpCZnJiRU12blh4WWM4SlptNkRweU55YTYvK0tRaFVJVnZ3ais5MDZKOXZh?=
 =?utf-8?B?aVFXOG43RGhpNnJjQzFzN2VZMEE3d2Jqdjg4NUdMMkQ2YmF5eDNCZjRHdmcx?=
 =?utf-8?B?d0lOdE5kUTZaVlFIcUswTDIvdkZjYWRpU29Cd0JDTXp3QUw3K1BjRjRpMkNp?=
 =?utf-8?B?cU1EYWZOZHpOdnJkamNObUhSRys4UEpnWlMyMkxkSWpsaVB5NVg1TXpIU2Ev?=
 =?utf-8?B?bDdzZHp1RmJFUmNNUjZVRzd2c2JFRGxWSUFwMTVIM0xRTTdLb2wrdjBBRzQr?=
 =?utf-8?B?MHRWK0t5dm5jT0RZYVAzd0MvNFV5eDBPa3pCWUxjdmlTTXV3U1g1Uk1LUlFM?=
 =?utf-8?B?MXdMYTVYcmxPRUhZSWtHTHN0NE5WWkhHTmRJWW9DQkxGL1gyMUVlZFkwZ3Vs?=
 =?utf-8?B?dWNjRkNSN0R5ZHB1dFk0ZmxCUFZrTUlOaG82VTFvN0F1WlE0MmVOcDRDT3dr?=
 =?utf-8?B?YjJIdUJJMTI2Q0w5UWdYYlc5UGFIdGQxek1qdXRET3h0SWVLMmhJUG9VVi9C?=
 =?utf-8?B?Rk5RRVg5L3FzWHJUODBmWnp1RTZzQkxFZkZ3VWIvaHlQYnNOYUlRUmlvdDRS?=
 =?utf-8?B?UjVDSHNhRVZMQlN5eWxkK24zTW4rOC9XTXpiaXNGZnlKU09Dc3RHalRHK0kz?=
 =?utf-8?B?NlFIZ1N2dnN1QkNDaVJtaUdoNU5LaURZUGgvbWlEMFNXODROL0xobnFkMi90?=
 =?utf-8?B?c0ZaUjd4OVNsSWJQMW1MemFBSDI1cnAyNmk5RU11UkxYNXZUMWZzd1RqSnMr?=
 =?utf-8?B?YzFHZElHL1FDY09SWHIwT21JTEtuL2pzVEVMOWdVd01nY3RmdmI5UGphM2hp?=
 =?utf-8?Q?MpxNMYR0/tr+nR0pGFd7Ume4p2DCIpCwca1iWmQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6293.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2I1b01pUjlNZFdmMVBCZXpaWTBWRW9SUk5yOHlBUGVxY0daRHNTaXRMMFlM?=
 =?utf-8?B?cnhJNUtYVUkzVTA3ZnQxMVJpZkQvWGQ0S0JTMlUrK0RUWkt2MG53QTFJUy9u?=
 =?utf-8?B?OG85RWdobVN0b0FPZVhrNlhDbE4zWGdSWDVIV1h4VUJBSjF2UFRSUVBoSUd6?=
 =?utf-8?B?L0c2ZGtMUXA2TlZkU0FzMUJaTUs4UHhucnFRa3g4enJGWmxaY1BEWFh4N1pU?=
 =?utf-8?B?SSs0dzJCSnk0WWMvOVg1ZVBXaVJqQk0wWUdIYnc2YmcvS2Fzc1lmL3dSejhm?=
 =?utf-8?B?dFZEaUZvNUNzN2RBS3pjYVZ6bSszcjFpcU9mV3AyV0ZPZkdoZjNxT3Fnb2c0?=
 =?utf-8?B?Q3pIR2RtSStJMUhFK3J3VTdXUUNKdFVtZkR1L3gzRTBKSnN4OFZabkNka1Ny?=
 =?utf-8?B?YVdZSVljblgzRWRnbVMzRFlQK3gwV3lBQjFqQ21tMXJ6S1N5a1grbC8zdm5l?=
 =?utf-8?B?TGxaNWhPMWpJTTg5emhCcGtwbkp1d2U3MW1FNHRjMHZtUzJ3MkJwS3RwQkJV?=
 =?utf-8?B?MGpmcjhyd3hkcUJmblQ2V3U5c3lBVXowQXBNVEVoNG12OXhUd2tNVHYraWRQ?=
 =?utf-8?B?UVpUWlcvZkNlU0dGVEZ3V0x3NnM2L2l4Zy80bFVxQTZ3RkUvVGxqKzJXQlk1?=
 =?utf-8?B?Vk1qQnBLRjkzM0h3bnI4MGcwbnpFRWM4TkRBNEdycDZLMEdGcWwzZForb0JQ?=
 =?utf-8?B?YmVmU0RZNVRtOEdvaVNmMDFmREk5dXUyWWR6MmEzRWhuSEw0NUlhT0p4bThu?=
 =?utf-8?B?WE9yeUNjamtZV3RrdXN4UVhHQTY3L25LK1ppUlhRaHFxU0djVTJOSDE2QjIr?=
 =?utf-8?B?QXFGUlVRSnRRMWtHWE9WQ21IQjJrUkpxVStXYXpORWd4NWNzZ2NxSU1ETVFj?=
 =?utf-8?B?cjZnUHk2RVFIRkRnSlJ6QVM0RTBUT2krUkd2M2lCLzhhWS9sSmRTczc3eldD?=
 =?utf-8?B?Y3Q1bHRqOXhURVViQTJLMGRtdlB6SlRuVHc4eVZqV2FHWDZTN0Z5cW05c2s1?=
 =?utf-8?B?b3MyOUtZcllRcTBhTUpBbjQyc21GSm1kSHpud2czVFUwRFNxTTRJVHh6Sm00?=
 =?utf-8?B?bjc4ZVBQV0ZyTmdoWXBNM1Mya2E4WFFVWHlsZzhsRGFoSUU5OGpZa05jbnJU?=
 =?utf-8?B?eldWL0piZjNBT0xZeHhKZ3NkSDVTdGVRRVNyUy85S090bUQ3cE1idW1UdjBI?=
 =?utf-8?B?cExwSFVBamNKbEJlVE5MclIvbHBYZjFSK0NrSTZJU0VHT3J6ZElZL0k0T2lJ?=
 =?utf-8?B?ZFRnRmsrc3lKc2FCL0NwY205R0MzdUZqVzlYalhnejZnNVBQN2w1dmtRS2dy?=
 =?utf-8?B?ckJ0N1JzVEJ6VkhZb1Z0QjdpOURGTzdDeXk2UXhyVDBLb2QrNGpSL2xaNW5a?=
 =?utf-8?B?cHZSTnlZbEd3eDJOSzhFRzRDS2puWmVQdkdyU1g0eWk1K3dWWkFCUGRGQnVT?=
 =?utf-8?B?WTJQeHl3RDFNSzlIaDAyVytXWlJpY29TT2pZVXdGNWZWczVrdGU0TjZDTkxD?=
 =?utf-8?B?WHEwV1JkU1drWDZITUVZcUYwYWRPd3UvNlVVQmp6UC9mU1VmdTlVMHN4MEhp?=
 =?utf-8?B?RG9EVDdlbzlOTzRNNTJRTUdmTnhpRUZLNWs4QTNiQWNoZHVJc2tEQlZUTW15?=
 =?utf-8?B?Wld2NTl6eVoxZXlXdnlKRkxjU0F4YWNUWFZ6R0xuOVg1NnlUMkh2Y2loa2Nj?=
 =?utf-8?B?QzBXQ0VqU1N0d0k0K24yajZ1SEZqV1dnNlorQVMyd3NJT0x2MlhuNDZmUmp5?=
 =?utf-8?B?ZUc0Nlp1ZC9KM2hoNUF0QmFlLzlxNHJ4cVFIMlFHd0U1ZXRRZlFGYUtOV21a?=
 =?utf-8?B?K3dZU01JMXk5RjkrK3Z1Q2xvMStaSVJmMzBXRksvQUkrakVXOWRxQ25zcDNu?=
 =?utf-8?B?SGhodnk1RUJheFI0Q0luNVI1WGxXOFlaNTlYYXNHRjd1ZlQxTk5LSE5NU2c2?=
 =?utf-8?B?MFJGaFV3Qjc4TWUrcDUwcHBSNSt4akpTZWFKZFVDcWtJUHpJVm9kU2N6VlVk?=
 =?utf-8?B?aStkOXBUbmNZbEp6QVRXNnBaSThEZEF4ZWJBam96YjZ2VVRvT2tKQ0Z1b2Zy?=
 =?utf-8?B?MjNkK0ZycTNkZ3ZkSXVkY1dtakozcmVWKzJsSUl1ZHk3RFFPMVlkbWJtL1Jj?=
 =?utf-8?Q?l3UQ3fEJNuiOC9bvPHkcm0Eh2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504f6c73-6262-4c5e-03e3-08dce398519a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6293.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 10:44:12.6304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9u79o1bbrAmXiKB4BzOyfecUfNrZUW05MDYINrQK4Qm1fc6b555Q7MRLrPWuPb7GMkfofaHPd1duELGSHKHwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6821
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


The patch is Reviewed-by: Sathishkumar S <sathishkumar.sundararaju@amd.com>

Regards,
Sathish


On 10/3/2024 3:56 PM, Advait Dhamorikar wrote:
> Fix shift-count-overflow in JPEG instance
> multiplication. The expression's value may not be
> what the programmer intended, because the expression
> is evaluated using a narrower integer type.
>
> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> ---
>   V1 -> V2: addressed review comments
>   
>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> index 95e2796919fc..b6f0435f56ba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -357,7 +357,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void *data, u64 val)
>   	if (!adev)
>   		return -ENODEV;
>   
> -	mask = (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
> +	mask = ((uint64_t)1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
>   	if ((val & mask) == 0)
>   		return -EINVAL;
>   
