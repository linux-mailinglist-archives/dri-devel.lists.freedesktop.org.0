Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5397A73854C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8031910E478;
	Wed, 21 Jun 2023 13:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E4BD10E478
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:34:51 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxKsZ4_JJkKSUAAA--.312S3;
 Wed, 21 Jun 2023 21:34:49 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx4eR4_JJkwbYAAA--.4285S3; 
 Wed, 21 Jun 2023 21:34:48 +0800 (CST)
Message-ID: <a93ed5a2-0f28-5d9a-7681-0ec377a7496d@loongson.cn>
Date: Wed, 21 Jun 2023 21:34:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 06/14] drm/ast: Set PCI config before accessing I/O
 registers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230621130032.3568-1-tzimmermann@suse.de>
 <20230621130032.3568-7-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230621130032.3568-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Dx4eR4_JJkwbYAAA--.4285S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr17Zr4rJFyxGw1UCFyUArc_yoW5ArWfpa
 yDJa4SvrW5JF43KF43ZFyDZFy3J3WxtayF9r9xGwna9w4jyr1kCFn8A3y5GryDJrZ7AFya
 qFs7KFy8Wryq9wcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
 6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_
 Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU2n
 mRUUUUU
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

LGTM

On 2023/6/21 20:53, Thomas Zimmermann wrote:
> Access to I/O registers is required to detect and set up the
> device. Enable the rsp PCI config bits before. While at it,
> convert the magic number to macro constants.
>
> Enabling the PCI config bits was done after trying to detect
> the device. It was probably too late at this point.
>
> v2:
> 	* use standard 16-bit PCI r/w access (Jingfeng)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 -
>   drivers/gpu/drm/ast/ast_main.c | 21 +++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_post.c |  6 ------
>   3 files changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 0141705beaee9..630105feec18a 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -52,7 +52,6 @@
>   #define PCI_CHIP_AST2000 0x2000
>   #define PCI_CHIP_AST2100 0x2010
>   
> -
>   enum ast_chip {
>   	AST2000,
>   	AST2100,
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index c6987e0446618..01f938c2da28f 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -35,6 +35,23 @@
>   
>   #include "ast_drv.h"
>   
> +static int ast_init_pci_config(struct pci_dev *pdev)
> +{
> +	int err;
> +	u16 pcis04;
> +
> +	err = pci_read_config_word(pdev, PCI_COMMAND, &pcis04);
> +	if (err)
> +		goto out;
> +
> +	pcis04 |= PCI_COMMAND_MEMORY | PCI_COMMAND_IO;
> +
> +	err = pci_write_config_word(pdev, PCI_COMMAND, pcis04);
> +
> +out:
> +	return pcibios_err_to_errno(err);
> +}
> +
>   static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
>   {
>   	struct device_node *np = dev->dev->of_node;
> @@ -399,6 +416,10 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   			return ERR_PTR(-EIO);
>   	}
>   
> +	ret = ast_init_pci_config(pdev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	if (!ast_is_vga_enabled(dev)) {
>   		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
>   		need_post = true;
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index aa3f2cb00f82c..2da5bdb4bac45 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -361,12 +361,6 @@ static void ast_init_dram_reg(struct drm_device *dev)
>   void ast_post_gpu(struct drm_device *dev)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	u32 reg;
> -
> -	pci_read_config_dword(pdev, 0x04, &reg);
> -	reg |= 0x3;
> -	pci_write_config_dword(pdev, 0x04, reg);
>   
>   	ast_enable_vga(dev);
>   	ast_open_key(ast);

-- 
Jingfeng

