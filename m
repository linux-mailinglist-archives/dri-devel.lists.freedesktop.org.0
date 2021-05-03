Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA1B371ECB
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 19:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AD06E9F0;
	Mon,  3 May 2021 17:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548DB6E9F0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 17:39:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dyfj3GUHW+XlhcEYnWzZtag4JERyzwd4/yWSEhsXualtouFXidbf9BBjhWVJCIhkJ8n7NpgCMulwZUbyQi9L0+LjlFenG+uoSbkJe+ifvFEEjhpDFR4i3H2ITqtClh/XojaTgLm/xyz0z1E+yK6vPCl6a8zef9CTpHW1oXB6o277jb4I6COFUCgpHUPy+F7JQ8DLgq7+mK18QENxyMAcDWQeiCfhySrtPCyaUWBTQZ7omJPFH6zW/O2aFRBAiNQL93F2Pm44qWBkLGXXi+ovkcZ3eyinC5ARwb7AGQZF84rj/VwvST003tkH+qkdlJyVF/+lM/oMjr1Wt2o8hNDIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icjQ7GoDZ9+MycTfvm5vxUVEWGb7sI40gs0v1G+LZoI=;
 b=PFbVkyIPvwEiyOPep5lKOsYCdhin+ZMyE5gF2u9i9F13KxIR8NKVEhWc74IFwOCrQHWW1GcGZdLlbGgAZU5zwAZcJ/qypq9c1HDLafn6RFmhh8Kyu7hhVnAJAcMh5OtTyExidaMNdI8QoYJuANygByQSooDhw6e6hZhyPfkZae1xxtmVsQmMMdNWDNf78PJ+C6Nuv2LZB4kdksEWxdNoYGIAniaUN/vXoQf2ULMKPBQXE5KIwm3RDiq0EcMrKXlCNlmtq09a35jxG+liZ7i+f9kF4IxkA2XMhKiSc5E0g4GuuOnnpVEnepJyengnbJRQCPOvDhmWDAAm8OjqBQrN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icjQ7GoDZ9+MycTfvm5vxUVEWGb7sI40gs0v1G+LZoI=;
 b=hkF7Q46JmrtRqp1GADuRYCsPaT4H+86o+p/TRJJE50v5fY52xFu4V4o+/jHvr3yud/N33hVl4lzDqf/2kyumo2N3ArxUXe+yvFSpATwOptMMSOQzYLGS2WL02WaSgrKNwxGATj2pDfc4DO2KoNnMfiusAZw84GkFrqYaYZT5C6I=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2354.namprd12.prod.outlook.com (2603:10b6:207:44::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Mon, 3 May
 2021 17:39:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4087.044; Mon, 3 May 2021
 17:39:22 +0000
Subject: Re: [PATCH 1/1] drm/vmwgfx: free ttm resource before assigning a new
 one
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
References: <20210503172641.58541-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <88e1b9af-9570-fdbc-346b-86b55f1f7575@amd.com>
Date: Mon, 3 May 2021 19:39:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210503172641.58541-1-nirmoy.das@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:82b9:d16a:4d30:35d9]
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:82b9:d16a:4d30:35d9]
 (2a02:908:1252:fb60:82b9:d16a:4d30:35d9) by
 FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.13 via Frontend Transport; Mon, 3 May 2021 17:39:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ad6de3e-f92b-4ffd-8a87-08d90e5a634c
X-MS-TrafficTypeDiagnostic: BL0PR12MB2354:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2354CD581CC5886F5D025C00835B9@BL0PR12MB2354.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tzQC6onOuXratyY20ePCq+mlITG3mX3NNmeLDs7YbNdqkq6gHdj9MiFPNa6dBgPW/+2LGaCiojJFiS4DMetEXfQTbWdpP2qWqJjXnAOHo1gZo1DWf4V3aYkRuIa4QuCnOKAiHbWm8yU0WgT8JBYF+xakQz2RSCBriFBT56ItMhEwR23PN82AXTFOVFqWr5u764T5sx0ffnzErbHGEkPfbDJS7mjjc3578ESrgkg4Z3FwWa0ZkmN1TpyW6EFWOPvzHsIPTALbNdswsieNHlO+SusOs3/t/LnP3MI4OIkJ0zelVHIvUWmNa5o/bh4BRxLGZ/jufw1Rsx9xgvV8ZsG2Io06+HagpOEWklFbXCXjV4pSyrXx5l41pgS0z7SZhVscNLYzo8DQ4fki1fbjrjFQefltIbBCHmsc3HbbzcF2hr3J2lStx7FRqNh0c3YAk5pAp8ArJRNItKts5NtvYwsT3Jcw0U8o9Qk+xedsYeUuWOTxcvV2NwGuP1haTr/C5aty468fHnTg5kW8BHVu03IsNvPW66oopxRU67oEYR3Jme2ONa0nU1BOFgTzAnZMTLI4hwh65iKOu9LmqltXFcJlYaqMuEVTUpsrLeW2s43FvRXgUrhzNfvzHmaeztg6HR7pxjWScIrtebjAKdf3oSqxbxCL2LRoHhRQk0c3Ti6ITYnFiqUzB1CAQb6/9yDJA7QS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39850400004)(366004)(376002)(36756003)(66476007)(86362001)(16526019)(31696002)(66946007)(31686004)(66556008)(186003)(2906002)(478600001)(5660300002)(4326008)(52116002)(8936002)(316002)(6666004)(38100700002)(4744005)(8676002)(6486002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YVRVWWxRSVVwWE00YnVqYVhmUGMwQnMzMGZvR2NrQ1B4WHcxV3pZSVZLeHFY?=
 =?utf-8?B?TWgrWGxsOXlRTzg4dUZUeEh3UWg1SzB2dzJrYXNmUGF3eGNWSGs1UmRjb2wx?=
 =?utf-8?B?dW83cVRWYVJwVHlobWhoTm50WUg3c2w2RGxTRHpSekZTS3ByR0dHeHlBZFB1?=
 =?utf-8?B?U3JXcTltNk51MWNRaUN1RGplWEFGYkh5L0Q2WlJiYk0rUjdjczRENDFmZUs5?=
 =?utf-8?B?dHQ1RHVKaWkwTHM5c1E2V0pHY3JTWm50d1JvSGJxWTdaN29HZVJCd0xrZ2Qr?=
 =?utf-8?B?eE1GNytXZXljOVVhL0ZFNDNQVVViRmhYNU1XOHBQdFlHVXdOOW9ZdXV4bngx?=
 =?utf-8?B?M0crdFVUbWZtY2dsNFUrd1NHS1BVOTIzTXdPSFA2b1VpQkFzb1JaU3RiOU5j?=
 =?utf-8?B?TXNmb2llTFVXSkZGeGpRajRCYUIxWG1zSncwWXBVditrbkthcHU3djM2N2g2?=
 =?utf-8?B?OW9wcmdTaGw3ejZxV0lDU0t3VTYzNG1UUndtczE2MEFmQVhSUGppWEYvOWhr?=
 =?utf-8?B?cmR4c3hHalB6OFBTakNRNGc1OS9RT0tCaGY2cDRWVGRRczV1RVZGOU9NN2Fi?=
 =?utf-8?B?bTJoL0pFWXg2RXdqdHBNOWkrNHNUNTl2WlY0VXNobGRocWY5U0djZDR6V25n?=
 =?utf-8?B?MnE5ZVVyeTNZYXlDb1pGTStsbVNMOTRmcFNHNk1KakhjMVFXWDMyY1k4d1BU?=
 =?utf-8?B?M0ZlNWY0ejA5N09CUGJKSERHUzViaFJYejkzYWxWaUZrM2ZjbExUN3UwNzkv?=
 =?utf-8?B?Q1czRFd3RkpJWWdrT3orcys1MWRJb3Rob0lJYVF1UjJZVFA4RG5mYlpIbXVr?=
 =?utf-8?B?WWpQYjlQSHQvTTc5VUE2TVFtWFdkdHB5OGY0Yytlc1FzK2t2VkRVb2Vic0F4?=
 =?utf-8?B?cTJLM0lLSUE3WnRsYzRkUTg2WVpRNk12QlcyRWVzQVZTZExFNHlUSm1ENWhv?=
 =?utf-8?B?WDAwUVlHeXJzL1dadG1OdkVWRWE0MlBkSHpHdDdFRmdjNEpXTW92NXo0MWd1?=
 =?utf-8?B?YVpCMnJuNGpwVHJHZW5COC9qcFRFNTM2Y0sxd2oyeFJKYXFKTHBwdC9uTmRq?=
 =?utf-8?B?TEY0czBQUlRqZVdFNmw4Z3hwR3VKOUkvUFRScHd1VmVPZmo3YytwSDhpTmR3?=
 =?utf-8?B?V0xWTE9OWU5MT1FERlRsekhVVzVCd2tuOVkvYm1TWCtPUkUwVC9tOEZUbys3?=
 =?utf-8?B?VTBiVlNKQkhjT2M2aXh5SFhCbDhwTlRQNkNqSklZNEdDcDVYeTJqUE0wRWpD?=
 =?utf-8?B?LzFqWnFqUkxVRlNpWkN5U25SLzdyQjZ0dUpwdkdoclJkUmNUOE1HWHE4bVV3?=
 =?utf-8?B?eTVrRTBMTzJZYkVQM0g5NDhBNllJVkFwQWxOeTREcmk3SytNdHpXeUhXZnhD?=
 =?utf-8?B?VUl5NkM4OVJwdXZ1STk2emxybDd2a0FWditNMm1PNU9BSGlDSVFLK1N0eWJw?=
 =?utf-8?B?cVRyVHJ5Y1NOWndNY1F6dXpCVjR1Vm5PeEhPUXl4WDkyUWViejlIeUdpcCtk?=
 =?utf-8?B?clh6ZCtJYlRuWHJneWhDN2hXZDg2ajBhaXc3WTBvdWR6T2NFMnhBcGxDV0hF?=
 =?utf-8?B?ZjgwbGFHYzB3Q1hWcGlSMTRpTmZWQXg1QVhHdHZYS0ZwSjZmeVk2SDEwaWkv?=
 =?utf-8?B?TWhidE53NDV1V0FQQWs3a0tUN05oSG01V2o3dlJiOXM0bFNkenlpbE9JMWlt?=
 =?utf-8?B?blduQzFKQTRoOStMQmxNUjExaTQ0WGR1NkFNV3huN2dyVDZ5L1N3dHZlUEdl?=
 =?utf-8?B?a2ZURXN4VXVCSW1QQjM3WVlZUGFuekdPa0ZVS1JSbGpFVE42TUFFV3MrVlR2?=
 =?utf-8?B?V1lQWU03WHo0VElpc1Buc0ZJM0xzYTFEUGZIa280eFdjTDUxUnFaSVZENmN2?=
 =?utf-8?Q?sl8snw1D2p5tT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad6de3e-f92b-4ffd-8a87-08d90e5a634c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 17:39:22.8230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBAZZIwPKJfjLREUI7/pm/PIBIMwIxcnFAEMM4Sou10IFh7/ve2tP0J/ytUi3ZU+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2354
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
Cc: daniel.vetter@ffwll.ch, sroland@vmware.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.05.21 um 19:26 schrieb Nirmoy Das:
> TTM BO resource need to be freed before calling ttm_bo_assign_mem().
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 2dc031fe4a90..93e4cf34a3a3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -738,6 +738,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
>   
>   	if (old_man->use_tt && new_man->use_tt) {
>   		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
> +			ttm_resource_free(bo, &bo->mem);
>   			ttm_bo_assign_mem(bo, new_mem);

Mhm, we should probably rather call ttm_bo_move_null here like other 
drivers do.

Christian.

>   			return 0;
>   		}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
