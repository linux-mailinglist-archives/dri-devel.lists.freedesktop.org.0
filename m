Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5349D2AF4BA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 16:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418EA6E05A;
	Wed, 11 Nov 2020 15:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E376E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 15:30:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABFTx1n093695;
 Wed, 11 Nov 2020 09:30:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605108600;
 bh=bfJkxqum3bgX5KzLpe6558v8dX+FN/9FXYkh0eN11Mc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=LXm7tU3alkVm7GWKVezyZ9uURYWrRVUea6FDulEnrNI7t39+I6zHSlgvA5Fub4P8r
 U7kB1Q1OB53bJ37Gouhlb17Efm0tmS6DbZmukSsQ58//URj+8Qt32xYKtJLy8v+qtd
 FKS9j7QJBI/9ZItLv8iiuk1Ef3xQPolkzRFrQ5LU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABFTxZN008862
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 09:29:59 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 09:29:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 09:29:59 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABFTv39055261;
 Wed, 11 Nov 2020 09:29:57 -0600
Subject: Re: [PATCH v3 29/56] drm/omap: dsi: do ULPS in host driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-30-tomi.valkeinen@ti.com>
 <20201109100315.GZ6029@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8493b584-b183-aaf7-1649-7369fbc546be@ti.com>
Date: Wed, 11 Nov 2020 17:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109100315.GZ6029@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2020 12:03, Laurent Pinchart wrote:
> Hi Tomi and Sebastian,
> 
> Thank you for the patch.
> 
> On Thu, Nov 05, 2020 at 02:03:06PM +0200, Tomi Valkeinen wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> Move ULPS handling into the DSI host controller, so that we
>> no longer need a custom API for the DSI client.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 273 +-----------------
>>  drivers/gpu/drm/omapdrm/dss/dsi.c             |  63 +++-
>>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |   2 -
>>  3 files changed, 62 insertions(+), 276 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> index 78247dcb1848..030a8fa140db 100644
>> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> @@ -16,7 +16,6 @@
>>  #include <linux/module.h>
>>  #include <linux/sched/signal.h>
>>  #include <linux/slab.h>
>> -#include <linux/workqueue.h>
>>  #include <linux/of_device.h>
>>  #include <linux/regulator/consumer.h>
>>  
>> @@ -69,21 +68,13 @@ struct panel_drv_data {
>>  
>>  	bool intro_printed;
>>  
>> -	struct workqueue_struct *workqueue;
>> -
>>  	bool ulps_enabled;
>> -	unsigned int ulps_timeout;
>> -	struct delayed_work ulps_work;
>>  };
>>  
>>  #define to_panel_data(p) container_of(p, struct panel_drv_data, dssdev)
>>  
>>  static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
>>  
>> -static int dsicm_panel_reset(struct panel_drv_data *ddata);
>> -
>> -static void dsicm_ulps_work(struct work_struct *work);
>> -
>>  static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
>>  {
>>  	struct backlight_device *backlight;
>> @@ -207,94 +198,6 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
>>  	return 0;
>>  }
>>  
>> -static void dsicm_queue_ulps_work(struct panel_drv_data *ddata)
>> -{
>> -	if (ddata->ulps_timeout > 0)
>> -		queue_delayed_work(ddata->workqueue, &ddata->ulps_work,
>> -				msecs_to_jiffies(ddata->ulps_timeout));
>> -}
>> -
>> -static void dsicm_cancel_ulps_work(struct panel_drv_data *ddata)
>> -{
>> -	cancel_delayed_work(&ddata->ulps_work);
>> -}
>> -
>> -static int dsicm_enter_ulps(struct panel_drv_data *ddata)
>> -{
>> -	struct omap_dss_device *src = ddata->src;
>> -	int r;
>> -
>> -	if (ddata->ulps_enabled)
>> -		return 0;
>> -
>> -	dsicm_cancel_ulps_work(ddata);
>> -
>> -	r = _dsicm_enable_te(ddata, false);
>> -	if (r)
>> -		goto err;
>> -
>> -	src->ops->dsi.ulps(src, true);
>> -
>> -	ddata->ulps_enabled = true;
>> -
>> -	return 0;
>> -
>> -err:
>> -	dev_err(&ddata->dsi->dev, "enter ULPS failed");
>> -	dsicm_panel_reset(ddata);
>> -
>> -	ddata->ulps_enabled = false;
>> -
>> -	dsicm_queue_ulps_work(ddata);
>> -
>> -	return r;
>> -}
>> -
>> -static int dsicm_exit_ulps(struct panel_drv_data *ddata)
>> -{
>> -	struct omap_dss_device *src = ddata->src;
>> -	int r;
>> -
>> -	if (!ddata->ulps_enabled)
>> -		return 0;
>> -
>> -	src->ops->dsi.ulps(src, false);
>> -	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>> -
>> -	r = _dsicm_enable_te(ddata, ddata->te_enabled);
>> -	if (r) {
>> -		dev_err(&ddata->dsi->dev, "failed to re-enable TE");
>> -		goto err2;
>> -	}
>> -
>> -	dsicm_queue_ulps_work(ddata);
>> -
>> -	ddata->ulps_enabled = false;
>> -
>> -	return 0;
>> -
>> -err2:
>> -	dev_err(&ddata->dsi->dev, "failed to exit ULPS");
>> -
>> -	r = dsicm_panel_reset(ddata);
>> -	if (!r)
>> -		ddata->ulps_enabled = false;
>> -
>> -	dsicm_queue_ulps_work(ddata);
>> -
>> -	return r;
>> -}
>> -
>> -static int dsicm_wake_up(struct panel_drv_data *ddata)
>> -{
>> -	if (ddata->ulps_enabled)
>> -		return dsicm_exit_ulps(ddata);
>> -
>> -	dsicm_cancel_ulps_work(ddata);
>> -	dsicm_queue_ulps_work(ddata);
>> -	return 0;
>> -}
>> -
>>  static int dsicm_bl_update_status(struct backlight_device *dev)
>>  {
>>  	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
>> @@ -312,11 +215,8 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
>>  	mutex_lock(&ddata->lock);
>>  
>>  	if (ddata->enabled) {
>> -		r = dsicm_wake_up(ddata);
>> -		if (!r) {
>> -			r = dsicm_dcs_write_1(ddata,
>> -				MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
>> -		}
>> +		r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
>> +				      level);
>>  	}
>>  
>>  	mutex_unlock(&ddata->lock);
>> @@ -343,18 +243,12 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
>>  {
>>  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>>  	u8 errors = 0;
>> -	int r;
>> +	int r = -ENODEV;
>>  
>>  	mutex_lock(&ddata->lock);
>>  
>> -	if (ddata->enabled) {
>> -		r = dsicm_wake_up(ddata);
>> -		if (!r)
>> -			r = dsicm_dcs_read_1(ddata, DCS_READ_NUM_ERRORS,
>> -					&errors);
>> -	} else {
>> -		r = -ENODEV;
>> -	}
>> +	if (ddata->enabled)
>> +		r = dsicm_dcs_read_1(ddata, DCS_READ_NUM_ERRORS, &errors);
>>  
>>  	mutex_unlock(&ddata->lock);
>>  
>> @@ -369,17 +263,12 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
>>  {
>>  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>>  	u8 id1, id2, id3;
>> -	int r;
>> +	int r = -ENODEV;
>>  
>>  	mutex_lock(&ddata->lock);
>>  
>> -	if (ddata->enabled) {
>> -		r = dsicm_wake_up(ddata);
>> -		if (!r)
>> -			r = dsicm_get_id(ddata, &id1, &id2, &id3);
>> -	} else {
>> -		r = -ENODEV;
>> -	}
>> +	if (ddata->enabled)
>> +		r = dsicm_get_id(ddata, &id1, &id2, &id3);
>>  
>>  	mutex_unlock(&ddata->lock);
>>  
>> @@ -389,103 +278,12 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
>>  	return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x\n", id1, id2, id3);
>>  }
>>  
>> -static ssize_t dsicm_store_ulps(struct device *dev,
>> -		struct device_attribute *attr,
>> -		const char *buf, size_t count)
>> -{
>> -	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>> -	unsigned long t;
>> -	int r;
>> -
>> -	r = kstrtoul(buf, 0, &t);
>> -	if (r)
>> -		return r;
>> -
>> -	mutex_lock(&ddata->lock);
>> -
>> -	if (ddata->enabled) {
>> -		if (t)
>> -			r = dsicm_enter_ulps(ddata);
>> -		else
>> -			r = dsicm_wake_up(ddata);
>> -	}
>> -
>> -	mutex_unlock(&ddata->lock);
>> -
>> -	if (r)
>> -		return r;
>> -
>> -	return count;
>> -}
>> -
>> -static ssize_t dsicm_show_ulps(struct device *dev,
>> -		struct device_attribute *attr,
>> -		char *buf)
>> -{
>> -	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>> -	unsigned int t;
>> -
>> -	mutex_lock(&ddata->lock);
>> -	t = ddata->ulps_enabled;
>> -	mutex_unlock(&ddata->lock);
>> -
>> -	return snprintf(buf, PAGE_SIZE, "%u\n", t);
>> -}
>> -
>> -static ssize_t dsicm_store_ulps_timeout(struct device *dev,
>> -		struct device_attribute *attr,
>> -		const char *buf, size_t count)
>> -{
>> -	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>> -	unsigned long t;
>> -	int r;
>> -
>> -	r = kstrtoul(buf, 0, &t);
>> -	if (r)
>> -		return r;
>> -
>> -	mutex_lock(&ddata->lock);
>> -	ddata->ulps_timeout = t;
>> -
>> -	if (ddata->enabled) {
>> -		/* dsicm_wake_up will restart the timer */
>> -		r = dsicm_wake_up(ddata);
>> -	}
>> -
>> -	mutex_unlock(&ddata->lock);
>> -
>> -	if (r)
>> -		return r;
>> -
>> -	return count;
>> -}
>> -
>> -static ssize_t dsicm_show_ulps_timeout(struct device *dev,
>> -		struct device_attribute *attr,
>> -		char *buf)
>> -{
>> -	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>> -	unsigned int t;
>> -
>> -	mutex_lock(&ddata->lock);
>> -	t = ddata->ulps_timeout;
>> -	mutex_unlock(&ddata->lock);
>> -
>> -	return snprintf(buf, PAGE_SIZE, "%u\n", t);
>> -}
>> -
>>  static DEVICE_ATTR(num_dsi_errors, S_IRUGO, dsicm_num_errors_show, NULL);
>>  static DEVICE_ATTR(hw_revision, S_IRUGO, dsicm_hw_revision_show, NULL);
>> -static DEVICE_ATTR(ulps, S_IRUGO | S_IWUSR,
>> -		dsicm_show_ulps, dsicm_store_ulps);
>> -static DEVICE_ATTR(ulps_timeout, S_IRUGO | S_IWUSR,
>> -		dsicm_show_ulps_timeout, dsicm_store_ulps_timeout);
>>  
>>  static struct attribute *dsicm_attrs[] = {
>>  	&dev_attr_num_dsi_errors.attr,
>>  	&dev_attr_hw_revision.attr,
>> -	&dev_attr_ulps.attr,
>> -	&dev_attr_ulps_timeout.attr,
>>  	NULL,
>>  };
>>  
>> @@ -621,15 +419,6 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
>>  	ddata->enabled = false;
>>  }
>>  
>> -static int dsicm_panel_reset(struct panel_drv_data *ddata)
>> -{
>> -	dev_err(&ddata->dsi->dev, "performing LCD reset\n");
>> -
>> -	dsicm_power_off(ddata);
>> -	dsicm_hw_reset(ddata);
>> -	return dsicm_power_on(ddata);
>> -}
>> -
>>  static int dsicm_connect(struct omap_dss_device *src,
>>  			 struct omap_dss_device *dst)
>>  {
>> @@ -671,17 +460,12 @@ static void dsicm_enable(struct omap_dss_device *dssdev)
>>  static void dsicm_disable(struct omap_dss_device *dssdev)
>>  {
>>  	struct panel_drv_data *ddata = to_panel_data(dssdev);
>> -	int r;
>>  
>>  	dsicm_bl_power(ddata, false);
>>  
>>  	mutex_lock(&ddata->lock);
>>  
>> -	dsicm_cancel_ulps_work(ddata);
>> -
>> -	r = dsicm_wake_up(ddata);
>> -	if (!r)
>> -		dsicm_power_off(ddata);
>> +	dsicm_power_off(ddata);
>>  
>>  	mutex_unlock(&ddata->lock);
>>  }
>> @@ -705,10 +489,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
>>  
>>  	mutex_lock(&ddata->lock);
>>  
>> -	r = dsicm_wake_up(ddata);
>> -	if (r)
>> -		goto err;
>> -
>>  	if (!ddata->enabled) {
>>  		r = 0;
>>  		goto err;
>> @@ -748,24 +528,6 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
>>  	return r;
>>  }
>>  
>> -static void dsicm_ulps_work(struct work_struct *work)
>> -{
>> -	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
>> -			ulps_work.work);
>> -	struct omap_dss_device *dssdev = &ddata->dssdev;
>> -
>> -	mutex_lock(&ddata->lock);
>> -
>> -	if (dssdev->state != OMAP_DSS_DISPLAY_ACTIVE || !ddata->enabled) {
>> -		mutex_unlock(&ddata->lock);
>> -		return;
>> -	}
>> -
>> -	dsicm_enter_ulps(ddata);
>> -
>> -	mutex_unlock(&ddata->lock);
>> -}
>> -
>>  static int dsicm_get_modes(struct omap_dss_device *dssdev,
>>  			   struct drm_connector *connector)
>>  {
>> @@ -863,7 +625,7 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>>  	else
>>  		ddata->use_dsi_backlight = true;
>>  
>> -	/* TODO: ulps */
>> +	/* TODO: ulps_enabled */
>>  
>>  	return 0;
>>  }
>> @@ -911,13 +673,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>>  
>>  	mutex_init(&ddata->lock);
>>  
>> -	ddata->workqueue = create_singlethread_workqueue("dsicm_wq");
>> -	if (!ddata->workqueue) {
>> -		r = -ENOMEM;
>> -		goto err_reg;
>> -	}
>> -	INIT_DELAYED_WORK(&ddata->ulps_work, dsicm_ulps_work);
>> -
>>  	dsicm_hw_reset(ddata);
>>  
>>  	if (ddata->use_dsi_backlight) {
>> @@ -948,6 +703,9 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>>  	dsi->hs_rate = 300000000;
>>  	dsi->lp_rate = 10000000;
>>  
>> +	if (ddata->ulps_enabled)
>> +		dsi->mode_flags |= MIPI_DSI_MODE_ULPS_IDLE;
>> +
>>  	r = mipi_dsi_attach(dsi);
>>  	if (r < 0)
>>  		goto err_dsi_attach;
>> @@ -957,8 +715,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>>  err_dsi_attach:
>>  	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
>>  err_bl:
>> -	destroy_workqueue(ddata->workqueue);
>> -err_reg:
>>  	if (ddata->extbldev)
>>  		put_device(&ddata->extbldev->dev);
>>  
>> @@ -985,9 +741,6 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
>>  	if (ddata->extbldev)
>>  		put_device(&ddata->extbldev->dev);
>>  
>> -	dsicm_cancel_ulps_work(ddata);
>> -	destroy_workqueue(ddata->workqueue);
>> -
>>  	/* reset, to be sure that the panel is in a valid state */
>>  	dsicm_hw_reset(ddata);
>>  
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index 937362ade4b4..0f264654792d 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -207,6 +207,8 @@ struct dsi_reg { u16 module; u16 idx; };
>>  typedef void (*omap_dsi_isr_t) (void *arg, u32 mask);
>>  struct dsi_data;
>>  
>> +static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable);
>> +
> 
> Would it be possible to avoid forward declarations by reordering
> functions ?

Maybe, but doing it here leads to lots of conflicts...

> This patch removes the ability for userspace to configure the ULPS
> timeout (and thus, if I understand correctly, to disable the auto-ULPS
> feature). I understand the simplification is needed, but I can't tell if
> the feature removal could have an adverse effect.

Using ULPS may reduce power consumption in some cases, but to be honest, I'm not sure if it's worth
it or not, and I find it unlikely that anyone has used or dependend on it. I think it's something
that people can finetune afterwards if they really need it.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
