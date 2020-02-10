Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9493D158049
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 17:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7F86ECC8;
	Mon, 10 Feb 2020 16:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BFD6ECC7;
 Mon, 10 Feb 2020 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T30a/zt6Cn6nKQ6fTutzYa0Woqo49baFfIQ5xetTNbg=; b=KbA7NFnA+Iak9HzGODGtmI67nV
 zzWy8XAZ9IjcYQRS6sy37wHh8BxJ8JhZ9A2PGV1auv5X6GtsNUHCJa5jkW2DvlY2oI0eRKlRmxucl
 G6kNV9elUgofZHB+p5/sgWD4ApVnpjZXnadqFsKBFMM5Wdc/a2wWvUaT8XesBblwgXrcN5czw5Nmm
 /m6RlptS5QtiMl5ZiYQp+A6yMtN4Rmh6w4AU8vaLyOub9AeUyfzCdfeuuO0SZIZerz1HyFwul8XzW
 ++EX4xPdaSFMXi6+38U5TbzMHIE2P9y87XwDJuBsVSrKY5aysVbbk0s3VcXEMoU+wBnIt0juJGQcZ
 OBzGCqnw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61327
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j1CNX-00079T-R0; Mon, 10 Feb 2020 17:57:47 +0100
Subject: Re: [PATCH v2 2/2] drm/qxl: add drm_driver.release callback.
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
References: <20200210113753.5614-1-kraxel@redhat.com>
 <20200210113753.5614-3-kraxel@redhat.com>
 <20200210150633.GS43062@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f83001ab-8017-0576-69fd-d5f62bda84fd@tronnes.org>
Date: Mon, 10 Feb 2020 17:57:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210150633.GS43062@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 10.02.2020 16.06, skrev Daniel Vetter:
> On Mon, Feb 10, 2020 at 12:37:52PM +0100, Gerd Hoffmann wrote:
>> Move final cleanups to qxl_drm_release() callback.
>> Add drm_atomic_helper_shutdown() call to qxl_pci_remove().
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  drivers/gpu/drm/qxl/qxl_drv.c | 26 +++++++++++++++++++-------
>>  1 file changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
>> index 1d601f57a6ba..4fda3f9b29f4 100644
>> --- a/drivers/gpu/drm/qxl/qxl_drv.c
>> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
>> @@ -34,6 +34,7 @@
>>  #include <linux/pci.h>
>>  
>>  #include <drm/drm.h>
>> +#include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_file.h>
>>  #include <drm/drm_modeset_helper.h>
>> @@ -132,21 +133,30 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	return ret;
>>  }
>>  
>> +static void qxl_drm_release(struct drm_device *dev)
>> +{
>> +	struct qxl_device *qdev = dev->dev_private;
>> +
>> +	/*
>> +	 * TODO: qxl_device_fini() call should be in qxl_pci_remove(),
>> +	 * reodering qxl_modeset_fini() + qxl_device_fini() calls is
>> +	 * non-trivial though.
>> +	 */
>> +	qxl_modeset_fini(qdev);
> 
> So the drm_mode_config_cleanup call in here belongs in ->release, but the
> qxl_destroy_monitors_object feels like should be perfectly fine in the
> remove hook. You might need to sprinkle a few drm_dev_enter/exit around to
> protect code paths thought.
> 
> Aside from this lgtm, for the series
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> And up to you whether you want to fix this or not really.
> 
> Btw for testing all these patches that add a ->release hook I think it'd
> be good if the drm core checks that drm_device->dev is set to NULL, and
> that we do this in the remove hook. Since that's guaranteed to be gone at
> that point, so anything in ->release that still needs the device is
> broken. Ofc maybe do that check only for drivers which have a ->release
> hook, and we might need a few fixups.
> 

We take a ref on the parent device in drm_dev_init() and release it in
drm_dev_fini(). I added this because of the DRM_DEV_* macros we have, to
protect access to the device struct after it was unregistered. Setting
drm_device->dev to NULL in drm_dev_unregister() instead will provide the
same protection I think.

commit 56be6503aab2
drm/drv: Hold ref on parent device during drm_device lifetime

Noralf.

> Cheers, Daniel
> 
>> +	qxl_device_fini(qdev);
>> +	dev->dev_private = NULL;
>> +	kfree(qdev);
>> +}
>> +
>>  static void
>>  qxl_pci_remove(struct pci_dev *pdev)
>>  {
>>  	struct drm_device *dev = pci_get_drvdata(pdev);
>> -	struct qxl_device *qdev = dev->dev_private;
>>  
>>  	drm_dev_unregister(dev);
>> -
>> -	qxl_modeset_fini(qdev);
>> -	qxl_device_fini(qdev);
>> +	drm_atomic_helper_shutdown(dev);
>>  	if (is_vga(pdev))
>>  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
>> -
>> -	dev->dev_private = NULL;
>> -	kfree(qdev);
>>  	drm_dev_put(dev);
>>  }
>>  
>> @@ -279,6 +289,8 @@ static struct drm_driver qxl_driver = {
>>  	.major = 0,
>>  	.minor = 1,
>>  	.patchlevel = 0,
>> +
>> +	.release = qxl_drm_release,
>>  };
>>  
>>  static int __init qxl_init(void)
>> -- 
>> 2.18.1
>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
