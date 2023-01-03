Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7E65BE50
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 11:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66FC10E3C8;
	Tue,  3 Jan 2023 10:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38CF10E254;
 Tue,  3 Jan 2023 10:42:53 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id fy8so8665676ejc.13;
 Tue, 03 Jan 2023 02:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MTCCvTLvkrq9UYZLIeqAgvmTL5kXy4L/w7DR6Wdybhw=;
 b=AYtJ2TrgpA5J3COpcPW59lGl4mbGQQHk7avrxHfY0zCeTZ1ZVgGKtLW+Z5uLe2BxJq
 d1g+zGq1CvsYsCH+qrik+I1PInp7bJeT5nzJEP+m9dzWYNtfS8hu8aqr6dmKJRAUKT6h
 wScok0759OWY4NEp3XXWQfvdaj2e/fWYFs3yQ91+fRo6a2p/ChruxIYAfaOoliWqr3nf
 CUNaDTBM2OvXdJeciGjsdV0WINKPtJbjGA6vOrpsBi2u8uy8ttI7Rlygel3rPGD3zGRW
 dRWXgTpQJlxywVxnytjbLdvK/GwGws4OWv3kBHeRroPVGOC1GdlYjDcOPw5e+gemKSSE
 okxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MTCCvTLvkrq9UYZLIeqAgvmTL5kXy4L/w7DR6Wdybhw=;
 b=X4AfRFBxbhOmIfixeNsVsqTpZGxAiHP5f81qCfIplcum7Lzo7bwZ++xI3is/q2L3oy
 VB+6j5/QttN3slJaGqI4sbh5Fcripuvk0BHs/aGGiP3IWKOOh4CnxiuJPnylu4sWC7DS
 dFJ/cNZ08fFWNmN0/eA75LmSiiDccbBKVclufpzlSOpVyMfboxpdAVyV6RMyGgDKzypv
 lg4WkDQfrCzDMT0DzUrxg5SnzgfoaklBXaYC9iqRGuw5SF5zmMvQgZiwMZvUSBopFS/k
 hTZLGzilxeaUdMSLKE257rOGOJkTcVfuxgv2oncpfSAsy9LAW1lARhn/9+9aCxKi2zXS
 YFgg==
X-Gm-Message-State: AFqh2kojxAjhfalNOB+wwXpebeTvEynS96mwS60iPZdO6ff0hjpme0fI
 K+hcsY9U0OcxstQ6q99fcYM=
X-Google-Smtp-Source: AMrXdXsAh7UObdy7ZWckLxIaybn6obM08nvXeefxVH68hT3Ehxco2PjCeLwxNbNb/FhznDDLcI9sEA==
X-Received: by 2002:a17:907:a809:b0:7c1:27a:d239 with SMTP id
 vo9-20020a170907a80900b007c1027ad239mr36098408ejc.34.1672742571978; 
 Tue, 03 Jan 2023 02:42:51 -0800 (PST)
Received: from [0.0.0.0] ([134.134.139.78])
 by smtp.googlemail.com with ESMTPSA id
 e22-20020a170906045600b0073022b796a7sm14184184eja.93.2023.01.03.02.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 02:42:51 -0800 (PST)
Message-ID: <8b4448d0-d9ea-95a6-83ee-513fe73c793f@gmail.com>
Date: Tue, 3 Jan 2023 12:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915/display: Check source height is > 0
Content-Language: en-US
To: Drew Davenport <ddavenport@chromium.org>, intel-gfx@lists.freedesktop.org
References: <20221226225246.1.I15dff7bb5a0e485c862eae61a69096caf12ef29f@changeid>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20221226225246.1.I15dff7bb5a0e485c862eae61a69096caf12ef29f@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: juhapekka.heikkila@gmail.com
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juha-pekka.heikkila@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Drew,

this is good find. I went looking where the problem is in and saw what 
you probably also saw earlier.

I was wondering if diff below would be better fix? I assume this would 
end up with einval or erange in your case but code flow otherwise would 
stay as is while fixing all future callers for same issue:

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c 
b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 10e1fc9d0698..a9948e8d3543 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -144,7 +144,7 @@ unsigned int intel_adjusted_rate(const struct 
drm_rect *src,
                                  const struct drm_rect *dst,
                                  unsigned int rate)
  {
-       unsigned int src_w, src_h, dst_w, dst_h;
+       unsigned int src_w, src_h, dst_w, dst_h, dst_wh;

         src_w = drm_rect_width(src) >> 16;
         src_h = drm_rect_height(src) >> 16;
@@ -155,8 +155,10 @@ unsigned int intel_adjusted_rate(const struct 
drm_rect *src,
         dst_w = min(src_w, dst_w);
         dst_h = min(src_h, dst_h);

-       return DIV_ROUND_UP_ULL(mul_u32_u32(rate, src_w * src_h),
-                               dst_w * dst_h);
+       /* in case src contained only fractional part */
+       dst_wh = max(dst_w * dst_h, (unsigned) 1);
+
+       return DIV_ROUND_UP_ULL(mul_u32_u32(rate, src_w * src_h), dst_wh);
  }

  unsigned int intel_plane_pixel_rate(const struct intel_crtc_state 
*crtc_state,


What do you think? I'll in any case come up with some test for this in igt.

/Juha-Pekka

On 27.12.2022 7.53, Drew Davenport wrote:
> The error message suggests that the height of the src rect must be at
> least 1. Reject source with height of 0.
> 
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> 
> ---
> I was investigating some divide-by-zero crash reports on ChromeOS which
> pointed to the intel_adjusted_rate function. Further prodding showed
> that I could reproduce this in a simple test program if I made src_h
> some value less than 1 but greater than 0.
> 
> This seemed to be a sensible place to check that the source height is at
> least 1. I tried to repro this issue on an amd device I had on hand, and
> the configuration was rejected.
> 
> Would it make sense to add a check that source dimensions are at least 1
> somewhere in core, like in drm_atomic_plane_check? Or is that a valid
> use case on some devices, and thus any such check should be done on a
> per-driver basis?
> 
> Thanks.
> 
>   drivers/gpu/drm/i915/display/skl_universal_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 4b79c2d2d6177..9b172a1e90deb 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1627,7 +1627,7 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
>   	u32 offset;
>   	int ret;
>   
> -	if (w > max_width || w < min_width || h > max_height) {
> +	if (w > max_width || w < min_width || h > max_height || h < 1) {
>   		drm_dbg_kms(&dev_priv->drm,
>   			    "requested Y/RGB source size %dx%d outside limits (min: %dx1 max: %dx%d)\n",
>   			    w, h, min_width, max_width, max_height);

