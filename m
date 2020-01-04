Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CAE13020B
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A401F6E41D;
	Sat,  4 Jan 2020 11:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C10A6E3A4
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 05:09:54 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d73so9994767wmd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 21:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X18W/LsPJYh5C2HwXq1c5bQUR8QbYZdM3EuKyF1GrFU=;
 b=bts1fJTwbC95FyC7zmEoNTZz7rPR4QA2PAIyQ/nJBg+BYZnm1/HPhnOvg8WFZhLee7
 YLgdpPsAX/Jzn5mXaaSztMZ5l8P2LKyfqGu68fBeUieK2ZfhxwOjZxBQOy4WB3NZNZ6h
 WL6LLvDY9goabK5H5lFmxOt6XLZS0u+Uq8u8S0pfSE+DXp4wph/mtKLkmIWkul4tb1KX
 BcajmRu7QXPvSm6XTOAUJeZzBTiP3XSVGXHWy4tAOLpTbS+Q7mRAT19D83U6q3G1d4D/
 MpxGD9kDw0uM12lsAnOGCmKNpQ7qc3viMWKF8MIEn4o9JO+cCmhvUq+2PVjXsJZeeydq
 BN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=X18W/LsPJYh5C2HwXq1c5bQUR8QbYZdM3EuKyF1GrFU=;
 b=ZaqLAtJLBj3fNVMe6xfuMP3qRqPqlJzIWEN7CRJ2+6WtqG1ljCvHiWWPeu0LdAZF/c
 7EJ49qGOhzBmL454HrmaT8u7ygh1PNDPwsRFxb7YoSsfrzpKwbE6EBVHwVxpAFtH/tXz
 FmZP2YuDvn40et8+yxT61vEM9WuxYO7STvzhnMdLE1H/8dxfZZjj5umwWTAdvcBVLHxJ
 u7kTm4f7Ixmjo2TRmsuq6ewmqYOHO9Nc4TmhV5/i2UxGOmUJiDJOrOtJ7/M901jcNrX9
 EntfOuwLTQ+NW2CFnOREtMi9rL08baKUSoi9RrjlgG5s1mg2qjtsiYNSS4S7dOPyCADa
 7ZGg==
X-Gm-Message-State: APjAAAXXbjVRwaTPg+lD1b57y8l17ranR405OQ16mx/1wrZT4J5TNxDY
 2j9DIs4rnnV9W9z05Mt/FZY=
X-Google-Smtp-Source: APXvYqwsjceE1f+sOmXbtZqg+MxLHQtJSKYWvzR1CpCH/vQEzNSwSjmmpUQKQ+0HHQNSLzbFwSI58g==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr22523584wmj.165.1578114593292; 
 Fri, 03 Jan 2020 21:09:53 -0800 (PST)
Received: from chinchilla (dutchdutch.xs4all.nl. [80.101.94.16])
 by smtp.gmail.com with ESMTPSA id f1sm62330598wro.85.2020.01.03.21.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 21:09:52 -0800 (PST)
Date: Sat, 4 Jan 2020 06:09:50 +0100
From: Matthijs van Duin <matthijsvanduin@gmail.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200104050950.GA11429@chinchilla>
Mail-Followup-To: Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191221164141.GI35479@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 21, 2019 at 08:41:41AM -0800, Tony Lindgren wrote:
> Also, I'm wondering if this change makes sense alone without the pinning
> changes for a fix, or if also the pinning changes are needed.

Both pinning and page-alignment are done just to support the direct
userspace mapping.  By themselves they mostly just waste tiler memory
but otherwise don't really have much impact.

It's not really clear to me why you have such interest in this specific
patch.  Does my patch series fix the tearing issue you've described?  If
so maybe without my patches tiled memory is just so slow that the frame
is being submitted too late, which perhaps causes an async page flip
(does it? I'm not sure) thus resulting in tearing?

Matthijs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
