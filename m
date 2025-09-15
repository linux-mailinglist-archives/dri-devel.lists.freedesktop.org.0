Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445AAB56DBC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 03:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0EF10E276;
	Mon, 15 Sep 2025 01:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kh2F9R48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D6B10E275;
 Mon, 15 Sep 2025 01:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhzqSfuRDj2lG/riKIqkDekmdyR5ckG2rmPirzHgbi68cNq9geq2JXev0QAJOxhLqaS1XukAVMvgNFWSlLu/k7RY7FY2puF3+9h5FkJf49q011Cdw9m437GrB2C2Zi3aNl02tEzrphMTXZYxe+cC6BhYXmo9LHQd79V/rW19ahO2l4j9e9H3mKoytwkJ30kLzwIrNd/sg1t7PWbva54+x3/ME0ZQm+kuNv65X3qcur9+BBNbA/EbOHQD3Q3qM9okrQ4m0B/Xemd2lsJWsnTDeBcVqE6qvjnaArJwKWlCR5Hkj9H8dRa3420PWJ1a7k6JYi6vkJNJkQzeja/vNPnYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUOUJ8DUzx6W+0/L84PxmWGMPDSMBtXDODxQfQSXqbI=;
 b=n2L5NW9iSVqTI80DPXZ3Yf9mvQeTapyd7QoZX7UCAlq7AV/09JVtFlAVj49nSyAaMCbPppeNCSuBndrTC/S60wcRvYDW/ERYlEZwerB/Fa1Fbf54ljfe82lK/G7C6D9SaRZL4G1QysZ1rYeNlGsi4GIlOCL5ZT9jZ46uVYfUT7naJOj3DMTcL11RLIy08keUsOO3u0nBig+VH6q5OVU00kbZ6zTi7a2RSr87XdVlx1Ng9wxt3lB9LBSEQ5zZI6g5Vl5BLZZoc9D/vaMZs3WnLdAMVdk0XAZTSDADht+tKbSYE00m4ihSlw2KPEm17FtG0DXs53ikFVBJ+iYaDPtUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUOUJ8DUzx6W+0/L84PxmWGMPDSMBtXDODxQfQSXqbI=;
 b=kh2F9R487d0NczcRWCJr7BNBakKa9JOv7mopa1Tl4YV/hGP6O3ntKZkiyLNeyrIp/Sq8D1olli2vdABy+4mKQnZ7SzHjbMwhMkdl9wOFq/4sZDM8u0JGXJcquOMWSgTUjy9OwuCUlJScYU7h4Y6Dq/upUvYijpYRn28haX6bYE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS5PPF8002542C7.namprd12.prod.outlook.com (2603:10b6:f:fc00::657) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 01:02:40 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 01:02:40 +0000
Message-ID: <834110fd-a7a9-49df-acda-3fd9e7508aeb@amd.com>
Date: Sun, 14 Sep 2025 19:02:37 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display/dml2: Guard
 dml21_map_dc_state_into_dml_display_cfg with DC_FP_START
To: Xi Ruoyao <xry111@xry111.site>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Mingcong Bai <jeffbai@aosc.io>,
 dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Asiacn <710187964@qq.com>
References: <20250825085211.34396-1-xry111@xry111.site>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250825085211.34396-1-xry111@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0067.namprd16.prod.outlook.com
 (2603:10b6:907:1::44) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS5PPF8002542C7:EE_
X-MS-Office365-Filtering-Correlation-Id: efa84b5f-6cc6-4a96-5a48-08ddf3f391b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akdKYUxHVVZoTXZTZ1NaTWZsckVZRWhSN2Q0OGI2b0Y0bSs1Z3owL3ZMdVA4?=
 =?utf-8?B?YzR0VnBRR1pIbnFacEdqa1lqUVJWY0p1Nnh3UlVVblJqSjNkakxKTlphV2ht?=
 =?utf-8?B?em9Cc2RtWXUwZ0JFM0pZY3FaeW9OSkZmdGJjcFBadVo3OEVHT1JEZlNaNkp3?=
 =?utf-8?B?bS9WTWtGUTRsUXFmNWlXQ21xS2FZcmtyblhMck5LajZiNVJYdEdrNzRUTSts?=
 =?utf-8?B?bC9sbWhGZGZTTmlNKy9YTTZYTFkreXphek5DWHk1SFk2UlZObTQwZXBEZ2hP?=
 =?utf-8?B?QnprZFo5aUFwdm9qMEVzUHhURXJBMFdsZVhtUjhLc3hzK0hPK3NNeGtEODdX?=
 =?utf-8?B?QnhnNUg4YjhqRk52Z0xMNmlvWWZ0NERScnEyR0xaNDVnWkhqVUVXYUlVUEdY?=
 =?utf-8?B?L1YwYkVvS1A5SE5FYzFObloxbnUxaGowWEtvSzZhaWxHMzQ5MjhncndBMC9s?=
 =?utf-8?B?Z0NPV2hERmhONGxQWVJzUEpmanpZQXNVMWtRSE02d1BjSlkvMDYzazJYQS9w?=
 =?utf-8?B?NTAzN25LdDY1NmdIY0cxV0swT3hyak8vcmgrTEUzeUF0YnBzMncwUm5qVDBl?=
 =?utf-8?B?UE1YaUZWTlNDTDNBSjdkbGpDQkVGeFcrdGZ4cGZMb3MxWTV6KzlhN2ZCNTVz?=
 =?utf-8?B?aU1Ub3c2QUxRZFRKUTUxN3NFeWRyM1IwZmJtTW12YU5Qb2pZaE4vOUEzRnRT?=
 =?utf-8?B?KzB6OWV5bFFxUkg2a3ZTd0d3K2p4Mlp2elNGS001OEplOEg4MFl2eUFpOWdT?=
 =?utf-8?B?bUM0UElHRTc3SXBQYmxBdFd3eHFQazYzOGxUYnBtTFhuZzFJeFFHNDVmdGxl?=
 =?utf-8?B?V1JxZklQSjVHK0NQazZZKy80SVlhWWtTRzRwYXJiaW5WMVZNdUNEMkZhZ2lQ?=
 =?utf-8?B?R0I2OFZuaUZGOS9IN3gyMlpXOFFVc0s1VFdhT2FoZXFwQWk2MEJBSThDdEhS?=
 =?utf-8?B?RFUrTW9JT3E5eG1scmJ3VUQrUUNzaWdKVTV6Qll4ZkgzTWxNUnMwMUhsNkli?=
 =?utf-8?B?dm5rZGR2MWhJR1o5SDVUSlU3V2ZlcjFPNEJvS1ZTSTg0aEhxS1MzcXZiUEtR?=
 =?utf-8?B?cWoreDE0K2JtRDZaNXJjTWVNajZWbGFXSm9EWUdUdDVEa2Y3ZE44ZFUwVTIw?=
 =?utf-8?B?ZklBTVZ5MkQvcGYvbGMwZEw0U1p1Zkw4dFV4QmtaN0lobWhKWXdIVVVmN0tN?=
 =?utf-8?B?RlFiSGZ1dFBod1JFc1pOdFJlSHJjUHpVWitabVdDVWNJVnk1NnIwSnNSOXJQ?=
 =?utf-8?B?ekkwY0hIRTZHSlRsRUpMK2djY1EzcnJaZldONW9Nb2o2ZUJqMnZDbzF0VlRu?=
 =?utf-8?B?SUsxZDhST3RKOUVHbkdzRjh0U2IrazQ3dmsrMitxeUlxQW5HSlVoV1JVdmNQ?=
 =?utf-8?B?Uy9qQ0pnWVlPWFJtejk2c21hTUhCdVRKMG02WFg4a1k0UHhnQ1NkNTdQZ2Vl?=
 =?utf-8?B?VjJLYzRBa0NzMEVTNmFqdVdnUVBOd053MEQ2YXdJa3Vsb21VaW9yUnJ5dG5W?=
 =?utf-8?B?NTJlMy91U2lUQ2dlWnpLSVVOV3dvb3NWS2doekdiamJQOEN5SFRvM2ZIK1A0?=
 =?utf-8?B?Mm5TTmtxUTRJOTVpL0RYMWQyRUoxOHhSRDJRd0YyTk5ieWtPMGpGT3QxbS9U?=
 =?utf-8?B?aHNTMStVS0IzbkdDTXl6UG1pMWtiYkVjQWNVT09vZGJtdVl6MncwK0dQQ1pw?=
 =?utf-8?B?R0xuQjZvbFNteHFYR2svempGTW5wM0c1Q2RYcEgvMWQvem5KK2V3Kzdsc0ky?=
 =?utf-8?B?RFlHUEhjaHFEVXdYWTJPOHNjWEdxUWxTM1ZuOHZtMDNSc1BCWjRsbFRyMmpz?=
 =?utf-8?B?SG5DMHJPdEd5TlRHUVdhWkpZN2JCd3prOE5rd3N4MGxObTZEMm4vTk1DNmRi?=
 =?utf-8?B?cmt0ajhUQ2dhM2xUL2JSbVAwUWFGaU9abU1LWXR6K054MTV4RkhhcDZURTdQ?=
 =?utf-8?Q?q7XF/GJF254=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk42RDN4ekZyZXF1SVh4Y1NhalAwelVwMGVpajlaZFd3M0JVdy8yek9wb3JS?=
 =?utf-8?B?cjRSL2ZzemRyR1ZJRkNrWEtPUFpwdEpYelFHRjYyVDFpdVZFWkhqSVI4YStH?=
 =?utf-8?B?YS8xYy9GSDFjcUFsWGZLWGsrYVhpaGQvQk5ENHcwSmhQQjNTVkpuNzJpWDhW?=
 =?utf-8?B?SVdleHVFai9yM2xVbmZLaVd2NEc1WFVIU2xLQlpveHNOd3N1NHBiZFk4VDJY?=
 =?utf-8?B?b2JPWjhQWXdaZ3pGL3pjSWoxMHN4NDZLWWVyT0pjdEFPVFF6SWRvbmdzTzI3?=
 =?utf-8?B?L1MvTmlYUDBJcVVla2JFT1gvWUJoQmEzUXVNamJCRmovS0tZd0llaUVGR3hZ?=
 =?utf-8?B?Nm41U3pqcU1NREJURXZDSmJva0dxcGN1bCtRQURkSGhUNzBOeExpcmVtNGdm?=
 =?utf-8?B?REZhNTIyeTNINXNxL3J4bnMzUHprUzJRZFh6Q3I1VkRlUGF0NnZIM0t4c3lx?=
 =?utf-8?B?amZITWxzZjFOUUxMVDZ6WktUZ0N0aXZydmxZU1FiZEgvU2cvV29obnVjMHVX?=
 =?utf-8?B?cmpiL0VtWXQra2h6dU42RGV6aHRYT0FqOFowN1h2YVhiVEQxMElBNERBcGIz?=
 =?utf-8?B?YUNJR2ZoNEJjYmRNNGhUSU42NElZQWhTampNOTk0SGk0bW16eGpBRCtnUXNi?=
 =?utf-8?B?azFoQ0VmaXRjVjIrWEZkckdzS1lVZjZxdkZXM1JsQjB6UldDYm9jRmw1UDEx?=
 =?utf-8?B?RFJPMm1MZVJpeWJleThrSGhza0VEL2J0U3k3M2JqT01BcTBhbmFyek9DNXNw?=
 =?utf-8?B?aENEVUJ0NUFieEVHaTBKUmp5L2s2RGIxeXNGNzg1U3ZBenlqK0hwY2t4WlZr?=
 =?utf-8?B?MmhmenRhZWlMYzZKcWlHR0wzV0RzcEsxSkRPOFl5bDNXbHl2WmQ2a2VXVVZK?=
 =?utf-8?B?elZGTGhSeHB1TisyUmxmOVlzSUVoL1NZeUFiWjVaWkNHRnkrMXVBL2Rkcm5D?=
 =?utf-8?B?TGpwM2Y4TS9hTVB4Zmt6ejlzMm5BYytwT0ZEclo4RlpRdlFKb1ptSnJLSlBa?=
 =?utf-8?B?dis0bWRObWlrMng0eG5zWU9Za2R1VFBWeW5ZK0J4V1ViY1dIZC85c1VjdVg4?=
 =?utf-8?B?b2NTU1VjbTVKMUliRjR1VlJCL3RoYkZYOGVucW5KT2daMUJxUGtzdHZXQ09W?=
 =?utf-8?B?aUdIZDUvT3JnZkFrczQ3aGJuMU1hc29pMys4WDl1WG43RzFoN0R2V09oNVBn?=
 =?utf-8?B?STIzRFNpWktZT3g4aVlSWU50N3k0eE90U0NWM0NYTlJRUnlOdU96UWxRcWVs?=
 =?utf-8?B?TlA1S2YyYVpGVUxvT1dIbSt5QnVDdCtiU29pcUdMWUx5M05rdGFvclA1KytX?=
 =?utf-8?B?NkJNakdCV0hkZW9LYXQrcDZjVEJIaEN2dUdod0RTWVl4enRPN0xRemdFYW9s?=
 =?utf-8?B?dHlpYTNzNG9kOGFWN1lhMTB0M0xGUjhCSWNybWJwVVUreWI1YjBRUmEwenpT?=
 =?utf-8?B?VjBmdlJVMHc3MGFBbnExTHlmVExFWGFra1ZVdWZvMmNReG5QSDVWem05Yzdx?=
 =?utf-8?B?YVFiT24wUzFxZVJvODFWVzllOUFWcldHYlZNcnFqdXd2d05VVm9uNjhLcU1P?=
 =?utf-8?B?alQ0STZZQ0RycGg1dGdUeG42aEU0bGROWi8rMjZoL2NyTy9EdEJQZWpUdXdx?=
 =?utf-8?B?dm9vZ2Zjd2k4VFpCbUh3cjM2anZpUjk2YkdNT0pDSHA3bUVId1Z3NERwS213?=
 =?utf-8?B?VDVEU0hhcEhVQnRhUytmNmF4RFZRVEtRTzJhbFc1aWtkYUtRVkM3OGZBODRt?=
 =?utf-8?B?dWI1NzV4QjV0WGtwck1ZQ3dzM3pkemFwL1kyM2x5TDN2cjR5eW5uaHFzTThI?=
 =?utf-8?B?QjlzVTQvSjRVQU1EUWRqdkptSE5IcEdPZXdubDlJSUJhY3RpTDRGdHRYU0RP?=
 =?utf-8?B?VVVUaFlmUGlGVHVGWjEzT3B2TklNRlF5VWpXWHdGU1dMWU40Q24rSllOT3hm?=
 =?utf-8?B?NVlGY1RyVW5DV2ZzdTZWMHpDWkVncmtFSVY5cHE5WnFSY0hVT0h3RjNLbmNG?=
 =?utf-8?B?elhKdVJnOG9nTUFyMWdmK0VqN24ySUJyZjYvNmtWNGpWMXhweVhmRVJNYXVQ?=
 =?utf-8?B?RGZmK01lSTNIZ05vc05MTVVVc0tvTXJGNnpYdU9KbWNJSXF6Ym5wZkZKNDZX?=
 =?utf-8?Q?3vVRIvAPqZ+5zwlOWyN7hzRCI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa84b5f-6cc6-4a96-5a48-08ddf3f391b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 01:02:40.5116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7ZYi59wMZ2rgGrxAGh6yF+D50lvh0LDWgOPKdyNpV6QoW/fU9gG9Wh9m+eSaFDXzabNXHmbIPKYVMVt5Goedg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF8002542C7
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

No regression found in DC promotion test.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 8/25/25 02:52, Xi Ruoyao wrote:
> dml21_map_dc_state_into_dml_display_cfg calls (the call is usually
> inlined by the compiler) populate_dml21_surface_config_from_plane_state
> and populate_dml21_plane_config_from_plane_state which may use FPU.  In
> a x86-64 build:
> 
>      $ objdump --disassemble=dml21_map_dc_state_into_dml_display_cfg \
>      > drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.o |
>      > grep %xmm -c
>      63
> 
> Thus it needs to be guarded with DC_FP_START.  But we must note that the
> current code quality of the in-kernel FPU use in AMD dml2 is very much
> problematic: we are actually calling DC_FP_START in dml21_wrapper.c
> here, and this translation unit is built with CC_FLAGS_FPU.  Strictly
> speaking this does not make any sense: with CC_FLAGS_FPU the compiler is
> allowed to generate FPU uses anywhere in the translated code, perhaps
> out of the DC_FP_START guard.  This problematic pattern also occurs in
> at least dml2_wrapper.c, dcn35_fpu.c, and dcn351_fpu.c.  Thus we really
> need a careful audit and refactor for the in-kernel FPU uses, and this
> patch is simply whacking a mole.  However per the reporter, whacking
> this mole is enough to make a 9060XT "just work."
> 
> Reported-by: Asiacn <710187964@qq.com>
> Link: https://github.com/loongson-community/discussions/issues/102
> Tested-by: Asiacn <710187964@qq.com>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>   drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> index 03de3cf06ae5..059ede6ff256 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> @@ -224,7 +224,9 @@ static bool dml21_mode_check_and_programming(const struct dc *in_dc, struct dc_s
>   	dml_ctx->config.svp_pstate.callbacks.release_phantom_streams_and_planes(in_dc, context);
>   
>   	/* Populate stream, plane mappings and other fields in display config. */
> +	DC_FP_START();
>   	result = dml21_map_dc_state_into_dml_display_cfg(in_dc, context, dml_ctx);
> +	DC_FP_END();
>   	if (!result)
>   		return false;
>   
> @@ -279,7 +281,9 @@ static bool dml21_check_mode_support(const struct dc *in_dc, struct dc_state *co
>   	dml_ctx->config.svp_pstate.callbacks.release_phantom_streams_and_planes(in_dc, context);
>   
>   	mode_support->dml2_instance = dml_init->dml2_instance;
> +	DC_FP_START();
>   	dml21_map_dc_state_into_dml_display_cfg(in_dc, context, dml_ctx);
> +	DC_FP_END();
>   	dml_ctx->v21.mode_programming.dml2_instance->scratch.build_mode_programming_locals.mode_programming_params.programming = dml_ctx->v21.mode_programming.programming;
>   	DC_FP_START();
>   	is_supported = dml2_check_mode_supported(mode_support);

