Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B64156E79A8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 14:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A82310E191;
	Wed, 19 Apr 2023 12:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E89710E191;
 Wed, 19 Apr 2023 12:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePrukuU6MYVsCZ7jztdaaduXJCBHjDDB8RLTs6m5/hgcGBr9PMCGOw49Yha8vRnkPJkQkI8v3j4SOfonC0LYKpB1Ln4xTu19SV7kLT/xuHTbHufpCN/aloR3iMtrE0Kiqz1CLOg/EwjEaBil6Y11zcpCmZ1xvfLtThLVpOwJFMbL69hgm+cYGpQVAj8Yfz3LkXyrbXm2rHbdYOaechLrDwxdu+X6N0uju3hh2Ma424V9UKu6n5hk4l4aqwxGPneT95N74wgbe2wi5hGEJF96EmQvy8Z83YbD5vtWWxnt8RXLUVBk5qgMFzfjazKzcUQ3SCmLIOzLn2hlRks5Ft9/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMOgPBKlG1ui4XqzOmPKAEix97cRLrKEn4w4syOFHRM=;
 b=NBYu+3XcREbz+X2GbVAPRBlPHcW0mAXDXyzbvA/sM0QnhpfessAzmT3tDToXisMm8pUnF2WX9jQDbUOkx7lVT0bClbjxCg2o5iTimtFHFlbzgKaOz0V3AhCPO882x/KdwXeZBwKUQ+DLx/mHJhTagiGCiAndmtZwAydrvPWnL6kosr8HQ9qy0m8ahOmmF1cvMd3+frXPUSHJBw8d9ogkq98fsCH96p9Cfv1fFk77zfnQD5TVApYs6shhndbFM+tZ6Lgh8lHytzs9sjKbpFkgtaKOnfNOCpEEQERgyx53aNC5f+T5+4CMV8CwaxESal+lFQ5ZFhIG7bD13uQwYl2ocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMOgPBKlG1ui4XqzOmPKAEix97cRLrKEn4w4syOFHRM=;
 b=inV7iwwDHSXgksM/PvNPilJ9s5S9+Kcof//Q6DiWMp0iFe9wWfwRK0NgP9rsAtxDu0gP/qLCut4UKuaue2YJ9vM0zoLGCfibP2NcLpjQ4O78j6vNj90t1MfIjeTP6A4KqCIUpsbXH8kcxpXe6vqt97kJFrPdjvzPe3yHVfNS85o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4558.namprd12.prod.outlook.com (2603:10b6:806:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 12:23:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 12:23:56 +0000
Message-ID: <62ae58cb-9fec-37ca-fd40-12bf0c1c5ba3@amd.com>
Date: Wed, 19 Apr 2023 14:23:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 1/2] drm/radeon: Fix integer overflow in
 radeon_cs_parser_init
Content-Language: en-US
To: hackyzh002 <hackyzh002@gmail.com>, alexander.deucher@amd.com
References: <20230419122058.3420-1-hackyzh002@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230419122058.3420-1-hackyzh002@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4558:EE_
X-MS-Office365-Filtering-Correlation-Id: cd612fe6-04b4-4bb8-f82d-08db40d0f1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+lsjVkH4CGZHza0arSKpBs5Re3wSP3QwejS5bjWGlX8RtNPAoMh20MPlZdZcHqKX/lgELkXnjNA+oZMJaIKdkHQg0H9BSjzYsAHlQcW72G2KUKeVSmGkfRV5JuKof1GOstaGaF05SVFa05wzw0fr8v/fqsK17zkIpLl0J5Ksp6j4WMem0D1i4zWvscHq8Kw+MtrGeHKdiprs3Dc0E7rMxfvWHhyr7AXO/fKtdBwZRZfCvjn8Ah+r6axh6VMLFfj2qZkRUlu5OQyjLq7WfzzRzpa7M/okIYviL0N/KCT/nl8mKGff7JOGgNOTc6Hfj6bBpcwA8xy6pIUn0rMYb+m3shtepVi7PsUts9QKg4QvFSN54DHozddBkajggxE+X+gebDMq6v4Ytk/sgInhcu+4JWZW3zCeVSL3vJ8K+4ODMP5neLtiVk41I/62WLxs+lbfHba/GJdvWjVrOPMEqzm4sarNbkIUPW96Bps5pweFqE5ndQOp9OFLqS8cLeudxN9e65rB4UE0i65hltKmkGr4gaf305hLhiIO8kOmaPmA/Z6qimKro0hbX+iLC2SK9socgtnG+mT2iskQtt0/qR+BTyKuC4yQc2lEPskAiSxOE6Q111SFLBotiMbiDZhOTcuamylFSR7X5TP52pOXBvpLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(36756003)(86362001)(31696002)(38100700002)(478600001)(6506007)(6666004)(6512007)(6486002)(5660300002)(41300700001)(66556008)(4326008)(316002)(8676002)(8936002)(2906002)(6636002)(66476007)(66946007)(4744005)(31686004)(83380400001)(2616005)(66574015)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUd1L1hrUGt4RWZuRnZDMGtQN3J4WHRqTnQ1NksyUzRpNkFJSUlWOEd1U3FQ?=
 =?utf-8?B?WFgyMWdGRWJLUUVYYUdIajFSZi9ZSTVsRFVURU5jRVlzbGhwMy9iZHFNVVg3?=
 =?utf-8?B?RVROcVpNL1pIVGRFZ2pIbWtRNmFqYnozSm5Dd09SUzMrVnRvMHdNMjV0MU85?=
 =?utf-8?B?ZXpBWmVJUnZFeUkzWFNMaEZFeVh2bXNWYlVqMVFKWlpTR1dhQ0dmU1EvWFI0?=
 =?utf-8?B?bnFHVnFIL0YwSUR3SzRPejRUR2JsWEtHT21vS2c0QlFlNDgxZmVDUlFsblg4?=
 =?utf-8?B?TEh1UEp0cDNzakNNOHdmeUFSTjkydzllVzZnYzJESGtPYThpVkZlcjR3Zy9v?=
 =?utf-8?B?SlpVWTd6cWo5SGo5emNUSE5KdnFqOTVEbDgwUFVmeUJ3QWtiZzFidDErQVpQ?=
 =?utf-8?B?MENFUTBRYS81S25hVlUrMmxldHlSLzltc2xnYXUwa2R5K1hpZVZqUjRHSFhI?=
 =?utf-8?B?cTZhd1JxZ0M5YUVkZTF4bG40TTA2R1R6bmtRQjlZYi9oTWJDbW9CUjRTdWtJ?=
 =?utf-8?B?RjBrWkxyaGN5OU9MUm9NR1h6cW5EcjJ0UlZsa09NbDM4SHd4MGREeVEyQnJi?=
 =?utf-8?B?b2IvZVhtdFZuRnVaTUkrVUZhamRoRFJVc29SazREZXFWM2UyTEVBNGFYUEZB?=
 =?utf-8?B?ZDBySWdXTUp6cjFxVmROUXQybHhyV3dDMzZNUEF3RTdPWU9PWC9QOGx4RUVQ?=
 =?utf-8?B?dWtFMWtSaVFydFVRcWNKdEVkYzN6bGN1UUxqK0o5dWdocDd6Y2I1RDZINFps?=
 =?utf-8?B?Ui91TEFqaXRCZk9DNldPQXkyNXdKSHlxZm93Zk5aMTl2UitUQURmcFU5RmlB?=
 =?utf-8?B?Uk5lbHFqcDlYMngyRG8rMXVWOGJxLytXN3pKbi9DcFRlOWhrM3M3emdkVDNj?=
 =?utf-8?B?WFRlbmRhSHROZWI3dGMrZUU1RnJlVlU1L0x6WDExcXhaNDJpNStNZTBVVDVT?=
 =?utf-8?B?T1QvRTdKSFlLUXZMOFZoRFNJQjFPZEtjQW1iTDFZTTliZ2hJZW1yYUtmU0hY?=
 =?utf-8?B?UEMwZzNMNDhmN2dlN2h0c2lkL1A3WFNjQklobzhCbHZQN0oyc3B0MnBYeWZj?=
 =?utf-8?B?QlpyVkxScXZ5MW44enBGWjRWUnppTnJiWklIN0RmUzQyNUxuMktTY28xUUVT?=
 =?utf-8?B?eGlyQ3JtMUVnU3hMQ2c0cU5HSENXZUhnTTJGTGtaRWxVRzdtbk5MRHgxYkJY?=
 =?utf-8?B?S2JQTTBoRytINzJHN2RjOUtCOHNMdjhlVFltUEZNdkI4VytCTFhpWjZXN09w?=
 =?utf-8?B?RU5kUjdyYVBYa1hPd3BPS0Zta1dsZlRpTHFldkw2M3p5ZTZmSTIxalpSSElu?=
 =?utf-8?B?NEIrOVNIVHE5c09kdU9veDJKaHpvSUZOdHVzVU8xT2hORHcvbUJRQnhzejBp?=
 =?utf-8?B?UDBPdGVuYjh5UG5KSkFVUkVjWldLdFRTZEVjNERxZ0p6UHlEc1RlWXJoRXNk?=
 =?utf-8?B?b2xIOWY5a1RQeUp6R2xOcWZ2eHRnRFpYNU83dlBvK2Y2MjF0U1lsN0t6elRX?=
 =?utf-8?B?M3pqemQvWFZzekZmREpHeFhhRXFvbDVMekwrVWZ5c0FkSXdWaHBXdmhXYTVn?=
 =?utf-8?B?M0YyZWF6UHdLdEZKSVZMNWJueE1tbEhDMTk4OWhXZFVHNUc1Rm1NcWlybHBu?=
 =?utf-8?B?OWc2VGRUL0ViRjRSZjZVOFVuNDdyRnZ3bjR1Z0pXSEh2cHF3NG9tRGw5QXhy?=
 =?utf-8?B?bkliSlBZNGx4Zkk4Mk1Jc29JMERqaFdzc3JKSHBBTHEwMkV5ai8rM0dueUdQ?=
 =?utf-8?B?eStVNjNucmZ5TWRnZEZQNkZWaUNMV2ZiZFYwNEh4N0lWMFFpWWxYUFh1bEhZ?=
 =?utf-8?B?UTB2Vm41U1hSRlNmeHU0NE1SM1dvMVErbUFIWmRZY1ZpKy9WMkpJaEs3WHFu?=
 =?utf-8?B?QzVLdnVjVzYrK2Y5Uml0WnlwUWpYd2psQm81MWJ4aEl0bThXbys3OGFlZ0pK?=
 =?utf-8?B?Y0xrTHlZeDlndWM3aUZPR2ptelhVVXd0bWdUTlh2VEloNkI3Mkh3aDJYT0VB?=
 =?utf-8?B?dGsrVU42UEVYcHRhL0t6T2hpNitEWE9NamRoc2tLQVhDL3cycUE1TGVUMjJH?=
 =?utf-8?B?bEFHZlNnbFNHZWNqdU9iYVV4UjNta1BhbnhsTFRjdGJ2amk0ZUVuaVZYSDMz?=
 =?utf-8?B?MXpyS082bjd6dVlRc1pVc0hOUWJYMTlrYTZ5M1J6ME43RTBlUGV6ZTdxc3Rm?=
 =?utf-8?Q?Ke5APOLAfZUYehj57I618+R0rn6GrvkwsGREdrEyW9xP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd612fe6-04b4-4bb8-f82d-08db40d0f1c6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 12:23:55.9863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnPSZlcEs/j3ltlFDAi4Kkn3yHRiMY7GQJXahg4Cm8DRYEnCpU6cRG6lCMjsK08k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4558
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.04.23 um 14:20 schrieb hackyzh002:
> The type of size is unsigned, if size is 0x40000000, there will be an
> integer overflow, size will be zero after size *= sizeof(uint32_t),
> will cause uninitialized memory to be referenced later
>
> Signed-off-by: hackyzh002 <hackyzh002@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for the series.

> ---
>   drivers/gpu/drm/radeon/radeon_cs.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> index 46a27ebf4..a6700d727 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -270,7 +270,8 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
>   {
>   	struct drm_radeon_cs *cs = data;
>   	uint64_t *chunk_array_ptr;
> -	unsigned size, i;
> +	u64 size;
> +	unsigned i;
>   	u32 ring = RADEON_CS_RING_GFX;
>   	s32 priority = 0;
>   

