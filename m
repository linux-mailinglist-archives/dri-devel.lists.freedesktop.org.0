Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2176C3CE5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 22:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2255B10E31F;
	Tue, 21 Mar 2023 21:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEC110E31F;
 Tue, 21 Mar 2023 21:42:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBgg55XdSBnCXFIucNBAvfLSmCzHpmGouKvxUE7leuUzEW64ZRM4uUA/A2BAKcjnsezvTS8nPe4fOUipqzwzzedv2FZ1Zmu1DwqyosKEUGwm3A6BFHCydDmtlzmSpqGEtTWB4Zru2GY3jvtoonjOO/3wsnWuy/Phz4EigZ8F5rKxNTF34PJxBM8B67Jsf9ulIKCNT80o8L1Ub+MPNVce7HG93Sy2yVGNQexk0w5omm/oDLdla88AM9DUf+x3po8TcogS4Ro3YnXuScAcsCNLSS2sjhq4jInUz+E5McxBseBNDFp0Uj5BlRyCB1xO8jiDSaqpby9jwtZdcR+4I20tZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDC6ykcO1wW/AS7fJosgAAKAc11vapmpuC9I2Tw4KxQ=;
 b=gkRkwCXWHbT0Ovqb1Dj30FVcTc4ZILV7AzXKWfkuQGcJNE4Chi7Dgjzao3FdKENP2dMS+FZJjZ0alQc1/QQlAuEuaBup2f3ImK8DIlziL1TO0/7jAkFCpGfzRXRt5li7jHGtUE/xKZQXWNrSuomJEbuVgEfhLxvmINMYIWA+GgSY8HB/RB+uKAUgksMBsAgMx0LcAww2CoYW5b3jVCuRpcPEZDZy+Kza52amJuPaIj8V5LE5fND8E/2pVdHVpVDu8nzEQYpP+enerIHejxG1pKDTVoA1Lc/bNZ440wxVMzB4onJdDE6NaRtHR8XqomSvO3PAV7CqTlAsBOkInP9XTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDC6ykcO1wW/AS7fJosgAAKAc11vapmpuC9I2Tw4KxQ=;
 b=NW/kr/54eY7AGn2L/OjLdq3RiGLupR4w9HOk1mn7mcyEnqGcBjIJOEqfRHqHYVQ+elKb5sen9VobdUElxp0zVMM5KAeF8bOs7MHXTFRYELoAMGeDFajTMURFTLvAS7SuDTznmawPDCOGFa9yrnIcqgLngIsjl0Qyo7XQxSXTiyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB5788.namprd12.prod.outlook.com (2603:10b6:208:377::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 21:42:03 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 21:42:03 +0000
Message-ID: <7ab61b55-1a47-4eb7-05a5-e7b6b516fdde@amd.com>
Date: Tue, 21 Mar 2023 17:42:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 24/32] drm/amdkfd: add debug wave launch mode operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-25-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-25-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ade7a5a-27e8-4e55-e9f9-08db2a551c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xt4f3VK5v/H2BCjloUua0QawS1kEre31VTPM1hXlLClqXOnVreaJpQvNkxfTBle7YvXjaLpgoQGq8/9ok1rO/9rgZovitgwCqYrrKit06veW8wOOak+awRt4PNhxSoUBZRyrilFidokRle+tv3VLZ3IGbH1BW/G1EfsvtW7rgwlODFmIPdwsL2gFJB1LX8tIJOYyrKvRpp4HlmL20dyOu04FL5WhqL/LW4aZuPacwOb3EjYEETjVVjt28hpUEn0ajvvX2ZRtV7q1NbUVS2l2O5msOnFFXY2qE774pkQQ+96O0aBdIEvVeH3w36heru/gO5P7WWQVebYodfbmb9SuyQAVRuiWI/tw6MJZyPeSidl2VCP5DxEWvnFCRalIUk5bGC11MOlctHPKg8DH8ThhUtx13MKKYVIZf8+2WkfhLVSAdyrQO8nzYx+yoXefuuIVw6aBunK4qIGE+5HdzrFUD707xK9QUM0Ll2dHrgNw8OvIS6Mw284Y+j8MYyCdJTY7fDeeswjlIAba/cAAgz9Dj2t3AMcPQt845bU+jJnYYyEVuRYaNze9C8J9TmWkUZTuNFIMJrtNSmKWr8cyHAxbmm0PWmB/fiIEfjW3Uf/w+y5OPqvAWYKmQxlmV6iUrvSOl6LUWWRDN0UPYkYQsmRv7OZv8kw2vZjx/z+huh3J0GfXjNkKntnqr1RjRDUgRKPEPqiIPGyZ4gf4dlqmM8K+t8KdWwpmC4FUJPDTwDlFHlpmFkXnwMqkPw8J9Fj2Lkej1UNWaRL1byG/jyN4Vcsd4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199018)(41300700001)(8676002)(450100002)(66556008)(66476007)(66946007)(2906002)(36756003)(38100700002)(30864003)(44832011)(8936002)(5660300002)(53546011)(6506007)(6512007)(6486002)(26005)(2616005)(186003)(31686004)(86362001)(316002)(83380400001)(31696002)(478600001)(36916002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmJJV0xnbUNqYnFHS2hEcXluWHlVVXJSK2NPNldJY2YxWWg1T1kzSG1ZajJH?=
 =?utf-8?B?RzllSUNNcGtBVTZBZUNmQUJ3V1ZJbXo1MExJUWV1eUJCZ3pFbFF5aFB5Vnpu?=
 =?utf-8?B?c3R4N1BxOS9FcUxEK0xJMUlVYlJSTERwV1c3cTRhby96SjN3Q2RQcUg0UEhQ?=
 =?utf-8?B?U09xam5vSlpwTzQwL2VWbjZsRVpjTzhEWXdRdk1mWVE1Tlc4a200bXZmbTB2?=
 =?utf-8?B?ZjZmcXRvb00zZzNwdG1IUW1oZDRPU09HSTlsSTVUY1B6TFl1dHZ5Nkw0bHR1?=
 =?utf-8?B?SFRvcmlIRUtJN2d0dHN3ekcySzlhOE14MENrc3hPaGU4OEppZjlLdnlJZFJK?=
 =?utf-8?B?ZUg4a0VaUnpTMm5yNytLbDc1a3oxTWxnTG1DSU9wMHl6UHp5aEdUVEpjUXFV?=
 =?utf-8?B?SGJueWxrNDdoMXVXbGdDSENlZ2xLK3hFOG9sTDl0Ry9Bdmo3ZDNIc21KYStO?=
 =?utf-8?B?a20wdlRvQ1NNSVBQWTdhMm14ZGlDQzQ3dUx2MHlZcmw3dnNOcVZRakZlVTky?=
 =?utf-8?B?QlE3NlhrOFY4Uzlod1NmZ3I3NTE2ZzR5YlJITURDSmtGaTB0SEkvTi9iSzdo?=
 =?utf-8?B?N24rL1FkUUMraXNBTGVsMEYwcy9oVS9WTkZ5QXArQlFMMnk3ZUFFSU5NTUwr?=
 =?utf-8?B?Z1krZnBKWkIzeitMN2JLSDNHL1dtUHBnNmI1aHVadnlZYVBiU1ZqU2dkZnBo?=
 =?utf-8?B?bjhKS2lPZ3QrcXF6VEJIdGVjcTVOOVpGYkYrTXlJOGp6cXpQbXNZWUo2eEFz?=
 =?utf-8?B?a2p4eitwNmJJZ2lZSVdiRFJSSnRhdmNURlBWdFU1TTlSblp6aVUwdlJtNjFB?=
 =?utf-8?B?TlpzWDVRbUJyNkJ6a09CMlkyV2RRRXd5cmRKUTZTWUZGNEZWRzhuR25iQXJ5?=
 =?utf-8?B?RVo4QWpBWjVpOWIydjZvTmNtOFNJYm9RTWx5S2VBWjd4d002SnFkVFRzdkNw?=
 =?utf-8?B?MWpySDFQQ204MTBLWWQ1elcrV05Gd2FKNHZYbUxWZFpRTXdyT1hFcllYV0Nu?=
 =?utf-8?B?VmZSNjl0aWFJNW4rTXZxNDZnSG02N3puN21SZHE3Tnhpd2xsclVvdm9NRXZD?=
 =?utf-8?B?Y09Vc3JnbW5aYy9ZcUtJYnc2bGxybzBydW1mcysvK2YvVVVOM25qR1hEeVUy?=
 =?utf-8?B?QXN1Q2w3WW9YN0tEaDBncGROdjVJbjBEZEptdXdJdk5wRTB3SlI3aytmc2xS?=
 =?utf-8?B?ai9ZcGFhL1preDhsb3BBSWFYZkFUeVdhRXFFcEMvcW9OKzFZSzdvYTROM1NM?=
 =?utf-8?B?TDdtdERWTlo3dWs2Qkd4MGJ6TnJDdnJBOFBnNFhaeXA5WnJ0RmJrZ0xHUXBD?=
 =?utf-8?B?MzFncTJxbnMvZUZ6N3Nyb0h3NVBTQ0pmTzR3T1JpS3dvTzl4VkFaYnVFS1JO?=
 =?utf-8?B?YWxmNHR1eS9PQmwyQ2tvUmcwbVpsMnNnZGpUbys5UVdmaWcxRjNVZ2hnNWkw?=
 =?utf-8?B?ODFXYzNUQmIvV0RFSjIrbEl2cmlIOWQ1MEJCNUR4VkswMnJFbFJHdDlGa01O?=
 =?utf-8?B?MTgrQmdmTGVFMXgrNXNTMzFoUEdsQjB4Smt2ZTFsQTErcmZ4MDQyWTMvN3Vt?=
 =?utf-8?B?QktRQnk5NXdzendvVTFIcTBpL2l3TkhOKzFNUGlvWTAvTC9OU3VCR1hxZmNW?=
 =?utf-8?B?dWxVeHNyVlBLb0lmZFYyTURFaTFxMVFrbVhzdm9GNG9xYjUxYzNuSktGWUFJ?=
 =?utf-8?B?OXFLYmRlZVdCMERHcnNMcEpaSThNcWFMVHBucW5YbDlNSHVaeUhlTlJSOGI4?=
 =?utf-8?B?RXZMQXBIRHoxWEhWajNGMHpocGUybkJSdVQ2R0J2UDVJdnY5UjZlZmNRd0N1?=
 =?utf-8?B?Zng1YytlbzlKOVVSMDMxTVhEa0RhOERHRDl3VGVhVXBvTTV4SC81VkxkVEgx?=
 =?utf-8?B?SlF1Q20yZVNucHFrQ3Q0UEtkU1l0YlQ5bXdwS3lzQkNkc0RkRDVqMlBoRU1M?=
 =?utf-8?B?VjBxQmFmYlV0S0plRlFNbjVUTnA3NDdqejV6anlDZ2ZxWlBic1pFZUM3SzRH?=
 =?utf-8?B?VUlxcFdzeUxOeU1scURRcEhTRGxBVnNvYk5HOEJSZ1h2NG81UVVEVkFrSlNR?=
 =?utf-8?B?ZVkyTUZSOWdUMEtkOGhDbklZUkpKT2hORGhWVFlhQ2JYMmRJNnh4SU5Na01H?=
 =?utf-8?Q?Gtm9OhvhCQ7nJYC01amXct2TO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ade7a5a-27e8-4e55-e9f9-08db2a551c26
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 21:42:03.7518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcUd6WMGHcdiJlK/v2i/QZSjuv3Ib6uVLue9O5gxFbsgCIjZmoX6TFPKyEoUD6MRsS5z2RUHlOaCl1HSdp2f8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5788
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

On 2023-01-25 14:53, Jonathan Kim wrote:
> Allow the debugger to set wave behaviour on to either normally operate,
> halt at launch, trap on every instruction, terminate immediately or
> stall on allocation.
>
> v2: add gfx11 support and remove deprecated launch mode options
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 12 +++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  1 +
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 25 +++++++++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  3 ++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  3 +-
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 14 +++++++-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 25 +++++++++++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  3 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  3 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 36 ++++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  5 ++-
>   11 files changed, 124 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> index 84a9d9391ea4..4de2066215b4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> @@ -107,6 +107,17 @@ static uint32_t kgd_aldebaran_set_wave_launch_trap_override(struct amdgpu_device
>   	return data;
>   }
>   
> +static uint32_t kgd_aldebaran_set_wave_launch_mode(struct amdgpu_device *adev,
> +					uint8_t wave_launch_mode,
> +					uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, LAUNCH_MODE, wave_launch_mode);
> +
> +	return data;
> +}
> +
>   const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
>   	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
> @@ -128,6 +139,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
>   	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_aldebaran_set_wave_launch_mode,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 0405725e95e3..500013540356 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -412,6 +412,7 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
>   	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index 32a6e5fbeacd..7591145bc69f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -854,6 +854,30 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
> +					uint8_t wave_launch_mode,
> +					uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +	bool is_mode_set = !!wave_launch_mode;
> +
> +	mutex_lock(&adev->grbm_idx_mutex);
> +
> +	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
> +			VMID_MASK, is_mode_set ? 1 << vmid : 0);
> +	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
> +			MODE, is_mode_set ? wave_launch_mode : 0);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
> +
> +	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
> +
> +	mutex_unlock(&adev->grbm_idx_mutex);
> +
> +	return 0;
> +}
> +
>   /* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
>    * The values read are:
>    *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> @@ -941,6 +965,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
>   	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
>   	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
>   	.program_trap_handler_settings = program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> index 85c929fc2926..34c04a2bb83b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> @@ -36,6 +36,9 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   					     uint32_t trap_mask_request,
>   					     uint32_t *trap_mask_prev,
>   					     uint32_t kfd_dbg_trap_cntl_prev);
> +uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
> +					 uint8_t wave_launch_mode,
> +					 uint32_t vmid);
>   void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
>   void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
>   					       uint32_t wait_times,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> index ae3ead207df4..8627c5458973 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> @@ -675,6 +675,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
>   	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
> -	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override
> +	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode
>   
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> index 3fb81e6e9422..4fdc25222dcd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> @@ -725,6 +725,17 @@ static uint32_t kgd_gfx_v11_set_wave_launch_trap_override(struct amdgpu_device *
>   	return data;
>   }
>   
> +static uint32_t kgd_gfx_v11_set_wave_launch_mode(struct amdgpu_device *adev,
> +					uint8_t wave_launch_mode,
> +					uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, LAUNCH_MODE, wave_launch_mode);
> +
> +	return data;
> +}
> +
>   const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.program_sh_mem_settings = program_sh_mem_settings_v11,
>   	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
> @@ -744,5 +755,6 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
> -	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override
> +	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index 81643385512a..a3c8f5578788 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -790,6 +790,30 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
> +					uint8_t wave_launch_mode,
> +					uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +	bool is_mode_set = !!wave_launch_mode;
> +
> +	mutex_lock(&adev->grbm_idx_mutex);
> +
> +	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
> +		VMID_MASK, is_mode_set ? 1 << vmid : 0);
> +	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
> +		MODE, is_mode_set ? wave_launch_mode : 0);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
> +
> +	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
> +
> +	mutex_unlock(&adev->grbm_idx_mutex);
> +
> +	return 0;
> +}
> +
>   /* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
>    * The values read are:
>    *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> @@ -1060,6 +1084,7 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
>   	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> index 47cff392b434..2a2ab42037e4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> @@ -67,6 +67,9 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
>   int kgd_gfx_v9_validate_trap_override_request(struct amdgpu_device *adev,
>   					     uint32_t trap_override,
>   					     uint32_t *trap_mask_supported);
> +uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
> +					uint8_t wave_launch_mode,
> +					uint32_t vmid);
>   uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   					     uint32_t vmid,
>   					     uint32_t trap_override,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 28b9db5806f4..205a487d91d2 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2904,6 +2904,9 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				&args->launch_override.support_request_mask);
>   		break;
>   	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
> +		r = kfd_dbg_trap_set_wave_launch_mode(target,
> +				args->launch_mode.launch_mode);
> +		break;
>   	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
>   	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
>   	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index a9b52f114ac6..b630633609b0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -303,8 +303,10 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
>   {
>   	int i, count = 0;
>   
> -	if (!unwind)
> +	if (!unwind) {
>   		cancel_work_sync(&target->debug_event_workarea);
> +		kfd_dbg_trap_set_wave_launch_mode(target, 0);
> +	}
>   
>   	for (i = 0; i < target->n_pdds; i++) {
>   		struct kfd_process_device *pdd = target->pdds[i];
> @@ -599,6 +601,38 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
>   	return r;
>   }
>   
> +int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
> +					uint8_t wave_launch_mode)
> +{
> +	int r = 0, i;
> +
> +	if (wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_NORMAL &&
> +			wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_HALT &&
> +			wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_DEBUG)
> +		return -EINVAL;
> +
> +	for (i = 0; i < target->n_pdds; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +
> +		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);

Same comment as in the last patch. This should probably be done in the 
HW-specific code, only if it actually touches HW registers. Maybe in a 
separate patch to make sure we catch all the cases.


> +		pdd->spi_dbg_launch_mode = pdd->dev->kfd2kgd->set_wave_launch_mode(
> +				pdd->dev->adev,
> +				wave_launch_mode,
> +				pdd->dev->vm_info.last_vmid_kfd);
> +		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +
> +		if (!pdd->dev->shared_resources.enable_mes)
> +			r = debug_refresh_runlist(pdd->dev->dqm);
> +		else
> +			r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +		if (r)
> +			break;
> +	}
> +
> +	return r;
> +}
> +
>   void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
>   					uint64_t exception_set_mask)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 864eb01f8973..0d70f162d6d8 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -25,9 +25,6 @@
>   
>   #include "kfd_priv.h"
>   
> -void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
> -					uint32_t vmid,
> -					bool stall);

This seems unrelated to this patch.

Regards,
   Felix


>   void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count);
>   int kfd_dbg_trap_activate(struct kfd_process *target);
>   bool kfd_set_dbg_ev_from_interrupt(struct kfd_dev *dev,
> @@ -51,6 +48,8 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
>   					uint32_t trap_mask_request,
>   					uint32_t *trap_mask_prev,
>   					uint32_t *trap_mask_supported);
> +int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
> +					uint8_t wave_launch_mode);
>   
>   int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
>   					unsigned int dev_id,
