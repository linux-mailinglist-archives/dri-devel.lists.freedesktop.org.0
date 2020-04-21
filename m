Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73EC1B24F9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 13:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BFD6E918;
	Tue, 21 Apr 2020 11:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437DE6E915;
 Tue, 21 Apr 2020 11:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ML7tO0PVofd6IohyidasbE+14yBh50DhDsUB/XMchXiOqqbZKHXmvxPfkridfUPd0EDsDiY06jd43ZN5tA9NMrKGSdQCBnKCValiIEdNoUIeKnvVMiPHMGmHqrzO2a8umC2XgJIXca06VuiUbWOrSnGC1LLg4WD2nLv+YQlpEmau3R+Qc4nxBwmWOoMUI0u4/vHpPTYX8BaO0hhge+wKXckd5qOvdpFECKiCgU7vM6iDPS/rU4CyJrR5Tnb+3bNsRvGA2M2zyaAebGw2aR8t62AgAeGkp9xhKS/RvO7bcc2gpyzfQuN7KDL0cDNwXbuxCIon+g8vMCdEKI8IsjPizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs6AICS8p1PCY63kBZimaiO9wK+KBoeM4cctno0bHzU=;
 b=Idl3GhaqvdI+V4z215OpoIrfUw/Y62QS2kU26yw/AaL+rCZMTeF4RFPqJn9at5Rcd2dTTFznro9mwAOBYjwV9zxvlPh9FBAp1prvq2vDm7RCXBeXv85PEpjH4c6PG+/7x0SxxaD4K8w8keiRFLCGEj8kwmQ4HaI+l1kuNSzzj+vndQM+GCPZkt8SK3AlBVohD1iLEsWZcDvRj9acRhL8vDlIoi+2wRP/MWZNjftX5y+vXlUWWlrLuXjoEfffcgVNc4MQFA1h3HYa5KYgQhBbTnJCsoi4ayl4eulNYnab5t9tYf090Y6njRgbxdC5riAq0PU5r3GEtK7RJcIiqyYhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs6AICS8p1PCY63kBZimaiO9wK+KBoeM4cctno0bHzU=;
 b=tMjqIakoqp29HV31WEJVAq+UdfnwRpWlzwY8OfjsmpRJG5LcmS0M2p8FK/JZyKKBL/MMF/lyTKFjfeBkVX/cPhiEc0B9v5hDuKmb4elkB5/wpoux7f3KT8XyrnihLN+7VSTOHLq0oUXXHaKt62Sd89Gz+oIY2gy44w3kitZGNrk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 11:22:55 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 11:22:55 +0000
Subject: Re: [PATCH] amdgpu: fixes memleak issue when init failed
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Tom St Denis <tom.stdenis@amd.com>, Ori Messinger <Ori.Messinger@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200421111715.1231-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <738537e5-9a1a-25c8-3dd0-b1f5fd045979@amd.com>
Date: Tue, 21 Apr 2020 13:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200421111715.1231-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0147.eurprd05.prod.outlook.com
 (2603:10a6:207:3::25) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0147.eurprd05.prod.outlook.com (2603:10a6:207:3::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 11:22:52 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6d5d009-78b7-4700-2d5b-08d7e5e65657
X-MS-TrafficTypeDiagnostic: DM6PR12MB4092:|DM6PR12MB4092:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB40926CB0AC40952B26684D7383D50@DM6PR12MB4092.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(8676002)(86362001)(110136005)(81156014)(186003)(6486002)(16526019)(8936002)(316002)(36756003)(31686004)(31696002)(478600001)(2906002)(66946007)(4326008)(66556008)(66476007)(52116002)(6666004)(2616005)(5660300002)(921003);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ro6dKssc6Xoll+rIkVijxGtN9aoaqHLwhva4GPMtJVtkDVKoidvwkF5WEvv9Mm9fkliEi8YY3AgYDQ6CMb4+jVQOaXnhH0WdDFIhWeFoJJSXBVO6ZZx9ABP3LHVRzc57ewNInPRnAUOv7wbuwRTbCXAjY3UL3rIcMbrrQxmXIOjEjRpP3ZQDkgspm6+XOfFJ9rYql9ZMsBjnDPjWNgMiONCfO4fEMSbDK/1BNV5l03Qo96ihKELL8E3XiKvGp64xcsR2TkVsLI9tFSJifBvL0aU6xL4jvKzUNf6S/DeP7bblOuFv0zm/j8JzQar7kXEqMbDyrtQy/1L28mEJwiaMcu+1a40WE7DPZQH4cnZYNKeDhb2HmUTx/9ou/I3kppUD/MA/yXpMok2hgxbH+OBa7Q/htl2IuTsIPrAehWuWr89zKrlEI7qpRxBeAclcPY60m3G7NA6TfzkqOTycZa2nf4K99mT/ss8YZcC+0jRSJY0=
X-MS-Exchange-AntiSpam-MessageData: CMUz8vPcnBp5m2eXZWij7dBzLD51fL14Get60rJi1vPARrZGT+NNm6L3jbkB4jpJVctQ8r3PbgTJB+7BEK3Ehfb4K1sedD/laAquAf2fDucBJbf8ll3C6oVJ5TzZ96HJURdARUo1H4Dav3jcikcXp/zD3BEOMuyEnD11PvH/yN9dEARPWdWtcXxDujn+aFnCICRluwihcPTmrqNEf5b2Yuxj46NB2l+SBAnRfhuTl0kYbIb51vRWI5mBV3qqzUnTnMyIRIOyGC4sHGKV5aV2SNB+4LPjEoexMSi11HwzbluF1bCdpWZ+jLmhX/bzOJl/GBCBgxGnmOWOujXGzLQ0AwBhruuzvMNWSX/pDUwUSjKlw4/nxzN9KbehZc7Og4F4T+T8K/m0RoEdn2v6SFb2JJdjUuhXi2qhPR2Bk3zkzWhWhac+1eQq9Q4PBCFcOJHcii4A9OzNIGqmaWBpaSPu7/4g7cK3lbIfP8JIeD0xFvBIDrLJteHsJoAfgBunyakALES7iHuFPvFqhD+WM6FW+M4m9a9Jw6ESBU1KYXX/Zthf8jX9xb6vXLzhFsH/lQCn4poWlD6pQ9dPIy7Mfl8m/3pBSvTXgIHOwvtW484DwORL3YyHtGU2sadq2swlRhp4kBiohHcfLotqCDn1JVAcCzjmKs5PVGj8ej8dQ3AQwazAN2AVRQeeBv/x7Cj8h6Zek0SXE7yVLPun7ULkILoGCY7wPN25eTcF/p7+mV1sa7Y/OJGOooNI0AUnvXd1A0r0wvxV36vScbaCy1TXdYV5lt+Nb10XXWyD3D0KuWHdWzMl7qF/uproCmquImtA2IjWnF00WX68wkijaQZ405gBQxvuFCXOwq/I5Qpuo2f+I1k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d5d009-78b7-4700-2d5b-08d7e5e65657
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 11:22:55.1878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVE1zkraV3suuiuUZ7jYwAx2EiAjOsVzfqIxv82hspcyMcuuZEG7ubo/7g5Zud55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092
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
Cc: opensource.kernel@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.04.20 um 13:17 schrieb Bernard Zhao:
> VRAM manager and DRM MM when init failed, there is no operaction
> to free kzalloc memory & remove device file.
> This will lead to memleak & cause stability issue.

NAK, failure to create sysfs nodes are not critical.

Christian.

>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 24 ++++++++++++++++----
>   1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 82a3299e53c0..4c5fb153e6b4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -175,30 +175,44 @@ static int amdgpu_vram_mgr_init(struct ttm_mem_type_manager *man,
>   	ret = device_create_file(adev->dev, &dev_attr_mem_info_vram_total);
>   	if (ret) {
>   		DRM_ERROR("Failed to create device file mem_info_vram_total\n");
> -		return ret;
> +		goto VRAM_TOTAL_FAIL;
>   	}
>   	ret = device_create_file(adev->dev, &dev_attr_mem_info_vis_vram_total);
>   	if (ret) {
>   		DRM_ERROR("Failed to create device file mem_info_vis_vram_total\n");
> -		return ret;
> +		goto VIS_VRAM_TOTA_FAIL;
>   	}
>   	ret = device_create_file(adev->dev, &dev_attr_mem_info_vram_used);
>   	if (ret) {
>   		DRM_ERROR("Failed to create device file mem_info_vram_used\n");
> -		return ret;
> +		goto VRAM_USED_FAIL;
>   	}
>   	ret = device_create_file(adev->dev, &dev_attr_mem_info_vis_vram_used);
>   	if (ret) {
>   		DRM_ERROR("Failed to create device file mem_info_vis_vram_used\n");
> -		return ret;
> +		goto VIS_VRAM_USED_FAIL;
>   	}
>   	ret = device_create_file(adev->dev, &dev_attr_mem_info_vram_vendor);
>   	if (ret) {
>   		DRM_ERROR("Failed to create device file mem_info_vram_vendor\n");
> -		return ret;
> +		goto VRAM_VERDOR_FAIL;
>   	}
>   
>   	return 0;
> +
> +VRAM_VERDOR_FAIL:
> +	device_remove_file(adev->dev, &dev_attr_mem_info_vis_vram_used);
> +VIS_VRAM_USED_FAIL:
> +	device_remove_file(adev->dev, &dev_attr_mem_info_vram_used);
> +RVAM_USED_FAIL:
> +	device_remove_file(adev->dev, &dev_attr_mem_info_vis_vram_total);
> +VIS_VRAM_TOTA_FAIL:
> +	device_remove_file(adev->dev, &dev_attr_mem_info_vram_total);
> +VRAM_TOTAL_FAIL:
> +	kfree(mgr);
> +	man->priv = NULL;
> +
> +	return ret;
>   }
>   
>   /**

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
