Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF83909C4
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 21:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C7F6EAC8;
	Tue, 25 May 2021 19:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E526EAC4;
 Tue, 25 May 2021 19:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsHyLpD1aB8JJ0jAsnqP8ZQeOyVZGrxGeAaMEu9mI5LMd0I1cETYGkZbglUV6PEptB1EP1vHXDzrIcus+kw+7P2qilhC7nagrPJitvmi8TOzs0m1xh6FhWa02LQNorMUcpIh/lZ3TWYFXYxUtWOl5SOUBz4ZdptAUr2KdvvHWjQJqny+ojSEVtcwot17HJ9paYKMmgybK2fsKLjKmzhMa4S42S099Icee3PnI2iute7rSHGuePCpHH8KCYK1UD6SRnMGn30xTxU20VP7vfdF2tLqNAzmetvUMdnfDxoxBFpTFnmqHXHLKL4EcEffffFDMMsp0CZQfqBx16tNjDPEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDJkqOjUi0z/0JM2a7Upp3hWHr4LIwtmbhrqsY+HMjI=;
 b=byOFUjsqzwJRf6ZaUz3kbr8WssZJY5qT7YgRRoyAXvBGHjsBtur5JeKGDc3pKX7Fo4BDmFcfhGE2U4X6VWznAv/vsXGfxYIpigaAzsQhk3ro54oNDwc/TzJPve3H0+CORaxdK1RDkts/DNMAuTGKHzOAm9a3IYod/+HhYPlhIWHFCWZDwV83GX4ZN9N+yMFtL9OA+JZQPm0IzcZX13htwl52mzoSXyotBkA6tXq3qGpVAJtyID+Dd0qpwi1wkN8SGgcht1P+VOOODsBhKDWxQtoZp0LxUVBybca1t1Zc5NRkQ8wkmZG0EahwzEtfPdaNA+q0f9yjQUviNngtkkxDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDJkqOjUi0z/0JM2a7Upp3hWHr4LIwtmbhrqsY+HMjI=;
 b=F8b1gqHCTh1nuymKOaPL0rOqpe2cEBAp2Op2VDxHx4QhTYM0dZ982XWxoOOaSaLdBGixpQDWNxm7R+/OCUEH4uj06W8o9PgpLJSRZnShfBCCoBWDlDRv7W8gqTe2cl4Krs1yqDZ+pmMZ3CEAreNARKy1D7DuON1UX9z0KrPXPuQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5178.namprd12.prod.outlook.com (2603:10b6:408:11b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 25 May
 2021 19:39:29 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 19:39:29 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: Fix an error code in
 kfd_mem_attach_dmabuf()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YKzx6sh5g3Y/pNRC@mwanda>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <7166dd75-f3ca-160b-f91e-161f8a7d2054@amd.com>
Date: Tue, 25 May 2021 15:39:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YKzx6sh5g3Y/pNRC@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [142.186.56.206]
X-ClientProxiedBy: YTOPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::44) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.56.206) by
 YTOPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27 via Frontend
 Transport; Tue, 25 May 2021 19:39:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dcaf911-d316-49de-25cf-08d91fb4cfdf
X-MS-TrafficTypeDiagnostic: BN9PR12MB5178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5178BDF02EFD0C235F4ABEE992259@BN9PR12MB5178.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RdgIapu86JIAAowyjccnqp2+232mC/AEC0Y84Q+/nM9B+2hfv7vAuI5wl1YRBlPdSfdn59AYtE33ceeoR/P9Bn1eeVdbQaTc+Zlw9slwd/nYTWwQnorqr5SNOdLqi4gQCjC11KQU0o2yybjq73jNM6ggVCXuu5SbAWy6rM4487lK3hhmFGWfXERAFRQsZSB1GwVa8qCqlO/GbTFlW22l+Q7rXcmRJQZd/CvJeDHZeZNt6VbPS944A9vwunFf3dyNvBWHaveC7d5wXT4Z+hycrFx1Vbtsw0pQgWOc502Pra+b1GEAswdWHhaqOHsiAr5Y36iumleTNzUUmQ2QPu0ysgwmCc/J5BrU7C5JVgd3b3H2wH8ptO0hoHQMSR8ir0qVV+csM+KPcbyoSF63ZCtnMTCYYR0WXnB4KHLwAqrWi9cS9fLVrhXw3vSSesEx+3luRHy9GCa7Xcn70hjHPIXkJZ1MdCt05kNJ2OJTFPTONo/OLYkzTLTzfBNx4jZFX1uCKemqWCAdirtsVbpeP1ZrMNj+ytGM2leZlqsnyWIPpkqtVochZedlG2Y2c2gU0vsHHMC1X0UkMipnO76sCO2EDgVjQ5b3w+JXu5j+xuzIIqqoG2AGwKp+tok0Gb/5EGpBA0SEtAEkuC5fJRPlzUCvgwSDByQJmviKmLY2F2tAmp9BHhCyxQ68Kkhz2B/DGdOj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39850400004)(396003)(83380400001)(86362001)(54906003)(16576012)(2906002)(316002)(6486002)(31696002)(8676002)(36756003)(6916009)(66946007)(66556008)(66476007)(4326008)(8936002)(478600001)(956004)(2616005)(38100700002)(44832011)(26005)(186003)(16526019)(31686004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXREZVczaEM5aVM2dG44ekdBNzNGNERBM01iZFEzaTQ2M08yWjhEWWlmSjBw?=
 =?utf-8?B?bjkwZGxETWxLNWFsZFBMT3dMbzB0T1VmTExBOE9KR3lwSERGbk96bWxHS1RT?=
 =?utf-8?B?RGhackcwbGM2aGlyNkFMMmdONGhxVTBmREZPU0tQeFJmcEN3NGJXQldWWjkv?=
 =?utf-8?B?ZkVkY0hvamRFdVRCYXpBRkE2VFVUQXQ5aENFbEZBVmZxUU5nbm1FMHFyRDh0?=
 =?utf-8?B?TkZXWFNRaVJnMDEzVXlvMm5wbFBpMTl4byt4NlBBbXhBRGVKZFdRMktTR1lz?=
 =?utf-8?B?cW1zTWV0VW85NFl1YlFKaUhBaGVXRGxLTWkzUXFCeUpBMVFZNFUzRTRJejB1?=
 =?utf-8?B?N3RnZEZVcW1sYTlzbER2dHdTWlMzbG5zY0dONGN2Z1NoR2h0Z04va21MOHBK?=
 =?utf-8?B?RmtpbXpzenhNeTZaYXpLUGdmTXpSOEdVM290Y1h4cjM4SmNEMmt3ajNhL0tp?=
 =?utf-8?B?eS91aWJUQnAxZEdVUm1ISlYyVWJwdGw0KzZUMTF6WFZZTzE3VDdUSkp0anM0?=
 =?utf-8?B?WVQ5WTBXaDY3REtlNlJpYStmT2RlUTlXSzY0VmtzS0YxVnM2TjVBeFFtelZp?=
 =?utf-8?B?cGFleUFQMDFQay9DR0JGOG5pK2RLSHNzUzRFVE9mU21JU2dLc0VVeWRsUm1l?=
 =?utf-8?B?ZG53SHZ6M1lmT1FDWEtxNFlmNXNhcXNGUkUwblZ3aEE0WU1DU1dGS00yYXJo?=
 =?utf-8?B?S2VGc2txWkFudWh2eWJTazFZb0N3N1hKSTJ1TTVqcDdSL1lzZ2xLTU02SWsz?=
 =?utf-8?B?QnFpRnR0bXNTTUNUZDlxSWs1aUlBU1JWUXpMWitrL2FCYkpjR2JYMEJBM0hX?=
 =?utf-8?B?VWdHNktQbmFCUmdsSzg2WFR1L1VXYS9BbldMMENjVVVOdDJ1TjY5QnllK25V?=
 =?utf-8?B?a1BSaXNKVEdQVlI1aTBzSnlsRm5PS2czbE4zR0RSWGhtc3RKV2dTRkcyUTJV?=
 =?utf-8?B?ZHp6Z05neVFMM2NzS2ZWZ1hNTkttc3RWaEVnU1BlNWRodmdyRkV3WmRsME5V?=
 =?utf-8?B?aThXUldjbktGUDAvSTZBVnhHMGs2T3h0SlhiQkw5dnJka2RSSjREZ0tuTVpw?=
 =?utf-8?B?RFJ0RWg3ZmVPcmt5S1hpWVM2ZUZheVdNZWExU1dpSkwzTkJWa284d0YrSDFV?=
 =?utf-8?B?Yy9sWlJmZmNrdTZNWFRaRjNHcXZaRGx5RWp6aE9oaTJVa25wVkxSdldLUzRl?=
 =?utf-8?B?ZmluL2poVG9kMlJoK0VjT0pqUXpwSW1xaGxoTU5KZDdRUG03MGNhaklZWHlx?=
 =?utf-8?B?MHU4bWxUa3M2eWJvaXgxL1lIMXhINElQZ29lNm5lLzVUUkhJem5zdThVYjJx?=
 =?utf-8?B?MEhqTEQ5RHppZGJzbGp1L1NOT0xHTk55NkJzKy9XYjRqZE5ZUUtORklCT1pT?=
 =?utf-8?B?SXFvSHU2UnRJNXRnTm1ib2dPVlFkc3l3TW9mRllsQmpWb0ZkRFZTWVd4MjFS?=
 =?utf-8?B?d0tCSU1aQlNVdUNZSXNYdm9MYmRUb28zMWR0TU1ZVFFhTWpjZDFRMlBUODZM?=
 =?utf-8?B?ak9BQytYL0V5bWV1cXJQZTEvdDlxNDVuMzNiWldoS3l6ZkNBV3RPcEJ2c2I2?=
 =?utf-8?B?eC9FN0g1NW1WMy9rdER2SExHUENWRUVzRzN2R2dDN2F0b0NFTG96ZVJ5Q3NW?=
 =?utf-8?B?UHpBMjk2TGFFbkF2Zy9WUjZVRUFFM3I0dndPOFZLek1KUldWdGI1cEluOGt0?=
 =?utf-8?B?YmJ0UGswREVFb044TjlJM0tCVzBiQmpqSmFFeWZ5VW1DWWVNL3BycFd5NW1J?=
 =?utf-8?Q?ofa+lx1ip4+KgxLXCCIyg8MahGHthVVzjFtnctM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcaf911-d316-49de-25cf-08d91fb4cfdf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 19:39:29.5969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAGBLn9AudQxx0TYt6IfNODT2wGtEbf1TYDQSrgVVHPtISnytxWrQ7cgC+6wHWlSUzQCNLZWGZ33VjtVP8e9uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5178
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
Cc: David Airlie <airlied@linux.ie>, Oak Zeng <Oak.Zeng@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-05-25 um 8:47 a.m. schrieb Dan Carpenter:
> If amdgpu_gem_prime_export() fails, then this code accidentally
> returns zero/success instead of a negative error code.
>
> Fixes: 190f2d7696c8 ("drm/amdgpu: Add DMA mapping of GTT BOs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for catching these. The series is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I am applying the patches to amd-staging-drm-next.


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 68109908a869..9b7a3f849a16 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -639,14 +639,16 @@ kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
>  		      struct amdgpu_bo **bo)
>  {
>  	struct drm_gem_object *gobj;
> +	int ret;
>  
>  	if (!mem->dmabuf) {
>  		mem->dmabuf = amdgpu_gem_prime_export(&mem->bo->tbo.base,
>  			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
>  				DRM_RDWR : 0);
>  		if (IS_ERR(mem->dmabuf)) {
> +			ret = PTR_ERR(mem->dmabuf);
>  			mem->dmabuf = NULL;
> -			return PTR_ERR(mem->dmabuf);
> +			return ret;
>  		}
>  	}
>  
