Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6417469F32D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 12:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C5310E95A;
	Wed, 22 Feb 2023 11:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B83F10E966;
 Wed, 22 Feb 2023 11:07:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 291B5B81255;
 Wed, 22 Feb 2023 11:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02FCC433EF;
 Wed, 22 Feb 2023 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677064035;
 bh=oZHLA46He2E+VEbx9itbSiq8b9yG0Xgq+VlZAUqHQcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WkiW31Ku65nZoH48qJNj1nOJr2MoA0z0i/i5NacKyY3sMbBqGsm/OP4TQIXgAoayc
 yM8uobz0yceKK1CR7krw2f1xMTk9sdW9RUs1TBBKxhO+U4gZzEzpxDAGCMhNIa8tlL
 I8FApKP1nIUJ9DClJx4PU00BvkuAf0kb79qDruB59DsE49T6kzV7Er6sAi/XLQU97g
 1nqeCSo5bfpwuenk6Fa+zCazFnCSjKAO7FS60EM2CZ8O9Yj/4LJ4SAe9k301Sr+r+k
 S94iiBBpk0pF4yT59lpxB+j2TCs/7cfLyY8Apw4FzwkbtZAnT2S1Xl15U1sIqVlL8S
 wi3wDFlgqAruA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pUmy0-0005ep-9J; Wed, 22 Feb 2023 12:07:21 +0100
Date: Wed, 22 Feb 2023 12:07:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC] drm/msm/adreno: Balance pm_runtime enable
Message-ID: <Y/X3aKO2qJqpvcv+@hovoldconsulting.com>
References: <20230203181245.3523937-1-quic_bjorande@quicinc.com>
 <CAF6AEGuJtiSrLqdZdEf=bz-R0jTg=ayR6OwutBgu5d1dBQUD_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuJtiSrLqdZdEf=bz-R0jTg=ayR6OwutBgu5d1dBQUD_Q@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 10, 2023 at 08:10:00AM -0800, Rob Clark wrote:
> On Fri, Feb 3, 2023 at 10:12 AM Bjorn Andersson
> <quic_bjorande@quicinc.com> wrote:
> >
> > When any of the components in the mdss hierarchy fails to bind,
> > previously bound components are being unbound again.
> >
> > One such case happens when the DP controller fails to find its bridge or
> > panel, where adreno_unbind() will be invoked without adreno_load_gpu()
> > being called to invoke pm_runtime_enable().
> >
> > The result is that once everything is bound the pm_runtime_get_sync()
> > call find the power-domain to have a positive disable_depth, fails
> > with -EACCESS and prevents the GPU device to be powered up.
> >
> > Move the pm_runtime_enable() to adreno_bind(), in order to balance it
> > with any calls to adreno_unbind().
> 
> I think instead we want to move where the pm_runtime_disable() is..
> since pm_runtime_enable() was moved because we can't actually enable
> runpm until we have GMU firmware

Here's a fix for this issue which does not move pm_runtime_enable() from
first open():

	https://lore.kernel.org/lkml/20230221101430.14546-1-johan+linaro@kernel.org/

Johan
