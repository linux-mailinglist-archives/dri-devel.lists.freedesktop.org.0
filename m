Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A0B26BE08
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 09:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAA46E34A;
	Wed, 16 Sep 2020 07:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8246E250;
 Wed, 16 Sep 2020 02:29:07 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y17so5240547lfa.8;
 Tue, 15 Sep 2020 19:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=GK9+C1oomDz6uVnNOODHcK5n0hkREpa5d365nxARSlQ=;
 b=ivXcT/BSWD9eHKF5fmu1LVGsfELyKmXRv1tgY3c1gUJxIT4s77oCje6K/STc1JilzO
 g0/HhFcMPovrz3+RIBb1UNIkIC0/QRlpica+HugQMxFwZOqAmrd0xd5ZnbPGSZd6VTBi
 Cwsuvr3v3olxvxA7FwJx8mr39VEuSR/kuOC7Qnk9tXAflMeYa2rBHRriGu7ioVCuzyID
 jlEEwb+zn9IEa3vpb9zasSWufVHjC45YZlP5Ye1EaFw60S8XhjWVMNoU2xTnIiaI7gs4
 kqVO8LmdfKlpOhxYKsHEZO2TUXkbmoYsUge7/02BZVBmOudRO+1wmsN4amtJvTd9MY2o
 NXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=GK9+C1oomDz6uVnNOODHcK5n0hkREpa5d365nxARSlQ=;
 b=G0OlDt7u3K1q26/HASuufzkov/5/XffqMdFKPX6Dmk89AjOaACLeOoDfjgGJ4qGFps
 V1/n4iXNVI6543HkcOuaIjIAetHa9xW7khbgcmfsQlUY1NGvqNn63fei4HODMPvBilcI
 E2mzk5rvLjXLmcl2CpGWXn0wqt8DHaoAtq/LMuXaQ8s3ldheAW122GuC90XMkyFHDc4z
 dmZfeNLZoDz3JApSXyc3oqID8xFTa8tJxrhxXwtvBY6NzkEBbSakyvZg08KMqDFdVtl7
 5mDGQjsGwXUFzXoQwjJH+1+W9fQHAZT0JTyQq0Be0Mh6wuiNRN9BpsR8w8gewGF13M1G
 P/Hw==
X-Gm-Message-State: AOAM532ebRqGM//vuOsLH+tJVlyU4ADWjhM7gMoN5YviasguaU1gX8gD
 nmRHRaMz/VGdeaqY04V/lD7TC8yaMehspNLNrg0=
X-Google-Smtp-Source: ABdhPJz3mJdWwByW2nnR8gVQDANHxxrdl0PgQIGP9uf/PCLvjp6cJ31H81PHZZUnHib8dRcNGmVl6SVajTnc8v6EZq4=
X-Received: by 2002:a19:e602:: with SMTP id d2mr6618353lfh.536.1600223346217; 
 Tue, 15 Sep 2020 19:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200912102558.656-1-zhenzhong.duan@gmail.com>
 <20200914162010.GB15060@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200914162010.GB15060@jcrouse1-lnx.qualcomm.com>
From: Zhenzhong Duan <zhenzhong.duan@gmail.com>
Date: Wed, 16 Sep 2020 10:28:54 +0800
Message-ID: <CAFH1YnM1O6bE2bYbCjaWHfvo47TkHjh999yeESy81UMxMW_KYg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix a potential overflow issue
To: Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, 
 Daniel Vetter <daniel@ffwll.ch>, smasetty@codeaurora.org, 
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 16 Sep 2020 07:31:48 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 12:20 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Sat, Sep 12, 2020 at 06:25:58PM +0800, Zhenzhong Duan wrote:
> > It's allocating an array of a6xx_gpu_state_obj structure rathor than
> > its pointers.
> >
> > This patch fix it.
> >
> > Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
>
> LGTM but should have a Fixes: tag for the stable trees
>
> Fixes: d6852b4b2d01 ("drm/msm/a6xx: Track and manage a6xx state memory")
> Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

I had sent a v2 version with same change as you suggested on Sep 14,
could you help review it? Thanks
https://lkml.org/lkml/2020/9/13/311
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
