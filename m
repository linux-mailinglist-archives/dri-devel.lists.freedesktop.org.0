Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D98B8B1769
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 01:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCC3113EA2;
	Wed, 24 Apr 2024 23:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EMSa9moi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF66D113EA2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 23:49:43 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6f103b541aeso414012b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 16:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714002583; x=1714607383;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5Ln4ozbltMQ1gS/VWFP66dxI6mY0+jL0XYSMnzOQX84=;
 b=EMSa9moiJz+c2vk0nabb4aWM3nKzXmgXj456ryVJ6K1ZrnPcwJJk4/nB59dy/NuXpd
 JarE1IaKKsRvwBLyndMYxyVgIDDIVGWbOaJdIRnCPIRqDbRf5sem3QQofjfWV7OyX5Vz
 JBv+7CrNNaEyWgGoiEJsDgT4KVLP7z5l1NnMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714002583; x=1714607383;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Ln4ozbltMQ1gS/VWFP66dxI6mY0+jL0XYSMnzOQX84=;
 b=fiZUMX9TqdzTCUAFzGUvp7hMScsVy+4NMmWesmjZuDO6KSDDLqs0gXkEn2SOicsHW9
 GvleHXFnwy0j+fOjLrHTjyHak2an90fgeq8qDpFdvFMoWM3LD8bvjU0p+4gULZ3he2Iw
 enLrXnRWH9NhhGP/wg402nmcVsP1Qtwjfz3KUsl0qzngONW5+vHt6JH0h2qDem5tYVVE
 U85Nv9CoVThgtlvAo/3criWMPo1J9ef0BCA7axS3li5Kl1zBVV8kMcfdd/mYzXJ/W4o3
 Eb4Tzj2E/t6ccttos9N0JWp4idagVQ1dbrmt0dUSAWNAKE8CEPtFxryKjYXOFcTm6Kkq
 Pe6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVikr8i/jbaqMVAwdsZ8t7hiMFFjtcVEAmPQYIUjmSlypGwPVzbLRqD8nmld69zw78tuZPGfaggNOCfjpVxo7bWizx1wA9FU0G1V8kRFSst
X-Gm-Message-State: AOJu0Yxz6NevAnuJM9VoCpGJwyvNk0QlK5qQ9roh/INsYzNgNKDe8NE6
 PtQVTimD1S6NDltHZZ/BeFaQ0msxR5eaOy7z+UY/RZ3WqGuUfxHMUftD3tl/Qw==
X-Google-Smtp-Source: AGHT+IFO8Ea4GR9fA+qYZG0KzcyI34jDzQm839FmGziVMLbFiO7Z04WwSyAKCKIv8DYuS0frG1SRdw==
X-Received: by 2002:a05:6a21:4982:b0:1a7:4b40:96db with SMTP id
 ax2-20020a056a21498200b001a74b4096dbmr4391151pzc.10.1714002583218; 
 Wed, 24 Apr 2024 16:49:43 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902ce8c00b001e1071cf0bbsm12498516plg.302.2024.04.24.16.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 16:49:42 -0700 (PDT)
Date: Wed, 24 Apr 2024 16:49:42 -0700
From: Kees Cook <keescook@chromium.org>
To: Helge Deller <deller@gmx.de>
Cc: Justin Stitt <justinstitt@google.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: au1200fb: replace deprecated strncpy with
 strscpy
Message-ID: <202404241647.E1DE1D9@keescook>
References: <20240318-strncpy-drivers-video-fbdev-au1200fb-c-v1-1-680802a9f10a@google.com>
 <53670007-edbc-4762-9e57-0b3c29220d9e@gmx.de>
 <CAFhGd8ppVq9aGbfFLeL30jQ15KHS=FoLh0c1udXo=Z+pCfXL1g@mail.gmail.com>
 <49ba1e7d-d256-4644-beb9-c84b9feb0052@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49ba1e7d-d256-4644-beb9-c84b9feb0052@gmx.de>
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

On Wed, Mar 20, 2024 at 11:48:52PM +0100, Helge Deller wrote:
> On 3/20/24 23:35, Justin Stitt wrote:
> > Hi,
> > 
> > On Wed, Mar 20, 2024 at 12:56 AM Helge Deller <deller@gmx.de> wrote:
> > > 
> > > On 3/19/24 00:46, Justin Stitt wrote:
> > > > strncpy() is deprecated for use on NUL-terminated destination strings
> > > > [1] and as such we should prefer more robust and less ambiguous string
> > > > interfaces.
> > > > 
> > > > Let's use the new 2-argument strscpy() which guarantees NUL-termination
> > > > on the destination buffer while also simplifying the syntax. Note that
> > > > strscpy() will not NUL-pad the destination buffer like strncpy() does.
> > > > 
> > > > However, the NUL-padding behavior of strncpy() is not required since
> > > > fbdev is already NUL-allocated from au1200fb_drv_probe() ->
> > > > frameuffer_alloc(), rendering any additional NUL-padding redundant.
> > > > |     p = kzalloc(fb_info_size + size, GFP_KERNEL);
> > > > 
> > > > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> > > > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> > > > Link: https://github.com/KSPP/linux/issues/90
> > > > Cc: linux-hardening@vger.kernel.org
> > > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > > ---
> > > > Note: build-tested only.
> > > > 
> > > > Found with: $ rg "strncpy\("
> > > > ---
> > > >    drivers/video/fbdev/au1200fb.c | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
> > > > index 6f20efc663d7..e718fea63662 100644
> > > > --- a/drivers/video/fbdev/au1200fb.c
> > > > +++ b/drivers/video/fbdev/au1200fb.c
> > > > @@ -1557,7 +1557,7 @@ static int au1200fb_init_fbinfo(struct au1200fb_device *fbdev)
> > > >                return ret;
> > > >        }
> > > > 
> > > > -     strncpy(fbi->fix.id, "AU1200", sizeof(fbi->fix.id));
> > > > +     strscpy(fbi->fix.id, "AU1200");
> > > 
> > > I wonder if you really build-tested this, as this driver is for the mips architecture...
> > > And I don't see a strscpy() function which takes just 2 arguments.
> > > But I might be wrong....
> > 
> > I did build successfully :thumbs_up:
> > 
> > Commit e6584c3964f2f ("string: Allow 2-argument strscpy()") introduced
> > this new strscpy() form; it is present in string.h on Linus' tree.
> 
> Interesting patch.
> Might give compile problems if patches like yours gets automatically
> picked up to stable series as long as Kees patch hasn't been backported yet...
> Anyway, thanks for the pointer!
> I'll apply your patch in the next round for fbdev.

Hi! I haven't seen this show up in -next yet. Have you had a chance to
pick it up?

There are also these too:

https://lore.kernel.org/all/20240320-strncpy-drivers-video-fbdev-fsl-diu-fb-c-v1-1-3cd3c012fa8c@google.com/
https://patchwork.kernel.org/project/linux-hardening/patch/20240320-strncpy-drivers-video-fbdev-uvesafb-c-v1-1-fd6af3766c80@google.com/
https://patchwork.kernel.org/project/linux-hardening/patch/20240320-strncpy-drivers-video-hdmi-c-v1-1-f9a08168cdaf@google.com/

I can toss all of these into the hardening tree if that makes it easier
for you?

Thanks!

-Kees

-- 
Kees Cook
