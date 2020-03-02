Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF445175C95
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 15:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E5D6E423;
	Mon,  2 Mar 2020 14:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969C96E41F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 14:09:09 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t11so6354482wrw.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 06:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XRIQ59iqTYwNc+hqtFnsFnguOGdxosd5Ax5+aRsxRB4=;
 b=Iox9flG+uqYLP9pD0xKHZ27taSdhoYIpeC+nbSTVOnWvC82gDSik6MlsO3SY/8HH6S
 yIi1iHV3ESAKeL/bPei6hLBFeLP4Dhk+aRU+IrAZvLhHvmTodqv9OyezFLdPYuDRDcmw
 hlq6FHEoedVwKtxNb/6fWe48iugWf287h2AvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XRIQ59iqTYwNc+hqtFnsFnguOGdxosd5Ax5+aRsxRB4=;
 b=AH/qhB6QoLFqYFsxecMrCHS4ZlZFAxoWAqMD6isIpuWFykdu+7K8uw3Qo3//9lQ4B2
 FE7K2xf0XXOPsLVfqzDZLPE3SClW30ZngfYpEwhYHJkn92/Jocp8MSIsCB42ZcGkxc7W
 ugRnKzi8/OVMkTLY9p5ICS7A2R/fW5c3UgJGd+OKAmNLQJDp/onXO4As1iWz81Iqjhdo
 0fzaUiifU2Vnocg5QadynG/qt+Py2DasQu1ZJwXMkgRBCJV9izmW+Z5naCS6aNhHOn9e
 Oi9uIRaRpDji/J90Gz8UiK2YSFpfeP8JH8kGtdgacEUOaltAG+y/l4T6Mk5lJISDjHrv
 nmkQ==
X-Gm-Message-State: APjAAAWZFpqrEZPpk3WzjUUyUbZ8TJ6nZvspcCHeEg+orbuCmYKcQ/k3
 DT8A0vH4jLTGlBgU+862/0Y8bA==
X-Google-Smtp-Source: APXvYqxoesu7zWQ1zks5QV94MLDuTDS3RTFDn2ZhfTdyaP88oo5OHcZw/urf/CVoeRW059b5sH//pg==
X-Received: by 2002:adf:f181:: with SMTP id h1mr17569367wro.361.1583158148335; 
 Mon, 02 Mar 2020 06:09:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h3sm29963651wrb.23.2020.03.02.06.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 06:09:06 -0800 (PST)
Date: Mon, 2 Mar 2020 15:09:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 26/51] drm: Manage drm_mode_config_init with drmm_
Message-ID: <20200302140902.GF2363188@phenom.ffwll.local>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-27-daniel.vetter@ffwll.ch>
 <20200228202632.GB22966@ravnborg.org>
 <CAKMK7uFmVD24hsON3T6mpTvJPcg5bTcbRe+kO4=TYD5kJaHrpA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFmVD24hsON3T6mpTvJPcg5bTcbRe+kO4=TYD5kJaHrpA@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 29, 2020 at 12:11:28AM +0100, Daniel Vetter wrote:
> On Fri, Feb 28, 2020 at 9:26 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > @@ -312,7 +305,9 @@ void drm_minor_release(struct drm_minor *minor)
> > >   *           }
> > >   *           drmm_add_final_kfree(drm, priv);
> > >   *
> > > - *           drm_mode_config_init(drm);
> > > + *           ret = drm_mode_config_init(drm);
> > > + *           if (ret)
> > > + *                   return ret;
> > We do not print anything in drm_mode_config_init() - so should
> > we do it here?
> > Otherwise we only get the more generic error from the driver core.
> 
> I can add a printk to drm_mode_config if people feel like. But it's
> guaranteed dead code in reality, because of linux' small memory
> allocation guarantee. Small mallocs like this one here of just 2
> cachelines never fail (at least not with GFP_KERNEL).

To make this not quite pointless I decided to add debug output to
drmm_add_action and drm_kmalloc. I think there it's actually useful for
debugging. Will squash that into other patches.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
