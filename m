Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1721720E36
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 08:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09A510E060;
	Sat,  3 Jun 2023 06:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E1C10E060
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jun 2023 06:52:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39F4961028;
 Sat,  3 Jun 2023 06:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7248C433D2;
 Sat,  3 Jun 2023 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685775176;
 bh=Dtp7yfw3yIgpqLiDkFokEpEEdCuCwpELzyb1JLQqmrw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TE06WsU3DCFbMrsqZlqF429AXurYRJfP/0Zv2ohSLs8375orVlB58ve3KTVMOKmbS
 PiSGZynui9JnJg3B0/YZWpIZNRBhfGEOFp5rVJeK0fJRGDREg6nyecUN+4NutKmEQn
 tWlwAcdAaynyHoVkcXLssxpGSI5ieYElOSfvkBonjBHaFxvZbisr8nwO2ZFMk+7oMs
 IfxML+cV2NVqDTx8M9FPI+0b+YW1dc3EemFN7SKx7Npi+s7qViK6ohzl9PT3FJneS4
 JB5fK5J42HHHgWuz4xmEC9Rh2kZXRiWuUndyPJqFmZ9i9kDnfl54QUS0S+KfKmOB+d
 eVh/BEjikHwZA==
Date: Fri, 2 Jun 2023 23:52:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v6 3/6] net: bcmasp: Add support for ASP2.0
 Ethernet controller
Message-ID: <20230602235254.61798d80@kernel.org>
In-Reply-To: <1685657551-38291-4-git-send-email-justin.chen@broadcom.com>
References: <1685657551-38291-1-git-send-email-justin.chen@broadcom.com>
 <1685657551-38291-4-git-send-email-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, edumazet@google.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, simon.horman@corigine.com,
 christian.koenig@amd.com, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  1 Jun 2023 15:12:28 -0700 Justin Chen wrote:
> +	ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
> +	if (!ports_node) {
> +		dev_warn(dev, "No ports found\n");
> +		return 0;
> +	}
> +
> +	for_each_available_child_of_node(ports_node, intf_node) {
> +		of_property_read_u32(intf_node, "reg", &port);
> +		if (!bcmasp_is_port_valid(priv, port)) {
> +			dev_warn(dev, "%pOF: %d is an invalid port\n",
> +				 intf_node, port);
> +			continue;
> +		}
> +
> +		priv->intf_count++;
> +	}

I think that you're leaking ports_node,

/**
 * of_find_node_by_name - Find a node by its "name" property
 * @from:	The node to start searching from or NULL; the node
 *		you pass will not be searched, only the next one
 *		will. Typically, you pass what the previous call
 *		returned. of_node_put() will be called on @from.
 * @name:	The name string to match against
 *
 * Return: A node pointer with refcount incremented, use
 * of_node_put() on it when done.
 */

-- 
pw-bot: cr
