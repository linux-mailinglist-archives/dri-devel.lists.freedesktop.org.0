Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F051EF31B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 10:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE1B6E8BB;
	Fri,  5 Jun 2020 08:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750087.outbound.protection.outlook.com [40.107.75.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C8D6E8A9;
 Fri,  5 Jun 2020 08:30:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1fsN5TJ7nE3lJObOaeznCmPlHI1ujtQWpQuCYu0oDK7aHz1R6n4ovCAWxJaLCIMdfnqxotQdRyfjhQwLn1vxqpGDIt3nj/1af/luFx/8ITP1DynGokxToy6STXtuBkoXpJQbGFFGkHcPv9XLUpTwWJ+KFXBCx2ee0XT9WS489RvKXPsoVC4Vz3DqKaHuT15LZ/EWB4YTve3MOi8gMuZM1LmUUpBdlno5jjZvBhDYhqsoAGeuVBNdEhFyjQvE24s95JoYzfDX8c02SokuVtXcQe8oicPAwKhll+nsWJVt++P89iiWcaVOiEEhAPOyHHGtggIn6DQwH8vwyGwOgP5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlIY35sSAkhhyE5Yx/QV3T0MEr4hUbB/90b5vlWJ6eo=;
 b=F8sv7mqNaVhsy/0jn0l7SDCSxJgYaLq4jK42glUH2E0Ri1YsdVv8RYKlkOMSHZ4YmDft0omsdW+6M4Ick+qkFNxrCsWCuLliuF4P+bYfLtjs0OEhzFF8OPOUNexjqw+pzQNnNVTJRVnZyAwQX71ghl98pmWLVkchO5oAWt6/XxJKvLKjzXrHI5zhpywXuZ14ZAD3JGZHI0ComQz4eyHdzfUYRhnjDA1w7MMklhTJZ8FErPqiMuJv1bgKayLPk7vfj/DBERMsx+9WTE6f4XQgsTE1uguDhrW0FXrygTxd7hH0AgfGadSyhMgV85RsX+mBxJR5ZRTbYol+ssIUvScbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlIY35sSAkhhyE5Yx/QV3T0MEr4hUbB/90b5vlWJ6eo=;
 b=4FmlkDJ/jwg5GB0WyndDOEbSf8l2FHSzgqpg4RZ+AeHHpJxoa6151no7MdZfvoP8klcyhAGVdG8syHng2omzfKPOto9BgaB09JGAywGFA9yXPK1nVVy6pY+NM+6rez3jpOQl3Et+pLIVyCrjSq5IyPlqqSzuW8gid2+X2Nu8TGk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2586.namprd12.prod.outlook.com (2603:10b6:907:11::21)
 by MW2PR12MB2427.namprd12.prod.outlook.com (2603:10b6:907:a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 08:30:10 +0000
Received: from MW2PR12MB2586.namprd12.prod.outlook.com
 ([fe80::693d:7e71:3a0d:b6d4]) by MW2PR12MB2586.namprd12.prod.outlook.com
 ([fe80::693d:7e71:3a0d:b6d4%7]) with mapi id 15.20.3066.018; Fri, 5 Jun 2020
 08:30:09 +0000
Subject: Re: [PATCH 13/18] drm/amdgpu/dc: Stop dma_resv_lock inversion in
 commit_tail
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-14-daniel.vetter@ffwll.ch>
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Message-ID: <e0bfd872-5d38-6718-a23d-6b14b3c14f25@amd.com>
Date: Fri, 5 Jun 2020 10:30:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200604081224.863494-14-daniel.vetter@ffwll.ch>
Content-Language: fr
X-ClientProxiedBy: PR0P264CA0188.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::32) To MW2PR12MB2586.namprd12.prod.outlook.com
 (2603:10b6:907:11::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.219] (109.190.135.109) by
 PR0P264CA0188.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 08:30:06 +0000
X-Originating-IP: [109.190.135.109]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb324d56-271f-4356-2754-08d8092aa87c
X-MS-TrafficTypeDiagnostic: MW2PR12MB2427:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB24275F7354CC06AAFE2C148C8D860@MW2PR12MB2427.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 810Kczd3PTLYFhIDGBMqwZu2HH3fiXBmzDv7Kedl9vnnXD/3JIiiGHD7cIAETelLJJW2wWoYFhmjevG5kHBvps3Y1Mvg/nVkrS9CPUH/L2RFEWH7ASZjlas5QSLsurU4zH66FXYYnm7XwUUFybCIZ0ri1r7X5dVhda9dijpbiNLKR2BsIz9sAyU5ghusvXvFIot7QNonP5Nq0qoOSm8ADKeekJk4e1n7v7agLN9trI2+kdTicKjKyx5M6KBwIP3baKzD7Lk4GCOitTLbW6zOjvNopS3QRgq2G1yMhY5fJXBitnKVXlyFFPVSboC0/vg20pRIsUsSzuLoLkD2sY0Y9C9BcuTl5I8bDvbXYw6+v+E3QOJkoU7F38BjM5NWbSmW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2586.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(31696002)(8936002)(478600001)(86362001)(54906003)(5660300002)(6486002)(6666004)(110136005)(8676002)(55236004)(316002)(16576012)(53546011)(66946007)(26005)(31686004)(16526019)(186003)(2906002)(66556008)(66476007)(83380400001)(36756003)(956004)(2616005)(4326008)(7416002)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KWj9D+1sTSyKCbiraKO70pvR6tuws1tf5LLVW9wBhc1OwJtYcGR3DnFPseTNwn17xZYejtmfR4JRI/dTjMfkXExTR7aA6b6IRPoyj0a/T0XSFX2V4V39DUioHkSYD8QiBkJ3IkcKQIVmSyLwmymtbYfYU+exTNRXMxe6EBW1ElSqeG7XQk3XzLo73BdaIUuNtsgqG96xK2PLEtMrzxfOkUmjze5sWOgM5oegmwpvg7QJ8q+H+9JlFMx7/dhXMqqJN6DP37+UDUY9ngNuiYU4kWUnW7OpSB/6IKfGT4Z2IDW6Jkc53XzrG4nLa5BKBOkA+tDqHVLxyEPmVMsH0r8LpPQZcsRwvqZ2FHB2rsK4iFqcDUTlubAwz9oSVEUDpZDkB5KLrzIAE0e1nnDlNiajfd2C5PXBewD7o0UdaM9zl5LIg20xSlM6rekELEhTYHp403k+fwD7MA74XaKpv3P3ladACQzbEgFg2axBf6t8gUXOWz0MhbZAt/+2KXFNYmpE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb324d56-271f-4356-2754-08d8092aa87c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 08:30:09.7937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xfdZI8gCJOL2JBDjKfXizcMW9aTh6gxHH2+jZ6NrDK2hBEtDfB3TDHzj43+i884cxij4I2FeA/ZS24JIkmJdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2427
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
Cc: linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 04/06/2020 10:12, Daniel Vetter wrote:
[...]
> @@ -6910,7 +6910,11 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  		 * explicitly on fences instead
>  		 * and in general should be called for
>  		 * blocking commit to as per framework helpers
> +		 *
> +		 * Yes, this deadlocks, since you're calling dma_resv_lock in a
> +		 * path that leads to a dma_fence_signal(). Don't do that.
>  		 */
> +#if 0
>  		r = amdgpu_bo_reserve(abo, true);
>  		if (unlikely(r != 0))
>  			DRM_ERROR("failed to reserve buffer before flip\n");
> @@ -6920,6 +6924,12 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  		tmz_surface = amdgpu_bo_encrypted(abo);
>  
>  		amdgpu_bo_unreserve(abo);
> +#endif
> +		/*
> +		 * this races anyway, so READ_ONCE isn't any better or worse
> +		 * than the stuff above. Except the stuff above can deadlock.
> +		 */
> +		tiling_flags = READ_ONCE(abo->tiling_flags);

With this change "tmz_surface" won't be initialized properly.
Adding the following line should fix it:

  tmz_surface = READ_ONCE(abo->flags) & AMDGPU_GEM_CREATE_ENCRYPTED;


Pierre-Eric


>  
>  		fill_dc_plane_info_and_addr(
>  			dm->adev, new_plane_state, tiling_flags,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
