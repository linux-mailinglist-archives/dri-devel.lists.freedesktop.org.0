Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5814C5E53
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 19:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C96110E2B0;
	Sun, 27 Feb 2022 18:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8798510E2B0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 18:55:10 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d187so9112446pfa.10
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 10:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BUutuHj2Y4sBYwPZrJt3gLoK5iq9Xx8GjQfOHIMA2K4=;
 b=LssERTi7+6Oc9GsiOtykaNrIGp0U5bK2BuY/HFdPIvYfzS4lKrCtJPutZwYXtfGgi7
 NhOfUN4u5XVvksPllEuJM3X0YaL3u+W0zL2LSDOTflQEbi4ODxmT7SyggMv8NE08FghK
 6W81GWSdkfZbjNqYrry1cPcRifymCajTrSOyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BUutuHj2Y4sBYwPZrJt3gLoK5iq9Xx8GjQfOHIMA2K4=;
 b=ZMV/PRiZgLzwEWga4w/HBB8QD0UaifY3nuqk5s7ns9Sn5UISwz4KsG6CP4mvji/gLW
 UQVv3+yxwhA85PnT+GkJqeL6hofm+XftG69ZGRUbhIvZ6fMAc7MrYPxBuRqiWAcd0DHv
 A0XbFbpIaKxcOQyEwI/eykJ/os27hLJlKuzWdTH55TWubZr4Cai9huO0LKJ2lYwXt6lo
 xfKG2SJW/fPEBZCOVJK/QlWf4HEOfWpsGuGaKHMsduULnwfvpStbKe2XnilV1gr8zEsL
 tOXn8Z1ZEnFAYLgC10/hpYhvXKnZLAQVZ/s1yIknP7L/poqEa7nTd9tXGcfHWkzLf/xI
 HXog==
X-Gm-Message-State: AOAM5302dYqMj2QCfBgRYC/6ensrd42mz6Ua9/xivKTHt0L9/vibqvx2
 RqSf63u6q54u3VSE2EtE2xRUwg==
X-Google-Smtp-Source: ABdhPJy00TjfcczrXbPQJOZnPgE7hz1pTHrH+oGIaH1lig5NQe0zrVzrE1l1NTv6ss5VmpjLSU6PFA==
X-Received: by 2002:a63:1350:0:b0:378:7fb4:63eb with SMTP id
 16-20020a631350000000b003787fb463ebmr4139383pgt.457.1645988109770; 
 Sun, 27 Feb 2022 10:55:09 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 z12-20020aa7888c000000b004f3fc6d95casm2909273pfe.20.2022.02.27.10.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 10:55:09 -0800 (PST)
Date: Sun, 27 Feb 2022 10:55:08 -0800
From: Kees Cook <keescook@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/2] drm/dp: Fix out-of-bounds reads
Message-ID: <202202271053.91D3CE109@keescook>
References: <20220225035610.2552144-1-keescook@chromium.org>
 <YhihqzqPW7qbYnB9@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhihqzqPW7qbYnB9@orome>
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
Cc: Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 10:30:19AM +0100, Thierry Reding wrote:
> On Thu, Feb 24, 2022 at 07:56:08PM -0800, Kees Cook wrote:
> > Hi,
> > 
> > I'm sending these again, as they still need fixing. They have been
> > rebased due to the drm_dp_helper code being moved into a subdirectory.
> 
> Yeah, I noticed the other day that this had been partially reverted by
> the DP code move. I've applied this now, though it didn't apply cleanly,
> so I'll do a couple of test builds to make sure my resolution is correct
> and will push this out later on.

Awesome; thank you!

Yeah, I had based on drm/drm-next rather than drm-misc/drm-misc-next. I
wasn't sure which tree I needed to base on after the files moved.

FWIW, the resulting patches look good to me. Thanks for fixing them up!

-Kees

-- 
Kees Cook
