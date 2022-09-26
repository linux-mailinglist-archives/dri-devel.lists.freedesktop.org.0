Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78575E9E3B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 11:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B438910E3EA;
	Mon, 26 Sep 2022 09:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5520410E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 09:48:21 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n15so9328160wrq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rhaVxqhRFD4ReD1YmvEfA36I59kgV9ycJURpgQIgPAY=;
 b=O0TGduRGFfxCPs1TNKBUjv2K0TRM3DSlGM8hGNEn2FmYLBYNJjuttfVFcSFBjmuxk4
 WDFfaWg9OIrIvgA+2Ck+eOg6SPcFURWT2Lev/2Bdr04NH0V7VsIQPW7IM3L+9/mlcUxo
 0npnBC7t9nP049u8cNYgRTEOkm/BZ2KXMTizB/vqAzwwbniRxnGmzOtLD2OmbIE5CDkJ
 bsDrHghNyiZ/NtxVazztuz03LTIP20/Epo79GFR2XSkjJ+AEUUKmQFCb9ndAcZ0+vg51
 DoeqtFuetskqORqVry16CF7xCqKcBP4GidFrt4dMgV5m8xOFQKOChoX/TMVtQgynNExZ
 1U8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rhaVxqhRFD4ReD1YmvEfA36I59kgV9ycJURpgQIgPAY=;
 b=VsjHHJsTOLVv24FRrMJRZa40QNMEcm67GpLAG7TB6m19S0bZrt3QAgmtsr+AKGY3J8
 OsCpr4O4ENWlecWnpe7bYHUuDM5nBQZab3iVQp/YC/M5SpaBEtppv7lhAMT7UDJNf0Hd
 MR2Xm6uBxNKfiCcAsqTmMMJAPox5FbW4agd5D3dDRSTKLlUl4+/0POL01kj84vttwzVH
 8U2sS7cxdZWE6t6IF5IMMAKpJ7racRLa/N8LFdfyWRSZ4k56VXYJCoEo/aUsgSSx4FZF
 TpBT3sh8ctSKkuYQ8+cZxVHCyKVndyR6bMVSh64BTeNw3RKksQ2zuMQI6VGOYCSlr/jX
 Hq/g==
X-Gm-Message-State: ACrzQf3kGT5EGe6Mm5z2U68fwrWbcT/JsJnfpOGtQgQW3gbSY9SJNiXA
 aJNWDi4xHuQx0exMrspIvdxH2RFodvhUd7/Bkck1Nw==
X-Google-Smtp-Source: AMsMyM46OMAue6ANY6uKjUMLZ396C0tIlTP6O/tQDkCtKtz22djgrgFLtwMsWgsbQcn7gFiaSD5bYrZQs48d9+kRHSU=
X-Received: by 2002:a5d:6c6f:0:b0:22a:7778:6ea2 with SMTP id
 r15-20020a5d6c6f000000b0022a77786ea2mr13171324wrz.15.1664185699688; Mon, 26
 Sep 2022 02:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220923124904.1373936-1-victor.liu@nxp.com>
 <CAPDyKFqdHX=o4V4K8GdCr4wQ5sjr=JMG6CFAy1849=CtfoSgRQ@mail.gmail.com>
 <75366bfac9fcd4f8c35309193705f0277a164ae4.camel@nxp.com>
In-Reply-To: <75366bfac9fcd4f8c35309193705f0277a164ae4.camel@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 26 Sep 2022 11:47:42 +0200
Message-ID: <CAPDyKFr0XjrU_udKoUKQ_q8RWaUkyqL+8fV-7s1CTMqi7u3-Rg@mail.gmail.com>
Subject: Re: [PATCH v2] PM: runtime: Return properly from rpm_resume() if
 dev->power.needs_force_resume flag is set
To: Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Len Brown <len.brown@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Sept 2022 at 17:23, Liu Ying <victor.liu@nxp.com> wrote:
>
> On Fri, 2022-09-23 at 15:48 +0200, Ulf Hansson wrote:
> > On Fri, 23 Sept 2022 at 14:47, Liu Ying <victor.liu@nxp.com> wrote:
> > >
> > > After a device transitions to sleep state through it's system
> > > suspend
> > > callback pm_runtime_force_suspend(), the device's driver may still
> > > try
> > > to do runtime PM for the device(runtime suspend first and then
> > > runtime
> > > resume) although runtime PM is disabled by that callback.  The
> > > runtime
> > > PM operations would not touch the device effectively and the device
> > > is
> > > assumed to be resumed through it's system resume callback
> > > pm_runtime_force_resume().
> >
> > This sounds like a fragile use case to me. In principle you want to
> > allow the device to be runtime resumed/suspended, after the device
> > has
> > already been put into a low power state through the regular system
> > suspend callback. Normally it seems better to prevent this from
> > happening, completely.
>
> Not sure if we really may prevent this from happening completely.
>
> >
> > That said, in this case, I wonder if a better option would be to
> > point
> > ->suspend_late() to pm_runtime_force_suspend() and ->resume_early()
> > to
> > pm_runtime_force_resume(), rather than using the regular
> > ->suspend|resume() callbacks. This should avoid the problem, I think,
> > no?
>
> I thought about this and it actually works for my particular
> panel-simple case.  What worries me is that the device(DRM device in my
> case) which triggers the runtime PM operations may also use
> ->suspend_late/resume_early() callbacks for whatever reasons, hence no
> fixed order to suspend/resume the two devices(like panel device and DRM
> device).
>
> Also, not sure if there is any sequence issue by using the
> ->suspend_late/resume_early() callbacks in the panel-simple driver,
> since it's written for quite a few display panels which may work with
> various DRM devices - don't want to break any of them.

What you are describing here, is the classical problem we have with
suspend/resume ordering of devices.

There are in principle two ways to solve this.
1. If it makes sense, the devices might be assigned as parent/child.
2. If it's more a consumer/supplier thing, we can add a device-link
between them.

In this way, the PM core can guarantee that the order becomes correct.

Kind regards
Uffe
