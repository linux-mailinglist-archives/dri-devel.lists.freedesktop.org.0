Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EFE7EE2B0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 15:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C022310E5EF;
	Thu, 16 Nov 2023 14:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DB810E5EF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 14:22:51 +0000 (UTC)
Message-ID: <a2f3621c-219b-4082-9c39-8838dd1f0c55@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700144569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmfexcBsSEDJ0Omte8obGDOdNiMe+FAkJGhXNoStwnM=;
 b=SdicSxWovS9fDY1oO+OPuc1/Aa4kvUTx77GwV6PveAbxpaC3bnPa0Ytj/1FSU5POa3W04J
 qE3nYLAkQXWv3yU+aQzKF3cqAZotYiEgGrZIC7uPOhLF2MKlbWj9Z4BsKQQ61Yjcy1hekR
 hxfVqq8WHI2mlHJ9HajRvSJBs6lIQpk=
Date: Thu, 16 Nov 2023 22:22:41 +0800
MIME-Version: 1.0
Subject: Re: [v2,04/10] drm/ast: Add I/O helpers without ast device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com
References: <20231116100240.22975-5-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231116100240.22975-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/11/16 17:59, Thomas Zimmermann wrote:
> Implement I/O access in helpers that do now use an ast device

now ->not

> instance, but the raw pointer to the I/O memory. We'll later need
> these helpers to detect the device type before allocating the ast
> device instance.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.h | 73 +++++++++++++++++++++++++++--------
>   1 file changed, 56 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 8b5d6e2954858..b82be890d9fce 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -262,55 +262,94 @@ static inline bool __ast_gen_is_eq(struct ast_device *ast, unsigned long gen)
>   #define IS_AST_GEN6(__ast)	__ast_gen_is_eq(__ast, 6)
>   #define IS_AST_GEN7(__ast)	__ast_gen_is_eq(__ast, 7)
>   
> +static inline u8 __ast_read8(const void __iomem *addr, u32 reg)
> +{
> +	return ioread8(addr + reg);
> +}
> +
> +static inline u32 __ast_read32(const void __iomem *addr, u32 reg)
> +{
> +	return ioread32(addr + reg);
> +}
> +
> +static inline void __ast_write8(void __iomem *addr, u32 reg, u8 val)
> +{
> +	iowrite8(val, addr + reg);
> +}
> +
> +static inline void __ast_write32(void __iomem *addr, u32 reg, u32 val)
> +{
> +	iowrite32(val, addr + reg);
> +}
> +
> +static inline u8 __ast_read8_i(void __iomem *addr, u32 reg, u8 index)
> +{
> +	__ast_write8(addr, reg, index);
> +	return __ast_read8(addr, reg + 1);
> +}
> +
> +static inline u8 __ast_read8_i_masked(void __iomem *addr, u32 reg, u8 index, u8 read_mask)
> +{
> +	u8 val = __ast_read8_i(addr, reg, index);
> +
> +	return val & read_mask;
> +}
> +
> +static inline void __ast_write8_i(void __iomem *addr, u32 reg, u8 index, u8 val)
> +{
> +	__ast_write8(addr, reg, index);
> +	__ast_write8(addr, reg + 1, val);
> +}
> +
> +static inline void __ast_write8_i_masked(void __iomem *addr, u32 reg, u8 index, u8 read_mask,
> +					 u8 val)
> +{
> +	u8 tmp = __ast_read8_i_masked(addr, reg, index, read_mask);
> +
> +	tmp |= val;
> +	__ast_write8_i(addr, reg, index, tmp);
> +}
> +
>   static inline u32 ast_read32(struct ast_device *ast, u32 reg)
>   {
> -	return ioread32(ast->regs + reg);
> +	return __ast_read32(ast->regs, reg);
>   }
>   
>   static inline void ast_write32(struct ast_device *ast, u32 reg, u32 val)
>   {
> -	iowrite32(val, ast->regs + reg);
> +	__ast_write32(ast->regs, reg, val);
>   }
>   
>   static inline u8 ast_io_read8(struct ast_device *ast, u32 reg)
>   {
> -	return ioread8(ast->ioregs + reg);
> +	return __ast_read8(ast->ioregs, reg);
>   }
>   
>   static inline void ast_io_write8(struct ast_device *ast, u32 reg, u8 val)
>   {
> -	iowrite8(val, ast->ioregs + reg);
> +	__ast_write8(ast->ioregs, reg, val);
>   }
>   
>   static inline u8 ast_get_index_reg(struct ast_device *ast, u32 base, u8 index)
>   {
> -	ast_io_write8(ast, base, index);
> -	++base;
> -	return ast_io_read8(ast, base);
> +	return __ast_read8_i(ast->ioregs, base, index);
>   }
>   
>   static inline u8 ast_get_index_reg_mask(struct ast_device *ast, u32 base, u8 index,
>   					u8 preserve_mask)
>   {
> -	u8 val = ast_get_index_reg(ast, base, index);
> -
> -	return val & preserve_mask;
> +	return __ast_read8_i_masked(ast->ioregs, base, index, preserve_mask);
>   }
>   
>   static inline void ast_set_index_reg(struct ast_device *ast, u32 base, u8 index, u8 val)
>   {
> -	ast_io_write8(ast, base, index);
> -	++base;
> -	ast_io_write8(ast, base, val);
> +	__ast_write8_i(ast->ioregs, base, index, val);
>   }
>   
>   static inline void ast_set_index_reg_mask(struct ast_device *ast, u32 base, u8 index,
>   					  u8 preserve_mask, u8 val)
>   {
> -	u8 tmp = ast_get_index_reg_mask(ast, base, index, preserve_mask);
> -
> -	tmp |= val;
> -	ast_set_index_reg(ast, base, index, tmp);
> +	__ast_write8_i_masked(ast->ioregs, base, index, preserve_mask, val);
>   }
>   
>   #define AST_VIDMEM_SIZE_8M    0x00800000
