Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150E17630A0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 10:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0130910E1C6;
	Wed, 26 Jul 2023 08:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B2910E186
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:57:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4338061929;
 Wed, 26 Jul 2023 08:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADE5C433C8;
 Wed, 26 Jul 2023 08:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690361861;
 bh=kjiQFIohojvIrF639adWnH/h/VJNwIVgZ5idr1q2NXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fROJJIaB+DQoYOGdT7clpGBJe5sWA4dgcmlZ6PPjD9fSbVK79++e73RLoBLrm5GgL
 VnAXtQyoTTorp3Z4L1EILfqE75lUzu/8rWyScRJ2e6fbBbknQCvFvmFLEbCsPLqS9S
 9CtKzfZcYOpmSunwgPsNbVqlf5bWA8u9/krqmW9KkA3ztsDz8r5LZnI1gutIXZOadu
 fuiPW/Zyg13o9K6+5twxyaQxNfF19ict/uV6aCffmXvLg5jiGYWXmvB8h8UtNzbU4E
 YA+NAOuYPkXJpGxqnyS0+/E/nW9V+w+z5Qstd6c9fixjvd4d2oNmuMQ/qX5rZfIKE3
 ZpMvnkujKt7pg==
Date: Wed, 26 Jul 2023 10:57:34 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 08/10] HID: i2c-hid: Support being a panel follower
Message-ID: <rorhwk3jx72twmqnxqb45uhm7azxxfirvferwyznbhbfmdf7ja@6k6ebhehmsn4>
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725133443.v3.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Jul 25 2023, Douglas Anderson wrote:
> As talked about in the patch ("drm/panel: Add a way for other devices
> to follow panel state"), we really want to keep the power states of a
> touchscreen and the panel it's attached to in sync with each other. In
> that spirit, add support to i2c-hid to be a panel follower. This will
> let the i2c-hid driver get informed when the panel is powered on and
> off. From there we can match the i2c-hid device's power state to that
> of the panel.
> 
> NOTE: this patch specifically _doesn't_ use pm_runtime to keep track
> of / manage the power state of the i2c-hid device, even though my
> first instinct said that would be the way to go. Specific problems
> with using pm_runtime():
> * The initial power up couldn't happen in a runtime resume function
>   since it create sub-devices and, apparently, that's not good to do
>   in your resume function.
> * Managing our power state with pm_runtime meant fighting to make the
>   right thing happen at system suspend to prevent the system from
>   trying to resume us only to suspend us again. While this might be
>   able to be solved, it added complexity.
> Overall the code without pm_runtime() ended up being smaller and
> easier to understand.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Add "depends on DRM || !DRM" to Kconfig to avoid randconfig error.
> - Split more of the panel follower code out of the core.
> 
> Changes in v2:
> - i2c_hid_core_panel_prepared() and ..._unpreparing() are now static.
> 
>  drivers/hid/i2c-hid/Kconfig        |  2 +
>  drivers/hid/i2c-hid/i2c-hid-core.c | 82 +++++++++++++++++++++++++++++-
>  2 files changed, 82 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig
> index 3be17109301a..2bdb55203104 100644
> --- a/drivers/hid/i2c-hid/Kconfig
> +++ b/drivers/hid/i2c-hid/Kconfig
> @@ -70,5 +70,7 @@ config I2C_HID_OF_GOODIX
>  
>  config I2C_HID_CORE
>  	tristate
> +	# We need to call into panel code so if DRM=m, this can't be 'y'
> +	depends on DRM || !DRM
>  endif
>  
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index fa8a1ca43d7f..fa6d1f624342 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -38,6 +38,8 @@
>  #include <linux/mutex.h>
>  #include <asm/unaligned.h>
>  
> +#include <drm/drm_panel.h>
> +
>  #include "../hid-ids.h"
>  #include "i2c-hid.h"
>  
> @@ -107,6 +109,8 @@ struct i2c_hid {
>  	struct mutex		reset_lock;
>  
>  	struct i2chid_ops	*ops;
> +	struct drm_panel_follower panel_follower;
> +	bool			is_panel_follower;
>  };
>  
>  static const struct i2c_hid_quirks {
> @@ -1058,6 +1062,59 @@ static int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
>  	return ret;
>  }
>  
> +static int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
> +{
> +	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
> +	struct hid_device *hid = ihid->hid;
> +
> +	/*
> +	 * hid->version is set on the first power up. If it's still zero then
> +	 * this is the first power on so we should perform initial power up
> +	 * steps.
> +	 */
> +	if (!hid->version)
> +		return i2c_hid_core_initial_power_up(ihid);
> +
> +	return i2c_hid_core_resume(ihid);
> +}
> +
> +static int i2c_hid_core_panel_unpreparing(struct drm_panel_follower *follower)
> +{
> +	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
> +
> +	return i2c_hid_core_suspend(ihid);
> +}
> +
> +static const struct drm_panel_follower_funcs i2c_hid_core_panel_follower_funcs = {
> +	.panel_prepared = i2c_hid_core_panel_prepared,
> +	.panel_unpreparing = i2c_hid_core_panel_unpreparing,
> +};
> +
> +static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
> +{
> +	struct device *dev = &ihid->client->dev;
> +	int ret;
> +
> +	ihid->is_panel_follower = true;
> +	ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_funcs;
> +
> +	/*
> +	 * If we're not in control of our own power up/power down then we can't
> +	 * do the logic to manage wakeups. Give a warning if a user thought
> +	 * that was possible then force the capability off.
> +	 */
> +	if (device_can_wakeup(dev)) {
> +		dev_warn(dev, "Can't wakeup if following panel\n");
> +		device_set_wakeup_capable(dev, false);
> +	}
> +
> +	ret = drm_panel_add_follower(dev, &ihid->panel_follower);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
>  		       u16 hid_descriptor_address, u32 quirks)
>  {
> @@ -1119,7 +1176,15 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
>  	hid->bus = BUS_I2C;
>  	hid->initial_quirks = quirks;
>  
> -	ret = i2c_hid_core_initial_power_up(ihid);
> +	/*
> +	 * If we're a panel follower, we'll register and do our initial power
> +	 * up when the panel turns on; otherwise we do it right away.
> +	 */
> +	if (drm_is_panel_follower(&client->dev))
> +		ret = i2c_hid_core_register_panel_follower(ihid);
> +	else
> +		ret = i2c_hid_core_initial_power_up(ihid);

nitpicks, but I'm not sure I'm a big fan of having
"if (drm_is_panel_follower(&client->dev))" sprinkled everywhere in the
generic probe/resume/suspend code.

Would it be OK to define a `static int __do_i2c_hid_core_initial_power_up(struct i2c_hid *ihid)`
that would do the actual powering up, and have
i2c_hid_core_initial_power_up() doing the test if we are a panel
follower?

The i2c_hid_core_panel_* will need to be updated to use the `__do_`
prefixed functions.

> +
>  	if (ret)
>  		goto err_mem_free;
>  
> @@ -1143,7 +1208,14 @@ void i2c_hid_core_remove(struct i2c_client *client)
>  	struct i2c_hid *ihid = i2c_get_clientdata(client);
>  	struct hid_device *hid;
>  
> -	i2c_hid_core_power_down(ihid);
> +	/*
> +	 * If we're a follower, the act of unfollowing will cause us to be
> +	 * powered down. Otherwise we need to manually do it.
> +	 */
> +	if (ihid->is_panel_follower)
> +		drm_panel_remove_follower(&ihid->panel_follower);

That part is concerning, as we are now calling hid_drv->suspend() when removing
the device. It might or not have an impact (I'm not sure of it), but we
are effectively changing the path of commands sent to the device.

hid-multitouch might call a feature in ->suspend, but the remove makes
that the physical is actually disconnected, so the function will fail,
and I'm not sure what is happening then.

> +	else
> +		i2c_hid_core_power_down(ihid);

Same here, I *think* it would be best to have the `if (ihid->is_panel_follower)`
test in i2c_hid_core_power_down()  (and have a separate
_do_i2c_hid_core_power_down()).

>  
>  	hid = ihid->hid;
>  	hid_destroy_device(hid);
> @@ -1171,6 +1243,9 @@ static int i2c_hid_core_pm_suspend(struct device *dev)
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct i2c_hid *ihid = i2c_get_clientdata(client);
>  
> +	if (ihid->is_panel_follower)
> +		return 0;

Not sure we need to split that one with _do_ prefix, it's already split
:)

> +
>  	return i2c_hid_core_suspend(ihid);
>  }
>  
> @@ -1179,6 +1254,9 @@ static int i2c_hid_core_pm_resume(struct device *dev)
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct i2c_hid *ihid = i2c_get_clientdata(client);
>  
> +	if (ihid->is_panel_follower)
> +		return 0;

Same here, no need to split.

> +
>  	return i2c_hid_core_resume(ihid);
>  }
>  
> -- 
> 2.41.0.487.g6d72f3e995-goog
> 

Cheers,
Benjamin
