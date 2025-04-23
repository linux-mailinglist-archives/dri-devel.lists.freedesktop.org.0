Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E381A996A0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 19:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD0E10E234;
	Wed, 23 Apr 2025 17:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nDpRR3dv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF3810E234
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 17:29:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 036464A4DD;
 Wed, 23 Apr 2025 17:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AACEC4CEE2;
 Wed, 23 Apr 2025 17:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745429348;
 bh=BLUXHEVKgbX3+ZC/NNSHVdvoumci16WGdcd07NTrr3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nDpRR3dvKqzBue0UlTsb8lnTPUQYLqpmgRmpjDAUCDSQD+4n9kxyamZcT+OkCF+MA
 e46M9fIkuVb0jPNIZTsoaI+j8j+2RRnBMbt3MCqk6piUlL5eQSQTcQBk6Dg4g1vB1q
 51XS+O7iYBZVuVqC7eIFkx+AwdGqkSpEydwxx2xFOeZfKDZoVqgIDKlZrl+/br3XIn
 ovJtR4NZUmwIOVPqUMeqiWzcbtBB8otoA6v5tXqZy+KQZx6Y+teobZ+MlMU+e9JnAA
 D7XBiUDCBdC+jNWIyH5/okUc3xZ5gc4mbkl4xePIrionS2hhHGz21jrlSPISWJoJBI
 tJTyJdbH9dqRA==
Date: Wed, 23 Apr 2025 10:29:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: neil.armstrong@linaro.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
Subject: Re: [PATCH] drm/panel: himax-hx8279: Initialize goa_{even, odd}_valid
 in hx8279_check_goa_config()
Message-ID: <20250423172903.GA1472499@ax162>
References: <20250422-panel-himax-hx8279-fix-sometimes-uninitialized-v1-1-614dba12b30d@kernel.org>
 <a6e47775-33c3-44c2-b6d5-58164e4a0a50@linaro.org>
 <b8d21e46-c50a-4212-ae7a-d292c2ec6ce4@linaro.org>
 <4cd274f8-85ab-43dc-bef4-41646d43b775@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cd274f8-85ab-43dc-bef4-41646d43b775@collabora.com>
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

On Wed, Apr 23, 2025 at 04:01:20PM +0200, AngeloGioacchino Del Regno wrote:
> or the shorter form:
> 
> 	goa_odd_valid = (num_zero != ARRAY_SIZE(desc->goa_odd_timing));
> 
> 	/* Up to 3 zeroes is a valid config. Check them all. */
> 	num_zero = 1;
> 	for (i = 0; i < ARRAY_SIZE(desc->goa_even_timing); i++) {
> 		if (desc->goa_even_timing[i])
> 			num_zero++;
> 	}
> 
> 	goa_even_valid = (num_zero != ARRAY_SIZE(desc->goa_even_timing));
> 

Ah yeah, I think I like this the best as it is the most compact while
always ensuring the variable is always initialized. I will send a v2
with your Reviewed-by carried forward and an additional Suggested-by
shortly.

Cheers,
Nathan
