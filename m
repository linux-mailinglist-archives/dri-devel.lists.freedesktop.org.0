Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6A46C4E4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026F86F99B;
	Tue,  7 Dec 2021 20:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F7F6F99B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 20:50:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5EDD9B81E7F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 20:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B28C341C3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910236;
 bh=t4W7WLRFCMi7KuAoHHK1hKDwqBoqL/ftf57pfzZ6uXc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Um0UcNUhkhE0mZmztYFvKACDBuv3AciITMaqHzfLt9dRBJnYvg57dI1VKus42UWR0
 6EwNWc+i/LKflNdrX2ec5DGDXlXGYQ/TedKpIHJzW4uou3yYusy4UVh7blUq+/qKsC
 rROvoR9VozgtL3GAeJKvb9dkPpbROeTMedBfo3vJ9mQXmNaOUKewr6pp7uPHt7K3PN
 5T6jOf4sVqQp6Bbya2fSVedaonU+ZqVm0wn+52R+eqoH01T3zrOcnyuD3JagrcUinl
 aBsDw4yPv+oL5pFgOyMSIfu3lPtOlezC3h8U6dKieybpea5XnFp3cGo13h2yipIqt0
 LoJqI1YomYKrw==
Received: by mail-ed1-f54.google.com with SMTP id l25so765870eda.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 12:50:35 -0800 (PST)
X-Gm-Message-State: AOAM533qC3voULGIBI3q+gG7OFoQ3cxX0GmBuJh4YdzP80O5N+xJWDaV
 cfk9MBWHVYch3TmOL7X0nsZDWRE+sI0pm7dP5w==
X-Google-Smtp-Source: ABdhPJyqCWEzXRI+0IE4o+5XcwEzWxwohTD5MUiMUIaaon/9Uk6EwLHcVMnOl+5ooQDfvdFe8DciNxJnxBMtnlLtoIg=
X-Received: by 2002:a17:906:bccc:: with SMTP id
 lw12mr2081418ejb.128.1638910234359; 
 Tue, 07 Dec 2021 12:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20211207054747.461029-1-jagan@amarulasolutions.com>
 <20211207054747.461029-2-jagan@amarulasolutions.com>
In-Reply-To: <20211207054747.461029-2-jagan@amarulasolutions.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 7 Dec 2021 14:50:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKj_ToLpoGR6XLgAu=+THit6jhdzAvxMiCCNmWg5zbQ0A@mail.gmail.com>
Message-ID: <CAL_JsqKj_ToLpoGR6XLgAu=+THit6jhdzAvxMiCCNmWg5zbQ0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] of: Add helper to lookup non port child node
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 6, 2021 at 11:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Add of_get_non_port_child() helper that can be used to lookup
> non port child nodes.
>
> Some OF graphs don't require 'ports' to represent the next output
> instead, it simply adds a child node on a given parent node. This
> helper lookup that child node, however that child node is not a
> 'port' on given parent as 'port' based nodes are looked up via
> of_graph_get_remote_node().
>
> Example OF graph representation of DSI host, which doesn't
> have 'ports'.

This seems pretty specific to DSI and also can't handle there being
more than 1 non-port node. That's allowed for DSI too, but I don't
think I've ever seen a case. Anyways, I'd just move this to DRM rather
than common DT code. One comment on the implementation that will
shrink it.

>
> dsi {
>         #address-cells = <1>;
>         #size-cells = <0>;
>
>         port {
>                 dsi_in_tcon0: endpoint {
>                         remote-endpoint = <tcon0_out_dsi>;
>         };
>
>         panel@0 {
>                 reg = <0>;
>         };
> };
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/of/base.c  | 29 +++++++++++++++++++++++++++++
>  include/linux/of.h |  6 ++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 61de453b885c..31bbf885b0f8 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -854,6 +854,35 @@ struct device_node *of_get_compatible_child(const struct device_node *parent,
>  }
>  EXPORT_SYMBOL(of_get_compatible_child);
>
> +/**
> + * of_get_non_port_child - Find the non port child node for a given parent
> + * @node:      parent node
> + *
> + * This function looks for child node which is not port child for given parent.
> + *
> + * Return: A node pointer if found, with refcount incremented, use
> + * of_node_put() on it when done.
> + * Returns NULL if node is not found.
> + */
> +struct device_node *of_get_non_port_child(const struct device_node *parent)
> +{
> +       struct device_node *child;
> +
> +       for_each_child_of_node(parent, child) {

for_each_available_child_of_node

> +               if (of_node_name_eq(child, "port"))
> +                       continue;
> +
> +               if (!of_device_is_available(child)) {
> +                       of_node_put(child);
> +                       continue;
> +               }
> +               break;
> +       }
> +
> +       return child;
> +}
> +EXPORT_SYMBOL(of_get_non_port_child);
> +
>  /**
>   * of_get_child_by_name - Find the child node by name for a given parent
>   * @node:      parent node
> diff --git a/include/linux/of.h b/include/linux/of.h
> index ff143a027abc..3e699becef82 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -290,6 +290,7 @@ extern struct device_node *of_get_next_child(const struct device_node *node,
>  extern struct device_node *of_get_next_available_child(
>         const struct device_node *node, struct device_node *prev);
>
> +extern struct device_node *of_get_non_port_child(const struct device_node *parent);
>  extern struct device_node *of_get_compatible_child(const struct device_node *parent,
>                                         const char *compatible);
>  extern struct device_node *of_get_child_by_name(const struct device_node *node,
> @@ -678,6 +679,11 @@ static inline bool of_have_populated_dt(void)
>         return false;
>  }
>
> +static inline struct device_node *of_get_non_port_child(const struct device_node *parent)
> +{
> +       return NULL;
> +}
> +
>  static inline struct device_node *of_get_compatible_child(const struct device_node *parent,
>                                         const char *compatible)
>  {
> --
> 2.25.1
>
