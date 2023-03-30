Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210086D08AF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E98F10EE9C;
	Thu, 30 Mar 2023 14:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063BA10EE9C;
 Thu, 30 Mar 2023 14:49:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55428B8291D;
 Thu, 30 Mar 2023 14:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE71C433D2;
 Thu, 30 Mar 2023 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680187759;
 bh=kzreuOeVhGy4b0EKlYhtPyFf/2KaV6KQScB7tGg7Ih0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RuMwuXV0ihf8NBi8DD5f8I7mE1QMWJJ3lglv0kJ/PAPxM29Rs23fWmWvO5H4Z54MO
 mF/0guVx5oMJfN57LUKbvq1fFgccmRAm8C6onENXp4oSku7bjezMV2vII689FmxT4s
 u/18mUKHk0erDq7UOeLFbWTBSe+Xchu4hI8cYWjQ8EWhr1qYSFqrEP2zz5MZQf6KFw
 xj2GDG1ZPucdyLcT5/3M3swUvECtZ90r9NOVxtyZaWHvP8q88GWy8/nfoG9Jbd+H6/
 88jINzWYU1rqan/0HoHX70HI17oZUsxR0C3Eh6a+RIy+guGqBCBaTT546GgjJ2/+rG
 qVB3OR/2vBLyQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1phtar-00037Z-MB; Thu, 30 Mar 2023 16:49:37 +0200
Date: Thu, 30 Mar 2023 16:49:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH] drm/msm/adreno: adreno_gpu: Use suspend() instead of
 idle() on load error
Message-ID: <ZCWhgZDuhoMYxs52@hovoldconsulting.com>
References: <20230329140445.2180662-1-konrad.dybcio@linaro.org>
 <ZCRNFitcrAeH27Pn@hovoldconsulting.com>
 <83986fa9-c9eb-ae5a-b239-584092f2cea5@linaro.org>
 <CAA8EJpohEo+kMw7fx5112m+z7JHSLDmsqOL4T7hmyvr2fPP8vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpohEo+kMw7fx5112m+z7JHSLDmsqOL4T7hmyvr2fPP8vQ@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 agross@kernel.org, "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 10:45:52PM +0300, Dmitry Baryshkov wrote:
> On Wed, 29 Mar 2023 at 18:48, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > On 29.03.2023 16:37, Johan Hovold wrote:
> > > On Wed, Mar 29, 2023 at 04:04:44PM +0200, Konrad Dybcio wrote:
> > >> If we fail to initialize the GPU for whatever reason (say we don't
> > >> embed the GPU firmware files in the initrd), the error path involves
> > >> pm_runtime_put_sync() which then calls idle() instead of suspend().
> > >>
> > >> This is suboptimal, as it means that we're not going through the
> > >> clean shutdown sequence. With at least A619_holi, this makes the GPU
> > >> not wake up until it goes through at least one more start-fail-stop
> > >> cycle. Fix that by using pm_runtime_put_sync_suspend to force a clean
> > >> shutdown.
> > >
> > > This does not sound right. If pm_runtime_put_sync() fails to suspend the
> > > device when the usage count drops to zero, then you have a bug somewhere
> > > else.
> > I was surprised to see that it was not called as well, but I wasn't able
> > to track it down before..
> 
> Could you please check that it's autosuspend who kicks in? In other
> words, if we disable autosuspend, the pm_runtime_put_sync is enough()?

Yes, that's it. The runtime PM implementation changed at one point and
since you need to disable autosuspend first to actually get synchronous
behaviour. My bad.

> That would probably mean that we lack some kind of reset in the hw_init path.
> 
> On the other hand, I do not know how the device will react to the
> error-in-the-middle state. Modems for example, can enter the state
> where you can not properly turn it off once it starts the boot
> process.
> 
> And if we remember the efforts that Akhil has put into making sure
> that the GPU is properly reset in case of an _error_, it might be
> nearly impossible to shut it down in a proper way.
> 
> Thus said, I think that unless there is an obvious way to restart the
> init process, Korad's pm_runtime_put_sync_suspend() looks like a
> correct fix to me.

I'd prefer to fix this by disabling autosuspend, but as that would
involve also moving the call to enable autosuspend to this function (and
add the missing disable on unbind), Konrad's patch using
pm_runtime_put_sync_suspend() is probably the best option for now. I can
send a patch to move the autosuspend handling on top.

Perhaps you can just amend the commit message to clarify that not all fw
is apparently preloaded and also mention that you need to use
pm_runtime_put_sync_suspend() due to autosuspend being enabled.

Johan
