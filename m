Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A75273811
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 03:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000736E5CE;
	Tue, 22 Sep 2020 01:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D78B6E040;
 Tue, 22 Sep 2020 01:26:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d4so1642784wmd.5;
 Mon, 21 Sep 2020 18:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EwkCPgCitGetW6yWn1orUd/9JWGX18dm0dessM84fGA=;
 b=XJqhwKesgxxoneddVSf20VBkrrsT0ax+8jpxfLfjlaRV9BbhWHgdo7GG11Y0hdcJwU
 3zPmfiFaA0hrmsx/VmHuBH6Ql2NzM+URt5nSUMkkiuLcL+yrdIiYdvKB2ajmf3hzQuZy
 uegahPiyv/X3TGiIIlTydmIdHOWYse8gSIBk+fEaqQVdVidjFBwbfYJA6QnYuaSuBWup
 JpvEWpcxUgC02W/tdj+oOWlcaXFczT0OX2bkigrhVKXN+QfUuVy9fxUta4xEExaYZp/Y
 gTng2uocepGvbf8hwarfezAFrMTVTQoxd03ouptRLZQZy0aiVlx9HhRymXIaPEDFYVLj
 2nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EwkCPgCitGetW6yWn1orUd/9JWGX18dm0dessM84fGA=;
 b=RATOwQnTJp2raruJQjkg72L2C9xi6GqWQaB31895Pnc+Bq7Jfl4hZYKKjHXJCMlrv+
 lTRrNmO4NpiXogZ9DnNRMUH6FxnLJ00mdc5T9RRkfu5NQ1pY8Iuwj2xotySGE+yq0Dgc
 tNtVz2CuowRFsov12r85iCK/5lPMkKy1nV2WOKgKyTPIvTTv3HiICsXAVh/8spk34HwC
 J9xicsbUOJgvYniECuFlUTM8PeYHs6gDGVxddstnFw7bf+xA6XipRMVZ80qGNoPA2/SM
 RfhMpMoNjS2m6xgZN4VBHAqIFIOZmWkuVNbhFgkPn7dF+CWHiQ9ZD77HrlUINPpF28s0
 ecQg==
X-Gm-Message-State: AOAM533MOOPjFnyDqyTT+pyE2VJj7bJHnklAMmR4kVxdhAmLBd/EiQTQ
 XhH4+ndKLVZUWQlFGp2CgnXdIPm6JX9lwzzkbsQ=
X-Google-Smtp-Source: ABdhPJyX5IceDiEN7uurpddreCAjgBIWneUFzY3pSLOA9oYfNTQAt3JlP4q5FDqc7qs5jSI0oVWF6J0DVzpZ1VTocjE=
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr1800077wmg.164.1600738004991; 
 Mon, 21 Sep 2020 18:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200905200454.240929-1-robdclark@gmail.com>
 <20200921213054.GA4270@willie-the-truck>
In-Reply-To: <20200921213054.GA4270@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 21 Sep 2020 18:27:45 -0700
Message-ID: <CAF6AEGsMsarDGqYYLtkZMKHxKZKBsfZsByWit=vEsAoKXqs6UQ@mail.gmail.com>
Subject: Re: [PATCH v17 00/20] iommu/arm-smmu + drm/msm: per-process GPU
 pgtables
To: Will Deacon <will@kernel.org>
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
Cc: Wambui Karuga <wambui.karugax@gmail.com>, Hanna Hawa <hannah@marvell.com>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sibi Sankar <sibis@codeaurora.org>,
 Thierry Reding <treding@nvidia.com>, Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 2:31 PM Will Deacon <will@kernel.org> wrote:
>
> On Sat, Sep 05, 2020 at 01:04:06PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > NOTE: I have re-ordered the series, and propose that we could merge this
> >       series in the following order:
> >
> >        1) 01-11 - merge via drm / msm-next
> >        2) 12-15 - merge via iommu, no dependency on msm-next pull req
>
> Thanks, I've queued 12-15 in the smmu tree.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates
>

Thx, let me know if you are up for trying a post-rc1 pull req for
16-18 (plus Bjorn's series if it is reposted in time).. I can
certainly help rebase/wrangle patches if that helps.. otherwise we can
try for those next cycle

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
