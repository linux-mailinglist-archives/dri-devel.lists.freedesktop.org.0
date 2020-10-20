Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4FD293725
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 10:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEAC6E030;
	Tue, 20 Oct 2020 08:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43206E030
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 08:51:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mW19nudGz+jXnrbV0zlVzR5rvZDMFvPU3nfrXcHjpgjcHld6IrEj33zH8dg+zgpO0eFwM5hA7XSLWC6jVrOwXBqpMl5U6zbSNi9sVzzg54ooIlIJU+nDl2IjFtfXKTdqTXmE7xl9B6PfT5/GWrxEPQfEcCGFA30qHx9Et6YZvCrQI9nFvXOc1F08Fe9Nr+rqGgp6BZh46SzrCsYXZob4e1Z9cguPXxx30854Eultqb+nCbPqbg/PeMLNXvY3N12SUH7a05iwPJmsvTedjlmbDWjWzv5C5iAD6/C5AtLXG/F9n6SRtB6JAdRQACAPhjsvWH1D6ec/gyLaXF90cWZoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/7EsNueI3sGceu0MX9u3WyS3yGEXWdmkXuxlpOw/84=;
 b=bX3Shz21QHq5D2zhrCsOZlWA1TsgzXmO/GrInKG1e9LsV+o+4U/0W9xvo7W21erCTOgmQW/CDobFyUGT/Fve2eBcd8/5nK814tqniXyCYx7tJlNxHQWLk8xsGjOqRe+DLQzONqInYcBdIh4iPN3idlJtt+XeCymub1eqOJcSq7DsMLDyWnPEOYEWUEwCX0p13JXCYNG+u3+vBP0J2jnbrMWqsMdHkuVkE6d6Cl4qFT5ZtLLoul+0/JHlgPp+j2XpOBrl8aszgf9v2GQTPCMwWQRFad0xJXxVJcYm0T1dgAnz8qBg5KLwhLLrDV7ENMnwwwY9xFux/VFBVj4XcmAclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/7EsNueI3sGceu0MX9u3WyS3yGEXWdmkXuxlpOw/84=;
 b=v+muR1d+wy9c6H0Ve0y0G3d4bnbItu80DQfyWYd2eab0f5O6BvUFw6Td/jtoaT3vsrlUUKltnEsfI/AIjZOA+caQ1UXkL++DiAoljy9jlQXcFlUIbpyu26R2hjCBJGum6zx08AxaMmm958G7A5HFYEEDKBos2P6jsO1SqrK2o00=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4658.namprd12.prod.outlook.com (2603:10b6:207:32::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Tue, 20 Oct
 2020 08:51:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 08:51:16 +0000
Subject: Re: [PATCH 2/5] drm/ttm: fix memcpy move bo size comparison
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201019222257.1684769-1-airlied@gmail.com>
 <20201019222257.1684769-3-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <11b9aba7-73bb-affa-c4d0-cb3fdfc9153f@amd.com>
Date: Tue, 20 Oct 2020 10:51:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201019222257.1684769-3-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 08:51:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: caf14e97-72c8-46a6-8818-08d874d54e5f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4658:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4658596BB759BCA8C7CB34CC831F0@BL0PR12MB4658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LRRkOTnZCdTChs0nK2mgbq8Quy91s53PN+uHEPVA3ou/lhR+TCww1wZAuaCFOW83zS70JMSVe0l9AOo4juwa52OM4rsjkvjbFVluQ4Cp2I9Wf7QlME+BKgILwuqgRWE++bN8+VMxQFUeSm7gGUd7oQG8dKfagsY/0nN7gd8s7Em4pY5KTe/9dCIApAl//g8xvdgcQBGdpIM/dQB76u48sNDQ8cXeK4zkzw//iB1QIymyXh1eK+pVlAp9+zYhBVNYU14tMA3+hxVV9infcP+G4nWz4hzF1cJuUl8bzgpKueYKYqwQkdCKp9ZT93pKvWk3isc5a55C0Z4XjDZGsF00f2+k2aIOYU96+fS4a9UEMMM2HaLPjiHKSzUasafChGwn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(2906002)(8676002)(4744005)(8936002)(31686004)(478600001)(52116002)(5660300002)(16526019)(6486002)(31696002)(86362001)(316002)(2616005)(66556008)(66476007)(36756003)(66946007)(186003)(83380400001)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: x80mHRNqPac2X8bRElrPDkJzY5tNGWvR7waXM8TcLb4CZVjv0yQwKQyy6Ucx5SrCOjxJX8VunztN/Em4ABbzlvnuGbXJnoLdrZYiCiZNqZZh0ZHzF5wupHzTMb2rEW6T1raWNct9m8zkkB/7M80t5sMRJ+jycnQw60bQVYYoumH5/ww3r/IBBBEgt58WPo38CvAxPsrgsglnfeMjnA5lw3ZYhF4RBEnCsuOc6Iu8xYe1d+ezXzPZiSou6GaxwzB6EXpHGU3hdS8guwTEO1ZbpsGA3Qa+xEnrOQo2MPSE4NZ+gxWkfM9X/EahuZvYnUieeMMrVC4kEntpk8OmCAmy71HC8zzU09uOpk97kUKr7pbTjtSNzQUQ9wfr8ZpfSRr09g4Pw6p6PM0FlvHg03L4+QizI6A7JLv6akeol3bxRvzsNkp0eeHlxlL2bYTGFV62MOYyIyy1sHBvXQPauEplmXju1j7ofLC6UF1lP5GdyKbd76BXlJzGUNNf3ZKYsBMqUq7zcgN8FIGlFHrZH1t0RxZy/4kh2Z5gkhkvYkhmxKNqO5g3KSFRahEcOrtCY6F3hYyboIUtckuWjvSLA4HjJdpcDXDYmkHe1Ff8gyLWPRQL0MpK1rvtE5sgk95bQlAIAwt1srZs9Qs7wvs5dnmBI7VI5EAiGj8aeXmpYawl34EKHp7LRYkT4LP8MaS66OFOAVxAGfIlc6YNjR4toIlvqw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf14e97-72c8-46a6-8818-08d874d54e5f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 08:51:16.7723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dN67FeWnWbDoYP9IAURN3vEfhAKm+YDPyOLAOUjQGJFBE7qAGFTl+KC+hANPStb0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4658
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

You can just nuke the whole handling.

As far as I can see ttm_bo_move_memcpy() is never used with overlapping 
memory objects because those are illegal in TTM for other reasons.

Christian.

Am 20.10.20 um 00:22 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> start is in page units, so compare with pages.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 558e78ad82aa..b31be57884ba 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -268,7 +268,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   	dir = 1;
>   
>   	if ((old_mem->mem_type == new_mem->mem_type) &&
> -	    (new_mem->start < old_mem->start + old_mem->size)) {
> +	    (new_mem->start < old_mem->start + old_mem->num_pages)) {
>   		dir = -1;
>   		add = new_mem->num_pages - 1;
>   	}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
