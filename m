Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40A6606B6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 19:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D56B10E8BB;
	Fri,  6 Jan 2023 18:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915C810E8BB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 18:57:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso1716624wmp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 10:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XUh0IXF/zoWXCTp+p2MRjCNZYWIZ51h68rQ5cEM5tpw=;
 b=XTgpuo4jRKZzt6v6Zru8dYa1k0bQ1hYicZRbvmqa9b0M/Sgq4bK9j02OvKzAB2mFfL
 d//l+1jaq7OTOTN8suuLQcDxyCdNoleFxIAz80LpN96Asl8kCsIAndbNiaIFfSf3B+5s
 vL1+CDJkcwFEc2I/2YtvjJnISW6PTUyGhaazs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XUh0IXF/zoWXCTp+p2MRjCNZYWIZ51h68rQ5cEM5tpw=;
 b=sALnejQKDa+7TrfG5o/TzvwrBUp8ejklVPkvO/jAUMin8i55zfw/Q0zGNlJnw+F/VJ
 Za+BsoxA8stIlqDUaEY/bAUIpGVQc1twAYGCtywOYTlBEajRe7s86ilgMkbBVWelpOoh
 aswUh3P87sHnAyFEShDqMNJUGy6Huk1ymACvWAL5yzfmfecaSAkI11ZHDJXeKUl5rX3I
 wdKm14xToCNE3WvBCK/owj4tHcOW6fJsp7uwClt2QI/pdcQZX8gyat5QBmQA3YEtwO51
 w3U4Tud9H5iCRy9ZkE6Jf3Zq/+YSxTMW4RLhs9EqAs5uWMuXpRX1L6sfeEo45H0JW/gY
 dWJw==
X-Gm-Message-State: AFqh2kq6YuaY4LvSbUKGDp3fkwwgNVJHeWA/XWJbtoapoGIjDFzUjnee
 32cHPKbN8mpXW9EmKlJIa+B75g==
X-Google-Smtp-Source: AMrXdXslRLQLB/Ktf0sZLYyJRjniidYEK/i6RyqLH7YEExhaUOLvafcXSay+yRyqDvKToYNbvGmvUA==
X-Received: by 2002:a7b:c39a:0:b0:3d2:640:c4e5 with SMTP id
 s26-20020a7bc39a000000b003d20640c4e5mr38564318wmj.8.1673031474143; 
 Fri, 06 Jan 2023 10:57:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a7bc40d000000b003d9b351de26sm2574154wmi.9.2023.01.06.10.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 10:57:53 -0800 (PST)
Date: Fri, 6 Jan 2023 19:57:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm/drv: Make use of local variable driver in
 drm_dev_register()
Message-ID: <Y7hvL2ki0vPiCYsY@phenom.ffwll.local>
References: <20221219183147.1639399-1-u.kleine-koenig@pengutronix.de>
 <769f62a9-da8a-188f-fd83-494ce0a7c566@suse.de>
 <Y7bfqaLUaqXBsBmr@phenom.ffwll.local>
 <20230105201636.slzwxyqqrkwwe7gr@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105201636.slzwxyqqrkwwe7gr@pengutronix.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 09:16:36PM +0100, Uwe Kleine-König wrote:
> Hello Daniel,
> 
> On Thu, Jan 05, 2023 at 03:33:13PM +0100, Daniel Vetter wrote:
> > On Tue, Dec 20, 2022 at 08:24:18AM +0100, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 19.12.22 um 19:31 schrieb Uwe Kleine-König:
> > > > There is a local variable that contains dev->driver. Make use of it
> > > > instead of "open coding" it.
> > > > 
> > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > 
> > > Added to drm-misc-next. Thanks a lot.
> > 
> > Given that Uwe has a pile of drm commits all over, time for drm-misc
> > commit rights?
> 
> I feel honored, but if you ask me, that's not necessary/sensible. At
> least up to now my patches are more or less drive-by changes and letting
> them go through someone else with commit access is fine for me. There is
> no driver in the drm area I feel responsible for.
> 
> Or is this about reducing maintainer load on your end?

Yes :-)

Essentially it gives you the keys to drive your own patches, all you have
to do is find someone to review them for you (trading review works best).
And since all regulars have commit rights there's otherwise big confusion
whether patches should be pushed or not. Which means they routinely fall
through cracks and need extra attention from everyone involved.

Also note that commit rights does not mean you assume maintainer
responsibilities for anything (ofc your review is appreciated where you
can help out), that's still separate and tracked in MAINTAINERS as usual.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
