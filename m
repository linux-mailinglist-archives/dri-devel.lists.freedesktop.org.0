Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A104595DEB3
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 17:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6972110E0DD;
	Sat, 24 Aug 2024 15:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="cFm5JVq9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 343 seconds by postgrey-1.36 at gabe;
 Sat, 24 Aug 2024 15:02:31 UTC
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8378110E0DD
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 15:02:31 +0000 (UTC)
Received: from hillosipuli.retiisi.eu
 (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net
 [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Wrg4q3N4Wz49Px6;
 Sat, 24 Aug 2024 17:56:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1724511405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQWIIYVMAeV+tatKf1SJ1SHCmsqByqjTMrj5Nf+q8tg=;
 b=cFm5JVq9BU3KlZTtVW0khmzt6gmpzdGYZSdblJLQR+6n7ZvMUdNeo6S2CKZx+LFwreQV7h
 YIp6rvMddTH7uEn4W+ZewViRMFOBjKnUxDSbuGOM6FHxe0h7e1kwmDBBrucHSk+5SUn/nG
 Ab+kr0I1hD2ONrOmHwxcSwlWIU6OmjtMJTyrCnYVawdwsLKH4jL8h4E85pLLi4Z6msuV5+
 j96exCxJr/Gg1/L35N5KCGqeBrXoQi6ZKuK6n70MERTH3aDkmlqLekxweiINXgq4QYweEG
 3FnBHqmLRrr4OPE5sQCYVdKBuxl8JP3kH2mAitRUxpdq1i3WQLc35JGmWqGAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1724511405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQWIIYVMAeV+tatKf1SJ1SHCmsqByqjTMrj5Nf+q8tg=;
 b=UGJQIyVphF9iU8zRKOL3v1Bw01YgcKzBbNspOSUsIKpDrteAPiXon/z2Cm5HHwcg8siYR1
 zdDAIjbfWdBIa9V1XiWTEIbcLufK7zJ4esS8pjywpf6Po4ia5aVtDM9cbFgHz2S7V/P7t8
 rGeOFrvpBGAa3cZX37So88HbN1UHnzmycMWzOOG1iCXVooN/NdxEm8EtkY6h+LuJVmzFzy
 L4AaodwWPngU3JjDPwnjTE9T5R1XxFVn9zCeuaD0P6RFmLMw9QgqTNU26kNKhnG3gVAs7V
 nsWmvJ/UW7SHsB/5uBZbOPdxVR3nkZCxF4mw6V/U2aM5gVsJ15BLsLKDahioSw==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1724511405; a=rsa-sha256; cv=none;
 b=hOit8nkEpuVt70jDLC02XYO5oyOJKCGoSKrEKBzFh7fSAfysftDRyakSvmnwzcbTns2pT3
 +mfZ4ke1W/SWuYaZYOV1NhEaX3u4ydwV0OfIkEd987w6a3z38N8mLR31ULwoepimnsr8dz
 HO/rF79JPvB9INPzJjNZfiXqPBoqte5jfRNdNE64rqr3byGq0XRHVE3I0tIJek45+Zb7Lh
 VucGMRvs7/1Kx43oAKzswx9ZKAGdXmr46UXjmBv+pGN0RmyJz/Sy9RgQ4nMEz1Eg+J/+df
 SPb2NC0AzjB6FCYw/X1UqnByhaGXDt2XyGqnA7LgHxTlEcBIqxWhMonoF79wpQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 138F0634C93;
 Sat, 24 Aug 2024 17:56:43 +0300 (EEST)
Date: Sat, 24 Aug 2024 14:56:42 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/9] of: property: add of_graph_get_next_port()
Message-ID: <Zsn0qi8f28zdlzGp@valkosipuli.retiisi.eu>
References: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
 <874j7u8gw2.wl-kuninori.morimoto.gx@renesas.com>
 <20240811170316.GL2270@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811170316.GL2270@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Sat, 24 Aug 2024 15:37:44 +0000
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

Hi Laurent, Morimoto-san,

On Sun, Aug 11, 2024 at 08:03:16PM +0300, Laurent Pinchart wrote:
> Hi Morimoto-san,
> 
> (CC'ing Sakari)
> 
> Thank you for the patch.
> 
> On Fri, Aug 09, 2024 at 04:22:22AM +0000, Kuninori Morimoto wrote:
> > We have endpoint base functions
> > 	- of_graph_get_next_device_endpoint()
> > 	- of_graph_get_device_endpoint_count()
> > 	- for_each_of_graph_device_endpoint()
> > 
> > Here, for_each_of_graph_device_endpoint() loop finds each endpoints
> > 
> > 	ports {
> > 		port@0 {
> > (1)			endpoint {...};
> > 		};
> > 		port@1 {
> > (2)			endpoint {...};
> > 		};
> > 		...
> > 	};
> > 
> > In above case, it finds endpoint as (1) -> (2) -> ...
> > 
> > Basically, user/driver knows which port is used for what, but not in
> > all cases. For example on flexible/generic driver case, how many ports
> > are used is not fixed.
> > 
> > For example Sound Generic Card driver which is used from many venders
> > can't know how many ports are used. Because the driver is very
> > flexible/generic, it is impossible to know how many ports are used,
> > it depends on each vender SoC and/or its used board.
> > 
> > And more, the port can have multi endpoints. For example Generic Sound
> > Card case, it supports many type of connection between CPU / Codec, and
> > some of them uses multi endpoint in one port.
> > Then, Generic Sound Card want to handle each connection via "port"
> > instead of "endpoint".
> > But, it is very difficult to handle each "port" via
> > for_each_of_graph_device_endpoint(). Getting "port" by using
> > of_get_parent() from "endpoint" doesn't work. see below.
> > 
> > 	ports {
> > 		port@0 {
> > (1)			endpoint@0 {...};
> > (2)			endpoint@1 {...};
> > 		};
> > 		port@1 {
> > (3)			endpoint {...};
> > 		};
> > 		...
> > 	};
> > 
> > In the same time, same reason, we want to handle "ports" same as "port".
> > 
> > 	node {
> > =>		ports@0 {
> > 			port@0 {
> > 				endpoint@0 {...};
> > 				endpoint@1 {...};
> > 				...
> > 			};
> > 			port@1 {
> > 				endpoint@0 {...};
> > 				endpoint@1 {...};
> > 				...
> > 			};
> > 			...
> > 		};
> > =>		ports@1 {
> > 			...
> > 		};
> > 	};
> > 
> > Add "ports" / "port" base functions.
> > For above case, we can use
> > 
> > 	for_each_of_graph_ports(node, ports) {
> > 		for_each_of_graph_port(ports, port) {
> > 			...
> > 		}
> > 	}
> > 
> > This loop works in case of "node" doesn't have "ports" also.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  drivers/of/property.c    | 88 ++++++++++++++++++++++++++++++++++++++++
> >  include/linux/of_graph.h | 46 +++++++++++++++++++++
> >  2 files changed, 134 insertions(+)
> > 
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index 164d77cb9445..e4d5dfe70104 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -625,6 +625,76 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
> >  }
> >  EXPORT_SYMBOL(of_graph_get_port_by_id);
> >  
> > +/**
> > + * of_graph_get_next_ports() - get next ports node.
> > + * @parent: pointer to the parent device node
> > + * @prev: previous ports node, or NULL to get first
> > + *
> > + * If "parent" node doesn't have "ports" node, it returns "parent" node itself as "ports" node.
> > + *
> > + * Return: A 'ports' node pointer with refcount incremented. Refcount
> > + * of the passed @prev node is decremented.
> > + */
> > +struct device_node *of_graph_get_next_ports(struct device_node *parent,
> > +					    struct device_node *prev)
> > +{
> > +	if (!parent)
> > +		return NULL;
> > +
> > +	if (!prev) {
> > +		prev = of_get_child_by_name(parent, "ports");
> > +
> > +		/* use parent as its ports of this device if it not exist */
> > +		if (!prev)
> > +			prev = of_node_get(parent);
> > +
> > +		return prev;
> > +	}
> > +
> > +	do {
> > +		prev = of_get_next_child(parent, prev);
> > +		if (!prev)
> > +			break;
> > +	} while (!of_node_name_eq(prev, "ports"));
> > +
> > +	return prev;
> > +}
> > +EXPORT_SYMBOL(of_graph_get_next_ports);
> 
> Having multiple "ports" nodes in a device node is not something I've
> ever seen before. There may be use cases, but how widespread are they ?
> I would prefer handling this in driver code instead of creating a helper
> function if the use case is rare.

I wonder if this is allowed by the graph schema. Probably not.

> 
> > +
> > +/**
> > + * of_graph_get_next_port() - get next port node.
> > + * @parent: pointer to the parent device node, or parent ports node
> > + * @prev: previous port node, or NULL to get first
> > + *
> > + * Parent device node can be used as @parent whether device node has ports node or not.
> > + * It will work same as ports@0 node.
> > + *
> > + * Return: A 'port' node pointer with refcount incremented. Refcount
> > + * of the passed @prev node is decremented.
> > + */
> > +struct device_node *of_graph_get_next_port(struct device_node *parent,
> > +					   struct device_node *prev)
> > +{
> > +	if (!parent)
> > +		return NULL;
> > +
> > +	if (!prev) {
> > +		struct device_node *ports __free(device_node) =
> > +			of_graph_get_next_ports(parent, NULL);
> 
> This also makes me quite uncomfortable. Iterating over all ports of a
> device node that contains multiple "ports" children seems an ill-defined
> use case.
> 
> > +
> > +		return of_get_child_by_name(ports, "port");
> > +	}
> > +
> > +	do {
> > +		prev = of_get_next_child(parent, prev);
> > +		if (!prev)
> > +			break;
> > +	} while (!of_node_name_eq(prev, "port"));
> > +
> > +	return prev;
> > +}
> > +EXPORT_SYMBOL(of_graph_get_next_port);
> > +
> >  /**
> >   * of_graph_get_next_endpoint() - get next endpoint node
> >   * @parent: pointer to the parent device node
> > @@ -823,6 +893,24 @@ unsigned int of_graph_get_endpoint_count(const struct device_node *np)
> >  }
> >  EXPORT_SYMBOL(of_graph_get_endpoint_count);
> >  
> > +/**
> > + * of_graph_get_port_count() - get the number of port in a device node
> > + * @np: pointer to the parent device node
> > + *
> > + * Return: count of port of this device node
> > + */
> > +unsigned int of_graph_get_port_count(struct device_node *np)
> > +{
> > +	struct device_node *port = NULL;
> > +	int num = 0;
> 
> As the counter can never be negative, you can make this an unsigned int.
> 
> > +
> > +	for_each_of_graph_port(np, port)
> > +		num++;
> > +
> > +	return num;
> > +}
> > +EXPORT_SYMBOL(of_graph_get_port_count);
> > +
> >  /**
> >   * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
> >   * @node: pointer to parent device_node containing graph port/endpoint
> > diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> > index a4bea62bfa29..a6b91577700a 100644
> > --- a/include/linux/of_graph.h
> > +++ b/include/linux/of_graph.h
> > @@ -37,14 +37,41 @@ struct of_endpoint {
> >  	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
> >  	     child = of_graph_get_next_endpoint(parent, child))
> >  
> > +/**
> > + * for_each_of_graph_ports - iterate over every ports in a device node
> > + * @parent: parent device node containing ports
> > + * @child: loop variable pointing to the current ports node
> > + *
> > + * When breaking out of the loop, of_node_put(child) has to be called manually.
> > + */
> > +#define for_each_of_graph_ports(parent, child)				\
> > +	for (child = of_graph_get_next_ports(parent, NULL); child != NULL; \
> > +	     child = of_graph_get_next_ports(parent, child))
> > +
> > +/**
> > + * for_each_of_graph_port - iterate over every port in a device or ports node
> > + * @parent: parent device or ports node containing port
> > + * @child: loop variable pointing to the current port node
> > + *
> > + * When breaking out of the loop, of_node_put(child) has to be called manually.
> > + */
> > +#define for_each_of_graph_port(parent, child)			\
> > +	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
> > +	     child = of_graph_get_next_port(parent, child))
> 
> I think I've proposed something similar a looooong time ago, and was
> told that iterating over ports is not something that drivers should do.
> The situation may have changed since though.
> 
> Sakari, any opinion on this ?

It'd be good to understand first what would be the use case for it. There
is already a function to obtain endpoints within a given port, including an
fwnode equivalent.

> 
> > +
> >  #ifdef CONFIG_OF
> >  bool of_graph_is_present(const struct device_node *node);
> >  int of_graph_parse_endpoint(const struct device_node *node,
> >  				struct of_endpoint *endpoint);
> >  unsigned int of_graph_get_endpoint_count(const struct device_node *np);
> > +unsigned int of_graph_get_port_count(struct device_node *np);
> >  struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
> >  struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
> >  					struct device_node *previous);
> > +struct device_node *of_graph_get_next_ports(struct device_node *parent,
> > +					    struct device_node *ports);
> > +struct device_node *of_graph_get_next_port(struct device_node *parent,
> > +					   struct device_node *port);
> >  struct device_node *of_graph_get_endpoint_by_regs(
> >  		const struct device_node *parent, int port_reg, int reg);
> >  struct device_node *of_graph_get_remote_endpoint(
> > @@ -73,6 +100,11 @@ static inline unsigned int of_graph_get_endpoint_count(const struct device_node
> >  	return 0;
> >  }
> >  
> > +static inline unsigned int of_graph_get_port_count(struct device_node *np)
> > +{
> > +	return 0;
> > +}
> > +
> >  static inline struct device_node *of_graph_get_port_by_id(
> >  					struct device_node *node, u32 id)
> >  {
> > @@ -86,6 +118,20 @@ static inline struct device_node *of_graph_get_next_endpoint(
> >  	return NULL;
> >  }
> >  
> > +static inline struct device_node *of_graph_get_next_ports(
> > +					struct device_node *parent,
> > +					struct device_node *previous)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static inline struct device_node *of_graph_get_next_port(
> > +					struct device_node *parent,
> > +					struct device_node *previous)
> > +{
> > +	return NULL;
> > +}
> > +
> >  static inline struct device_node *of_graph_get_endpoint_by_regs(
> >  		const struct device_node *parent, int port_reg, int reg)
> >  {
> 

-- 
Kind regards,

Sakari Ailus
