Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BDF9B4174
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 05:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4388110E593;
	Tue, 29 Oct 2024 04:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xQmE87Qi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7393110E593;
 Tue, 29 Oct 2024 04:04:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lbx8tHpHPSge97nWx9noLpsO7FYeBeTacfBE5SxmLJnMSTM5Oohp+dgf8HMIJcWVksKYRkOoSSYiN9qAxOtcMceJqRWw92ZqfeCJ1M9pI/VkmlnnvZ9+qghpuYfSkrEBNrZwz1dP8UtOkMobVEAqV0tuKT9V5sPLQleZr3y+41LPGLeRX2iHimjdMoi9Z446Et36Iy/KQIBBStsOVZlQSoX40nN0Vs2I1+NojYPvexDFZ3DwLYKoivNvQ7V8A8Ukzsvd3A9YhI+HT5Bek93GEUM5axsLV2/vpNG39c+86eSCm71GE2lch4+dHhQ97Ghml0VkrUd8Kd65red+FlTKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0COloeVrkSGlIlPGpAE/dOznP8muNvYohn55fRToQE=;
 b=H9sjQb16kW19xnAFpHge8RnZ0/lRIzZH4PFxzt0YXYYAdaqp8nNAAEYgqWczL14zayWyyYQyxw/b7oikNxJ7f1Ko7mD0RgVngE3esGb2lqHYVxFjNbmxkb17fN0LuNve2zwGIBMsdCd2Jghz8waOSbFeGxWt0axfYNtv0xbkLjKBBhlE7qsbvy58Cx4TU8dmN921dVnh21WLV/sC4GOL2IBrqTt0dvnQe7WwQGNNZRB1AR3nnBspxMlyzvZCAhWsMwd9xnhL+VR297fqKRd8GStB3GwzsvcMExFo9PQtgZHCDvvXtX+O23AYqXvvHRZHDwoMcXpC4zQNDdWMAi3kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0COloeVrkSGlIlPGpAE/dOznP8muNvYohn55fRToQE=;
 b=xQmE87Qi1360WydnZdnBqg/JpvYxignsRrLcclziGqJA09qcZgsXskyzA4eRDaxrBBcdqDmYFP3w0DxQtbTRruAn6zmap519H3mzqVSoYT66IZIwD0oHhuLKAX//Cuiq2Z/9g4FGrTHSs8h32xfB84U6cOhuYirkOVmc+8k1zUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 DS0PR12MB6582.namprd12.prod.outlook.com (2603:10b6:8:d2::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.23; Tue, 29 Oct 2024 04:04:43 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%5]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 04:04:43 +0000
Message-ID: <9b1c4745-eae6-4b44-87c8-2801ebd77062@amd.com>
Date: Tue, 29 Oct 2024 09:34:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: Fix possible NULL pointer dereference
To: Li Huafei <lihuafei1@huawei.com>, alexander.deucher@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Hawking.Zhang@amd.com, yifan1.zhang@amd.com,
 Likun.Gao@amd.com, Tim.Huang@amd.com, pratap.nirujogi@amd.com,
 victorchengchi.lu@amd.com, Jun.Ma2@amd.com, le.ma@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241029101839.2605713-1-lihuafei1@huawei.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20241029101839.2605713-1-lihuafei1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::12) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|DS0PR12MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: 40952a2f-c1e4-42e0-56c6-08dcf7ced141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c215MktBc2QrSUFtYmxTUHhldTBXUS85aUt3VmJOb3R4WG0xRWcvTXNIM2cv?=
 =?utf-8?B?YVVsdnAwWTU3WmptWG1uS2ZtOW5NV1BJak9IUGp0SWZUU3ZGQnFjWnNBaWs4?=
 =?utf-8?B?dnB5amRoeDVwcjV5L1daMFdBL0dWOVBydnhCeWVORGl6d2o1L29QMVYvN1Jw?=
 =?utf-8?B?OWtzTHZhb1JKZ2JXenFjMWl0cUZqeWYwNXd4SHJoRmhscUVWUDJyZUhnTmx1?=
 =?utf-8?B?SnNJVHUxSnp0MzFhQ1k5cEVUMUVUMVhqaERmRFltY0R5MG01bk5XTExpVE82?=
 =?utf-8?B?NmlUMkVmWXF0Z1hjMnZpRzkrdDlzblpaUzNia3d1K0RSTE95aFJPbGF3bEYz?=
 =?utf-8?B?V0t3YitBaXdhYWJab2NBdmw1QkFvTFptYjc1WTMzVUJrdThGbVVNbVhrZk8y?=
 =?utf-8?B?RC8zU0JzTU1OaTJ5aDIrZFo3UlJoQXFtb1F4dVVjd0ZqZG5pK3ZqRmlkbDZi?=
 =?utf-8?B?ekNKVDhod3FZYnlza3ZSSFByYTBuTVFISFcwb0k5L2hpMjJ0bHRIMWJ3K0Zv?=
 =?utf-8?B?K2NIcS9veEIyQnR4UmVDUmIzb1lwTExhMTBBa053MktqT1oxbHBLNnNETElU?=
 =?utf-8?B?RXAyN1hmWTM1Wm8zeHhNTjNXaTBnYUx1QnJGVm9kV1ZLN1JZOUp1ZTFXRnA3?=
 =?utf-8?B?dmpLM1IxWHJqVHVGYS9QeUJUSXQrRk1LMVZPMlZld1c4TlQ5QXdmeUF3eHFm?=
 =?utf-8?B?Y2pTVzNubjhtTWpmV1RDM3djdnlldXpTTW1Qajl5ZVFkQTNvUWkvcy9iNzZ4?=
 =?utf-8?B?TnZoaHI3WEJBdWhtdW1OaUxNYTJiNlZDRGgwY2oxNXlnV21aWFUreE1lS0Rw?=
 =?utf-8?B?ZHM1VHgzTFI3OXJWaXNSYmwrSERuZHRLamQvSFBNcno5SG9JZUZjODVTS0Jy?=
 =?utf-8?B?eDJicU5VcVVQVGllSFc5QTQwbnlCaDlEQWhRbW16dkwrTGFzS0NBMzFqd2hB?=
 =?utf-8?B?SU9mVnhFajNkTjRFMWNNRERXaFVwemZFL0U3RE1uY1BlVTNkT2M5MmFCMjJ2?=
 =?utf-8?B?UnJQVlJqSGZpZFQrblZGb1MvK0o3MktLSWpYTnlzKy9kZEdaZGY0ZURac040?=
 =?utf-8?B?Qy9mWkQ3OUFGTDFqdEdUbEwrSlV0YWNZc2RFK1kxSEVaYWYrVnJ1NFJTSVNE?=
 =?utf-8?B?enNuMjh1MU8rZHNSNXV3Mng5NkoyNjJvaGREL09xYUU4bHV4MUJWaFJYQlVs?=
 =?utf-8?B?Z1BXMFVnelp2UHhWcW1RZkFUQ1Q2MTBiUWxQWHJScEVKTDI4dkd0TmZiNkY2?=
 =?utf-8?B?YkRLbldMNXkyRlpiTGlGcnNRbUUvQVE0b1BaZnMwQzVDQ29ydHloTlFWWkp0?=
 =?utf-8?B?U01kVC9oOElKQkZoZ1grMXVzZnlCSHprS3VYTDNqN3VCdTY1bXIybC8xUnYw?=
 =?utf-8?B?Z0RLa2M4aVpHVU9FbDhhdElld2lsaG1qWUtwNjhRdEhXanVva0lrUERPTUUx?=
 =?utf-8?B?QjBtR0kxNzdqTFdLZUhBekw0RWpJempWVlJLOGZmdFNMSVpWUGdmQmQyWU5n?=
 =?utf-8?B?WHpqYldkRm9ld2sxYzhlU1RVS1pRWUM2TWJGU1htNHRUejdydEZ2S1pVK1ZU?=
 =?utf-8?B?cmRHTVd1NHE4eXA0ejkrMkFlazluMEc5SzFieWY1ZFh1V3ZlbkVRL0J3UXo5?=
 =?utf-8?B?a29ESUNSUVRwUlJhem1zKzlneHA4cDRkTHNQQVNDUEp2Sko1OFVDWEkwcjZk?=
 =?utf-8?B?TXo4dGNESHZYNFc0YmNQNk16N1VpQ0VCQnJVdXB1Nm9nVUhUbWJYTzZ3RDJW?=
 =?utf-8?Q?OPAe68pq+X7Q0HSa0ryBBMufr1ST92P44E2hRSI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWptN2tRQmVtZ1ZNVVNnekYrZC90Y2xvQ1lxNUxKWWt1T09kZjZ6ZzJUay90?=
 =?utf-8?B?emp6TURPMmp0dDlzVjlHZTM2aG56eElwckpqcVJnQ25JbXkyUjVPZ2pzL1VG?=
 =?utf-8?B?VW9ldkJ1Rkxha0R1OTBtWkxKWndxT2FNdkNPaDJaUWtNaWlpY3Nyc3VuMXB1?=
 =?utf-8?B?eCs0M0ZDWVFjOWEzZm8yUUxVcmJEc3MvVTdwNllVeFVKallwMVNtK2kxWFVI?=
 =?utf-8?B?ZUFLa1dSTXB6QVVFd1dmNXFkRzF5NUZTKzE1aHdnMUpwcEFibGY0dGlFMUJ5?=
 =?utf-8?B?TVlHMDhuRGVkS1Rqb3Z2ZytVR1Q4c2ZFUUo3VUFndDNBOGVmUEVpNm8zWE9N?=
 =?utf-8?B?VGRja2cvdGpOY0xvOEQ5ZjZMUFZJellWQmhQYmhNWVF3QlZRSU8vV01VcTVa?=
 =?utf-8?B?Ynp3cW4yZkE4RHFGSTdDMENhb2VWbHRYN3M3MHVzMjM3T0ZiMm4yakdYSUJL?=
 =?utf-8?B?KzUrR003WnR2cmNwWkhjUVVmc1haZGIvRUxabUlVNUM2Q1JnaFgxemdVUG5D?=
 =?utf-8?B?QVg3a25VcGtaRDdjM1I4Q05DaWJ3WEVLMW95dUtBU0R5alhpWVMralhjMS96?=
 =?utf-8?B?SFdqbHdJakpIMGhxRlU3REJHemlROENMZ1ZudGRMTHEzSk9KU3R4c3hYT0Fq?=
 =?utf-8?B?eEdYQ1dGNy8vMTJJdlA1NjgyY1VNZjBkbk82cGdFTExiVTB4bTE1R3hpNEU1?=
 =?utf-8?B?UTNnbG1qdzNQRG9reTdUWFdnc3YxL3ZlNitXcHdJN09UMVNTcmZVbjY2OC9X?=
 =?utf-8?B?bmtZRXMvWnRwcXhKTmZqSVJ5R3hBUmw4QmNTcGpsb3RMTHhkTmtmZFVBYUNL?=
 =?utf-8?B?OXIwUGk2ZHVjaUhTVEhJMTBiQk5yWXJFQlArL2IwVjFKbnRITlcwVVRvMU8w?=
 =?utf-8?B?dEM1cWZJdnUrV0RLbXpqdTR2TEtzRFpUVTNIbDZ3VUw1WlJsSXBWc1h0UHI3?=
 =?utf-8?B?eFE0Wk9vRENYS0pXOXJ0Vm1xOWxjMFNLcCtKOHB3MGJxOG91NXlLU1BmWkhp?=
 =?utf-8?B?bzdzTklZUVZGcFg0L1BUT2l6S0phN2JkRTV3ZFJIWEVBQ1QwR2tsWXRFOEox?=
 =?utf-8?B?TTd1TkFNQlBvZ2RreTk3NjBwWkxyZjZlNEtZekJ0K3Y1aHNVdmhhTmd6d2My?=
 =?utf-8?B?OEI4MlJXWTMrbGJ2aEg5Rlh5bWlKd2VPQjd5OXVDNHI4c0RyM3pndWZuSVdx?=
 =?utf-8?B?QnZJSElOQ3BnUWh2c25idmtNekFlOUl3VVFyU3oya2lmekorNGxvbmpnNGxH?=
 =?utf-8?B?dVpBYyttWlBkcjZMdWFFcUVYODVzRVNSUFB1OG5OVUt5dE9iRjZ5S2l2T0h2?=
 =?utf-8?B?M1NQOGxZeFVvRU9GUFlKZFB6S0JDOGpBVGVWeTdpby9zR0R6Ymo4bjJaQnBV?=
 =?utf-8?B?WnZhei91a3N6TWlSaUUxYkh5c0c2VnNSM0Z5Yk4xNklMcjllaDZaaHdqVGo3?=
 =?utf-8?B?clZNZ1BTdStuRm93Sm5TV1V1UXV1NEZyMHE5K1RTWkRDYzgzdkNOM2tCN3hC?=
 =?utf-8?B?TXpaNSs0QVA1QmZ1b29Zd3ZFZ015cEwvWjh0TEMvVDVvbCtRZ2pNWWcyeC9E?=
 =?utf-8?B?cURVVmhEdXdEQ2EwcGlDNzVTRnZ6UXIwNEFZM1V1aWdGNDc3QVZrZU1lWHhS?=
 =?utf-8?B?SW1qQ09FZm9vSEYwQ1Z3YmtvYVBMbjhOdmpqcTlxWmJWQTliSlQwek1LTEdu?=
 =?utf-8?B?ZW9mNGVtbEtQVURCZEZvTmtTV2hSOFBvMEMrSHZmdGdlUE9KMDJrQWV3TUtU?=
 =?utf-8?B?Z0NMOFF3bk4wd3RDUFdMaVVvL3JoV0ZRYlRhMThMRjA2cU1jYzdBM2kwYUJW?=
 =?utf-8?B?VGdjMFJJUThlOFE0RTA0d3duSGFrdnhYbFdHSVdMRWFvUnFGaTc2Vkt6eHZk?=
 =?utf-8?B?N1krMVptNVR6bFlmM1dkbXJUaE5MTmthVC9xM2E5ZlVBYTMxTnFSUXNWN0c2?=
 =?utf-8?B?M2RGOUlWR2ZSQUpIVVVGdFpnRGJhSmplQnc5TE1ReUdkYWdDQkxhempDZWJo?=
 =?utf-8?B?QndEQnNlcVcxVXZxczA4dDdKUjB4OWZYbWVabW93bytVMlkyVkliSGJSRjNU?=
 =?utf-8?B?MXdtdDVnRjNPOUJjZnJ5eTdEdlg0eVpmZDZMeUxEQWVDVUplRFhaVWpiRHNZ?=
 =?utf-8?Q?uajlHAz1m0C95flmobGGBDp58?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40952a2f-c1e4-42e0-56c6-08dcf7ced141
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 04:04:42.9556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUt4b9x9bTH1lnG/2xSTOIkOcOv5xvF/RakrH1VmvZykzJ468H3Q7f25ZXzW3ivp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6582
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



On 10/29/2024 3:48 PM, Li Huafei wrote:
> Fix the potential NULL pointer dereference on mem_ranges in
> amdgpu_discovery_get_nps_info(). Additionally, assign the output
> parameters nps_type and range_cnt after the kvzalloc() call to prevent
> modifying the output parameters in case of an error return.
> 
> Fixes: b194d21b9bcc ("drm/amdgpu: Use NPS ranges from discovery table")
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo

> ---
> Changes in v2:
>  - kvzalloc() call uses 'nps_info->v1.count' instead of '*range_cnt'
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 4bd61c169ca8..9a0b1b208a9d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -1757,11 +1757,13 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_device *adev,
>  
>  	switch (le16_to_cpu(nps_info->v1.header.version_major)) {
>  	case 1:
> -		*nps_type = nps_info->v1.nps_type;
> -		*range_cnt = nps_info->v1.count;
>  		mem_ranges = kvzalloc(
> -			*range_cnt * sizeof(struct amdgpu_gmc_memrange),
> +			nps_info->v1.count * sizeof(struct amdgpu_gmc_memrange),
>  			GFP_KERNEL);
> +		if (!mem_ranges)
> +			return -ENOMEM;
> +		*nps_type = nps_info->v1.nps_type;
> +		*range_cnt = nps_info->v1.count;
>  		for (i = 0; i < *range_cnt; i++) {
>  			mem_ranges[i].base_address =
>  				nps_info->v1.instance_info[i].base_address;
