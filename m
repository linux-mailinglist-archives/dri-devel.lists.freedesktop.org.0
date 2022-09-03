Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5215ABF34
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 16:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFFD10E533;
	Sat,  3 Sep 2022 14:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2030010E1F7;
 Sat,  3 Sep 2022 14:04:47 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MKc3f4CkYzDs9f;
 Sat,  3 Sep 2022 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662213886; bh=ugNGDj5iKa7xmZn4Twn8GtzgN+FxjV4+dFd55ClQvhM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Xo8837AXr9jA0kSm1DidsPRR+tfIftyPa6s289W5KUr2OoLCTMgN4DuloeZ0Et7t6
 oBFP4q436GkM5loRuHElAmMSNgZLSQ05jwavigqRnX4jc4n63r8CtoOqD9OIDVe/TM
 4mmOw4rR+yukr75CvZ8/iShiXBO7O8eg5Un07yRo=
X-Riseup-User-ID: ECBAD454AB8B3C3B5842F0EB48B6B7B89FFE6D358F036D3F2D35DF0495DE0ED9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MKc3d11Wwz1yPx;
 Sat,  3 Sep 2022 14:04:44 +0000 (UTC)
Message-ID: <d32a95f5-31cb-e659-d78b-1176130a0e1a@riseup.net>
Date: Sat, 3 Sep 2022 11:04:41 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] drm/tests: Set also mock plane src_x, src_y, src_w
 and src_h
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <20220823112920.352563-5-jouni.hogander@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220823112920.352563-5-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8
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

On 8/23/22 08:29, Jouni Högander wrote:
> We need to set also src_x, src_y, src_w and src_h for the mock plane.
> After fix for drm_atomic_helper_damage_iter_init we are using these
> when iterating damage_clips.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

Tested-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/tests/drm_damage_helper_test.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_damage_helper_test.c b/drivers/gpu/drm/tests/drm_damage_helper_test.c
> index bf250bd08d7e..c608ae06f0e3 100644
> --- a/drivers/gpu/drm/tests/drm_damage_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_damage_helper_test.c
> @@ -59,6 +59,11 @@ static int drm_damage_helper_init(struct kunit *test)
>  static void set_plane_src(struct drm_plane_state *state, int x1, int y1, int x2,
>  			  int y2)
>  {
> +	state->src_x = x1;
> +	state->src_y = y1;
> +	state->src_w = x2 - x1;
> +	state->src_h = y2 - y1;
> +
>  	state->src.x1 = x1;
>  	state->src.y1 = y1;
>  	state->src.x2 = x2;
