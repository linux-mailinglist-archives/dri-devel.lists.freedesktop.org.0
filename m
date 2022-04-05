Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8C4F3CFF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6593A10EDBC;
	Tue,  5 Apr 2022 17:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC5110EDB6;
 Tue,  5 Apr 2022 17:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ax4jEcZufuJOz5FC6wUrT8YaJvv4CDQDfAOMrEPhavyQ2m2LIYq5s03AzoP2debnTkKAe+hGlh8A1ZZ96vWe+HgJPwibg+M4gCuo8/FvWhztARTLQFKr68Rnpfq2x+DZqvXLMC82qYoZgRn/mGtUaTa7daX0kGYsvjAvQTA044/ZbURAPAeTnKTkURXsVGXU5lJ23PvHc5yDemt+AF4PpTWicwSFrabNsJSd8Ttm0iOpol1pi/nNueUF0TpbGoFUAU6Tjk3rEZ5X9UIkHLi0F5AOgFosU70d++ecTigIewB1XwW88Y9HFTqK7u67BiPbMxDW67ia9fDjoGkysdd03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSMbwZ96GDsvBqSL7N5zoLhMikwKZ9PtuhhSdnKnPQg=;
 b=HNpMDSQfsxKT8vOJo72Trloo7g0AVPNcx+d7Qr6j8MwjaCSe6q9SLFcQEesohbBhG5iU/AAtUK7TDyIwdXfxH9N0WIATxTdwAaB8UdtnHAqs0ZjF6/tnHFzRVO0cqlv2ZARho/+8nMzI+f6Nm2h9LFd13lAtBfujp+brO9iQzMjg0KkUBnCESKJdw33XmZ5fNwlCLSHPIXaBfouh+PlN8etTWQtt58sYKG+XV7AS5T9EYgqO4vkFS2JyZrQX4ePdmxqY88b1Ve7dORPKmmE9ESZaLRTNQUkjvRx6vDfVnkqUZiPNLe7agCRD+6JFTmjc+xlSyDJGNRRkbMFl1MZYUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSMbwZ96GDsvBqSL7N5zoLhMikwKZ9PtuhhSdnKnPQg=;
 b=jVyV8jtHrhgJNFEkjH4/D9E+99k1IvCV97B+aYG/2xJryM9DBIR37zj3UUvg1voLAsJIA7nbBtZiyc9yabAF6L49vhN2Orm1o3Aea0K+1Htz5LqckMLVePHc2XFC5yK+00vz1rsOt3JMUVvB2is9T+RkDTo127NeIhOfLv2CnXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1619.namprd12.prod.outlook.com (2603:10b6:405:f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 17:38:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 17:38:33 +0000
Message-ID: <614a4844-fa5d-8b8e-0628-894394f31608@amd.com>
Date: Tue, 5 Apr 2022 19:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amdgpu: Senseless code and unnecessary memset
Content-Language: en-US
To: Grigory Vasilyev <h0tc0d3@gmail.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
References: <20220405173632.2663-1-h0tc0d3@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220405173632.2663-1-h0tc0d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0021.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::33) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2ba8b4e-28b3-4fbe-9957-08da172b1b2b
X-MS-TrafficTypeDiagnostic: BN6PR12MB1619:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB161957CED3B07B0BD516821783E49@BN6PR12MB1619.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fq4+31KdENqu1QqAHrAxtlNdp5twNzdNB3y1Si4HrzsgKUtgQiQO9taQJwCIgLvCKeuJ4fIDUxhJ22s4TVydsCfzmnPblf1RGfZPFPzQ9BPXXc94Jd+GkEXyd4LqzKzkZNLlNIuryCtcwx3ghL9dp3t8TYtClXuUkSs30PxyvYlCu0+U4hkDBJ1wa+COi5qEx3+ZF7Dmejj/eOU/xPByrfx8Gc+od56AqcQAgNq0N1xo9dRrcVTiEQXWPlu1pGTDeUTPgGrLj43OfjV3jGD2lDGrAZsjqtdnaIcwrjOSaBLVPKkhUVFsxY7pnuTLn5LS27rIWnV1wDnaR/aYrfyu85D3k6Qh+OtQvJC4WeX5DbznjAxgiL37987o5o9tLoD9pyWH/7SrdMdsaTmBDt03fJQEptX6P61KBBNG+XegPBxijqEndgiyeO3v1gl55xVXtMjADXRYL1wXNvpxvRyzLEjQx2IzkICQ3v0GI6+r7IKX5MR9Pc+s2xoEfOdexf0AmuTk/5z+pYD1blonvswBUQM6JZbZ4AFRmvO0KaMXfFaU8i+uMGkZiNPwxzoGI4sKmbUJIdXEuWpXI/z/YWVuHWXGejC3t9BH5xuQ7Hw7NlOL9Nuvs8dig8o9x9AkRur+x+xhPZFdoYfW35fPl5BO83QnqFMk3SRMgf5KlnSnP3hdreo+MMp5Xk7c0IgfyVIdK1rUyM3He9FADhFM8dAGL5YsL/c7hqZ44Qq1C2YS/m0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(5660300002)(8936002)(6666004)(83380400001)(38100700002)(31686004)(6512007)(6486002)(86362001)(31696002)(508600001)(36756003)(66556008)(66946007)(66476007)(316002)(2906002)(186003)(4326008)(2616005)(8676002)(54906003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkhTK3MyeUh1N3djaU5BdXFPTlRhelNIaVQ4RDMrV3E0cHFlRGF1VFkxU1Fx?=
 =?utf-8?B?aUtDYWk5c3RUQlQ2Ym1NU0Z1RlVXSlpwcmhyYjNRb3JGNDNMYmJwUjhKc0tp?=
 =?utf-8?B?QnBhOE5hbXgzSEpRKzhXbWZDNm9xRzJXSWxWd1FqNFlucUFsaDdDUGk3MzhY?=
 =?utf-8?B?VktsZkhLcWxSejRXYzJ4REJNQ0FGelhhd3JBZzBYZG41V3V2ZWh1bHNOR3B2?=
 =?utf-8?B?R0c2VUhSYXhYTHdtSTZaalNCRlJNU09mejBKRlR4YVVTeUROeTI3SVNpUm55?=
 =?utf-8?B?ZFNxci9oendrN2tDazBTNGFraFJvVTc1R3FDdnVtVGFYa2hQTVYwTEZtaTBX?=
 =?utf-8?B?OVc4bVNWbWRVMndqRlJUL1JZeGNRYm5BSjZ6ckt3Nlk0MkpBR3JFWkgrN0NC?=
 =?utf-8?B?WjA1M083bTBiVThySndOQ2NMNTJBWHl3TWRxUW9sVnlybzVlSTJjLzhZaVhy?=
 =?utf-8?B?Z1RibCthN3lUSCszeEU0TVhSSjBCV0l2cCtVMUtaOW1PSEFzTEFTNURYcENh?=
 =?utf-8?B?ZEpISzUwekxLQkI0OVVJZXdDUGFheHBBN2xEVFJjK3dkL2VidldxM0h0NEIr?=
 =?utf-8?B?TDY4Ni9zclU4RVhLUll1T0JzL0lQZ1lwSlVoMW1lNkh0THowK1ZmNzZUUkw3?=
 =?utf-8?B?R3dYUlpreVIwSFRyZVVDVTd5L29EeXhSclBrVm1qaTZtUWpjKzk3L1NuMmh2?=
 =?utf-8?B?U25rbXVNVFFGQzBXUFhJWGF2L3dYRXJleE5DUTQvZGZSMFpYeFZ6NFFDL3pZ?=
 =?utf-8?B?cjdzYW1KdDdvUmxmVjhubmRnNE9mWll3cVdDcTlqdXdlcnkvTWxETTQxSDNF?=
 =?utf-8?B?VFp0YmtxZ0lZZERtcGVJcG9WTmJIL2tValdJRWx6MlVHVURHL3JPUXZxQThN?=
 =?utf-8?B?NGtTMXUzWWJNbXg0SnJoRS9aUW51VjZ4aStSNGY1bHF1ZTlva3k1UkIxa1Bo?=
 =?utf-8?B?RzgyWVZFaURFZE11Nnk0U2tVcFQzdkduczJZbGwxQUNnY202bFFEZ1RrMFdY?=
 =?utf-8?B?aCs2S3BGSk1SaC8rWk5CSERKRjB4LzNmR0tRTEtLTmF5MlByREFnYnAyUDFY?=
 =?utf-8?B?VEo3OHFoWWNlSXAzdXM2aHM0QkZiWGgrWGJGMkFIVkV0ZXlBU2lwR1FJMlhZ?=
 =?utf-8?B?N3FZR0VOQTJGakVYcWVud3hWOUNFZ2dyYUhSTjFWWUFJS21oNHBaV1FiaFlN?=
 =?utf-8?B?SVB0M1NsUFZwKytoVWNzSFR6cDRzRTY4RkRhYTU2dmM5bUsvM01lSCtWNFRL?=
 =?utf-8?B?eUFaOHpVRkQ3dmVzTzBQbnphc250dTdoMzN2Y1pRYWlMbDdvWUJXWitZcFJO?=
 =?utf-8?B?cnJTTmhsS3FtTTk5U0FGN2tEQXk3WTEyRVNadHROUW9PV3R3c054MU9UNlQw?=
 =?utf-8?B?N3RvTkhrbHRyOTMvVHg0UFVQNkRhRjRTS3FZRlV5UmNrU1EzSGFGcHJxV3p2?=
 =?utf-8?B?WUFDL05qTXU0RjlES3lTZEY2eHZZMjduZWd3NHM5eFJHTUhWNUtCTXRuNURa?=
 =?utf-8?B?eGh4NFlMLzh4RDh3YloycE1rY0E2MFdmTjJadDVseC9VNFQ0UTZvZmRxMHNU?=
 =?utf-8?B?LzVmKzJZdk9XR3BTUTUraWVQMVFkSW5FaXRnKzN4Nk50OHB4RkpOTkxpWHVl?=
 =?utf-8?B?MzdvL3ZSWXQvZGdQc3Axc1ZiblNRdVNZd1NLczZVTmRTNGNwNXJDZkJyVGQ2?=
 =?utf-8?B?NS9CdmJ1RnRQZXMzSDd5V3U1cTVLbUprV3BaOTI2OGFRdkpEZXU0dU9SUk4y?=
 =?utf-8?B?b3BJdTNGbXVpc3pCS2wveGdkcnJoeWVQZUgrbm1KNWRVVk5XaTgyQ05Kb0gy?=
 =?utf-8?B?SFVJZkdVMnNzbUlPNDhOWXV0SDQxTjR1QUVzT2c5czVXeXc3TVpDM0pJYTQ2?=
 =?utf-8?B?eUUwU2k3ZU43TUgwcDNaekl0UzdLQlByRkpBK2xqd25yNXJUSXNSZHdxWWhH?=
 =?utf-8?B?Nitxd0RlVnVFZmY2NExwYzkzaEZxS25aOTJJYjgxVzNpNFd3N1BJYVBLZ3Y1?=
 =?utf-8?B?ZjhqYVh3dnNXTFU5ZDhQbThQZjZBZ1ZveHpEWHBzVk44TkxZT1h5ZXIxMytG?=
 =?utf-8?B?ak1zUFllSXVmNnpYZ3RhZWRjRzdVWkVUaFhhZitwa0ZrM2JLeVZMblRhc2FS?=
 =?utf-8?B?dkZSU1RNSUtydk9pTGw3Y2NBeTdpV3FkN3puT3Q5a0s0ZzUrd2ZzYWovNmF2?=
 =?utf-8?B?ZlIreS9xdmpZN1hHNkI1ZDN1clRsKytmaDdQb3c3Vmx2Z1E1NHlYblVLTk81?=
 =?utf-8?B?dFBVU2tFMHlaYlhRc3hzRWh6cm54S2h2blRRWnVGNExvOHBZTENGOUNmTFVy?=
 =?utf-8?B?TTd1SEpaandsZWtqbGFZSzF2SWtPYjZvbDZGWCtyK1ExbitIWmlENG1aR0h1?=
 =?utf-8?Q?jiW4QGC4BGZDUD4oomWVXkF8lA8IgjDrVtAltxELkutuR?=
X-MS-Exchange-AntiSpam-MessageData-1: W+Q+OtcK4HEMcA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ba8b4e-28b3-4fbe-9957-08da172b1b2b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 17:38:33.6189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDvi12xw8te6riEonHNZm7D/dkYv2ofNUjKf8V43aK7u8kqAZTXqV+uzyH644QNG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1619
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
Cc: Jiawei Gu <Jiawei.Gu@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.04.22 um 19:36 schrieb Grigory Vasilyev:
> Using memset on local arrays before exiting the function is pointless.
> Compilator will remove this code. Also for local arrays is preferable to
> use {0} instead of memset. Mistakes are often made when working with
> memset.

Well actually memset is preferred when working with structures which are 
given to the hardware parser because {0} won't initialize paddings.

So please don't use {0} in any of the atom bios code.

Regards,
Christian.

>
> Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/atom.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
> index be9d61bcb8ae..537e48fbbe6b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
> @@ -1538,11 +1538,9 @@ struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)
>   int amdgpu_atom_asic_init(struct atom_context *ctx)
>   {
>   	int hwi = CU16(ctx->data_table + ATOM_DATA_FWI_PTR);
> -	uint32_t ps[16];
> +	uint32_t ps[16] = {0};
>   	int ret;
>   
> -	memset(ps, 0, 64);
> -
>   	ps[0] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFSCLK_PTR));
>   	ps[1] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFMCLK_PTR));
>   	if (!ps[0] || !ps[1])
> @@ -1551,10 +1549,6 @@ int amdgpu_atom_asic_init(struct atom_context *ctx)
>   	if (!CU16(ctx->cmd_table + 4 + 2 * ATOM_CMD_INIT))
>   		return 1;
>   	ret = amdgpu_atom_execute_table(ctx, ATOM_CMD_INIT, ps);
> -	if (ret)
> -		return ret;
> -
> -	memset(ps, 0, 64);
>   
>   	return ret;
>   }

