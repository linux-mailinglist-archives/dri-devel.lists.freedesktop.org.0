Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057BB417E33
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 01:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8E46EE94;
	Fri, 24 Sep 2021 23:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F3C6E2A3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 23:29:38 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 s36-20020a05683043a400b0054d4c88353dso4431309otv.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 16:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KO/CabPuiXFYnZa9iBglJ3138h8B98Ui/4zI5/2sqsk=;
 b=SODtg8OIsqHbvJ50Z3qFqh94Tb/naSmW2y3VEKwEud+ZJWSP4iexSipSjkP9/sg8MG
 JLyF2sawmXGsaOExAY5IpnGyxphi5ZSg/IzFiTh7ubJbMdhu52fMEN+LQYE7k4eaSndJ
 N7hPJYka6/+2FzlATDvlyaqD5QJX/O5eK7+mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KO/CabPuiXFYnZa9iBglJ3138h8B98Ui/4zI5/2sqsk=;
 b=582+yVKSrLSQNm4R9YyUnHucK3e1aeJYkOJTfbchHGRB36CIhbc1b56Ql8Y0PnxZli
 y4bVVFs4uon69pmwRI7Y+sr5brCWUB8FSyJsmj74mLjKnIxJR2hkUWC4ocgcp6mynL7y
 Wh8sVuqKt+br1WY/6H2ptb6EcOXor+OtEiuuJ9jmL60Qho9cpmmikawQlgg7/yDQW1tS
 ce5nK23xz5JL6V5zoHenjFjCMPFY0imFJSFuXL/t2B5JWx1lmRJxMYTQW1mK9ffU9Orf
 1t84IY4OJLErqx+1Gtkr+vGe0gdpPpvfUXNjzl4aCJmbitztnvMzEykR+iHwElAOqPCD
 4xhQ==
X-Gm-Message-State: AOAM531QaIQ+STZcFPPOTmTtKrnlNcaB2ldQaNWd1r9XvH/FQymEoIvz
 HRkewOgsAtfbzJnNPFkTxkGANcsHlZS/FnLUFi8tjg==
X-Google-Smtp-Source: ABdhPJwlAszEzZB2TV1RCUzR+4m+DZq43dZbjDKAekfKdsfJvgOSYj+F6NoJgYZfE/Q621NGQ0Q0a8WaLAiueCEHtYU=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr6376247otn.126.1632526177229; 
 Fri, 24 Sep 2021 16:29:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Sep 2021 16:29:36 -0700
MIME-Version: 1.0
In-Reply-To: <1b477c65-d5cd-2ece-1f60-f9a7762f07b9@redhat.com>
References: <20210817215201.795062-1-hdegoede@redhat.com>
 <20210817215201.795062-9-hdegoede@redhat.com>
 <CAE-0n53cRs3USijgp5nKy0KoykrNAOs90K-pMk9QBkT+qOgyHw@mail.gmail.com>
 <1b477c65-d5cd-2ece-1f60-f9a7762f07b9@redhat.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 24 Sep 2021 16:29:36 -0700
Message-ID: <CAE-0n51chKmcnNX=RLw1a=zkXdB1xgZtGQQFnDWeEb_8et6jBw@mail.gmail.com>
Subject: Re: [PATCH 8/8] usb: typec: altmodes/displayport: Notify drm subsys
 of hotplug events
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Hans de Goede <hdegoede@redhat.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Lyude <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 pmalani@chromium.org, robh@kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
 linux-usb@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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

(Sorry for the slow reply)

Quoting Hans de Goede (2021-09-16 06:17:56)
> Hi,
>
> On 9/16/21 5:20 AM, Stephen Boyd wrote:
> > Quoting Hans de Goede (2021-08-17 14:52:01)
> >> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> >> index aa669b9cf70e..c1d8c23baa39 100644
> >> --- a/drivers/usb/typec/altmodes/displayport.c
> >> +++ b/drivers/usb/typec/altmodes/displayport.c
> >> @@ -125,6 +129,7 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
> >>  static int dp_altmode_status_update(struct dp_altmode *dp)
> >>  {
> >>         bool configured = !!DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
> >> +       bool hpd = !!(dp->data.status & DP_STATUS_HPD_STATE);
> >>         u8 con = DP_STATUS_CONNECTION(dp->data.status);
> >>         int ret = 0;
> >>
> >> @@ -137,6 +142,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> >>                 ret = dp_altmode_configure(dp, con);
> >>                 if (!ret)
> >>                         dp->state = DP_STATE_CONFIGURE;
> >> +       } else {
> >> +               if (dp->hpd != hpd) {
> >> +                       drm_connector_oob_hotplug_event(dp->connector_fwnode);
> >> +                       dp->hpd = hpd;
> >> +               }
> >>         }
> >>
> >>         return ret;
> >> @@ -512,6 +522,7 @@ static const struct attribute_group dp_altmode_group = {
> >>  int dp_altmode_probe(struct typec_altmode *alt)
> >>  {
> >>         const struct typec_altmode *port = typec_altmode_get_partner(alt);
> >> +       struct fwnode_handle *fwnode;
> >>         struct dp_altmode *dp;
> >>         int ret;
> >>
> >> @@ -540,6 +551,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
> >>         alt->desc = "DisplayPort";
> >>         alt->ops = &dp_altmode_ops;
> >>
> >> +       fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
> >> +       dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
> >
> > I'm trying to figure out how to translate this over to DT bindings.
>
> First of all let me say that it is great that people are looking
> into using this functionality outside of the niche application
> for which I wrote it.

Glad to hear it! This sort of thing is the norm on ARM based SoCs. I
rarely ever see the HPD pin actually connected to the GPU/DPU hardware.
It almost always goes through some other chip and then software has to
deal with it by looking at the gpio or external hardware block, etc.

>
> > Is
> > there a binding document for this fwnode reference? If not, can you
> > please update
> > Documentation/devicetree/bindings/connector/usb-connector.yaml with this
> > property?
>
> My use case is some Intel Cherry Trail based mini-laptops which use a
> Intel Whiskey Cove PMIC with a FUSB302 Type-C controller + a
> PI3USB30532 USB switch, specifically the GPD Win and GPD Pocket
> (first generation of each).
>
> These are ACPI/X86 devices so devicetree is not used there, the
> connector_fwnode checked here is actually sw_node, this sw_node
> reference gets setup here:
>
> drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c
>
> The setup/use of a sw_node reference for this was actually
> designed by Heikki (in the Cc already), so he might be a better
> person to answer your questions.

Ok, thanks for the background.

>
> With that said, as to your question if I can document this in
> usb-connector.yaml, no I cannot (sorry). Since this is a sw_node
> setup by X86 code and not a normal devicetree fwnode reference,
> atm this is purely a kernel internal API/binding really and the
> DT-binding maintainers have repeatedly told me that I should NOT
> submit DT-binding updates for these. Only once a real devicetree
> user for this shows up will the accept DT-bindings patches for this.
>
> The good news here though is, that if this turns out to be
> non-ideal for the devicetree case we can still change things
> as long as drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c
> also gets updated so as to not break things.

I see. At least there's an escape hatch.

>
> > I think this means that the type-c node would have a 'displayport =
> > <&some_phandle>' property in it that points to the display port hardware
> > device that's pumping out the DisplayPort data?
>
> It points to a fwnode belonging to the drm-connector for the DisplayPort
> connector/pins to which the Type-C data-lines mux/switch is connected, see:
>
> https://cgit.freedesktop.org/drm-misc/commit/?id=48c429c6d18db115c277b75000152d8fa4cd35d0
> https://cgit.freedesktop.org/drm-misc/commit/?id=3d3f7c1e68691574c1d87cd0f9f2348323bc0199
> https://cgit.freedesktop.org/drm-intel/commit/?id=a481d0e80eabbc3fed666103744aeaf47f63e708
>
> So this get working with devicetree you would need something like this:
>
> 1. Have devicetree-node-s describing video-output connectors, similar
> to how we have usb-connector nodes to describe usb-connectors
>
> 2. Have your drm/kms driver lookup these video-output-connector of_node-s
> and assign them to drm_connector.fwnode, at least for the DP video-output
> used.
>
> 3. Have the usb-connector node for your Type-C connector (the same of_node
> as which has the source-pdos, sink-pdos, etc props) have a
> 'displayport = <&some_phandle>' property pointing to the of_node for
> the DP video-output used.
>
> I hope this helps.

Yep. For DT we already have a graph binding to show the output of the
display hardware (DPU). Right now it's not connected to anything though.

I'm currently thinking that a clean solution is to connect that graph
endpoint to some mux node and then have the mux node connect to each
type-c node. Then a driver that registers the mux and type-c connectors
can generate a drm_bridge instance (or instances) and drm can chain them
all together by walking the graph and connecting the DPU to the mux
bridge and then each type-c connector's bridge. I don't know how a mux
would work in the drm bridge design, so either that becomes a first
class type of operation or we register two bridges in the mux driver and
mux in the backend.

This feels similar to how we handle DSI-to-eDP bridges, except that the
end of the bridge chain is a type-c connector that could have MST to
deal with. I'm not super familiar with MST but maybe MST could also
become bridge aware and then we wouldn't have to do anything special.
I'll cross that bridge when I come to it.

I image the DPU would search the graph for a panel and then if there
isn't a panel downstream I think it would make one up, or do nothing?
I'm not very sure about this part either.

Anyway, I'm going to try to prototype out some code to do this unless
someone wants to say it's a terrible idea. Let me know.

>
> >
> >> +       if (IS_ERR(dp->connector_fwnode))
> >> +               dp->connector_fwnode = NULL;
> >> +
> >>         typec_altmode_set_drvdata(alt, dp);
> >>
> >>         dp->state = DP_STATE_ENTER;
> >> @@ -555,6 +571,13 @@ void dp_altmode_remove(struct typec_altmode *alt)
> >>
> >>         sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
> >>         cancel_work_sync(&dp->work);
> >> +
> >> +       if (dp->connector_fwnode) {
> >> +               if (dp->hpd)
> >> +                       drm_connector_oob_hotplug_event(dp->connector_fwnode);
> >
> > I was hoping that we could make a type-c connector into a drm_bridge.
> > I'm thinking that it would be a DP-to-panel bridge. Then a panel could
> > be created as well on the end of the type-c connector and the bridge
> > would report hpd whenever the type-c logic figures out the cable has
> > been connected and hpd is asserted. The actual DisplayPort hardware
> > that's encoding data would then find the bridge through the graph
> > binding connected to the output node.
> >
> > I'm not sure how MST is handled though. In that scenario maybe there's
> > more than one panel?
>
> Yeah, given that MST over DP over Type-C is very much possible my
> first instinct is that this drm_bridge + bridge-to-panel idea is
> not going to work very well. Also the output could be anything, it
> could be a projector, or the DP input of a video-grabber, or ...
> so modelling this as a panel feels wrong.

Agreed. I suppose making a panel in the connector is the wrong
direction, but making a bridge there should be OK.
