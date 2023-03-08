Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646B66B0208
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 09:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF9F10E5B0;
	Wed,  8 Mar 2023 08:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84F510E5B0;
 Wed,  8 Mar 2023 08:50:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jG+4gGH7YQrlMlB5vnomlY1xQkqtx1dB2IdKl1l5Eu0ESSPs6OPD59sNXN6ZL2p7YGtQdkUeCq/Uq2zmkpWqVFwyXumhu/NSG0YLkGoj/gBPt4QaT5PzR5uMRUMeZSSz0p1scP8b+CZ3aO36pBZmt5fv71+F7jkTZKREIvXeEpibdZaKGgYHwABJmCCvVNex2kkjHd2wfpsfrbuPKkyp64ctFaDglyzcaR8Co2OcHKHnl8QHTtUsSsNbP3NJ94zaD+yXi230FLnGepn9YDFv63j1WixxqRuIOefMENC1YpCBpnTABDydD/6JvMg6VZ1D35aXkfKmvtF7lRsYgA2+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4U0NKNv3PZOTDNWlG67EtUTaSOBzy7dpqflrF9IYs4E=;
 b=ctVRULT96nEJ1S5mai2+02TzBlNJMwVSUOsBsO6bg3wdssJ4FjiXqQTPmCeZHk7moIS58ktWZ7jtUObkDgqW/dwJwSdpuxODa79pe5g5avNEthGc2Oi7/gxu4El+Ugswb6hfREwAmbZVqP1GMsPPq+TpcqsztlV4i8IC4SYiOtIbvXuVD2WUQWa4/3Ym4DFoWHMs+dP2HV4ozoBnWIgvygA7X+lyYIMBjtkef7XbfhU1BNF5lkA1Cgj4GxyrjRB+4wzK1qUCmJXzllGP1IZcP9xy30VB3rEOWexewAhpVeESgkgUco/0RAoYq3QimQKl5nyTRu3vzqajFHEd0ZVUOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4U0NKNv3PZOTDNWlG67EtUTaSOBzy7dpqflrF9IYs4E=;
 b=W4lRNKElZaL0pDEfWMgX/DDKGLdqB51ZMSClkKP9Zg4IqCHYze6vPCS+Dwz+JFOI59GTuTE+XDGbefWV1oT5ZN8Ns5E5Y4Ja/vRd9Q+TnYSlQ0xhuE/4bd0tqQlQXrAqKG4z0ZYGI6KAblPBjskW0Ig9xzlkZnwsQdmr20W2lOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB7670.namprd12.prod.outlook.com (2603:10b6:8:105::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.31; Wed, 8 Mar
 2023 08:50:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 08:50:40 +0000
Message-ID: <828a9f30-08c8-2107-2216-c8954fd3cc91@amd.com>
Date: Wed, 8 Mar 2023 09:50:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 5/7] drm/ttm: Don't print error message if eviction was
 interrupted
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-6-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230307144621.10748-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: c20533c1-1811-4499-3caa-08db1fb23185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3rslKWu06trJ1QkLd/3tdZjh6SFcl7vPUn2v7MAIrbYwey5ae3mcj1KSVmNwhPQKwPEXBBnVYypUq/385sch2rqbJkXYmgjEu/Br5kvAytXWP318KtrsR//dVoTVZbVtmmZ3Tmp/iqP/2r3SVtA317Tj86HVKtmVwEXT5vdoEM5u95LyaDxofwR55S3nl+OdzRhkuz6gwM+jliaSX5UCc8rRK1JVKJEcq8i+UV0SkQHaFiIxQgCLPyb9Q7cBkc/G6xFNK8770XyFRYSagz+x1xjBUf/Z+cvW9VYALhuQOy/NWOKgTKraz5tmpsjUfsEBL8IAHSUmF5Tzrj/wx+0meFTu3fKDMO+HJezyxNGl6d2QAmZlJgpxtBVNqgbTK7K2g9CWEPW5FpFqSXnNy6dqn5Ii3HCHE6+z5MRQZsonNV9nHXtGt0jo8oSc0ADXnjq7WOaculDiZD2IbVkMfhzKTl9kXWb8I9VSRWMmEQNFe+CMPAxL7kPSt5+Qpz2iTRPmfTlZ3YvkWJmWoGodIMv0CPYBiogQ/GZCV0OL88TnjyK5OG98JvPNnRE0IeMATsqyb3Yd/WkzjqsEw2VOKNEssgk0PB7VZUzRH04SWkZpCrGADV6Iu/bq8ASrwLqKnnzm4TehNAOr1Y/lMy728VYbiYleqWb8NSMNImBnIJXOfNlDzlaQWVHPpklHO5R8YgKT6KSXh2Xr+TJckMh1Q9L43Kpkdk1TclefjHute5H9Xo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(4326008)(31686004)(41300700001)(66574015)(8676002)(66556008)(66946007)(66476007)(316002)(38100700002)(186003)(36756003)(2616005)(8936002)(2906002)(6486002)(478600001)(5660300002)(15650500001)(6666004)(86362001)(31696002)(83380400001)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWJMU2RacFRFd3IvOERvRVZjb0ZKTnU1MmZOWnBrNi9ST1hrOHQrZXBwVUR1?=
 =?utf-8?B?dlAwb1lWVHd0NnN4K3F3SWVTNWVzOGVrcEU0MEpScmc0V2I0Mjh0d09scHpo?=
 =?utf-8?B?TlI2cEhPVFFpbXBxK2NEUjI1cDNYTFM5WEF3bFRWVGZGTTVBS200ZXJCWDVO?=
 =?utf-8?B?NS9jUGczbG5aT2JMVVlqVzgxSXBWbFNUNFQ0OUxBd2w0c0phVXhOY29mWDdX?=
 =?utf-8?B?QW9INlNJdUsraDBSZi94WnlsR0J6MVZaSllyOGNybXlweDJTa3h6ZnpUT0xm?=
 =?utf-8?B?RW1jMXNMZkVuVEFKT3FYZ3lYRzM4d1BNdW9QYk1oUndXbGg5dHNyOTZIcXcv?=
 =?utf-8?B?QTBJQTBkK1pwVEk3OHVOSkZzSFh1NXJFOEdtbzI3cU01NmlacmdQTWtDTFdU?=
 =?utf-8?B?SXVOcDhOckIvYmR2ZGZ1eFJibVVsMGNOV3EybGdzOUN5R0I1dVZ3WUMrSmRh?=
 =?utf-8?B?K2FVcGdBQ3hEajQraVA1WUh2b3ZwZnhlSlpXbW5lUGIwbnZVUWRwdVdDVnpP?=
 =?utf-8?B?N1V1dTg2RHhObFZYOWJ4cklsQ3hQK2tFUXp1TjlxL0t5dVNzOUE2MjlSR0xQ?=
 =?utf-8?B?NEpQeUNwY3J3OXVZVjhvbFc5OUl4WDdIUElqUHczRzByeUQ5RnlXQjdWM2c4?=
 =?utf-8?B?MnZQYnZzZEhOeXBtRWMrRy8wcFBqNnFPR0Y0cU1wOFN2UUFIU01QWVlGR0Rv?=
 =?utf-8?B?WUlSK1NlU01xZTU0MlRvRW4xdTFsU25PVUc1RGZKMjZrWHRTNDZZQ2R3WE5W?=
 =?utf-8?B?RnZSYUd5SVZsYzhPZDc1Y2d3TUFwK1h5M2FwdkQzSUlwWjNmUjA0b3pPQXFF?=
 =?utf-8?B?cGhSc203SmhlTlRRYVZudWdRakdUSHRablE4SWFSVjJ6TlJBTlZBKzZmZ2pO?=
 =?utf-8?B?Qk1XaVJWU09uQlVndWFPTEJZSENxeEFmbm92L3h5WFNHRDhUcHR2aGtpT25P?=
 =?utf-8?B?aHFzVEVob210cjQ1VFhEcnBJTmRpT0VkNzhRQ3M2L2JDOGhQYmI1NW1XNVJl?=
 =?utf-8?B?TmhMbGZaRU84bmxKNGhld2lVYUQxeGY2dklOd25ldXAxSEFlR043ZDFyKzdV?=
 =?utf-8?B?ZnJKbER0S2F0YjZPM1hIUExueW9oR0NMTUl5TUlEZ1FKN2hDcU9leFoyZnZJ?=
 =?utf-8?B?aVI0MytMNWZuVEFGVkErcHZDNHlPUVF3MUo4eGg3Wkd0cVRId2lOdExMSzVY?=
 =?utf-8?B?emNuSVZFZlpreDV0K2l1SjBHcHYxc0lqOWsyWGh2V1RYalVhbkZEUVJ1L1Jo?=
 =?utf-8?B?MEpFUkRoTElycm0ra1BhQWdVL3ZXT2N0NkJ2N0R5bkF2emtoSkNBRnhDRXND?=
 =?utf-8?B?Rm0yVkZuSU9uK1AwY2lrT1dtMXFlcXp4bVhlK2QyVUl5MzFjZzRQT21HVUkv?=
 =?utf-8?B?Zm5NNHRxNVRPOUdFUml0OUZoOGxyZ00yaWVRYzVEOWZkZWU2UWdqTG1ERDZH?=
 =?utf-8?B?emxrSnhaaGl1a0ZmSmZRYjZOMUdacWk1L01odjBHbml4YlZyTitHZXJyTEIw?=
 =?utf-8?B?dFJDRzQ3QWl0OEZvc1AwRFY5N2VnMHdtZDdFRnRoN1FhWExzZjFYK1V6OFVZ?=
 =?utf-8?B?NWc1bytJYTF2WTl6UHovTGljMmh4RUt3SDAvTVRLZkdxTmFBa1Z2TCtZRU5q?=
 =?utf-8?B?ZU9XNlFtdGIzVm43cnl4aFBZZ255NjlsYU1UOXU4U2F6RlNvR2MySXhFcEVR?=
 =?utf-8?B?SG1kQ2xjMFdEQW53ejFVZXBnL0FpOGp1NFVnRVFVeGhybjllalBZZWRibG1C?=
 =?utf-8?B?ZFJBeUhrMTJ4V3g0SFZUU0lKM0VVdlVFWFhUVnlCbUtTZG1LSTZJZWZrcjFs?=
 =?utf-8?B?ZE5yQmJCaUhZcTZIdjI4N2FSWjNQTTY5SG0wZm1tait3dWZWS28za0FqNWFZ?=
 =?utf-8?B?Nnc2eFdmNW42cHU0UzdtaUczMHlaS3oxVXIrMnF1Vi9zOStkK24ydUU2ZjV4?=
 =?utf-8?B?M2FDR0wrN3ptS2tOd1RBNmJoVGRjMXBqL1ZpalpoMUZoYStFSGdtTi9SQ3BZ?=
 =?utf-8?B?QU1Ralg1RmgvOGRzT01DWkpKSXhGdENVSDlxRTJSdFkzYmM5WkNrMHZkb2Vm?=
 =?utf-8?B?eXdRMlhoWDExaDM2a2NFa1Y1MTY4MWtHR1c0NlRNSnQ4bnpDTFN1MmRSa2JN?=
 =?utf-8?B?UktUd2pyUUE1Y3pld2pudFhTWFFHRmE1enFCMnJpcVduR0NWNmY3VWNQQXJI?=
 =?utf-8?Q?1uuPJDuxBJLGf1a9K57djAWrDxtZWdQD873a5YN45X68?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20533c1-1811-4499-3caa-08db1fb23185
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 08:50:40.0699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgI5GRz6OgSTgbScKEkHevZEMvTachDIxSbCsKf1i9LTDtWSOIt1O14uo2zADPCO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7670
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.03.23 um 15:46 schrieb Thomas Hellström:
> Avoid printing an error message if eviction was interrupted by,
> for example, the user pressing CTRL-C. That may happen if eviction
> is waiting for something, like for example a free batch-buffer.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 882c2fa346f3..459f1b4440da 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -464,7 +464,8 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   	if (ret == -EMULTIHOP) {
>   		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
>   		if (ret) {
> -			pr_err("Buffer eviction failed\n");
> +			if (ret != -ERESTARTSYS && ret != -EINTR)
> +				pr_err("Buffer eviction failed\n");
>   			ttm_resource_free(bo, &evict_mem);
>   			goto out;
>   		}

