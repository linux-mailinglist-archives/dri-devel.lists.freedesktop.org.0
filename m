Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 264824D14C5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 11:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C0D10E3C5;
	Tue,  8 Mar 2022 10:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C0F10E3C5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 10:30:02 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 51DCF81119;
 Tue,  8 Mar 2022 11:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646735400;
 bh=MQHO1sDBT1Km0UlFvhRtba/QQjGJCnnzG420sQE0a+M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CN1dcuUaS22QA3yn6ivu4St6ebG9zaFiV/W4eCL0M+3Ml9Beg8RuNpyLR3XStXqeZ
 ropHNHxfeN7/86VUgg7hA5LWdoyN+Mpa/rFSUe10lJZChRbX/D4QcHpzdzghJARsCx
 JPHAhp/ucqbme3/hvhXmXR5VrulLHmwe/yGiYVOdp0rWAzNCRrjcZQBZ1cwIqaDHpk
 d+d/SKfebSD9yR+xWCC+16yr7LAoFnyO42PwHJdyzehWrShk80EdquoPAN4R0ZsmKD
 eMO/+kgankmwlyDOHK62oGNqC2JaLmz8A4zYP7TbSAuRMr2IRJzNgV54ZBE2HmWZsZ
 GPdJZMphQynew==
Message-ID: <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
Date: Tue, 8 Mar 2022 11:29:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/22 11:07, Jagan Teki wrote:
> On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 3/8/22 09:03, Jagan Teki wrote:
>>
>> Hi,
>>
>> [...]
>>
>>>> @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
>>>>    static int chipone_parse_dt(struct chipone *icn)
>>>>    {
>>>>           struct device *dev = icn->dev;
>>>> +       struct device_node *endpoint;
>>>>           struct drm_panel *panel;
>>>> +       int dsi_lanes;
>>>>           int ret;
>>>>
>>>>           icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
>>>> @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone *icn)
>>>>                   return PTR_ERR(icn->enable_gpio);
>>>>           }
>>>>
>>>> +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>>>> +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
>>>> +       icn->host_node = of_graph_get_remote_port_parent(endpoint);
>>>> +       of_node_put(endpoint);
>>>> +
>>>> +       if (!icn->host_node)
>>>> +               return -ENODEV;
>>>
>>> The non-ports-based OF graph returns a -19 example on the Allwinner
>>> Display pipeline in R16 [1].
>>>
>>> We need to have a helper to return host_node for non-ports as I have
>>> done it for drm_of_find_bridge.
>>>
>>> [1] https://patchwork.amarulasolutions.com/patch/1805/
>>
>> The link points to a patch marked "DO NOT MERGE", maybe that patch is
>> missing the DSI host port@0 OF graph link ? Both port@0 and port@1 are
>> required, see:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml#n53
>>
>> What is "non-ports-based OF graph" ?
>>
>> I don't see drm_of_find_bridge() in linux-next , what is that ?
> 
> port@0 is optional as some of the DSI host OF-graph represent the
> bridge or panel as child nodes instead of ports. (i think dt-binding
> has to fix it to make port@0 optional)

The current upstream DT binding document says:

     required:
       - port@0
       - port@1

So port@0 is mandatory.

So I don't think any change is needed to this patch ?

> Example OF-graph is on the commit message.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/drm_of.c?id=80253168dbfd256bca97cf7f13312863c5a7f2e5

It seems the current upstream DT bindings only support DSI hosts which 
do provide an endpoint, because port@0 is required per DT binding 
document. If you want to support the other options as listed in the 
aforementioned commit, then you would have to extend this driver and its 
bindings, but that is out of scope of this series.
