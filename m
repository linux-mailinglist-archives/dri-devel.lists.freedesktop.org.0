Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D762D417A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 12:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B526EA0B;
	Wed,  9 Dec 2020 11:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B5D6EA19
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:56:14 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id j12so1049194ota.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 03:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nac73jJQqwYAxYov3s+USnMs5pJwJ4HIU6DRKUk/10I=;
 b=DShSsknGSTcO5q371O1CRAExcAHKUwPxDf9oK9toeCgNoBIYCyTa75t5R+XoxYkFFB
 8qwuVPODWJ2c0F/Tsf7eEOd7Rbq5HErv2QRSQSBTD8yPfJ/KYl1WzNxgp5ACaz3qETgb
 OJt6GC1HR7wF9PRpFJ22c2EgAC5PS+slv3UPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nac73jJQqwYAxYov3s+USnMs5pJwJ4HIU6DRKUk/10I=;
 b=ZkX404pUJPU08S+hHv/rwiHUndbQANkJB4B2Qmrdtr9c/6Q0DHchHWLolkDoXIAMZl
 5ycQGV2UtcK/Z0x10T6QtF9Yd6owzG0QNmw3exckk7GLJXTzn1fzYhbk0lJoPfq1Q/2c
 xmshqxIshhUWOcC7mlx6BohpGkQ6hVS5z1iegDnGIAGY0Drk626wjs+E2g99RGcs+iB+
 lCWcOCoqir1VMdNcgtkRDJoKJm6nJTQUkLUSXQN+xmP5VFbUi6pDm9Ok02sJ0u94Gvgb
 b+nM+WxFMjWVQPNEykNUZ31gQDTBUWhUJM0zJ+Y8druoBN2SMVSY/oQzMrS12rqBxeCd
 fpUA==
X-Gm-Message-State: AOAM532LomzahLgFif2ucZxeUDRCq9g682krt27XTPrVrNeHY6Uar5im
 OqGgu40MV0NMiHYy/wP0cpNw5pD3ih6vbhuHYQQK0w==
X-Google-Smtp-Source: ABdhPJw6OH4BZjXBnN4BhUYKez2px51Lh3nsFIdCJ03taoHzCuFYhQw/XtzIBoIWsImaCPHFBE2+ISwGnoyYO8XmtxI=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr1378061otb.281.1607514974241; 
 Wed, 09 Dec 2020 03:56:14 -0800 (PST)
MIME-Version: 1.0
References: <1607413859-63365-1-git-send-email-tiantao6@hisilicon.com>
 <20201209004828.GN401619@phenom.ffwll.local>
 <06c1dee7-488d-8a74-a55c-74043cb060cd@ti.com>
In-Reply-To: <06c1dee7-488d-8a74-a55c-74043cb060cd@ti.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 9 Dec 2020 12:56:03 +0100
Message-ID: <CAKMK7uFsDPH3+CHGwkgtnDOc6pJY=_SocyaghETZda+RgjAJnQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tidss: Use the new api devm_drm_irq_install
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Tian Tao <tiantao6@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 9, 2020 at 12:29 PM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> On 09/12/2020 02:48, Daniel Vetter wrote:
> > On Tue, Dec 08, 2020 at 03:50:59PM +0800, Tian Tao wrote:
> >> Use devm_drm_irq_install to register interrupts so that
> >> drm_irq_uninstall is not needed to be called.
> >>
> >> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> >
> > There's another drm_irq_install in the error path. But I'm not sure this
> > is safe since you're chaning the order in which things get cleaned up now.
> > So leaving this up to Tomi.
>
> Right, I don't think this works. tidss irq_uninstall uses runtime_get/put, which needs to happen
> before pm_runtime_disable. With devm_drm_irq_install that's not the case.

Hm I don't spot devm_ versions of these, surely we're not the only
ones with this problem?
-Daniel

>  Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
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
