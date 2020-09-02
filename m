Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4D25B025
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 17:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F41C6E938;
	Wed,  2 Sep 2020 15:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF5F6E938
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 15:51:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so4902102wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Pa2v9R6HR7b/pDUYXflnHBdnCYt3kzuoYpeXOCOC/0=;
 b=eZ98yo2h+IpDJLHCAVg8pf4bQQgrrIR3kqyEA32yLbuOIAxFXAHlNiG3QbWcP7ywsy
 WSAnNq1k9mjIEbTfbSEc4xWQSBsdFRiXAEXK8SVGRrbziQLqcuKbHACDywoe2UpM71N0
 TeqesAsn88r+ap2tQ3UZYEa7OdLOGaxhjDnVkUEWM8JS1GbEvbCXvyjflRaazc22R4qT
 FBhiXiEcz65Os4fadPmo7VRE7TE09DiA53DYdT8Q8ERCgloBxR8zyDW7DOIErenD2r8J
 e1KUxOtSZ8cC70htTe8s1GoBV/H+R/JRPJYgd0vH5Aq62d8L+mRQ1rwfTL2mHoiaaQA9
 //Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Pa2v9R6HR7b/pDUYXflnHBdnCYt3kzuoYpeXOCOC/0=;
 b=HLU4myM0dyPeWWE5HLko86BrrJsw+3V/1Uxi+El6Q4tDq8URw0uoeDNRJBiQYFHBq3
 XfGDeO5sC6Ij+L0IzhuPw3bAI76S3ibVD5Fxz292sreRUod15cs8BTyHofUBSulUiZnW
 L18B7uBkLcdc6zUOrDYE0l8C/m/aXb0sFL6lIGqsirMkbZzUq9aLDKQLmrcMuSdOc1bt
 4rjaFww9UBmrjY7p08YWKBGmgJQIhkHydnHA20ZVMu67WSRh9k7GpKzhnAq64MGgmHlM
 q7v20ekT/ih+rZLa7RCQ6LYkW0quoZ7PQTew/MoZSwb5nflPiBL4Xk6oMjP9uurftDo9
 QG6Q==
X-Gm-Message-State: AOAM533PnMzn3liYp0rJ7NJ8cZG16+i7fBMh6/UU7nlWzxBQYeTGP0iL
 BF0pDoeK5ZZEyw6HoZ3nJ3vuJiW3sVmfDrkdAJS8CQ==
X-Google-Smtp-Source: ABdhPJxklWTXMbj7XCA3kgOdPIvgEd3TL5aPW8f4PM0qZ3BrOBbmA9oFX/7bFJ8UP75W3LTR457EfJLG8lWVB1pU0ts=
X-Received: by 2002:a05:600c:20b:: with SMTP id
 11mr1324349wmi.147.1599061917500; 
 Wed, 02 Sep 2020 08:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200902010645.26943-1-luben.tuikov@amd.com>
 <BDD53312-3A34-4761-A7C3-6FDFE66A6C1F@amd.com>
 <e6916b3b-60cd-e223-4f87-478aab3b2468@amd.com>
 <62D0EAA9-E3AD-4FA7-AC24-9F5F9C594EB2@amd.com>
 <0f336bb9-5d78-30ed-d217-c5905d1dc08a@amd.com>
 <CAPj87rMRemGSZGoPV-BYrAZCK26aB-rFsKL6hVPRsha_850SXQ@mail.gmail.com>
 <20a86ddb-df88-225d-a33d-7feec82a46c2@amd.com>
In-Reply-To: <20a86ddb-df88-225d-a33d-7feec82a46c2@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 2 Sep 2020 16:51:46 +0100
Message-ID: <CAPj87rMKNZfP1=kfsHPbRaJtHMAEKY+87p6uTAt=Hh76FwZVcw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Use implicit kref infra
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luben,

On Wed, 2 Sep 2020 at 16:16, Luben Tuikov <luben.tuikov@amd.com> wrote:
> Not sure how I can do this when someone doesn't want to read up on
> the kref infrastructure. Can you help?
>
> When someone starts off with "My understanding of ..." (as in the OP) you know you're
> in trouble and in for a rough times.
>
> Such is the nature of world-wide open-to-everyone mailing lists where
> anyone can put forth an argument, regardless of their level of understanding.
> The more obfuscated an argument, the more uncertainty.
>
> If one knows the kref infrastructure, it just clicks, no explanation
> necessary.

Evidently there are more points of view than yours. Evidently your
method of persuasion is also not working, because this thread is now
getting quite long and not converging on your point of view (which you
are holding to be absolutely objectively correct).

I think you need to re-evaluate the way in which you speak to people,
considering that it costs nothing to be polite and considerate, and
also takes effort to be rude and dismissive.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
