Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D166BE458
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D00510EE97;
	Fri, 17 Mar 2023 08:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949A310E3D9;
 Fri, 17 Mar 2023 08:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlhLq4RCXre5sHa++Y2yOuIaMJqvjdIWAYXoKXXEs57/4yDRWeFU9wWXqsQTHYNbJXl8LxhlZRwXG82ovkHNcGsaE2ctooMQmiufIzjbdEIAOl68CnmfYzDLi5aHCClKuTnAj/ZhweC8Ory0s03P8D04HUD0LJfJ1Gur9yktZnwLDwjg5JKX1IXo1FRaSraJWqHOYZU5FduZKjuYnEowh6PfGnH6fY50ZxkCRkdkVbC+kw8FNf9p/NVfxtufQ7FgBW71tMyppMiRuNKA0rJyUMnWCdM6MKGTJ9TXy4LxCdA/TxcVqGmxCsPakPXW/7gIm9LeWgf3jHrZESd3muvrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cL/K+izKI9TJBYVTu8onuQc6ifnfm0TuU4lRyEIlUZE=;
 b=dukbVHFWDB20+X90GaemK9VG+uUlGU+7W72gbbQXieTaMk0651P1mrgEODJGVWgNkf8+YoMXz8ngFWLITifxdudmUWjrdgmx6M6Dj2ZZgt/jtzepTF9YKayR3NtuGFjbccBlPRc7tiksv/Hjegn6CeFTOnCXby3vOG2Gtr9LYKydKCmw0996eWGl3EUhESQAZ/DhiFwtFtiXb0gZkDpxuFZ7ydThLQ5lj1CodlSJqgK+rfPWnhfuT1qXN01gulhupMjyxud+zLMAQLK55zl4/IPqK8QNBELKOXf/iu/7JVBKb7IhTjisZ6mGj51QCkk0TCu4+dNKAxYXZj1udALxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cL/K+izKI9TJBYVTu8onuQc6ifnfm0TuU4lRyEIlUZE=;
 b=XnRKIzElXclhojmFjV8Kvg3iPw6zMIdBUS+jjLeaY8oTFad7zbnShxeqOIZTOtoN0ijO+4Zv7dCLcm3qZIs+oimZ/ze4K7hjgoZiY5FcEH3sX8Zr6Cqq5DaRYi3ZgTAYzr4KFWYAdAnlE2dQN87RtYQa2beX4tig0C8h3QUKPlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5502.namprd12.prod.outlook.com (2603:10b6:a03:300::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 08:53:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Fri, 17 Mar 2023
 08:53:27 +0000
Message-ID: <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
Date: Fri, 17 Mar 2023 09:53:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 00/10] drm/radeon: Convert fbdev to DRM client
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
References: <20230316093738.28866-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230316093738.28866-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5502:EE_
X-MS-Office365-Filtering-Correlation-Id: 01dcff2f-7744-4bf4-4827-08db26c51286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iTL2JNtmU9qc+He3JjZYERC7s7Bl08ZZnZvCvV2HXfiPbCI+jSSHRSMe4spCJ+ObAEb3P1cVQZG8pN2VObN3ZIoXLh1ABW+WhDoz0/CJHlpVVW/EYU6z/7f1CvAYU5Qq+nwI81mF6F1HIRz3JiDpWNHMjdz+3XHFtEoyMhcLTm4KvQQAiP3zhzYk/0FA8jGzYLfSicQ+MlGVRps/VR2hfPg0V7nDqrNLmG2QmecgrfVPG6kzsiERFIQWbWp1apE+xfclveOD10pAE8KhXnai3dvM/GG+GwN9+5RgtLKtAVx3tl1qrg7Y/WGrRrbsfe+Y40QnZuLdcmA7rY7a7uLKh+4l14yVd5rdxzdHTHigXjqKxtDaxql6v9dFCulWcVpyzxOsTu4+cJ9S4K9Ics3Lj32nywmDtksSii1lYuex8UkSzZZWaTEDysjAZOxuNZqjVqjU3aS+ZtPCqdifd+PXfQV6k2y9id9UZnRTWevKYKecM0u2JgDh+YHsqOb+RIDon4eZbrII+kdua8anRGgnP3SgxkoAyJ5PFPTgF5RLRZhi7aY4MMJtwYTT0KWzNZ8JEupNMgVvY6PE0rAoG6Iq9YykuQwLb6EqvLImyrs2mZuhnqwQ2UIWoma5LAegsvp9N4cEkcqWAmyiMfid3nsNqD/dEVupD60RAbPFv2bffBTQHpWMNkXdtPEpQH9FWpZrZ8Ecbw+vDz+YGN2Zr3IwO0wNX4i8rGmg7S2nkUvS5zk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199018)(31686004)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(31696002)(86362001)(36756003)(478600001)(8676002)(66946007)(66556008)(4326008)(6486002)(66476007)(83380400001)(316002)(6666004)(186003)(2616005)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXM2di9OYjZDOGtNTlZzVHpMTHpyVVYzWXRWOFY5Zm4vbW5JOVlINkVtUDFz?=
 =?utf-8?B?bEpvZFAyL0R3Nk9rK0lpTi9Xd2JObWVsV2Y5RzdjZmplWTY3WUM5M3lrYXp3?=
 =?utf-8?B?VmZqZFZDOW1aZDJzamNtYUpBT1l6L3Y5T2VRenkyeUg2aE5IbUdQV2VnRmxV?=
 =?utf-8?B?dlR6NkZXSFY5MVdjeTRNbnJpWUJUMDNqQU42ZDBURy9jYS9DcHJtbENVazhm?=
 =?utf-8?B?WGlvdys2L0o0K1lmMWJ5b3VjU0NmdG83MTdERWxEdmRaV2pJWGNFendzK3ZH?=
 =?utf-8?B?TjJVNjNndkgxTEN0MkFFVm50NzdNSVdsNllqOFpzRXIzUVc0M2lIR2RlSFBB?=
 =?utf-8?B?Y2JGYTlCQXpkaTMrZnJHclZkbEdYcDAzd2svUDI0UkI5NE9kQmpmNDRBQTN6?=
 =?utf-8?B?elloampROHFIbExJNmh0ekdUay9jQUc3U2ZRK0ZGYythNURmWGZiMkh6dDFr?=
 =?utf-8?B?UHRmTlRmL3BOWXE0TVR1UUN2RzdXOXZSdXpOT2lNdnR5UFE2TTIzK3pNMWlG?=
 =?utf-8?B?cnA3Sm1YdGdQbE5ZcnBSSi96WmhEc0xsdDAveVlGclQ0N1c3VU16ejFmYjIy?=
 =?utf-8?B?dXgrK1ZWTGt4bEIyVjVNT1kvNHlIcThHaVVZOVVLYWxDRmIvbEZXYkxnbUUz?=
 =?utf-8?B?aGp3UmQvYUdhWnZHbEhIM3dtWEFRM3puSFdIdXJJUDk4V215Y3RkSC9Ya3Zw?=
 =?utf-8?B?Mkp4NVdOK2I5Y1JHTGd3emhnTDIvclNlWHlwcDlRL211aHV3UGJ3YVIvWWVU?=
 =?utf-8?B?VURYdWc5ZmxGV01LMzBGQ0pDbExJUHdoMUgzTTY2Y3d5TDJ1MFpySUE4ZU5O?=
 =?utf-8?B?QWdWSkRKb0RFVTB4OU0rUWJDY2VxSGxPajdyWmZYOG14RzE0WlVqQmEyeHJo?=
 =?utf-8?B?VjNFT2JwS0RqeDM2M2I3bU1uK29sMlltd1dmeVl0bUg3dGFNN0lpLzJPTHl5?=
 =?utf-8?B?b2FRaWQvS2hHcEtPVFhUcnpCa1N6N0t3ZW42QkVlTjUxMmY1QkZhYllneVFJ?=
 =?utf-8?B?clZJQzJQVnRVenp2QnBhZE94a1JwanZKNm53QUNnZkJpdlV0SXI5OEFXQkM1?=
 =?utf-8?B?M2duczNuNmNOYXo4WkxVbGU5YWNJaE94KzkxNVd6czkraGdpU3MzUGk5cVhW?=
 =?utf-8?B?SUJKd3h6a1czeTFnaUczQnB4STBIS2VleDFxTWwrMkZ6TUxPMENmQU9OSzh5?=
 =?utf-8?B?Y0F6bDVkZ0k4enVydm81UHI5SUNOZFcwYTJFWVFNVU5HbEdQcUVtZlhXTnk2?=
 =?utf-8?B?TGVDNU82ZUVSY3dUYzljVFd5dVp2QTVTclFJZzF5QmdpUWpweW4vdTFzTmtw?=
 =?utf-8?B?MlltRXIraEtJUGJoR3hhMEJhbFFWeGtvNWdPbjJ4WU5LdVM5WEF2eUtsM21R?=
 =?utf-8?B?RW0zditTeDdLeE5GSUlqNkxmZmM1V2Y2SEF3Q2s0VzIrTEZYdThnZDk0Y3VN?=
 =?utf-8?B?MmJPSzBITE1VdmtXL3oyRE0wWWQvSEZaSmxrSWExZlNZaFJKV1lwNkJBQ2Jx?=
 =?utf-8?B?ekZCZ3o0WUd5UDZYdFhzSUJXbHdxandOQUtPVmNQR1U2bVphR0NKRzhraFF6?=
 =?utf-8?B?cEhHWnhJT21OM1B6L3pDa3owZVN1MXBlNURCQU5PSXNTNlI2NkZQTE5LS0Iz?=
 =?utf-8?B?K3F2R0RYSjlLbjM0a0prR0IweTZOZEJCMzVFejBXN2lZTjdCSXAxYnNDWVc4?=
 =?utf-8?B?NmV0VXF1ZmpxNGVNdUhjc09qR3VOYXFvdXlYclBnc3JwTUZSRTRIMklVZG5V?=
 =?utf-8?B?VzZZWmxmQ0VlYnh1L3MxcHNBckN4c04zNXpvR09CTXg2eThqV0phOUgxYkpM?=
 =?utf-8?B?UE5oMXFqZFBmdmNNd0lYak1yVmppdm96WlNqMEZlSGFXYjZkK25rMlR4M3pT?=
 =?utf-8?B?aG52ZHVRQktNdTlMazZSb0FCV3pMS1czTkU1VitCS0NzckYzUGlMVGtZMmFa?=
 =?utf-8?B?NFJtdk42VnR0L0Zzd0huWGZNNGMyaGxNaTJsMHJhbjFxcUdGdDVZOVBHakgr?=
 =?utf-8?B?dlNwWkk3MzVZODcrS0E4cGxWcy9mVHllK0pjeVFuU3RPQWg5ZG1HeTgrTjFG?=
 =?utf-8?B?QnZEL2dtWlpFUVBza3VRbnFFVmZwZ0I4MS9aeGhuMkJMSUFEL0VBczc0Z3dN?=
 =?utf-8?B?VkNpMFFpeFRmL1RrVjlhZ0M4dDE5N1diVTd2Y1prZlRwQkxOa3hKaU5lTUxn?=
 =?utf-8?Q?8JVLU0xZnJw4KEAzVV7pECsauim9VEIY0Ic/GWE0ddTS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01dcff2f-7744-4bf4-4827-08db26c51286
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 08:53:26.6135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96CmEGa9hsZIZt2iiM/qpCiCAnwZNGjNccD2hzUuW2nuQduBPTUEZLHtI34hghHk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5502
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.03.23 um 10:37 schrieb Thomas Zimmermann:
> Convert radeon's fbdev code to drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups.
> Only build fbdev support if the config option has been set.

I'm torn apart on that. On the one hand it looks like a really nice 
cleanup on the other hand we don't really want to touch radeon any more.

Alex what do you think? Is that worth the risk of breaking stuff?

Christian.

>
> Thomas Zimmermann (10):
>    drm/radeon: Move radeon_align_pitch() next to dumb-buffer helpers
>    drm/radeon: Improve fbdev object-test helper
>    drm/radeon: Remove struct radeon_fbdev
>    drm/radeon: Remove test for !screen_base in fbdev probing
>    drm/radeon: Move fbdev object helpers before struct fb_ops et al
>    drm/radeon: Fix coding style in fbdev emulation
>    drm/radeon: Move fbdev cleanup code into fb_destroy callback
>    drm/radeon: Correctly clean up failed display probing
>    drm/radeon: Implement client-based fbdev emulation
>    drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set
>
>   drivers/gpu/drm/radeon/Makefile         |   3 +-
>   drivers/gpu/drm/radeon/radeon.h         |   2 +
>   drivers/gpu/drm/radeon/radeon_display.c |   4 -
>   drivers/gpu/drm/radeon/radeon_drv.c     |   3 +-
>   drivers/gpu/drm/radeon/radeon_drv.h     |   1 -
>   drivers/gpu/drm/radeon/radeon_fb.c      | 400 ----------------------
>   drivers/gpu/drm/radeon/radeon_fbdev.c   | 422 ++++++++++++++++++++++++
>   drivers/gpu/drm/radeon/radeon_gem.c     |  24 ++
>   drivers/gpu/drm/radeon/radeon_kms.c     |  18 -
>   drivers/gpu/drm/radeon/radeon_mode.h    |  20 +-
>   10 files changed, 464 insertions(+), 433 deletions(-)
>   delete mode 100644 drivers/gpu/drm/radeon/radeon_fb.c
>   create mode 100644 drivers/gpu/drm/radeon/radeon_fbdev.c
>
>
> base-commit: ec0708e846b819c8d5b642de42448a87d7526564

