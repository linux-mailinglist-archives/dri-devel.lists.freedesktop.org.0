Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F468180C78
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A386F6E8FE;
	Tue, 10 Mar 2020 23:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A156E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 17:26:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n18so17285429edw.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=51/iVXd6ISvkUNu0+IDc5XrQpO90zZ0ET3uyxLtX7gU=;
 b=qIt3JtTiaBF2P+M2J5wtXKREG/ccCqxaB54KxKHOizt2egcN1UNIepk7yH3DT9yDVo
 gSHsUnZq8bgFNC9hIm0RF/v6yS0XcIKrj8HsEp7oXrXczVxgdZ/OVOX8gTA69SnNJ1zW
 s2rOIoKC3PPZlOrITSpKthCIbquL2kZ6xyNnemIb0TBzmEd+VHTHilNxENvQR2e+IzK8
 OmAQAhj3iELUDb8NuJbnUUDwGVkoKqwYLqQ2vWk1Q+TY5hRP4z4jX8uNKWCBu/2E9c7d
 8kT8T+O9TDTpgd/9O418JQ74Egn/W5FxC1OnjeLSPbN7Y8pBmDtOzYCwQmb+RNN1Ig+Q
 Il6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=51/iVXd6ISvkUNu0+IDc5XrQpO90zZ0ET3uyxLtX7gU=;
 b=Ft8XvBVlAlwGQaqZlb/IoxvdydR2uoz+nz4DPMml5JPPQgbu5eG9MgXK8lQp3NMnrt
 gjntwIxlv+1C5RigTQkNK+EYqjnG3tit5In3syWTIO39ZqpEGJQ3wx1xDwtb+kNf3P8h
 z1dQSU/fnnyuF+j2MHCyRotMy9qlM+apR5O49D94O/AuJGYl2pMdV2h+2EeTGmlWfo7f
 6WVf+7mJgOmBkY+/I6M4tJVf4aYMwmUQVnarCpSwP3Su/Ls9xnJf2RjWQci/zOdqZLIz
 uMnwCeXgpQR1o43cuc+czrKDKB7q3G8hWya+v7uBbcf88HYPS/XJeIhIys/jk31+nnoI
 j9LA==
X-Gm-Message-State: ANhLgQ1oYYtHc5+KPcT9KFIFwiS1Hd6NmbpIDqdn3g3edXcSUodBoWaV
 jNer6wS4pBIpQnTuRcF4i7jiDYnxs8/TMsxcLCY=
X-Google-Smtp-Source: ADFU+vsABVE27j6p2OgUMFvFjq0fMEEp1BSbONgFw4lfy/QP9JO2sfupKp+27ik6ft6S2g6xYrEWR3Dg1jIfOJccT6o=
X-Received: by 2002:a17:906:76c6:: with SMTP id
 q6mr19835693ejn.176.1583861212865; 
 Tue, 10 Mar 2020 10:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200310073313.21277-1-michael@walle.cc>
 <4beb5200a76f2d817be7276444543de4@walle.cc>
 <ea6ffa30ddc2459d07935e5e61a41172@walle.cc>
 <CA+h21hqMoPhbq8YG0UeV1kP0iXApYsJvb9MZjPGX54dm2U-KnQ@mail.gmail.com>
 <76923af394f334337a3cac125c270087@walle.cc>
 <20200310171403.GL4106@sirena.org.uk>
In-Reply-To: <20200310171403.GL4106@sirena.org.uk>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 10 Mar 2020 19:26:41 +0200
Message-ID: <CA+h21hqLxMREixud3Mh8p4q6J7rvJzRH+aFVgYLTZ9aNmkZBww@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-fsl-dspi: fix DMA mapping
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Michael Walle <michael@walle.cc>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 Mar 2020 at 19:14, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Mar 10, 2020 at 03:12:45PM +0100, Michael Walle wrote:
> > Am 2020-03-10 14:02, schrieb Vladimir Oltean:
>
> > > I'm testing LS1028A with IOMMU_DEFAULT_PASSTHROUGH=y and I didn't have
> > > time to change my setup now. I've also sent a v3 to my patch series
> > > which is going to conflict with this one, sorry.
>
> > No worries, its easy enough to rebase.
>
> > > I would have picked
> > > your patch up with my series but I didn't have the right environment
> > > to test it.
>
> > I'll resend a v2 once your series is working.
>
> Since it looks like your series might need another spin anyway I'm
> thinking it's sensible to apply this now and you rebase instead?  Cuts
> down on the number of pending patches if nothing else (unless the
> testing stuff gets sorted out of course).

Sure, go ahead.

Thanks,
-Vladimir
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
