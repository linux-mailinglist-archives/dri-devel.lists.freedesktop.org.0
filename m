Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C1DB42B74
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7387010E937;
	Wed,  3 Sep 2025 21:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Re3xSb9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B636910E937
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 21:01:17 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-77250e45d36so337413b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756933277; x=1757538077; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t/ulgWiFwR6WnPcNdoSAtJQKq5PncNuo7vNG7WHcRgo=;
 b=Re3xSb9bWlFIR0rR9WESOZjST8r2uODn3sKmz1ph8oxuBd3u0CGg5i3gC8sl8kUlBu
 KzstqTrZhsQzJNqGMpdsHW3W11yaS8bAO2IYJMNB2j7/cWbhzdn1bV3X0VUChXR174Ch
 Uc+nmWsNZ2JwmNNpwmexpkI/SGq4T9dGvNxsStIcJG8HHswUU2o8oJZEYTUcjDB3OIy9
 oXen0xsyfj0sqNFK+DFfiRmmG4ps7fvZJe7NW9D0FO2k0q79XDwqhu/NL0RB6cO3w6hW
 0Ue51IISdUxkzofMy3O6Tb04aEEi3w1H4G+/0n9iWI/rleoZktX1ULf0pB4tzqTy/h4J
 1+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756933277; x=1757538077;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t/ulgWiFwR6WnPcNdoSAtJQKq5PncNuo7vNG7WHcRgo=;
 b=oLEOImkXcs9SxuXikg8g43jPgs+8eyucPGNM2XsEaEhNH03qjNH6/laITzWE/JNbgj
 9WNRBGqdh+zZLYtzkRKPqTUpg5FeRDfKkKrrLftK4J7pEA0ABTFI5FwF3RjdMwm6QkhE
 pLcmW2/bN+fagQNa4X0QUB18fwCQqvzyGz7Yx2Ed23yUV+CabDe0gkMHVtiEU4r+AM6L
 iKMuUwKHbgRQhMP02WwzeA5PPFCdWYZ5H2M04HHhQBcXjYPBNtnGyy6e3XZoeGoIE6hf
 hM/hoRKPE+m+tYpupDFPisAuRxs12DHdCWBjs/+a6/jgOd9j0wb5tx9xcUee3BhcTjJO
 WRig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZxehD2DIYGEM89OeNOB8Vludpf3v+mUCDP/bKpvqjoMnAh04xWxQkxw6iODNCbIvlwPEgMdnIBlk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQGrG3KyvLPNZezOnTLKcCknTGZNfDSvEiHvZvVTiPmaLkWzNo
 byQVIk2qMMpKGTUGvsEcXSxQ/SxP9KdAZH4oXMsCjGdUZiFt9OYGYQO0
X-Gm-Gg: ASbGncuxdR0/x+5fEDJm40hDBBNjF+F23TngIM46gnKCdwa4g4B7ui7H7d5cHd1+cqn
 MaGBpGlBCZZfbLCePtVim3js1chs6iZ+M9sDFP2XAHqUXCWXS9q2Jftxc+Vg1tKLxhTKD0TZGjD
 E6mYnefVLN0ydri0kA8jMH1I2iJtRWllXdsfTkhhZvw3iJ/3TwBn/+G8a1CB9DHDj3g7v4+qGqy
 e+4uQH0yeVp7+ELYYKHhiIZQVieQR8EeBKLA4alAYM8UfJxRetVyPACmo6D5uDIQNcI0RloimhQ
 efLnifu3vW2YtytnpsFqiRvwO1NfExsALnC9aE0IQhi0YcEph2mCKayJ71n60Vg2BpPnrLpvq3E
 Y/bp0i+U1YdXQTvwgiWu9SAzLP/yZJ/n+7ia0qDnXh9s=
X-Google-Smtp-Source: AGHT+IFmpCYt7p1ydoAkbSRULtTV0VpiAIvlL44IcB4e4sl/UMWQQ2dm1zJl84YOPMOhIdmIlupGmA==
X-Received: by 2002:a05:6a20:5493:b0:243:78a:8273 with SMTP id
 adf61e73a8af0-243d6f8b258mr23472656637.57.1756933277061; 
 Wed, 03 Sep 2025 14:01:17 -0700 (PDT)
Received: from localhost ([216.228.127.131]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4cd366a909sm14914404a12.52.2025.09.03.14.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 14:01:16 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:01:14 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 mripard@kernel.org, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <aLismmDJfusG0x0Z@yury>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com>
 <5255838.1BCLMh4Saa@phil>
 <4ox7yh3i47odinoaalzjz7d3gvx36bxbaspo6qfvvvl3jqhdiv@24ownjco3ud2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ox7yh3i47odinoaalzjz7d3gvx36bxbaspo6qfvvvl3jqhdiv@24ownjco3ud2>
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

On Wed, Sep 03, 2025 at 03:30:47PM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 01:59:51PM +0200, Heiko Stuebner wrote:
> > Hi Andy,
> > 
> > Am Mittwoch, 3. September 2025, 13:07:38 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > > From: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > Convert it to drm bridge driver, it will be convenient for us to
> > > migrate the connector part to the display driver later.
> > > 
> > > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > 
> > more like a general remark, this essentially conflicts with the
> > big hiword-cleanup [0] that was merged today, as the inno-hdmi driver
> > "lost" its separate HIWORD_UPDATE macro in favor a nicer generic one.
> > 
> > I'm not sure what the best way to proceed is, apart from waiting for
> > 6.18-rc1.
> 
> I'd say, the correct way to handle would have been to:
> - merge only FIELD_PREP_WM16 addition into bitmap-for-next using
>   immutable tag
> - merge the tag + all other patches into subsystem trees. Otherwise
>   that series can cause a lot of conflicts with all affected subsystems.
> 
> Yury, would it be possible to implement this plan instead of pulling
> everything through your tree?

Yeah, this is 100% technically correct way of moving things.

The problem is that driver maintainers are usually not quick taking
this type of changes. In my experience, if we merge #1 only, we'll
end up with just another flavor of HIWORD_UPDATE(), maybe adopted
by a couple of drivers.

This is exactly opposite to the original goal of the series: nice and
almost complete consolidation of scattered HIWORD_UPDATE() versions.

So far, there's the only conflict with the others, and Andy said he's
OK to hold his series.

I would prefer to have all those patches in bitmap-for-next for a while.
If there will be more conflicts, then yeah, I'll follow your route.
Otherwise, let's keep things as they are, and encourage developers to
test their patches against linux-next, as they normally should.

Thanks,
Yury
