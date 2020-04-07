Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90D1A08D9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2BE8916F;
	Tue,  7 Apr 2020 08:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE46C8916F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 08:02:43 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id c9so795752otl.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B+IGGvwXtvpMoFyJXBYUflNRrfjRZwkCQuMyByMcQho=;
 b=BFn6qsZEZ4ktGp46hnAl9O7se/SSwvgjXfSJ606X4QvyDqgcq2yEP0Y2ZvJZXUevB0
 9bgtFW/7tYpvIYHL7cFCt1CLsmcTzC6qdcXg1kl2ulXPwB7afeCjLIuKgAFUeMpKJF6c
 DvgZoU2Maqj/2MtZKUsDkWj4c9YZMwMpsgGNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B+IGGvwXtvpMoFyJXBYUflNRrfjRZwkCQuMyByMcQho=;
 b=VhFi4Hv9vaoxIM+2r/TDK/6mfIAPn6sNLnJ6Xw68aoO6afGGS1VhmjYXaW7g4pGQHN
 rROzxhaUMFZTKzYNx83kjheXYRcvmo3mxuMdu5+ECFJp/yWxwW+AhahSeuZEcGo8bac/
 8Vg+kCijQHKU3xO613+tcyQZLEXqHCEefUxmSWu9juqoLlUAToS8XuyVwnjiBvdQFqlk
 nixga5fUCGNlvuqnVbxhKWXvYNQFkhG0MohW1BSUhHAp/+aWQp6fD34SzrSgVhI4rgb/
 bZd4j4kPVV7/5Zk6oikXH7rDH2/cGWNzNFHAb+3SBjbiNqtqOiRestSeBzpsPFf+c9mQ
 Hmtg==
X-Gm-Message-State: AGi0Pua2sxyTlh3esLawQfGO8gncMiefIizyAeaiSLuYnUcdKxV9eZVM
 OYE3dcFry91jc2yN0SKndYCbEKkbmSVuWsbd3TUNug==
X-Google-Smtp-Source: APiQypI0IVHv01F8Nt/anDTLR+c5S/0mtBDi0RIysglEWUDApMRa4zR5cD1gvrCxl6Z7NEIzrfxyzmkFDQyWfRw4sic=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr604218otr.188.1586246562936; 
 Tue, 07 Apr 2020 01:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190820230626.23253-1-john.stultz@linaro.org>
 <20190820230626.23253-20-john.stultz@linaro.org>
In-Reply-To: <20190820230626.23253-20-john.stultz@linaro.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 7 Apr 2020 10:02:29 +0200
Message-ID: <CAKMK7uHr5U-pPsxdQ4MpfK5v8iLjphDFug_3VTiUAf06nhS=yQ@mail.gmail.com>
Subject: Re: [PATCH v5 19/25] drm: kirin: Add register connect helper
 functions in drm init
To: John Stultz <john.stultz@linaro.org>
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 21, 2019 at 1:06 AM John Stultz <john.stultz@linaro.org> wrote:
>
> From: Xu YiPing <xuyiping@hisilicon.com>
>
> As part of refactoring the kirin driver to better support
> different hardware revisions, this patch adds a flag to the
> device specific driver data so that we can conditionally
> register the connectors at init.
>
> Cc: Rongrong Zou <zourongrong@gmail.com>
> Cc: Xinliang Liu <z.liuxinliang@hisilicon.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel <dri-devel@lists.freedesktop.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Xinliang Liu <z.liuxinliang@hisilicon.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Xu YiPing <xuyiping@hisilicon.com>
> [jstultz: reworded commit message]
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Whatever it is you're doing, this is nonsense. drm_dev_register does
register connectors for you. If you hotplug connectors later on, you
have to register them (manually), but definitely that should happen in
the hotplug code. General rule: If it's not a hotplugged dp mst
connector, calling drm_connector_register from drivers is pointless
(and yes I know there's tons of that stuff around, for historical
reasons).

Further the flag isn't even set, so this is just dead code.

Please revert.

Thanks, Daniel

> ---
> v5: checkpatch --strict whitespace fixups noticed by Sam
> ---
>  .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  1 +
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   | 43 +++++++++++++++++++
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.h   |  1 +
>  3 files changed, 45 insertions(+)
>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index 21c5d457a97d..89bdc0388138 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -1073,6 +1073,7 @@ static struct drm_driver ade_driver = {
>  };
>
>  struct kirin_drm_data ade_driver_data = {
> +       .register_connects = false,
>         .num_planes = ADE_CH_NUM,
>         .prim_plane = ADE_CH1,
>         .channel_formats = channel_formats,
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index c9faaa848cc6..68de8838da3c 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -98,6 +98,40 @@ static int compare_of(struct device *dev, void *data)
>         return dev->of_node == data;
>  }
>
> +static int kirin_drm_connectors_register(struct drm_device *dev)
> +{
> +       struct drm_connector *connector;
> +       struct drm_connector *failed_connector;
> +       struct drm_connector_list_iter conn_iter;
> +       int ret;
> +
> +       mutex_lock(&dev->mode_config.mutex);
> +       drm_connector_list_iter_begin(dev, &conn_iter);
> +       drm_for_each_connector_iter(connector, &conn_iter) {
> +               ret = drm_connector_register(connector);
> +               if (ret) {
> +                       failed_connector = connector;
> +                       goto err;
> +               }
> +       }
> +       drm_connector_list_iter_end(&conn_iter);
> +       mutex_unlock(&dev->mode_config.mutex);
> +
> +       return 0;
> +
> +err:
> +       drm_connector_list_iter_begin(dev, &conn_iter);
> +       drm_for_each_connector_iter(connector, &conn_iter) {
> +               if (failed_connector == connector)
> +                       break;
> +               drm_connector_unregister(connector);
> +       }
> +       drm_connector_list_iter_end(&conn_iter);
> +       mutex_unlock(&dev->mode_config.mutex);
> +
> +       return ret;
> +}
> +
>  static int kirin_drm_bind(struct device *dev)
>  {
>         struct drm_device *drm_dev;
> @@ -117,8 +151,17 @@ static int kirin_drm_bind(struct device *dev)
>
>         drm_fbdev_generic_setup(drm_dev, 32);
>
> +       /* connectors should be registered after drm device register */
> +       if (driver_data->register_connects) {
> +               ret = kirin_drm_connectors_register(drm_dev);
> +               if (ret)
> +                       goto err_drm_dev_unregister;
> +       }
> +
>         return 0;
>
> +err_drm_dev_unregister:
> +       drm_dev_unregister(drm_dev);
>  err_kms_cleanup:
>         kirin_drm_kms_cleanup(drm_dev);
>  err_drm_dev_put:
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> index fdbfc4a90f22..95f56c9960d5 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> @@ -39,6 +39,7 @@ struct kirin_drm_data {
>         u32 channel_formats_cnt;
>         int config_max_width;
>         int config_max_height;
> +       bool register_connects;
>         u32 num_planes;
>         u32 prim_plane;
>
> --
> 2.17.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
