Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587FD77B5EB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 12:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C20E10E181;
	Mon, 14 Aug 2023 10:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E65C10E181
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 10:04:53 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 210766BE;
 Mon, 14 Aug 2023 12:03:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692007420;
 bh=+SmmP1fHAeNOg0PYd2bbMnXgJQDbnCtnHiu6WD175Qw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AkKsETHTM0UJGEBo+c2APw4NBzfbMXMXrITULcXQYH3ZGtIr+1Kg6XO+INevelavL
 Hu+uJSVyaoZer7jqvXz/X5Jq4rxbBuce6WvK4oiY4p4rw5HvvuDuqotqgpg8X+0dVQ
 KQ9TaBaTrLDEKeBZoL58sz6jgzZ+gxzYqkqGmQ9Y=
Content-Type: multipart/mixed; boundary="------------Jv9QiLaHpf9XtF8lwXHmakTu"
Message-ID: <0855d804-3ba3-4f29-32b1-bab3b999e506@ideasonboard.com>
Date: Mon, 14 Aug 2023 13:04:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 11/11] drm/bridge: tc358768: Add
 DRM_BRIDGE_ATTACH_NO_CONNECTOR support
Content-Language: en-US
To: Maxim Schwalm <maxim.schwalm@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-11-1afd44b7826b@ideasonboard.com>
 <e857d383-2287-a985-24c5-fa1fff1da199@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <e857d383-2287-a985-24c5-fa1fff1da199@gmail.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Jv9QiLaHpf9XtF8lwXHmakTu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2023 20:11, Maxim Schwalm wrote:
> On 04.08.23 12:44, Tomi Valkeinen wrote:
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/bridge/tc358768.c | 64 +++++++++++++++++++++++++++------------
>>   1 file changed, 45 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
>> index ea19de5509ed..a567f136ddc7 100644
>> --- a/drivers/gpu/drm/bridge/tc358768.c
>> +++ b/drivers/gpu/drm/bridge/tc358768.c
>> @@ -131,8 +131,17 @@ static const char * const tc358768_supplies[] = {
>>   
>>   struct tc358768_dsi_output {
>>   	struct mipi_dsi_device *dev;
>> +
>> +	/* Legacy field if DRM_BRIDGE_ATTACH_NO_CONNECTOR is not used */
>>   	struct drm_panel *panel;
>> -	struct drm_bridge *bridge;
>> +
>> +	/*
>> +	 * If DRM_BRIDGE_ATTACH_NO_CONNECTOR is not used and a panel is attached
>> +	 * to tc358768, 'next_bridge' contains the bridge the driver created
>> +	 * with drm_panel_bridge_add_typed(). Otherwise 'next_bridge' contains
>> +	 * the next bridge the driver found.
>> +	 */
>> +	struct drm_bridge *next_bridge;
>>   };
>>   
>>   struct tc358768_priv {
>> @@ -391,8 +400,6 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
>>   				    struct mipi_dsi_device *dev)
>>   {
>>   	struct tc358768_priv *priv = dsi_host_to_tc358768(host);
>> -	struct drm_bridge *bridge;
>> -	struct drm_panel *panel;
>>   	struct device_node *ep;
>>   	int ret;
>>   
>> @@ -420,21 +427,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
>>   		return -ENOTSUPP;
>>   	}
>>   
>> -	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel,
>> -					  &bridge);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (panel) {
>> -		bridge = drm_panel_bridge_add_typed(panel,
>> -						    DRM_MODE_CONNECTOR_DSI);
>> -		if (IS_ERR(bridge))
>> -			return PTR_ERR(bridge);
>> -	}
>> -
>>   	priv->output.dev = dev;
>> -	priv->output.bridge = bridge;
>> -	priv->output.panel = panel;
>>   
>>   	priv->dsi_lanes = dev->lanes;
>>   	priv->dsi_bpp = mipi_dsi_pixel_format_to_bpp(dev->format);
>> @@ -463,7 +456,7 @@ static int tc358768_dsi_host_detach(struct mipi_dsi_host *host,
>>   
>>   	drm_bridge_remove(&priv->bridge);
>>   	if (priv->output.panel)
>> -		drm_panel_bridge_remove(priv->output.bridge);
>> +		drm_panel_bridge_remove(priv->output.next_bridge);
>>   
>>   	return 0;
>>   }
>> @@ -544,7 +537,40 @@ static int tc358768_bridge_attach(struct drm_bridge *bridge,
>>   		return -ENOTSUPP;
>>   	}
>>   
>> -	return drm_bridge_attach(bridge->encoder, priv->output.bridge, bridge,
>> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>> +		struct device_node *node;
>> +
>> +		/* Get the next bridge, connected to port@1. */
>> +		node = of_graph_get_remote_node(priv->dev->of_node, 1, -1);
>> +		if (!node)
>> +			return -ENODEV;
>> +
>> +		priv->output.next_bridge = of_drm_find_bridge(node);
>> +		of_node_put(node);
>> +		if (!priv->output.next_bridge)
>> +			return -EPROBE_DEFER;
>> +	} else {
>> +		struct drm_bridge *bridge;
>> +		struct drm_panel *panel;
>> +		int ret;
>> +
>> +		ret = drm_of_find_panel_or_bridge(priv->dev->of_node, 1, 0,
>> +						  &panel, &bridge);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (panel) {
>> +			bridge = drm_panel_bridge_add_typed(panel,
>> +				DRM_MODE_CONNECTOR_DSI);
>> +			if (IS_ERR(bridge))
>> +				return PTR_ERR(bridge);
>> +		}
>> +
>> +		priv->output.next_bridge = bridge;
>> +		priv->output.panel = panel;
>> +	}
>> +
>> +	return drm_bridge_attach(bridge->encoder, priv->output.next_bridge, bridge,
>>   				 flags);
>>   }
>>   
>>
> This patch unfortunately breaks the display output on the Asus TF700T:
> 
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /i2c-mux/i2c@1/dsi@7 to encoder LVDS-59: -517
> tegra-dc 54200000.dc: failed to initialize RGB output: -517
> drm drm: failed to initialize 54200000.dc: -517
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 69 at lib/refcount.c:28 tegra_dc_init+0x24/0x5fc
> refcount_t: underflow; use-after-free.
> Modules linked in: elants_i2c panel_simple tc358768 atkbd vivaldi_fmap
> CPU: 3 PID: 69 Comm: kworker/u8:6 Not tainted 6.5.0-rc2-postmarketos-grate #95
> Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> Workqueue: events_unbound deferred_probe_work_func
>   unwind_backtrace from show_stack+0x10/0x14
>   show_stack from dump_stack_lvl+0x40/0x4c
>   dump_stack_lvl from __warn+0x94/0xc0
>   __warn from warn_slowpath_fmt+0x118/0x16c
>   warn_slowpath_fmt from tegra_dc_init+0x24/0x5fc
>   tegra_dc_init from host1x_device_init+0x84/0x15c
>   host1x_device_init from host1x_drm_probe+0xd8/0x3c4
>   host1x_drm_probe from really_probe+0xc8/0x2dc
>   really_probe from __driver_probe_device+0x88/0x19c
>   __driver_probe_device from driver_probe_device+0x30/0x104
>   driver_probe_device from __device_attach_driver+0x94/0x108
>   __device_attach_driver from bus_for_each_drv+0x80/0xb8
>   bus_for_each_drv from __device_attach+0xa0/0x190
>   __device_attach from bus_probe_device+0x88/0x8c
>   bus_probe_device from deferred_probe_work_func+0x78/0xa4
>   deferred_probe_work_func from process_one_work+0x208/0x420
>   process_one_work from worker_thread+0x54/0x550
>   worker_thread from kthread+0xdc/0xf8
>   kthread from ret_from_fork+0x14/0x2c
> Exception stack(0xcf9c5fb0 to 0xcf9c5ff8)
> 5fa0:                                     00000000 00000000 00000000 00000000
> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end trace 0000000000000000 ]---

Hi Maxim,

Can you try the attached patch (on top of the series)? If it helps, I'll 
refresh the series with the fix.

  Tomi

--------------Jv9QiLaHpf9XtF8lwXHmakTu
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-bridge-tc358768-fix-Add-DRM_BRIDGE_ATTACH_NO_CON.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-bridge-tc358768-fix-Add-DRM_BRIDGE_ATTACH_NO_CON.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjMTNjNjkxYmQ4ODI2Yjk3ODMyNTU3NWJlOWE4N2Y1NzdiODNiODZiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5A
aWRlYXNvbmJvYXJkLmNvbT4KRGF0ZTogTW9uLCAxNCBBdWcgMjAyMyAxMzowMjoyMyArMDMw
MApTdWJqZWN0OiBbUEFUQ0hdIGRybS9icmlkZ2U6IHRjMzU4NzY4OiBmaXggJ0FkZCBEUk1f
QlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IKIHN1cHBvcnQnCgpTaWduZWQtb2ZmLWJ5OiBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY4LmMgfCA1NiArKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMzIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1
ODc2OC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2OC5jCmluZGV4IDgyZWE0
ZDlhODE0YS4uOTcwNWNlMWJkMDI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2OC5j
CkBAIC00NTUsOCArNDU1LDYgQEAgc3RhdGljIGludCB0YzM1ODc2OF9kc2lfaG9zdF9kZXRh
Y2goc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QsCiAJc3RydWN0IHRjMzU4NzY4X3ByaXYg
KnByaXYgPSBkc2lfaG9zdF90b190YzM1ODc2OChob3N0KTsKIAogCWRybV9icmlkZ2VfcmVt
b3ZlKCZwcml2LT5icmlkZ2UpOwotCWlmIChwcml2LT5vdXRwdXQucGFuZWwpCi0JCWRybV9w
YW5lbF9icmlkZ2VfcmVtb3ZlKHByaXYtPm91dHB1dC5uZXh0X2JyaWRnZSk7CiAKIAlyZXR1
cm4gMDsKIH0KQEAgLTUzMSw0OSArNTI5LDQyIEBAIHN0YXRpYyBpbnQgdGMzNTg3NjhfYnJp
ZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCQkJCSAgZW51bSBkcm1f
YnJpZGdlX2F0dGFjaF9mbGFncyBmbGFncykKIHsKIAlzdHJ1Y3QgdGMzNTg3NjhfcHJpdiAq
cHJpdiA9IGJyaWRnZV90b190YzM1ODc2OChicmlkZ2UpOworCXN0cnVjdCBkcm1fYnJpZGdl
ICpuZXh0X2JyaWRnZTsKKwlzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbDsKKwlpbnQgcmV0Owog
CiAJaWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGJyaWRnZS0+ZGV2LCBEUklWRVJfQVRP
TUlDKSkgewogCQlkZXZfZXJyKHByaXYtPmRldiwgIm5lZWRzIGF0b21pYyB1cGRhdGVzIHN1
cHBvcnRcbiIpOwogCQlyZXR1cm4gLUVOT1RTVVBQOwogCX0KIAotCWlmIChmbGFncyAmIERS
TV9CUklER0VfQVRUQUNIX05PX0NPTk5FQ1RPUikgewotCQlzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5vZGU7Ci0KLQkJLyogR2V0IHRoZSBuZXh0IGJyaWRnZSwgY29ubmVjdGVkIHRvIHBvcnRA
MS4gKi8KLQkJbm9kZSA9IG9mX2dyYXBoX2dldF9yZW1vdGVfbm9kZShwcml2LT5kZXYtPm9m
X25vZGUsIDEsIC0xKTsKLQkJaWYgKCFub2RlKQotCQkJcmV0dXJuIC1FTk9ERVY7Ci0KLQkJ
cHJpdi0+b3V0cHV0Lm5leHRfYnJpZGdlID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKG5vZGUpOwot
CQlvZl9ub2RlX3B1dChub2RlKTsKLQkJaWYgKCFwcml2LT5vdXRwdXQubmV4dF9icmlkZ2Up
Ci0JCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKLQl9IGVsc2UgewotCQlzdHJ1Y3QgZHJtX2Jy
aWRnZSAqYnJpZGdlOwotCQlzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbDsKLQkJaW50IHJldDsK
LQotCQlyZXQgPSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UocHJpdi0+ZGV2LT5vZl9u
b2RlLCAxLCAwLAotCQkJCQkJICAmcGFuZWwsICZicmlkZ2UpOwotCQlpZiAocmV0KQotCQkJ
cmV0dXJuIHJldDsKLQotCQlpZiAocGFuZWwpIHsKLQkJCWJyaWRnZSA9IGRybV9wYW5lbF9i
cmlkZ2VfYWRkX3R5cGVkKHBhbmVsLAotCQkJCURSTV9NT0RFX0NPTk5FQ1RPUl9EU0kpOwot
CQkJaWYgKElTX0VSUihicmlkZ2UpKQotCQkJCXJldHVybiBQVFJfRVJSKGJyaWRnZSk7Ci0J
CX0KKwlyZXQgPSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UocHJpdi0+ZGV2LT5vZl9u
b2RlLCAxLCAtMSwgJnBhbmVsLAorCQkJCQkgICZuZXh0X2JyaWRnZSk7CisJaWYgKHJldCkK
KwkJcmV0dXJuIHJldDsKIAotCQlwcml2LT5vdXRwdXQubmV4dF9icmlkZ2UgPSBicmlkZ2U7
Ci0JCXByaXYtPm91dHB1dC5wYW5lbCA9IHBhbmVsOworCWlmIChwYW5lbCkgeworCQluZXh0
X2JyaWRnZSA9IGRybV9wYW5lbF9icmlkZ2VfYWRkX3R5cGVkKHBhbmVsLAorCQkJRFJNX01P
REVfQ09OTkVDVE9SX0RTSSk7CisJCWlmIChJU19FUlIobmV4dF9icmlkZ2UpKQorCQkJcmV0
dXJuIFBUUl9FUlIobmV4dF9icmlkZ2UpOwogCX0KIAorCXByaXYtPm91dHB1dC5uZXh0X2Jy
aWRnZSA9IG5leHRfYnJpZGdlOworCXByaXYtPm91dHB1dC5wYW5lbCA9IHBhbmVsOworCiAJ
cmV0dXJuIGRybV9icmlkZ2VfYXR0YWNoKGJyaWRnZS0+ZW5jb2RlciwgcHJpdi0+b3V0cHV0
Lm5leHRfYnJpZGdlLCBicmlkZ2UsCiAJCQkJIGZsYWdzKTsKIH0KIAordm9pZCB0YzM1ODc2
OF9icmlkZ2VfZGV0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCit7CisJc3RydWN0
IHRjMzU4NzY4X3ByaXYgKnByaXYgPSBicmlkZ2VfdG9fdGMzNTg3NjgoYnJpZGdlKTsKKwor
CWlmIChwcml2LT5vdXRwdXQucGFuZWwpCisJCWRybV9wYW5lbF9icmlkZ2VfcmVtb3ZlKHBy
aXYtPm91dHB1dC5uZXh0X2JyaWRnZSk7Cit9CisKIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0
YXR1cwogdGMzNTg3NjhfYnJpZGdlX21vZGVfdmFsaWQoc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSwKIAkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICppbmZvLApAQCAt
MTE1Niw2ICsxMTQ3LDcgQEAgdGMzNTg3NjhfYXRvbWljX2dldF9pbnB1dF9idXNfZm10cyhz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9i
cmlkZ2VfZnVuY3MgdGMzNTg3NjhfYnJpZGdlX2Z1bmNzID0gewogCS5hdHRhY2ggPSB0YzM1
ODc2OF9icmlkZ2VfYXR0YWNoLAorCS5kZXRhY2ggPSB0YzM1ODc2OF9icmlkZ2VfZGV0YWNo
LAogCS5tb2RlX3ZhbGlkID0gdGMzNTg3NjhfYnJpZGdlX21vZGVfdmFsaWQsCiAJLnByZV9l
bmFibGUgPSB0YzM1ODc2OF9icmlkZ2VfcHJlX2VuYWJsZSwKIAkuZW5hYmxlID0gdGMzNTg3
NjhfYnJpZGdlX2VuYWJsZSwKLS0gCjIuMzQuMQoK

--------------Jv9QiLaHpf9XtF8lwXHmakTu--
