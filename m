Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E14717784
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 09:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB88510E488;
	Wed, 31 May 2023 07:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C813310E159
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 13:49:16 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-256a41d3e81so1243781a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 06:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heitbaum.com; s=google; t=1685454555; x=1688046555;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7p73ODufu1/P74FptI7FRwaCItiP1sKbYRvV3n+M0V0=;
 b=PzarIwSIhRYrd8a9D1iPGmwviHC2XZt4+tfx7iv3dKbXBCvqRWGx9WoPv5WraiCSjm
 zgD8EF2ExxnBmzqJqpZ2xnxBOoQJjgm+v6OMnfUESSyJmbUZtTzVruClSMIw+5cXpChR
 k23PLH32rOaJYk7OJBiywbIPGc16TrY6HegpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685454555; x=1688046555;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7p73ODufu1/P74FptI7FRwaCItiP1sKbYRvV3n+M0V0=;
 b=RQHZK4J9KuX36bxVwJKx3CgmRnxJ+CqbiWVAcWDYggGGWDpgGU67L4xSTkqz4E6Ryp
 em7fTJ8OCVhpHdm1Ek4mSdB31jO8lczIvWexsHJvqbXLxAPw0LBKNEdiKFdXSVoQ4zVU
 OdZa8/5HzxK13iaAMYzNc2ifhB7pjWcp7cQpilk1MGP7I4lo9Q0AnF4Qf1WQi0VqcVYq
 n5/BQgHAlKsTTFR7BaV76yClanETeu0rn/B6z09fMvG0IWCy576L2r3ttBVzJJCzofYA
 +3hQ0Am4m3EBZ2gzZgHy/1b3NyDPqTAjP3P/TBMqp0aAXz5UWgxH2l9fuAfShZJT1zHJ
 lq6w==
X-Gm-Message-State: AC+VfDyAF63K1YLboRlhc6QOM8Q9H+tsy9is5kt+l6rsTMHyj04CP9nh
 /P3FHOPlWlB9povQm7Fd969vTw==
X-Google-Smtp-Source: ACHHUZ4XSEbkBWzXynP47Hjpm8/ECtPpTXOj/WE0fHRVvYpYN5zxii/+M2F6b3VEOWryyJa4ue4xRw==
X-Received: by 2002:a17:90a:fe13:b0:255:a8fb:a72a with SMTP id
 ck19-20020a17090afe1300b00255a8fba72amr2573662pjb.32.1685454555527; 
 Tue, 30 May 2023 06:49:15 -0700 (PDT)
Received: from 5e905162a5a7 ([122.199.31.3]) by smtp.gmail.com with ESMTPSA id
 nn6-20020a17090b38c600b002508f0ac3edsm4246116pjb.53.2023.05.30.06.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:49:14 -0700 (PDT)
Date: Tue, 30 May 2023 13:49:07 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Imre Deak <imre.deak@intel.com>, Dave Airlie <airlied@redhat.com>,
 Dave Airlie <airlied@gmail.com>
Subject: Re: [v4,01/14] drm/i915: Fix PIPEDMC disabling for a bigjoiner
 configuration
Message-ID: <20230530134907.GA8@5e905162a5a7>
References: <20230510103131.1618266-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230510103131.1618266-2-imre.deak@intel.com>
X-Mailman-Approved-At: Wed, 31 May 2023 07:06:45 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Imre/Dave,

Ref: [v4,01/14] drm/i915: Fix PIPEDMC disabling for a bigjoiner configuration
     [git pull] drm fixes for 6.4-rc4
     drm-fixes-2023-05-26:
     drm fixes for 6.4-rc4

This patch has caused a regression between 6.4-rc3 and 6.4-rc4. Other
tested kernels include 6.3.4 work fine. Dropping the patch allows the decode
playback of media via Kodi. Without dropping the patch - the media
starts and stutters then ceases to play.

There is an additional issue that 6.4-rc4 audio playback is also failing
(where 6.4-rc3 was fine), I have not yet tracked this down.

This is all on:
DMI: Intel(R) Client Systems NUC12WSKi7/NUC12WSBi7, BIOS WSADL357.0087.2023.0306.1931 03/06/2023
12th Gen Intel(R) Core(TM) i7-1260P (family: 0x6, model: 0x9a, stepping: 0x3)
microcode: updated early: 0x429 -> 0x42a, date = 2023-02-14

Regards

Rudi

On Wed, May 10, 2023 at 01:31:18PM +0300, Imre Deak wrote:
> For a bigjoiner configuration display->crtc_disable() will be called
> first for the slave CRTCs and then for the master CRTC. However slave
> CRTCs will be actually disabled only after the master CRTC is disabled
> (from the encoder disable hooks called with the master CRTC state).
> Hence the slave PIPEDMCs can be disabled only after the master CRTC is
> disabled, make this so.
> 
> intel_encoders_post_pll_disable() must be called only for the master
> CRTC, as for the other two encoder disable hooks. While at it fix this
> up as well. This didn't cause a problem, since
> intel_encoders_post_pll_disable() will call the corresponding hook only
> for an encoder/connector connected to the given CRTC, however slave
> CRTCs will have no associated encoder/connector.
> 
> Fixes: 3af2ff0840be ("drm/i915: Enable a PIPEDMC whenever its corresponding pipe is enabled")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 1d5d42a408035..116fa52290b84 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1702,9 +1702,17 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
>  
>  	intel_disable_shared_dpll(old_crtc_state);
>  
> -	intel_encoders_post_pll_disable(state, crtc);
> +	if (!intel_crtc_is_bigjoiner_slave(old_crtc_state)) {
> +		struct intel_crtc *slave_crtc;
> +
> +		intel_encoders_post_pll_disable(state, crtc);
>  
> -	intel_dmc_disable_pipe(i915, crtc->pipe);
> +		intel_dmc_disable_pipe(i915, crtc->pipe);
> +
> +		for_each_intel_crtc_in_pipe_mask(&i915->drm, slave_crtc,
> +						 intel_crtc_bigjoiner_slave_pipes(old_crtc_state))
> +			intel_dmc_disable_pipe(i915, slave_crtc->pipe);
> +	}
>  }
>  
>  static void i9xx_pfit_enable(const struct intel_crtc_state *crtc_state)
