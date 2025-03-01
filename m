Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01190A4A9E5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 10:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1371410E027;
	Sat,  1 Mar 2025 09:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fn/+gxvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A1A10E027
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 09:11:49 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30a303a656aso30312221fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 01:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740820307; x=1741425107; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aYj9EmFInvMUKhXPbZju8haPAjZ+p2e+tp/UQEcEJJ0=;
 b=fn/+gxvExIOIcCO/oZh2JLh5SLkdl4KSNdpst/UaoFlOja23IpdGHfU2ZshGBtWeYu
 SaOys/oKfXHDcM1sdeBqFaqZypOMlutZW3Y6h8z+IISwv7yf62oO4EWzM2gcyVvkV3QO
 KZ/FvQjvplgD61lP+ETHhRF9X6El985SibWgz0GtzCsQmgUmVcnRj68WSJhDjsoEu8U4
 +vWFbU030yhW6qVq9PUVFh3r5BS2cDCkPGkXJ0P17fSicDSFgT5bY+f9JNDG2OfPPBpW
 wFAB9OxeLgSXX5ZDt65yeeQ/DwiAuGfTx2WUuEojT64zzap2Usc1la1jdAsw1mcawDmH
 hs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740820307; x=1741425107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYj9EmFInvMUKhXPbZju8haPAjZ+p2e+tp/UQEcEJJ0=;
 b=ElF+awW4B/BHnkm3C7RMlPXpiR5wXnjl+bKOBafQ6mi38WfyGYe72LJuukdPD9UBGA
 8pUl9vUmtjSyxDjM+n4lgdn1K2Yi9ONpzoflBIIx5iIqQYzTJUgdmLODGEA6UTWxEwhQ
 q7aL6p/2AKt39QeTFvTGMxQ43ekggtKVYqn0GHYm1s5LvcLZPXr/wastFHeDgpGY2kQR
 cCGs7EGCzIKtTui7cValvc9RfSHeNBbpz2qFR5cCXF5W752ClZlM3R5fbeagfvcLH4l+
 /8YxQdsvxHxQxM+sBUSwpvJGUSYWtQXRLx6LcRb85cUf4qmWOFvfKdM5i2Z6Kwdkf7/N
 3KFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0amMRVfoLqSvHFDFNy+nJXq3xDPFofVRG7vCzld2/PgVeIJkNHhhkj5ucVNrOKVPWE5skkyuYqd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy078Nn7OOW8HHUgMxz+c4tLJ/I9mF+G7YC8wruw9KIMSEu+p2z
 bfh9RHW/10xwAU3t6lKn4OMhPXb3TF2bm0ekjmew+EsWRzQx+6CqVSQJWjWdQXw=
X-Gm-Gg: ASbGncv6IUQUPxcG2qnQT69eSZkSmlPRw88bbb76G2WSIg/PsZAtcW/EsJHVnz5Lo5l
 FgZMnisLaKN4GVfYt8Sq0+UrUFWtc8ZYVU3qbkBLTw+nk33vZCIS+zKd1e4meZ5jG0JB/E6SarQ
 3TS0LaBCN0e0IXFHoaeIpUQ+nqfpfltCnGlf1uI1+BhB3y4V1QoK/kuSrgUnlFyxcdxrQUwumPg
 8AlH+S043b3MtE44O32x+eIfQ+/BD8qOj3MR9Tt8/lPMbu7A2vf0aJzVQ+oK9/ZGheBBKnv3qZ1
 YfB+GpSpYiVm8JpHTq0prSyMWBxYD0VoDeu26tM6wyZhrv1ApeRPmllGvf2nV0eKDFFRNuAnzDF
 ehQHXUZIhUKLluXoe0gbyJmHr
X-Google-Smtp-Source: AGHT+IE4HGuzBxzcEoFrkOedX31N4YMF2wWHxVY/nsHjlS/ri3PT6h8G6bwSl9JSN0NuyHMOaWjSSQ==
X-Received: by 2002:a2e:bc17:0:b0:308:f01f:183b with SMTP id
 38308e7fff4ca-30b932004e7mr21143391fa.2.1740820306765; 
 Sat, 01 Mar 2025 01:11:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b8685f35esm7560901fa.71.2025.03.01.01.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 01:11:45 -0800 (PST)
Date: Sat, 1 Mar 2025 11:11:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 7/8] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
Message-ID: <njnz5hxumrvqrgsfq7zlunle3jgfan3be34ao5xtkmzczpi6af@waywds2ww6qw>
References: <reqpxlbvlz5qssgy6gbjuou33h4zevo4xeztqbsr4keehplyhx@utv22a5ihohx>
 <eef68fc7-30f4-4246-a82e-4f90cd6a665d@huawei.com>
 <6jx5ldpidy2ycrqognfiv5ttqr5ia4dtbryta3kc2mkndrvvgo@qzuakucz765k>
 <6634386b-afc1-4e31-a2f4-9c1afed2d1d8@huawei.com>
 <CAA8EJpqHmhUxLE57XNeh-nVtSP7WvtBE=FiFWk9kqM_P+AC=0A@mail.gmail.com>
 <5af62fa9-e71b-412f-8640-502f03fcaa52@huawei.com>
 <vrsy4hao4qu3hlcbmjyfyibeearhhjgtik3e6o3v2eyzkatdve@kdb7cyvl45tu>
 <ade54ddd-79ea-4335-9058-c17e4525e83f@huawei.com>
 <4hicem4rbz5l7wnzaaz3krrl3euh2dmvlah2rb7errrdq5fann@44dvdxirkuzh>
 <6506e448-3851-436f-9354-42f9ef844d27@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6506e448-3851-436f-9354-42f9ef844d27@huawei.com>
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

On Sat, Mar 01, 2025 at 04:45:40PM +0800, Yongbang Shi wrote:
> 
> > On Thu, Feb 27, 2025 at 09:46:10PM +0800, Yongbang Shi wrote:
> > > > On Tue, Feb 25, 2025 at 09:57:17PM +0800, Yongbang Shi wrote:
> > > > > > On Mon, 24 Feb 2025 at 16:03, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > > > > > On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
> > > > > > > > > > > +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
> > > > > > > > > > > +{
> > > > > > > > > > > +  struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
> > > > > > > > > > > +  struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
> > > > > > > > > > > +  struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
> > > > > > > > > > > +  int ret;
> > > > > > > > > > > +
> > > > > > > > > > > +  if (dp->hpd_status) {
> > > > > > > > > > > +          hibmc_dp_hpd_cfg(&priv->dp);
> > > > > > > > > > > +          ret = hibmc_dp_prepare(dp, mode);
> > > > > > > > > > > +          if (ret)
> > > > > > > > > > > +                  return ret;
> > > > > > > > > > > +
> > > > > > > > > > > +          hibmc_dp_display_en(dp, true);
> > > > > > > > > > > +  } else {
> > > > > > > > > > > +          hibmc_dp_display_en(dp, false);
> > > > > > > > > > > +          hibmc_dp_reset_link(&priv->dp);
> > > > > > > > > > > +  }
> > > > > > > > > > If I understand this correctly, you are using a separate drm_client to
> > > > > > > > > > enable and disable the link & display. Why is it necessary? Existing
> > > > > > > > > > drm_clients and userspace compositors use drm framework, they should be
> > > > > > > > > > able to turn the display on and off as required.
> > > > > > > > > > 
> > > > > > > > > Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
> > > > > > > > > We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
> > > > > > > > > the different video modes into DP registers.
> > > > > > > > Why? The link training and mode programming should happen during
> > > > > > > > pre_enable / enable stage (legacy or atomic).
> > > > > > > Hi Dmitry,
> > > > > > > 
> > > > > > > Right, that's what I'm curious about. It won't call encoder enble/disable functions when I triggered HPD.
> > > > > > > And I'm sure the drm_connector_helper_hpd_irq_event() is called. So I add a drm_client for it.I
> > > > > > It should be userspace, who triggers the enable/disable (or it should
> > > > > > be the in-kernel fbdev / fbcon, which interface through the generic
> > > > > > drm_fbdev client).
> > > > > Right, I knew it. When I insmode my driver firstly (or restart display service), it will call disable, modeset and enable,
> > > > > by user, but it won't call when HPD triggered .
> > > > - Is HPD even properly delivered to userspace? What kind of compsitor
> > > >     are you using? Is .detect working properly and reporting a correct
> > > >     plug-in state?
> > > Thanks for your answering. I'm not very good understanding about userspace in framework. In my opinion, when I call
> > > this drm_connector_helper_hpd_irq_event(), the HPD will deliver to userspace.
> > > I use Xorg, and the display service is GDM.
> > > The .detect is called and the getting modes info is correct.
> > > I find that it would only trigger(disable, modeset and enable), when I changed resolutions, restart display service and insmod driver.
> > You can go to the display settings in GDM. It would be interesting to
> > observe if it notes the second monitor or not. Last, but not least, you
> > can use a simple tool like 'xrandr' under your XOrg session to set the
> > display resolution.
> 
> Thank you for your advice!
> Right, there are DP and VGA two monitors. I tried to totally remove the vga connector in driver, the problem is gone.
> So do I need to clear the vga connector, if dp is plugged in?

Unless your hardware can not manage two outputs at the same time, no,
you don't have to. Just check how it behaves on x86 systems. Ideally
your driver should have the same behaviour.

> And also, I used xrandr to set modes after 'startx'. Changing resolutions works,
> but there are errs when set some low resolutions.

That's a separate topic, most likely related to timing or to some other
issues. You can fix that separately (but please do, switching modes
should work).

-- 
With best wishes
Dmitry
