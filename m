Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8AB2A59F3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 23:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24746E90D;
	Tue,  3 Nov 2020 22:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7C46E90C;
 Tue,  3 Nov 2020 22:18:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly5FOKLg4umd2zhbCBiZ0tNDOAJsM5STe+gVvXvdr0MI2OegfYug8wyARx/0f/7zQOxod6ayNU0zDXNlDXk9OLmWH3UWB9Pz6c27DzwOr4TP9tubkj/VSR7D0qNvNpyZasFl3d3uIGq+PH8YDkQxXyZe1xaVHCWh4EnMmIu6Ie/IqvqR0WLWcFsuFQ3AAswz3qKn6I9oITHP3Oka6KlC6DLeMIEXynnMyiva5bGYurjnW40nqFJu3EHvDmUVi0IQFhKaRCyDglACXy80opdutDxGiGt8iWasav0ehpDtIsi8+9Ai7YOoT3zkNbge8TZQxfNy+1Os0dl2+mgmSmPVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KoQpjHiJSesvatha777R3L8rqz9wbPwhaMGhEn5TBY=;
 b=lAxWfqmuFZCCu5mg01u3ZHQR/StCoBI4eftmwhbANC7k5MCRMpvVcpkreLSQmCwZpjJykH04FoGqa6q+CfJj1KNB8dPDGe6+JsuEmv3StgJ8DYuRsvAbpQ0Oau+ERPLytX/+UdLLqYTGlIykwi9nbh/8po8eSOEkVGBWBDYGd/FbM9i1EuoCek5HvhgcyGeJ3ud0/Ha2eFeyIH40Xk+WpOCLEij6jqp8VBzbmtsbV5KReM7j6yZWKMgH57XdtUzS2cyR/3MlA8QyHyp5XH3K+p8slCN+YSBzIvL7GnrKxDXfSSl+IozoZIjVk38ue3dtEI3uDiPIEJ5YsFkJmULzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KoQpjHiJSesvatha777R3L8rqz9wbPwhaMGhEn5TBY=;
 b=mJquWZTe9W9tB79DJkqoDBg+jkjEESd3uXWFeJk7raMJ7pDoZag/6NNX1ABkdiLZzQScBDUX/fNNsAhn1+KlN2YUMSq1kZEGV5+J67Ri6iNUgl1mDKdInHMNwXiDye37Nt9CvlTEz9FkiBZG0tf5aeEgBBFq+JeuGN8iDGe1HeA=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB1356.namprd12.prod.outlook.com (2603:10b6:3:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 22:18:45 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067%7]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 22:18:45 +0000
Subject: Re: [PATCH] drm/amdgpu/virt: fix handling of the atomic flag
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20201103215450.815572-1-alexander.deucher@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <4a8ad93c-d090-c3b4-3ca6-bddd7912efe1@amd.com>
Date: Tue, 3 Nov 2020 17:18:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201103215450.815572-1-alexander.deucher@amd.com>
Content-Language: en-GB
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44)
 To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.55.250) by
 YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 22:18:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 189023db-8728-4abf-fa37-08d880466ddf
X-MS-TrafficTypeDiagnostic: DM5PR12MB1356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1356BD67D37686250767840999110@DM5PR12MB1356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MH+twBZjpX+0PUZ6Y5WVzxfMzVMljVtFmP+k0OZoBPMyTD43ZnOmOL7OlFB+64X8UzSCLhJPlWBcPCooGYUHSZzrDOCXbqRWTaEK9nw2fR+EDcUQ/qfOF9rgOHKqT31KsdWuCzpUh501nPRoBB2Rn9o5vGGetiOExCbg5o1JKvLCeKI0MWh/s9R/vliXWaLi3WoNy+89KaFdW3cY+BVIqfUvLQhqyIx1ZT5t4ec5MyyIfPo+/SdDDZI/TfaTxKw9kUSeePgqgIajujNFqJKf6rjVhQe7EWsqCBt3GfOChPVns3EsZk3eI1FMYkN8NSI+j7wal1V1+9nMeEovRI8cKETM19LoV2iKapJ7SHlIFqpZRZzaleI33/tcq3t4qhHY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(2906002)(6512007)(8676002)(5660300002)(4326008)(31696002)(6506007)(86362001)(8936002)(31686004)(53546011)(52116002)(6486002)(478600001)(36756003)(26005)(66556008)(66946007)(83380400001)(66476007)(956004)(186003)(44832011)(2616005)(316002)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Lddgu1U8I9tcPuP2R/tntgQ9s3nzA4x6yVq0t/bTTk5PeYYYPSezuMPXYajdu4JyBex9QzDJqjup4EJ4daHKAtRbgnaB7KeftaTHJbTy+v8Xqe+poaZYjH5GabJHobSzkziGVtHfm+7XzXMnu1COuLHdrns/YKC1k56eV3oE7DPru7uQhVqsMX40BFqfxtqmmSdjxsDZTrSdliXZJW+8pTaiZv7Kknl4s/joKdHRxudWnJTQO91HE5CpkjnE0QwHRCqCJ8ZQeQWzvZIdH0Vg/JKGVqFx+fWbmYbbqnympZpYYWgd1YmgPi3BaU3Gsgja0XHThQOIG2FJkubNZcmPWvKAVBCEL9TzJLZMdrQwaKaNfONa3wT9J4cmS3m9FUzlyxgXM9PmAD0TXd7la5iVrBLzv95t1cd9CuNUFyHUO/LX1rADqAYNRQMwohZiqA7o6ugy3baX74CGCFE6h6/7FGmhhWV7I3lasL9IRVmbpNERsTJOtY8EjdsPkbTQUBIvTaUoPXL9PSps5D2RVhHli6Hf2DvHyHQhwG7lEjmvuxqcb77GiR2MI1HCzUMeNwBUkWUyEehG0apn7YLX7igfkBfa9b6tKIhY0YhF/H1Z9U1DMlyaRSoW0y5doWd8hMx132eHZvvMVpHcPM7QAugjsA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189023db-8728-4abf-fa37-08d880466ddf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 22:18:45.5374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXVjAC9lCsWkMkfvcwd3lub/bX41uSixDT6KM+hbWwXrUzZNVupaYhsLOe2oHVOv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1356
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-03 4:54 p.m., Alex Deucher wrote:
> Use the per device drm driver feature flags rather than the
> global one.  This way we can make the drm driver struct const.
> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Yeah, that's a good change.

Regards,
Luben

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index d0aea5e39531..8aff6ef50f91 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -47,11 +47,13 @@ bool amdgpu_virt_mmio_blocked(struct amdgpu_device *adev)
>  
>  void amdgpu_virt_init_setting(struct amdgpu_device *adev)
>  {
> +	struct drm_device *ddev = adev_to_drm(adev);
> +
>  	/* enable virtual display */
>  	if (adev->mode_info.num_crtc == 0)
>  		adev->mode_info.num_crtc = 1;
>  	adev->enable_virtual_display = true;
> -	adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
> +	ddev->driver_features &= ~DRIVER_ATOMIC;
>  	adev->cg_flags = 0;
>  	adev->pg_flags = 0;
>  }
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
