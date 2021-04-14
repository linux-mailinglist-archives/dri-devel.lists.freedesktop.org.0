Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCC935EE60
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 09:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27E66E461;
	Wed, 14 Apr 2021 07:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47C86E461
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 07:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPie+zVaKv8ayO4EPHwfv6s0R84gv1gNYRWo35dC2dRPvJZPgIyT2DQM7CAlIDk96iCinpytabxSIVZFIn+WGB2pIEiW0f8asTTkD1r2NbzsttbYidlbi1lWMAgcZmCLIL4cCjjMseuqeZ1otpMdTpKiFpLnMJ5U31T15Qqa+K7j/u8h674W9MHba5JUVNOTfbsgDvHfkrTcRJcVmGEMW//QwHyzhQBR0f3eP3EiuLYJHWozVGlVIuRrQSNlZIlMSvguwvAPH9r1GqrN2Y3YCppMPwNrVNIBOJ9pCe2RwmFvCfWBYEcR1AbfQTBjzar3ylPKHDtfoKQUMw4s+IveFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN+TwtTW4LKjl+YB9/KX+ILeQ5391K5EO6U4otw4/fQ=;
 b=fcTySl/C90SZp1JgibtMDpjsXS5ohUXp84IdBhUgrKEmPXJXlPycFemXu6Pxw6YG2P5pdwcOtPKHsM9g4njr8Bpu65FgP4g0dWCpz5OEHIJbuoaSoiMpKTrkOR9llCJhKMSbbRSk/lcgI8G6tfGbbT/Obp7PB5MNCWBHEHh5/bnqpYiOkOsRW/m3iMG4gHu1cxOkqTnaeFA16CvBPLBgONkuq3cus2qrQFyAimrQgY00BqFu2mT7RNvsCE1b8BIr4eHCNFferoFXALy+cOx8saU8R6C8mUvieW/vWkzkrHZG0b65gWvccm/WPMpeMjKltGrw+DYE7zdBGga3fYP8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN+TwtTW4LKjl+YB9/KX+ILeQ5391K5EO6U4otw4/fQ=;
 b=WeRcfeMsgLWbQO4TBYpLNDOqHze60T7oUziz+jtKbQwOrCqmBNKAesl5TMG18RqvgnfiDf4rceqOwesIMH5hP4aLx5wRq63OzZxQIVAW84XN6uuXk0WqCVDKvLdZNvHgfRYfaYxwfw631okJG0oKLG/A2nF53U/18QlDBkzsR8o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 07:33:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 07:33:57 +0000
Subject: Re: [PATCH 9/9] drm/amdgpu: Lock the attached dmabuf in unpopulate
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists-freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
 <20210414064621.29273-10-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <517032d9-1a37-ed7b-1443-9f5148e2f457@amd.com>
Date: Wed, 14 Apr 2021 09:33:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210414064621.29273-10-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:eb49:bad8:5b80:ea48]
X-ClientProxiedBy: AM3PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:207:3::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:eb49:bad8:5b80:ea48]
 (2a02:908:1252:fb60:eb49:bad8:5b80:ea48) by
 AM3PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:207:3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 07:33:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07b9db0e-6c8b-40a0-b6a5-08d8ff17a9ac
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142D22C9BF64CAB82914E90834E9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0jCLziqVhXJ3NN+TgDXfBoRDqREKuZvVmO802wps5+vtMIGF6T51dZ2gMF2I+pKNymYF4bFJBbbd08Eu2X3dZn7OonZKikm0vFicdTOfjUc1wfJpiMljNIqsyyrwEyrR4jSXvtef4T/rVwW+tOqhJVnD1bmBJHkDIknc1Kp9T2JslfnzF35fzNxgy2SolyUbwMqC606SsKhxXj1shRkb69Z9SnFrP7KaVYHQPtqwwkF6BDBIQHvP+00PNF0PkgvOPSv4snAELpfo4vBIMYrv38D3j4bpBfSYyeDllP+uf1bnAugLZ1JOS5C99DMqN9WNKXc8cr4+ZhfuEB8bnQhTtRmj72vAxG/GdG1ImtLKAqBmRjIbs2HMA6mSgQMbs6v0XhgmNmIgY1sdRrJHb/5j/auIzRIyXPcPDiVVsGsFGvrVNOX3eZxONBsJNPEsEYI6RsQ98kf7UKoyY/vKCu44Sp7wrw+UvRq+WkZlJvS8jCBu9vMHfimxBXahGDDI+obvmRKjN8ti1O0rfp1NV0jDxtY4o9f5d6geugLlWEXOs/DUdVlZcpsj0ML6/6fgabdygU6Sm0CoXyqhWWMj575FKyijbfnuJDwBCex6s4B35LGM0aMG/b/c3v8T9d75qMgRmGOTCHWpti6WWLd5knRNIm3NewtYWXVmPAuPHIPYrMrdkFZ/4c3Zh7tDcue2mRws
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(83380400001)(316002)(52116002)(2906002)(66946007)(31686004)(478600001)(16526019)(8676002)(186003)(38100700002)(66556008)(36756003)(6666004)(2616005)(6486002)(5660300002)(8936002)(66476007)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RnF3Si9ueW5NZGhOSUxYZXNNeDdtRnBjYUtpeTNJQ2FlV0tyUlZTK1NHdXYr?=
 =?utf-8?B?elJ5bTY0ZjMrMERjcVJTQUkvTGNST0srMStINktzRVhiazJYNXp2SVVuUzlq?=
 =?utf-8?B?TWJzcGJFcjM1MVYrZk02dkppRWdpMCtRTzRkdXN2dTFzWkhyWUN6ZXNLMjNP?=
 =?utf-8?B?eEU1SXdiSG8yakFKNkZLYnhHYS9DdGY2RkFuZXYvMG9lSkFFa2MraWVZMk9B?=
 =?utf-8?B?K1BNUWRJYngvQmUyUzRmdTIzMFFqSWxFYWdZTUwvMy9vL29RQXlMamZMUFVF?=
 =?utf-8?B?UDloVk10OGN2K1dUMElURlZQeFBKcGlpaXlURnFHN0QwN2toYmh6Zi9EV2hL?=
 =?utf-8?B?QnRTbWQ1MlMzZFFraDA4d3FqN1Vya1JWL1NqdjJWUDlXa0EzaUhBSUpOSXVN?=
 =?utf-8?B?V002S1FVb0VybTc1N0JDTlpJUHF2U1lPdnlKKzczdGhvWXFiTFdTNFhqbUFj?=
 =?utf-8?B?TWR0YUd4L0JaNzYyQ1cvQy92ak9Rek95Zis3SDFJMmU0eDRDMzQvd2kzQ01n?=
 =?utf-8?B?Sm1yR1YyQnhtZWF1NlpWTDRkWmVKRkJEOFlGdmFmRWljVWZ6TjkzTHZBdkJt?=
 =?utf-8?B?U2FSUVhFcEtuWWVRcDBTR2t2ZEZNRmJFWldmLzlJdXNWZHovWnhyK0FiMFEz?=
 =?utf-8?B?UDhUYlduYmFRMWhwYW1WVlNsWDBBUFE1SjN2djFhMXU2T0dJV0F4blM3MmtN?=
 =?utf-8?B?bTBSU1BvV1RRV0I1WHVDSWI4K3Bmckt5TDJsRDJOTHNuOUl3ZVE1M0t6aEM3?=
 =?utf-8?B?VGtLd3BIc2dlWm82V3EzQkFZdGdwMTgyd1NLY1pENHNnbnlSK3hEcWRURkN1?=
 =?utf-8?B?cktuby9mR21sUjFUTEdNK08remc4Z3pTeHAwTzQzVUgwNVBQeDE0WHlNeVNG?=
 =?utf-8?B?Mk5ERHMzTmVjMU4xVDRuWjlQWGJuemZXYUZBYmQ0S3U0TTFxc3pOYXc5Z2tZ?=
 =?utf-8?B?bkdjZUpzb01qSmZRSHFPZlh5ZDdHOEZINDF4ZG4rcTQ3a0kyRTJDbmJPNnRw?=
 =?utf-8?B?TklwR1VGaDZWcENRNWNRY252ZzQ4Q1ZidWJrUmFOZ3RKSGdTbkxXVG1FRG4x?=
 =?utf-8?B?TXd6aFlJbnhGMFJ0dkllUUZzMEdTT1JUR2NoNWxKQ09pOEh5MjdwSjg0R2k0?=
 =?utf-8?B?aHo2UXZXbng2dm8wRTdiOERTTFMzUThDT0F5TzdkandPUkZwejIwZFFuK2VM?=
 =?utf-8?B?ajNsa1g1NFIwRGZobVpYSGxBU2c3MVRoNWg4UGRBWmdvK1FsK3FIYS9wU20v?=
 =?utf-8?B?QTNkZldGd3hwcW9XdERrMkNZblJBTkFCNElobk1CMEorNlQ1dmNmc3YwQ2lL?=
 =?utf-8?B?Z0RCYUNxaktvRVd6ZnhQbUtPaHc4QTBqT3VGaEdjWjdxQUM0clQ4d1hwclhN?=
 =?utf-8?B?MWNCcXIvd3FqR0RNeXNrOTdkK3hOMDlTVkphanBRdnRSY2dLa1NQRXJlSGFM?=
 =?utf-8?B?SXV3cElIeDlYaEErSkdPZEUyd3RuVlc5ejRFd0tmdFVMdGthMzJyai9WcjNV?=
 =?utf-8?B?RWhpenhZaXk0WGVOalZpNzJLdnFqVzVRVEhIY2JkUzNja0ZUbFZzaFVxbzBs?=
 =?utf-8?B?VFo5N3N2dUVkcGdrQWQwNzhKWEJKaE01b2x3YmhsVTFGUG8rVFgvOHU2bThl?=
 =?utf-8?B?VFpaMm5Wc0w5N2lrbTRWRW1rYjNZcVd3UVp5UDYxQ2hVdzY0Ti8reVlWd1R0?=
 =?utf-8?B?U3NFZGtzT3JmU0FIQy9aRVBmd0RBbFpXMWtycUg0L0prUmxybU5VUGRteUdq?=
 =?utf-8?B?clN2N09Sd3FZdzdyaFdlZVAzeERaK3RZbjZnWmtQSFgwaXJ3eHhQZVYzYUpr?=
 =?utf-8?B?bXBtZktzeTlzRDlvVi9PRDVXUVVzbTZoYU56RW54VHJtZTRIRlNIT3M4c25L?=
 =?utf-8?Q?YC9SDORWDsWj0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b9db0e-6c8b-40a0-b6a5-08d8ff17a9ac
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 07:33:57.0343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lIhvumUQTiKEgiaYX6WCcdXtUBk80XnW+SvxU5FUQLo6QB/zQCNXELZl0IIXJCm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.04.21 um 08:46 schrieb Felix Kuehling:
> amdgpu_ttm_tt_unpopulate can be called during bo_destroy. The dmabuf->resv
> must not be held by the caller or dma_buf_detach will deadlock. This is
> probably not the right fix. I get a recursive lock warning with the
> reservation held in ttm_bo_release. Should unmap_attachment move to
> backend_unbind instead?

Yes probably, but I'm really wondering if we should call unpopulate 
without holding the reservation lock.

Christian.

>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 936b3cfdde55..257750921eed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1216,9 +1216,22 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
>   
>   	if (ttm->sg && gtt->gobj->import_attach) {
>   		struct dma_buf_attachment *attach;
> +		bool locked;
>   
>   		attach = gtt->gobj->import_attach;
> +		/* FIXME: unpopulate can be called during bo_destroy.
> +		 * The dmabuf->resv must not be held by the caller or
> +		 * dma_buf_detach will deadlock. This is probably not
> +		 * the right fix. I get a recursive lock warning with the
> +		 * reservation held in ttm_bo_releas.. Should
> +		 * unmap_attachment move to backend_unbind instead?
> +		 */
> +		locked = dma_resv_is_locked(attach->dmabuf->resv);
> +		if (!locked)
> +			dma_resv_lock(attach->dmabuf->resv, NULL);
>   		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
> +		if (!locked)
> +			dma_resv_unlock(attach->dmabuf->resv);
>   		ttm->sg = NULL;
>   		return;
>   	}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
