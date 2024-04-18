Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759888A94B9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 10:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1169F10FB3C;
	Thu, 18 Apr 2024 08:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="id8g3DeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA4A10FB3C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 08:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYV2e/5omC+qle9lqXICYQ0jN/j187Fbk0DPw5sDgt53Laxv7jSMUPpNI4B+jo/bcO7mtOlhaWB/3BBdzFdMaxJzkIoK5SfTghHjm9K1dsKd4Wp9DubpQxwM0ksWzRuT0fvtd+qkUnIlJdvTJao6m1f9qNy+gsMA6eRPavb63HnpGK7aEECqjSNJnPZ0Fu9pEWNfB67WBG7x4dUS0WyHxCDfCsMobjHyvOtajcPACOtpO5ylleJNWw/u325ykjKxNMQtXinNxI9gFKkUup8MZFQUGehqp6H9J7KfxV2/5CnyiQGZ3ptI5T/E/TSrKtBXD4Z0ptShhw3y9xK6nE9gKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJAMBTvPVlJTdKjji/c+DeJb6lVvZ/JswFEVHQvP0Jg=;
 b=Y09OXm21tBNBM/1J3SGQ+vbkaTc9evQpBLdYBunhyTMbtLDzr1gHExTR0yUer70ohTD4UIjnxtZUyt9wRpL/yX3Zd1Yvsp3MIo1kJXFuMBWBMo/rjzBoY989cttUYcZHxP+OSqMSBouf427Pck06QOzAltKH4BoO4VCVtRREfPkw+H3ZBhmQK+D3SM9eONOdy8f9njeiVDk3AwHCX32R5MpZKVTfAQpO1zkdia7dEhlLnz3mlW3QtNMfUqt6kujFw+rZd8VrzKJymm4mc3C/G8t5+5ESeULy3uFEHO5la1zYQQ15cfvOwwX8heYi25FDndDIIMlPN6/n2+HUMjMp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJAMBTvPVlJTdKjji/c+DeJb6lVvZ/JswFEVHQvP0Jg=;
 b=id8g3DeHE5n1zmQv+YHyDZaoTLKDgS3JORrTlmIGAEvF3BoR5//r3A6W4KqqD7ZrNkw0a814ZFdMCgy+O9G5QXkyk5MPS4H3ayMKMPzmM4yqnMz6LV6YLC0WnAHsVzG24kUwWbuXDSkDLN0QB6O2ZHkEADZsBUlcZQHpB5SV65M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Thu, 18 Apr
 2024 08:15:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 08:15:10 +0000
Message-ID: <2cdbb374-c4e7-4b2f-8ede-459ecc0224b9@amd.com>
Date: Thu, 18 Apr 2024 10:15:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/10] drm/ttm/tests: Fix a warning in
 ttm_bo_unreserve_bulk
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>
References: <cover.1713357042.git.karolina.stolarek@intel.com>
 <4b5a19219e4a1313fd438d52431b57cb7b77b34a.1713357042.git.karolina.stolarek@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4b5a19219e4a1313fd438d52431b57cb7b77b34a.1713357042.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: c76b7268-2941-442a-8cd6-08dc5f7fa9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /kJHJirCAbzPDoL11DPjxI+u78Fv+g7ICtEUldSUnRP6/HJeY7kStucMb164JDKCeqos4kLnPgLv3xYNtST1PHXAEBa9racfJebA51aSLAi68lvoeZ4AoV01Azv8PGCdoI2yubxzOp6Dy4fDVRQPEr+UraciEYIY5U+q0WbybpVl34UiEu74BOLf6ZV4shav+qO0EwTrL4yZAl+z5Wecx0p55IrwjrjiU69MhWKRsULIXn4ae3+0R5D39iVVWZ8iXnXKes5y5ViS0oZJcqdb5AIOrzKVJCWDzQm8mgtxnAU5CUvzSp8DoHfxvebLRkMR5yu7f25UQeP+c6VqwuY5F2f2upE/n6abblCj8AGG8g7wL0Lid67Ld3s6EikYSwZPP2DLlH4PCAx7y8tO9LoGiuvl6oDizQJr1ScSVydXuZpwE+7np/JsvwGnOXPWlUQ9X6yzpZbw+sDCYfbr0odBQdQag91xzN5VI9CGZbKtwlcHXLcT6YzhoW9SEcu4baVp61PC1nUh6CnbiDoH0pIO+i/wGpEbpmo/lPOlyQkyk52dLDcYOEJINumHpzrz+4stupetVrLekFv/5A6fnJKPFeReJkTWMQuLzQqwMErYmM22IqeWn8YZycI5f2awqFD12iQS9qEysE49qVdZwZxOCSB3wcQ8jHx1xnh2qlSViVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzlQYW5NaExVSzJMTjNWdmRuTDdOVUJvb1AycU85N3JHcW50OCtWTW9rYmRO?=
 =?utf-8?B?SjJ6bklRalVObVNaa003NTRwVnI5QmEvdG5wM2xzK2xBeGVwbzFyNHE2QWUy?=
 =?utf-8?B?K1NHNys1VGFMMzc3aVZEVFhEOVlhMTFISzQ4K2tUdW9lajQxVEVvUlVZQmta?=
 =?utf-8?B?azJvV1dHTTZoWVpRMXdjcDR1SGdUTDBFRnVJYjZQcXJOR1g1VU9yOCtxLzNp?=
 =?utf-8?B?YmpFNkVSdjlMa3p0MjVTNEdueUhOQzFEeWdXYUVyeE9Ic2dFeWtIbWtpdjdt?=
 =?utf-8?B?Sk5VblNzejZYZ2swOUtDNURDc1llQlVwQWlJL2taRE1DejZLcXZSZXBVSTI3?=
 =?utf-8?B?dHdVeEcxNmFobXBuQ09kY25HRHRnN1p5V3U2a1BER1lDTTY3NlRMRVBHeXcy?=
 =?utf-8?B?Y0d2SXEwUngzNlo0TXlOZHJpZGtUS0RxY2cyTytnUFB0VzlWWFc1ZkFSU2pM?=
 =?utf-8?B?Mkx4NTR5dDFGQlBSd3h6TUN5Nk83QVo4bnZWVDB0RFlQdmRVODRrWDZ1K3JC?=
 =?utf-8?B?MXFKeUY0Yk4reUQ3ZklON1I3M09lL2FXVk03NVlsem5uRkxsL2g3bjJLM2tM?=
 =?utf-8?B?emJ2RHo2WmpqOExnd2xoeU5TT2FhcnBwcHlHU3U0SFJzbmFyZnBXWHUyMGxP?=
 =?utf-8?B?RHdFZEZ1QUEwYWRySUtQaXRCZU04TS9iN2dlVzJoVm1pNUpDc2c5MTVSWUFr?=
 =?utf-8?B?Q1Ftd0VNQTVKRExrenhLRmNJTTVuN3NWTW8wYXJsRGx1eWs3ZmZSUXkwMUd3?=
 =?utf-8?B?dDU0Z1djZjQySXduekdOZDlpbFFKMnBJRlNXTTczME1XU1ZMTVl0WGVHeGM1?=
 =?utf-8?B?ZThTVmpqUXpxOW0rTzY1QklNMzhCY3JTenR2RGxxTEFxbGFUQUY2bHBBSWdj?=
 =?utf-8?B?S3VWSjdvM2VMYkFydkUvM2FQVlowWHdxL1VWU3lQRVdIdzFycHhJZTZ4SFFz?=
 =?utf-8?B?WjRMWHNiMnY4WThVVFVlY3ptTTdxRTE3cUtEWDJJamZFcmRBc0xiRll6NFpu?=
 =?utf-8?B?TnNsZUJ1TTFFREdlcmZtZnJTWnJhZlh1RU5XRWxxODdCYWFMNnUrUXlwMm9s?=
 =?utf-8?B?Z2JrdkljYkhieXBkMHVBdUJIY2R3c25lbG1QazZDbGlKZ0IvT1lCU21RbTVu?=
 =?utf-8?B?VVJLb3RSMkRWcjliTVRCeld5N2pncjhUYnJIcWhuZkdDa2Z3RzJ2czhZTFIy?=
 =?utf-8?B?c2NEc3JRWmxITkdoaFNwQ2dtVVc3UFpTWVAzZWNIZGgzSG9sWnBCemh6UEtH?=
 =?utf-8?B?ZW9meEtjSnJGWkw2V2ZHK3poNXlydTllaFlTc0JQT2Z6MVhESXZjYWFkc1BS?=
 =?utf-8?B?aFlQS3pnRHp3ZVprd0ZhdnpKTk1kY3ZNNSt2UHRydSszVUoxcUZkY282THBN?=
 =?utf-8?B?V2o3WklacXhDQmZDOVNzenoxNWFpVVBIUVZGN2IwRjRFUDlrNUd5Skx4alYy?=
 =?utf-8?B?d2xTZFZiY2tJa09IMlM0S2lBcjhIVmVweVhQejBqSTZ3c1hPYkg4U1YwQ0JI?=
 =?utf-8?B?NjFZYXN0SHpPaUlwQitxZEcwa0lEOWtzTXlkYmhiRzBRNTdMT0QyNk52ckZl?=
 =?utf-8?B?YnBJcFR4dS8zYnJMMFgyMEgweHdFcWhYMHBPK3lSN2F6OTVzbllyellPYko0?=
 =?utf-8?B?ZHRkNWRwOGM2YXEvWWhYNnJmNFBUV3BDMHVhRENEL2ptQUp1NEJONWNZaTRF?=
 =?utf-8?B?MFV3RHBiZU9STEdUQSs3cEVCdElob25adDJvNVo3TUlmOGNLTXZwMVZ0NG51?=
 =?utf-8?B?SmQ5d0w1NHY1bmpCTXQ4VEYxemd3Q2kzaU9ZdmhuRVZyUWJWamRYYno3dEF3?=
 =?utf-8?B?TXZ2ZGg4Y3pmdzVRQnZnQ2JVUExHWUJpcXljRENRaTJrbjhDTjBWOHhzak9y?=
 =?utf-8?B?bTRqZk9NcXFFa05vMnJJaWJIb1FWcGpoa2tXbW41L0ViZ0IrUjE1Y0JXVFFt?=
 =?utf-8?B?bDN4Vzk5cmpLcEhUeFRHMDdRb2JVQ21MUlUxODladGF0WVl6UTNnYjVkUVU3?=
 =?utf-8?B?M2ZJendDQlFEdi85enFzd1p4K2NoTzZURGpUaXRZbUV1K2V4RDhFa3BvWndj?=
 =?utf-8?B?bENQeWs5UEo4c0RVZ0wxMEJkemxvbnlaNng2MzBBSyt6NEs4Zk5sWlFTNjlq?=
 =?utf-8?Q?fjvqsvea0l3pCI5YKKs+NBrTR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76b7268-2941-442a-8cd6-08dc5f7fa9be
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 08:15:09.9448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PpcHXzpPTy+5IPpwpJ1O5WZ5FIGk5WKJYTyD/LoVAsIW22UIZB65aOUVustEJQh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228
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

Am 17.04.24 um 15:03 schrieb Karolina Stolarek:
> BOs in a bulk move have to share the same reservation object. That is
> not the case in the ttm_bo_unreserve_bulk subtest. Share bo2's resv
> object with bo1 to fix the issue.
>
> Fixes: 995279d280d1 ("drm/ttm/tests: Add tests for ttm_bo functions")
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index 1f8a4f8adc92..632306adc4a1 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -339,6 +339,9 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
>   	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>   	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>   
> +	/* Share the reservation object in the same bulk move */
> +	bo1->base.resv = bo2->base.resv;
> +

In a real world driver that would be illegal because it is racy for the 
UAPI. It might work in the test case, but it could leak any fence 
storage allocate for the bo1 reservation object.

We should probably avoid that and I would rather modify 
ttm_bo_kunit_init() so that it gets the reservation object which should 
be used for the newly created BO with the default behavior if the 
parameter is NULL.

Regards,
Christian.

>   	dma_resv_lock(bo1->base.resv, NULL);
>   	ttm_bo_set_bulk_move(bo1, &lru_bulk_move);
>   	dma_resv_unlock(bo1->base.resv);

