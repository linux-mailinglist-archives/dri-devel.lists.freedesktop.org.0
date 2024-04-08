Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F392C89C933
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 17:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0804011273F;
	Mon,  8 Apr 2024 15:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mrH8TNwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2104.outbound.protection.outlook.com [40.107.236.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC0C11273F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 15:59:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjaQHED2mPff4yvG6KEgtuBWAdd1DuzNYKgl0Kf5VARn+ySq14jisFqsm89TP+mIea+HlPpDKWW33CkmmkoZdVuvNjKtWE8v1mGXJuA/bZuQVwQpZ7ZJIqaRWvYC+B9C5lLJ8HDxk7AVgs6RPd7cxIuiuoMEj8XAVAQARKFj8YePukVpOf0TadLiMB6n5snJnI9RCHusVuoG0qzY9udxb1pY4G2YK51JWNsPT0pasAz8y4qw3Db9bUjw03qu4buDOL6GUD2z3ORjRkHS8/trd4ixHiOrwo8P4ds+810q9pTIigpc1oqNBdV3a5Js6oUSlJMYBsfF1HNUlRLpU0n9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/LDjZ3YY7Mj8/zoC9dLGpO68W62a3X0wMUre/G5Ar8=;
 b=D8w0JohO+pdtwx9H1tK49V9vzMs+nqaC9FeYnLqkF9DgnN7dK6sVJN6p8CEgdVJKNjG48x7kRm2drkeXDgUJBnIIsV/7/T+tFpWIiT7+nHs1r4ThezpQO2lGb9ExbApPPuS1veNH4LG4NadnAQWbv/vKqM23KHJsmqAeL4Ra2EmiQP2fwkZUyHNJjhR30rCCsJGkegbpZabC1Ibj+gRdJLn/ope7iUGBKe31zAS6CxypV7+kraTjjlWjC0Nj1JkXm2swFauGb1Fwkz9z0MrCf2QJfJeqXUH2wzb1/fj4dDIgcVNaQ1sXjKTRSVgcpZTRGmNkuODsHDEvSc3NQqCYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/LDjZ3YY7Mj8/zoC9dLGpO68W62a3X0wMUre/G5Ar8=;
 b=mrH8TNwu7fIv4opYIzuEcutzHjrLtktRHnpRr2lTc3KsCiCftgmIDctnsbzc/U+8wSpxCHbGNsmHslbm3Xwmv7H2SchJCFJXAAMRI0/JFtBJzGxYP2CV2kzfQSqjIXdEFVfSSQxlgcsXOEcZrQz5QPH5o1xAicOtnDDacISGmJ0=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8036.namprd12.prod.outlook.com (2603:10b6:a03:4c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 15:59:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 15:59:38 +0000
Message-ID: <843fdfa2-348b-410e-8ff1-84ab86cac17d@amd.com>
Date: Mon, 8 Apr 2024 17:59:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Print the memory decryption status just once
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240408155605.1398631-1-zack.rusin@broadcom.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240408155605.1398631-1-zack.rusin@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8036:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 67BDl0y4V4lVRxeAlgNp0Zy+vidV0lfxOxGFGBsTNITeme82ticJ6I34uGnMcWHLCBoSOrZIiSGA6/iwvyoUvDd00bKCsIP+86IJ67+7PDxwa8xXzgD5mT5nphPpU9FHl//4Ijl2qjNP23c3TawDMDydzEF0izYT79xa3MxYaKnaRkcR5pb/YtOJZ/Xxnf3JXI3sAxjOD+yurCO79Kf0frlESpcIGND61TSxI69fVETViugqQCwRcyjBmXvBlhvIpnQyHR3Ip5T+NWAOrGkgoxtMAU0L7A1OgeH10dqJy4LDkWBKGuHLaqF4srNRQyXAGQEu1s3KQ616mZoWgGKI5W0MAKAJdE/6oq7ooJV6hDRqNb2DxehcAnxAAK2OjxUtQY48bs3oYUlhywa9p3NlREoFrZegtbku+WE+WLGyJNRLAqQhJNjLlHhbH4dtU3q3Rb5dq8RLtklW/iaAI4yJdaqms/xhmKg0+F5FlPLGBBbeXmpFl8/5uHgDBJVbExzfj02PP5Y7RiJvutng4lWywAkB7sMLiFdyP8UFkTvj6y3Bqp+oRu4rGrlINbTtJ72EP6PvPVu600Oq4GHLELwiG3VT85qkv6i+BzAXyUqs8T467zIvIo7NX6AgYPdQ2fN1baoQoVckUPrnPiyZlJNCLPBhHFC9Bzkqrk7L+ul0bNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tzh6dEtleHAzcVpmMGY4aExTalp2dllIZUVsQkd6ZkkyRU5lNFNmc3psNFlP?=
 =?utf-8?B?V01ISXFiSHV4SXdLOTBFMlBxcjBtR0Q4eDAwU2FOMm9ZMlVzclIrQWlBMk9W?=
 =?utf-8?B?cVhVMnBleVZ5ZUVTMXdKTnd2MEZkaVAyMXoxd0x1T3RabU9qMVg4Z05lQ0NL?=
 =?utf-8?B?RVdJYllBTThMb3FMSlJIZk15WU03ZVM5aktwVHBEWXRrMXFuYmVhWXd0VTcy?=
 =?utf-8?B?N0dUWmtCS2lDRGlFNFlRYXBmVzR5cDU1WXpkNHlkeTNxa0RLU2w0OXIyMVBn?=
 =?utf-8?B?eUJsWktlS1FIM29LV0p0OWFDUnVnV0tqQyswTldiRHIwUk1UVThzUEdmNFE1?=
 =?utf-8?B?Zmx6S0tFL2xNaDcxR3A1bFIvL2EyRmNuNk02Q1o4VVhmV1pGeWFnMXBpbmNN?=
 =?utf-8?B?Y241ZWVjOXFVRnVweEpoOW1pMi9PR1pTY0FLWWlkemNLN3hvRHFoRmRvWDN4?=
 =?utf-8?B?QXFBQ3ltbUF1dWxEZDZjbHdGa24xN1RWaVhDcDN0b2ZkTnVOQ0o1amxVYXQ0?=
 =?utf-8?B?Z0dhdDQyQjNZNlJleDRudVlzcGo4MzhYMXlsRFpOOW5ibGNlUStNeUZWZTQz?=
 =?utf-8?B?SlhsbWpoVWNaSWpRcWFnYUk4d25BYVVtWTlpMlBRVFB3OWdiT2lqY3VUbjRH?=
 =?utf-8?B?QkJzZG5BSjFtaThHZ3ZGUUd1Ui9sM1FYaUlyYmJ2QWpIK1N2d2NUNDM3eFBS?=
 =?utf-8?B?VzR6ZEVtZVdaWXJ2cGdJb0NneVloQnBZSmFoaHpIaHorRFI5UFl3OUdFV09S?=
 =?utf-8?B?YnlmWnJpQW9rdWJjeit3VXY4TUVmeWJ2dVVkbGM2NW9FdFJmVUZXdXEvYjkw?=
 =?utf-8?B?UGNwT0RCVUUxRXpUSXEvdmNRTDlYWlM4Tkp3UVlsSCsxMkk3NlRUTG9DdU9j?=
 =?utf-8?B?cjZMVXpjcVVNYWFJK3FQVVNydGZTYTluU1dNamdwVHRCK1hXODl4ZGZYY0sr?=
 =?utf-8?B?YTNnSEJLcnhnNDR2WVp0SGpMTU43SjFGSVE3YllCbmNJZEpVOHlWWmRVM0l4?=
 =?utf-8?B?K1lUR21EQ0hyaGx1SzhMaElLZURLOUxuT0FsbFcyd0FpVnErdlkrMmRHSmxv?=
 =?utf-8?B?VWV2U2ZNMkdMM2wzSEJKMVFMRmZmeU52c0NsU2JwdmJEa0VYL0RldkIxZWx3?=
 =?utf-8?B?ODM2TG8xRHJZanVFckxvNlc1bDl2cEZOUmJCVnh1RDU0QXVzWVZpYzgyeVM5?=
 =?utf-8?B?RytVQXFySDRYWWRVdHRVdHZpeW5oNEJObkk4Nkc1Zm53UFIrOS9NTThJRkZ0?=
 =?utf-8?B?VWx4bHV0dGtVbDc2M0FFQ3JKeHZRY3ZhVTN0QTJyd0dSdVBxSzNFSUx4R2JO?=
 =?utf-8?B?MklUdjRSczBqTENnUFBGVm1hNzRUQ1FNdHkydzM4NjJZN1BOK2lINzlhM1ZJ?=
 =?utf-8?B?TlhLVmJlTU9PSXgrMXVBaUdDSTNNV3lXbFIxR1FEMm95cHNyblh2dExZUW1i?=
 =?utf-8?B?ZzJPODhnc2hidnl5ZHRMRDZIaUJGczdwQk1HaVNGczdzTXU1U2FrUHZyQ2Yz?=
 =?utf-8?B?TGs0S1JrQ0V0ZGwrVlpzbVM4ZmFPZ1daRlhkbjZkZk5Xam5JMXd1ZWJZbkhr?=
 =?utf-8?B?aENmQjF3Vng0WENQc2xpVEE2K1VqL01LZWZnM01BdUxwZHNkcWhTZ3RUMVln?=
 =?utf-8?B?dEprTEFkeVpTLzVmYzc0c2xtUjByWC8vbzR4UTI0Q3JTOTdnWnFPV0VsNFhQ?=
 =?utf-8?B?MkxtTGJhd2RGbzVHSC9XOHlKRzNFTTNpK1g1ck5FOVRteGFHcnRFQUhIRTBl?=
 =?utf-8?B?MThDbzR2Umh3bFMxMUhBQThIU1EzbUszYWl1UUJEYlRxaVhpNmNsSHJGOXF1?=
 =?utf-8?B?YXo2ZERGZkdneERCWC9PMEZET0JIYkJ0Q0pOOXNQUnpKSUd1Mk14Vjh1WWhF?=
 =?utf-8?B?c1VrV2l2bUlQalRJOTdLUG83bnJNYVAySzVxTUJyNWxZMW10andRWkErYWVz?=
 =?utf-8?B?cWZmeGtFRGVCY1d5THVYMmVVUHJ3eE9QMmR6T25tWkEzRy9iOC9TTm9mRzdX?=
 =?utf-8?B?L0hNTFoyRHE3bCsreHJGKzB6bnliaVU3ZW9zRGJsdkc4MGN4MXNlVFIrcUFN?=
 =?utf-8?B?WTVkN2kzR0owSk9sc0dkZVR4LytrcHlRRmo2Rm5SQm9Qd2ZsdkhrUEM0SWU5?=
 =?utf-8?Q?zqaQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f679758-6434-40b7-1161-08dc57e4e4c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 15:59:38.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIYZAbv13bFpqMnfSpFuyebrcN7ySTKYeFXJ92h5tp1kJJGxzuGF0nKqzhMqUzw/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8036
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

Am 08.04.24 um 17:56 schrieb Zack Rusin:
> Stop printing the TT memory decryption status info each time tt is created
> and instead print it just once.
>
> Reduces the spam in the system logs when running guests with SEV enabled.

Do we then really need this in the first place?

Regards,
Christian.

>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: 71ce046327cf ("drm/ttm: Make sure the mapped tt pages are decrypted when needed")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v5.14+
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 578a7c37f00b..d776e3f87064 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -92,7 +92,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>   	 */
>   	if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
>   		page_flags |= TTM_TT_FLAG_DECRYPTED;
> -		drm_info(ddev, "TT memory decryption enabled.");
> +		drm_info_once(ddev, "TT memory decryption enabled.");
>   	}
>   
>   	bo->ttm = bdev->funcs->ttm_tt_create(bo, page_flags);

