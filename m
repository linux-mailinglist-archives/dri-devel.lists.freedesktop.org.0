Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7715140EBDC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 22:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77926E8E4;
	Thu, 16 Sep 2021 20:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F576E8E4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 20:49:11 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id q23so4982530pfs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JVccC7Mvhx6o/bD0bV/Vwew1fi+OqcnvpEf6l5YyNgw=;
 b=U11E3cp/VcjDGjgrxf4xUJz9A41+9cWJCoK9pSNjrrUmWl6XrcGmmJA/+yoz415uOR
 KfsmgLy0Ba4ovviFJezWVgCkmrVJC+LbsYSWK4pq5kL/7C+NixrIEwf7dUPC/V8KCYVy
 gmX8t+NrGhcmy74P5MtWN3mT1/MR4y110HLEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JVccC7Mvhx6o/bD0bV/Vwew1fi+OqcnvpEf6l5YyNgw=;
 b=3cX1J1jd4Gl/h8WnpMOZZV3NFgy+aOfr9dO4g0YsOKsNJM9MhkSiGAdV8Htm32QqWQ
 282ryCzMCm6OEhJ/u0E8kg+89jXTwMoFyMOPCy2yVeMn9JE8Vtc8y2XXdEOkhSyhrueX
 rSLoNzXr6N7s6MkepuLETRUKk8fj0raoqn4BhfjCtG18XNWyMV3vNt2k0a35EDMksSTR
 uCpINOE9/4uzSgN8HPGnz5fd/F32p/05XpHtlYeW2QR0jtFyKi4QJqo/tiLRMJIf4QDq
 jlhodIa2ZcML00ulkFFiLQ6n/mt9PxR8NuUGrFMIT5HpSNSNi3llh9SNAba2BeTxq9Bh
 zRKw==
X-Gm-Message-State: AOAM531OyX+iO/ynaURkadQuKFL74042WBylbIiIhOM6v6WQNSNNz0G1
 Y/JzkTIPwFUAIWTkZWZjLy502A==
X-Google-Smtp-Source: ABdhPJzq5WRtERTJ0m2De8qFYftJnE0yyziQCswwlGf7HMbsFpKLiXrb66wK9nN+GTdx1h+DY6dToQ==
X-Received: by 2002:a62:838b:0:b0:438:2910:25fb with SMTP id
 h133-20020a62838b000000b00438291025fbmr7297568pfe.45.1631825350816; 
 Thu, 16 Sep 2021 13:49:10 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d3ec:cf63:aaa9:e425])
 by smtp.gmail.com with ESMTPSA id c12sm3215413pfc.161.2021.09.16.13.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 13:49:10 -0700 (PDT)
Date: Thu, 16 Sep 2021 13:49:07 -0700
From: Brian Norris <briannorris@chromium.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, seanpaul@chromium.org, daniel@ffwll.ch,
 airlied@linux.ie, heiko@sntech.de, hjc@rock-chips.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v3] drm/rockchip: Update crtc fixup to account for
 fractional clk change
Message-ID: <YUOtw8FmQWoSBO/P@google.com>
References: <20210916202907.18394-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916202907.18394-1-macroalpha82@gmail.com>
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

On Thu, Sep 16, 2021 at 03:29:07PM -0500, Chris Morgan wrote:
> After commit 928f9e268611 ("clk: fractional-divider: Hide
> clk_fractional_divider_ops from wide audience") was merged it appears

What does that commit have to do with anything? Are you perhaps
interested in its parent, where the rockchip clock driver was actually
changed?

4e7cf74fa3b2 clk: fractional-divider: Export approximation algorithm to the CCF users

I'm just trying to follow along what's going on here.

Brian
