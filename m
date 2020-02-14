Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBFF15D58F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 11:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965986E5B4;
	Fri, 14 Feb 2020 10:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2DC6E5B4;
 Fri, 14 Feb 2020 10:27:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1N/3D3QzyDZIOes4E/HqWMbk2KtTiG//8b17kwCZLNGaD3WMLdGZ9QF+MW1CxBc9w2h30iTElyj91+JWTarcVmxX3FHWgiaYY26kvH5r5X1urmqcX/6ynekox9Hx/Cur8APwE2BbOlChUof8bJ0GcNHB+rD2VFBc324SNg/0kic8RW//FJPRpwjFUGlIpvrGdbAsgRbYAuBTXTZGSwycTUXwxeXmvtgjIXO0/bfRCA2p8zLCFC7gnga2DTaCSyN1/g8bhtTzsWiDWSkqXIv62GIzmBpl8rW8I9+sC1IULmbgbSzDRiSZXUAfiN3OnSCw3XLEfixLgjUlH7BrtrWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxFNBTLKLTgor4eInFNFFo/AQLelWA8ABK9ObrAYW5U=;
 b=Ha+hGwUzCi9ZevwA5VoU/77M0vIhcmCbIf6K0QRmc6A53wlQJy6Uj9RwRiDb6qEevV8ved3ldxj+wgeBdLCWxPkkv2q8ZNapkbK4E4OvJwZceodjnn7oe1atqZyy+peEshCKplFcf0+39406thp3mktVkMziSytW/JSBub/Yw9Pq/AmdIAh2SIh7T9SaWAFBtIH8udR+dzsicun84Yni4dZrjJMCRHiSxFOu4CEV5M0aaaLkMZA/+Jt4l3rHI73tPbYKp+5maiTZhdyrgUxvb0XN0Ivouwb6CE90xypwuLMKF5ElPP061f6X86XHUetKXU8CwcUY3ayC6GqjFk3Vpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxFNBTLKLTgor4eInFNFFo/AQLelWA8ABK9ObrAYW5U=;
 b=ur588JfHc8mxDW08lYbEnkx1vW0okPpcuach50YvDc+v1qzp1WuRzJypH2T70UVwJX+uu0ZDx7yuTsSOIaZvLNVXNHbK8jPdC0vGRNMRw6VmiKCOx7SJwBVKLfYEYGmVaGBGmRC3TnGuQwgpV9Zkf4SIDFj9WM71sTdWifHDyuY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1642.namprd12.prod.outlook.com (10.172.35.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.27; Fri, 14 Feb 2020 10:26:59 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3%6]) with mapi id 15.20.2729.024; Fri, 14 Feb 2020
 10:26:59 +0000
Subject: Re: [RFC PATCH 0/6] do not store GPU address in TTM
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <f536d419-9fe3-97c0-0abd-2fb5b26c891a@suse.de>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <17166df4-fedc-17a2-ff74-4c9fcaef6517@amd.com>
Date: Fri, 14 Feb 2020 11:29:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <f536d419-9fe3-97c0-0abd-2fb5b26c891a@suse.de>
Content-Language: en-US
X-ClientProxiedBy: ZRAP278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::19) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
Received: from [IPv6:2003:c5:8f2a:a600:4a84:7cc6:5ea4:121a]
 (2003:c5:8f2a:a600:4a84:7cc6:5ea4:121a) by
 ZRAP278CA0009.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23 via Frontend Transport; Fri, 14 Feb 2020 10:26:56 +0000
X-Originating-IP: [2003:c5:8f2a:a600:4a84:7cc6:5ea4:121a]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34ed20f1-6fc4-42ad-bd4f-08d7b1386c7a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1642:|DM5PR12MB1642:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1642956551B0FEDB37A5C86C8B150@DM5PR12MB1642.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-Forefront-PRVS: 03137AC81E
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(189003)(199004)(2616005)(316002)(8676002)(478600001)(52116002)(66556008)(31686004)(110136005)(5660300002)(966005)(66476007)(6486002)(66946007)(7416002)(81166006)(81156014)(2906002)(8936002)(186003)(16526019)(36756003)(4326008)(31696002)(53546011)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1642;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TE8V46q8eWYsyqAOwnIFkxpRoow0W8ZO85GFX4zqg+4pxffTLYOHG+y5C6Jfh0b92Q3TJOT5/SHUMvdGSlL7PCCVk9rPpK/88Po8MAEMz9L3CYmgpDGOmPKjpTrvixS/q5OvV3lEpSGAZqJ01lfcQxTkSi4/hazxOHZsxc1xbiOqZ/+t6bioKrk3QiKGuFrUy3jNw4KDevHc+ynWPQWbY6OYF4d6ojS5mJryqdtMd3Jd3wfD07vCx4gccf6hseJm7kkmO8vorInDp1QY+r+s/lez/nfmbinGn+aZa/DNmUYta3wn27Wgi9+j6KGX5d0YZaaJv7GEdoXzwM9VpJcNX9krDA8oLPf/5tOxXuSXdLgpcb9JY8rJQdwNq3q8kRnkjTcDp0UeE5uIcdHhU1kNKMJHSE1JgPuza1tPpNpucCtiUC5RtURhHOq105mIU3Gs9/08rOdyvV7BpiMiIQpL+mQjFyng+vrYCkfwQu3LnyTRku6D6qFgRoxmY2F/lEE3
X-MS-Exchange-AntiSpam-MessageData: /NFrvZ651psQqjUg0nzYmNTFZgYlpNUc0CUQyR9yzXupjsjpOwp/V7QKQUNDDttZbQ6OzpgLnFQoiw6kuRgK7vp5jzKAPhBRfXg6OK7B4bf/tHkQc/8vn1GXsfl9A/oVenchBBjr/fedF6K0vB5EmV/udquMg52c7l3C485ERvbN1xgYWJYPTz3H5dkeye7ozWErWuZ08Y1QJPEF3ancLg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ed20f1-6fc4-42ad-bd4f-08d7b1386c7a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 10:26:59.4511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWiS6w39gcKUtscBNGhRMX8soP9YRVaocHAld+/r+TDH6c5TgxAbXPhEfSVUCpBaBKPvPMeVylhYddHvAf+NCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1642
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/14/20 10:19 AM, Thomas Zimmermann wrote:
> Hi
>
> Am 13.02.20 um 13:01 schrieb Nirmoy Das:
>> With this patch series I am trying to remove GPU address dependency in
>> TTM and moving GPU address calculation to individual drm drivers.
>> This is required[1] to continue the work started by Brian Welty to create
>> struct drm_mem_region which can be leverage by DRM cgroup controller to manage memory
>> limits.
>>
>>
>> I have only manage to test amdgpu driver as I only have GPU for that.
>> I might be doing something really stupid while calculeting gpu offset for
>> some of the drivers so please be patient and let me know how can I improve
>> that.
>>
>> [1] https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg272238.html
>>
>> Nirmoy Das (6):
>>    drm/amdgpu: move ttm bo->offset to amdgpu_bo
>>    drm/radeon: don't use ttm bo->offset
>>    drm/vmwgfx: don't use ttm bo->offset
>>    drm/nouveau: don't use ttm bo->offset
>>    drm/qxl: don't use ttm bo->offset
>>    drm/ttm: do not keep GPU dependent addresses
> I think VRAM helpers are missing from this patchset. [1] You can use
> bochs in qemu to test them.
Thanks Thomas. I missed that, I will add that into next revision.
>
> Best regards
> Thomas
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_gem_vram_helper.c?h=v5.6-rc1#n217
>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 22 ++++++++++++++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 29 ++++++++++++++++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  4 +--
>>   drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 ++---
>>   drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 ++---
>>   drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 +++---
>>   drivers/gpu/drm/nouveau/nouveau_bo.c        |  1 +
>>   drivers/gpu/drm/nouveau/nouveau_bo.h        |  3 +++
>>   drivers/gpu/drm/nouveau/nouveau_chan.c      |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++----
>>   drivers/gpu/drm/qxl/qxl_drv.h               |  6 ++---
>>   drivers/gpu/drm/qxl/qxl_kms.c               |  3 +++
>>   drivers/gpu/drm/qxl/qxl_object.h            |  5 ----
>>   drivers/gpu/drm/qxl/qxl_ttm.c               |  9 -------
>>   drivers/gpu/drm/radeon/radeon.h             |  1 +
>>   drivers/gpu/drm/radeon/radeon_object.h      | 16 +++++++++++-
>>   drivers/gpu/drm/radeon/radeon_ttm.c         |  4 +--
>>   drivers/gpu/drm/ttm/ttm_bo.c                |  7 -----
>>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  4 +--
>>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c     |  2 +-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c        |  2 +-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  2 --
>>   include/drm/ttm/ttm_bo_api.h                |  2 --
>>   include/drm/ttm/ttm_bo_driver.h             |  1 -
>>   33 files changed, 99 insertions(+), 72 deletions(-)
>>
>> --
>> 2.25.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
