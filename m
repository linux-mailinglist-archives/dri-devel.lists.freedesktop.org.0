Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E62DC22E14
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 02:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1C610EA9A;
	Fri, 31 Oct 2025 01:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ECig/X6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C9110EA90;
 Fri, 31 Oct 2025 01:32:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 141E544379;
 Fri, 31 Oct 2025 01:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E437C4CEFD;
 Fri, 31 Oct 2025 01:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761874375;
 bh=vG4QVxaZrj4g0pfxP53JLWo5Bh5KaxbKi0oqTA2ebtY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ECig/X6ZYp3mulN05mllV6aBbb1Jv42XcnCI8aYHyIIHSbLIc+Oq1WwXNp6QH6JVp
 JK1+uw2rkspYMbvfPa8p2X75rNhfD0iNjUZC+7LAXzbz7KvaQjVMr8/0csNhMnEZkn
 MfQ35svbfkeNqDVvwR7VeuF9jUoZx3Gz5UsWzQ+YmYatqvihEj5TGXAAcpaf33C7oq
 UA45r1B3cTSFTUrypFTtk6znFR4QOMmob0ZoFahShTsPV/mrckLzh0mqwwoQKZud/F
 MStZzoG1HHbQ1Cbi/oxLa5TMs2MQ/AjYujsCGykRYuGDgF3I4GHnBE3eQ4OkycDxwY
 UoFh8xIhWzUfQ==
Date: Thu, 30 Oct 2025 18:32:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner
 <lukas@wunner.de>, "Lijo Lazar" <lijo.lazar@amd.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, "Aravind Iddamsetty"
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
Message-ID: <20251030183254.10d64ee1@kernel.org>
In-Reply-To: <20250929214415.326414-5-rodrigo.vivi@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <20250929214415.326414-5-rodrigo.vivi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Sep 2025 17:44:13 -0400 Rodrigo Vivi wrote:
> Introduces the DRM RAS infrastructure over generic netlink.

Can't comment on the merits but in terms of netlink..

> +    ./tools/net/ynl/pyynl/cli.py --spec Documentation/netlink/specs/drm_ras.yaml --dump list-nodes

We recommend using the "installed" syntax in examples, so:

	ynl --family drm_ras

instead of:

	./tools/net/ynl/pyynl/cli.py --spec
	Documentation/netlink/specs/drm_ras.yaml 

If you're using Fedora or another good distro ynl CLI is packaged (for
Fedora in kernel-tools). The in-tree syntax is a bit verbose.

> +	xa_for_each(&drm_ras_xa, id, node) {
> +		if (id < ctx->restart)
> +			continue;

IIRC xa_for_each_start can make this simpler?

> +		hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
> +				  cb->nlh->nlmsg_seq,
> +				  &drm_ras_nl_family, NLM_F_MULTI,
> +				  DRM_RAS_CMD_LIST_NODES);

genlmsg_iput()
genl_info_dump(cb) to get info

> +		if (!hdr) {
> +			ret = -EMSGSIZE;
> +			break;
> +		}
> +
> +		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_ID, node->id);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> +				     node->device_name);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> +				     node->node_name);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> +				  node->type);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		genlmsg_end(skb, hdr);
> +	}
> +
> +	if (ret == -EMSGSIZE) {
> +		ctx->restart = id;
> +		return skb->len;
> +	}
> +
> +	return ret;

Separate handling of -EMSGSIZE and returning skb->len is not necessary
as of a few releases ago. Just return ret; core will do the right thing
if ret == -EMSGSIZE and skb->len != 0


> +static int doit_reply_value(struct genl_info *info, u32 node_id,
> +			    u32 error_id)
> +{
> +	struct sk_buff *msg;
> +	struct nlattr *hdr;
> +	const char *error_name;
> +	u32 value;
> +	int ret;
> +
> +	msg = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +	hdr = genlmsg_put_reply(msg, info, &drm_ras_nl_family, 0,
> +				DRM_RAS_CMD_QUERY_ERROR_COUNTER);
> +	if (!hdr) {
> +		nlmsg_free(msg);
> +		return -EMSGSIZE;
> +	}
> +
> +	ret = get_node_error_counter(node_id, error_id,
> +				     &error_name, &value);
> +	if (ret)
> +		return ret;
> +
> +	ret = msg_reply_value(msg, error_id, error_name, value);
> +	if (ret)
> +		return ret;

Leaking message on errors?

> +	genlmsg_end(msg, hdr);
> +
> +	return genlmsg_reply(msg, info);
> +}

