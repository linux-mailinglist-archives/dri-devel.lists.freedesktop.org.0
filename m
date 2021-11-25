Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E0E45D736
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 10:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC216EB44;
	Thu, 25 Nov 2021 09:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690236EB44
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 09:32:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 563B76108B;
 Thu, 25 Nov 2021 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637832727;
 bh=uvwK6xkBqc0Znk7K/Ky4+OAVTT2Tgux5Kci1XFX8G7s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A22aw7jpeZpx4drvuc79ExTAHz6VeHUzufIvszz7ZaVx6vozqrYdGuHHB4ir0DkuK
 4DosN3et1ryeH2sSo99GI46FHAMGrBjfPt0qtOD8B9VjSAsNRfJ1lLuEMyJyhlHoGv
 DiaytizYSHxweQu8nu9uC6rol+SgVSBSEjRjgUudS+4ouGtjQrdd8dEfOOvDI0M0tk
 Lwu8GSBC4nwXXs69WFKA9Kb21m1eFmHQxaZcig1TBhzh82FgRakL2sHa7/Okr2+Wwy
 DmKF7mojkI+nVpmahE4/oqR+93nJWRLIZT+N2quZ9UqaNezklRPtuBCcngVQgzq7Oj
 3e7fssOTS3ObQ==
Date: Thu, 25 Nov 2021 15:02:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 07/11] dmaengine: qcom-adm: stop abusing slave_id config
Message-ID: <YZ9YEim/hc0C4zz9@matsya>
References: <20211115085403.360194-8-arnd@kernel.org>
 <202111251538.x6sJNCka-lkp@intel.com>
 <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25-11-21, 09:25, Arnd Bergmann wrote:
> On Thu, Nov 25, 2021 at 8:57 AM kernel test robot <lkp@intel.com> wrote:
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/dma/qcom/qcom_adm.c:712:18: warning: no previous prototype for function 'adm_dma_xlate' [-Wmissing-prototypes]
> >    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
> >                     ^
> >    drivers/dma/qcom/qcom_adm.c:712:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> >    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
> >    ^
> >    static
> >    1 warning generated.
> 
> I noticed this mistake slipped into v2 as well, the function needs to
> be marked 'static'.
> 
> Vinod, let me know how you want me to address this. Should I just fold
> the fix (see below)
> and the final Acks into the patch and send an updated pull request, or
> do a complete v3
> submission?

I can fold this while applying, the series lgtm, I will wait a day
before applying...

Thanks

> 
>       Arnd
> 
> 8<---
> diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
> index bb338b303af6..65697bee4db0 100644
> --- a/drivers/dma/qcom/qcom_adm.c
> +++ b/drivers/dma/qcom/qcom_adm.c
> @@ -709,8 +709,8 @@ static void adm_channel_init(struct adm_device
> *adev, struct adm_chan *achan,
>   *
>   * Returns pointer to appropriate dma channel on success or NULL on error.
>   */
> -struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
> -                              struct of_dma *ofdma)
> +static struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
> +                                     struct of_dma *ofdma)
>  {
>         struct dma_device *dev = ofdma->of_dma_data;
>         struct dma_chan *chan, *candidate = NULL;

-- 
~Vinod
