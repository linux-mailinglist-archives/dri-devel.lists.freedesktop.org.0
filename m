Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46D2885A65
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 15:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A8610E09C;
	Thu, 21 Mar 2024 14:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GfzXg7gu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B2110E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 14:09:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC62F61167;
 Thu, 21 Mar 2024 14:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440D0C433C7;
 Thu, 21 Mar 2024 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711030165;
 bh=bt/VudG6Xz845Zt2ggXnViAnyEQZSPABcpQ6AOv8Og4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GfzXg7gu0GzCdFthGsMeMWEa/UH8YEKHhIfSxHodqumc3rHj7aEnOVZ8vh1svdo0A
 vSGi+EmvqYlXK0dronP3Y9mYXRClxEjTg9/xMzQvAxhCXwiHEUZrPtfRvJskJxYHDq
 ssL+/okIJJoA3XuTXgr6I/IsZzGl1RXzI7VOHL+wOucXuDPijxrhbvpJz6AY0zO8RP
 xXNXs3NPQGL7HEfxoodvsFbo+FIcMNpgZHDPveGMkb9LgRwmv4Oy7J87/jVFHpCG+U
 og8bLlAP4nxt+yLTDuboQ3an54sA1abmxAVD3HkXeA0mGXHWVFg6YKdq/IzTtwEQUP
 nVQWiPOFl1L3Q==
Date: Thu, 21 Mar 2024 15:09:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, jfalempe@redhat.com, 
 maarten.lankhorst@linux.intel.com, jani.nikula@linux.intel.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 12/13] drm/ast: Implement polling for VGA and SIL164
 connectors
Message-ID: <20240321-elated-optimal-lion-7ae26a@houat>
References: <20240320093738.6341-1-tzimmermann@suse.de>
 <20240320093738.6341-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320093738.6341-13-tzimmermann@suse.de>
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

On Wed, Mar 20, 2024 at 10:34:17AM +0100, Thomas Zimmermann wrote:
> +/**
> + * drm_connector_helper_detect_ctx - Read EDID and detect connector status.
> + * @connector: The connector
> + * @ctx: Acquire context
> + * @force: Perform screen-destructive operations, if necessary
> + *
> + * Detects the connector status by reading the EDID using drm_probe_ddc(),
> + * which requires connector->ddc to be set. Returns connector_status_connected
> + * on success or connector_status_disconnected on failure.
> + *
> + * Returns:
> + * The connector status as defined by enum drm_connector_status.
> + */
> +int drm_connector_helper_detect_ctx(struct drm_connector *connector,
> +				    struct drm_modeset_acquire_ctx *ctx,
> +				    bool force)
> +{
> +	struct i2c_adapter *ddc = connector->ddc;
> +
> +	if (!ddc)
> +		return connector_status_unknown;
> +
> +	if (drm_probe_ddc(ddc))
> +		return connector_status_connected;
> +
> +	return connector_status_disconnected;
> +}
> +EXPORT_SYMBOL(drm_connector_helper_detect_ctx);

I think it would be better to make it more obvious that we rely on DDC
to detect and we shouldn't consider it a generic helper that would work
in all cases.

drm_connector_helper_detect_probe_ddc maybe?

Maxime
