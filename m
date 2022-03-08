Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A464D13CD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A1610E248;
	Tue,  8 Mar 2022 09:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E11310E9EC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:49:43 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3256F82DB7;
 Tue,  8 Mar 2022 10:49:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646732980;
 bh=eM7RgNn5t8kjuABSlMO1MTDyzwK/iNKTDDFq+0CxTrU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AkaA+FJjQD3MEhtRvpo0zAqinstvCW4omUbIdSQ76Xi03f5i/kQCoLbIeVODTTrz+
 DH04sDguWHCw3gnegbniddSWoci8RjrPTDHWv51dVLYJ7sup0kkOjfIHGYBGIB+qpY
 pesddaICX2X5s9PVfmuZND3q1zSY0HqOo1UJdiX8f60exBhovDwE1TNzU1ZCqX3Zji
 /c4klVnL0dVDZG2VXWUmF/EB3URjvp/4gT0O/iXqJ6vUa3T4CjcXuwDaEx/O4OAy1e
 qdh8vrJKtK2kYm5bkrqH0LiaRoZVKFX2r1kH9JQp5LwW+OOj1DHnEfRnvrgXsr4Cgd
 n6ceJQ+6Ra1dg==
Message-ID: <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
Date: Tue, 8 Mar 2022 10:49:39 +0100
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
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
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

On 3/8/22 09:03, Jagan Teki wrote:

Hi,

[...]

>> @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
>>   static int chipone_parse_dt(struct chipone *icn)
>>   {
>>          struct device *dev = icn->dev;
>> +       struct device_node *endpoint;
>>          struct drm_panel *panel;
>> +       int dsi_lanes;
>>          int ret;
>>
>>          icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
>> @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone *icn)
>>                  return PTR_ERR(icn->enable_gpio);
>>          }
>>
>> +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>> +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
>> +       icn->host_node = of_graph_get_remote_port_parent(endpoint);
>> +       of_node_put(endpoint);
>> +
>> +       if (!icn->host_node)
>> +               return -ENODEV;
> 
> The non-ports-based OF graph returns a -19 example on the Allwinner
> Display pipeline in R16 [1].
> 
> We need to have a helper to return host_node for non-ports as I have
> done it for drm_of_find_bridge.
> 
> [1] https://patchwork.amarulasolutions.com/patch/1805/

The link points to a patch marked "DO NOT MERGE", maybe that patch is 
missing the DSI host port@0 OF graph link ? Both port@0 and port@1 are 
required, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml#n53

What is "non-ports-based OF graph" ?

I don't see drm_of_find_bridge() in linux-next , what is that ?
