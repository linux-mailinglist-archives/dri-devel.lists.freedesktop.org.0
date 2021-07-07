Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2323BF600
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1A36E15C;
	Thu,  8 Jul 2021 07:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255DD6E15F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 17:34:36 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id o8so3649994ilf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sD13z85XVgoLdSGSEXdyjIhfF8nDl4He7AW/wdIYAPE=;
 b=GMyUr6TlJ9VJExoTQpjFfBsLf6J01HTyZta3543eDwhlqbYEzWxs8GoDpUc1UsSTw4
 l1VVQLqIkdx353vwBODZcBzPc+/pWN2sN4WUmOL2Q2pzqXNGKMgaACFtiLtqRBNiBa9g
 MO2krDbX2BQp90Nsue1zk7vA6Wepr7RZf2O7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sD13z85XVgoLdSGSEXdyjIhfF8nDl4He7AW/wdIYAPE=;
 b=GR+B514/wkulX8IXoH0mKI9LkPZta8oFqrqB86ng93qwjfQGrLeN/UsRPoS2YzYJGC
 n8TYeDc4D6RPnSvby2Un2S5r4hfH4XcfdW2e7lSS2QI01HSZJcnLqkcBM9vGd+VzFogf
 0r7UKnVy/FWsefoROxhiTv+1trx0IEvzNsOtYNa7uc6Yystf/wcFuK1A14bRpwF6m9cq
 SuWxUrxkFMnMUXZeuP5TJRljOjZ1byVg33XYwxL1hATUFVMFRmrIc6rqytorvoppRtKP
 D1JOcsIcZYf/6zJSLSPAge6zke4Es1eMEKCYas8Gl9G8iyZ/ixCdKwLti5i6AT3AL2Ta
 UaYw==
X-Gm-Message-State: AOAM531KsLsg9F8Adv8hCOhbxMTwnihhBKIJZbhwOJe2KRuC5VMf+BTF
 KokqSl06rEca6oqt/ZkeL2FRxy1bCN6qfNgj+j32Yg==
X-Google-Smtp-Source: ABdhPJxjcG9AfhjNI0K88JMDlGt/CX21XaqIJd0EGqm1e9KWBmc9XPZNa/mXbdXJb612yvG28vh3Q4PQfEPrvTUr3HA=
X-Received: by 2002:a92:6f0a:: with SMTP id k10mr18648951ilc.105.1625679275706; 
 Wed, 07 Jul 2021 10:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210610214431.539029-1-robdclark@gmail.com>
 <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
 <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
 <CALAqxLWDqQeD-eieHXtePuXpxN1s3=jCNJP2pJD-YswsLP-mJw@mail.gmail.com>
In-Reply-To: <CALAqxLWDqQeD-eieHXtePuXpxN1s3=jCNJP2pJD-YswsLP-mJw@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 7 Jul 2021 10:38:38 -0700
Message-ID: <CAJs_Fx4n07yuksL+kmjyKRuqPnFuE1m5PmeqCsoF7Xah=kWxvA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page fault handling
To: John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:08:27 +0000
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Douglas Anderson <dianders@chromium.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 10:12 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Sun, Jul 4, 2021 at 11:16 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > I suspect you are getting a dpu fault, and need:
> >
> > https://lore.kernel.org/linux-arm-msm/CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com/
> >
> > I suppose Bjorn was expecting me to send that patch
>
> If it's helpful, I applied that and it got the db845c booting mainline
> again for me (along with some reverts for a separate ext4 shrinker
> crash).
> Tested-by: John Stultz <john.stultz@linaro.org>
>

Thanks, I'll send a patch shortly

BR,
-R
