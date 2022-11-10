Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E896245FB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 16:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E8510E715;
	Thu, 10 Nov 2022 15:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5080410E715
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 15:32:44 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ft34so5804216ejc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 07:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lLWyKRw2Ej5Lpfhe4CBr1qjwt8vEPyBuJa6C43wuPh8=;
 b=OkyOgnKMAJGwRvPJAFhXDJESxbMLb1Fk0onxCfwxfvJg9rRma53fxA9Hi2o5w58I03
 +8HpwRbWFlTbcs53Se/6vK/S1S2fRP2RwZiXmYjABU9SNbw54OVQbnE0QdpD81tMek/n
 8wAr94Fchj/KpWbCevBtzdDELjSbHgxIu3NTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lLWyKRw2Ej5Lpfhe4CBr1qjwt8vEPyBuJa6C43wuPh8=;
 b=AFAYGE+b2zDZDIu5kf6tjYbVg8uT5FCMjdkuQEqay8bgajZ0yeJpUZSFbI6aXrY74x
 BGSJCvizncAI4qFYK5E6IDVLlIqYG8vFHhBc1ZjP6Q4pYuJevnZ9DB2+v+0VEztCttXw
 Q3E+ypwXhNwy7YlPGplRJJ1cOn4JZK1Z0LC1Cxxk1aap4G02jD7xxhlD8/Sg9+rGaNmJ
 vxVyAsbqm5VTLfRFOJDOopFeyifvfgkwkf0zgFrDus/7qzZ+TOrG9jVSY/cDB2ymkJDD
 FmYEVvli/RHxDReXWPwqV6mB2sOh+fIhq6WukX6+5lutWN6nWjYKz4erz7cHkDlhzbQl
 sEmw==
X-Gm-Message-State: ACrzQf2HTfsuB3UP0//v4Wx34ME2PqwsLF7mDTchlFTr1G+BvcLNpKqp
 BNmXJ742jOatoXVFw1eRMG2QFD8os2kfMmWW
X-Google-Smtp-Source: AMsMyM4POvCaaGUdjkd8YU1574reh5O2VSHNKBQ17xFDa6VOG4JEXZJt6GYX1dKyIdinzb3F/hE7jw==
X-Received: by 2002:a17:906:b801:b0:7ae:1990:5486 with SMTP id
 dv1-20020a170906b80100b007ae19905486mr32843976ejb.538.1668094361212; 
 Thu, 10 Nov 2022 07:32:41 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 x16-20020a170906135000b007ae32daf4b9sm7277038ejb.106.2022.11.10.07.32.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 07:32:38 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 h133-20020a1c218b000000b003cf4d389c41so3685604wmh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 07:32:38 -0800 (PST)
X-Received: by 2002:a05:600c:4486:b0:3cf:6e1d:f4a5 with SMTP id
 e6-20020a05600c448600b003cf6e1df4a5mr41251597wmo.85.1668094358585; Thu, 10
 Nov 2022 07:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20220831141622.39605-1-francesco.dolcini@toradex.com>
 <Y01kJbZjkwo1A8l1@francesco-nb.int.toradex.com>
 <Y2z4zoYU2rxrOKPC@francesco-nb.int.toradex.com>
In-Reply-To: <Y2z4zoYU2rxrOKPC@francesco-nb.int.toradex.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Nov 2022 07:32:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UHOdxmKFSapPshxyo0NW3UxsmzSXroe4riAFDWM6Si=w@mail.gmail.com>
Message-ID: <CAD=FV=UHOdxmKFSapPshxyo0NW3UxsmzSXroe4riAFDWM6Si=w@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: set bpc field for logic
 technologies displays
To: Francesco Dolcini <francesco@dolcini.it>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>,
 Aishwarya Kothari <aishwarya.kothari@toradex.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 10, 2022 at 5:13 AM Francesco Dolcini <francesco@dolcini.it> wrote:
>
> On Mon, Oct 17, 2022 at 04:18:13PM +0200, Francesco Dolcini wrote:
> > On Wed, Aug 31, 2022 at 04:16:22PM +0200, Francesco Dolcini wrote:
> > > From: Aishwarya Kothari <aishwarya.kothari@toradex.com>
> > >
> > > In case bpc is not set for a panel it then throws a WARN(). Add bpc to
> > > the panels logictechno_lt170410_2whc and logictechno_lt161010_2nh.
> > >
> > > Fixes: 5728fe7fa539 ("drm/panel: simple: add display timings for logic technologies displays")
> >
> > Hello,
> > just a gently ping on this. It applies cleanly on v6.1-rc1, anything I
> > should do?
>
> Hello Doug,
> can you help on this patch? I am not sure who is supposed to pick this
> small fix, but it looks like you recently took patches on
> "drm/panel: simple:", so maybe you can help.

Sure. It looks fine to me so I don't mind applying it. I did a quick
double-check and I was amused that the datasheet of the 800x480 screen
claims that it can show 16.7M colors with an 18-bit interface. ;-)

Pushed to drm-misc-fixes:

876153ab068b drm/panel: simple: set bpc field for logic technologies displays
