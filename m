Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDDE9011F2
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 16:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0954010E059;
	Sat,  8 Jun 2024 14:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TuqJljQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335BA10E059
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2024 14:20:48 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52c4b92c09bso971187e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jun 2024 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717856446; x=1718461246; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XuYZGJp5VHI3EQj2Q6zLax8OJqbbqIfDC/OAprHU6GI=;
 b=TuqJljQnBJZNehwoK3yngVNRAnJAaEHLu8w9+9bxTMmHj7spTXBrMvI1ZKknlP6lmz
 1LSxxBdxekuzbUIy5f9IyihuVQ9y2WqwvTZEFTz63+qVHxDFX63vJF3fkZsjhN9sw+Qn
 OwFSzjlVHHR8AwG6JCTdtWaodXwmg2AN7T2cFpxydlXXOsYWUt8Ce1FAx02m9OO9RRr+
 ChMRzGEU7mes8nUrsUaJDG+ZlOSmKzkeuDXvOVplsmZwUmNcAIOIt+jKsOx41ye5w0DK
 jk47JWm/5yA5DSpLBcIUKLEE6V34mX91GNwdYQTADbbqhH2e8nkTaaa2L1rE25wXTuor
 KrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717856446; x=1718461246;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XuYZGJp5VHI3EQj2Q6zLax8OJqbbqIfDC/OAprHU6GI=;
 b=twm99OJl/ctyaINwzrRpPLl7zRgRyYhmLyJj+j1U0OrvMMULl60mm8g35OkSipU5K6
 GxWGiDaiE10m+T0EbauwtA/47YLV/bj/c4mDOexe40MzHuihsf2KYFGXHOwiURZUMg/O
 cFSZoXSfrA1gqReCIdVq/uTnXz7kRjVBYM5hoDO2uQQ6izrIXgFBumkVBiPNF0g9PzXt
 /33sjfpSGOTNKxPcxcNFCph8N7ODBjbWTYDJc73Oapa3pZzzBq3NVqj84vWzCfD4g3eC
 nd8hDIeWawPi6JOxwO74aWCwX8AXdTWnusPIgDq1NdpGqfyFOjcH7d1LTmyuOEBQg/QY
 xrNw==
X-Gm-Message-State: AOJu0YzW0mFB+oEs2jYRLZR+40Xvzl0SihAgpttLqwcskj05dQ1N+oqU
 TzuKalEurmxvqB9Ssx9cwdXdrxF3eR8mPVURG3R5ou+L+4hGMKzb2wS2P5inmoQ=
X-Google-Smtp-Source: AGHT+IFIHy4IDYrhWy0XF8NwcDYAmuZYX5vITilFuFzrvSwuc3Kq+9WlqwJGVNobsH60QDV53LR/Zg==
X-Received: by 2002:ac2:598c:0:b0:52b:aa4c:49e3 with SMTP id
 2adb3069b0e04-52bb9fdd14emr3843082e87.64.1717856445894; 
 Sat, 08 Jun 2024 07:20:45 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f1629b95asm1643650f8f.92.2024.06.08.07.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jun 2024 07:20:45 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:20:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/meson: fix unbind path if HDMI fails to bind
Message-ID: <8cdd6fd7-d96a-4dfc-bb5b-11ad683583b1@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Neil Armstrong,

Commit 6a044642988b ("drm/meson: fix unbind path if HDMI fails to
bind") from May 30, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/meson/meson_drv.c:377 meson_drv_bind_master()
	error: we previously assumed 'priv' could be null (see line 205)

drivers/gpu/drm/meson/meson_drv.c
    180 static int meson_drv_bind_master(struct device *dev, bool has_components)
    181 {
    182         struct platform_device *pdev = to_platform_device(dev);
    183         const struct meson_drm_match_data *match;
    184         struct meson_drm *priv;
    185         struct drm_device *drm;
    186         struct resource *res;
    187         void __iomem *regs;
    188         int ret, i;
    189 
    190         /* Checks if an output connector is available */
    191         if (!meson_vpu_has_available_connectors(dev)) {
    192                 dev_err(dev, "No output connector available\n");
    193                 return -ENODEV;
    194         }
    195 
    196         match = of_device_get_match_data(dev);
    197         if (!match)
    198                 return -ENODEV;
    199 
    200         drm = drm_dev_alloc(&meson_driver, dev);
    201         if (IS_ERR(drm))
    202                 return PTR_ERR(drm);
    203 
    204         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    205         if (!priv) {
    206                 ret = -ENOMEM;
    207                 goto free_drm;

priv is NULL so the calls to meson_encoder_*_remove() will Oops.

    208         }
    209         drm->dev_private = priv;
    210         priv->drm = drm;
    211         priv->dev = dev;
    212         priv->compat = match->compat;
    213         priv->afbcd.ops = match->afbcd_ops;
    214 
    215         regs = devm_platform_ioremap_resource_byname(pdev, "vpu");
    216         if (IS_ERR(regs)) {
    217                 ret = PTR_ERR(regs);
    218                 goto free_drm;
    219         }
    220 
    221         priv->io_base = regs;
    222 
    223         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
    224         if (!res) {
    225                 ret = -EINVAL;
    226                 goto free_drm;
    227         }
    228         /* Simply ioremap since it may be a shared register zone */
    229         regs = devm_ioremap(dev, res->start, resource_size(res));
    230         if (!regs) {
    231                 ret = -EADDRNOTAVAIL;
    232                 goto free_drm;
    233         }
    234 
    235         priv->hhi = devm_regmap_init_mmio(dev, regs,
    236                                           &meson_regmap_config);
    237         if (IS_ERR(priv->hhi)) {
    238                 dev_err(&pdev->dev, "Couldn't create the HHI regmap\n");
    239                 ret = PTR_ERR(priv->hhi);
    240                 goto free_drm;
    241         }
    242 
    243         priv->canvas = meson_canvas_get(dev);
    244         if (IS_ERR(priv->canvas)) {
    245                 ret = PTR_ERR(priv->canvas);
    246                 goto free_drm;
    247         }
    248 
    249         ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
    250         if (ret)
    251                 goto free_drm;
    252         ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_0);
    253         if (ret) {
    254                 meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
    255                 goto free_drm;
    256         }
    257         ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_1);
    258         if (ret) {
    259                 meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
    260                 meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
    261                 goto free_drm;
    262         }
    263         ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_2);
    264         if (ret) {
    265                 meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
    266                 meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
    267                 meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);

What about this clean up?

    268                 goto free_drm;
    269         }
    270 
    271         priv->vsync_irq = platform_get_irq(pdev, 0);
    272 
    273         ret = drm_vblank_init(drm, 1);
    274         if (ret)
    275                 goto free_drm;

Do we not need to do it here as well?

    276 
    277         /* Assign limits per soc revision/package */
    278         for (i = 0 ; i < ARRAY_SIZE(meson_drm_soc_attrs) ; ++i) {
    279                 if (soc_device_match(meson_drm_soc_attrs[i].attrs)) {
    280                         priv->limits = &meson_drm_soc_attrs[i].limits;
    281                         break;
    282                 }
    283         }
    284 
    285         /*
    286          * Remove early framebuffers (ie. simplefb). The framebuffer can be
    287          * located anywhere in RAM
    288          */
    289         ret = drm_aperture_remove_framebuffers(&meson_driver);
    290         if (ret)
    291                 goto free_drm;
    292 
    293         ret = drmm_mode_config_init(drm);
    294         if (ret)
    295                 goto free_drm;
    296         drm->mode_config.max_width = 3840;
    297         drm->mode_config.max_height = 2160;
    298         drm->mode_config.funcs = &meson_mode_config_funcs;
    299         drm->mode_config.helper_private        = &meson_mode_config_helpers;
    300 
    301         /* Hardware Initialization */
    302 
    303         meson_vpu_init(priv);
    304         meson_venc_init(priv);
    305         meson_vpp_init(priv);
    306         meson_viu_init(priv);
    307         if (priv->afbcd.ops) {
    308                 ret = priv->afbcd.ops->init(priv);
    309                 if (ret)
    310                         goto free_drm;
    311         }
    312 
    313         /* Encoder Initialization */
    314 
    315         ret = meson_encoder_cvbs_probe(priv);
    316         if (ret)
    317                 goto exit_afbcd;
    318 
    319         if (has_components) {
    320                 ret = component_bind_all(dev, drm);
    321                 if (ret) {
    322                         dev_err(drm->dev, "Couldn't bind all components\n");
    323                         /* Do not try to unbind */
    324                         has_components = false;
    325                         goto exit_afbcd;
    326                 }
    327         }
    328 
    329         ret = meson_encoder_hdmi_probe(priv);
    330         if (ret)
    331                 goto exit_afbcd;
    332 
    333         if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
    334                 ret = meson_encoder_dsi_probe(priv);
    335                 if (ret)
    336                         goto exit_afbcd;
    337         }
    338 
    339         ret = meson_plane_create(priv);
    340         if (ret)
    341                 goto exit_afbcd;
    342 
    343         ret = meson_overlay_create(priv);
    344         if (ret)
    345                 goto exit_afbcd;
    346 
    347         ret = meson_crtc_create(priv);
    348         if (ret)
    349                 goto exit_afbcd;
    350 
    351         ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
    352         if (ret)
    353                 goto exit_afbcd;
    354 
    355         drm_mode_config_reset(drm);
    356 
    357         drm_kms_helper_poll_init(drm);
    358 
    359         platform_set_drvdata(pdev, priv);
    360 
    361         ret = drm_dev_register(drm, 0);
    362         if (ret)
    363                 goto uninstall_irq;
    364 
    365         drm_fbdev_dma_setup(drm, 32);
    366 
    367         return 0;
    368 
    369 uninstall_irq:
    370         free_irq(priv->vsync_irq, drm);
    371 exit_afbcd:
    372         if (priv->afbcd.ops)
    373                 priv->afbcd.ops->exit(priv);
    374 free_drm:
    375         drm_dev_put(drm);
    376 
--> 377         meson_encoder_dsi_remove(priv);
    378         meson_encoder_hdmi_remove(priv);
    379         meson_encoder_cvbs_remove(priv);
    380 
    381         if (has_components)
    382                 component_unbind_all(dev, drm);
    383 
    384         return ret;
    385 }

regards,
dan carpenter
