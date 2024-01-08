Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B54827520
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 17:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3907510E232;
	Mon,  8 Jan 2024 16:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B066710E175;
 Mon,  8 Jan 2024 16:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgIsJ9vRIqQMEFF27fUP1eCvq0ZLGbq2eHRK2hSbQMleh83MIeOwdY2RmXwIzgaxbm7gV4SHFVqPjvdhB+cDSHirOJYHCLl/hX6d+YpzTpRhW71xogd3Ruiu5hvOXKiUyamdeZ1t+SiHr0p6bQttP1gthzBDmc1WTizClY+NT2/io4qeZkDg0WPfDW2Jx7NgM6B4201qjgskDzIa9iIyh03ynSFf8l9LrEhKozaoFqZnddc3MM/Ey7/pjv9VtH3oZxBAJdehpE7xkKdOeotqOQ3Sj1LqnG6+9MrAzquj+o9KclGCj5itvF9t+zoxcmXubppeTvFKZHWL0r7GoAHwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMjmyGK7NFXo+yYsYNntCchk93bD05aCMdCMws3nKb8=;
 b=ezuAXj4uE+yOqTLiOr3M1ZL/e6cSH4JHx6sc8H7vOFVkq4aZcF45w5Usi0kICIbimFHf3IU1QSXL5MsoxH/3F2BDTFcjjeksiLPuhjF0KJtoEEgt1eqrI1uGtj++XusqC1jebydJlxOT638nLpA2j8E9nEE0Ph0pqKY0fz7KSLfhrtnanP/6SHmvhU/Ef0Q0jz+i/SC4HDBM+7/H00E2yDJmxrNyBP4QkPdOQTMNAYpbCfFRIagwCabc/s/vV711LSa1dK6UDVMFN9Bu0/dZyQZh+QWddAkDmXvJi1OKwWAPIkC3avIIoWxB/M+5Xu72awLpkCB6wovYMqci4V68Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMjmyGK7NFXo+yYsYNntCchk93bD05aCMdCMws3nKb8=;
 b=1D9T80ETq8fwtIxTXLq5ZCy9SSQ68TOGO7wLo0HNxdBpl+ooKz0EC6kua2fcDCs+Zc4wKigAaHYTKzCOso09XR3VDfnTPrN0GaiIoyokK8zcI9NWiS6uR+P65z2RxKn6Lr9uiXrGFzRMzpFf1xYeQeHKcCDCgU07gymprORYoNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6686.namprd12.prod.outlook.com (2603:10b6:a03:479::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 16:28:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 16:28:35 +0000
Message-ID: <5a2e5c85-0c11-4233-a5b6-7069b5b5296c@amd.com>
Date: Mon, 8 Jan 2024 17:28:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH libdrm 1/2] amdgpu: fix parameter of amdgpu_cs_ctx_create2
Content-Language: en-US
To: Zhenneng Li <lizhenneng@kylinos.cn>, Marek Olsak <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
References: <20240108094052.171721-1-lizhenneng@kylinos.cn>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240108094052.171721-1-lizhenneng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb28842-489a-4acb-2c18-08dc1066dc93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CMbrpV423XhuSwTWZhAXptc6586C3rGxZ83OiGKBkxDe7cwDRtGFHwJFaT4IBngXPZ2g5OGn9VFTP8XMgKVu1iPnDRPdCAvsiCqovFSZ+LLZTT686R9l0nXObe0fnrzD+7lzA1s73upz6JmJIDNtFYmYd54G18YCMLq3TOo667gwDY7M9lbvXKkCvkfe9BSJsvwaECLSLbTVVHOspyAST99+9b1EH4bXUQkunliu8isdASHLftz7GSUn3VZmlGZiOYxJzMM6mVKSX2wHvBL04ZUm+kHmytmoctBD6zAURtLG/BnikdXY+uEgyYIsw+zsVnymTNQEXzWisKNF9xpeEdGiDeMlPm20B1LJINfyijpQQaHQailrpd+Sz750sgPtBq5RLcPpLKgBFN07urI+qM8MwAlIKmxdRflBGo404nWDs7h3hYVVkRosVRPv70hR4ZGeo1SHJgtF+KmmH2KqbtkP6Rgvx7lBDsjuMftZSsb5rPPQZdCcmfe1gS4ffJRWtXNr5tGUKkCx6Pvt4WQTMGLTqJM8cPJ+pJws9frCHT5+I9cSgaVvJaHS0Nmw7iSnLrAqtgEoMaHD6dUFpCcFKh+HcH/VYKC5go/x/PVw2sEGZIOc8nUOlsba5yqpv//FkufqHTOm8QkRIR9tN/ctNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(316002)(66476007)(66556008)(110136005)(66946007)(8936002)(8676002)(6486002)(31696002)(6666004)(478600001)(86362001)(2906002)(36756003)(41300700001)(5660300002)(83380400001)(26005)(31686004)(6506007)(38100700002)(6512007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDRvbnZmSDRjb3o3cDJlUzNzZldLTVJQcElBRGJsQjF0dmdIS2gzMlVNelZ4?=
 =?utf-8?B?MkViTjhsL3JlUlp6MWhQd2g2VUIxL1ZOZnZiaDg0T0JYTml2bSt5ZmJ3T3Nn?=
 =?utf-8?B?VkF0WGNjZzZSZnZUM0NESTR1dENpRGJMWE1iM0NGVFUzZUFQRE12b0V3aVF4?=
 =?utf-8?B?OXg3YVBncm5qbXQ3SUJLN3pCNFRtYkR4Nnh3WFpVSWpsMDRqQ3M2NS82dm4w?=
 =?utf-8?B?VWtVRTJjL2JMQkh6bUU1K2NYc0pwazl3SXpKSDNXdlZJSGdHWVp5d3c4ZWJH?=
 =?utf-8?B?b2dYVHdMbVYvZm8vVEdkdGovbnpJMm5yL2pCbGN0cXhJSktYZmVsTW5vWHVX?=
 =?utf-8?B?OEduSnZLanR6VFZUalJGSFVuYStaVzZteTJ4bk9Mb0FxR1BqWHNWdVBpK3F4?=
 =?utf-8?B?WEFLOThnR2JvQ0R2a0hFV29Nc3FVLzVTeThDQ1k0c0VQenlSdWxkTDJ2MUJr?=
 =?utf-8?B?aTlvV1dEWGhaZXFpNFk2OCtSSmlNeFEyc3pJeGtUTlQ3R0ZCbzhYOVc4QS9u?=
 =?utf-8?B?d3B2ZDJuU29YTy9KME91RHJ2cit3Qmd0eE5jM3dZY3Rmb2pPODlqNitKeFVR?=
 =?utf-8?B?QlpZTDlIbjJaNE1OdmFONC93d3B4NnQ2S04rTzFYRTFhMTdkRWhkZG9sOTUz?=
 =?utf-8?B?clZKS0ptSmpVaGR2MnAwTllnVlArVVVtS0F0Q09XUW53d0RnbGFZQU1aejAx?=
 =?utf-8?B?c3Buc3JkalZxZWpXQ0o2L0RJZ2ViNVJSc1RVVnkyY2NEVWptdGpkem1NQXR1?=
 =?utf-8?B?OTZvUkxoSTQrRW90VWVoK0ZueWVnQ3Z6MEV6NGxsclhQTUJ4T3F6LzRRYTR0?=
 =?utf-8?B?Z1hlT0ZMamlPS20ySTcyeGRwdjNLQXdJYXRaZHJ2Wnh1VGtMTXlWclk1a0FK?=
 =?utf-8?B?QjZGWjgwckg0Ly9nSU10N05rdlpMRWxJWGNwbmFvOFFpM3lwdjBFZys3U21v?=
 =?utf-8?B?TDB3SjRndi9UaitVYzZUenBPWC9HSWFsTXlYUldLeVM4M0FEcGhDajRnQkRy?=
 =?utf-8?B?Z2k2ZVYzWE5ER3ZXTEEra1RlVDYwd1hRVDJ3T3dEVGxYdTk1YzZRR0dOY0cr?=
 =?utf-8?B?UHhxZitEYkw2clltcW1RZElJWXN1NU5GRG5mZldMV3lUekxsYURrQk1teGJu?=
 =?utf-8?B?UW11a25hN05RcHV4TFpwS2dyQUd0QU9TMUNKYjZwNmlNWDJLWkphejNORDhO?=
 =?utf-8?B?STUzaVJQUkdpZU1pTlF3UWhBcW9CSkI3TmJiaDNzenVxdXBXenluY0Z1ZzBZ?=
 =?utf-8?B?QXoxaUw2a2lQd3ArVit6QWluZmZuMlR4UHgzTVdYdG9OblQ3eTdOWVZZcCtU?=
 =?utf-8?B?NGExZUNNRDlXZkZLTEtnVFdpN3hxSTI1eUF2ek4zTmZ0SVA0bUsrdVVuNWJB?=
 =?utf-8?B?ZVZnbVVva0tXU2VWdzNCMi83VGZPWGpWRFZwVFo3NE4yU2duQStmUDl4SGh1?=
 =?utf-8?B?elZTbE40blNwZis1WWZjUUN2dmV1QnFtVk9tQzladTlGQXVhTzAzdU5jYW9F?=
 =?utf-8?B?Q1NUbzQ5ODhrL3JXVjFyS1RVaVpiWWNwcU9DYm00ZVE2MFgxS0VIZEF4SExZ?=
 =?utf-8?B?VTJrQWFyTTlnKy9kSG03cjZZMnNZTjlLZk9aQUxKWjRjK1NsYTFZRjlsdTNS?=
 =?utf-8?B?OVNqYkorMDJpcWdlQWhEMjZ4ZmdDdkhhQ1VuNTEwR2xUajEvbzJyU1k5OVlI?=
 =?utf-8?B?VzVnT2dBVXdIYnhpZXFEZFF6NVBzTnE0RXVhYXNxQWc1NjcvWDFUWE9PVzlQ?=
 =?utf-8?B?RUQ4aWtiUFpBTmFYYk1zNmQrSEVNNVFjcnhSK0gva0RzZm5SbDdzS2FxOTh2?=
 =?utf-8?B?Tnl6UytZclBKRWZXOWs2TUhuZ3h0ajVRRXoxbTFua3N5N2g4UWlGZVRqYUNm?=
 =?utf-8?B?cVhxWXhqdDlBaTNqSC9peWxaaDd0YTR1KzZ1Rk4yUytBYzlVbVBndHJLWWpO?=
 =?utf-8?B?aldZTGVxR20vZEgydkhuQXdJMnc4cGdNaUtNS0kxS0NlbzJMUHBVNDNzMjJ2?=
 =?utf-8?B?VUZsbVdpaU5ZdE5JTzlPNGZOMHZQTlpTYlc4Ulg4T3FsL3ZDVy9MTXc5aWcy?=
 =?utf-8?B?VWpLNndHbzRwREJvYVVLNnd0dXNRdnJVMExHV0xYZ0IyNitzcFNuek1HU2ZW?=
 =?utf-8?Q?DZ77gF09aOPqy/Qs+/HbK3ShZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb28842-489a-4acb-2c18-08dc1066dc93
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 16:28:35.6001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8wU2fXoV0Mm2DPSY+nDZtQoC6zOIbAOrtnJzIFq12GGpA04y7Lgh1QUuUVa+roE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6686
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

Am 08.01.24 um 10:40 schrieb Zhenneng Li:
> In order to pass the correct priority parameter to the kernel,
> we must change priority type from uint32_t to int32_t.

Hui what? Why should it matter if the parameter is signed or not?

That doesn't seem to make sense.

Regards,
Christian.

>
> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> ---
>   amdgpu/amdgpu.h    | 2 +-
>   amdgpu/amdgpu_cs.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/amdgpu/amdgpu.h b/amdgpu/amdgpu.h
> index 9bdbf366..f46753f3 100644
> --- a/amdgpu/amdgpu.h
> +++ b/amdgpu/amdgpu.h
> @@ -896,7 +896,7 @@ int amdgpu_bo_list_update(amdgpu_bo_list_handle handle,
>    *
>   */
>   int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
> -			 uint32_t priority,
> +			 int32_t priority,
>   			 amdgpu_context_handle *context);
>   /**
>    * Create GPU execution Context
> diff --git a/amdgpu/amdgpu_cs.c b/amdgpu/amdgpu_cs.c
> index 49fc16c3..eb72c638 100644
> --- a/amdgpu/amdgpu_cs.c
> +++ b/amdgpu/amdgpu_cs.c
> @@ -49,7 +49,7 @@ static int amdgpu_cs_reset_sem(amdgpu_semaphore_handle sem);
>    * \return  0 on success otherwise POSIX Error code
>   */
>   drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
> -				     uint32_t priority,
> +				     int32_t priority,
>   				     amdgpu_context_handle *context)
>   {
>   	struct amdgpu_context *gpu_context;

