Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48E50C048
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 21:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A62510E321;
	Fri, 22 Apr 2022 19:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4E510E321
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 19:24:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eylrjgdj+QNNUBY36R75wPfqnrS5np2SQQgo8Y6U63LgdNAlof3aet9odoslwfvPaQttOfIfHfc6udtPSAUZcRVr7l6samRTPtIWt+5+I6RVR7w2cdR9iMJDsqqITlJn1WzRjtpY2ZJvMwjH/YzuzKB1aLyCIXBdOBLIThXnblgwsbY+/OweUO7yx5eqCtm7fKBKLf6XeBRmav8Dej5L3Urybrem9867ywGaqf+gas2wY3gXP1NgJ7hUP6qTtiDtgD2bQ0fEUgoL2yXjim7lM8LQ85eI0kLT3ej/xvaR+vUiRF6KqefbGO8tSsN0O9hXiOD040//ozs+NoiWwbRtzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXTUj0vs7DmogQ7dQUSShTojtLot/XasT+UDPEhQTEY=;
 b=aj6xqy7Rl1BfYHrTSWSWjUX+5Y6GEp2zHgdUq30p/FJyG7pKYEaM0Q+bFI7zrj7Z3og6FUzOdGMoJdtt8nb3Xf46ceTh4KUILZVQRz22Zhs0LrkEwovq+8IPkiXffWsrTA8tdFpwplPAbqVhubXJcF0WK57O7jg8AbYUiZZjzZB8CngqMhGlR89XiJNiTW865CfTS+AkQvkoQV/MMNWtkW63hMWsjdidVHX0C57E3mQCRyIDuQ2gpCtqPGOlqQ9185kTJsvg+jKVcoOfnUFR3hSRWnsSQFfefma/qFdmN9GcQrZdyBkXSWKy+gYN+E68LXK0Vcww7elbAw/5Qa6aUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXTUj0vs7DmogQ7dQUSShTojtLot/XasT+UDPEhQTEY=;
 b=X7WxVOaIVfCtAkOXI/8UKqBALrwQAw8TdjTMC+14T7zx8GdLIg5THzHI5iXXCUs+4adQ/ytLxKHKPLmWt+nmLpDH78afNgva104e/538pvj0Zdb1M4O4oUtFTdGUZYCyFyQAmRhqpzZFRVBz8QU5GnqrCN3aa3QuDaxVboxe4/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5222.namprd12.prod.outlook.com (2603:10b6:208:31e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 19:24:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Fri, 22 Apr 2022
 19:24:01 +0000
Message-ID: <95d8cbb8-44f5-568c-d9eb-4b0e696e103b@amd.com>
Date: Fri, 22 Apr 2022 21:23:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/vmwgfx: Reserve fence slots on buffer objects in
 cotables
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20220422161342.1142584-1-zack@kde.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220422161342.1142584-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0014.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7735de60-03be-44d3-b42a-08da2495a7c4
X-MS-TrafficTypeDiagnostic: BL1PR12MB5222:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5222FE195FA4F55C71A8E34683F79@BL1PR12MB5222.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNduSZ97w6SYDTeUTyGfJsIlQh/UGy6BELp2zUMleiUO/EKRaK0chLx1MYxjM4HPRjULVy+MjbH+5p5+6LmeAb/84kGOgZj9LoiTArODEB8rQ+BN+uhSkknOrEq8c0GSVMTkPmkjrvcVJEu3I7PJZWU+qIwK85bS0eDUCXzKOnxnlfpYbT7SPNJpCMwXCG0Gon5WE/dOGq9Sx8q/w6H6xnB1cZhw4yucutG4JZGWgxkVh9lVUzF8DIEWvR0woTtcCab87shJPddAE/RHB4OfzKDFY0MB2apzxmRUsOcXDCsFo7Q1ZI6wWbjIAjhGhHrJupBOlZisKa2U+XVLk3u+NO4U7eo6W0z+RIjR0yylL/djcX4yQCGO3d2rOFmT7tfUdHYD00dY+cz0fo+QHEQFIfg5IhkfxcE3RKrj9AowF7mlC091XqBji6j63D1thnhjtj3sSQTE4bv99k//htl8boooX/OkLoqEx393HEFDRRv28x/Dd1CnVdJ0Ha7bheOK1oaswbGztDUDGG+IaW3mJDbhTLHwqnBi56tshFgKrbgSdVuEqn8dC9rZ9jUIla+/iI6L6vdrx4nSDJQNmaDWR8rq8VfsAP+H8FaZbvvma53Vce4eV44PZn+QYJxvwTUvIX8pDHL9OBSfpeiZ277AOFqMn6DmxgrkScUbg5ouE7/xjH5gzseaZGVNdj72kmqOBgE9Um/ZGHofq5QHmZQIPaPKOV6MCewU+8mNhYwV/bkBmh2bStbB3jvqEYOEbZaC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(86362001)(186003)(2616005)(66574015)(66946007)(38100700002)(6666004)(6512007)(6506007)(316002)(2906002)(31696002)(6486002)(8676002)(4326008)(8936002)(508600001)(31686004)(66476007)(66556008)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXRQcUdVOUdEc2R1dzc2NlUwM3ZrVTY1dW9NOUkxVy9OWVNKRnFvL1ZqZHRh?=
 =?utf-8?B?U3dHSUZnWEtTbzR1S0V3VC8vOEZVUnE5R3JlMEFuMnlUUEtYZkJUOFhTRWY2?=
 =?utf-8?B?Yk1xVHFtRW92SnBZbVVhUmI5MUg0NFp6YTM4UHpEMHh4azU2UEJsK0dyREZL?=
 =?utf-8?B?WTFUOS9TNjlLMjNDMTQ4U0RLM1NNckplZXhtT2RxMWdrTTRYQ0NBdXRXakVu?=
 =?utf-8?B?RzlHR0tmT2Rxekcremw2di9tZnZTbHU5b3hqMkdKbW84dlVwcWFwOG1JS0VG?=
 =?utf-8?B?QWdCV0xOdy95bk9acFd6ck5wNmxPcVFLWDhienBVendnUkNzVGJpK3N0YlhO?=
 =?utf-8?B?WmZ4d21sUUpMY2VvTU5vd0Z2ZFcveGFxQi9Pa3BibUNkNEMvZmpmRmtMb0xQ?=
 =?utf-8?B?RDEyOFpxTEhxZklDTlNBc3lUdUhXRFpMZmJJakg2MlR6eGE4dVFZT1dEL1Bt?=
 =?utf-8?B?NmdLTWlsUzZZL0FQb1l3ZkxlYXhCN09mVzQ4a2J3Um1tbVc5Ri9tOENFaEF3?=
 =?utf-8?B?UUQ2Y01Ob242NzdVOFdkL3pQTnZxNjJCODJRaU16Vi9zbzArU3gzMmFJTEdH?=
 =?utf-8?B?U1B3OXRHZm9FOVE2MjRQYWdHdHhOQ2o0dThHMm8rcDg1L3FHbTVWR2FRRHFj?=
 =?utf-8?B?cVBFV3NMdm9BYThWSDZCaTM0bEx2bDI0WFcxTFE5OWs0SmRvMU01WlNBemZk?=
 =?utf-8?B?ZEhybFU1a1o0MzE5ekd1N0lnRTEzTjNvRENlQStVcnRzTUNlTG9TUy96bG1F?=
 =?utf-8?B?Qm1Fb2x0QlJXVFRxY1kyL21jTkY5Z091eGNza1NjQkxGM2NTbGg1OUdvUDAv?=
 =?utf-8?B?dkhUdktvN2VFUEFNTnBCQk9odW9ab2gxTS9Ea05mSzRBZlM3eUxjR1l3Z2pV?=
 =?utf-8?B?MFdaM1FNNEZBdzN3My92YllvMlpUYWYzdnhBNDEzREduOHJYZjhnWW1uVWhJ?=
 =?utf-8?B?WjkrR1pvMFFvVjhSbjM4dXpqOURXVnF0M0I0SEorTzFPbno4a2huRG9IRUl2?=
 =?utf-8?B?K3loUmVoWFZPTUgreGFsVzlYaFRaelZkenJGbDBRUUdBdzhDVHg2Wm44Lzlu?=
 =?utf-8?B?UVBXYTNVWnVSc0FSQ2ZySm12OElPdDFtS3RLdXljMzBrRUsxdGZGNmlpdFVu?=
 =?utf-8?B?NXBpZGduWlFyMEYzTldTSVh4S0J4a0JyUFNuaFhYclpQcHpkKzgwWmhsMjBK?=
 =?utf-8?B?ckNTc0lnVFliTXdRMEc4WkxLOUtZNHp2a21Sb1hrTU11Y0FoSEtyS3pQS2V0?=
 =?utf-8?B?YmdLK2xCOFo3L1R6ZC9QOCtkQXlwb083U2JJY3NOK3J5R2VjS1hWZUViTVd1?=
 =?utf-8?B?SUM2dDFYN2ZSRERHMldNOEtFeTFUdlBoaitNWFlSU2VXSlBOdjB6Q2YwVWhy?=
 =?utf-8?B?TEIrYTE2OWd1OTZlZzRaelhFbWxIZ1duZUdBL1NINE9vMmU3VUlZQlIxbnk1?=
 =?utf-8?B?OFBVTGtvNjdPRTdweWIyZVVjRFFqakdQQmtDTFNob0syUkpuczJnQ0pEeE9k?=
 =?utf-8?B?Vks5b0U4VGhyK2s4YjR3bUE1dEw3MWNwdnVaQml3ejlvK25WMHBidGZtM3E5?=
 =?utf-8?B?emgrMjRrclJtZ2JhR1h6R016Mjhpcjl6aWdIYk9pRndhekJPWXgwVWVLRksv?=
 =?utf-8?B?WHRjUTdzUFBUNlNjVmN3Y25zTGk1RVp5Qk9UT0ZpZHA1bFdRd2ZmRUtWRkgz?=
 =?utf-8?B?V2lMWGhrYTdBTEdSSFBicEpVWGdvTDQ5NngyWkRmb3Q2cmVsVG5wcHIwcWFo?=
 =?utf-8?B?MlVLNmNTSCtXTGREWGh0d0RITzQzbDhuclVnaUNEazFQQjVhbS9KamcwS0RD?=
 =?utf-8?B?TklRTWQrcmpaTURBczV4Z2JLek1KUW4wbmw1cjNueFZXaVRSR05BMHdlSEha?=
 =?utf-8?B?ZjJEc015MTdQUWhYZTAvZHRCdEtWNFFLeTJRVWVza0ZXdjVRRzNjS0RJbjRH?=
 =?utf-8?B?NzFsMTZsVWtQdFJ1bmhVd21aTEk0Mzd4bDRITEhtN1Z2d2JYQUJhdjRXSTMr?=
 =?utf-8?B?Y2ZoZ205VnZmUndUM0VEci8yTHVlMFlJaG1wVk9uRCtTeGFPelNORktraGZY?=
 =?utf-8?B?eEtZZVY5Mk5EbHNrMWMwNWJ1UnNJY1NKZ3ZiVkN0b0VBY0tJekUrMWZiNUcy?=
 =?utf-8?B?ZW9QQk5jMDVWa290SDhGZ0hYaGsxRUlZUTdmNlBqRExIa1hPYXJVaDZFaVJv?=
 =?utf-8?B?T3diaXVxeFNWZnhiUit0NUIrbEZKR0R2WkloS2NWREhOaEYwVU5STEMzeVhp?=
 =?utf-8?B?WXFaSjkyQzVmWG80dFpOdC9FNXNEZWxiaDkrY2hEN3VPMDVNODBrcmdqRm5x?=
 =?utf-8?B?ckR6dWdoL2NOalJrb29CdWJydiszTXU4WHYrQVhnTS9QR1lxUkxCYXJnb2FS?=
 =?utf-8?Q?/2d8WdTJrf8NJWqn2mc3angHh6x7N+9gQDbO0E/ddRBt8?=
X-MS-Exchange-AntiSpam-MessageData-1: DR0+3xlqUCdJyg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7735de60-03be-44d3-b42a-08da2495a7c4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 19:24:01.2259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hc49wL23ajb5SPpIlZ93eD0WAElY3DUJGHXP8ghvtY7GUxL7qjEcZ6zUvwqy9nF4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5222
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.04.22 um 18:13 schrieb Zack Rusin:
> From: Zack Rusin <zackr@vmware.com>
>
> The buffer objects created by cotables were missing fence reservations.
> They are created from vmw_validation_res_validate which makes them miss
> the ttm_eu_reserve_buffers which is called from vmw_validation_bo_reserve.
>
> Cotables are the only resources which create a buffer object in the
> create callback so make sure the code also reserves the slots.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: c8d4c18bfbc4 ("dma-buf/drivers: make reserving a shared slot mandatory v4")

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> index 16f986b6cbea..79b30dc9d825 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> @@ -478,6 +478,10 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>   	vmw_bo_unreference(&old_buf);
>   	res->id = vcotbl->type;
>   
> +	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> +	if (unlikely(ret))
> +		goto out_wait;
> +
>   	/* Release the pin acquired in vmw_bo_init */
>   	ttm_bo_unpin(bo);
>   

