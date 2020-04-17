Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 180551AE0F4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1166EC3C;
	Fri, 17 Apr 2020 15:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949516EC3C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:23:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r26so3428647wmh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xwvBBGP6XODNxylPgMW6KMF6+zxJ6hauRpgc8isQ/s0=;
 b=jJ4sDmvxu2xQFEut1aJaSw96vpmEq7h0CmEEYHWKJeC8kmcGxVFO29D0KBh8/cbZmh
 QHpbRkCt0b0oQJz3QtDmz25A9R7rtGyVAFGDcqKBSIJbDkKIbGfkaAFHhSI8fK8eXZ0F
 6hnlqqERqB4VLXAZ5M0yABZUokDb55O/sXJlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xwvBBGP6XODNxylPgMW6KMF6+zxJ6hauRpgc8isQ/s0=;
 b=gN6ZsChJBkaE47uycLlSs83J7doTYBt31dduCORqMcyvijnzw4HkG05onR1SI5H8q6
 bc6J7BZLPqARash8fDew3mFHde6Phs5DoVgWKNiz0fDVmXEVsO5Ehlt6gPn7Vfdrzakk
 Hgm8JaRO1VjYdH7eiAR6UWMn3CMukAVa8EAOsiCr/kSnC6VHBBvBK90WdPRro++bzdCv
 R1wiJ8xwxKFDzlcfTD7Wxr7M0y8WqG0pQdpGgQqTRBn1ddh4kbvwLdPLi4ZZN+jqt0cq
 BRiD2xsGJYlHSpmhwFbnOKblnk7xeXMslTgWgkxCaRXi9D0jdR22BXFQlnsmAQjspvew
 gTsw==
X-Gm-Message-State: AGi0PuYzcK+F+CpaIuRjSJmTQywzN+YZQIlHbaBS1G40rwcKsaBHEoTf
 xBivTfZgbZAydY2l7A/mNZRpkQ==
X-Google-Smtp-Source: APiQypK7SNGOEdkYiufxXCGrkdhTlxCyEf/fSyck9qXER30rJkfzIOOTp560RnTadMQaEcQI5CVh6g==
X-Received: by 2002:a1c:a7c4:: with SMTP id q187mr4213973wme.56.1587136993223; 
 Fri, 17 Apr 2020 08:23:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c20sm8699843wmd.36.2020.04.17.08.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:23:12 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:23:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: Fix page flip ioctl format check
Message-ID: <20200417152310.GQ3456981@phenom.ffwll.local>
References: <20200416170420.23657-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416170420.23657-1-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: stable@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 08:04:20PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Revert back to comparing fb->format->format instead fb->format for the
> page flip ioctl. This check was originally only here to disallow pixel
> format changes, but when we changed it to do the pointer comparison
> we potentially started to reject some (but definitely not all) modifier
> changes as well. In fact the current behaviour depends on whether the
> driver overrides the format info for a specific format+modifier combo.
> Eg. on i915 this now rejects compression vs. no compression changes but
> does not reject any other tiling changes. That's just inconsistent
> nonsense.
> =

> The main reason we have to go back to the old behaviour is to fix page
> flipping with Xorg. At some point Xorg got its atomic rights taken away
> and since then we can't page flip between compressed and non-compressed
> fbs on i915. Currently we get no page flipping for any games pretty much
> since Mesa likes to use compressed buffers. Not sure how compositors are
> working around this (don't use one myself). I guess they must be doing
> something to get non-compressed buffers instead. Either that or
> somehow no one noticed the tearing from the blit fallback.

Mesa only uses compressed buffers if you enable modifiers, and there's a
_loooooooooooot_ more that needs to be fixed in Xorg to enable that for
real. Like real atomic support. Without modifiers all you get is X tiling,
and that works just fine.

Which would also fix this issue here you're papering over.

So if this is the entire reason for this, I'm inclined to not do this.
Current Xorg is toast wrt modifiers, that's not news.
-Daniel

> =

> Looking back at the original discussion on this change we pretty much
> just did it in the name of skipping a few extra pointer dereferences.
> However, I've decided not to revert the whole thing in case someone
> has since started to depend on these changes. None of the other checks
> are relevant for i915 anyways.
> =

> Cc: stable@vger.kernel.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Fixes: dbd4d5761e1f ("drm: Replace 'format->format' comparisons to just '=
format' comparisons")
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index d6ad60ab0d38..f2ca5315f23b 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1153,7 +1153,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  	if (ret)
>  		goto out;
>  =

> -	if (old_fb->format !=3D fb->format) {
> +	if (old_fb->format->format !=3D fb->format->format) {
>  		DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.=
\n");
>  		ret =3D -EINVAL;
>  		goto out;
> -- =

> 2.24.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
