Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D977B4647D9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 08:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155586E512;
	Wed,  1 Dec 2021 07:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDC66E4F1;
 Wed,  1 Dec 2021 07:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsJbP19Z07DHKSoOmKmLLhKjIGy5AUm86at1ijHbO9bApEfzZzn0uTRjl+VTbonvogjSnUVJntbOoKP6mfGRBkFPnMMfZrvnclX8IH/XMIdK+ZvYguXMdirRFyzg7LzMxcwx/8R+Uu6hJGp9iQRmqulZuEHG4GiYde8OTlP0b1imDYMZTUHeB8moLV3c3eldpCcpM5UTt3JkqKyFUs2u3ftU1+V9ynvKMxk6USYzZRcXYBKHgxzVtteR2IGseTR6uyMP9V8wd5fx47KS81OIeQUKD6xeKBCWFDbVphwAwCMrYKVQkv4IrQ3zdKtevvXoCwbJBOyNxtmwLT74z4m1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S4wT9qpfvLJvAsZAOzgS+t5wwhBKzQp7OX2AqbuNnA=;
 b=ns3P6Be46OY+ZovcduILJv9XbPelSOCL61LS5R/z2vNqEfjjXIQdGbJWxacDK1VbiPf7mAtnt9cBUt+kfvA0GD/J9qeaoh8eAzPmkSwftDW0EhRoP0iZj+pQOQ7ZoQiVRFGXwI75dbUKJ25jSYI8g0dhon7IF78vqm8yhwjRzyd8DMkMTcjmxE/BJUpSn3qNPdwhTrGZ5hYx3enKPo4pYc9lKAVpKPP837pPrOKho60Z51JqFCnU/qFcFXOEAAmy9Yoq9ONjF5y6tRyqE6gqWiB0ajBTL+DdcFo8FAQmOcW2rYsm7eV0ynJnGqIcl5x1ES5RH9ADcyDVdMP+GniFdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S4wT9qpfvLJvAsZAOzgS+t5wwhBKzQp7OX2AqbuNnA=;
 b=mqkT5PFPG+VNMioSjH4eLYkkWuas/sCBtLep1TRtUsfJTbXzpp0tXzEjIXiP0cFuuJfRFQep2sK647iFiE7N8AL27AbtY6dqZB4urICNIgp7CsnADMReEsP4W4zKPgaicdh0qZkLCRiZM9l40BqrNHDe/l3jW4XN5DN2NsJX6KA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1151.namprd12.prod.outlook.com
 (2603:10b6:300:e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 07:20:24 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Wed, 1 Dec 2021
 07:20:18 +0000
Subject: Re: [PATCH v4] drm/radeon/radeon_kms: Fix a NULL pointer dereference
 in radeon_driver_open_kms()
To: Zhou Qingyang <zhou1615@umn.edu>
References: <20211130155720.178214-1-zhou1615@umn.edu>
 <20211201032214.26889-1-zhou1615@umn.edu>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d7c890d8-9535-b349-0c28-b08e5074f714@amd.com>
Date: Wed, 1 Dec 2021 08:20:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211201032214.26889-1-zhou1615@umn.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0230.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::26) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AS9PR06CA0230.eurprd06.prod.outlook.com (2603:10a6:20b:45e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 07:20:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfddd46b-2e54-48ea-8311-08d9b49b074b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1151:
X-Microsoft-Antispam-PRVS: <MWHPR12MB115172CC7393B8A720A9BD7A83689@MWHPR12MB1151.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7lkaqt3mLzm3ZSZNyg7xQghfFUqtA97fxbVv1qtLmoNc2uGozCTG1sa4pdoFu6itjYKDCGZntZ1rumnsz8DLMnhQEX2znemmKxsvJSOWb2W8OxremttMZPHA8gvDraa7xKFxFSIMbZpq3tEK0Q3B1NtIPqP27iI18wm9MWbI8+/mlZ1uPPxvfQ8NgfPum9TsgFGHjadVcmdDcPd2pxjtRqNK6xbz1mHb30cV5wclzIw3CjE7C/rcJ99J+3b1PPY/IWrgK17jMQdDHp3TxKVyce1rJ/DKgf5GAFR/tcnrxwi3CdlPbZiv0c+lV2D7cjaQRProPw2ODF0KK8g1dGIgj+pAUk5wYO5H5vlwohLgATt5+pbgMtRgmKaLmVyTHDgeUW1Zeoe0MvWWLiA68G+IHQZQS7j/rRTp5uEA8s+F5ML8Z3rPqwkj/F9yWZLf4T8FnjzjV+yuZNq4JLXEx73EBfkE5C/n11GZq2pItcOcPnzEyAj4Ie0LtTJrUNBcgAeMGnuSiRd4svgBf3nORO57zwFYBNWuZRDvAPopzB/THQJjHGmRJsuFyleU0KMgwVyrYOHKl8ndChNci7inkTMS5OlPLlXm14FXMbevsR+pGlPkjyEvj2gq/Z9VFuwqcgNRwHj04uGWVF9tDSMvZMU9PONMSSMwnr6qrJhnouGX69I/EcIg5f8u75ffT6jIKevSdKdU7BimvQen8/SKDBEUfWQzxLuLAgO/xb9Yy7JybtGt7h0Tm94E4v9O1gC0zgO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(86362001)(66476007)(31696002)(31686004)(8676002)(83380400001)(36756003)(38100700002)(4326008)(66946007)(6916009)(8936002)(16576012)(508600001)(2906002)(26005)(2616005)(316002)(6666004)(186003)(956004)(54906003)(66556008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2swc1dsTDBQQ3lIRXRYYUFhbTdadjg2SXV0K001aG9WY29BR09LOTNCeWtN?=
 =?utf-8?B?Y2NMcktlNGs4QzhzelRCUGdYTGw2NElWWWFhUWZrYmhNY0NndHNWTklEd2Rw?=
 =?utf-8?B?SEN5NjBUNDFwdzlMRm5kYzErM0JsL1djcVlwWDYzcmhQQ09FR1pPdkdEanVz?=
 =?utf-8?B?ZExReGlsdnlTVHNUOXpSbHFydDRrWXhCUHZKMjJtRWtweEcyKzh5VXdqdDRS?=
 =?utf-8?B?QkRhNzB0V2lqdkZjSGRjdklzUmV4TVdESURCN0lXZTJSV1RhSUYxdjJXWmZF?=
 =?utf-8?B?T2pkWEhNVjhiQVJUN1QrV0FydENKcUw1ZXdESjBKY2JFMGVkUHVPd3I1VE1n?=
 =?utf-8?B?Q01oOExYYms1MkFOdFQ0K2k3OVIxcThDWjU4RC9ZTEZJcDFqQVU5Z2grcjFP?=
 =?utf-8?B?Sk5wUkY3NWJmeGZGazNzV1lPOHdOaDNRR2hSdDlWTm5GYVNna2QxWmlrWWxG?=
 =?utf-8?B?bXlYWWR1eTNhOVl6QzR5bStxR3F1Z1gxOHkyUzRnaU9qcEthTUwwKzlEdjRZ?=
 =?utf-8?B?M2Nib2M3WlorNjNWbDFCWUpReWJEaTZreTlhL1AzZTlhQ3hML3RHTlhTNEdE?=
 =?utf-8?B?ay83WXpvQ1pSbDNVcERlUllURWhYMTZ1VXdHWTR2blo5LzY0bDgwSGxwZmtH?=
 =?utf-8?B?NVhKbFgwaWJkbUQzSjJ0MGJlY1hMclpGNm1kWCtJNVlnS244azhEeGtpS3JK?=
 =?utf-8?B?Z1o5eWxWWmlBNzlJa3RTQjg1Mm5EdGJPMXRnODJLTzAxQlI4Zjc3WURSZmNB?=
 =?utf-8?B?ZitDRzVkZW1MRktwNVkwZmZXRTFJM0pSeEd4WWlxZEtudkhjU0VjRmQ5Y3lE?=
 =?utf-8?B?RnY5RFB5Ny90MVNRcERwMERmQ09KbkZ6TEQvVlVpampKS1JrdXRiUlVUMkpM?=
 =?utf-8?B?VWlBdEJCSzFONTRaNUFQNDVLcWwyVzkyeFN0UVBHYmZiYUdHOUh4MStWZndw?=
 =?utf-8?B?a1EwQmJZaWszakdLNER0R2wvaGZ2ZEhlL3JCcG9QdGROS3R6eEJBendiaS9m?=
 =?utf-8?B?a2ZJZkFaN2huSmxmdUJoeXVHemlma2E5Y0s0TEp1ZDQvTUNJcWhHOVltaTZx?=
 =?utf-8?B?N21zWXUxTndpdTVTTkR0Y1JlU21jaldjNzUvZUZxSTBTVml4SkpUU05ZNnFn?=
 =?utf-8?B?UFp3YmtQcFdVclJUa2wwd2I1OXhFTitMSmtZLzZNVXVvR3puWEhGNm1xUlZt?=
 =?utf-8?B?clBUNG9tSk52T1FSdzBVWnlwbmZQTGNVZlFweWl0c1hjSlIya1JwTFZFZzB0?=
 =?utf-8?B?QkJrSDg5d0JNWDlIT3hUQjg3OGhUck9hdFdtWHJ6RUhBWmdBekR5QVNDcVpr?=
 =?utf-8?B?Nk91MEF2U1dKc2pFQy92UzlrSEc4a0xuaVZJaTgrSERhUlExS29PUTlkUHZ3?=
 =?utf-8?B?UjhidU1sM0JpQUFtRlBNcFVjOXFLZ21MSTg3bHE0N2dyL2RpSGJ6THFyRytr?=
 =?utf-8?B?NXJRYkUrd3RBQjFic2QzWmJjRFhOTW9ETy9rbzNNdXIwVlh2S2xZN1JhQkpp?=
 =?utf-8?B?YTFPWk5NZXZ0cEx1UURtTXZWZUVNbGFtbDNSZk0zYjJMV1luaG0xS3c1Sng5?=
 =?utf-8?B?cEhRYkZrU3NqRkRLSDhNTXh0MEI1SUZiRXlDd1JaL01HWFRiVDdZWXNIMGt0?=
 =?utf-8?B?amMyUUpIY2pWdndaZVBUSDdDcmJDajZiRnNhRUEyYnJnM3ZWVGM1dGtuWmFv?=
 =?utf-8?B?MzhzeWgyYmpwZVpLRkRLWGJ3a0xVNHNYb2F3RTgxQ2k4dnZ5Y2ZLZWRYMmNM?=
 =?utf-8?B?MEpOaTJDOU14NlNrb1h0ZjVlR1dQTVM2ZGV5akpVaUd4SkQ0OCsrYTJjaEFl?=
 =?utf-8?B?S2ZtSmxUbFp6YnAwTHhPL1M4R3crblN4dEdncThNeHA3WkRsUWtzWnBnUjJo?=
 =?utf-8?B?RUR6UkZSODJCeW1IOTNPQWFDVkhEWTJndUtCZ3N0VGh5SmxPYlJTcFMzZ2RC?=
 =?utf-8?B?WnNxOSt3QXN3d2Z2NDFIS3ZsQzg4ZWVweHhGcVZnR3g2UEV5WlR4WVFHM0Jz?=
 =?utf-8?B?dXhzOENQdVgzWnMrRFhqK2hPYXFEZkJzVmVTdENpRjgzRFppVnp4TzJzQ2Iv?=
 =?utf-8?B?a2ZDSDVyWTBJTjFNdWtwbGhnOEZLV3hoNkZUdVI5NEN6ZTVxTndGNHQvemZo?=
 =?utf-8?Q?AbMU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfddd46b-2e54-48ea-8311-08d9b49b074b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 07:20:18.7484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgYtTihy+12YUJO/4zz4Lwz3Lgi80qlhJZ82zFayxhbS+IhEpqbEROmnez0TqU3i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1151
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.12.21 um 04:22 schrieb Zhou Qingyang:
> In radeon_driver_open_kms(), radeon_vm_bo_add() is assigned to
> vm->ib_bo_va and passes and used in radeon_vm_bo_set_addr(). In
> radeon_vm_bo_set_addr(), there is a dereference of vm->ib_bo_va,
> which could lead to a NULL pointer dereference on failure of
> radeon_vm_bo_add().
>
> Fix this bug by adding a check of vm->ib_bo_va.
>
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
>
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
>
> Builds with CONFIG_DRM_RADEON=m show no new warnings,
> and our static analyzer no longer warns about this code.
>
> Fixes: cc9e67e3d700 ("drm/radeon: fix VM IB handling")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> Changes in v2:
>    -  Initialize the variables to silence warning

What warning do you get? Double checking the code that shouldn't be 
necessary and is usually rather frowned upon.

Thanks,
Christian.

>
> Changes in v3:
>    -  Fix the bug that good case will also be freed
>    -  Improve code style
>
> Changes in v2:
>    -  Improve the error handling into goto style
>
>   drivers/gpu/drm/radeon/radeon_kms.c | 37 ++++++++++++++++-------------
>   1 file changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index 482fb0ae6cb5..9d0f840286a1 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -648,7 +648,9 @@ void radeon_driver_lastclose_kms(struct drm_device *dev)
>   int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   {
>   	struct radeon_device *rdev = dev->dev_private;
> -	int r;
> +	struct radeon_fpriv *fpriv = NULL;
> +	struct radeon_vm *vm = NULL;
> +	int r = 0;
>
>   	file_priv->driver_priv = NULL;
>
> @@ -660,8 +662,6 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   
>   	/* new gpu have virtual address space support */
>   	if (rdev->family >= CHIP_CAYMAN) {
> -		struct radeon_fpriv *fpriv;
> -		struct radeon_vm *vm;
>   
>   		fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
>   		if (unlikely(!fpriv)) {
> @@ -672,35 +672,38 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   		if (rdev->accel_working) {
>   			vm = &fpriv->vm;
>   			r = radeon_vm_init(rdev, vm);
> -			if (r) {
> -				kfree(fpriv);
> -				goto out_suspend;
> -			}
> +			if (r)
> +				goto out_fpriv;
>   
>   			r = radeon_bo_reserve(rdev->ring_tmp_bo.bo, false);
> -			if (r) {
> -				radeon_vm_fini(rdev, vm);
> -				kfree(fpriv);
> -				goto out_suspend;
> -			}
> +			if (r)
> +				goto out_vm_fini;
>   
>   			/* map the ib pool buffer read only into
>   			 * virtual address space */
>   			vm->ib_bo_va = radeon_vm_bo_add(rdev, vm,
>   							rdev->ring_tmp_bo.bo);
> +			if (!vm->ib_bo_va) {
> +				r = -ENOMEM;
> +				goto out_vm_fini;
> +			}
> +
>   			r = radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
>   						  RADEON_VA_IB_OFFSET,
>   						  RADEON_VM_PAGE_READABLE |
>   						  RADEON_VM_PAGE_SNOOPED);
> -			if (r) {
> -				radeon_vm_fini(rdev, vm);
> -				kfree(fpriv);
> -				goto out_suspend;
> -			}
> +			if (r)
> +				goto out_vm_fini;
>   		}
>   		file_priv->driver_priv = fpriv;
>   	}
>   
> +out_vm_fini:
> +	if (r)
> +		radeon_vm_fini(rdev, vm);
> +out_fpriv:
> +	if (r)
> +		kfree(fpriv);
>   out_suspend:
>   	pm_runtime_mark_last_busy(dev->dev);
>   	pm_runtime_put_autosuspend(dev->dev);

