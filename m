Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105A3612CD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 21:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0326EAC2;
	Thu, 15 Apr 2021 19:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CF66E112
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 19:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcoSTYk6XtSTzjRpMvyrBFVnrnQ5X1EIEIGms21MuIjCUkijn4glj7rDW9BxgPyLbI82xW2Mgx4FQhP8TFPJMDrpkHxa1/+S3BvOi39Y1g9TWYrPGgLZ93ZrZx1WEm3aquqeWn/csjzmKbfb4qr91Ow2L+jWDZCi7qJLCh3f1K2BOSo1gTluRHT3+Lq4gZ9oJ9cv+FbsSAnjYs3E30azwSQwY0EiWsmRUUIQwgaiyIKFlGXdE4oN4wy3rkLQu7NK+EeED06NuayScPBqrpjli0gYISYdHJR3w6bI3bz0ec79FT19oXQsZtFf5aD+VhqhaMNx/4rm4UYljevTicHPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpHdwGGeMPrUyBNr9jYc4Ea3f8wCr0j6a1NHATDO6+w=;
 b=Qv8EA8Dj1U9Gunjr9ezJ+3xaijxkerdfdae15TwGZpw54bGf2avj2G13/nkUQrfZ0lgSys6LslMzP/LwKyLg6tgUYEpTR4YMU4zPp1kIthg0A+GzE/nMxniVaBnzpZ/MGF5XwN4TAD1PS8z7xW2iuiwbWdm4zTNskE6W8y5pTkvmapsM6C+BSGtLtpvB58YJB/dMPhIUvtH/tpuid8K5iQSm27WJW8u131VG5W73oIyTEKzTsCyQRw8+An+vvtZwKieoqoxZoKU44eLwxnlyi1d/ppJmA3yrbft4OaCqKD5tDk3wZVkq5/QBVnN9zWYc/ZzRGYWuDuG5n4z4IhkbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpHdwGGeMPrUyBNr9jYc4Ea3f8wCr0j6a1NHATDO6+w=;
 b=1XJyxN54GKq8qIElanpkN19DZC6qAf6X7NAH+wiymGktB2XZOfxq7yjp2QK0dFJLhftfWS1gUkWyt4ngkKk61lz0nhGvEfjwJJsDvTM0fY2SbHGiBexWATHRqRyHVCc2Q0zcrAsHmR6gkcjt30GAVA4wLsEMEjnZfz8xFuJn0Ds=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6590.namprd05.prod.outlook.com (2603:10b6:208:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.9; Thu, 15 Apr
 2021 19:14:42 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 19:14:42 +0000
Subject: Re: [PATCH 1/4] drm/vmwgfx: Make console emulation depend on
 DRM_FBDEV_EMULATION
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210415110040.23525-1-tzimmermann@suse.de>
 <20210415110040.23525-2-tzimmermann@suse.de>
 <af143092-edd3-91eb-025d-836de1e4a104@vmware.com>
 <CAKMK7uGVuw_ViUL3do=VD6o1Xj-6Wd3a4uuF=yTc5oDhtu77Jg@mail.gmail.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <0144bd91-0a40-e201-0ec8-d1d87a297433@vmware.com>
Date: Thu, 15 Apr 2021 15:14:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAKMK7uGVuw_ViUL3do=VD6o1Xj-6Wd3a4uuF=yTc5oDhtu77Jg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: BL1PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::13) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BL1PR13CA0158.namprd13.prod.outlook.com (2603:10b6:208:2bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.8 via Frontend
 Transport; Thu, 15 Apr 2021 19:14:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7be9f7f-3a93-4c8f-8576-08d90042b90a
X-MS-TrafficTypeDiagnostic: MN2PR05MB6590:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB65906B9FE22F37F4690A7A69CE4D9@MN2PR05MB6590.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KwC+lpkbvvnf4aD5yPNfg8iANdw9EpicvRmxOzbNrnHiAhMc3Q8amDSG4C3BrN9tTfuhRhYVZDli3EKeZtFAR/7foLOglm3tkIh2n49VXoGv715JRE67pM/Hw9pDpJQdweo7wM6XLzZDsaA7H5PnHGVuPosDvTt+HOP2RFxv3ZuPtVLEgSR0xAq+H+L4UwOpxH33S3jQBwAQ3HM+8BEDoDhgE7tMZYF7G+mysUz0SU3TgDIRDadum+CpFIe06vV4MzfYvYLiOe2HiPrQkczyt9m9V76lXBctH/5s8WV04fw1PXNCgzzVGF47tC09di8UMFzAxS6sM9RnKo+mKz3HPYF/o713dg1NmPq0ATvyLn4kAAE62xha2zHPlkxffp2rURbKRe3OHkMxyXHT3J92grkST8H6UrdHpv44AKWnpHYzb4G1JdlojZhIv5W74s5I9j8dClBqAXkjLuauqfWbPS93AmqtX/xbY+uKdkGqG1rGqgevsP8jz8gtQzlXY8odf9DhN0jjhlxqfwdN5eb/QI/D74A3AKggeslLuC8Y5+menZ8J7kAZKwVoCTHf1S/2EI57fUIAnFPnrulZ5r6PqYLqggiW/AOD30JaDWSNtCZ40CHpi4fPfWtJUAyjezhjBMw6aNlK+buOhySNcOtkIhq0E6pjyZ9uGn9AHn1mqk2o7PN+S/Y24CT0nA9Wpgpv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(66946007)(66556008)(66476007)(478600001)(53546011)(2906002)(31686004)(8936002)(36756003)(6916009)(956004)(5660300002)(16576012)(38100700002)(7416002)(8676002)(4326008)(54906003)(86362001)(2616005)(16526019)(186003)(26005)(83380400001)(31696002)(6486002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZVRmb2lpS0NnVmJrYk15cEFOdzVQMTVhbVJQV1MrVnZEZUxlalJ1TnZPWGNh?=
 =?utf-8?B?R2M0QUZWRE44MkVHS3hEMEZYeXdxLy9rRXAwbSswZ2diclAwdy9GaWR4dXRF?=
 =?utf-8?B?THRGQ3Zhd3Q3eWN1MnhjVjB0RVEwakgzeUV0Smx0TEZid2dsR3ZyMXM0ZUlS?=
 =?utf-8?B?UnhaMHVoZmNFL1I4QXMvci9qWUJ2U2dXOTViblR0U0loaVY1LzZvQzBDTEx0?=
 =?utf-8?B?ZXZKSnRRNGl0aVZDbFBrZk9wQ3BxQVpERlJVTTMybFFJZTRIN3oxUm5FVnY0?=
 =?utf-8?B?MnFnalVhL1VQM1R1Yi8zUUxFdWl5RHNIS2s0VUV4dWlLRkR2TnRBK2I3Ynlm?=
 =?utf-8?B?NzR0OG5FNWhrdE5RSzV0SVVBYldMR3J1SE1oL2dhYm1RSklLbkdQVjZrcjNY?=
 =?utf-8?B?UVM5UE1DUzRYb2k0SVMzK0swcDhycVA3YUl5aTFRa2l0QWljVTNUeEZBVWRW?=
 =?utf-8?B?dXFXbVQ3dm1TaHdlVGZ2SU4vVEtVWEhMaG9RMk1OM0JUTEY5dFRuSkJUMUs4?=
 =?utf-8?B?allZOERZOEQwaFp2Znl4VDRBWTRrVzlDcEpzdEhUNXlxbFB3dnhvbHdWN0xy?=
 =?utf-8?B?bnlwZkdhMmtyNGhCbWtsN0tyZW5YRER2clhybTZKSXNGYnd6UzNmSzJlazhx?=
 =?utf-8?B?MlprSnJXeDJsOGFGeHdJZlhOT3lWUjk2NFBSbHlHaGo3NDdVbkxuZFhXVW1C?=
 =?utf-8?B?ZUxqVGpjQXp0MEU5elFYZ2dzUUpXSTNXTG1pMTVDZytLenZvWUluZmt3OVRN?=
 =?utf-8?B?UkV6Ni9GZzRyVmVjS1RvZVZQSUJkQ2FuT1Q3TDB3ZzhHRitSWUdQc0hPeEFo?=
 =?utf-8?B?SFBjbUM2UE1XSzJmKzhNY204YUwwcXNyV2g1QVYvMXBYTUl2SVBJQUh5S1RX?=
 =?utf-8?B?ZnA3amRaSHlYWkxJL2YzSFFQdVlxMzZkTDNOcDZFN1F2WWNqdkdzVzBXVGFX?=
 =?utf-8?B?UVdEN1JVWkpiQTdFaTVUdGtQeEhCZ0lhU213SzlWM3lxOEI5REdzRXNCVFdJ?=
 =?utf-8?B?M1ZxYjRGSEhWR0tGRGhCbGFZcEtLNjlocGozSE11SEJqSDVZc0lrWk8wKzhw?=
 =?utf-8?B?cUl4Zk5iajFsa0RJN0VVUktnTzludGhWUVVCaUxOczEyd1hVU1JnZlhXNzVl?=
 =?utf-8?B?WFJuYjNtUkhJMnVLeGNybnNZSDJiTUpUYlJvRDN2bUtmcndVTnRTYUVDUjV6?=
 =?utf-8?B?MkhHOTkySE1PUmxybERpZjBINzM3Mk50eEJPdGlLd2Ftei9ndDBMVFdmeDFF?=
 =?utf-8?B?SGk4aWYxeW9BVGI1dWRIQldWSGpaaUFBZWxHSXdFN0FtcTFEZjh0UkdxcHB5?=
 =?utf-8?B?R0dESnFuYjlCSWNyQ0h1TW1Jc0lTbmZoeTZ4dkM3SGU4UXI3UFZ4cGJ4dWI1?=
 =?utf-8?B?THE1Um9nS2NhTG9Fc0FsRVNBRkJNRGhMcUl3azdwTFBLSmlZRmJqZGl1dUwr?=
 =?utf-8?B?OTQzcHhUTGhQeTZuVTdLdDM4TEFWTDhaSi9BVmxYcUFJOUlKNWNwNWRnMVNs?=
 =?utf-8?B?cEhPdHVQakVHWnlGWW10Y2RnM0t3c2dxUUFqUlN6OU10OE5wWk9ER2FmWEI2?=
 =?utf-8?B?NkszNXJPTjlvK1E4MzBHVWpDcEpvKzJjZlRQeE5teWVDbXkrNnZpaW8xTldr?=
 =?utf-8?B?UkF0NW5QZFhMcDJqVGF3YXdZT1RuMXYwanVzcFZLWGMyS2ppRS93QTBYeGt1?=
 =?utf-8?B?M09icGlkeEdqWkZleTdEcFVFbnZzZUZoOURPbmc3UGxuM1cwQ250aThzMzVz?=
 =?utf-8?Q?X8B1A0h9U+0RzM5wgJD2CqTHzghdHwf5rt9mVpy?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7be9f7f-3a93-4c8f-8576-08d90042b90a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 19:14:42.4610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FlcXKe/MuxVDxXyeE++8gED8psUjivmmYmpFcy5QykLRNN8/D/PMZhW5QTC3KRqLP1Roim4h/baDlHNwFjBSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6590
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
Cc: Marek Vasut <marex@denx.de>, Sascha Hauer <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Roland Scheidegger <sroland@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/15/21 2:49 PM, Daniel Vetter wrote:
> On Thu, Apr 15, 2021 at 8:21 PM Zack Rusin <zackr@vmware.com> wrote:
>>
>> On 4/15/21 7:00 AM, Thomas Zimmermann wrote:
>>> Respect DRM's kconfig setting for fbdev console emulation. If enabled,
>>> it will select all required config options. So remove them from vmwgfx's
>>> Kconfig file.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>    drivers/gpu/drm/vmwgfx/Kconfig      |  7 +------
>>>    drivers/gpu/drm/vmwgfx/Makefile     |  4 +++-
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 19 +++++++++++++++++++
>>>    3 files changed, 23 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
>>> index 15acdf2a7c0f..b3a34196935b 100644
>>> --- a/drivers/gpu/drm/vmwgfx/Kconfig
>>> +++ b/drivers/gpu/drm/vmwgfx/Kconfig
>>> @@ -2,12 +2,7 @@
>>>    config DRM_VMWGFX
>>>        tristate "DRM driver for VMware Virtual GPU"
>>>        depends on DRM && PCI && X86 && MMU
>>> -     select FB_DEFERRED_IO
>>> -     select FB_CFB_FILLRECT
>>> -     select FB_CFB_COPYAREA
>>> -     select FB_CFB_IMAGEBLIT
>>>        select DRM_TTM
>>> -     select FB
>>>        select MAPPING_DIRTY_HELPERS
>>>        # Only needed for the transitional use of drm_crtc_init - can be removed
>>>        # again once vmwgfx sets up the primary plane itself.
>>> @@ -20,7 +15,7 @@ config DRM_VMWGFX
>>>          The compiled module will be called "vmwgfx.ko".
>>>
>>>    config DRM_VMWGFX_FBCON
>>> -     depends on DRM_VMWGFX && FB
>>> +     depends on DRM_VMWGFX && DRM_FBDEV_EMULATION
>>>        bool "Enable framebuffer console under vmwgfx by default"
>>>        help
>>>           Choose this option if you are shipping a new vmwgfx
>>> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
>>> index 8c02fa5852e7..9f5743013cbb 100644
>>> --- a/drivers/gpu/drm/vmwgfx/Makefile
>>> +++ b/drivers/gpu/drm/vmwgfx/Makefile
>>> @@ -1,6 +1,6 @@
>>>    # SPDX-License-Identifier: GPL-2.0
>>>    vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
>>> -         vmwgfx_fb.o vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
>>> +         vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
>>>            vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
>>>            vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
>>>            vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
>>> @@ -11,5 +11,7 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
>>>            vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
>>>            ttm_object.o ttm_lock.o ttm_memory.o
>>>
>>> +vmwgfx-$(CONFIG_DRM_FBDEV_EMULATION) += vmwgfx_fb.o
>>>    vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) += vmwgfx_thp.o
>>> +
>>>    obj-$(CONFIG_DRM_VMWGFX) := vmwgfx.o
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>>> index 7e6518709e14..e7836da190c4 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>>> @@ -1116,10 +1116,29 @@ extern void vmw_generic_waiter_remove(struct vmw_private *dev_priv,
>>>     * Kernel framebuffer - vmwgfx_fb.c
>>>     */
>>>
>>> +#ifdef CONFIG_DRM_FBDEV_EMULATION
>>>    int vmw_fb_init(struct vmw_private *vmw_priv);
>>>    int vmw_fb_close(struct vmw_private *dev_priv);
>>>    int vmw_fb_off(struct vmw_private *vmw_priv);
>>>    int vmw_fb_on(struct vmw_private *vmw_priv);
>>> +#else
>>> +static inline int vmw_fb_init(struct vmw_private *vmw_priv)
>>> +{
>>> +     return 0;
>>> +}
>>> +static inline int vmw_fb_close(struct vmw_private *dev_priv)
>>> +{
>>> +     return 0;
>>> +}
>>> +static inline int vmw_fb_off(struct vmw_private *vmw_priv)
>>> +{
>>> +     return 0;
>>> +}
>>> +static inline int vmw_fb_on(struct vmw_private *vmw_priv)
>>> +{
>>> +     return 0;
>>> +}
>>> +#endif
>>>
>>>    /**
>>>     * Kernel modesetting - vmwgfx_kms.c
>>>
>>
>> This changes the behavior a bit, I guess DRM_VMWGFX (or at least DRM_VMWGFX_FBCON) would need to select DRM_FBDEV_EMULATION to preserve the old behavior, but that's largely due to the fact that given how those options were setup we never run without FB set. In general it should be ok and looks more reasonable than the current setup. I'll try it out on Monday just in case, but for now:
> 
> The issue is that select in Kconfig is pretty annoying (hard to
> disable, and it's not recursive), so there's a bit a push to retire
> it. Especially for user-facing config knobs like whether you want
> fbdev emulation or not. Hence the change.

Yes, I understand the change. It makes sense. I'm just saying that given how hard it was to even build vmwgfx without FB, it's likely it's never been used/tested in this configuration so it might be broken without FB config set. But like I said, it should be fine (it's basically only if we had some generic init code for the rest of the codebase tied to fb initialization).

z
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
