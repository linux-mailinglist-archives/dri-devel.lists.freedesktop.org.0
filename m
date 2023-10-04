Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F657B8699
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 19:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C848910E341;
	Wed,  4 Oct 2023 17:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F30310E341;
 Wed,  4 Oct 2023 17:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iR9j7u0vPpRHmWVZrWMomO25qsGgYEc5fkdHb2QtCJRi0jbgMaJZCkOha7g1+rzyroB6RSsfLr85+EiarHm9KzgyUncZw7/CETRDsBPAa/1onDHHjJtAioOZNY6fr/I8PGQJ18CVWVoI9ql8ZPJvV1jfi+wxBpbIWc+IQbRj6vQBAqtzVAISDO0mlHo0k9KsYxJlKPTJ6Wg/5uLykxrxLGRWH0Psn7oK6e1SNU2b+JqQeOwOu3bFEydsKQcpa11NgGsJL7IaN0PZxuaPgSilcc3IyWYNgvwgJjHcGhbT7nQV+ocmoC7b5Wz+8ahvI/uB3t8s8+gHLnE2Zea1wxY/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOAGf0M3vNkT1cGJY7nZ81AuTAMJe3+R0WWxn7T5yWg=;
 b=SFDJ4+2pU0Up8Exer97j/Ea57v2Z9sED5sZyENJAKKeMYpvXPuARBKk9stdvz/N7mefyNgSIHu2jt6OH6gMAJw3MOdMT4JVYMGaQnRRq/AJf1KL/GFeEkPUtEWVQSTNKoHunf+2Xn+0+Zy1Hm/DNp9lfGO2BsaVecdQbk0kXThGZ6J6sOx1AMmFt+DYbM6v89Fsn3+sNhLNah01AvtWIFDYI/HTeuF0A+pA9sHIl6+Cd3kJnEWCO789hsEys9V27F+13nWKT7o4FCfhcf4yAjSIo3BwgmUOYtjafalBM63VMhOuPQhfeQOPtjlaFQT85vXco7kji2q0xoNBruukKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOAGf0M3vNkT1cGJY7nZ81AuTAMJe3+R0WWxn7T5yWg=;
 b=A3EsjKdpDJVjs7KzFaS3LLTOgXXNZ9e02mn6ugA3+YLjv0a7+Ll9OPQYmByu6Aixg2JyIxoqjfIHjAiDp35xn5sp0BOPU1WqrtNEayUz8SkW2dTfCAg5M57pWwIpyHC43NkyOMGivhBItmTlOOci0scvi0ZipvpOrdiih2zaf0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB8319.namprd12.prod.outlook.com (2603:10b6:8:f7::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.33; Wed, 4 Oct 2023 17:31:35 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Wed, 4 Oct 2023
 17:31:35 +0000
Message-ID: <f0f1e7ff-642f-4fe5-8004-4b38c079699a@amd.com>
Date: Wed, 4 Oct 2023 13:31:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH] drm/amdgpu: Annotate struct amdgpu_bo_list with
 __counted_by
To: Kees Cook <keescook@chromium.org>, Alex Deucher <alexander.deucher@amd.com>
References: <20231003232952.work.158-kees@kernel.org>
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20231003232952.work.158-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0216.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::27) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c8666d-a863-4181-91b6-08dbc4ffc1e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C52NnohovJaxX8KlS21flhg4nhGZVybfzP1XMIpZjXCguzSxzqlfS1ytrisIjX1mnpQ8xQq24l/Qunv7LC0wIXCjrpOhoWKY1Qi4zG5ZCXxAPinYVe5itCZax2ixlFLBO4Z+xqiCXNhVBMsw/NbTTtzbojNyZqp+y8W4XNXiON8mUtyGlIWYkHrH2AzgngO9MpKuHHTGglQQC2EY9F+PdGutuDwic+n63e6/9/V5WaqT9kHHP4yep40wqj9VKqk7oBRERqgsvzrxB7eJ7q3wO3YErb4MTEYhJvutlFmlTCtQliD7l5iXqrwEhesMkhpBPD6sLjIBtXbdfmaJMRfN1UeKwzQtfrHFThjrU5w7A2mw+g+4vmjxReEtm0VWZ/s7Q4oWQI7dXb4R2Urc7/qF9GKgJ4oKXtInwAmDfMUd/JqNzMgkEZ/P53hV0rGo2Nv71KSX0xmZKVl9ic+0JvXCwy5dVnaanes08OJb00RUBkyfK85GAkpinW40iVvBkedSpMMA4mVVRFKMg9kr4X5rzLxYLiT4Qaao+JKmKy081uHJASMkry4Q7AH8RW824T672mhdVh2lkTJ5o6ZneS5d+BxNKMQUBS8mjiOWk5B5mGYxOZPqKzjtuOKymfhLHLVyeKrq2JKMQsrC/c9tp2MZOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(53546011)(6666004)(6486002)(966005)(478600001)(83380400001)(2616005)(6512007)(26005)(110136005)(2906002)(7416002)(41300700001)(8936002)(8676002)(316002)(6636002)(66476007)(54906003)(66556008)(66946007)(5660300002)(4326008)(44832011)(36756003)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1V2QjhnbXB0WUJQQStMK3VoZW1PaHBLQ2FNbW1uZU1EbkNjY1B6V3NybSt3?=
 =?utf-8?B?M3RkWGk4bHJ0YmtSeStFV3NXVExoWk5RT1NBME12RmczWHlGZnhKaTZOU3Bj?=
 =?utf-8?B?VjdzVTIxczZMbGkzaWMxb2U1TGx3bzZQVWlIWWJ3c3ZUdUVvVDVBSEprSHp6?=
 =?utf-8?B?NFN1NjQ5cmE2enlIeERCTEJ4Y0hsYXBNWnVoUG10NTJLVzB0bGxZOENnUzlq?=
 =?utf-8?B?eC9zUUhseHJtVEpNS3M0SlFxb291S1FXKzBnTkpPMjZrNmord243T1MxSWNV?=
 =?utf-8?B?dk1NWG9IUFVkaGxmV20xRUZYVEpQRFFFbVFJbU9XZDVzWm9CVDBUS1lzdHdZ?=
 =?utf-8?B?aXZ4WmdLNlF6WDczWjlkREliSStwZ1hCRmJjQW9nN3E0bUxoeXN2MTNrL0ZF?=
 =?utf-8?B?ZVpYM3pXbUhGUGpEdllHM3h0ekFVU1E5VnkrYVpLRHhyTjdkVjBmR0tyRmcz?=
 =?utf-8?B?VTFNT0ZGeXgwOWt0S3pocFJYaDZpOENYRCsyWXFhVjRnR2hmWHVHek9Uckt5?=
 =?utf-8?B?MEkvMmFsb0p2T0RpOGFyU0tGUEpKYmxqeVI4SnkxYW8yb01iN2xLb3dPRnZm?=
 =?utf-8?B?QlI1cE96T0VORHdjUTVpb0FvR0ZpNUJ2NUJVNUg0S1ZBRnB1bktSZVd5akVm?=
 =?utf-8?B?QUJFaTdvTXFuUzdZTUlDd2U5cllLRVQxeFVqNnJzVGU0czVkdVdIR2h5UFdP?=
 =?utf-8?B?Q0NvUnJwVlByN21RWis0NFVGTmxZT2VjSDQxK0d5UjNJcGQyRUNWY2t1ZFlX?=
 =?utf-8?B?bEo5UUJnQ0J5NWFONFV0TlpwU3FNYlhsMkV3c1F6UzVpMkxYaC92dmc4d1Vv?=
 =?utf-8?B?NENFOUlxRlZjS05PL0cwd0xlT3U2VGk4L0ZJYXVkRjJFcU5nOE1hY0F0TlJk?=
 =?utf-8?B?TFJDek83V2tsYitKSm1uT1VjSmlmS2tXTXJRTG5LS3BCMnV5bGVQNy8reDlW?=
 =?utf-8?B?cXdnQ1lpeEVJaTBOcWtGZW1ta3VBR3pjWnhncEZCTkYrbHFDakRmbm5FZ0FD?=
 =?utf-8?B?YnFhK1JUekVuNXlEdVZyM0NVMnhTaUx5VkVqV3hBTjI5dTJTZjIrVzVJOXNX?=
 =?utf-8?B?NlAyUUVGbDB1aGpFRkh3UnhwcU8xU3dnR2ZlaWswZWdZUm1DdGVYdTZmUEh0?=
 =?utf-8?B?Y00wc1l3MEJPNmFGOW9ldmtyeWRrRUNTUE8zK3VuU1lHejdmWWRnam1RL2dl?=
 =?utf-8?B?MGtBU21mZ1lObStQWHNoUXVSSmtZdDJWc3QzMklNNU1teXZmbUFPMDFiKzNy?=
 =?utf-8?B?bDhJc0hIbk5ENWFNQUQ3eGRDNGdsSkFveVJobXdHNXY3TWFwQXFSd25DRGIw?=
 =?utf-8?B?cWRtdGZKSnpkangyUXZQRXZYblZIVmNRNnRTVlZUclNkUkkvcE0yRng3M0hx?=
 =?utf-8?B?ckFYUzRGOFJNb2dLNW1YT1JHOFF5WlZOU0g2bGZ4ZFlPdlBocGN6dnlkckMw?=
 =?utf-8?B?QlpHRjl4U3NDZ0lWUWp1R0pudnlXcTlsYUx4QnNHa0NkSUJlSzkxNGFzUHNk?=
 =?utf-8?B?dnpmbTMzRXpuTDhTZCt1dmhkejhFQ1hFSmpMZGRpZU1NVGtBTmRIbGZIUjBh?=
 =?utf-8?B?TTUwSFRCczBidzFldVZVYTJJZjFTcEZMWGQ0ZHUyS1E5cld4eTlEdTh3Qmw2?=
 =?utf-8?B?UkNVWHZtRC9YVXBqMTVhZnd5RlZBSkZnemhGN0I1TDkwNXI0ZG9lR2VnVGJG?=
 =?utf-8?B?MExaUWFHRCtOQXcrRVJRMk5CWGFlN09XYnhKN0J6UE1WV2hXTkh2UnhkdXNq?=
 =?utf-8?B?a3B3V1dFOG5ncFp5ZEw4MXQybGNvbGM4cjJhRUYwWDlDSE4yQWpYTWdCa2RW?=
 =?utf-8?B?ck1LSk1sdWJJMTZZNXk3cm5WRTg2TkJkNEh1Yi8xZ2F6aGl6aWdXQi8yVUlV?=
 =?utf-8?B?cGJrUHZNWDdvaXRRQk9BL05ldjNwYnVCc2QxZFVINmlWSDdqSkdjU1VXU3VL?=
 =?utf-8?B?U05MeVk1eDJaNm9WdzhrenRLcVNRT3oxcXVuckpWaGhKR0xHM0NNRXZrblE2?=
 =?utf-8?B?dSsvbExJc1BxL3NXcm5MNndieXlaY1Q5eGNOQkNYOFpCS1JVMngzenZUQkx6?=
 =?utf-8?B?ZnFMRk5NN0YxRmE0Ky9CTWxnZmZPUkJRbGsrY2VTVklOL0IybFpQUG1TZ0Mx?=
 =?utf-8?Q?9WD7rT2XNGe6bToZ8VczmnmUg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c8666d-a863-4181-91b6-08dbc4ffc1e0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 17:31:35.3222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGSXbusJoDXOCuYzcYlXrdSUgcNmtHbTZgB7hSRC0R6acjVh47ztltPJuyzHxpw1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8319
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
Cc: llvm@lists.linux.dev,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Tom Rix <trix@redhat.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-03 19:29, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct amdgpu_bo_list.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
-- 
Regards,
Luben

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> index 6f5b641b631e..781e5c5ce04d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> @@ -84,6 +84,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>  
>  	kref_init(&list->refcount);
>  
> +	list->num_entries = num_entries;
>  	array = list->entries;
>  
>  	for (i = 0; i < num_entries; ++i) {
> @@ -129,7 +130,6 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>  	}
>  
>  	list->first_userptr = first_userptr;
> -	list->num_entries = num_entries;
>  	sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
>  	     amdgpu_bo_list_entry_cmp, NULL);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> index 6a703be45d04..555cd6d877c3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> @@ -56,7 +56,7 @@ struct amdgpu_bo_list {
>  	 */
>  	struct mutex bo_list_mutex;
>  
> -	struct amdgpu_bo_list_entry entries[];
> +	struct amdgpu_bo_list_entry entries[] __counted_by(num_entries);
>  };
>  
>  int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,

