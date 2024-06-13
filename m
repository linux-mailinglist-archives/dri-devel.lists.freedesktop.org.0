Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9297B9075DC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 16:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80B910E0E0;
	Thu, 13 Jun 2024 14:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EDVRaHvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E820810EAD1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 14:59:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EE102CE269D;
 Thu, 13 Jun 2024 14:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194E6C2BBFC;
 Thu, 13 Jun 2024 14:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718290748;
 bh=oQMdhg4C7FzPRWVkHfUWd0I0fZ+LS+VbuRfmCL462jA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EDVRaHvlINEARYFzc803ghRe0Hdlnk0GsuGqRyLBnP+29/K+e0IzLkXjJqGT1L8fY
 6gaYh2evv6tOHFIX3uUvukTQ2juuifEd1vUKW8XLdRYQg/LsX3+2A8SmC2y1P2sGCv
 6Qgd/N3RuU+qNrbx1YjFraDHG0rgRMO7C3sRCMW5AbfS9lTOqfr5H8YaEiFg/h8Ve5
 48HMHPRRiPXh7mT+SinPzd9+Y0Qfs1O00CcKJYYmEZ+bRdNRZmT9GHXR3eXQR5cWjP
 AfIg2V95t6xTuDV5mm3j+GlHHcX05yHzALmR5RGI7d5OKi7HJAEKGbCd8V0MlVY+K0
 pvHIoXsnmegFg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: (subset) [PATCH] drm/connector: hdmi: Fix kerneldoc warnings
Date: Thu, 13 Jun 2024 16:59:03 +0200
Message-ID: <171829073405.1451716.18061983640465169919.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610111200.428224-1-mripard@kernel.org>
References: <20240610111200.428224-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 10 Jun 2024 13:12:00 +0200, Maxime Ripard wrote:
> It looks like the documentation for the HDMI-related fields recently
> added to both the drm_connector and drm_connector_state structures
> trigger some warnings because of their use of anonymous structures:
> 
>   $ scripts/kernel-doc -none include/drm/drm_connector.h
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'broadcast_rgb' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'infoframes' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'avi' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'hdr_drm' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'spd' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'vendor' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'is_limited_range' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'output_bpc' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'output_format' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'tmds_char_rate' description in 'drm_connector_state'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'vendor' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'product' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'supported_formats' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'infoframes' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'lock' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'audio' description in 'drm_connector'
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
