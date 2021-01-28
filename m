Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D335F307E9C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3676E8C3;
	Thu, 28 Jan 2021 19:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE7E6E9CF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 19:17:28 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ox12so9479702ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=vBlLsqLNkUpR+0kFKtDaYzD8qh6gqBF4/l+RbWGbI1g=;
 b=rMpUjADQ8XyHks7VPikWy0z20Wn35ZyhvSp7sB0PtetVbCKw+y0DBhWyM8iMdLFjzi
 2/ZCQppwfhCNhkMBAw7504NQg91ydUdX3yxfegSISvFPTQmSfTN3pc/PqkB+cvcE7+lg
 mzmZNlLsh8oh4K2HGEPwDCP+NYGbrW0kIwnFLT0Yr80xz/QvS7nLTt81bjaIssaE5NuN
 x6kMvnIq8EY2HqvUg86PdXGXWOnflPfbOzYkD9vuEXbU5tdRw5sqBfM0XE2Zs7U41yiw
 P1fJJKGvb6gN8/HzmAPCoRyX0gwSCIUqGnchnXlFBrSrXvkHaQTrMYqqSiSZE4WHZ01Z
 EZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vBlLsqLNkUpR+0kFKtDaYzD8qh6gqBF4/l+RbWGbI1g=;
 b=daYH34Sc0q4YMZQ6POZZTSl5d5HhW0QZy6p0KHItkq35Co38MWHp8zYeIHc3/OudTf
 OX/tv5yCY0e9wv70Hd8uDB/szdfTmZ0VxBEn40u9gnqurOv0ncokxKaIL6aIRMaLPqe4
 QU4oFts8l9UGC5wxYI4IBeJ28gOzhnQ0ibTPbSdQzJOFpW65SVazEMl3RBs2emPPkIAE
 uRLH2SYnrb2wzFKzwSzT4txQIVHWf8WLqOpibJ41tJAYAZzXqzxpsIFEmIH84oEHZk4j
 eLtoD2ud/zNViEgPohOrmpsvfplpjfugyQknf/GFS3+28cXBuAngZV2gbQbP/r0qDofM
 mVkQ==
X-Gm-Message-State: AOAM531xxZZhiZG23LKn7mj6ANxHjNny8rGwHyBAoSzoLs3gkrc8kmXX
 8bjkItZAhkLE1LrIcaVwvYPfUdATvRrrEy+RTQ8rLw==
X-Google-Smtp-Source: ABdhPJylhLH79XRqp3ubuYFwgvceaUjciBEqidoB3QEfdehv8e73FrLQPduYYbkQSR/8XQg8gdwQWoFiQVTseSaaSDE=
X-Received: by 2002:a17:906:5857:: with SMTP id
 h23mr874420ejs.465.1611861447457; 
 Thu, 28 Jan 2021 11:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20210127233946.1286386-1-eric@anholt.net>
 <20210128184702.GB29306@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20210128184702.GB29306@jcrouse1-lnx.qualcomm.com>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 28 Jan 2021 11:17:16 -0800
Message-ID: <CADaigPVF=Ti4tLYTUsK+0Gi6GbK9ADOuFf4tCYftmVZ96gJLxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm: Fix race of GPU init vs timestamp power
 management.
To: Eric Anholt <eric@anholt.net>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
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

On Thu, Jan 28, 2021 at 10:52 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Wed, Jan 27, 2021 at 03:39:44PM -0800, Eric Anholt wrote:
> > We were using the same force-poweron bit in the two codepaths, so they
> > could race to have one of them lose GPU power early.
> >
> > Signed-off-by: Eric Anholt <eric@anholt.net>
> > Cc: stable@vger.kernel.org # v5.9
>
> You can add:
> Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
>
> Because that was my ugly.
>
> Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

I only pointed it at 5.9 because it looked like it would probably
conflict against older branches.  I can add the fixes tag if you'd
like, though.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
