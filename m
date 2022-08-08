Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3E58C75A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 13:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4FB98A89;
	Mon,  8 Aug 2022 11:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB9C97180;
 Mon,  8 Aug 2022 11:00:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kx5Py4mhKHRBqruNIuVHwC10uZ8jMWRrtwnsOKJbQcD6YIl6gh54kVzZ0N+/uoAsQ/ZKRkazprg85W7ZKfUp5vT/fFjSIEyMfEfVrbDcmWB6FpA8D+UpUbifJTWKxMNIaviF12bVv060+NB72q8ai1desKYAAcDv80hMwXjQ/wHFI8kDZHsTsxEyM+LrXp0/CFhzBdcDLlbCx4QXOxAG09PU0pWW8103OGgbId96fs9BxAthDmhvJHuHTGkbD1yqms57TbUzK3VojU4myFEejwghCd8t8qFc6KzB68oC6DQUxsHdYqblUQvSn1UYK1VKS1d2FE4Srs9K6EesPunUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Rzb5w0yl8FalnXsHxrelBgvG8IfNT9lSABf+ZjSu6w=;
 b=PFlTgwYiB6wIurcacYjruI0XIougiKCa9rHDgVStHK4gZ2f4+7Hqg1iKA7wx/ABCcqma1ArYfChbhKRW9BGQr3+7zEdzdudVLZoO9Mn9ZFpm3HKWF9/CsOsW5q3K0pewpP6zrrZG3wEX5SQkF/lJTa8WstDNQ2rBvNMVC0m34+QFuE4jB2OdVjYY1zeWnyQvgagn7CPQbWh/ZjDHnXnGU9IlyhPSaty4nO8EevSNppK81lF15Q2C+9WQIOCooSD0hG7A5YCzBANhWAhECuSkCHAzVdV8MD8SJglbPYEPWwIhZjOJw34KKYgxhMUzfqSvaSdD2seu61SS3B8VdMYlzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Rzb5w0yl8FalnXsHxrelBgvG8IfNT9lSABf+ZjSu6w=;
 b=4WOKp1gtF9gXvDDXFhrTHKuusaR6RnydsNn05AbPmonMEWr6v2EjL+/Y1JsmOYXN5E1tRsJMz2BD8YzzYPKbeX4cqeBLu312TE3TN9yeBKErlgjAJ2OKpWRFO3pUlSPahTkTnrap1MIF3KaEm/Q/23R94KulVY2ohbSnOR7oDf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB2995.namprd12.prod.outlook.com (2603:10b6:408:41::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 8 Aug
 2022 11:00:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 11:00:03 +0000
Message-ID: <acc970f2-632f-0372-8082-6bd54f0c7cf5@amd.com>
Date: Mon, 8 Aug 2022 12:59:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] amdgpu: add context creation flags in CS IOCTL
Content-Language: en-US
To: Shashank Sharma <shashank.sharma@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220802135558.6324-1-shashank.sharma@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220802135558.6324-1-shashank.sharma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2609aa20-b480-4657-661a-08da792d255f
X-MS-TrafficTypeDiagnostic: BN8PR12MB2995:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FttIps4t8BhHvtdmWfM4TiY5cEPGi73LH229RAvm+WEZD1IBVD5ELPjce8BMEj0b4tRtjMieccs8QnWnUqwSOxgOVxE7O1z0HUZmyzubt6+pnf5JXivn4kBjn5/to9x7AXmhP5K5Ice8e5qc3nYKGezfnUm9E/b/vOykGpbldhLotW5CLd5GF8phSVJFdp0RnnmCSifUJG8n8S+OSikGeNXsrZV0rKwD91ENIbhwxonOhuB+PzqjfZ0jZd09mrhotcQQFUll0jARdWvp80gn5R+fv27yCB2JStPEBcUK1vqpr9CXUjuovsKzE37d8TL32sk5BTP6jj2zd4BsVYyAZq7RiuJtKLBDFRHg+R0BGPcLyUL5kvj5zpMZHG+dNvZZAxLE6fK2m79soa2SMwuRVo77I+n9hT9Mm6xnXEWbGJKELdq1lejWu6KrB9gEh5MCieOT1h7z/GhU+zrOHv+Y5LDnG43mP8+x2Tecfik5f10Zlwy2e7ykdxrN3k7f/hGqQCAKpxstGOqFrUQSH00rUqbHNUe+kDphTpYP9zc2vnjm32/hvnKhMB19XXHhjaDJtlmf8fTsVjzo5eSUamEsrJ8zcXpQSrAaGQ+U/XjL1WZleBKlyZWlz1ko2Klu097KqqoYirIPnHMSSaW3A81i7WF9ESjLxhgN7BR3agxPWD+Hc3lzmwSO4cosQc0LOKZaWGBRwtjMOFjnsbMhfe8ZmsCNOac7r/vTNvWjbyUyrUiNYvP8lDDMbM1vzL8aiVYZDztFoXnSTLzyXH9xyyTmGlHtYD7oPFk8twgzF3KzMyVeRL/SxZ0dMN+Nkh+lqKdHRGtzPSdBEoxVLW4u0cvHRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(186003)(41300700001)(36756003)(8936002)(5660300002)(31686004)(83380400001)(2616005)(2906002)(86362001)(31696002)(66476007)(66556008)(66946007)(450100002)(38100700002)(54906003)(6486002)(478600001)(316002)(4326008)(8676002)(6666004)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG1oeVVoZEsrejA1VHRpcXBZWUFWdkk3ODJFRE9zbHhLZU5LQzRnT3gxbmJx?=
 =?utf-8?B?MGwxQmd3Z05pMEFhRDhDUUZvSDhHZVU3RHpuRlY2VGUzVFBUdGJsaVRCWVhz?=
 =?utf-8?B?NTUwWXlEMHVBUksyK3h6TytzbHZ6RktYRmRuTk4yb0hvbGRaZmVMU1V3ZCtv?=
 =?utf-8?B?bkpmMkdoNWhDSFVzMXBWTGtrV21jelZWVXduZDFpMFhEZ3lyQjY1dmdDeUM5?=
 =?utf-8?B?TU5aV3lJVjF0L1pOSGNWdUJueVdKeWxGaFdodWZuVys0N012N1g5cWZvTW4x?=
 =?utf-8?B?UkQ2WjRXUDJzK2NGOGJzNENBendlRW0xN0poSHZHQS9RRXFyUUVJV1hhZWRI?=
 =?utf-8?B?WHcwWHFrK2FUaS9oMngyQmpEUFpnK01zWG5nd0JCRTdDWFBtdnJxZGlFZXNq?=
 =?utf-8?B?c3RTVEdFYWtEMDFPL0VvNDVxeVQxcEJ3L01ITjd4RmZVeHJLMlVnOWExeFRq?=
 =?utf-8?B?ZE51YlhHZUdQYzN2SWhvY0p4UEZ0MnZ1KzRFTnVmK0NtOXlYY3NjYTJqYVNY?=
 =?utf-8?B?SXpzNGFySjE1OWxnMVdreDZnazl6amo5WXVPbUFCS1B0cjlSUW4zREpGZ2J0?=
 =?utf-8?B?WDdqRTEzZ1VKWkl4U1ZoSzhYYm1EeGlTenJGcE1YdXdVb3FtT090MDhoSnlx?=
 =?utf-8?B?c3g2aEpkT0VqOUNFb0Y4VmRDSmNJNjkxSGFPNGxRd3R3Y0F6Y285SVZBK2F1?=
 =?utf-8?B?dkpxRUVPczFwdnRmTnRJWGlBUE1oKzZTNHVTYndaN1BrVG9nQ1gzbTR2R1FU?=
 =?utf-8?B?WlFHVSszOHhLWVZDMDFQKzBCLzg1ak9BR0kwOUZObGZTWlpnR0Y0MjdqNFNm?=
 =?utf-8?B?NE1qZGF4aXdBTUpGc1BTU3cxdVgzTE9EY3lUYVJTc3hNcDA0azVSNGpxMkwr?=
 =?utf-8?B?c3ZzdG1xajgrNmdKTWdBUUxCejl6VTFkUTF5QWZhU01CZXNHSWc0UWhLbG9L?=
 =?utf-8?B?aEU5RW5ua1F2RG9NSjNNZVhXV2NmSlRyaWJNaXVxbHNoaUNNbkRMUHB0OG8r?=
 =?utf-8?B?dmJxeTB3YWg4NE02NGFxU2w1ZFFzZU5ielFRa1U5c1gyZnZYOHVpNGp6VjNn?=
 =?utf-8?B?RGxNbjUzZkVmYk1FT2dac3dVeWYrN0d5NFgvSWdYMmVFTWZSOTkwQldidEpp?=
 =?utf-8?B?dmMwZUJWbDBkMnNMK3lucUpKK2k3bVNtbnZTaDBxMnRkSnZUZmFUUkFNeUdQ?=
 =?utf-8?B?bWpDV2xEOHFwalV2Rm94N2p6NjNwSUxvcWdMcUllNFc0NGtDcU1TcnhoYWJ3?=
 =?utf-8?B?RXZUT0tOMFY3REsrZmNyYzRrU2I0eEQyNmFqd0lHK0I5eWxpRk5wQW5CbTBQ?=
 =?utf-8?B?TGlucVlMWW9odjZ1OWRJbFRnaHFMaCtDU2p1ZzhwNFVRSkQydU50NldFWWtw?=
 =?utf-8?B?WW4rNlJnZ1YwZ3hZSWZadWdFME5ncFZkWFpicEhXT2RxUGN2ZnR4azNTcUF2?=
 =?utf-8?B?Z2VRc3J3TzlIUkhIQXhhZ2RVa1VHM21QaSt5Yk13ZVBUeUFrTFZ1MEt1Tk1m?=
 =?utf-8?B?N3N0ajFlWDFRWGJ4RzR1Ly9QVG1GNDBVdTJFOVcvMUlnOWluUG9QOHI3RTlI?=
 =?utf-8?B?VjlZeENKMWlhdzNvRDhtbVdIR0EyZVpKa25xbis5ZlZxQ1dkR1VuTStSTG4r?=
 =?utf-8?B?K1l3WWRLV0NteFRGazVYYm52SXREQ1ZrM05QeVRVSEgyaGdYSDVxUGkvcW03?=
 =?utf-8?B?ek9BK2VGUTNIaUw2SG41dTNHOXpyeGhqUkhZVUh0cjBjSE12WkpOQ3BtK2p3?=
 =?utf-8?B?SXJkVFg5MXhVSHMzd1F3V3lpRFZ3NmNKRUFTdnJSYVkrYllDNjFtZVlvNDd2?=
 =?utf-8?B?NGhzcnJPVVdrbkR6Z1VyQU5yUm1zYWUzQklHbFE0MTllYVZ5RHk1M1ZZM21k?=
 =?utf-8?B?Um9OU3lyMmlySXc4V2dVeEJLbEI2WFd6SCs5MWZQbDRPaWdSaE1sYTBLVWZY?=
 =?utf-8?B?U2FLK3J3dzZnQWFMZ255L0VvNUUxbk4vdGNHUVFVWkp3Ymx0SmxOZiszK2FR?=
 =?utf-8?B?djU0Y2draFhHYnlORXNxZUVkWU9xd0k3YmxOTU0xOWRqd3RHcmhLQmRwK2tX?=
 =?utf-8?B?amdMc1hRQkdiTFE1VmhRcUNXME1HVFdCenpBZWo0eWhjNEU3RzE3dXpiVTlC?=
 =?utf-8?B?QVBYTTcyZWFSZ0p2cmlLT0tPK3c1MjFJVXdNRmpRMW5tN0VSOCtGcXA5R25N?=
 =?utf-8?Q?gDGCnw/cL+rc7clpvJ3lx+LRDjsvVCeku2eb5ecptZL2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2609aa20-b480-4657-661a-08da792d255f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 11:00:03.7282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Y8VUhrMAabAAJHuxZs+dfF85Rq+r6PVP/bgDiHDqlia1YdttMU0p1BVsf8iuBb7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2995
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Marek Olsak <marek.olsak@amd.com>,
 Amarnath Somalapuram <amaranath.somalapuram@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.08.22 um 15:55 schrieb Shashank Sharma:
> This patch adds:
> - A new input parameter "flags" in the amdgpu_ctx_create2 call.
> - Some new flags defining workload type hints.
> - Some change in the caller function of amdgpu_ctx_create2, to
>    accomodate this new parameter.
>
> The idea is to pass the workload hints while context creation,

Bad idea.

Please take AMDGPU_CTX_OP_SET_STABLE_PSTATE and 
AMDGPU_CTX_OP_GET_STABLE_PSTATE as blueprint for this and don't add 
extra flags to the context creation.

Regards,
Christian.


>   so
> that kernel GPU scheduler can pass this information to GPU FW, which in
> turn can adjust the GPU characterstics as per the workload type.
>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Marek Olsak <marek.olsak@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Amarnath Somalapuram <amaranath.somalapuram@amd.com>
> ---
>   amdgpu/amdgpu.h          |  2 ++
>   amdgpu/amdgpu_cs.c       |  5 ++++-
>   include/drm/amdgpu_drm.h | 10 +++++++++-
>   3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/amdgpu/amdgpu.h b/amdgpu/amdgpu.h
> index b118dd48..1ebb46e6 100644
> --- a/amdgpu/amdgpu.h
> +++ b/amdgpu/amdgpu.h
> @@ -874,6 +874,7 @@ int amdgpu_bo_list_update(amdgpu_bo_list_handle handle,
>    *
>    * \param   dev      - \c [in] Device handle. See #amdgpu_device_initialize()
>    * \param   priority - \c [in] Context creation flags. See AMDGPU_CTX_PRIORITY_*
> + * \param   flags    - \c [in] Context flags. See AMDGPU_CTX_FLAGS_*
>    * \param   context  - \c [out] GPU Context handle
>    *
>    * \return   0 on success\n
> @@ -884,6 +885,7 @@ int amdgpu_bo_list_update(amdgpu_bo_list_handle handle,
>   */
>   int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
>   			 uint32_t priority,
> +			 uint32_t flags,
>   			 amdgpu_context_handle *context);
>   /**
>    * Create GPU execution Context
> diff --git a/amdgpu/amdgpu_cs.c b/amdgpu/amdgpu_cs.c
> index fad484bf..d4723ea5 100644
> --- a/amdgpu/amdgpu_cs.c
> +++ b/amdgpu/amdgpu_cs.c
> @@ -44,12 +44,14 @@ static int amdgpu_cs_reset_sem(amdgpu_semaphore_handle sem);
>    *
>    * \param   dev      - \c [in] Device handle. See #amdgpu_device_initialize()
>    * \param   priority - \c [in] Context creation flags. See AMDGPU_CTX_PRIORITY_*
> + * \param   flags    - \c [in] Context flags. See AMDGPU_CTX_FLAGS_*
>    * \param   context  - \c [out] GPU Context handle
>    *
>    * \return  0 on success otherwise POSIX Error code
>   */
>   drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
>   				     uint32_t priority,
> +				     uint32_t flags,
>   				     amdgpu_context_handle *context)
>   {
>   	struct amdgpu_context *gpu_context;
> @@ -74,6 +76,7 @@ drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
>   	memset(&args, 0, sizeof(args));
>   	args.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
>   	args.in.priority = priority;
> +	args.in.flags = flags;
>   
>   	r = drmCommandWriteRead(dev->fd, DRM_AMDGPU_CTX, &args, sizeof(args));
>   	if (r)
> @@ -97,7 +100,7 @@ error:
>   drm_public int amdgpu_cs_ctx_create(amdgpu_device_handle dev,
>   				    amdgpu_context_handle *context)
>   {
> -	return amdgpu_cs_ctx_create2(dev, AMDGPU_CTX_PRIORITY_NORMAL, context);
> +	return amdgpu_cs_ctx_create2(dev, AMDGPU_CTX_PRIORITY_NORMAL, 0, context);
>   }
>   
>   /**
> diff --git a/include/drm/amdgpu_drm.h b/include/drm/amdgpu_drm.h
> index 0cbd1540..d9fb1f20 100644
> --- a/include/drm/amdgpu_drm.h
> +++ b/include/drm/amdgpu_drm.h
> @@ -238,10 +238,18 @@ union drm_amdgpu_bo_list {
>   #define AMDGPU_CTX_PRIORITY_HIGH        512
>   #define AMDGPU_CTX_PRIORITY_VERY_HIGH   1023
>   
> +/* GPU context workload hint bitmask */
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_MASK    0xFF
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_NONE    0
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_3D      (1 << 1)
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_VIDEO   (1 << 2)
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_VR      (1 << 3)
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_COMPUTE (1 << 4)
> +
>   struct drm_amdgpu_ctx_in {
>   	/** AMDGPU_CTX_OP_* */
>   	__u32	op;
> -	/** For future use, no flags defined so far */
> +	/** AMDGPU_CTX_FLAGS_* */
>   	__u32	flags;
>   	__u32	ctx_id;
>   	/** AMDGPU_CTX_PRIORITY_* */

