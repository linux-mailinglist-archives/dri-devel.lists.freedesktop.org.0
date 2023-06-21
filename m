Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E95738D1A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766F910E2EC;
	Wed, 21 Jun 2023 17:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C671B10E2EC;
 Wed, 21 Jun 2023 17:31:22 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxQ8TpM5Nk7zgAAA--.421S3;
 Thu, 22 Jun 2023 01:31:21 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx_c7oM5Nkb_kAAA--.5870S3; 
 Thu, 22 Jun 2023 01:31:20 +0800 (CST)
Message-ID: <02c16e9b-0eca-caf4-b80c-53f1c7eab4e9@loongson.cn>
Date: Thu, 22 Jun 2023 01:31:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 07/11] drm/etnaviv: Add support for the dma coherent
 device
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Sui Jingfeng <18949883232@163.com>, 
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-8-18949883232@163.com>
 <8f74f0962c8bab6c832919a5340667c54e1a7ddc.camel@pengutronix.de>
 <2249b895-84b9-adea-531b-bf190e9c866f@loongson.cn>
 <030d44e2753b9b2eea0107cdee6c20e2bc2d3efe.camel@pengutronix.de>
 <3911d448-5613-23a8-cfcb-5ae418677338@loongson.cn>
 <87deb46db35b028da74c94f5496b721e14db4745.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <87deb46db35b028da74c94f5496b721e14db4745.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx_c7oM5Nkb_kAAA--.5870S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF1DGrykJw1xtr47Cr1Utwc_yoW8ZFWxpF
 48AFyayrWkGr40kw18Jrn8ury3Kr4xA3y5AFn8J3ZIkwnYqrsaqF1jvF1j9F1DWFs3Zr47
 Jayqvr1Yvr1kArXCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
 kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
 XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
 k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
 4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_ZF0_GFyUMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8KNt3UUUU
 U==
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/22 00:07, Lucas Stach wrote:
> And as the HW guarantees it on your platform, your platform
> implementation makes this function effectively a no-op. Skipping the
> call to this function is breaking the DMA API abstraction, as now the
> driver is second guessing the DMA API implementation. I really see no
> reason to do this.

It is the same reason you chose the word 'effectively', not 'difinitely'.

We don't want waste the CPU's time,


  to running the dma_sync_sg_for_cpu funcion() function


```

void dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
             int nelems, enum dma_data_direction dir)
{
     const struct dma_map_ops *ops = get_dma_ops(dev);

     BUG_ON(!valid_dma_direction(dir));
     if (dma_map_direct(dev, ops))
         dma_direct_sync_sg_for_cpu(dev, sg, nelems, dir);
     else if (ops->sync_sg_for_cpu)
         ops->sync_sg_for_cpu(dev, sg, nelems, dir);
     debug_dma_sync_sg_for_cpu(dev, sg, nelems, dir);
}

```


  to running the this:


```

int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
{
     struct drm_device *dev = obj->dev;
     struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
     struct etnaviv_drm_private *priv = dev->dev_private;

     if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CACHED) {
         /* fini without a prep is almost certainly a userspace error */
         WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
         dma_sync_sgtable_for_device(dev->dev, etnaviv_obj->sgt,
etnaviv_op_to_dma_dir(etnaviv_obj->last_cpu_prep_op));
         etnaviv_obj->last_cpu_prep_op = 0;
     }

     return 0;
}

```


But, this is acceptable, because we can kill the GEM_CPU_PREP and 
GEM_CPU_FINI ioctl entirely

at userspace for cached buffer, as this is totally not needed for cached 
mapping on our platform.


Well leave this for the WC mapping only,

OK ?

-- 
Jingfeng

