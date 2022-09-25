Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AFB5E942E
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 18:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9A710E2C3;
	Sun, 25 Sep 2022 16:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B413210E24C
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 12:34:53 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id t3so4018263ply.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=LBp7JKxATp3LGnBGQNabl2KMyCnQgfKt+agAmeM5KNw=;
 b=Uihs80S/aPoq+XHSizkaK+Qs8n3lDL52h5QSHCwiMu60QZFFFE2LykzHXkK+IZSwHI
 KLQTozB8oFRhPCsD1UjBouMgJX3In713/ey0vmumnCYq8SzdJYLm72uMfcf1U9l3UTQO
 rKnH6fnx26nEh5gVY0pyI/o0QYAQhE4nL6/v9PKxlYdAePpCGL7ThM7ekKiavfoq5cGd
 LDjYmSv9mLBMzDXJ0p9qQBp1EjKBVluaAnlkdERnVZKkhHJQK46HwUi3UHxHqF19Z5bP
 Mg9lD0U99s5ECVr5EzJa95TxcHORpnw1vVY3S4XIj2QUQVEhJ1K2Dx7FYIUVmu/XG/fd
 wbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=LBp7JKxATp3LGnBGQNabl2KMyCnQgfKt+agAmeM5KNw=;
 b=RuiMJHJa3MW+TjYLf2gu5AcDCzfHYk6cFfmuqx5OXsUOqLm2REtACZGMOvWeK5qROa
 j9EdMJ/j3tl8o7VItzig12bMK0OgfXwKxVxw67NZkJEYc3p5yoG2uF6Wu0JDq3nQMJMO
 n9ScHwpjwSi/0TfijHu8VRY8yuPMqxyI3LMgUEe+ENVeL9eRhYuZ66V8+3YgjBgbbha8
 FXYo+hE1mef5oCDQaG4XqsptbVqqiPIqJ7cHzfyHdZYrWk2/iIP9AjfhnHNJhQIOfSDb
 XJtaus0PSdTKBOmIkqfoxdHnXi/Z1xplCRwmLs4k07X6inm3Jo4mBW1DEOqpZa6+o2aN
 sMsA==
X-Gm-Message-State: ACrzQf0dPus0YJgn1m6Xs1xxn+9mfofnkLt+QO0Og61p7wM1Li7gr5Nj
 oYxwA9jQ3WAxSDUp6f5toDk=
X-Google-Smtp-Source: AMsMyM7rnBk8hQaiy/2yufZKFQ1309b2xwoWvl29Nt846j55qnNX31lEz/leDndE53f8qHCuxbTjtA==
X-Received: by 2002:a17:902:e74e:b0:178:b4c4:5ac4 with SMTP id
 p14-20020a170902e74e00b00178b4c45ac4mr17487255plf.11.1664109293374; 
 Sun, 25 Sep 2022 05:34:53 -0700 (PDT)
Received: from ubuntu ([175.124.254.119]) by smtp.gmail.com with ESMTPSA id
 n3-20020a170902e54300b001768517f99esm9190610plf.244.2022.09.25.05.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 05:34:53 -0700 (PDT)
Date: Sun, 25 Sep 2022 05:34:49 -0700
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] video: fbdev: smscufx: Fix use-after-free in
 ufx_ops_open()
Message-ID: <20220925123449.GA382038@ubuntu>
References: <20220925110329.GA380036@ubuntu>
 <dcccfc86-1bfe-e37a-fa6f-28a159e35f14@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcccfc86-1bfe-e37a-fa6f-28a159e35f14@gmx.de>
X-Mailman-Approved-At: Sun, 25 Sep 2022 16:02:49 +0000
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
Cc: steve.glendinning@shawell.net, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 25, 2022 at 01:57:46PM +0200, Helge Deller wrote:
> On 9/25/22 13:03, Hyunwoo Kim wrote:
> > A race condition may occur if the user physically removes the
> > USB device while calling open() for this device node.
> > 
> > This is a race condition between the ufx_ops_open() function and
> > the ufx_usb_disconnect() function, which may eventually result in UAF.
> > 
> > So, add a mutex to the ufx_ops_open() and ufx_usb_disconnect() functions
> > to avoid race contidion of krefs.
> > 
> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > ---
> >   drivers/video/fbdev/smscufx.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
> > index d7aa5511c361..a4378a7241f7 100644
> > --- a/drivers/video/fbdev/smscufx.c
> > +++ b/drivers/video/fbdev/smscufx.c
> > @@ -1065,6 +1067,8 @@ static int ufx_ops_open(struct fb_info *info, int user)
> >   {
> >   	struct ufx_data *dev = info->par;
> > 
> > +	mutex_lock(&disconnect_mutex);
> > +
> 
> The next few lines show:
>         if (user == 0 && !console)
>                 return -EBUSY;
> 
> in this case this function exits with the mutex held.
> 
> Please check all possible exit paths and unlock the mutex
> where necessary.

yes. I made a mistake.
I submitted a fixed v2 patch.


Best Regards,
Hyunwoo Kim.
