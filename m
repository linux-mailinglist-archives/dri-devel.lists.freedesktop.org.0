Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BE7AFDFD0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 08:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A6C10E72D;
	Wed,  9 Jul 2025 06:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 586 seconds by postgrey-1.36 at gabe;
 Wed, 09 Jul 2025 06:07:21 UTC
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5607610E72D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 06:07:21 +0000 (UTC)
Received: from [192.168.0.192] (ip5f5af7d1.dynamic.kabel-deutschland.de
 [95.90.247.209])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0EE0161E647BA;
 Wed, 09 Jul 2025 07:57:16 +0200 (CEST)
Message-ID: <af1b1805-375a-450e-925f-2b0860216899@molgen.mpg.de>
Date: Wed, 9 Jul 2025 07:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS
 to TRAINING_PATTERN_SET
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20250708212331.112898-1-imre.deak@intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250708212331.112898-1-imre.deak@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Dear Imre,


Thank you very much for your patch, and the detailed commit message.

Am 08.07.25 um 23:23 schrieb Imre Deak:
> Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
> DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
> DPCD probing, since this results in link training failures at least when
> using an Intel Barlow Ridge TBT hub at UHBR link rates (the
> DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
> link training). Since accessing DPCD_REV during link training is
> prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
> as it falls within the Standard's valid register address range
> (0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
> training on the above TBT hub.
> 
> However, reading the LANE0_1_STATUS register also has a side-effect at
> least on a Novatek eDP panel, as reported on the Closes: link below,
> resulting in screen flickering on that panel. One clear side-effect when
> doing the 1-byte probe reads from LANE0_1_STATUS during link training
> before reading out the full 6 byte link status starting at the same
> address is that the panel will report the link training as completed
> with voltage swing 0. This is different from the normal, flicker-free
> scenario when no DPCD probing is done, the panel reporting the link
> training complete with voltage swing 2.

For the ignorant like me, adding the debug log lines you deduced this 
from would help.

> Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
> the above side-effect, the panel will link train with voltage swing 2 as
> expected and it will stay flicker-free. This register is also in the
> above valid register range and is unlikely to have a side-effect as that
> of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
> CR/EQ sequences and so it may cause a state change in the sink - even if
> inadvertently as I suspect in the case of the above Novatek panel. As
> opposed to this, reading TRAINING_PATTERN_SET is not part of the link
> training sequence (it must be only written once at the beginning of the
> CR/EQ sequences), so it's unlikely to cause any state change in the
> sink.
> 
> As a side-note, this Novatek panel also lacks support for TPS3, while
> claiming support for HBR2, which violates the DP Standard (the Standard
> mandating TPS3 for HBR2).

Unrelated, but a warning about this panel firmware/hardware misbehavior 
would probably be warranted.

> Besides the Novatek panel (PSR 1), which this change fixes, I also
> verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
> panel as well as on the Intel Barlow Ridge TBT hub.
> 
> Note that in the drm-tip tree (targeting the v6.17 kernel version) the
> i915 and xe drivers keep DPCD probing enabled only for the panel known
> to require this (HP ZR24w), hence those drivers in drm-tip are not
> affected by the above problem.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
> Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 1c3920297906b..1ecc3df7e3167 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -742,7 +742,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>   	int ret;
>   
>   	if (dpcd_access_needs_probe(aux)) {
> -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> +		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
>   		if (ret < 0)
>   			return ret;
>   	}

Just for the record, I also tested this on top of commit 733923397fd9 
(Merge tag 'pwm/for-6.16-rc6-fixes' of 
git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux), and the 
flickering is gone.


Kind regards,

Paul
