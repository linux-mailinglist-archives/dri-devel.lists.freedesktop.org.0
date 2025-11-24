Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C02C824CC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 20:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D2910E253;
	Mon, 24 Nov 2025 19:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NHFIixWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011066.outbound.protection.outlook.com
 [40.93.194.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F410710E253;
 Mon, 24 Nov 2025 19:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epSVjx+dn1b18EgCTwWduGL/5wxDlKPFkU9LgGgUGMTtvNlNkJ+dpl9mFQlfEmJeHFmVp0VwcrVEoavtaKjdsVvJuOXdDqK90sKHoitAZHDqjlz59e2P4RsorGZ8JJjweX6fovPZvzOHP99k1eVLykMEYpmFjjZus0YZs/tidndnDrBEwU2r3jas15X17uc1fkMQ18yBSCxkSSwhyjtaZbhIqXF+HfH/YU/r51Ux2oZHfeT8W96bWlT6+LbzQnLeQUBbLflRxUe0uM3/++d0xcJYdeRvXT2YGuWfqfjiIxupue4E7WaBJqg+I2iTZGLIeasUWdxwxVYLwcrIP0oT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lV0yAPoPF+TcPqa2bIoJGAe995M2Sktv+C1HhXbUwyE=;
 b=E9wToeAnu1WbJMk2XkMD6uHLt3VKFiUFGyYXSgzSb6psQDZ8SWdn+18635kaIWT1HieV6zfg6Lxc+APsAldpvHPOLXOdTqwi90fyIy17v/uYgmkGQUe87WJmk0TOMIzjVPFOMiAFYOuNpisb+NJXr1oyx7cQWkPVyWFMKB83dk7yt4fk3O30XBALdm+/hk/NiKObffqx+ee+hrHUK5pJuxxCP0YzY5VMDp82yfXf+EiZV6kZ8a75FowW+J0QC6f8PGMCtAraeIwdpqmcSNT5rRqQAnAS8b6KQy2kIpc/NXtHCBn3ZaM3gwNXAdYc06bbybPp0Ve5Wbu1dIl53b8rxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV0yAPoPF+TcPqa2bIoJGAe995M2Sktv+C1HhXbUwyE=;
 b=NHFIixWhxxVD1+pu+QLMJDdUKRFfBtnEgfrPgkY9v6gE/fgOsqrf/aZhYio3hBPr6GNaXkxAM8p3omFcXBJt40La/hdC+DjjVspMR1QrjI1wMiKRU9trTfoXji8Lg3ZXS1SOkXdzN123D2+RA07lzzm6ZprqlDJm/MePILaAoVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 19:25:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 19:25:13 +0000
Message-ID: <a4ee8918-d647-4028-affb-0bdc202cc183@amd.com>
Date: Mon, 24 Nov 2025 20:25:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu: clear job on failure in
 amdgpu_job_alloc(_with_ib)
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "David (Ming Qiang) Wu" <David.Wu3@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251124163615.6388-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251124163615.6388-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 1363ebd5-f55a-447b-87b6-08de2b8f30c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDBCdTlneE5DTjhGZDFqcWordTlubWJQSFNPbndtUUthNzAraDBLNzZGSzF3?=
 =?utf-8?B?Skx4RWZCSEtpMUtLSGZmaWVSN2VBUk5UeFRpWUtZTkVtNWJadFhxa0Fqck93?=
 =?utf-8?B?Mm5BdCtuRnVuMWdUMkFuWUtiN2twSm9TL2txTkloQzE1d2hvdE55NTZWQnBv?=
 =?utf-8?B?dmxWZFkxdmtXd1hwZ3NjeEd6VGdKenRldllraHVQelcweXpBNDNwK1B2L0Jm?=
 =?utf-8?B?S1gycUtGajZqWG43aVJpUEpzTkJ5YVhMUUlEb3NmZFJjUko2UTE2ZmdMdEU3?=
 =?utf-8?B?S0g0cHp4bGM3V0ZXRUZrNWZ6cDNZQjVNNFVxb0pVUGtzS0NoSExlRUsyOEY2?=
 =?utf-8?B?MkFIclRJWjJLdjNoTG1IdWV6Y3FHQThFN0pISEM2T0taZGR3dWxLaWJGR1Fy?=
 =?utf-8?B?NUdnU2YwelZCOEhJd3JaUmFQZVBJUnF2Wi9yOG9Fc215UCtsT2FQYVk1NmhV?=
 =?utf-8?B?OUlwaDdKUGg1d0JlLzJYZ2lwZW9UMCtqMVZrbEJRVnczMS9tbzRPek9SVWNI?=
 =?utf-8?B?RkhFN2FSRUhYVW9WQmtta01iV2U2RytRZDFETUZVTkF0UlZWNWh4SkhiRUJN?=
 =?utf-8?B?Y0E0VkVlcXlVRnNkRW9FYncvTDJNNjAxS0lvaXZvK0x2Vm9pcjJ1d2ZHS0g2?=
 =?utf-8?B?TlRrWnZCY21hWHlzUkJzbzk0aUNQMzFza2c5am9nKzFqT2UwKzlyQ3Zwa0hE?=
 =?utf-8?B?L2F0TUIzWkJNTFZ4aTl4RFZaNFhMTGR6SVlMdGh4SjlQbm5EQ2pRWU9nblJl?=
 =?utf-8?B?M21YRHl4YnB2dmswamdTSjRra1g5TXAxb3ZwYllUa1VYMXVBSjB3S0k5RE5L?=
 =?utf-8?B?am84SUJvZVB2K0YrS2V3VTZ6Q1BYa3dhRHpoVnBKU0MvVitLWHd3bkZVRS9K?=
 =?utf-8?B?UktuNHVSR0hYcWM4dmhmUEJtT1pMTjE0NThaUFZvUmdRK2tQYi9LWE1tVnYw?=
 =?utf-8?B?SFF5RGpaSi96Q2VsUFdkb2pIRzEzUlQ4MThjL1MyTTVURHkrUUlpM0ZaMWJs?=
 =?utf-8?B?TXFHNURFRWdMTThabWFWem1zbjN4OGhFZnhGTU41WE5meHdoNGIvSGNMK2wz?=
 =?utf-8?B?d0E4ZlN1MDhHVitYSmtkSHFYUS9yd2hCanhvZjAxMEpaYmVwUGFYMW5qYXpx?=
 =?utf-8?B?Q3VBckhhRFl5Wkx4dW9qc1Y3QkpOb1lnVEYreHQra2EzUXpEZFVDY3pHdlVr?=
 =?utf-8?B?YmxEQVExb0JMVGpSZVNPRXZob0VCN0M4QldOQkNSMHRRSDdTRG5wS3BPTy9C?=
 =?utf-8?B?YWtvang5bEphVUVhNkdoN2tvTWxLMEJoWCtJNHZYOVF3ekNxL1JnSWxNYlZu?=
 =?utf-8?B?Q0dKSzFTUG13QS9wUFVrS3ljZHl6M0N1VUJDd0ZqaW5ZOHErZ2UwQ1RZcm5j?=
 =?utf-8?B?K0UzVytWU0tlTzVXcGZPT3VvNVpuL1lGSjhzMUtyMHpRUzFOV1YvcnFxOG5n?=
 =?utf-8?B?UHN4N0pNM2twS0FiMG1aUDFwQ2FlK3FCNTBHVmRSZmxLdkIzUVhnaHZLeDNz?=
 =?utf-8?B?M0VTMkFrMkN2VGdrNGY2Y0ZzSnNId0lDT25JRlB3bHpRK3hFbktQc0t0OHVn?=
 =?utf-8?B?THBNZzRhWVVWM0p4M25zMzBxa3dHZHFvZ3V6UUVZbithU0lqRXVaYkZJYmU5?=
 =?utf-8?B?UUEwVHVzVmVUZk9JMnpUdGJVTllzSGkzRitFN3picFRzbnhyOFZnMjlhczJH?=
 =?utf-8?B?Vk5ONjR3WU1LN2w3YXNvbndDcDlQS0RYRCtJYVIzSWZENjBITUg3NTIxQjVw?=
 =?utf-8?B?RWRzeUNNWER6ODdGeHZWdHJmT1VsbUg3OG9xNGZnWS8zbE43S0ZJSGtDL0hz?=
 =?utf-8?B?UW9xYWNFbDhHWEt6amJNZjlBQUF0WUdmOFRYNkk3VmRxSmJra3cxa2QvNjFY?=
 =?utf-8?B?aTNrczIwc0t2K0ptWU5wUjRJbDVqdTZiL2h3U3IrZ1RNYlo1bXF5ckxwS2lC?=
 =?utf-8?Q?hYKYHgrEki2cyB+U3qYCr1I0VJfoplNo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHVhNWpDL1k4YUlvNGx2aStqSjZ3NzdsSlpOSFpDODAvbGJpem80MEtIZVdT?=
 =?utf-8?B?TFlsS2FNODRkSTRNalovaExxMndzTGhybit3VWFsTjlua3AySzA4Tk1RUTlq?=
 =?utf-8?B?Rm1SLzF4TEkzazE3amxQTkdtVkRvRG5oQW54RTliN2p4bHNFNER2cU9RQ3c3?=
 =?utf-8?B?M3VWeklmUWNNQmtEU1E3ZDJDVHJvemtxRCtGYW5HdlV3ZFl5Z3IyWEtHOWx6?=
 =?utf-8?B?b09QZ3c0MmZTd25aQTdQRmw1TytOUkExbjRJN2VFbE8vZ3h1SG41VjdPcm1H?=
 =?utf-8?B?T3NvS1dtVDI0SWRBS0NPMXdsT2NlMCtoSk5mMTU4Z3RibjE4KzV5UTZ2Wmp0?=
 =?utf-8?B?SHNoY0NNMlpKSU1oQWw4WGVsSE9nZGxlOWFPZWFjVFc0ZXNtSWpxK0h5SThS?=
 =?utf-8?B?WXNsR0pLOVBrVzFKMnlZOE9PQU1Cc2Fjdy8yeU9FaEh6ZVVLcDVJbDA5VUFw?=
 =?utf-8?B?NnVYdVJJV01QTzlpbGVZNld6QzdPUlBwYUZNT3hLS3VxYm91UEtmc0doVjFk?=
 =?utf-8?B?VnZDbFcwSDdxeGdXQmlSWjdiZXQvMkw4MzJGVHdTM2NCNWVUa0txYm50NjAx?=
 =?utf-8?B?MDgxdjJ5ODdDa3ZXZnJtQUNOUmtmdUZqMUNHY2NWRGE2bU9jOHMvMXZPcTZM?=
 =?utf-8?B?dHZKMjJnTnlvSlBPWWhTR1V5OWZ5UXJJUS9sQkRnK214M1hGYnpOc2tLMFE5?=
 =?utf-8?B?bms5N3QzSmp1dEt4NFRsNk96L24rWVluNHRtZldZNlFaMS8wWGNJTUZ6OVlL?=
 =?utf-8?B?Z2pqcE9keEdKOHZxVkh1VzBpWjcycnhOTmh5WWhQcjRVM0lDZi9mMEJUcitj?=
 =?utf-8?B?VWF0TU5uQXRNQ2daR1o2Tmo3dDRjemRXOVB3bDlseE1Sc2xVeWltZnh5RDBn?=
 =?utf-8?B?WmgwMEZaTmE3TisxMVdFQzZrcFA5NGFkSWhCN2o3WWo1RDg5ZzVxbnV4RUlD?=
 =?utf-8?B?Znl4SVhGb2lwTy85UDFleUJ5U0pSeW4rQlB5cHZmUENaWVJZQklhTGpBWEFo?=
 =?utf-8?B?UDZIbzBoL1pSWC9WWmFPanRuTDJCOHVRK0h4Tzl5TnJuUDNLeGhUZVNESHVO?=
 =?utf-8?B?S1pQcXJZQk1hbm0ySWZ3V0g3bmlyUXF4TGM0eHdJNlY5TzZqRjBna2h6T1NP?=
 =?utf-8?B?Wm1RU3Qyb2NYWmFsNit5ekdkSGtrMUhDM1E1MUU4QVJhaU1SdFlsYjhDQ1Jp?=
 =?utf-8?B?dEovc3RNZ1poREJXK3d3OWFYUVo3WFgzU3o3S3d4cmgzZzBiT1RiSFlZV3N2?=
 =?utf-8?B?S1ZmMy9pNlZrSHdQT3VrYjU4a0wzWjEzdlBtQlVQV3czQ0xuYUxpdDRkZndm?=
 =?utf-8?B?YnRxMzdCWlhZQ3doeVBhMG5VTFJzVG9xT0JPSDRYdEZuYkRVaXBLaTlsZWpP?=
 =?utf-8?B?Y0tUdDc2aUpUdnVTTHVlU2VRQnQzb0d2VlZEcjRWS2NSbWVPcmg4RWxpU202?=
 =?utf-8?B?YkVMOXRiUXJsU1l6NFJ0VEYzQ0RJY2Rabktqdm5NQ0d5Zkp4QXlPWFJoRVJt?=
 =?utf-8?B?ZGJuMDZFVGIzcU9pN01rZWFXMlgwenptYytrc1hhTC9iZHBxUHVRRmp0bXli?=
 =?utf-8?B?OVNJNmxoRlhwNUg1eE54WXNpUW4rNzFmSnE0emNKUjdWYVFqcmhwYkNHUTV6?=
 =?utf-8?B?b0FQTWVGQ3RmLzduUlBwb0p6TXdZOUdHWkdObHRoNWg2M1JoelVHbVlxOG90?=
 =?utf-8?B?WDF3L2UzMzJKRGoxeFZtNTlRek1mWkpkZmdDQjJLRm82THpOc3R3aldMUWwr?=
 =?utf-8?B?RlNQdzJDRU9oUllnVTNoZXM5aTJRT3grMGlzYnJtZGNCOGE3TzExN24zWmI4?=
 =?utf-8?B?NVQ1dXVBK1RoRGQyczkzZEhVdHhnWnJsS2VjenhxMy9RV0xuQTFjNk05Wmc0?=
 =?utf-8?B?LytVMnp5bWQyQkRvd0EwcjZyYlpQOSs4UXhkRnM5WFNDTFdkTFA0YjljZ3RJ?=
 =?utf-8?B?Zk5SbHI0MzROZ0psbm45eXVJK3lEcmNGbXFNMkVhc1k4VG5PMzFWVEwzSjJX?=
 =?utf-8?B?RVNFZC9ZT2hxb2g2MWU1ci93QisrSGplUm9YU3gwTnJPZWRoY0daR1poaE8r?=
 =?utf-8?B?bkkvWUdzL1hDWWR4NE1waXFTUmsxUHBWZUZvV1dZMWRWTXIrWnd1RGR0OStG?=
 =?utf-8?Q?1VDU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1363ebd5-f55a-447b-87b6-08de2b8f30c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 19:25:13.4889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KEGNPKADVxvBQRX906HlRPaai9ygpjP50g5H50HbZMI71NyzX9d2TE3DL5Vq9dO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168
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

On 11/24/25 17:36, Pierre-Eric Pelloux-Prayer wrote:
> If memory is freed we need to nullify the pointer or the caller
> might call kfree again (eg: amdgpu_cs_parser_fini calls kfree on
> all non-null job pointers).
> 
> Fixes: a35c520c1611 ("drm/amdgpu: clean up and unify hw fence handling")
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for both patches.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index efa3281145f6..2fc3d9da0fe7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -225,6 +225,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	kfree((*job)->hw_fence);
>  err_job:
>  	kfree(*job);
> +	*job = NULL;
>  
>  	return r;
>  }
> @@ -246,6 +247,7 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>  		if (entity)
>  			drm_sched_job_cleanup(&(*job)->base);
>  		kfree(*job);
> +		*job = NULL;
>  	}
>  
>  	return r;

