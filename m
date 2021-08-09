Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDBD3E452D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 14:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1EE89A14;
	Mon,  9 Aug 2021 12:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6046C89A14
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 12:04:03 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210809120401euoutp02df326b1c190ee265078627ef74da0d1e~ZoczdRe9y3101031010euoutp02B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 12:04:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210809120401euoutp02df326b1c190ee265078627ef74da0d1e~ZoczdRe9y3101031010euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1628510641;
 bh=ZpAdE0O02GcvZ0ugnxVxhHuRlenLhUmt2jo4GbG8sbM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=oxxpIbcuho+LNvtjeWlWU9DqKHXU6TDP26YD1WvdrSIXVG5SyHX3AQO10viH400T1
 eki9xflVhgjgCv8oYw79ujGSwqpEkPDtneIfraXxBC9PcRoPSR76ZQn46A0MxeR65m
 tDrRPOKFfGogLqowxmOwTrnI9loWQU/umvFtpGC4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210809120401eucas1p217f603c1dd43bd64680de3ebebb9deb6~ZoczImoc_0524405244eucas1p25;
 Mon,  9 Aug 2021 12:04:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 90.3C.56448.0B911116; Mon,  9
 Aug 2021 13:04:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210809120400eucas1p22e242ab94259e15ae4b2a644d0e9b3b6~Zocyh5FiM1682716827eucas1p2D;
 Mon,  9 Aug 2021 12:04:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210809120400eusmtrp20818b59c61857a280bc93ec96659a7ce~ZocyhAhp02777327773eusmtrp2g;
 Mon,  9 Aug 2021 12:04:00 +0000 (GMT)
X-AuditID: cbfec7f5-d53ff7000002dc80-c2-611119b03143
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 5F.59.20981.0B911116; Mon,  9
 Aug 2021 13:04:00 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210809120359eusmtip20c2fbcf0dc07ba4fd87dc508cb54b2d5~ZocxvHWs-3242032420eusmtip2o;
 Mon,  9 Aug 2021 12:03:59 +0000 (GMT)
Message-ID: <95600ccc-e252-ce41-85c0-4df74367799e@samsung.com>
Date: Mon, 9 Aug 2021 14:03:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.0
Subject: Re: [PATCH v2 0/8] drm/bridge: Make panel and bridge probe order
 consistent
Content-Language: en-GB
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, Robert
 Foss <robert.foss@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <CAMty3ZDLM0Ap4Ni+kExEgVyFw2eQygZNeTxbWjOxvE=uduVkag@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAKsWRmVeSWpSXmKPExsWy7djP87obJQUTDfacZ7LoPXeSyWL5mXXM
 Fle+vmez+LJpApvF8/nrGC1OvrnKYtE5cQm7xeVdc9gsFn7cymIx48c/RotDfdEWn2Y9ZLZY
 8XMro8XPXfNYLLa8mcjqwO+x9uN9Vo/3N1rZPe6cO8/msXPWXXaP2R0zWT0W73nJ5HFiwiUm
 jzvX9rB5bP/2gNVj3slAj/vdx5k8lky7yuax+XS1x+dNcgF8UVw2Kak5mWWpRfp2CVwZM/a2
 sxR816s4PeE1ewPjLpUuRk4OCQETie/dZ1m6GLk4hARWMErcPfiODcL5wiix7vd3VgjnM6PE
 xa3trDAtc5e8YAGxhQSWM0rs7i2FKHrPKHFlZgNYEa+AncSiA6fAbBYBFYmGy/uZIeKCEidn
 PgFrFhVIkJhw+SgjiC0sECYxY8EqdhCbWUBcounLSrBeEQFtiW8zX4OdxCxwnUVi7rUOsGY2
 AU2Jv5tvsoHYnAKBEr+bnjFDNMtLNG+dzQzSICFwjVNi84Zf7BBnu0jcWfAZ6gVhiVfHt0DF
 ZST+75zPBGHXS9xf0QLV3MEosXXDTmaIhLXEnXO/gLZxAG3QlFi/Sx8i7Cjxpu0yE0hYQoBP
 4sZbQYgb+CQmbZvODBHmlehoE4KoVpS4f3Yr1EBxiaUXvrJNYFSahRQss5C8PwvJN7MQ9i5g
 ZFnFKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmChP/zv+dQfjilcf9Q4xMnEwHmKU4GBW
 EuFdP4MvUYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvrq1r4oUE0hNLUrNTUwtSi2CyTBycUg1M
 0REuPqfY8utLzMofvJ9tKqGSwVv9mbXaOTJk01R+1x7pcFubnVuuKalcP/HeXk9n5oEd7EqM
 oamp+Zt/TFop3Kf3q/mTWuAk99ojdlrGfxdo7Lbrlp7HXXT6StLB1zOmaMUVCv7bEsMqyXyi
 pVM3fHqkFDfrq+cRFyeGydQwX5EP+ZKh/4GtyrHHQevkpoZ9hU/43dbGtLMkC1y/vCCV8WCx
 s5P5hXNLz70/lfHvs2jlywNvLIJrEzXNj4W4zjlgz7Jx5s5y06THv/fM1pr0d2HStYiq9l7J
 Mxumd1/fzvUptWLn9mtTDMunCJh9Swm1vfXh8v0w1tB7KvF6T733aDQc+vleeM9UERe/O9+U
 WIozEg21mIuKEwFSMk+wAwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleLIzCtJLcpLzFFi42I5/e/4Pd0NkoKJBpPOylr0njvJZLH8zDpm
 iytf37NZfNk0gc3i+fx1jBYn31xlseicuITd4vKuOWwWCz9uZbGY8eMfo8WhvmiLT7MeMlus
 +LmV0eLnrnksFlveTGR14PdY+/E+q8f7G63sHnfOnWfz2DnrLrvH7I6ZrB6L97xk8jgx4RKT
 x51re9g8tn97wOox72Sgx/3u40weS6ZdZfPYfLra4/MmuQC+KD2bovzSklSFjPziElulaEML
 Iz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MGXvbWQq+61WcnvCavYFxl0oXIyeH
 hICJxNwlL1i6GLk4hASWMkqsmnCPESIhLrF7/ltmCFtY4s+1LjaIoreMEs2fVoMleAXsJBYd
 OMUKYrMIqEg0XN4PFReUODnzCQuILSqQIHHg+h4wW1ggTGLGglXsIDYz0IKmLyvBekUEtCW+
 zXwNtoBZ4DaLxKemP2ANQgIdTBJtU9NAbDYBTYm/m2+ygdicAoESv5ueMUMMMpPo2trFCGHL
 SzRvnc08gVFoFpI7ZiHZNwtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIEpoZt
 x35u2cG48tVHvUOMTByMhxglOJiVRHjXz+BLFOJNSaysSi3Kjy8qzUktPsRoCgyMicxSosn5
 wOSUVxJvaGZgamhiZmlgamlmrCTOa3JkTbyQQHpiSWp2ampBahFMHxMHp1QDk+py6U8TLt7K
 v+Lu3en82chhV/eK2rXPNz1eHFNX8tvT5NxT95Cfp1t6074JZF899XmFsO51znmyq+zOcp6v
 Pvh7Sb5dwY3bVyse3dgX1tjh+uRBYZNvfrtEhmQQR2pQa4ayiYkD/8VPe1P+SXY/XH1Phdn/
 fH13hM+Rtl7LZxO9Y7916D2V/ebD38twf3mYYuAv5YfcsVOV331942Vm+6bv6hwLRd69xazO
 XzVXTXrmd27qf+EzcVnPGze7cagr37hwo+2QfaHgin2PjHKZZviVOpgY9UXbRNf5TMhwmsAf
 oDb/jLvl0w18adPDbByzL2hwVXoVxYrtr3ny43djj/Nv0Xdhj4Pep665dJ5ViaU4I9FQi7mo
 OBEAj4B3LZYDAAA=
X-CMS-MailID: 20210809120400eucas1p22e242ab94259e15ae4b2a644d0e9b3b6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210804140941eucas1p2d4d4ec491074530c714797523aec05ea
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210804140941eucas1p2d4d4ec491074530c714797523aec05ea
References: <CGME20210804140941eucas1p2d4d4ec491074530c714797523aec05ea@eucas1p2.samsung.com>
 <20210728133229.2247965-1-maxime@cerno.tech>
 <cc638e20-aa7c-7014-f70b-1bb68e629d87@samsung.com>
 <CAMty3ZDLM0Ap4Ni+kExEgVyFw2eQygZNeTxbWjOxvE=uduVkag@mail.gmail.com>
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

Hi Jagan,

W dniu 09.08.2021 o 10:00, Jagan Teki pisze:
> Hi Andrzej,
>
> On Wed, Aug 4, 2021 at 7:48 PM a.hajda <a.hajda@samsung.com> wrote:
>> Hi Maxime,
>>
>> I have been busy with other tasks, and I did not follow the list last
>> time, so sorry for my late response.
>>
>> On 28.07.2021 15:32, Maxime Ripard wrote:
>>> Hi,
>>>
>>> We've encountered an issue with the RaspberryPi DSI panel that prevented the
>>> whole display driver from probing.
>>>
>>> The issue is described in detail in the commit 7213246a803f ("drm/vc4: dsi:
>>> Only register our component once a DSI device is attached"), but the basic idea
>>> is that since the panel is probed through i2c, there's no synchronization
>>> between its probe and the registration of the MIPI-DSI host it's attached to.
>>>
>>> We initially moved the component framework registration to the MIPI-DSI Host
>>> attach hook to make sure we register our component only when we have a DSI
>>> device attached to our MIPI-DSI host, and then use lookup our DSI device in our
>>> bind hook.
>>>
>>> However, all the DSI bridges controlled through i2c are only registering their
>>> associated DSI device in their bridge attach hook, meaning with our change
>>
>> I guess this is incorrect. I have promoted several times the pattern
>> that device driver shouldn't expose its interfaces (for example
>> component_add, drm_panel_add, drm_bridge_add) until it gathers all
>> required dependencies. In this particular case bridges should defer
>> probe until DSI bus becomes available. I guess this way the patch you
>> reverts would work.
>>
>> I advised few times this pattern in case of DSI hosts, apparently I
>> didn't notice the similar issue can appear in case of bridges. Or there
>> is something I have missed???
> Look like Maxime is correct. I2C based DSI bridge will get probe
> during bridge_attach which usually called from bridge driver
> bridge_attach call. Non-I2C bridges and DSI panels will get probe
> during host.attach.
> We do get similar situation for dw-mipi-dsi bridges, where icn6211
> bridge is not I2C-based bridge and it gets probed in host_attach and
> sn65dsi83 is I2C based bridge and it gets probed in bridge_attach.
>
> Here is the simple call trace we have observed with dw-mipi-dsi bridge
> when all possible DSI device are trying to probe.
>
> 1. DSI panels and bridges will invoke the host attach
>     from probe in order to find the panel_or_bridge.
>
>     chipone_probe()
>         dw_mipi_dsi_host_attach().start
>             dw_mipi_dsi_panel_or_bridge()
>                  ...found the panel_or_bridge...
>
>     ltdc_encoder_init().start
>         dw_mipi_dsi_bridge_attach().start
>                     dw_mipi_dsi_host_attach().start
>                         chipone_attach(). start
>
>                         chipone_attach(). done
>                     dw_mipi_dsi_host_attach().done
>         dw_mipi_dsi_bridge_attach(). done
>     ltdc_encoder_init().done
>
> 2. I2C based DSI bridge will invoke the drm_bridge_attach
>     from bridge attach in order to find the panel_or_bridge.
>
>     ltdc_encoder_init().start
>         dw_mipi_dsi_bridge_attach().start
>             dw_mipi_dsi_panel_or_bridge()
>                  ...found the panel_or_bridge...
>                     dw_mipi_dsi_host_attach().start
>                         sn65dsi83_attach(). start
>
>                         sn65dsi83_attach(). done
>                     dw_mipi_dsi_host_attach().done
>         dw_mipi_dsi_bridge_attach(). done
>     ltdc_encoder_init().done
>
> It is correct that the I2C-based bridges will attach the host via
> mipi_dsi_attach in driver bridge API where as it done in probe for
> Non-I2C bridges and DSI panels.

The call order depends on the registration time of DSI host. In case of 
dw-mipi-dsi it is called from .component_bind callback (dsi_bind-> 
dsi_host_init -> mipi_dsi_host_register). And this is "the original sin" :)

dw-mipi-dsi calls component_add without prior acquiring its dependency - 
drm_bridge and before DSI host registration. In such situation bridge 
author should follow this pattern and perform similar initialization: 
first drm_bridge_add, then mipi_dsi_attach.

And now authors of bridges are in dead end in case they want their 
bridge/panel drivers cooperate with dw-mipi-dsi host (with pattern look 
for sink - bridge/panel, then register DSI bus) and with other DSI hosts 
(most of then use pattern - register DSI bus then look for the sink -  
panel or bridge).

Quick look at the DSI hosts suggests the pattern 
get-sink-then-register-bus are used only by kirin/dw_drm_dsi.c and msm/dsi.

All other DSI hosts uses apparently register-bus-then-get-sink pattern - 
as I said it was not profound analysis - just few greps of some keywords.


>> Anyway there are already eleven(?) bridge drivers using this pattern. I
>> wonder if fixing it would be difficult, or if it expose other issues???
>> The patches should be quite straightforward - move
>> of_find_mipi_dsi_host_by_node and mipi_dsi_device_register_full to probe
>> time.
>>
>> Finally I think that if we will not fix these bridge drivers we will
>> encounter another set of issues with new platforms connecting "DSI host
>> drivers assuming this pattern" and "i2c/dsi device drivers assuming
>> pattern already present in the bridges".
> Agreed, I'm trying to understand the several ways to fix this. Right
> now I'm trying this on sun6i_mipi_dsi and exynos_drm_dsi. Will let you
> know for any update and suggestions on the same.


Quick look at sun6i suggests it uses register-bus-then-get-sink pattern 
(incompatible with kirin), only issue is that currently it support only 
panel sink.

Exynos uses also register-bus-then-get-sink pattern, but it slightly 
different as it supports dynamic attach/detach of sinks.


Regards

Andrzej


>
> Thanks,
> Jagan.
>
