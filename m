Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCE9FE782
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 16:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D533910E505;
	Mon, 30 Dec 2024 15:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="o8TxkiFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551D310E505
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 15:17:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7641A60002;
 Mon, 30 Dec 2024 15:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735571819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6WKXRn/409cehdPtxGzAXD1KPiSytjez4V6vnIcka8=;
 b=o8TxkiFQy2Y3TEhYM811v0R+36yh69Y9qE/IZPX4K+n7O0xbH5MnWhFW7aFJEtbcN1C5rd
 b3BW/9meoET8Ag5lUifXU3ExA+pxao6s7rzliRvWBkKX1ywL2JLnULo1UWrnnpvm9FZA4V
 QiHhSr5ordi0XO9AaiXTUztjqklI7x+vd5ls2KN7d9B2SbCmg2O/sJR3p9ci97lA3RtqIh
 2mfrkWRejxM8TdqMQZJYWIAf5zHpga0kMj6lbbK4njxpaXySOdltRL8OO8d2LPIWsXryLd
 IBqPitZvWw0Q9yQ/mfEEC9qOEkI0NiXlMpA+9DxqO2Mj8DZ0u3Rer8yeE+Ku8A==
Date: Mon, 30 Dec 2024 16:16:56 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: kerne test robot <oliver.sang@intel.com>
Cc: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>, Louis
 Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH RESEND v3 4/4] drm/connector: warn when cleaning up a
 refcounted connector
Message-ID: <20241230161351.1c28ef9f@booty>
In-Reply-To: <202412252329.a12c3be7-lkp@intel.com>
References: <20241216-drm-small-improvements-v3-4-78bbc95ac776@bootlin.com>
 <202412252329.a12c3be7-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello,

On Wed, 25 Dec 2024 23:15:53 +0800
kerne test robot <oliver.sang@intel.com> wrote:

> the WARN added in this commit is hit in our tests, below just FYI.
> 
> kernel test robot noticed "WARNING:at_drivers/gpu/drm/drm_connector.c:#drm_connector_cleanup[drm]" on:
... 
> [   75.546607][  T377] i915 0000:00:02.0: [drm] [ENCODER:98:DDI A/PHY A] failed to retrieve link info, disabling eDP
> [   75.557310][  T377] ------------[ cut here ]------------
> [   75.562737][  T377] WARNING: CPU: 9 PID: 377 at drivers/gpu/drm/drm_connector.c:631 drm_connector_cleanup+0x591/0x5c0 [drm]
...
> [   75.820489][  T377] Call Trace:
> [   75.823699][  T377]  <TASK>
> [   75.826566][  T377]  ? drm_connector_cleanup+0x591/0x5c0 [drm]
> [   75.832581][  T377]  ? __warn+0x9d/0x140
> [   75.836581][  T377]  ? drm_connector_cleanup+0x591/0x5c0 [drm]
> [   75.842597][  T377]  ? report_bug+0x1a6/0x1d0
> [   75.847028][  T377]  ? handle_bug+0x53/0xa0
> [   75.851288][  T377]  ? exc_invalid_op+0x13/0x40
> [   75.855903][  T377]  ? asm_exc_invalid_op+0x16/0x20
> [   75.860873][  T377]  ? drm_mode_object_read_refcount+0x35/0x40 [drm]
> [   75.867428][  T377]  ? drm_connector_cleanup+0x591/0x5c0 [drm]
> [   75.873436][  T377]  ? drm_connector_cleanup+0x34/0x5c0 [drm]
> [   75.879362][  T377]  intel_dp_init_connector+0x773/0x920 [i915]

OK, so we have this warning because intel_dp_init_connector() does in
the error path (stripped code):

intel_dp_init_connector()
{
   ...
   drm_connector_init_with_ddc(); // sets refcount to 1
   ...
   if (<some error condition>) {
      goto fail;
   }
   ...

fail:
   drm_connector_cleanup(connector); // refcount == 1, warning triggers here
}

My patch is based on the assumption that a connector is always freed by
drm_connector_put() when refcount goes to 0.

The code here (and in other drivers) is an exception that makes sense
specifically for error handling during probe or initialization, and
only when the connector pointer has not been taken by other parts of
the code. However it makes the warning check unavoidably generate false
positives.

At first sight, false positives can be removed by replacing:

-drm_connector_cleanup(connector);
+drm_connector_put(connector);

and letting drm_connector_put() end up in calling the .destroy func.
However that imposes to ensure .destroy is idempotent and does not
"destroy too much", by code inspection at least. By a quick search I
counted about 30 instances.

So, I think there are three options:

 1. this patch is useful (and it helped Luca find an actual bug in his
    code) so we want it but first we need to remove the false positives
 2. we want to support _cleanup instead of a _put() in the error path,
    so let's remove this patch
 3. let's keep the patch and ignore the warning: future patches adding
    _cleanup() in the error path could get a kernel test robot notice
    like this, so it would be good to use _put() in future drivers

Thoughts about this?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
