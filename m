Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4AF1285E4
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 01:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB8F6ECD7;
	Sat, 21 Dec 2019 00:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61BE6ECD2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 00:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576887112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpvjyHddomTBVlnRy5D6G8OJ5mZnjYRh6mZ8SNVnyW4=;
 b=bYddrydPknaQIsbkxy7H0+SbRkiJXGjDYvRsEtm1HdMbFR/ODT27bCu76DLzGLO+EXPxE9
 RvUxa+bqO19DWPw0OohIILP0ZVcQY8xhCkiPfdlTMMyRYL6+viVgTc8xooDRx7YY5lRWIV
 VNiSqI6kA3A/j31fX5FBZiTwC/4OdVk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-z9SV8-a7P7CfqFrIsiqGYg-1; Fri, 20 Dec 2019 19:11:50 -0500
Received: by mail-qk1-f198.google.com with SMTP id a6so4348586qkl.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 16:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=UpvjyHddomTBVlnRy5D6G8OJ5mZnjYRh6mZ8SNVnyW4=;
 b=nC+UnfJdFv4xpSEEwY2OL1nooAPabRFAbq5T0Xi54CXjrl5RtE0Hrd81crklO/1ML3
 6PwnCbukT6L4uckBVEnFwMOfVLOQQQs+a/RrkSgbNhoM4VKhNnYhTCwyWHFnsB7puywJ
 Grh2DyNhYraaXQTkVhR2EktFJNSnuAjfmeRSBe8etBC4ObIaGBNfSAiCDExOQop0yWhv
 5t/m0NHGZYGr7uZdLhq6zFqsU1ZNAKseSqFl6QOjGeSupegDzUpI89ko9KwXr69En8+y
 bR5ljXfLE8fJlZ+OGmr2AQlz5UgPX+c5YklNPt2KJEbVZCtmGP8twiq7DyZXG/h0OhgA
 Hw0w==
X-Gm-Message-State: APjAAAW8mLbdu0c2GN/GDOcBc7O+73OBH8xix78Rh8oxaUjFVEsrC4up
 OPyagZVQ026zL2+kUYDYM86PDvCiVvR6CBZSBS5a3C8Imt1Io4rs7blDoC2g7xj9rjxqwsDdVj5
 fTcgtqYpULUaqgCUtZuxi3wELwKdf
X-Received: by 2002:a05:620a:133a:: with SMTP id
 p26mr15607863qkj.233.1576887110300; 
 Fri, 20 Dec 2019 16:11:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJw7kWbDwJzTxH+r2C3U8rbRcclU7cd3GFT2xwOnuXlYRM/9NpWWAyP0v0yC9CMPL8x0a/Cg==
X-Received: by 2002:a05:620a:133a:: with SMTP id
 p26mr15607830qkj.233.1576887109935; 
 Fri, 20 Dec 2019 16:11:49 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id d143sm3364778qke.123.2019.12.20.16.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 16:11:49 -0800 (PST)
Message-ID: <589e939efca5209af318645fa6799c423897eea6.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: clear time slots for ports invalid
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Fri, 20 Dec 2019 19:11:48 -0500
In-Reply-To: <20191206083937.9411-1-Wayne.Lin@amd.com>
References: <20191206083937.9411-1-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: z9SV8-a7P7CfqFrIsiqGYg-1
X-Mimecast-Spam-Score: 0
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
Cc: jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mhh-I think I understand the problem you're trying to solve here but I think
this solution might be a bit overkill. When I did the rework of topology
references for ports, I made it so that we can guarantee memory access to a
port without it needing to be a valid part of the topology. As well, all
parents of the port are guaranteed to be accessible for as long as the child
is. Take a look at:

https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-kms-helpers.html#refcount-relationships-in-a-topology

It's also worth noting that because of this there's a lot of
get_port_validated()/put_port_validated() calls in the MST helpers that are
now bogus and need to be removed once I get a chance. For new code we should
limit the use of topology references to sections of code where we need a
guarantee that resources on the port/branch (such as a drm connector, dp aux
port, etc.) won't go away for as long as we need to use them.

Do you think we could change this patch so instead of removing it from the
proposed payloads on the CONNECTION_STATUS_NOTIFY, we keep the port's memory
allocation around until it's been removed from the proposed payloads table and
clean it up there on the next payload update?

On Fri, 2019-12-06 at 16:39 +0800, Wayne Lin wrote:
> [Why]
> When change the connection status in a MST topology, mst device
> which detect the event will send out CONNECTION_STATUS_NOTIFY messgae.
> 
> e.g. src-mst-mst-sst => src-mst (unplug) mst-sst
> 
> Currently, under the above case of unplugging device, ports which have
> been allocated payloads and are no longer in the topology still occupy
> time slots and recorded in proposed_vcpi[] of topology manager.
> 
> If we don't clean up the proposed_vcpi[], when code flow goes to try to
> update payload table by calling drm_dp_update_payload_part1(), we will
> fail at checking port validation due to there are ports with proposed
> time slots but no longer in the mst topology. As the result of that, we
> will also stop updating the DPCD payload table of down stream port.
> 
> [How]
> While handling the CONNECTION_STATUS_NOTIFY message, add a detection to
> see if the event indicates that a device is unplugged to an output port.
> If the detection is true, then iterrate over all proposed_vcpi[] to
> see whether a port of the proposed_vcpi[] is still in the topology or
> not. If the port is invalid, set its num_slots to 0.
> 
> Thereafter, when try to update payload table by calling
> drm_dp_update_payload_part1(), we can successfully update the DPCD
> payload table of down stream port and clear the proposed_vcpi[] to NULL.
> 
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 5306c47dc820..2e236b6275c4 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2318,7 +2318,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch
> *mstb,
>  {
>  	struct drm_dp_mst_topology_mgr *mgr = mstb->mgr;
>  	struct drm_dp_mst_port *port;
> -	int old_ddps, ret;
> +	int old_ddps, old_input, ret, i;
>  	u8 new_pdt;
>  	bool dowork = false, create_connector = false;
>  
> @@ -2349,6 +2349,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch
> *mstb,
>  	}
>  
>  	old_ddps = port->ddps;
> +	old_input = port->input;
>  	port->input = conn_stat->input_port;
>  	port->mcs = conn_stat->message_capability_status;
>  	port->ldps = conn_stat->legacy_device_plug_status;
> @@ -2373,6 +2374,27 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch
> *mstb,
>  		dowork = false;
>  	}
>  
> +	if (!old_input && old_ddps != port->ddps && !port->ddps) {
> +		for (i = 0; i < mgr->max_payloads; i++) {
> +			struct drm_dp_vcpi *vcpi = mgr->proposed_vcpis[i];
> +			struct drm_dp_mst_port *port_validated;
> +
> +			if (vcpi) {
> +				port_validated =
> +					container_of(vcpi, struct
> drm_dp_mst_port, vcpi);
> +				port_validated =
> +					drm_dp_mst_topology_get_port_validated
> (mgr, port_validated);
> +				if (!port_validated) {
> +					mutex_lock(&mgr->payload_lock);
> +					vcpi->num_slots = 0;
> +					mutex_unlock(&mgr->payload_lock);
> +				} else {
> +					drm_dp_mst_topology_put_port(port_vali
> dated);
> +				}
> +			}
> +		}
> +	}
> +
>  	if (port->connector)
>  		drm_modeset_unlock(&mgr->base.lock);
>  	else if (create_connector)
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
