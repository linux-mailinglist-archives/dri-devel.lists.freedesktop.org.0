Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81641F56E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 21:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17966EF3F;
	Fri,  1 Oct 2021 19:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7206EF3F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 19:05:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633115102; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zxHL1tJuP1iAjagS9cfndBxpoCz7NOKL98a7EEV/PCM=;
 b=ZS8Ar/WoHg6uQ7z+9HnemuoGVojsgZb8NAGYPDtAI6JPui4VOUqRf48kMggpzvhfxzPl5dTH
 LdvoIu31NaNkluhz2DDdtFPI1A94HWOTTEF9tjtT9KsY9SLBMKTOGRNsG7orxu6NWVEjEYkc
 RufgJcOMlG5umM4st8hDz+XTSA4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61575bdb9ffb413149c065ed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 19:04:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 96686C43616; Fri,  1 Oct 2021 19:04:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E9BFC4360C;
 Fri,  1 Oct 2021 19:04:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Oct 2021 12:04:58 -0700
From: jesszhan@codeaurora.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: jsanka@codeaurora.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/msm: Add SDM845 DPU support
In-Reply-To: <20211001122838.GD2283@kili>
References: <20211001122838.GD2283@kili>
Message-ID: <c1537b326b654f05be247ca61d21e9f0@codeaurora.org>
X-Sender: jesszhan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

Hey Dan,

Thanks for the heads up, will take care of it.

On 2021-10-01 05:28, Dan Carpenter wrote:
> Hello Jeykumar Sankaran,
> 
> The patch 25fdd5933e4c: "drm/msm: Add SDM845 DPU support" from Jun
> 27, 2018, leads to the following
> Smatch static checker warning:
> 
> 	drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1679 dpu_plane_init()
> 	warn: '&pdpu->mplane_list' not removed from list
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>     1567 struct drm_plane *dpu_plane_init(struct drm_device *dev,
>     1568                 uint32_t pipe, enum drm_plane_type type,
>     1569                 unsigned long possible_crtcs, u32 
> master_plane_id)
>     1570 {
>     1571         struct drm_plane *plane = NULL, *master_plane = NULL;
>     1572         const uint32_t *format_list;
>     1573         struct dpu_plane *pdpu;
>     1574         struct msm_drm_private *priv = dev->dev_private;
>     1575         struct dpu_kms *kms = to_dpu_kms(priv->kms);
>     1576         int zpos_max = DPU_ZPOS_MAX;
>     1577         uint32_t num_formats;
>     1578         int ret = -EINVAL;
>     1579
>     1580         /* create and zero local structure */
>     1581         pdpu = kzalloc(sizeof(*pdpu), GFP_KERNEL);
>     1582         if (!pdpu) {
>     1583                 DPU_ERROR("[%u]failed to allocate local plane
> struct\n", pipe);
>     1584                 ret = -ENOMEM;
>     1585                 return ERR_PTR(ret);
>     1586         }
>     1587
>     1588         /* cache local stuff for later */
>     1589         plane = &pdpu->base;
>     1590         pdpu->pipe = pipe;
>     1591         pdpu->is_virtual = (master_plane_id != 0);
>     1592         INIT_LIST_HEAD(&pdpu->mplane_list);
>     1593         master_plane = drm_plane_find(dev, NULL, 
> master_plane_id);
>     1594         if (master_plane) {
>     1595                 struct dpu_plane *mpdpu = 
> to_dpu_plane(master_plane);
>     1596
>     1597                 list_add_tail(&pdpu->mplane_list, 
> &mpdpu->mplane_list);
>                                         ^^^^^^^^^^^^^^^^^
> This is not removed from the list in the error handling code so it will
> lead to a Use After Free.
> 
>     1598         }
>     1599
>     1600         /* initialize underlying h/w driver */
>     1601         pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, 
> kms->catalog,
>     1602
> master_plane_id != 0);
>     1603         if (IS_ERR(pdpu->pipe_hw)) {
>     1604                 DPU_ERROR("[%u]SSPP init failed\n", pipe);
>     1605                 ret = PTR_ERR(pdpu->pipe_hw);
>     1606                 goto clean_plane;
>     1607         } else if (!pdpu->pipe_hw->cap || 
> !pdpu->pipe_hw->cap->sblk) {
>     1608                 DPU_ERROR("[%u]SSPP init returned invalid
> cfg\n", pipe);
>     1609                 goto clean_sspp;
>     1610         }
>     1611
>     1612         /* cache features mask for later */
>     1613         pdpu->features = pdpu->pipe_hw->cap->features;
>     1614         pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
>     1615         if (!pdpu->pipe_sblk) {
>     1616                 DPU_ERROR("[%u]invalid sblk\n", pipe);
>     1617                 goto clean_sspp;
>     1618         }
>     1619
>     1620         if (pdpu->is_virtual) {
>     1621                 format_list = 
> pdpu->pipe_sblk->virt_format_list;
>     1622                 num_formats = 
> pdpu->pipe_sblk->virt_num_formats;
>     1623         }
>     1624         else {
>     1625                 format_list = pdpu->pipe_sblk->format_list;
>     1626                 num_formats = pdpu->pipe_sblk->num_formats;
>     1627         }
>     1628
>     1629         ret = drm_universal_plane_init(dev, plane, 0xff,
> &dpu_plane_funcs,
>     1630                                 format_list, num_formats,
>     1631                                 supported_format_modifiers,
> type, NULL);
>     1632         if (ret)
>     1633                 goto clean_sspp;
>     1634
>     1635         pdpu->catalog = kms->catalog;
>     1636
>     1637         if (kms->catalog->mixer_count &&
>     1638                 kms->catalog->mixer[0].sblk->maxblendstages) {
>     1639                 zpos_max =
> kms->catalog->mixer[0].sblk->maxblendstages - 1;
>     1640                 if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 
> 1)
>     1641                         zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 
> - 1;
>     1642         }
>     1643
>     1644         ret = drm_plane_create_zpos_property(plane, 0, 0, 
> zpos_max);
>     1645         if (ret)
>     1646                 DPU_ERROR("failed to install zpos property,
> rc = %d\n", ret);
>     1647
>     1648         drm_plane_create_alpha_property(plane);
>     1649         drm_plane_create_blend_mode_property(plane,
>     1650                         BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>     1651                         BIT(DRM_MODE_BLEND_PREMULTI) |
>     1652                         BIT(DRM_MODE_BLEND_COVERAGE));
>     1653
>     1654         drm_plane_create_rotation_property(plane,
>     1655                         DRM_MODE_ROTATE_0,
>     1656                         DRM_MODE_ROTATE_0 |
>     1657                         DRM_MODE_ROTATE_180 |
>     1658                         DRM_MODE_REFLECT_X |
>     1659                         DRM_MODE_REFLECT_Y);
>     1660
>     1661         drm_plane_enable_fb_damage_clips(plane);
>     1662
>     1663         /* success! finalize initialization */
>     1664         drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
>     1665
>     1666         /* save user friendly pipe name for later */
>     1667         snprintf(pdpu->pipe_name, DPU_NAME_SIZE, "plane%u",
> plane->base.id);
>     1668
>     1669         mutex_init(&pdpu->lock);
>     1670
>     1671         DPU_DEBUG("%s created for pipe:%u id:%u
> virtual:%u\n", pdpu->pipe_name,
>     1672                                         pipe, plane->base.id,
> master_plane_id);
>     1673         return plane;
>     1674
>     1675 clean_sspp:
>     1676         if (pdpu && pdpu->pipe_hw)
>     1677                 dpu_hw_sspp_destroy(pdpu->pipe_hw);
>     1678 clean_plane:
> --> 1679         kfree(pdpu);
>     1680         return ERR_PTR(ret);
>     1681 }
> 
> regards,
> dan carpenter

Best,
Jessica Zhang
