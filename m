Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 216666903B3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A027910E97C;
	Thu,  9 Feb 2023 09:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 479 seconds by postgrey-1.36 at gabe;
 Thu, 09 Feb 2023 09:30:27 UTC
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A896010E97C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:30:27 +0000 (UTC)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 3199AH6t026357
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Feb 2023 17:10:17 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 3199A8ZR026341;
 Thu, 9 Feb 2023 17:10:08 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 9 Feb
 2023 17:22:22 +0800
Message-ID: <65c4af68-3808-4021-ae4f-d0c07c908431@aspeedtech.com>
Date: Thu, 9 Feb 2023 17:22:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] drm/ast: Fix start address computation
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, <dri-devel@lists.freedesktop.org>, 
 <tzimmermann@suse.de>, <airlied@redhat.com>,
 <kuohsiang_chou@aspeedtech.com>
References: <20230209091254.15455-1-jfalempe@redhat.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20230209091254.15455-1-jfalempe@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 3199A8ZR026341
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

Hello,

The offset given to ast_set_start_address_crt1() should be offset in 
vram. It should 0 now as your patch.

I think it is better to correct it in ast_primary_plane_init() and 
ast_cursor_plane_init() as below.

--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -714,7 +714,7 @@ static int ast_primary_plane_init(struct ast_private 
*ast)
         struct ast_plane *ast_primary_plane = &ast->primary_plane;
         struct drm_plane *primary_plane = &ast_primary_plane->base;
         void __iomem *vaddr = ast->vram;
-       u64 offset = ast->vram_base;
+       u64 offset = 0;
         unsigned long cursor_size = roundup(AST_HWC_SIZE + 
AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
         unsigned long size = ast->vram_fb_available - cursor_size;
         int ret;
@@ -972,7 +972,7 @@ static int ast_cursor_plane_init(struct ast_private 
*ast)
                 return -ENOMEM;

         vaddr = ast->vram + ast->vram_fb_available - size;
-       offset = ast->vram_base + ast->vram_fb_available - size;
+       offset = st->vram_fb_available - size;

On 2023/2/9 下午 05:12, Jocelyn Falempe wrote:
> During the driver conversion to shmem, the start address for the
> scanout buffer was set to the base PCI address.
> In most cases it works because only the lower 24bits are used, and
> due to alignment it was almost always 0.
> But on some unlucky hardware, it's not the case, and some unitilized
> memory is displayed on the BMC.
> With shmem, the primary plane is always at offset 0 in GPU memory.
>
> Tested on a sr645 affected by this bug.
>
> Fixes: f2fa5a99ca81 ("drm/ast: Convert ast to SHMEM")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index c7443317c747..54deb29bfeb3 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -681,7 +681,8 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	if (!old_fb || old_fb->pitches[0] != fb->pitches[0])
>   		ast_set_offset_reg(ast, fb);
>   	if (!old_fb) {
> -		ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
> +		/* with shmem, the primary plane is always at offset 0 */
> +		ast_set_start_address_crt1(ast, 0);
>   		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
>   	}
>   }

-- 
Best Regards
Jammy

