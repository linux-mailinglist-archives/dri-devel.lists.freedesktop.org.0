Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA92C209C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 10:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF8E6E252;
	Tue, 24 Nov 2020 09:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6276E25A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606208468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xE3JcwOKuWzwtveAKJpsJ+7+ide6TXe062FQruBLRd4=;
 b=Asi/GAmt+3pXfsdbi25PN/sZ4Ptbdet7F/j4N1nFP5VCCkn9te2IoqZU0mOAZmeN3rE3V+
 qY3Kcm46lmxvPHi09tvUR0mQs0kbXPxvxO7IemIyE8+RQ+3k2wZEKORkIV6xzpp+uOr66a
 4bimcbvc1kQCAnh96ReRimNGgdHjdI4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-H8dVVSNxMdO5_EogE1r2Lg-1; Tue, 24 Nov 2020 04:01:06 -0500
X-MC-Unique: H8dVVSNxMdO5_EogE1r2Lg-1
Received: by mail-ej1-f71.google.com with SMTP id lz20so6637281ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 01:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xE3JcwOKuWzwtveAKJpsJ+7+ide6TXe062FQruBLRd4=;
 b=QJMbxXXjl7L92ovSsjD+N2e/hioszyuanQN0a2TTRISp1xqWjxvKU4Mu4orRaMHlVc
 HVnKBRE5dYrOFLG6FOg2nOdr/ag4lkHEDAOLBHIS0PrKrWdCs6h+JqkJUh+xrrvhXCsq
 N+oY7jJLpd6jlpeWLRCJVPwp3MdeK2MwH5Z+Hhdww+Ihix3hO1F1qDN1IoCovrsSCJPL
 3q2epgXKLB4saLBvwcaP00DKZ+OtD16vryg+ZLNeISd2Q+pmqfljhmOAZwQ2tWVhydCL
 /2t6MejdhOVpIzUGzZU9ccTAjhQFu2ioHTVuCXH2tIQQDnIeiUJh4PcRvjrTSxoqdZCP
 Si5g==
X-Gm-Message-State: AOAM531sJAQgHLhQMmTyfg0WvSjQmcN/KWxhNhuBfnApXfF+ZfAIFmy1
 AgQ+I2YkMBgkMnUX+znbaZANybr+hV8fnKfalACyz8myjf7PPNzczhnnZoiNSwxUGrf26ZLxSNi
 eRAfRSuVnP9ZDGa/DqA4NkPsnzmyQxDVbYBWg736WekkI8mFABYJ3bwpIlCAwnW8PvRsrsbP3cH
 0H/6Ub
X-Received: by 2002:a17:906:ca83:: with SMTP id
 js3mr3405903ejb.42.1606208464124; 
 Tue, 24 Nov 2020 01:01:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6hHGQ4OX2/KzGAlPumGB3IBYje/1wOzkEI3Lv2m36gcJJvVLRPThkFuLmCf1+AIbd7hYcyw==
X-Received: by 2002:a17:906:ca83:: with SMTP id
 js3mr3405881ejb.42.1606208463913; 
 Tue, 24 Nov 2020 01:01:03 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
 by smtp.gmail.com with ESMTPSA id y15sm6498668eds.56.2020.11.24.01.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 01:01:03 -0800 (PST)
Subject: Re: [PATCH] drm/i915/dsi: Use unconditional msleep for the
 panel_on_delay when there is no reset-deassert MIPI-sequence
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20201118124058.26021-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8b8d0e94-28db-1c4d-e14c-29a9920d0f76@redhat.com>
Date: Tue, 24 Nov 2020 10:01:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118124058.26021-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/18/20 1:40 PM, Hans de Goede wrote:
> Commit 25b4620ee822 ("drm/i915/dsi: Skip delays for v3 VBTs in vid-mode")
> added an intel_dsi_msleep() helper which skips sleeping if the
> MIPI-sequences have a version of 3 or newer and the panel is in vid-mode;
> and it moved a bunch of msleep-s over to this new helper.
> 
> This was based on my reading of the big comment around line 730 which
> starts with "Panel enable/disable sequences from the VBT spec.",
> where the "v3 video mode seq" column does not have any wait t# entries.
> 
> Given that this code has been used on a lot of different devices without
> issues until now, it seems that my interpretation of the spec here is
> mostly correct.
> 
> But now I have encountered one device, an Acer Aspire Switch 10 E
> SW3-016, where the panel will not light up unless we do actually honor the
> panel_on_delay after exexuting the MIPI_SEQ_PANEL_ON sequence.
> 
> What seems to set this model apart is that it is lacking a
> MIPI_SEQ_DEASSERT_RESET sequence, which is where the power-on
> delay usually happens.
> 
> Fix the panel not lighting up on this model by using an unconditional
> msleep(panel_on_delay) instead of intel_dsi_msleep() when there is
> no MIPI_SEQ_DEASSERT_RESET sequence.
> 
> Fixes: 25b4620ee822 ("drm/i915/dsi: Skip delays for v3 VBTs in vid-mode")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Ping can I get a review/ack for this please?

Regards,

Hans


> ---
>  drivers/gpu/drm/i915/display/vlv_dsi.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 194c239ab6b1..ef673277b36d 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -816,10 +816,14 @@ static void intel_dsi_pre_enable(struct intel_atomic_state *state,
>  		intel_dsi_prepare(encoder, pipe_config);
>  
>  	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_POWER_ON);
> -	intel_dsi_msleep(intel_dsi, intel_dsi->panel_on_delay);
>  
> -	/* Deassert reset */
> -	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_DEASSERT_RESET);
> +	if (dev_priv->vbt.dsi.sequence[MIPI_SEQ_DEASSERT_RESET]) {
> +		intel_dsi_msleep(intel_dsi, intel_dsi->panel_on_delay);
> +		/* Deassert reset */
> +		intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_DEASSERT_RESET);
> +	} else {
> +		msleep(intel_dsi->panel_on_delay);
> +	}
>  
>  	if (IS_GEMINILAKE(dev_priv)) {
>  		glk_cold_boot = glk_dsi_enable_io(encoder);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
