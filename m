Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D872C0A494
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 09:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C8E10E080;
	Sun, 26 Oct 2025 08:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Rb2GrXi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041A810E080
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761467243;
 bh=elSX9IbqQvW2SuUAYMHA/NTFtVw/y09OwjHI4aK+9Go=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rb2GrXi6HpsLYx8ZrvSbgyAJlo2w3O/tfX6q40tcLizhEoYlqGL4gUKiWVT0OP/Sd
 jaY4yTzWqaYwic2VHaW3S7XiTowwI8AERodX7pCPTjcdH/4SFJUpBP5CnsWwqOff0y
 zpj7vW8bZtG3Ode8mE/TFZuWXqCH0fN8mz++01sqTHpD0sY5qdWiq5dcXr4/mq24J3
 QpGTT4hOMsMFfXmXHKr+WwsL6DhqZs9QudT3FrrwDr1eHWTkYaoiQR7vnE/51RX1o9
 M9r183MCBA+jScztgDTuRvUSPLDtEcc8YO2SVKBLTbtEWg4R02vCrVEWaeDWLkbTcw
 lUo8o3w2V5eyw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 02AA117E139C;
 Sun, 26 Oct 2025 09:27:22 +0100 (CET)
Date: Sun, 26 Oct 2025 09:27:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] drm/panthor: Support GLB_REQ.STATE field for
 Mali-G1 GPUs
Message-ID: <20251026092717.3aae3679@fedora>
In-Reply-To: <20251024202117.3241292-7-karunika.choo@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
 <20251024202117.3241292-7-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Fri, 24 Oct 2025 21:21:15 +0100
Karunika Choo <karunika.choo@arm.com> wrote:

> +static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
> +}

It's okay for now, but if we start having more of these, we probably
want to automate the generation of those has_<featurex>() helpers with
something like:

#define FW_FEATURE(feat_name, major, minor)						\
static bool panthor_fw_has_ ## feat_name(struct panthor_device *ptdev) 			\
{											\
	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev); 	\
											\
	return glb_iface->control->version >= CSF_IFACE_VERSION(major, minor, 0);	\
}

Same goes for the HW features BTW.

> +
>  /**
>   * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
>   * @ptdev: Device.
> @@ -995,6 +1003,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>  					 GLB_IDLE_EN |
>  					 GLB_IDLE;
> 
> +	if (glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0))

	if (panthor_fw_has_glb_state(ptdev))

> +		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
> +
>  	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
>  	panthor_fw_toggle_reqs(glb_iface, req, ack,
>  			       GLB_CFG_ALLOC_EN |
> @@ -1068,6 +1079,54 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
>  		drm_err(&ptdev->base, "Failed to stop MCU");
>  }

