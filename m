Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118951FEE0
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3C010E0B1;
	Mon,  9 May 2022 13:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AD810E0B1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:54:16 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id k27so16383196edk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oPilTVKzfOkw5Jbtqt23udnLjj78c9bjEutFBwL7lgA=;
 b=jKfUWHyE1mwhO/V4WT6s49oLKnaVfPpkjeAO7GB69APc82lZKayZozm5GG7BLfbin/
 UuHpZ5A6naZudN7pLa0JAxe17zXLbCcr/ZeQHKExEn+1cDYZYfHMsaRvcbyVLLppsrb7
 0g5SV5TWGhmt8JvFun39Md7/zkMECMt+/8hPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oPilTVKzfOkw5Jbtqt23udnLjj78c9bjEutFBwL7lgA=;
 b=LmYFBfXcj94Lv/PHalU1BZnFzXu7/8Rrt+Ci73NuPK2P+2twIIwbjKD6t1E/8f+8Ni
 AxQ7QNEOI44xK8ZiUihz4OEDI9/QHiYU77eiANHk/yz06xGcVZuK2q/Hx3BY9QwH+54F
 ULeUeJYgRbTJfZCcApA+P8ap/Y0Nd/0OiahioUZhHBQA5l9/3hOLgj28FJUno8EuYmOs
 fedrgsfTAOwbvui36RO0daC/QLnl7lwESDi1PAtPzthyiyUOCOig62tVSYOonO0B1fHa
 o1pxZOUaF8NPzMhp9tveDpaLTosn2YZdf4utYmaTBylzIT1diV1XOCv9wOv2U9q8QnJD
 yT4A==
X-Gm-Message-State: AOAM533p2vW71ru0JiXsSL3MJdmUplw011K8f/HMmK4dRd/Iethqp1Ny
 wowuWwRR2b87de+i78cQH2I1GQ==
X-Google-Smtp-Source: ABdhPJwBBjCjOY1CcnfKRu/NYEZy50z+adnuDbj1O5LzzV4fiFOZHMeFex/q5JbcpHwVejvnVC4Blw==
X-Received: by 2002:a05:6402:948:b0:425:ea37:96b8 with SMTP id
 h8-20020a056402094800b00425ea3796b8mr17385083edz.90.1652104454632; 
 Mon, 09 May 2022 06:54:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 hz18-20020a1709072cf200b006f3ef214e0dsm5161375ejc.115.2022.05.09.06.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:54:13 -0700 (PDT)
Date: Mon, 9 May 2022 15:54:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mark Brown <broonie@kernel.org>
Subject: Re: (subset) [PATCH 1/2] [RFC] regmap: Add bulk read/write callbacks
 into regmap_config
Message-ID: <YnkdA9gp08mvxYLb@phenom.ffwll.local>
References: <20220430025145.640305-1-marex@denx.de>
 <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
 <877d6zkjw5.fsf@intel.com> <YnUXvXmDgLccTRNP@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnUXvXmDgLccTRNP@sirena.org.uk>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: marex@denx.de, jagan@amarulasolutions.com, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, sam@ravnborg.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 06, 2022 at 01:42:37PM +0100, Mark Brown wrote:
> On Fri, May 06, 2022 at 01:58:18PM +0300, Jani Nikula wrote:
> 
> > Hey Mark, sorry for hijacking the thread a bit. regmap.h seems to have
> > comprehensive API documentation, but there's very little in terms of
> > higher level documentation that I could find. Is there any?
> 
> Not outside of the source.  I did a presentation at ELC-E ages
> ago which you can probably find but I'm not sure how much it
> would add.

I watched that one!

Anyway no recording, but I think I've found the pdf. Was in 2012
apparently.

https://elinux.org/images/a/a3/Regmap-_The_Power_of_Subsystems_and_Abstractions.pdf

Cheers, Daniel

> 
> > I've been toying with the idea of adding a regmap based interface for
> > accessing Display Port DPCD registers, with caching, and regmap seems
> > like it's got the kitchen sink but I find it a bit difficult to
> > navigate...
> 
> The bus code is generally very thin so you shouldn't need to
> worry about what the core is up to much if you just want to
> support some bus.  If this is a bus that has registers at
> hardware level then looking at something like regmap-sdw.c should
> be helpful, for something that's just a bit stream at the bus
> level then something like regmap-i3c.c is a simple example.



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
