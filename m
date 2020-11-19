Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F22B9653
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4976E588;
	Thu, 19 Nov 2020 15:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990656E588
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:38:27 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l1so6864498wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6XA/mJ5qwxKzS/oPUNQf7OhfJDBjGk44DsUe5YEVuhA=;
 b=RAGa792RtRLMHN/6PxUhQ2WYVn4P3kUxISmR11CLAfzoJeAeWPHuleecbrhgxYl1Ox
 XAalTo1Cq6Pps/P1Za3IXB1JJo57Ya7j98lzmOxf2ya8VSfkclU09NNKd2vgh19S8yVK
 0mNqKjjYbLAv5KDSFqzuSzH0A6PhgQIE1fvA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6XA/mJ5qwxKzS/oPUNQf7OhfJDBjGk44DsUe5YEVuhA=;
 b=Xyw+03w3Q7hOiSWDlRde9emmIWXFNfOILiF6eAYwsPONCC91Ci25miqT77RG6dFme+
 0n8u1dDTm3JPiThMLTMCoy8YWyaTxzaNfXEhaMaE3dezqy3NY5mKs5odmLcjSqy4qZE1
 AKxL0jZoPkXoRqcJlDgXKOECYXtq7gHSiwWayiOuocJvKohhg+0lpm4wtcuDPUHcfIW7
 J2+gHwIf7AR3lc21mnLLOezQ3wgqYVpC1U9gs4Sk+r97nipBsG+jVhNSXCHn8NBQPLEz
 dX9Sf5Pm8HSWk+ILp/3y+zDq+aChO6geMG0YcCboYaE1YqYNs6pz5WYHp9Damcoru5Ex
 7LpA==
X-Gm-Message-State: AOAM531N6EfpxJvqCamEM5A2jeX0AglqrGNiIBzebkeYr9c3SUlvtUZX
 GMQ82zyEGZnxfMgM4bEYIIWC5g==
X-Google-Smtp-Source: ABdhPJziDV6aF0blOvMy2qku/KISMM8F79fMndj2I+clHB0om6jAJ3+8gKCTA8OjZgwinBkmve9uZA==
X-Received: by 2002:adf:9b95:: with SMTP id d21mr10439728wrc.335.1605800306341; 
 Thu, 19 Nov 2020 07:38:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f17sm344444wmh.10.2020.11.19.07.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 07:38:25 -0800 (PST)
Date: Thu, 19 Nov 2020 16:38:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/8] drm: Document use-after-free gotcha with private
 objects
Message-ID: <20201119153823.GF401619@phenom.ffwll.local>
References: <20201113152956.139663-1-maxime@cerno.tech>
 <20201113152956.139663-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113152956.139663-3-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 13, 2020 at 04:29:50PM +0100, Maxime Ripard wrote:
> The private objects have a gotcha that could result in a use-after-free,
> make sure it's properly documented.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  include/drm/drm_atomic.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 413fd0ca56a8..24b52b3a459f 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -248,6 +248,24 @@ struct drm_private_state_funcs {
>   *    drm_dev_register()
>   * 2/ all calls to drm_atomic_private_obj_fini() must be done after calling
>   *    drm_dev_unregister()
> + *
> + * If that private object is used to store a state shared my multiple

s/my/by/

> + * CRTCs, proper care must be taken to ensure that non-blocking commits are
> + * properly ordered to avoid a use-after-free issue.
> + *
> + * Indeed, assuming a sequence of two non-blocking commits on two different
> + * CRTCs using different planes and connectors, so with no resources shared,
> + * there's no guarantee on which commit is going to happen first. However, the
> + * second commit will consider the first private state its old state, and will
> + * be in charge of freeing it whenever the second commit is done.
> + *
> + * If the first commit happens after it, it will consider its private state the
> + * new state and will be likely to access it, resulting in an access to a freed
> + * memory region. A way to circumvent this is to store (and get a reference to)

s/A way to circumvent/Driver should/

And maybe make the paragraph break here and remove the previous one in the
middle of your example.

> + * the crtc commit in our private state in

&struct drm_crtc_commit so it's linked properly

> + * &drm_mode_config_helper_funcs.atomic_commit_setup, and then wait for that
> + * commit to complete as part of

s/as part of/as the first step of/
> + * &drm_mode_config_helper_funcs.atomic_commit_tail.

And maybe add "... similar to drm_atomic_helper_wait_for_dependencies()"

With the nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>



>   */
>  struct drm_private_obj {
>  	/**
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
