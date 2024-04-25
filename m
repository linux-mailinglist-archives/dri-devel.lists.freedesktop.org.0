Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CBA8B1B1E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C9211A1BC;
	Thu, 25 Apr 2024 06:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3ovpVCmu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C56811A1BB;
 Thu, 25 Apr 2024 06:36:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcBUxZxRPu136FycUgVXV7ibrrUgujf/MPoblvYR/x2jSLwvylUVTKnFRwucDcLm3Y2a3eDOzFAZO5Frhvq4UTpWCZ+Sn3bSUsgd6TpPDgoIBJHyOTGwSrN7PTeU06L9Vw9/VT8p4qQ2iEQqqk1YOR4x/GPFCZFhhyj6+aJkiapp1MESvUYJ13KzBOg0DL+JTkRw21c3QrsYJPsWHj+iaw9qjxor3p4YW7BsndI/Qc8Q+GgTPV0vGjn8MxUkoSTQyKbSvfQyLLQPc1z2gz9aIZn2lDHce5TRumpN0XG2MNV8jqyMkc2CA9dVBwopT7yimLJ8XdQeimVBSXqcftX9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kD2/AjNL4ufnHt7ITcT6ltxVtx9Sq3DDc7wS4II6EuY=;
 b=ftZS4Ma3U+H//EhUsURhSCp0jfbJWr2VnD5DtJo22oH/jT5IKIXp/QaTuewSTKFzoqDXqAxVV5Pzi9RA/1kjJd6vQoLnk9M28lAJteWridtafQe2V/BCB8vapRkdi1DJH4idZAUEO3zBm2d08K7Ud9TIeKNAV3qpE3tNMs7m9EvuZc3yYU8geNAhiN/80GGbTxmrvHMxxHOWGil3zyf7CRlpew3MevN7yMiavaGWh3bON80pocsRHq90+dHvB51BOrEbhG77m2IgKNugpaCB82B06l06e0azIuyCk+mKMni9/0fJjI1PuaOOAl+3NHlWKZcGk9SRRtYy1kxvr+QdwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kD2/AjNL4ufnHt7ITcT6ltxVtx9Sq3DDc7wS4II6EuY=;
 b=3ovpVCmuA+amyiJVJhfUHqCAk5wX7womerWA9VcmMvgLX5353QF2N+GxqccmxGOM37CiT8vqbZeQcmiTapSuNMVFez26O+B5CkBJDn0nDgNj35LKiYqCenjf3jvAD2OMArb4ytMyhYyQ7HorpO7CTp9IEjSZV6TFHaUNqEdtCPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7915.namprd12.prod.outlook.com (2603:10b6:510:27c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 06:36:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:36:54 +0000
Message-ID: <fdfa3487-e0fc-4ed6-ad76-74a3a36d8162@amd.com>
Date: Thu, 25 Apr 2024 08:36:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/18] drm/amdgpu: Don't try moving BOs to preferred
 domain before submit
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-9-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240424165937.54759-9-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0058.eurprd09.prod.outlook.com
 (2603:10a6:802:1::47) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bcc9c29-de3d-465e-d871-08dc64f218be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnFKTXhRc2NrbnhYelY2eTAwU1M2a3hIYVRIWXVJZVVkelB1QXBxbmV3U0Vo?=
 =?utf-8?B?WnNiRUU3QUF0QmpkcjQ0WnU2NFhGVnNaQTdzZ1hKWEJPa0dhek9mL0tiVit3?=
 =?utf-8?B?U1RvclZtMG1lL2szTjFtRGRYTytmNzRhRDJZV2JVd01QREtpaGdDQ1pGS3Qx?=
 =?utf-8?B?UDI3YjdVdjFBcFk5TFhvdWp3aWlWK2wrN0VveTZISWxlN2pnQlhPVGozb0RG?=
 =?utf-8?B?cW8rZG1lTzBoQnBIQTREQ0pvWVBKT2hYQzFiRVNpY3c2bW9YU1dycmlyMWRn?=
 =?utf-8?B?eWJ6eWlvcVhxYnpxN1NPN1hmVVJOc0RZemY4Y0J0VEp3alVCdExZY3VYSUZN?=
 =?utf-8?B?Z0JtMkVnOVhCZGJKSFhHdFlGUU5wMTF6YldKNTlzVzBBK3U0RE95Yi9YdStm?=
 =?utf-8?B?QjVVVFVyamtPQ0JUR2ROMHJiWEo1TkNNWmp5RmhZWlltemk2WFZnTlpCdi9a?=
 =?utf-8?B?ZmxxdHdweE11QTF6WkVhazhaVXRhbS9QbHA0ZjgrUlZBM2JwdkZIVlFmUk11?=
 =?utf-8?B?WDg4bUhTZFd2WkJzREtoaitxVGYvS0liUkxzdW5TRlVhMDNGY2NIU3d2SkNr?=
 =?utf-8?B?M2FYTXBrWTZWRGUyWUhuZW5XeVlyejNxMVhzY2tSVmp2ZEtqK2E3MHJzR0hF?=
 =?utf-8?B?SmxnVU5VYU5id2xwcDY3eGcvWjl1cnFFOUFMeitpRmY1dlpPcU1tdUhFajFY?=
 =?utf-8?B?YWFWeXBqb253eitaL0xBdmVwKzNFRW5tWnFuT1lpSGhWWW5RZkxRYTJQZ3M5?=
 =?utf-8?B?Q0pSZ0lSaThEQWF0S0htd0FBd1ZKZExzUEcxKzAwbnAyemI2eStkTlpkVm1K?=
 =?utf-8?B?eG44U3d0bnNFRDhnR0l6YWNqSG5Wd1B5OUhJN1lTaHIvajZMbGZSMENCY1pr?=
 =?utf-8?B?c24yeUV3SlB6U3NvdGJla3luYVRtekVtZERwbDBLVXdjdkFzQ3VmVWs0Q0tL?=
 =?utf-8?B?V0oyQkFOcUxsOFVnMWRDekVsQWFvbFFaS1lGVjlnY3hmUWFjNGhoaTRLODJh?=
 =?utf-8?B?bDlaeUMxOUhOZFo5UnhDR3hhL2FpVisyanFiZU40ZDNQWVNlNDA4cFlpS2xi?=
 =?utf-8?B?ZndoRUpTdS9GamRaUEdPQ0d4OGgzVVg5Zi9XMWRXNlFTUk0vdHM3RnFRRlpL?=
 =?utf-8?B?cEJmakxpUWhwYnR6dDhYTVBoeVVKcEV2VWl2aHBtMzVvK0FOYlNZY1BiTlQz?=
 =?utf-8?B?bFRSZ3pPM1ZHR1U2MytVVmI0RnJYOGhva3RJa3BIUFMxSm1iZU1VVDhacDQw?=
 =?utf-8?B?SUY0ZzZueTEzeitPb2lXZTNNMmYyR2hrdW8rWE9sK1E4dUtYdlhUeUUxZlp5?=
 =?utf-8?B?WUxQRkVFV1BxYmtIcFprM2FHbHlyUi9YZjh1ZDhFcm1GWms0R0p5dkppWExu?=
 =?utf-8?B?Q1NlSldwYjBhZWd5TVRvVDlKei96MzFhWm5sUEo3dlRpWjRjOU5yY3gvcHFu?=
 =?utf-8?B?UmhBbWxtRkQrRnJlQ1ZpeFZmU3l3aXVQVkIxVkMvd3BlSjR3VFdabVZHaXcv?=
 =?utf-8?B?RmRxS3pwMkpMdTJVM2VETTgyS0huak1FSFg2ektWYXNOdjdIdURyUmpwWDJm?=
 =?utf-8?B?d3dCSGxyUWlGalIxMDlYT09UOUY3dzFNWkUrWng1dXBPaENlaWljT3ZKYi9N?=
 =?utf-8?B?ampIWHFFQUR2K3NGTlBlRHk2K21UdGZyVzltMnNQN2tjay9oemQrTDdpMWtF?=
 =?utf-8?B?RU9CZEwyUm5xOFFFUlhyMnBDL1NVOXNKT2N1SDFabks2dWI2TmhMMktRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjdtdllFRHMzamxZYVdLTjNCSmRJYSt3V1BNNDR3VUZMckF6ZFZJTjZMMUdB?=
 =?utf-8?B?aWkrWGdZN2lCaWx3aHJheUFPdTFlajR0Zjg4SEowbElRRUVLTXJlRis3VGxH?=
 =?utf-8?B?LzU2dGdNaHloNEVUNlltalpKM0N1bSs1bnVUaHYveUo1bUNublRoQXdFeXFZ?=
 =?utf-8?B?MVIyTlJTSGJrUXJxajFQMy9LQWxGeFhzcFZ4RWJWcExNWHhNK1hGeWhCSVZQ?=
 =?utf-8?B?ZlQrQXhpSnh0ZTFNSll1VUdQR1ZuZzRmNVlaejJ2Rm1GSEJZVnZEMVgxcEt4?=
 =?utf-8?B?bktIeEUvZDI0RVlXM3grM3psa0FsUUdXQlVqd2lkejVaSk14bmZrNmd0ZTU5?=
 =?utf-8?B?Wlh2aldHNVQvVU9OYXdOZktTbWNIZVphN2xZb2RiVTA2M3hTa2VHUnM2UDRn?=
 =?utf-8?B?TFJ0M1N5Q3NjWWZTQU5UL3BBYnFKbmtNcDJHcTVEZFlFYWNSUUIvc052UzlQ?=
 =?utf-8?B?cHFsVDNpd0FCV2dxVklpYjZSa0t6U0plR2k5SGFodnl0Q1FFYjRZWG5RMnpR?=
 =?utf-8?B?R0JvbnRQZjkyL0Z1QzEyVldnZ3k3aTZ0Nk03SFB1OFhrQUlSaFpDczdFOW1Z?=
 =?utf-8?B?RGhycldwN2FoYjF4SFgvU3BSRm84WFJ6WXN2b2hLNCtJb1A4R2ZjS2dWYjJJ?=
 =?utf-8?B?akcxcDFkNHdpYTFJS2xoU1BkZHV2YTVURnFxbVFEcytHbFRwWXZGT2ZUeGQ2?=
 =?utf-8?B?OFR5VTdpZ2c4aHJsWmFTWDJxdGE0UzFTVkRGd2laQitYMUtRbFJFRlRRT0dr?=
 =?utf-8?B?dTQxUSttdk1PQXJFVXdtRXF3bExtejhJNERITG12ZEp5QkJ1NTJEZGhhZkRs?=
 =?utf-8?B?djVMTUxRVVVrLzczTFlPTVBOK1Flcm9WcXpFdzBEQ0ZMNEY5azh3ekNuNzBH?=
 =?utf-8?B?Q08rdnBoTW9BREQxcnN3R0ZBSHNKSXZEVUpwNnAwMkpUUEwyMVR4TG9wOC9V?=
 =?utf-8?B?TENnMVVhSzV2R0YwOUJSVm53Q1BDbllVeXh5dTFSMHh1WkxOcDRnZDNKdEF1?=
 =?utf-8?B?dmI5V0NMcWZQOFkyZzdiZkkrUVBDaU5MZkt3WVBLNmtxU2Z3QkR5RldJMk1H?=
 =?utf-8?B?a3JQdzNWZ3hQV1VDeTFrU0srRklsRzdJbFRtNFVxT1FaWU9UblFHWlJuVGRt?=
 =?utf-8?B?NGw4QmpwSDUzL0xnZGtOOUtUb1RDek1HYW1DVXUxWFZHdHlKWS9PRVBES2tu?=
 =?utf-8?B?NHlVTURWTmw3Y21RUEJNSDhyQzU5TC8xelRNOURyNGtabmIwbVhYR25WY3Jk?=
 =?utf-8?B?WFZtSnhyRjR4d2ZqR29TanNkdnI1R051b1hRY3dCamE5aW51VVdvMFZnS1pN?=
 =?utf-8?B?eVQ5RWE1Qi9BWVIrWGJmUUZVT3c3em10SFFXbERJK1VLckFOSVA5MnhhZG5D?=
 =?utf-8?B?WDlQbHN2eDFOaVJoVWthYUorekxTU2VObFc4Uis5bkNFc3VmRkEvUEpQYUx0?=
 =?utf-8?B?WXQ0VmdjQzFNaFJvbnFXd1RERURQZUh4SmMxSEFMNmo5K3k0VWphNmtRaElQ?=
 =?utf-8?B?Um1VaHVzcmdldElGYWh5NUJEUm9VREY5TTQ5UnZieWJnOVhtc09TNTZoRlYy?=
 =?utf-8?B?cHBMNE1JaDZqRC96eU90ZlNHOHkwWThkWG9qTU9yOWt2UlZEMUtHTTFidVB2?=
 =?utf-8?B?N3ppaFN0eUJsbnhsZ3p1S3F4a2hDd0MvMU5qMEZ2SGhFZVNwZWR1ZjhncC8z?=
 =?utf-8?B?NUpZMGd0ZmYreld4OXFrMDlxc01BYzdPcVdUNjkyMHRJSUpta2VKRkRyVmdP?=
 =?utf-8?B?TTMyaHZ5R0NuK0lYNmNyVDFxWlE3TVJGTnY4Y2ZQWTVTbE94UlRncWdGUW9v?=
 =?utf-8?B?QkZhWmhXd2hScmJUUm9mc0xsWktvWDFDYWYrcWRNRnlrK2pWSXJqYkxac0ht?=
 =?utf-8?B?cG85ZERrV1RwWHYwZnA2S2NGUDN0c2VLTWs1bm11TkYzNXZMUlhRZnBnTEox?=
 =?utf-8?B?NnNjT095a0NOMW1CRjkwSTAzTUlYdHkvTGxUR3cvVThKbGpKSUlqb1Q1ZWtt?=
 =?utf-8?B?d3ZMQWFzTFJlNjQyZnFpdDhYeWRWSzlqTmY2QXV3cjExNmdhUGhraG5vRTVn?=
 =?utf-8?B?NmRVaXZmdlVkSjk2R1psNnZqTUt0Wi9kWlB6L2JnbmZNMTM0cW14cTUyNFZH?=
 =?utf-8?Q?fqC/cRcX6/y0SMBKPNO1hbH/3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcc9c29-de3d-465e-d871-08dc64f218be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:36:54.2094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/SPGuQSdkpy3jLUIwQMg98NX3BaOcbJN2L9iqVlA5g8QJsKdZjqiEcmDOm4WbaC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7915
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

Am 24.04.24 um 18:56 schrieb Friedrich Vock:
> TTM now takes care of moving buffers to the best possible domain.

Yeah, I've been planning to do this for a while as well. The problem is 
really that we need to keep the functionality.

For example TTM currently doesn't have a concept of an userspace client. 
So it can't track the bytes already evicted for each client.

This needs to be added as infrastructure first and then we can start to 
change this over into moving more functionality into TTM.

Regards,
Christian.

>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   2 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 191 +--------------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h     |   4 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   7 -
>   4 files changed, 3 insertions(+), 201 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index cac0ca64367b3..3004adc6fa679 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1404,8 +1404,6 @@ bool amdgpu_device_need_post(struct amdgpu_device *adev);
>   bool amdgpu_device_seamless_boot_supported(struct amdgpu_device *adev);
>   bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev);
>
> -void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 num_bytes,
> -				  u64 num_vis_bytes);
>   int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev);
>   void amdgpu_device_program_register_sequence(struct amdgpu_device *adev,
>   					     const u32 *registers,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index e9168677ef0a6..92a0cffc1adc3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -638,196 +638,19 @@ static int amdgpu_cs_pass2(struct amdgpu_cs_parser *p)
>   	return 0;
>   }
>
> -/* Convert microseconds to bytes. */
> -static u64 us_to_bytes(struct amdgpu_device *adev, s64 us)
> -{
> -	if (us <= 0 || !adev->mm_stats.log2_max_MBps)
> -		return 0;
> -
> -	/* Since accum_us is incremented by a million per second, just
> -	 * multiply it by the number of MB/s to get the number of bytes.
> -	 */
> -	return us << adev->mm_stats.log2_max_MBps;
> -}
> -
> -static s64 bytes_to_us(struct amdgpu_device *adev, u64 bytes)
> -{
> -	if (!adev->mm_stats.log2_max_MBps)
> -		return 0;
> -
> -	return bytes >> adev->mm_stats.log2_max_MBps;
> -}
> -
> -/* Returns how many bytes TTM can move right now. If no bytes can be moved,
> - * it returns 0. If it returns non-zero, it's OK to move at least one buffer,
> - * which means it can go over the threshold once. If that happens, the driver
> - * will be in debt and no other buffer migrations can be done until that debt
> - * is repaid.
> - *
> - * This approach allows moving a buffer of any size (it's important to allow
> - * that).
> - *
> - * The currency is simply time in microseconds and it increases as the clock
> - * ticks. The accumulated microseconds (us) are converted to bytes and
> - * returned.
> - */
> -static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
> -					      u64 *max_bytes,
> -					      u64 *max_vis_bytes)
> -{
> -	s64 time_us, increment_us;
> -	u64 free_vram, total_vram, used_vram;
> -	/* Allow a maximum of 200 accumulated ms. This is basically per-IB
> -	 * throttling.
> -	 *
> -	 * It means that in order to get full max MBps, at least 5 IBs per
> -	 * second must be submitted and not more than 200ms apart from each
> -	 * other.
> -	 */
> -	const s64 us_upper_bound = 200000;
> -
> -	if (!adev->mm_stats.log2_max_MBps) {
> -		*max_bytes = 0;
> -		*max_vis_bytes = 0;
> -		return;
> -	}
> -
> -	total_vram = adev->gmc.real_vram_size - atomic64_read(&adev->vram_pin_size);
> -	used_vram = ttm_resource_manager_usage(&adev->mman.vram_mgr.manager);
> -	free_vram = used_vram >= total_vram ? 0 : total_vram - used_vram;
> -
> -	spin_lock(&adev->mm_stats.lock);
> -
> -	/* Increase the amount of accumulated us. */
> -	time_us = ktime_to_us(ktime_get());
> -	increment_us = time_us - adev->mm_stats.last_update_us;
> -	adev->mm_stats.last_update_us = time_us;
> -	adev->mm_stats.accum_us = min(adev->mm_stats.accum_us + increment_us,
> -				      us_upper_bound);
> -
> -	/* This prevents the short period of low performance when the VRAM
> -	 * usage is low and the driver is in debt or doesn't have enough
> -	 * accumulated us to fill VRAM quickly.
> -	 *
> -	 * The situation can occur in these cases:
> -	 * - a lot of VRAM is freed by userspace
> -	 * - the presence of a big buffer causes a lot of evictions
> -	 *   (solution: split buffers into smaller ones)
> -	 *
> -	 * If 128 MB or 1/8th of VRAM is free, start filling it now by setting
> -	 * accum_us to a positive number.
> -	 */
> -	if (free_vram >= 128 * 1024 * 1024 || free_vram >= total_vram / 8) {
> -		s64 min_us;
> -
> -		/* Be more aggressive on dGPUs. Try to fill a portion of free
> -		 * VRAM now.
> -		 */
> -		if (!(adev->flags & AMD_IS_APU))
> -			min_us = bytes_to_us(adev, free_vram / 4);
> -		else
> -			min_us = 0; /* Reset accum_us on APUs. */
> -
> -		adev->mm_stats.accum_us = max(min_us, adev->mm_stats.accum_us);
> -	}
> -
> -	/* This is set to 0 if the driver is in debt to disallow (optional)
> -	 * buffer moves.
> -	 */
> -	*max_bytes = us_to_bytes(adev, adev->mm_stats.accum_us);
> -
> -	/* Do the same for visible VRAM if half of it is free */
> -	if (!amdgpu_gmc_vram_full_visible(&adev->gmc)) {
> -		u64 total_vis_vram = adev->gmc.visible_vram_size;
> -		u64 used_vis_vram =
> -		  amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
> -
> -		if (used_vis_vram < total_vis_vram) {
> -			u64 free_vis_vram = total_vis_vram - used_vis_vram;
> -
> -			adev->mm_stats.accum_us_vis = min(adev->mm_stats.accum_us_vis +
> -							  increment_us, us_upper_bound);
> -
> -			if (free_vis_vram >= total_vis_vram / 2)
> -				adev->mm_stats.accum_us_vis =
> -					max(bytes_to_us(adev, free_vis_vram / 2),
> -					    adev->mm_stats.accum_us_vis);
> -		}
> -
> -		*max_vis_bytes = us_to_bytes(adev, adev->mm_stats.accum_us_vis);
> -	} else {
> -		*max_vis_bytes = 0;
> -	}
> -
> -	spin_unlock(&adev->mm_stats.lock);
> -}
> -
> -/* Report how many bytes have really been moved for the last command
> - * submission. This can result in a debt that can stop buffer migrations
> - * temporarily.
> - */
> -void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 num_bytes,
> -				  u64 num_vis_bytes)
> -{
> -	spin_lock(&adev->mm_stats.lock);
> -	adev->mm_stats.accum_us -= bytes_to_us(adev, num_bytes);
> -	adev->mm_stats.accum_us_vis -= bytes_to_us(adev, num_vis_bytes);
> -	spin_unlock(&adev->mm_stats.lock);
> -}
> -
>   static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
>   {
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct amdgpu_cs_parser *p = param;
>   	struct ttm_operation_ctx ctx = {
>   		.interruptible = true,
>   		.no_wait_gpu = false,
>   		.resv = bo->tbo.base.resv
>   	};
> -	uint32_t domain;
> -	int r;
>
>   	if (bo->tbo.pin_count)
>   		return 0;
>
> -	/* Don't move this buffer if we have depleted our allowance
> -	 * to move it. Don't move anything if the threshold is zero.
> -	 */
> -	if (p->bytes_moved < p->bytes_moved_threshold &&
> -	    (!bo->tbo.base.dma_buf ||
> -	    list_empty(&bo->tbo.base.dma_buf->attachments))) {
> -		if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
> -		    (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)) {
> -			/* And don't move a CPU_ACCESS_REQUIRED BO to limited
> -			 * visible VRAM if we've depleted our allowance to do
> -			 * that.
> -			 */
> -			if (p->bytes_moved_vis < p->bytes_moved_vis_threshold)
> -				domain = bo->preferred_domains;
> -			else
> -				domain = bo->allowed_domains;
> -		} else {
> -			domain = bo->preferred_domains;
> -		}
> -	} else {
> -		domain = bo->allowed_domains;
> -	}
> -
> -retry:
> -	amdgpu_bo_placement_from_domain(bo, domain);
> -	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
> -
> -	p->bytes_moved += ctx.bytes_moved;
> -	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
> -	    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
> -		p->bytes_moved_vis += ctx.bytes_moved;
> -
> -	if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
> -		domain = bo->allowed_domains;
> -		goto retry;
> -	}
> -
> -	return r;
> +	amdgpu_bo_placement_from_domain(bo, bo->allowed_domains);
> +	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>   }
>
>   static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
> @@ -947,13 +770,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   		e->user_pages = NULL;
>   	}
>
> -	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
> -					  &p->bytes_moved_vis_threshold);
> -	p->bytes_moved = 0;
> -	p->bytes_moved_vis = 0;
> -
>   	r = amdgpu_vm_validate(p->adev, &fpriv->vm, NULL,
> -			       amdgpu_cs_bo_validate, p);
> +			       amdgpu_cs_bo_validate, NULL);
>   	if (r) {
>   		DRM_ERROR("amdgpu_vm_validate() failed.\n");
>   		goto out_free_user_pages;
> @@ -973,9 +791,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   		p->gang_leader->uf_addr += amdgpu_bo_gpu_offset(p->uf_bo);
>   	}
>
> -	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
> -				     p->bytes_moved_vis);
> -
>   	for (i = 0; i < p->gang_size; ++i)
>   		amdgpu_job_set_resources(p->jobs[i], p->bo_list->gds_obj,
>   					 p->bo_list->gws_obj,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
> index 39c33ad100cb7..e3d04ac4764be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
> @@ -67,10 +67,6 @@ struct amdgpu_cs_parser {
>   	struct amdgpu_bo_list		*bo_list;
>   	struct amdgpu_mn		*mn;
>   	struct dma_fence		*fence;
> -	uint64_t			bytes_moved_threshold;
> -	uint64_t			bytes_moved_vis_threshold;
> -	uint64_t			bytes_moved;
> -	uint64_t			bytes_moved_vis;
>
>   	/* user fence */
>   	struct amdgpu_bo		*uf_bo;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 331b9ed8062c7..5834a95d680d9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -621,13 +621,6 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   	if (unlikely(r != 0))
>   		return r;
>
> -	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
> -	    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
> -		amdgpu_cs_report_moved_bytes(adev, ctx.bytes_moved,
> -					     ctx.bytes_moved);
> -	else
> -		amdgpu_cs_report_moved_bytes(adev, ctx.bytes_moved, 0);
> -
>   	if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>   	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>   		struct dma_fence *fence;
> --
> 2.44.0
>

