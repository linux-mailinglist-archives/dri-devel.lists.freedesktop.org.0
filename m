Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B6B59765
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 15:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7534910E7D9;
	Tue, 16 Sep 2025 13:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hgGM/QPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010064.outbound.protection.outlook.com
 [52.101.193.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D07D10E7D9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 13:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTsLisFPcotn6fDqzqmxMq7jJQzV2xoFZ1WWTtV84v8ZsKp7KdsxqsSrOrEUvQ/ueWyeKqmcVQLMPJOOV7wc1ND76KKlldP90rAUUuaGgeAvr9rcmD6AHbAsjyaaIzQ58vOKeYrJVEhZtxljlnEPciKXg36Pwqy02K6l2BMAmdZBtatEQmd7CnUlMuWYnGH0RBQT2oI0z1UrHN/hgs85WY3Gp2Bc/LVHRR53gHo67m1y14TGlS2EZvNhRISVZyGpQzofn8AqOt0knp29yKNPPFRFvuqm0SBvPb6ulYrNzPNzokSl1BurV4rpIp4aLbHp6GoFgYDSvklUnxllfBpZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JFsFHBb+7TfOA0v4xOHNRPBIyu8+/RphF92hMpnDiY=;
 b=eo2Fm81TuSJaKfFYqlXozlSCumomhk8WoL+ayKsYtYCu/QlchouU0+L+0vPAi+p5gkPsbAbvr4X3GKNywU1Xh0pVA0YulRsg+j48SS21Mv7UBFTDcqKdxx603HqLUKVpNIhb6ZH0it76V0nyBu4CmRZuT7GvUOuxfFGMcNV90mMtijLVhxXuJ7/CuNm/wZX3Q8ngODmSlav90XswHiTagXV5DVb+/+ZJwLlOjLm1K8rCfOgokSq51flIEJVTJen+ICZjAHI72aCgKsNqceh60xgw4KtiS0cJvqqBT3taLHJF0CF7OPGbFSZV6MkjIjdv7QODa+I4yxINDYUu9Ie+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JFsFHBb+7TfOA0v4xOHNRPBIyu8+/RphF92hMpnDiY=;
 b=hgGM/QPqq+mt+TWgtbzWu/D2pCDOGZEZIHurxMjjNMF2B8KwwhIrOp0/KjxPLbEPjGy5FdBKF2Ofs3r1J2eoZM0wh+pamoyvTW3r/XsSgM6dSpcB5XMZsyQdwWP2tAL+JTSXK8fVxwPyBYULocz/RSFQylyiRXTfRYhobkA41kc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 13:21:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 13:21:15 +0000
Message-ID: <d609a298-5a3a-4e4a-8992-868cd02133b4@amd.com>
Date: Tue, 16 Sep 2025 15:21:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] amdgpu: add support for memory cgroups
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250902041024.2040450-1-airlied@gmail.com>
 <20250902041024.2040450-15-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250902041024.2040450-15-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 16fda615-4701-4dfb-15a7-08ddf523e9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWE4bjlkOVpjVWtqWW1yK0xjSXdjZWl0K2N1OHhLWWE5QkxrWGY2UXVyQWlD?=
 =?utf-8?B?bExxZUZCZDhPa1ptM2J6bUxMMVk1VTFFNVNqRHBlZnJwcWx5M1FDVTI3dEhI?=
 =?utf-8?B?YmR1UGVodVI4QzZDVzNvbU0rcTNBRlA4WWF6a2tSZGFWSmhOMHZPTEVJemdI?=
 =?utf-8?B?Y1BobFBVZWxqUlpHNUwvaFdOWlQzemI4RXNsdzlyaHBCdUF1K3c2ZCtsUEVZ?=
 =?utf-8?B?TVZXKytzVnBPa0lTTEdYQnU5TFYyNzV5SXNaV0VWWjdxWVN2ZlZTUlhSM3lv?=
 =?utf-8?B?d0tKbzVFMHduNzh4YmFXL3I5citlSzJFRnBqSXpXQ2hGRy90cE5Md2NKOU1D?=
 =?utf-8?B?MFhBM0pvbE4xcHJRZ3gvMG9XdUVNNjZITHNWenFwRzlMRHlEekh6aUhEeVR3?=
 =?utf-8?B?NFk5bUJrTWxWWE81K2ZzSFVaK3ZlblFRbHpxR2oySEloeTJBSzhHcjk4MDh3?=
 =?utf-8?B?RFBaQU1tclpUQmJNUzUxYllEeXdyZEE0OXUvSzIyK0xLNzlPSWtxN3hlN2xG?=
 =?utf-8?B?MGZqdnBNR1QyNlppZTdMbmorZ0pOS0lPVXJHRU05SXlPcU11QjByUXNEdTJl?=
 =?utf-8?B?U3M3TEk5TGpERjFtN1RiUTBNUWdqOEdLcEIxYlA3OHRLbERoNTFzOElQYy9t?=
 =?utf-8?B?d0tyRE5wMTZiZDNvbk5pc3diRUdwcm1leFpOd2lxbTRObVEyK2tXeFp0MFkz?=
 =?utf-8?B?SC9ZN3h6RW5EcFQxL3FqUXkyL0JjeEU1b01XaWdsMTBaZlFBek81STBhekdD?=
 =?utf-8?B?enBzbnpqRmM2TkNPaU5WU1NIRXd4TjFOZ3Y4cVRBQklIcDBUeXVkM1J0TkIx?=
 =?utf-8?B?L0Z1bXhDb1NqNVVEblI3cEZnNWZzMFdCVHpFSll0Mzd6WGZUZ1VSeFE5OW5i?=
 =?utf-8?B?TkNYZlFUTEpsbmNmNXpWM3ljVGdyUks4WGRLekIzbDhuaDZDUVcvZkNKbGVU?=
 =?utf-8?B?MURvMjhFeTFTRzZ4ZE1QS0ZxL1NhNWpodElXcm51S3lRMDl5LzE1NktrdzNJ?=
 =?utf-8?B?T3QwWGRENURJczJQMGtUM25sRFg1Y21KSjkybHhaMVZZR2tueFI3VU5hamVG?=
 =?utf-8?B?Z0NFYXZOSnFVRjVseTlpcWlPWktHOEhwbnVmVEl1NEM0eWhFekg5MjBBQnhC?=
 =?utf-8?B?OTZORVJCYlJMcHB4Nm16d3VlMHd3UDVFKzRLYnBtUzFpaExsUnd5dmhZakd6?=
 =?utf-8?B?Q0tDV3l0OEQrTEJ0QVF2RG9EenBlNzNtOEVERW40cjNuTnlQWWgzVmxwSHN5?=
 =?utf-8?B?bVcyNjg0Unc5b3JHYlNaM2pEVGZ1UlFVUjM4em5McEsrcDVCYlMyQThuQ1Iy?=
 =?utf-8?B?ald2NHQ5Qmt4OXd2ZVVyRE16ejFNS3poblF2YnBGbXRLRXlxUHkvSXY5Wkpl?=
 =?utf-8?B?dmN1TUkzaGx3eStxL2d6T3RULzdPY0JkYVhPbjZGMmVLRjcreDQ1OUVBbTgy?=
 =?utf-8?B?eTBqVWlBalRlY3BFenhvS1NxZFlUU1FKZG1ndG1NZ2haS3p0cEhqSUFrSGJB?=
 =?utf-8?B?VE5Ka2lmZ3JLSnJsaUdRY2Zqam0vSnNSQkgxWS9lTm9YdXZEbmJCTm1zWmsr?=
 =?utf-8?B?SVl6SGZoRWlhTVBxUEgxaTNaR2d5OGtseDJLNU1aWFBkcTdjSGl3MFNRUDIx?=
 =?utf-8?B?T0NzUmdoeUN4clh6czNLa3hsWVVrcTM1ZnNoLy9UUGs1eHlRQnRFUWZvaWpR?=
 =?utf-8?B?WnM5VjE3U0JCb2tkaVZWdlZzZ0U3b08yUHlYRk1LYzUxQXFIZ3FVdUVJNXRs?=
 =?utf-8?B?Y0FVYm5May9SN1J5UDNJb1JGU05NVTVTODlIVE5DNkJHTTZIQ3BCQU5oc2pO?=
 =?utf-8?B?ckhTY3Z1ZkxXTWJ4dDhqS005Q1RtU01EZnFZMWNUQWJVeE8yRFd6L1pzZ3B3?=
 =?utf-8?B?WEhCK2xsTjlzYXo2ZUJ0amEydXdkOWswMGtqeE1GbHJQeVlHUXJYZmdCbzNt?=
 =?utf-8?Q?Zgink00h7Ug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Kzc2Qzk3QTg3cDhDZSt4QjBLVWNXbGJtejRxR1V6dTdzZ0lud2Y0NHZGNXhh?=
 =?utf-8?B?NEw5dGJvV3MvWXB5WHpBZEdyMjVTMTRsM0ppR1hRbEdnM2gwZndIQW01bXQw?=
 =?utf-8?B?TVh2VXFwYmRCL3N4bVE4NUM1Mms1aytqTCsxdnNXT002NzY4YnhjcmtPZHJz?=
 =?utf-8?B?a2paVWhzcWpvLzFmeXBmNk0zcytPSi9SVy9GVEpLVys1K0VwTmFURkdwSU9i?=
 =?utf-8?B?Q1lEQ3ZodmFVcjRSeDUzaE5LdGpwOUw0OTVsb2FJaXF6QnFhSTd1blY1QnhN?=
 =?utf-8?B?SlVrMVJZcVJNSlVhdnN2QXNzeUh2Zi9jRjJVdldhUVM4VE9CR213bElNVjMw?=
 =?utf-8?B?OFMvZWd1dGVzeU40VUVoVlhDNWtnTW5FZHYzdUh3OUF6VGYrcEE4MExkUmR2?=
 =?utf-8?B?RTFBZXVBemNQUCs0NVB2WEIwQVpteHlUWGJTUVN1bWRFWXZSU2ltZ00zamZC?=
 =?utf-8?B?Nnh4RlFZMjZzdk5abGVyWFJtVjBYcnZva0t3S3l0NzVmdVJLNU1wOWFibnBk?=
 =?utf-8?B?eU1hSGhtUVF3NzBGUUV6SmowbzlmZjNXUmlTdXovMEhKZmt1VU5tY2xCcGI4?=
 =?utf-8?B?K0F1VWt3MXhBMWllZmJYeFFxTmtrSHFLTzBCOU1qTFBCUGVyOGx4MUJWSVBk?=
 =?utf-8?B?eHkyVXVuNlFIUldDTkgwZW1jVmRDbEVvZWI5REFLNlBpRHpCcUx5eWdlRWox?=
 =?utf-8?B?ZUF2ZndiSUh1Wm5ablJ1OGIrT3ZRNnpJSEJnczNxcVlzaU5MWmg2WC80Vis1?=
 =?utf-8?B?N3ZIbDVzMW9NKzJ4d3NRaGJYaVZ2UThZSHlqSkphb0J1KzZDaDFTZnFkeXdH?=
 =?utf-8?B?dzNJK0c3VTlLNWg4cEZYTi9GWHdHaUV6ZVBqYk5XeFBFYTk0bmtCWUk3djRt?=
 =?utf-8?B?ZytOcW1BL0FKUkJwQ09zSm9laVNoYlE5MllnUTBNa1VOZHVaemF6ZkVmWGZq?=
 =?utf-8?B?eGkxZU1OU1B4K3RYK1MrZUlGbk0zdE9rOHh5V2dvc2V3emRVamRLZnpsRTdU?=
 =?utf-8?B?MEZ2VnZhMUNsVVVUaVYxckl5Y204eFh6OHpSSGVsTmE5b3V6czBNdHJaRkNz?=
 =?utf-8?B?UnVCNkszeDVMVWE2eGRpSkNhZk9ZYmQvNC9KamJMTUcxaDJzZ0RiSW5NNXJZ?=
 =?utf-8?B?K3dYcjI4SWg0L2FSNUI0cWdpbDRod2xLMFY5ZHRPcWJHRjRPNGFraTNoYjhy?=
 =?utf-8?B?RHN1V3RFeXNabjV1UUduQ3lvVlJ1RDdNYVJpWGNNaWFicnNCaDNjWm4vSUpV?=
 =?utf-8?B?eFFhR0MxNEpwN2haQWhvTmN0WitvcDNBYVRTb1pHZFhEVWJqZnYvazhhTlY5?=
 =?utf-8?B?djAramhCbXpZeEtybUdJcDVEWGd2UmFJSWswbmdzdmV5aDA1VlhxaWhLZllx?=
 =?utf-8?B?MzdkQkVHMVJZQW9OR00wZENmVTNrNkZXWHRCdWplV3B6azJqaEw0NFN0ckdQ?=
 =?utf-8?B?T29UUXU3RzY2L1Y2VzRYcUhmV2Vhek9MLzEyUm96YXRqUXF3dXhlTCttTkxj?=
 =?utf-8?B?a0Fxa2xrNzFyL1RQclBWMW5EVzlRMHkzeFBYYlMxc2Z0MXV2c2Z3R3dla2dm?=
 =?utf-8?B?dHdudGRzMzRCeFU1UXk3TnBWSHh0TURlLysxY1JSUlNLTEsvOVl0Vmltejdj?=
 =?utf-8?B?R2hKemR1c2NmaWdrSmJSS2VHNldtU1dFcE11MlBwaHdyZFA1UkdsaGtRS3cy?=
 =?utf-8?B?cnovUENsYkp2d3dHbW0yazVtOW81YWpuOUdTVHF6dUlxUU1JK0ZhL21RaFNG?=
 =?utf-8?B?RldGeG5DZlNNR2Q4QUtFaVVDRDlsY1RyQlR3eHQzN0pYZVgvcU1CaUZEWjQ2?=
 =?utf-8?B?WVhidjNrUnNZR0RHUG1sRllidUY3cnRuQWE0R1l6US8ybTZPSDEyKzh3K1dz?=
 =?utf-8?B?SnNEU0xnV0NJTUxjUVFlMHRJRkF5ckg1RjFHTmtJS2thTDBoWDJoYVk3S3FR?=
 =?utf-8?B?eWFxRGJvRDg1bkVTenJHa0M0SS9MZHkrMHJZQUJ3NzNpaGdWRVFSZ0N3Y1kv?=
 =?utf-8?B?Z2ZkWFJlMG5kOVg2aGRhVWhpWk8vWjhzNi9YRktlN3NxWlUweWJCWitVdnJR?=
 =?utf-8?B?K21QTjE4NGlnWUpvNFJMSjkxTkpYSFFsWWROQ1IxVjVRcStDc204azhkcHBn?=
 =?utf-8?Q?RVWEXgCdRhHrBDxaHunQaAB33?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fda615-4701-4dfb-15a7-08ddf523e9bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 13:21:15.3002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNEjD8TCHxwiCGTlc5MmVbCpwK5JTSx+MumyTcv/tGBEM+MqGIYm6PsrGDyrEmBY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565
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

On 02.09.25 06:06, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This adds support for adding a obj cgroup to a buffer object,
> and passing in the placement flags to make sure it's accounted
> properly.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 +++++++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  2 ++
>  mm/memcontrol.c                            |  1 +
>  5 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index d1ccbfcf21fa..a01fe7594e3a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -198,6 +198,7 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>  	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
>  
>  	amdgpu_hmm_unregister(aobj);
> +	obj_cgroup_put(aobj->tbo.objcg);

This should probably be in ttm_bo_release() instead and passed in as parameter to ttm_bo_init_reserved().

Apart from tha looks good to me.

Regards,
Christian.

>  	ttm_bo_put(&aobj->tbo);
>  }
>  
> @@ -225,6 +226,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>  	bp.domain = initial_domain;
>  	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
>  	bp.xcp_id_plus1 = xcp_id_plus1;
> +	bp.objcg = get_obj_cgroup_from_current();
>  
>  	r = amdgpu_bo_create_user(adev, &bp, &ubo);
>  	if (r)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 122a88294883..cbd09c680d33 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -159,7 +159,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>  		places[c].mem_type =
>  			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
>  			AMDGPU_PL_PREEMPT : TTM_PL_TT;
> -		places[c].flags = 0;
> +		places[c].flags = TTM_PL_FLAG_MEMCG;
>  		/*
>  		 * When GTT is just an alternative to VRAM make sure that we
>  		 * only use it as fallback and still try to fill up VRAM first.
> @@ -174,7 +174,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>  		places[c].fpfn = 0;
>  		places[c].lpfn = 0;
>  		places[c].mem_type = TTM_PL_SYSTEM;
> -		places[c].flags = 0;
> +		places[c].flags = TTM_PL_FLAG_MEMCG;
>  		c++;
>  	}
>  
> @@ -654,16 +654,21 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>  		size = ALIGN(size, PAGE_SIZE);
>  	}
>  
> -	if (!amdgpu_bo_validate_size(adev, size, bp->domain))
> +	if (!amdgpu_bo_validate_size(adev, size, bp->domain)) {
> +		obj_cgroup_put(bp->objcg);
>  		return -ENOMEM;
> +	}
>  
>  	BUG_ON(bp->bo_ptr_size < sizeof(struct amdgpu_bo));
>  
>  	*bo_ptr = NULL;
>  	bo = kvzalloc(bp->bo_ptr_size, GFP_KERNEL);
> -	if (bo == NULL)
> +	if (bo == NULL) {
> +		obj_cgroup_put(bp->objcg);
>  		return -ENOMEM;
> +	}
>  	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
> +	bo->tbo.objcg = bp->objcg;
>  	bo->tbo.base.funcs = &amdgpu_gem_object_funcs;
>  	bo->vm_bo = NULL;
>  	bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index c316920f3450..8cccbe62e328 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -55,6 +55,7 @@ struct amdgpu_bo_param {
>  	enum ttm_bo_type		type;
>  	bool				no_wait_gpu;
>  	struct dma_resv			*resv;
> +	struct obj_cgroup               *objcg;
>  	void				(*destroy)(struct ttm_buffer_object *bo);
>  	/* xcp partition number plus 1, 0 means any partition */
>  	int8_t				xcp_id_plus1;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index f71431e8e6b9..a3fa28e5a43e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -151,11 +151,13 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>  			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT |
>  							AMDGPU_GEM_DOMAIN_CPU);
>  		}
> +		abo->placements[0].flags &= ~TTM_PL_FLAG_MEMCG;
>  		break;
>  	case TTM_PL_TT:
>  	case AMDGPU_PL_PREEMPT:
>  	default:
>  		amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_CPU);
> +		abo->placements[0].flags &= ~TTM_PL_FLAG_MEMCG;
>  		break;
>  	}
>  	*placement = abo->placement;
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 3d637c7e10cf..e4dc0cc43bc9 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2722,6 +2722,7 @@ __always_inline struct obj_cgroup *current_obj_cgroup(void)
>  
>  	return objcg;
>  }
> +EXPORT_SYMBOL_GPL(current_obj_cgroup);
>  
>  struct obj_cgroup *get_obj_cgroup_from_folio(struct folio *folio)
>  {

