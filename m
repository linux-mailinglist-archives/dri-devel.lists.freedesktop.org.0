Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ADD40DAED
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBE46ED0E;
	Thu, 16 Sep 2021 13:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935626ED0E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631798283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zudlUcPpmqXO1ELtSdvXDQvjr95Ub/qUGFoymOui1hI=;
 b=eogGrXoAWyeo3HsbaUDI5HyqAl9PCnZBZRDX4u0rG7p9eX28Q/fYP8sJ3YYZqoPTKH26TH
 WpXGgKrv36wLf6PcQ2ybeRgVnWPRgo0xBqim16GXUy3TBn5OgZBLlUiz6OvDqBsDqsmrFO
 CUiHlupnnywGYLnvWExCNq3b0ba3+sY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-44Edv0N5Mbm6BS3_TmhipA-1; Thu, 16 Sep 2021 09:18:01 -0400
X-MC-Unique: 44Edv0N5Mbm6BS3_TmhipA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h15-20020aa7de0f000000b003d02f9592d6so5366022edv.17
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 06:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zudlUcPpmqXO1ELtSdvXDQvjr95Ub/qUGFoymOui1hI=;
 b=r65bfm5Fzc00h68cm2ZZB51Wl7TidztUluSksNGK0GDGoxfkBZZb8JrANFLRfu46Jf
 cI+9GCbya7AkuI/f79KJUKFK8iqjcxanwhIXH58Su5nxBRqOukLIK/2ViYQXiJAncqQx
 ARbPz08qYoRjYoARtWyExbtqy8Jpz0uu9OD5SjxMx3rmWYmiQ+ald/wXC2BlReiWtoyJ
 hRoem+pSmMch3c9TYwn6v21gJGp5aIQrm9QOwqK/7Ws05z05ONUWPhPq+TLMS04o3+bN
 2GssM9l8+iSHvAK+Y73YQT69X+WMTI0cQ6YbUrUHr0iUz63uS9jMpoUtmCjPo4H8sOm3
 eZ9w==
X-Gm-Message-State: AOAM532R0Dp+m43Zeu3DsoDjNO2eGmsJmgChCl/y6CUhkRkOJE0w0w6l
 u5bubHJsl5HxtFPT9cUZPQeWQa9HB/i+bg45sdRKXT7Xud6ozLmiH2I9odQdyWIGQSTonG1K55U
 P8SDA3vXpoNVMAVL1J5nHTpUl1fSB
X-Received: by 2002:a17:906:a012:: with SMTP id
 p18mr6316157ejy.331.1631798278425; 
 Thu, 16 Sep 2021 06:17:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWBRkGKncuUKY/Nw/CCd7cOKSlotyRMm3M4XYpWuf3rWMDm+sAe2rovh8e4V/V+QX9uSpEIw==
X-Received: by 2002:a17:906:a012:: with SMTP id
 p18mr6316116ejy.331.1631798278122; 
 Thu, 16 Sep 2021 06:17:58 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id n18sm1180469ejg.36.2021.09.16.06.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 06:17:57 -0700 (PDT)
Subject: Re: [PATCH 8/8] usb: typec: altmodes/displayport: Notify drm subsys
 of hotplug events
To: Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, pmalani@chromium.org,
 robh@kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
References: <20210817215201.795062-1-hdegoede@redhat.com>
 <20210817215201.795062-9-hdegoede@redhat.com>
 <CAE-0n53cRs3USijgp5nKy0KoykrNAOs90K-pMk9QBkT+qOgyHw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1b477c65-d5cd-2ece-1f60-f9a7762f07b9@redhat.com>
Date: Thu, 16 Sep 2021 15:17:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53cRs3USijgp5nKy0KoykrNAOs90K-pMk9QBkT+qOgyHw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi,

On 9/16/21 5:20 AM, Stephen Boyd wrote:
> Quoting Hans de Goede (2021-08-17 14:52:01)
>> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
>> index aa669b9cf70e..c1d8c23baa39 100644
>> --- a/drivers/usb/typec/altmodes/displayport.c
>> +++ b/drivers/usb/typec/altmodes/displayport.c
>> @@ -125,6 +129,7 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
>>  static int dp_altmode_status_update(struct dp_altmode *dp)
>>  {
>>         bool configured = !!DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
>> +       bool hpd = !!(dp->data.status & DP_STATUS_HPD_STATE);
>>         u8 con = DP_STATUS_CONNECTION(dp->data.status);
>>         int ret = 0;
>>
>> @@ -137,6 +142,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>>                 ret = dp_altmode_configure(dp, con);
>>                 if (!ret)
>>                         dp->state = DP_STATE_CONFIGURE;
>> +       } else {
>> +               if (dp->hpd != hpd) {
>> +                       drm_connector_oob_hotplug_event(dp->connector_fwnode);
>> +                       dp->hpd = hpd;
>> +               }
>>         }
>>
>>         return ret;
>> @@ -512,6 +522,7 @@ static const struct attribute_group dp_altmode_group = {
>>  int dp_altmode_probe(struct typec_altmode *alt)
>>  {
>>         const struct typec_altmode *port = typec_altmode_get_partner(alt);
>> +       struct fwnode_handle *fwnode;
>>         struct dp_altmode *dp;
>>         int ret;
>>
>> @@ -540,6 +551,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
>>         alt->desc = "DisplayPort";
>>         alt->ops = &dp_altmode_ops;
>>
>> +       fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
>> +       dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
> 
> I'm trying to figure out how to translate this over to DT bindings.

First of all let me say that it is great that people are looking
into using this functionality outside of the niche application
for which I wrote it.

> Is
> there a binding document for this fwnode reference? If not, can you
> please update
> Documentation/devicetree/bindings/connector/usb-connector.yaml with this
> property?

My use case is some Intel Cherry Trail based mini-laptops which use a
Intel Whiskey Cove PMIC with a FUSB302 Type-C controller + a
PI3USB30532 USB switch, specifically the GPD Win and GPD Pocket
(first generation of each).

These are ACPI/X86 devices so devicetree is not used there, the
connector_fwnode checked here is actually sw_node, this sw_node
reference gets setup here:

drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c

The setup/use of a sw_node reference for this was actually
designed by Heikki (in the Cc already), so he might be a better
person to answer your questions.

With that said, as to your question if I can document this in
usb-connector.yaml, no I cannot (sorry). Since this is a sw_node
setup by X86 code and not a normal devicetree fwnode reference,
atm this is purely a kernel internal API/binding really and the
DT-binding maintainers have repeatedly told me that I should NOT
submit DT-binding updates for these. Only once a real devicetree
user for this shows up will the accept DT-bindings patches for this.

The good news here though is, that if this turns out to be
non-ideal for the devicetree case we can still change things
as long as drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c
also gets updated so as to not break things.

> I think this means that the type-c node would have a 'displayport =
> <&some_phandle>' property in it that points to the display port hardware
> device that's pumping out the DisplayPort data?

It points to a fwnode belonging to the drm-connector for the DisplayPort
connector/pins to which the Type-C data-lines mux/switch is connected, see:

https://cgit.freedesktop.org/drm-misc/commit/?id=48c429c6d18db115c277b75000152d8fa4cd35d0
https://cgit.freedesktop.org/drm-misc/commit/?id=3d3f7c1e68691574c1d87cd0f9f2348323bc0199
https://cgit.freedesktop.org/drm-intel/commit/?id=a481d0e80eabbc3fed666103744aeaf47f63e708

So this get working with devicetree you would need something like this:

1. Have devicetree-node-s describing video-output connectors, similar
to how we have usb-connector nodes to describe usb-connectors

2. Have your drm/kms driver lookup these video-output-connector of_node-s
and assign them to drm_connector.fwnode, at least for the DP video-output
used.

3. Have the usb-connector node for your Type-C connector (the same of_node
as which has the source-pdos, sink-pdos, etc props) have a 
'displayport = <&some_phandle>' property pointing to the of_node for
the DP video-output used.

I hope this helps.

> 
>> +       if (IS_ERR(dp->connector_fwnode))
>> +               dp->connector_fwnode = NULL;
>> +
>>         typec_altmode_set_drvdata(alt, dp);
>>
>>         dp->state = DP_STATE_ENTER;
>> @@ -555,6 +571,13 @@ void dp_altmode_remove(struct typec_altmode *alt)
>>
>>         sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
>>         cancel_work_sync(&dp->work);
>> +
>> +       if (dp->connector_fwnode) {
>> +               if (dp->hpd)
>> +                       drm_connector_oob_hotplug_event(dp->connector_fwnode);
> 
> I was hoping that we could make a type-c connector into a drm_bridge.
> I'm thinking that it would be a DP-to-panel bridge. Then a panel could
> be created as well on the end of the type-c connector and the bridge
> would report hpd whenever the type-c logic figures out the cable has
> been connected and hpd is asserted. The actual DisplayPort hardware
> that's encoding data would then find the bridge through the graph
> binding connected to the output node.
> 
> I'm not sure how MST is handled though. In that scenario maybe there's
> more than one panel?

Yeah, given that MST over DP over Type-C is very much possible my
first instinct is that this drm_bridge + bridge-to-panel idea is
not going to work very well. Also the output could be anything, it
could be a projector, or the DP input of a video-grabber, or ...
so modelling this as a panel feels wrong.

Regards,

Hans

