Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCF51292A5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDA06E1B6;
	Mon, 23 Dec 2019 08:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF706EBA8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 23:33:10 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id l35so3266771pje.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 15:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XkA3Ag1xZNcaUv5ig0ncH6ge+8P8NEi38UXcVKQ4TwA=;
 b=v7s7EMz6F475uFm82JRnKzFk78aFoLCZTTy0lM2CD7qS8AEl4BTZvbneoYwwp8M172
 vc4HjkY8cmpGvuHwr2t41pbR2jPe1QEfPuzLfKZCH2XKKgUUL+qHWWZIDQX6oaf8kB75
 kJrTkXjhOrQOJ9MGd8R6vQ9MlLYc6pRa4uIBDZIt8/PT2srbkLVoAVkQr8GyUfbUDdVK
 zIsDPGbYRQoGdDBdvkti+ZCnBVR9snqyIpTYNMktXlZ+ZgrCNlwvFQNVl+w9q7u5SCbD
 8/xDDqU58LIHgs6RVvqmhgBepPUs0vy71OoYfF3Z3kfasK7bvisd+ClVa9hOHDozn+t+
 xO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XkA3Ag1xZNcaUv5ig0ncH6ge+8P8NEi38UXcVKQ4TwA=;
 b=MP+XVI52MxIfTRWwEdJiw9q/VHc7lmcN5R4ObyN98jIUTpHYLHq/mtaflfhTVnyUIA
 9ufyIeVAjRo5aaH+hL3wcek11zFcXeMEjIuGWUixIO5EwQICOZcyDCju5ql45Jn72H6z
 jmOku+TKClqp3heoLlGJda0o4FobwmgV9td0oeiYmVnPk1LgFKFNkybM2i5JU+wNLSZ2
 HyYmkQy9EkYwFPFStSfZO8cupu0djeh5OfQGOpZSsz10WFtGqjC84VcuoINDg/MxVUMg
 V3cdtlOxJarnp0MzhvKkh+x+xeejKn1zB9/Ro7Jtc13Te0zcGbOoACYLQp6/gb1YX7mR
 6NgA==
X-Gm-Message-State: APjAAAUuwhfv9VgTCwSVTH/QOwBf+8MgUvG2JFNs7RLwYDfkf7hC+QVt
 +3NDlxX1hz2hbdFAn9WPiiLfew==
X-Google-Smtp-Source: APXvYqzYlqJkLdvsbUJyp3YSGgiYAdhSq6nsa2U4gRA/0IO+8qtfsLKllFDDPsKVZabbpkR4Fom7ZQ==
X-Received: by 2002:a17:902:6a87:: with SMTP id
 n7mr11349464plk.273.1576798389633; 
 Thu, 19 Dec 2019 15:33:09 -0800 (PST)
Received: from google.com ([2620:0:1000:2511:b34b:87b6:d099:91b0])
 by smtp.gmail.com with ESMTPSA id j21sm9239081pfe.175.2019.12.19.15.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 15:33:08 -0800 (PST)
Date: Thu, 19 Dec 2019 15:33:03 -0800
From: Tom Anderson <thomasanderson@google.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v2] drm/amd/display: Reduce HDMI pixel encoding if max
 clock is exceeded
Message-ID: <20191219233303.GA131109@google.com>
References: <20191202214713.41001-1-thomasanderson@google.com>
 <20191210185924.GA20941@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210185924.GA20941@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping.  Is there any action required to get this landed?

On Tue, Dec 10, 2019 at 10:59:24AM -0800, Tom Anderson wrote:
> Friendly ping.
> 
> On Mon, Dec 02, 2019 at 01:47:13PM -0800, Thomas Anderson wrote:
> > For high-res (8K) or HFR (4K120) displays, using uncompressed pixel
> > formats like YCbCr444 would exceed the bandwidth of HDMI 2.0, so the
> > "interesting" modes would be disabled, leaving only low-res or low
> > framerate modes.
> > 
> > This change lowers the pixel encoding to 4:2:2 or 4:2:0 if the max TMDS
> > clock is exceeded. Verified that 8K30 and 4K120 are now available and
> > working with a Samsung Q900R over an HDMI 2.0b link from a Radeon 5700.
> > 
> > Signed-off-by: Thomas Anderson <thomasanderson@google.com>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 45 ++++++++++---------
> >  1 file changed, 23 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 7aac9568d3be..803e59d97411 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -3356,27 +3356,21 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
> >  	return color_space;
> >  }
> >  
> > -static void reduce_mode_colour_depth(struct dc_crtc_timing *timing_out)
> > -{
> > -	if (timing_out->display_color_depth <= COLOR_DEPTH_888)
> > -		return;
> > -
> > -	timing_out->display_color_depth--;
> > -}
> > -
> > -static void adjust_colour_depth_from_display_info(struct dc_crtc_timing *timing_out,
> > -						const struct drm_display_info *info)
> > +static bool adjust_colour_depth_from_display_info(
> > +	struct dc_crtc_timing *timing_out,
> > +	const struct drm_display_info *info)
> >  {
> > +	enum dc_color_depth depth = timing_out->display_color_depth;
> >  	int normalized_clk;
> > -	if (timing_out->display_color_depth <= COLOR_DEPTH_888)
> > -		return;
> >  	do {
> >  		normalized_clk = timing_out->pix_clk_100hz / 10;
> >  		/* YCbCr 4:2:0 requires additional adjustment of 1/2 */
> >  		if (timing_out->pixel_encoding == PIXEL_ENCODING_YCBCR420)
> >  			normalized_clk /= 2;
> >  		/* Adjusting pix clock following on HDMI spec based on colour depth */
> > -		switch (timing_out->display_color_depth) {
> > +		switch (depth) {
> > +		case COLOR_DEPTH_888:
> > +			break;
> >  		case COLOR_DEPTH_101010:
> >  			normalized_clk = (normalized_clk * 30) / 24;
> >  			break;
> > @@ -3387,14 +3381,15 @@ static void adjust_colour_depth_from_display_info(struct dc_crtc_timing *timing_
> >  			normalized_clk = (normalized_clk * 48) / 24;
> >  			break;
> >  		default:
> > -			return;
> > +			/* The above depths are the only ones valid for HDMI. */
> > +			return false;
> >  		}
> > -		if (normalized_clk <= info->max_tmds_clock)
> > -			return;
> > -		reduce_mode_colour_depth(timing_out);
> > -
> > -	} while (timing_out->display_color_depth > COLOR_DEPTH_888);
> > -
> > +		if (normalized_clk <= info->max_tmds_clock) {
> > +			timing_out->display_color_depth = depth;
> > +			return true;
> > +		}
> > +	} while (--depth > COLOR_DEPTH_666);
> > +	return false;
> >  }
> >  
> >  static void fill_stream_properties_from_drm_display_mode(
> > @@ -3474,8 +3469,14 @@ static void fill_stream_properties_from_drm_display_mode(
> >  
> >  	stream->out_transfer_func->type = TF_TYPE_PREDEFINED;
> >  	stream->out_transfer_func->tf = TRANSFER_FUNCTION_SRGB;
> > -	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
> > -		adjust_colour_depth_from_display_info(timing_out, info);
> > +	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> > +		if (!adjust_colour_depth_from_display_info(timing_out, info) &&
> > +		    drm_mode_is_420_also(info, mode_in) &&
> > +		    timing_out->pixel_encoding != PIXEL_ENCODING_YCBCR420) {
> > +			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
> > +			adjust_colour_depth_from_display_info(timing_out, info);
> > +		}
> > +	}
> >  }
> >  
> >  static void fill_audio_info(struct audio_info *audio_info,
> > -- 
> > 2.24.0.393.g34dc348eaf-goog
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
