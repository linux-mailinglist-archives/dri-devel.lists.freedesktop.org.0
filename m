Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9313B711C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958096E850;
	Tue, 29 Jun 2021 11:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67D46E850;
 Tue, 29 Jun 2021 11:06:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aopIsopc29wUkIRe8lyPfNqU4r0FLZb4R6sj5WtxqGTFzStJvrH5ZYRlX649fCrsXxpS3S37NMnFS/ncEd41ULLuDkKNsVKtzEcLzP+PUIFSdw147B1hhAT7y1MjBuVH8ZvaDki1gD0rCyuc+/FaNcVyG3Z5YybQ8+pu+3YXKff1mfKeJK2dxpAUJefPxIyoIdNThSv1l6JNjqLz5PlXM9Rj6HnIBCi+tgOfBPjtgfu0es9rMW1ldESxF7HLG2Zx92IIMSaQaPLA2LGyEMM8/0DfRxO1DFeqKRsja+pBw090W95/StMAgCmqjWgkmUD0b8ZxFcsyvUED/jkf5iarXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlfXP1EIFmBunSiX/zskLY1HEqFWVyqti11TGZ664sQ=;
 b=SgHizDTHC7QXA2KgUnLpwI5RQejx8qxDWOdPb8UOLJJK5eznSWHf7Z3wTm5MhY8DN8K2Z5UHSvA38gwk0BRXZStOsuB7Buh1Yd23JQ7maETJzLykWqLdLA0i2ozA2XjwXy236+iX4dCIC55giKb7WtC1p9VYDmsOF5MPZNLGeFyulHwySfAm5C5qtzXLmXob1HilpfvJtbBwAFSOqJh4Zd912JAdpjR9fDFHn17rEEwNBH6ipYshhlsSL2s0rZ7Hq6PduhlFaA/cLbwMr7YgYTflPyMTx/+ogjkyrpk6SqTJBdcyw6bIpXSS9pU8nfRMbjdsY4f4nq8nnbgCUYfAbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlfXP1EIFmBunSiX/zskLY1HEqFWVyqti11TGZ664sQ=;
 b=al9xRNkr3CDeNvo2M76UJWrfA9COKPYOIgfyB0eIdEeyiz5oUueBX6BG5XwxknarYG5ztLZNznMJaQs8sMBuJ1Q4kAPaFhkFDAPkMEH57ZdGY3p1u+ocqZYm/HB2mEEZoKHnKOBCmbWjXYTKdQ1kuuLNy/S28vYy0WBwATsj/Ng=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 29 Jun
 2021 11:06:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 11:06:08 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: raise error on incorrect mem_type
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
References: <20210629073629.3069-1-nirmoy.das@amd.com>
 <20210629073629.3069-2-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d5cf73d6-ede7-c2fe-1b1b-7cbc89ae9978@amd.com>
Date: Tue, 29 Jun 2021 13:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210629073629.3069-2-nirmoy.das@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:acb7:5516:6a55:2bf5]
X-ClientProxiedBy: AM0PR02CA0083.eurprd02.prod.outlook.com
 (2603:10a6:208:154::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:acb7:5516:6a55:2bf5]
 (2a02:908:1252:fb60:acb7:5516:6a55:2bf5) by
 AM0PR02CA0083.eurprd02.prod.outlook.com (2603:10a6:208:154::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Tue, 29 Jun 2021 11:06:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a69d7be2-09ca-4f8e-d640-08d93aede5a0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43368D811BCC6DE0DDA3974D83029@MN2PR12MB4336.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gg7JUv7WNUwAqUUkcUvyBRRJza5p/M/DCxaSBHiesIbvtETwybO1iAiVuw+KNWX6OFF3h7NtlRLghzcJ1w2HYBsBykHqv0Nu0WeKAUy8xdrc5YzC4wW159wuc0vxg/LGbYfdH21gEm+eRu8dcZciQ4qlp3+dpFIIleIlhaB/T/qA4QWgMVpc9xOVS6Md1xHGi38JUXtqU24OSqZWBrOF9UpxizuMxZ5rCNOK/ieINvBDdulq/fSbfTvsIp6YtnnNulrS9B7vPz6uPrSX7SQ9wtPBGH11DoeLW+nnGtZ0Q3amwg7mgczruRj63fI7X/DHiEWzrOj/wJL4M9UBnu75wYPC5Pi09sF1Mc797jjwKkGvW++Evb3rNkkaKzGXmQZY46XLnAsYwLFX9NTP7dcEgZSWRdTUEUcXeTerkgq2JJNGFdy/y+KBReZ7JGIunWtBYwcsbtWNHeD6Fofqt8cpjmuHWm8mJ+nkmIYC+u480NWeXfbJ5Bpg4myY0nMtowXY+6bHKve7Gcwu98Y/0Nj3OiwrpezPd/ivHNgxKKML7oEuBk9YDcSickTReT0rX2OV2bvvnBtZhMvxpiYIJzO+FLbFrDT9Zl15yEib71ACUV72H5VjNrGbHsPtH45IT1DxmKs29UEAjMbRlnm+qm+cQEAEJ3NHI1TWEhOOu2AUSchg0qdXCo+6ROINmzAKknpD5LlTCwT+RWSV/zjKs0IIkw/9Xi6YMmCkQ1//a2zir74j6vNDT572Rrvr+XJXpX+Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(6666004)(478600001)(6486002)(38100700002)(31686004)(83380400001)(86362001)(2616005)(2906002)(316002)(31696002)(36756003)(5660300002)(66946007)(8676002)(4326008)(66476007)(66556008)(16526019)(450100002)(8936002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTZXQWZadUx5bVpHckhFeWZ3UVY4U0xzVEJ6aDdFeXRtMlJOaXBwVG9wZ3lN?=
 =?utf-8?B?blIzSmo4UlFMK3M4U1pPMW1ybDBjR3lVRTNtczBldnlHdS9ycGdaaFVRZ2hB?=
 =?utf-8?B?bVpFT0hwOFRoK0RHL3lHWjdKaGI0TEFZM2lOcFk0UVpuWmNHMENZcmVvVk0w?=
 =?utf-8?B?elJ5RldKVkUwMms4TmRYdHlJa1lWV2pGbXoyTFBpa09Fb1VEbFl3VGE5RmNR?=
 =?utf-8?B?cVgvTm1nVGI4TEVtdG5ZTHdRcWxSZ29KbmdscmYvbTMvZlpzYmVnQ2lJZDR5?=
 =?utf-8?B?Q0FWaEJGM2xrbkhibndMY3hQaUpPaS9qaENOZTdFSnFQNjFPdjJEV1ltK0tm?=
 =?utf-8?B?QlNBeFRPQ1hMU0t6cjhDVkF4WXBLZk1zUDJiRVE0VHN3TG12eG9aRStqbXR5?=
 =?utf-8?B?VDNqSXRsNWhyNy9CaFJQZlBRYnRRU0R3RElpb1pBS240UzNkK3g5T2M3Q0R4?=
 =?utf-8?B?VXRlNXlVbE5oM0NxbHpCTjI4NVV1c1pIRVQwOVVpVnhIL3VBZHhJMnEyc1RC?=
 =?utf-8?B?YzFUOWZxMGdHZmlmR2NvODZxQkNHdUZBam4xQ2FMdW1qU0kzNUxYK2ZMZENv?=
 =?utf-8?B?Vm5tY0t0OVRQOVg5Q3R5ek1xRG5iS05EQVJ6WHVuQ3dCYlRiK1VDajZtWEIx?=
 =?utf-8?B?QnpjRHQ4OGE0NnBYWjZ2QUJISUJHSDhVRExyWEQ1V0ZYV1F2LzhXZ2pVUDBw?=
 =?utf-8?B?bHQwWm0vb2hIREdic1d3aWMvSlQ5WUdVdEg5YlFxdmVRRkNVRE9vZ1plV0Fk?=
 =?utf-8?B?WG5xZ1lTSkpTUTdNbHRPYUM2OWFMTlpUeVpObUJSdGM1d2x1bkxISC9vVk00?=
 =?utf-8?B?ZTNISFkxaVZLV2RzcFlpdmI4OFEwYUJkYUtOUVR5ZHRTL2I1akJxUGZEN0g3?=
 =?utf-8?B?NFBUYUVkcDhQY2RkbnI2dWpBbFoxd1NLdUwzSnRYUWMxYWFCNVM1bnlsQjdC?=
 =?utf-8?B?RHkwK1daTjFJMWFjQVVUNWxrOVIwdHc4K0VMZTM0aGZYQ2RqTkRLbkNWNU5n?=
 =?utf-8?B?bDBqNFl1SnZiTHRoRm5SU0h3SUR1RGoxWHNRcGFGY2hrVGVsdEdCRm9Jb3d3?=
 =?utf-8?B?T2dYSmhaRU5VNHJMTmRKbGVkMm9NSkFmd0lUM0F4WmltbkpDeW1pYWRSZ05a?=
 =?utf-8?B?UkJrZUlJZlNvYnZGUGF0U2oxbi9QYTBoSlZ0YzhBVXFCRWhUb0VxVFkxSWE3?=
 =?utf-8?B?RThsbTUzN0Z4RDI1WFA5SWlGUlFpaWNNZXN5WHI4aUJqemdXbjZ0U2x3M2JF?=
 =?utf-8?B?c0FOeUozLzdhd0UrZTBCNVd3SXJEaGdhTDd5b3QxRDcwQTNTeTVRTkFtQ2JF?=
 =?utf-8?B?UVpEVmtZYjF4SUQvV2RXR3Zid0dOTGZFelZDekhrRGV3WExHbjJleUtoR0hl?=
 =?utf-8?B?dGdxQkIrVnlFY2hXSkV2a3orVUhtRFVUZzJXOGJlZmZmbENaK20rU2F4bTZw?=
 =?utf-8?B?NmNvN0dVVzRFSGFUaWZHYnowOWVXQ3VkWkowVTRjRXhrQnR6K0dROVQ5Y2VD?=
 =?utf-8?B?NWJNWWJSMEdvMm9UeEhBMStmQnlLNnphdXlKbEFOYVZrMzlXdTJkaUU2UEp0?=
 =?utf-8?B?U0xPcGFKWW1VT1NVZjdETmtMYW9UeVdXL0VPa3FzRkV0UFNuUkd3QWpoMTFR?=
 =?utf-8?B?NC85UHFUT1JHUkJqNW9mNVFFazc5dS9VZE5yYjA2WVFsN3A1eFN6OW5VMGNa?=
 =?utf-8?B?Mnl4K3NiY2g0aHVFbm1HZjE0QzZoNDhXakxPaHZSWU9mSDhmOEpudWRzdHBP?=
 =?utf-8?B?ODF5YmJuaWNFTzdYTGVIbG40cElVbFk4bFp2dFhPc0VESXhNZjRjVUljR3Jm?=
 =?utf-8?B?ZFBiNkNadnFtL0hKcGtWZ3VGQzJuVFRJRmVPMkhyUTFSU2JpSUZoVVRyUUQ1?=
 =?utf-8?Q?MgsYsPsMMqZjb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69d7be2-09ca-4f8e-d640-08d93aede5a0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 11:06:08.5648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppyNzzwqxVoDTHlBDLSjVognSBLBkaexig0oQyULRC3HveD9b+5S5Nsa6bYmPx0j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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
Cc: Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 29.06.21 um 09:36 schrieb Nirmoy Das:
> Be more defensive and raise error on wrong mem_type
> argument in amdgpu_gtt_mgr_has_gart_addr().
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 543000304a1c..0b0fa87b115c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -107,8 +107,12 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
>    */
>   bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
>   {
> -	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
> +	struct amdgpu_gtt_node *node;
> +
> +	if (WARN_ON(res->mem_type != TTM_PL_TT))
> +		return false;

I'm not sure that is a good idea. The GTT manager itself shouldn't have 
to deal with incorrect usage of it's component.

Christian.

>   
> +	node = to_amdgpu_gtt_node(res);
>   	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
>   }
>   

