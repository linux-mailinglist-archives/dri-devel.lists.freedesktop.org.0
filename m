Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC752A3E8A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72396EC00;
	Tue,  3 Nov 2020 08:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA87A6E117
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 17:38:14 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id i26so11389597pgl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 09:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=8TTac8powIKxnrBZ37Qjfao9bhPKPpAxX0Xh5E4KL5E=;
 b=jK3ykP36tExYCAPVVAm2YTynBYGQPqQPtkKu+VT/+wxZypJUrIf06+iHJXRt7rvc7f
 eZvXoF2Gy3WcpC9qxFhN8Rqk1L8vuWPTngdn0V2yrmvRnruxfJ6A7F0M3TxZ+h1KHdvo
 tLkwUBvMmGO7zlP0m8dd8dceaXDiHrbBxsy/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=8TTac8powIKxnrBZ37Qjfao9bhPKPpAxX0Xh5E4KL5E=;
 b=jo34UMpH7UTKH3JSOARnV8lVtUCpiqdI8wt+fflsbAF6xEf9EKEAU1ZcBHhVU6ZY3k
 53lSir97yjF4Vs5aHZgcO4vZs8bM0QwA1B0Du/nix7uV2EEd0ijPRh10UJsNiHxsu5RB
 D+ApG7SEBGXlQBCPO9Sy5LAxgUr89E+RMkoHR0grqSNKxis3PghV1Lb5t3Z+A11fOLoR
 wGyoK4Q/jQ497RnEdxHuu3Q6S0KNS2QHFd5dEwh7hdrrQ3ZOMY7/EgLSJ+MZkecsiUeu
 TkB6SjCNeeTgpH0yN34twDpBtU+9MRx18PQnnHXp9QwWSqF+K1KBvnSV6gHyVcpfYxkM
 ttvw==
X-Gm-Message-State: AOAM530aYC4FJwKFx+25/o0qPN26Ap8HI1oT3Hu0sqfozUz4+0zfhrCC
 4aIq+i/gokfMMJp2Q/nMlJ69VQ==
X-Google-Smtp-Source: ABdhPJzv8jGtg/TxPSmziKdWoyu4EAbnBFaw7EnnZAW2MW+yGDBYCGFXtHl/8GkSlcNeKcwHVG9BUg==
X-Received: by 2002:a17:90a:ec13:: with SMTP id
 l19mr19246817pjy.51.1604338694299; 
 Mon, 02 Nov 2020 09:38:14 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id i25sm710301pfo.167.2020.11.02.09.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 09:38:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VKTS7G9a3x8iHg=eWRFtrcwKBdwbdtynmHhV4KPCnDKQ@mail.gmail.com>
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201030011738.2028313-4-swboyd@chromium.org>
 <20201101192027.GA7612@pendragon.ideasonboard.com>
 <CAD=FV=VKTS7G9a3x8iHg=eWRFtrcwKBdwbdtynmHhV4KPCnDKQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
From: Stephen Boyd <swboyd@chromium.org>
To: Doug Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 02 Nov 2020 09:38:12 -0800
Message-ID: <160433869233.884498.1989382962614280308@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2020-11-02 08:06:14)
> On Sun, Nov 1, 2020 at 11:21 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Thu, Oct 29, 2020 at 06:17:37PM -0700, Stephen Boyd wrote:
> > > @@ -265,6 +267,23 @@ connector_to_ti_sn_bridge(struct drm_connector *connector)
> > >  static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
> > >  {
> > >       struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
> > > +     struct edid *edid = pdata->edid;
> > > +     int num, ret;
> > > +
> > > +     if (!edid) {
> > > +             pm_runtime_get_sync(pdata->dev);
> > > +             edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> > > +             pm_runtime_put(pdata->dev);
> > > +     }
> >
> > Do we need to cache the EDID ? It seems like something that should be
> > done by the DRM core (well, caching modes in that case), not by
> > individual bridge drivers.
> 
> I can take the blame for the fact that it does caching, since I
> requested it in early reviews.  In general boot speed is pretty
> important to me and each read of the EDID take 20 ms.  There are
> definitely several calls to get the EDID during a normal bootup.
> Stephen did a little more digging into exactly what was causing all
> these calls and can chime in, 

In ChromeOS we get modes a couple times and then whenever we connect or
disconnect a DP cable for external display we also get modes. It seems
that we also run modetest at boot but I'm not sure why we do that. I
think it is to gather diagnostic data for all the EDIDs on the device at
boot so we know what all is connected.

> but in general until we can eliminate
> the extra calls it seems like it'd be nice to keep the caching?  This
> bridge chip is intended for use for eDP for internal panels, so there
> should be no downside to caching.  If we can later optimize the DRM
> core, we can fix this and a pre-existing driver that does the same
> type of caching (analogix-anx6345.c) at the same time?

I'd like to add the caching somewhere in the core (maybe the bridge
connector code?) but I don't know what the logic should be. Is it eDP
and if not hpd notify then cache all the time and if it is eDP and hpd
notify then cache once hpd notify says detected and drop cache when no
longer detected?

	if (eDP) {
		if (!hpd)
			cache();
		else if (hpd_detected()) {
			cache();
		else if (!hpd_detected()) {
			drop_cache();
		}
	}

I thought that EDID could change and HPD can be pulsed to notify that it
should be read again.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
