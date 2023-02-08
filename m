Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE368F6C2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 19:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6065810E067;
	Wed,  8 Feb 2023 18:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4CC10E83C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:17:51 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id da9so1775186edb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 10:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Qyp2AYk3foTA+Nkki/rC4svpfqC2QnHdJs/27fNnYv0=;
 b=DKiD8AmjEPf6F11bfw2Z7b27d06Drw3+odLTF+5UO/ZMPhO/v68SUfeiQNvdbpchID
 11Tbd7p/OJRDS+GK8q/O3pprXjWPWhNGpp3yfSJAtsijD8t/UdOhI8gn+FFtAYr4Yl5W
 vOX6dlDY8Xg+JImCmgdT/FyGRpvcdDM2PS8yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qyp2AYk3foTA+Nkki/rC4svpfqC2QnHdJs/27fNnYv0=;
 b=FQmmd068FJcW3AWePZkGyDr0nsEiJR2RxVtmBEal0t/JdkvsitpEjKoBMo0FV1k9Af
 wvffZEbyNKKqKrEapLs08E1DQoyOK5ifNrUao26WVVkYENHrd6PQa/SzP1ofUBLVjm/g
 L6uavP9igC3GUrSKkb42n7/1b1r4ybsTCM96LKZ6IaVNGBrGsYjq3IYnVAt2Pg/x8/wC
 X3N98Q4CM0D1nkZy4qh/AESC2O/3ZXCcjI03I7DqoBqT9IumrKfrbnxBwSLK5VG+694h
 1gwz7d5hNiNp/4j3S0qhi9GIHKdPJIfGIE/+G4cstWqyR/5oQ9GozidvBX3+LfTnU5hA
 t8Uw==
X-Gm-Message-State: AO0yUKVjNt5/Gvqy3AY+tLLJSt4VqKXdwdq2KvlnWxaN6XmiyQfckyi0
 IKbfwNdIH8HdhGujhCVsD8qKhA==
X-Google-Smtp-Source: AK7set+Hwo+lKoeGHaBPyc2Vq9SrLEQmIVu430lvqif1XSQrqDPATVwJfSDR4damzJs7RndGaNQHsw==
X-Received: by 2002:a05:6402:278a:b0:4aa:b394:7b28 with SMTP id
 b10-20020a056402278a00b004aab3947b28mr10385027ede.3.1675880270397; 
 Wed, 08 Feb 2023 10:17:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a056402350c00b0049e210884dasm8145401edd.15.2023.02.08.10.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 10:17:49 -0800 (PST)
Date: Wed, 8 Feb 2023 19:17:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3 5/6] drm/debugfs: Make the show callback pass the
 pointer to the right object
Message-ID: <Y+PnS/4n5wSqEa4Y@phenom.ffwll.local>
References: <20230131195825.677487-1-mcanal@igalia.com>
 <20230131195825.677487-6-mcanal@igalia.com>
 <Y+PmBtbUx8joWOJa@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+PmBtbUx8joWOJa@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 08, 2023 at 07:12:22PM +0100, Daniel Vetter wrote:
> On Tue, Jan 31, 2023 at 04:58:25PM -0300, Maíra Canal wrote:
> > Currently, the drivers need to access the struct drm_debugfs_entry to
> > get the proper device on the show callback. There is no need for such
> > thing, as you can wrap the show callback in order to provide to the
> > driver the proper parameters: the struct seq_file, the struct drm_device
> > and the driver-specific data stored in the struct drm_debugfs_info.
> > 
> > Therefore, make the show callback pass the pointer to the right object
> > in the parameters, which makes the API more type-safe.
> > 
> > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > ---
> >  drivers/gpu/drm/arm/hdlcd_drv.c       |  8 ++------
> >  drivers/gpu/drm/drm_atomic.c          |  4 +---
> >  drivers/gpu/drm/drm_client.c          |  5 ++---
> >  drivers/gpu/drm/drm_debugfs.c         | 25 ++++++++++++-------------
> >  drivers/gpu/drm/drm_framebuffer.c     |  4 +---
> >  drivers/gpu/drm/drm_gem_vram_helper.c |  5 ++---
> >  drivers/gpu/drm/gud/gud_drv.c         |  5 ++---
> >  drivers/gpu/drm/v3d/v3d_debugfs.c     | 16 ++++------------
> >  drivers/gpu/drm/vc4/vc4_bo.c          |  4 +---
> >  drivers/gpu/drm/vc4/vc4_debugfs.c     |  6 ++----
> >  drivers/gpu/drm/vc4/vc4_hdmi.c        |  6 ++----
> >  drivers/gpu/drm/vc4/vc4_hvs.c         |  8 ++------
> >  drivers/gpu/drm/vc4/vc4_v3d.c         |  4 +---
> >  drivers/gpu/drm/vkms/vkms_drv.c       |  4 +---
> >  include/drm/drm_debugfs.h             | 14 ++++++++------
> >  15 files changed, 43 insertions(+), 75 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> > index e3507dd6f82a..b70bc7b11764 100644
> > --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> > +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> > @@ -193,10 +193,8 @@ static int hdlcd_setup_mode_config(struct drm_device *drm)
> >  }
> >  
> >  #ifdef CONFIG_DEBUG_FS
> > -static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
> > +static int hdlcd_show_underrun_count(struct seq_file *m, struct drm_device *drm, void *arg)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *drm = entry->dev;
> >  	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
> >  
> >  	seq_printf(m, "underrun : %d\n", atomic_read(&hdlcd->buffer_underrun_count));
> > @@ -206,10 +204,8 @@ static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
> >  	return 0;
> >  }
> >  
> > -static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
> > +static int hdlcd_show_pxlclock(struct seq_file *m, struct drm_device *drm, void *arg)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *drm = entry->dev;
> >  	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
> >  	unsigned long clkrate = clk_get_rate(hdlcd->clk);
> >  	unsigned long mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index 5457c02ca1ab..38f140481fcc 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1754,10 +1754,8 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p)
> >  EXPORT_SYMBOL(drm_state_dump);
> >  
> >  #ifdef CONFIG_DEBUG_FS
> > -static int drm_state_info(struct seq_file *m, void *data)
> > +static int drm_state_info(struct seq_file *m, struct drm_device *dev, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct drm_printer p = drm_seq_file_printer(m);
> >  
> >  	__drm_state_dump(dev, &p, true);
> > diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> > index 009e7b10455c..ec2e6bc3515d 100644
> > --- a/drivers/gpu/drm/drm_client.c
> > +++ b/drivers/gpu/drm/drm_client.c
> > @@ -488,10 +488,9 @@ int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_re
> >  EXPORT_SYMBOL(drm_client_framebuffer_flush);
> >  
> >  #ifdef CONFIG_DEBUG_FS
> > -static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
> > +static int drm_client_debugfs_internal_clients(struct seq_file *m, struct drm_device *dev,
> > +					       void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct drm_printer p = drm_seq_file_printer(m);
> >  	struct drm_client_dev *client;
> >  
> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> > index b4d2e7dd87f5..21f01c7d0ab1 100644
> > --- a/drivers/gpu/drm/drm_debugfs.c
> > +++ b/drivers/gpu/drm/drm_debugfs.c
> > @@ -49,10 +49,8 @@
> >   * Initialization, etc.
> >   **************************************************/
> >  
> > -static int drm_name_info(struct seq_file *m, void *data)
> > +static int drm_name_info(struct seq_file *m, struct drm_device *dev, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct drm_master *master;
> >  
> >  	mutex_lock(&dev->master_mutex);
> > @@ -70,10 +68,8 @@ static int drm_name_info(struct seq_file *m, void *data)
> >  	return 0;
> >  }
> >  
> > -static int drm_clients_info(struct seq_file *m, void *data)
> > +static int drm_clients_info(struct seq_file *m, struct drm_device *dev, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct drm_file *priv;
> >  	kuid_t uid;
> >  
> > @@ -122,11 +118,8 @@ static int drm_gem_one_name_info(int id, void *ptr, void *data)
> >  	return 0;
> >  }
> >  
> > -static int drm_gem_name_info(struct seq_file *m, void *data)
> > +static int drm_gem_name_info(struct seq_file *m, struct drm_device *dev, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> > -
> >  	seq_printf(m, "  name     size handles refcount\n");
> >  
> >  	mutex_lock(&dev->object_name_lock);
> > @@ -143,6 +136,13 @@ static const struct drm_debugfs_info drm_debugfs_list[] = {
> >  };
> >  #define DRM_DEBUGFS_ENTRIES ARRAY_SIZE(drm_debugfs_list)
> >  
> > +static int drm_debugfs_dev_show(struct seq_file *m, void *unused)
> > +{
> > +	struct drm_debugfs_entry *entry = m->private;
> > +	int (*show)(struct seq_file *, struct drm_device *, void *) = entry->file.show;
> > +
> > +	return show(m, entry->dev, entry->file.data);
> > +}
> >  
> >  static int drm_debugfs_open(struct inode *inode, struct file *file)
> >  {
> > @@ -154,9 +154,8 @@ static int drm_debugfs_open(struct inode *inode, struct file *file)
> >  static int drm_debugfs_entry_open(struct inode *inode, struct file *file)
> >  {
> >  	struct drm_debugfs_entry *entry = inode->i_private;
> > -	struct drm_debugfs_info *node = &entry->file;
> >  
> > -	return single_open(file, node->show, entry);
> > +	return single_open(file, drm_debugfs_dev_show, entry);
> >  }
> >  
> >  static const struct file_operations drm_debugfs_entry_fops = {
> > @@ -353,7 +352,7 @@ void drm_debugfs_cleanup(struct drm_minor *minor)
> >   * drm_debugfs_init.
> >   */
> >  void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> > -			  int (*show)(struct seq_file*, void*), void *data)
> > +			  int (*show)(struct seq_file*, struct drm_device*, void*), void *data)
> >  {
> >  	struct drm_debugfs_entry *entry = drmm_kzalloc(dev, sizeof(*entry), GFP_KERNEL);
> >  
> > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> > index aff3746dedfb..f01b3cca9e06 100644
> > --- a/drivers/gpu/drm/drm_framebuffer.c
> > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > @@ -1201,10 +1201,8 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
> >  }
> >  
> >  #ifdef CONFIG_DEBUG_FS
> > -static int drm_framebuffer_info(struct seq_file *m, void *data)
> > +static int drm_framebuffer_info(struct seq_file *m, struct drm_device *dev, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct drm_printer p = drm_seq_file_printer(m);
> >  	struct drm_framebuffer *fb;
> >  
> > diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> > index d40b3edb52d0..5fc78317ad9d 100644
> > --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > @@ -955,10 +955,9 @@ static struct ttm_device_funcs bo_driver = {
> >   * struct drm_vram_mm
> >   */
> >  
> > -static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
> > +static int drm_vram_mm_debugfs(struct seq_file *m, struct drm_device *dev, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_vram_mm *vmm = entry->dev->vram_mm;
> > +	struct drm_vram_mm *vmm = dev->vram_mm;
> >  	struct ttm_resource_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
> >  	struct drm_printer p = drm_seq_file_printer(m);
> >  
> > diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
> > index 9d7bf8ee45f1..cfd887de599a 100644
> > --- a/drivers/gpu/drm/gud/gud_drv.c
> > +++ b/drivers/gpu/drm/gud/gud_drv.c
> > @@ -323,10 +323,9 @@ static struct drm_gem_object *gud_gem_prime_import(struct drm_device *drm, struc
> >  	return drm_gem_prime_import_dev(drm, dma_buf, gdrm->dmadev);
> >  }
> >  
> > -static int gud_stats_debugfs(struct seq_file *m, void *data)
> > +static int gud_stats_debugfs(struct seq_file *m, struct drm_device *dev, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct gud_device *gdrm = to_gud_device(entry->dev);
> > +	struct gud_device *gdrm = to_gud_device(dev);
> >  	char buf[10];
> >  
> >  	string_get_size(gdrm->bulk_len, 1, STRING_UNITS_2, buf, sizeof(buf));
> > diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
> > index 330669f51fa7..a142615f4789 100644
> > --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> > +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> > @@ -77,10 +77,8 @@ static const struct v3d_reg_def v3d_csd_reg_defs[] = {
> >  	REGDEF(V3D_CSD_CURRENT_CFG6),
> >  };
> >  
> > -static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
> > +static int v3d_v3d_debugfs_regs(struct seq_file *m, struct drm_device *dev, void *unused)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct v3d_dev *v3d = to_v3d_dev(dev);
> >  	int i, core;
> >  
> > @@ -124,10 +122,8 @@ static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
> >  	return 0;
> >  }
> >  
> > -static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
> > +static int v3d_v3d_debugfs_ident(struct seq_file *m, struct drm_device *dev, void *unused)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct v3d_dev *v3d = to_v3d_dev(dev);
> >  	u32 ident0, ident1, ident2, ident3, cores;
> >  	int core;
> > @@ -186,10 +182,8 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
> >  	return 0;
> >  }
> >  
> > -static int v3d_debugfs_bo_stats(struct seq_file *m, void *unused)
> > +static int v3d_debugfs_bo_stats(struct seq_file *m, struct drm_device *dev, void *unused)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct v3d_dev *v3d = to_v3d_dev(dev);
> >  
> >  	mutex_lock(&v3d->bo_lock);
> > @@ -202,10 +196,8 @@ static int v3d_debugfs_bo_stats(struct seq_file *m, void *unused)
> >  	return 0;
> >  }
> >  
> > -static int v3d_measure_clock(struct seq_file *m, void *unused)
> > +static int v3d_measure_clock(struct seq_file *m, struct drm_device *dev, void *unused)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct v3d_dev *v3d = to_v3d_dev(dev);
> >  	uint32_t cycles;
> >  	int core = 0;
> > diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> > index 86d629e45307..ea58728799da 100644
> > --- a/drivers/gpu/drm/vc4/vc4_bo.c
> > +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> > @@ -67,10 +67,8 @@ static void vc4_bo_stats_print(struct drm_printer *p, struct vc4_dev *vc4)
> >  	mutex_unlock(&vc4->purgeable.lock);
> >  }
> >  
> > -static int vc4_bo_stats_debugfs(struct seq_file *m, void *unused)
> > +static int vc4_bo_stats_debugfs(struct seq_file *m, struct drm_device *dev, void *unused)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct vc4_dev *vc4 = to_vc4_dev(dev);
> >  	struct drm_printer p = drm_seq_file_printer(m);
> >  
> > diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
> > index fac624a663ea..42c5d3c95a3f 100644
> > --- a/drivers/gpu/drm/vc4/vc4_debugfs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
> > @@ -32,11 +32,9 @@ vc4_debugfs_init(struct drm_minor *minor)
> >  	}
> >  }
> >  
> > -static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
> > +static int vc4_debugfs_regset32(struct seq_file *m, struct drm_device *drm, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *drm = entry->dev;
> > -	struct debugfs_regset32 *regset = entry->file.data;
> > +	struct debugfs_regset32 *regset = data;
> >  	struct drm_printer p = drm_seq_file_printer(m);
> >  	int idx;
> >  
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 14628864487a..5e1e1edc55db 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -158,11 +158,9 @@ static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
> >  		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
> >  }
> >  
> > -static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
> > +static int vc4_hdmi_debugfs_regs(struct seq_file *m, struct drm_device *drm, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct vc4_hdmi *vc4_hdmi = entry->file.data;
> > -	struct drm_device *drm = vc4_hdmi->connector.dev;
> > +	struct vc4_hdmi *vc4_hdmi = data;
> >  	struct drm_printer p = drm_seq_file_printer(m);
> >  	int idx;
> >  
> > diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> > index 4da66ef96783..8c37b5c3cb05 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> > @@ -91,10 +91,8 @@ void vc4_hvs_dump_state(struct vc4_hvs *hvs)
> >  	drm_dev_exit(idx);
> >  }
> >  
> > -static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
> > +static int vc4_hvs_debugfs_underrun(struct seq_file *m, struct drm_device *dev, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct vc4_dev *vc4 = to_vc4_dev(dev);
> >  	struct drm_printer p = drm_seq_file_printer(m);
> >  
> > @@ -103,10 +101,8 @@ static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
> >  	return 0;
> >  }
> >  
> > -static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
> > +static int vc4_hvs_debugfs_dlist(struct seq_file *m, struct drm_device *dev, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct vc4_dev *vc4 = to_vc4_dev(dev);
> >  	struct vc4_hvs *hvs = vc4->hvs;
> >  	struct drm_printer p = drm_seq_file_printer(m);
> > diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
> > index 29a664c8bf44..49eb48a270db 100644
> > --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> > +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> > @@ -94,10 +94,8 @@ static const struct debugfs_reg32 v3d_regs[] = {
> >  	VC4_REG32(V3D_ERRSTAT),
> >  };
> >  
> > -static int vc4_v3d_debugfs_ident(struct seq_file *m, void *unused)
> > +static int vc4_v3d_debugfs_ident(struct seq_file *m, struct drm_device *dev, void *unused)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct vc4_dev *vc4 = to_vc4_dev(dev);
> >  	int ret = vc4_v3d_pm_get(vc4);
> >  
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index 6d3a2d57d992..dde6a500f3b1 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -90,10 +90,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> >  	drm_atomic_helper_cleanup_planes(dev, old_state);
> >  }
> >  
> > -static int vkms_config_show(struct seq_file *m, void *data)
> > +static int vkms_config_show(struct seq_file *m, struct drm_device *dev, void *data)
> >  {
> > -	struct drm_debugfs_entry *entry = m->private;
> > -	struct drm_device *dev = entry->dev;
> >  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> >  
> >  	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
> > diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> > index 423aa3de506a..0fb7ad5f6893 100644
> > --- a/include/drm/drm_debugfs.h
> > +++ b/include/drm/drm_debugfs.h
> > @@ -36,6 +36,9 @@
> >  #include <linux/mutex.h>
> >  #include <linux/types.h>
> >  #include <linux/seq_file.h>
> > +
> > +struct drm_device;
> > +
> >  /**
> >   * struct drm_info_list - debugfs info list entry
> >   *
> > @@ -108,11 +111,10 @@ struct drm_debugfs_info {
> >  	/**
> >  	 * @show:
> >  	 *
> > -	 * Show callback. &seq_file->private will be set to the &struct
> > -	 * drm_debugfs_entry corresponding to the instance of this info
> > -	 * on a given &struct drm_device.
> > +	 * Show callback. This callback will be casted in order to provide
> > +	 * the &seq_file, the DRM object and the data stored in this struct.
> >  	 */
> > -	int (*show)(struct seq_file*, void*);
> > +	void *show;
> 
> The problem here is that with this we loose type-checking, and so all the
> users of drm_debugfs_add_file() have been missed in the conversion. That's
> not very good :-/

Correction, you didn't miss that, but it's the risk that could happen
because the driver doesn't check things.

> I think the only way to sort this out is if we duplicate the driver-facing
> functions/structs (maybe we don't need the add_files() functions in all
> cases?), and only use the type-unsafe void* internally.

Since I didnt' spell it out: If you only keep the change to add the
drm_device *dev pointer in this patch, but keep the full type everywhere,
then struct drm_debugfs_entry becomes an implementation detail and you can
move it into drm_debugfs.c. Once you have that you can throw out the
driver api facing struct drm_debugfs_info and just put all the required
pointers and things directly in there as void *, and it should work out
with reasonable amounts of code sharing, while the driver api all stays
type safe.
-Daniel

> -Daniel
> 
> >  
> >  	/** @driver_features: Required driver features for this entry. */
> >  	u32 driver_features;
> > @@ -146,7 +148,7 @@ int drm_debugfs_remove_files(const struct drm_info_list *files,
> >  			     int count, struct drm_minor *minor);
> >  
> >  void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> > -			  int (*show)(struct seq_file*, void*), void *data);
> > +			  int (*show)(struct seq_file*, struct drm_device*, void*), void *data);
> >  
> >  void drm_debugfs_add_files(struct drm_device *dev,
> >  			   const struct drm_debugfs_info *files, int count);
> > @@ -163,7 +165,7 @@ static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
> >  }
> >  
> >  static inline void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> > -					int (*show)(struct seq_file*, void*),
> > +					int (*show)(struct seq_file*, struct drm_device*, void*),
> >  					void *data)
> >  {}
> >  
> > -- 
> > 2.39.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
