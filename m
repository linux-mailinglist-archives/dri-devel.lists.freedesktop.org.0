Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC19B8661
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 23:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645B510E945;
	Thu, 31 Oct 2024 22:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eFB4shO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAFD10E945
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 22:54:53 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539e3f35268so1870950e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 15:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730415291; x=1731020091; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2xfjHXyb5eaHTGVlXfFi968g4q6zA2j3OKWo/NXVyLM=;
 b=eFB4shO6n44n510nabGqcuLVhWrhDlU7ucrIjddERSrURHSfT3E2dsd6eoKr0AFZ5u
 bBFhPx1A42J1DYHrQCAgZxXDIIfZEfpVQxTzPmp2MQUuZ/28/xvlPhJipGetgQ5DDg0D
 nG3pfSIx0waHlMNVhbOCeXF3RS/FLNy6G9NsL+Ju6LSWbFVZ5GlS8ADSXSOZehprDvxr
 SdrTjaRLnnkjiQZ6cuZyY7p+1ZGuOrLFd08rRKojdsQust7b3PSvD9b+oe1PmiiKyTRY
 NqSG6qUAwiv74ESly/steR7dTt9Qv6VI2hYjoHm0fYjKPo+mccTjHlwKacsaxaiPKZoV
 aEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730415291; x=1731020091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2xfjHXyb5eaHTGVlXfFi968g4q6zA2j3OKWo/NXVyLM=;
 b=VhmrBXN9UpKqQbp0IdDZGTXJjsZKdPIjrP35CSEmU5/AvpuOMjVMX2gOpChmbjQoGA
 STsm2diNBFU8PTiQ1+EzFo+m1eCxoUS4wEUyolEc2CFu15JKZPCmrWBL+Ue5t3UZkCKm
 l/ZLWtmoTAD1XmIvqHzVr+mnNjb0XRLzNoISZrPj1yHT8Jb1s50SOo87QRv1u5nd5QQW
 SPU2iST/cU3vDakCvzq0l/0EQcuDU2kY9rN+m2S6g1kgiiu4Y87OyQm+xWP/cPW7g+oY
 tCb8hSV2AtunpO7195IcTzNTLDi++mCYuppC6QhzApmFTEkDSwbr9/mywmLH3ntoT7+q
 2SZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA/IQjXrV+piF7/7q74bZMQmhnXCmkgW+2b3vhQu4GTIRwtuutn19Zd00APhq20cr4TkKPsUMGYnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvbD1LltU0iMp8N0Q9plI5rf7Z0jUs9KiYDwNU4nXkGK/Z3sKY
 rBdCxB9chFAArLyjGbgijPHGgxt/XYDZRHTTffL+HTTtn42XuT51JF0FzevUGxM=
X-Google-Smtp-Source: AGHT+IFPpRVk+mVtirKf0Jlz98/n7f35BC4uMgBDb7CL//fsMETaxYe+5vZzwJgBgkvRqyECZwvNrA==
X-Received: by 2002:ac2:4c46:0:b0:52b:de5b:1b30 with SMTP id
 2adb3069b0e04-53d65e1a5e7mr872060e87.44.1730415291364; 
 Thu, 31 Oct 2024 15:54:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9bee0sm354438e87.79.2024.10.31.15.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 15:54:50 -0700 (PDT)
Date: Fri, 1 Nov 2024 00:54:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, 
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 15/18] dt-bindings: usb: Add ports to
 google,cros-ec-typec for DP altmode
Message-ID: <gstohhcdnmnkszk4l2ikd5xiewtotgo5okia62paauj6zpaw7y@4wchyvoynm2p>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-16-swboyd@chromium.org>
 <phdcjgqqpjpruxp7v2mw446q73xr3eg4wfgfbjw5tasgr2pgg2@77swbk47b2tg>
 <CAE-0n514QMaQC2yjKP8bZqyfbv6B3AQm=+NJ87vxo6NdYiL03A@mail.gmail.com>
 <lf7y7wpuca6kzqcglgs5d443iusf7xjocum4adi7t3npfavccx@zgsp37oyztme>
 <CAE-0n53-KmOS3zXmJPvOOZ7xxkek9-S=oBExgaY0PDnt_HjdNw@mail.gmail.com>
 <yk3xidaisbd56yndaucax7otijjauqmm7lqm6q4q633kdawlqo@qaq27lwxmvwd>
 <CAE-0n501j+8bMnMKabFyZjn+MLUy3Z68Hiv1PsfW0APy5ggN8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n501j+8bMnMKabFyZjn+MLUy3Z68Hiv1PsfW0APy5ggN8g@mail.gmail.com>
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

On Thu, Oct 31, 2024 at 02:45:29PM -0700, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2024-10-31 11:42:36)
> > On Tue, Oct 29, 2024 at 01:15:51PM -0700, Stephen Boyd wrote:
> > > At this point we need to tell the DP bridge, like IT6505, that it's one
> > > or the other output endpoints that it should use, but we haven't
> > > directly connected the usb-c-connector to the output ports of IT6505
> > > because drm_of_find_panel_or_bridge() can't find the parent of the
> > > usb-c-connector if we connect the DP bridge to the usb-c-connector
> > > graphs. We'll need a way for the bridge to know which output port is
> > > connected to a usb-c-connector fwnode. Some sort of API like
> >
> > I think that the final bridge should be the IT6505. It can save you from
> > some troubles, like the inter-bridge lane negotiation. Please remember
> > that using lanes 2-3 as primary lanes doesn't seem to fall into the
> > standard DisplayPort usage. It is documented by USB-C and only because
> > of the orientation switching.
> 
> If the final bridge is IT6505 then drm_of_find_panel_or_bridge() isn't
> called and I think we're OK. But then we have to traverse the
> remote-endpoint of the usb-c-connector to IT6505 in displayport.c in the
> Corsola case while knowing to look at the parent of the usb-c-connector
> node and traversing the remote-endpoint to the QMP phy in the Trogdor
> case. The logic in dp_altmode_probe() is like
> 
>   if (port@1/endpoint@1 exists in usb-c-connector)
>     connector_fwnode = port@1/endpoint@1/remote-endpoint
>   else if (cros-ec-typec/port exists)
>     connector_fwnode = cros-ec-typec/port@0/endpoint/remote-endpoint
>   else
>     original stuff

I'd say, definitely ugh. Maybe we can add the swnode with the
"displayport" property pointing back to the DP bridge / endpoint.

But... read below.

> If we have the crazy three usb-c-connector design it can still work
> because we'd have something like
> 
>   cros-ec-typec {
>     port {
>       dp_endpoint: endpoint {
>         remote-endpoint = <&dp_ml0_ml1>;
>       };
>     };
> 
>     usb-c-connector@0 {
>       port@1 {
>         endpoint {
>           remote-endpoint = <&hub_ss0>;
>        };
>        // Implicitly dp_ml0_ml1
>       };
>     };
>     usb-c-connector@1 {
>       port@1 {
>         endpoint@0 {
>           remote-endpoint = <&hub_ss1>;
>         };
>         endpoint@1 {
>           remote-endpoint = <&dp_ml2_ml3>;
>         };
>       };
>     };
>     usb-c-connector@2 {
>       port@1 {
>         endpoint {
>           remote-endpoint = <&hub_ss2>;
>         };
>        // Implicitly dp_ml0_ml1
>       };
>     };
>   };
> 
> (I like thinking about this 3 connector case because it combines both
> Trogdor and Corsola designs so I can talk about both cases at the same
> time)
> 
> I don't know what happens when we have 4 connectors though, with 2 going
> to one pair of lanes and 2 going to the other 2 lanes. Maybe it's better
> to always have a DP input port in cros-ec-typec to avoid this problem
> and map back to the endpoint explicitly.
> 
>   cros-ec-typec {
>     port {
>       dp_endpoint0: endpoint@0 {
>         remote-endpoint = <&dp_ml0_ml1>;
>       };
>       dp_endpoint1: endpoint@1 {
>         remote-endpoint = <&dp_ml2_ml3>;
>       };
>     };
> 
>     usb-c-connector@0 {
>       port@1 {
>         endpoint@0 {
>           remote-endpoint = <&hub_ss0>;
>        };
>        endpoint@1 {
>          remote-endpoint = <&dp_endpoint0>;
>        };
>       };
>     };
>     usb-c-connector@1 {
>       port@1 {
>         endpoint@0 {
>           remote-endpoint = <&hub_ss1>;
>         };
>         endpoint@1 {
>           remote-endpoint = <&dp_endpoint1>;
>         };
>       };
>     };
>     usb-c-connector@2 {
>       port@1 {
>         endpoint@0 {
>           remote-endpoint = <&hub_ss2>;
>         };
>         endpoint@1 {
>           remote-endpoint = <&dp_endpoint1>;
>         };
>       };
>     };
>   };
> 
> Or use a displayport property that goes to connector node itself so that
> we don't extend the graph binding of the usb-c-connector.
> 
>   cros-ec-typec {
>     usb-c-connector@0 {
>       altmodes {
>         displayport {
>           connector = <&dp_ml0_ml1>;

I think this has been frowned upon. Not exactly this, but adding the
displayport = <&foo>.

Thus it can only go to the swnode that is generated in software by the
cros-ec driver.

>         };
>       };
>       port@1 {
>         endpoint@0 {
>           remote-endpoint = <&hub_ss0>;
>        };
>       };
>     };
>     usb-c-connector@1 {
>       altmodes {
>         displayport {
>           connector = <&dp_ml2_ml3>;
>         };
>       };
>       port@1 {
>         endpoint {
>           remote-endpoint = <&hub_ss1>;
>         };
>       };
>     };
>     usb-c-connector@2 {
>       altmodes {
>         displayport {
>           connector = <&dp_ml2_ml3>;
>         };
>       };
>       port@1 {
>         endpoint {
>           remote-endpoint = <&hub_ss2>;
>         };
>       };
>     };
>   };
> 
>   it6505 {
>     ports {
>       port@1 {
>         dp_ml0_ml1: endpoint@0 {
>           remote-endpoint = <??>;
>         };
>         dp_ml2_ml3: endpoint@1 {
>           remote-endpoint = <??>;
>         };
>       };
>     };
>   };
> 
> The logic could look at a node like usb-c-connector@2, find
> altmodes/display node, and look for a 'connector' property that points
> at the endpoint of the last bridge. If we don't use the OF graph binding
> it makes it easier to point at the same endpoint in the QMP phy or the
> IT6505 graph from more than one usb-c-connector. This also makes it very
> clear that we intend to pass that fwnode as the 'connector_fwnode' to
> oob_hotplug_event().
> 
> If we want to actually populate the 'remote-endpoint' property of IT6505
> we will need to make a graph in cros-ec-typec.
> 
>   cros-ec-typec {
>     port {
>       dp_endpoint0: endpoint@0 {
>         remote-endpoint = <&dp_ml0_ml1>;
>       };
>       dp_endpoint1: endpoint@1 {
>         remote-endpoint = <&dp_ml2_ml3>;
>       };
>     };
>     usb-c-connector@0 {
>       altmodes {
>         displayport {
>           connector = <&dp_endpoint0>;
>         };
>       };
>       port@1 {
>         endpoint@0 {
>           remote-endpoint = <&hub_ss0>;
>        };
>       };
>     };
>     usb-c-connector@1 {
>       altmodes {
>         displayport {
>           connector = <&dp_endpoint1>;
>         };
>       };
>       port@1 {
>         endpoint {
>           remote-endpoint = <&hub_ss1>;
>         };
>       };
>     };
>     usb-c-connector@2 {
>       altmodes {
>         displayport {
>           connector = <&dp_endpoint1>;
>         };
>       };
>       port@1 {
>         endpoint {
>           remote-endpoint = <&hub_ss2>;
>         };
>       };
>     };
>   };
> 
>   it6505 {
>     ports {
>       port@1 {
>         dp_ml0_ml1: endpoint@0 {
>           remote-endpoint = <dp_endpoint0>;
>         };
>         dp_ml2_ml3: endpoint@1 {
>           remote-endpoint = <dp_endpoint1>;
>         };
>       };
>     };
>   };
> 
> and then the logic in displayport.c will have to check if the
> 'connector' property points at a graph endpoint, traverse that to the
> remote-endpoint, and consider that the connector_fwnode.
> 
> >
> > Maybe that's just it? Register DP_bridge (or QMP PHY) as
> > orientation-switch? Then you don't need any extra API for the lane
> > mapping? The cross-ec-typec can provide orientation information and the
> > USB-C-aware controller will follow the lane mapping.
> 
> I'm not really following but I don't think the DT binding discussed here
> prevents that.

I'm thinking about:

it6505 {
  orientation-switch;

  ports {
    port@1 {
      it6505_dp_out: remote-endpoint = <&cros_ec_dp>;
      data-lanes = <0 1>;
    };
  };
};

cros-ec {
  port {
    cross_ec_dp: remote-endpoint = <&it6505_dp_out>;
  };

  connector@0 {
    reg = <0>;
    cros,dp-orientation = "normal";

    ports {
      // all USB HS and SS ports as usual;
    };
  };

  connector@1 {
    reg = <1>;
    cros,dp-orientation = "reverse";

    ports {
      // all USB HS and SS ports as usual;
    };
  };

  connector@2 {
    reg = <2>;
    cros,dp-orientation = "reverse";

    ports {
      // all USB HS and SS ports as usual;
    };
  };

  connector@3 {
    reg = <3>;
    cros,dp-orientation = "normal";

    ports {
      // all USB HS and SS ports as usual;
    };
  };
};

The cros-ec registers single drm bridge which will generate HPD events
except on Trogdor, etc. At the same time, cros-ec requests the
typec_switch_get(). When the cros-ec detects that the connector@N it
being used for DP, it just generates corresponding typec_switch_set()
call, setting the orientation of the it6505 (or QMP PHY). The rest can
be handled either by EC's HPD code or by DP's HPD handler, the
orientation should already be a correct one.

So, yes. It requires adding the typec_switch_desc implementation _in_
the it6505 (or in any other component which handles the 0-1 or 2-3
selection). On the other hand as I wrote previously, the 0-1 / 2-3 is
the USB-C functionality, not the DP one.

[...]

> 
> >
> > > > > Corsola could work with this design, but we'll need to teach
> > > > > dp_altmode_probe() to look for the drm_bridge elsewhere besides as the
> > > > > parent of the usb-c-connector node. That implies using the 'displayport'
> > > > > property in the cros-ec-typec node or teaching dp_altmode_probe() to
> > > > > look for the port@1/endpoint@1 remote-endpoint handle in the
> > > > > usb-c-connector graph.
> > > > >
> > > > > Assuming the bindings you've presented here are fine and good and I got
> > > > > over the differences between Trogdor and Corsola, then I can make mostly
> > > > > everything work with the drm_connector_oob_hotplug_event() signature
> > > > > change from above and some tweaks to dp_altmode_probe() to look for
> > > > > port@1/endpoint@1 first because that's the "logical" DP input endpoint
> > > > > in the usb-c-connector binding's graph. Great! The final roadblock I'm
> > > > > at is that HPD doesn't work on Trogdor, so I can't signal HPD through
> > > > > the typec framework.
> > > >
> > > > Hmm, I thought that a normal DP's HPD GPIO works on the trogdor. Was I
> > > > misunderstanding it? But then we don't know, which USB-C connector
> > > > triggered the HPD...
> > >
> > > By HPD not working on Trogdor I mean that the EC doesn't tell the kernel
> > > about the state of HPD for a usb-c-connector in software. Instead, HPD
> > > is signaled directly to the DP controller in hardware via a GPIO. It is
> > > as you suspect, we don't know which USB-C connector has HPD unless we
> > > read the mux controlled by the EC and combine that with what the DP
> > > driver knows about the state of the HPD pin.
> >
> > I see. So the HPD event gets delivered to the DP controller, but we
> > really need some API to read the port? If it's not the
> > orientation-switch, of course.
> 
> Yes. This is needed to understand what USB type-c connector the DP
> signals should go to. In the case of Corsola/IT6505 it's needed to know
> which two lanes should be sent if both type-c connectors/ports are
> capable of DP altmode. On Corsola, the EC could tell the kernel that
> both ports are in DP altmode but the EC is also controlling the AUX
> channel mux that decides which usb-c-connector type-c port is actually
> displaying DP.

-- 
With best wishes
Dmitry
