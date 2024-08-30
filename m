Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB2966405
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 16:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEC410EAA0;
	Fri, 30 Aug 2024 14:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xnx4NZHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A960E10EA96;
 Fri, 30 Aug 2024 14:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrnW1MchDRqEdaKg0OwAE4YY6plXkSD2M8InovEnv1FqTI+Vp4u+NfEtUT3+oMmW+G5FvqI59jNR/fcr3v9N0+Lip+QCbSoWZU9F8zk1Jk1GjWkT0IxcZZgWBW3I+5h1R2sZDm9eoPD7fkRKCVFmgB1g2e/TzpuYAPQaIsIou4hzr5De5CrHgN/oqOp4ctS6/TY+aZ51TzCCLmwLRyZ06T8RYp1Rwt8Ndqj1CIetay/25KIx/WvGyByLSfDoC9LwIKeEij/5HgZizgVU5mN+5vopXHxeRnQYv0HXu8eF4yTxY51GWaom/rYDUaxDtzwkM1vaOJ3Cb4v1MJc972xNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRHTt16vzNbVVulm9SOsy3qCKkI5SiFCMIs/NJtJpvw=;
 b=owsmURdyyvrdvSy6H74sbP4YbYJmwyBkgzdfNkwD0SurJ9nPoof70s5KbN3+Ron7FttXnoRyJZUU/Lg4NY4kMGoEAcWFqh5uzsgrd3rN46tO7o5W/AumHa2rmcUUtYg4h5/i0vNCqQ7IVg5Wpt1Eb/+8Q18bPwO4RV5jELQvME6SYRnw3D2dha+p/ANcREkvPqGNDjRSDHZpzec7w40VmOpvBzMn9C7KhxlolVcLaeW7No4nxPXF7aw+G1cL83AcqXw0uEscEXfk9ONGEyc7WUpxGQYyVqcbNQomW2u1IiGKTl6DRh0YbVu2NpwC/bnAeCk4FcSQwiaoh672uffHQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRHTt16vzNbVVulm9SOsy3qCKkI5SiFCMIs/NJtJpvw=;
 b=Xnx4NZHIsaehX6ocbSJilF0DnPNzi+feOYNCYsU6GRtYxvVFo5kr/GF6HT4E3RZmN4o5zZGd0CMNbhYTlgSgOJOi7DFz1dcG30j8eVOPh0TURXpXSMYXPVsm+LAmqY+LEa11kkUP3UNh55iHW43dIaGpHOG/Lh/rXvNcqW+9yMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 14:19:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 14:19:16 +0000
Message-ID: <64f6b72e-dd00-47e1-bd06-0cd3ef972f8b@amd.com>
Date: Fri, 30 Aug 2024 16:19:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 2/3] drm/amdgpu: use clamp() in
 amdgpu_vm_adjust_size()
To: Li Zetao <lizetao1@huawei.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, felix.kuehling@amd.com,
 zhenguo.yin@amd.com, srinivasan.shanmugam@amd.com, shashank.sharma@amd.com,
 Jesse.Zhang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240830012216.603623-1-lizetao1@huawei.com>
 <20240830012216.603623-3-lizetao1@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240830012216.603623-3-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 0856e42f-b219-49b4-5607-08dcc8febaa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djJxdVlONzNwSHVWeVFYS0VZWllWaGtkK1N4UUt1dmZpVUFXcktCeWU5Mm5m?=
 =?utf-8?B?bzUrMDJmWEFDUXhPbEpIc2ptZ3J5NlJDeGZDdmN5VTU1NUkyUGV4UHUvZXU5?=
 =?utf-8?B?NGg5TUx1dEV6WlY1SkVDS29aemtnRjVFNWJDb3ZaaFNlYUZ5OUppNnBOcXAz?=
 =?utf-8?B?Zy9OL29yVG9XVmRROXRkbDMwOG82RlVaUmVCY3BmUXBPbldDaUNuU2FYNjND?=
 =?utf-8?B?dTZQbVBqcHVNU1BidmR1SEpNRE5TUGpjWmNEMTVqeUc2YnNTRWx0YndBbk12?=
 =?utf-8?B?S2JiS3Fvc3lrclN0ejlZdVZIWVpxSmt0YVVjZFZFYWZwRDltZVlGWTJuak4w?=
 =?utf-8?B?Uk5OS1hoOU9qL2lseEg3OFFHNXhpOUpFQUIvaXArTUZmc2VxQ0oyUlZWcGZy?=
 =?utf-8?B?VWNrV3V6NG93UHJsYXlJdVRTTlFsUDQxOGhPZUlDcmQ4M1dSMWJPOFY1UWVy?=
 =?utf-8?B?N2VvcDZxTUtxZXlqd1RJaCswaW9aekpZQzkrOWNwREhkWVBhb2JTVEtTQklr?=
 =?utf-8?B?U09rT0ZpR3UxdmdEelFWcmNBcjdGUU9NUEJlSndwYXNnanVJMStwY2NBenEy?=
 =?utf-8?B?ZkpmUWthMzZOak1GT1dJVm5ZZkNKd0I4QnlYR0l1K3NiRzcvK0paTGtYL1ov?=
 =?utf-8?B?NkEvVjkvcUxFbnNZRFdwWXk0L2JNUGpPUjZZa0g2aDhudlJITzNUcFQ4WW1l?=
 =?utf-8?B?Q043L0hMblRKY2gzUEtKcGVSYVR1aUV5djhkODArUVRickIySnQ1MVgxOS9F?=
 =?utf-8?B?bkFWUm9MVjc4V0NRM1hUdnJJQmZ3Rm1zdVMxOTEvbm9YVHppYUhFR0ZsRkND?=
 =?utf-8?B?WC9xcXl5UzNEY0tSWEFENDNvazBoQTN5c2t1Z1V4Nk5vUHZCeExNaWdwUTZo?=
 =?utf-8?B?S1dMbUJKTWp2bFpOODlaMXMva3N6QWVkMXdvR3c1N1ZLOHNIYS8vMXNHSmdN?=
 =?utf-8?B?eE1jdlBJUU5aL3ZqeEE0cmpCbDJjdUk0MXdsNlFYZTlLdi9maWRXQVd6MUFU?=
 =?utf-8?B?T0YwRitJVWsrT0JOZGgzVWNDellGbU5yR0FydURHczlnMjFzRUlRKy9xZDFz?=
 =?utf-8?B?NlA3VExEOHhtWGM2eDdSRm8vaFA0aHhBZGF4SytDeWp4WXQwRUZGUENvY1o0?=
 =?utf-8?B?SVNLaGhTMlV4a0hNMy9vRjhxSHFiSTdLK25qcjdWSXVEOER4cysyeDRXblA3?=
 =?utf-8?B?R1pjNlQ0TGJlVzExcTMyZHA1RnJzSzJKYk9tSnh4ZkJYWk1LeE5PNFRHUXc2?=
 =?utf-8?B?RzcxazZ4UDVtTFNra3hTcWtUWk5RRDAySFE2ZFRjQTlLeHQwU0Y5eXpnNUp1?=
 =?utf-8?B?c1FQdnBBK0lmaEJyZDBZdTdpNThVZkgweTlpQmc3emhrbUVSSCtXN0xOSWhR?=
 =?utf-8?B?YzhLR1VsdzBNcnBwQ01laDh5aWcvdHFlbEtvYTl3d3locnJTcHBoTVJYTVEv?=
 =?utf-8?B?WmNFeTN0YTVzVkdzZmR4bkF3WFpWc2RzK25xNWlPT3BPdWg2MEdscWM1RVU1?=
 =?utf-8?B?S2VDUC9zd0xlMUlreENsZWJJNjdoSHJBRGswdGNpc2xYT01rcXdBVnRmUEdW?=
 =?utf-8?B?K3dWVWJqcHhmR2JxVm1NL1pnd09rN29LZVJJVnlVUTU1aStBQlhOS0htWUVS?=
 =?utf-8?B?ZGc2cjhPZXN5cFhkY0NETFhVT2J3a1YvOXhINnYydjFUTDRyd0QwNWhRUWdr?=
 =?utf-8?B?d3dMRlQ3RzhodExEczRZRHJqNkRTODJiaCs5c09VYXIvN3l1QXNJM1NJdTZa?=
 =?utf-8?B?dEJ2VWVnYWR2S0M2cVJ6MzMzTVQxRkRFMHpNNFhQL1gyTURvTlFNT0lJdnQ1?=
 =?utf-8?B?SUpUOTFYaFJDZkFQSzQycUw2VHQ4TkFPUU1GWS8wNUUvYi8yWE5tR0hlcTRT?=
 =?utf-8?Q?/22BhnQEBb03U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkNUS2R1TDA1T2YzdGxibWhERnVhWHdQLzVYdGw0MWtyTEZQeGUxRi9STGZl?=
 =?utf-8?B?cmZrNVdveitWaGlwQXp5bnNUWThUSkFEa2VtUnR2L2dUaTdTSkxNby91T2lk?=
 =?utf-8?B?cnFVMjZibC9ad1Z4MzVZbjVmTVo4elpzQnh5T2M1SkJ3bnF3N09kSzZreWFF?=
 =?utf-8?B?clpxeE81VWNRSmJhUXFQVlg0QzhaUno2Z0NSeFNiaVU1SmxVVUtmanNoNThH?=
 =?utf-8?B?S3Y0ZmpJU3dxaEUxUVc4dTllWTV1WndsdFBQcVlBWjNsanIvWG95MC9OMzll?=
 =?utf-8?B?V2ErWXpZV0lsUzFQZFhmNis3cWJKNzNVS2J4OHpySkV1QVRKQTB4R1JOY1hT?=
 =?utf-8?B?MXE4ODdPTkwxd0FhbHkwTmNEcUFWSGg5dGxhRXd2V1YvdjBoRW1nZXRZMnU1?=
 =?utf-8?B?Rml5ZWlpV3RWSE1ERlR3Z1V3TU1BSFZNYllVMW5DTlcwblB4WWxNRERLSkk4?=
 =?utf-8?B?K2daWk04S2ZXTmlVeEU2TkEwYlZSVnlRSUMzS0wxSkdKSGtoV29KQmtIbkZO?=
 =?utf-8?B?dTlLY1ZnOHVDdkN0UXIzb2gydjEvUWhldU5sdElHU1dpWk85UlJVNXZyelE3?=
 =?utf-8?B?NW9tSzMwZlQ4NVl4bjVjZDMvUVhSVnJUZHROa2doeGJwdWc4RE54YzZGWWcz?=
 =?utf-8?B?RjZsQlYxc1RWNzVLc0ZMUFdnUWpMejlPcWVCTXNsU0dScEY5enJ2dHhtaUEr?=
 =?utf-8?B?SndWTEZsOHBOQnNGbWhGTFBaMzVEYXZOLzBZVjZ0MVhXSTZiMzhjWVBONi9T?=
 =?utf-8?B?K28xSGRkb05NNnR1YjBDNytqbDV6aWpYNWx4d3VaWVZmQ0JCemRnS0M3b3RI?=
 =?utf-8?B?RlRIc0VXVm9ydHhFRXlablVqVUtkWW1Wc215cTVwYVNvL3hlWnplVFc1V2RQ?=
 =?utf-8?B?M1A0ZW5lMVZ3a1pTZ3JnZlhUdzVtMk9zeVpBVlQ0RXNCMk1nWGN1NG5Ob1ZO?=
 =?utf-8?B?ZkRwc2tBWmRJS0xvOGdDZmZTaDQvL1pFNmxrTUpPbllnTE5TRkVMbFloelM1?=
 =?utf-8?B?NXBUK0djMlAzUVVlQ1hIQk9nSTVjM0Q5YndqUFlvZDhCcWE1RS8yam90VHBt?=
 =?utf-8?B?TXg5dGdlOEFQVXBuQmRCajlnSUdjRUhSeStPc29FK1dNemIyaURIWko5UWU4?=
 =?utf-8?B?R1pTMExYVlArMFJGcmJqRFFWa2owd21UV2tRNXVHalUzcFBSOGxSK2c1MW1N?=
 =?utf-8?B?cDB0aW5YeHBuZGRvdzJWbXpxdVFPNjNHS0tnUUZxaGxrUjVhbXBob2FCSERJ?=
 =?utf-8?B?bU5HaDVzQ0ozVU5XY3NiWFdvUXlVZDVNWE00Q2MvOGRVSXEzMUc5Q0ZlVDEv?=
 =?utf-8?B?SGoySEhBdnlWZitEMWRsdHdpbWppUVlIUkFiY1FXSWUwNVRmN05UQ21nQkdo?=
 =?utf-8?B?NmdZRmc4eWViYmI5Slh0Q1lVM0lxVXdXc1lzaWNGZDdsS0JtWjQxZkcxTTVF?=
 =?utf-8?B?S2ZwWHFaQkpqeDV4K3RoZlFjdTFDTk5pOVNwOWNWenFkTEtxYnZpYU9kaFV1?=
 =?utf-8?B?M0kxSnRiN2EvTGQyQlFBZUhYRUZEcEZqU28vblp0Mi9lZnlucnQ4R2lDNUJp?=
 =?utf-8?B?MEpSVUorR3NUT3M5WVlTR1A4SjkxWlBrTjNEcWNuY3JOREI0QXJSY2ZUb1Jl?=
 =?utf-8?B?U3Z6SnlERDIwZlpJbExMUjZISW5MQ1JmbVluWjBsd3E2OXBYMTBHVmVaNFZq?=
 =?utf-8?B?L3ZLOUdPbGI1TGY4TkNCWTVlZGhmOW02ZzRTK0ZFM0JrenlHOGJIbDU3OWJV?=
 =?utf-8?B?UHpoK2RndDlBR2szZ0JoSmU1U04wc1NTNGJaT1JSb3k4SzBMNU4yampOVndm?=
 =?utf-8?B?RHBsVWFCSDlaTUFVZGZzSnRFalk4T3NIZUFLQk5Ed3RZMU12VFhONGJhZ0JM?=
 =?utf-8?B?UWNEUS9XRlJBUytHUUpKdy9la0F5N0k0RlpPK3hFQ3lOdVhPNFV2UHBFeVg5?=
 =?utf-8?B?bDh6L3RoVjlqVG5zZjNYOXlGL0NyM0FHQkJyWlVyTlNKQ04yenJVN0lRTGNF?=
 =?utf-8?B?WTJMLzljM3pwNXVkYTV0aXFPU252Q1pNVXZhd2tBR2tYODQ2L3NMTTg0WVBD?=
 =?utf-8?B?WHd2ZmdaaDJVMXJIZkdLNkwxVUphOE9ybXdTMjVQNHU5eUdubWUzeGxVZnpH?=
 =?utf-8?Q?o7O1fu216K3PNjFXP78CtV3KL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0856e42f-b219-49b4-5607-08dcc8febaa5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 14:19:16.1284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqxFEfIMR/58qhRDkPmG9u0su48QsfOZ4J3v6dla+j2dKNjk3KM+iVdMp5JLF1UC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246
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

Am 30.08.24 um 03:22 schrieb Li Zetao:
> When it needs to get a value within a certain interval, using clamp()
> makes the code easier to understand than min(max()).
>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

This patch and #1 is a nice cleanup and Reviewed-by: Christian König 
<christian.koenig@amd.com>

But as Alex also pointed out patch #3 is for Nouveau and not amdgpu.

Regards,
Christian.


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index e20d19ae01b2..40f9a5d4f3c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2224,7 +2224,7 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *adev, uint32_t min_vm_size,
>   		phys_ram_gb = ((uint64_t)si.totalram * si.mem_unit +
>   			       (1 << 30) - 1) >> 30;
>   		vm_size = roundup_pow_of_two(
> -			min(max(phys_ram_gb * 3, min_vm_size), max_size));
> +			clamp(phys_ram_gb * 3, min_vm_size, max_size));
>   	}
>   
>   	adev->vm_manager.max_pfn = (uint64_t)vm_size << 18;

