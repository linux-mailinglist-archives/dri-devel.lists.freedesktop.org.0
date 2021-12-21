Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6D747C9BD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 00:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF36310E365;
	Tue, 21 Dec 2021 23:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB90210E365
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 23:31:35 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 646FD3F64B;
 Wed, 22 Dec 2021 00:31:32 +0100 (CET)
Date: Wed, 22 Dec 2021 00:31:31 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 0/9] backlight: qcom-wled: fix and solidify handling
 of enabled-strings
Message-ID: <20211221233131.rwjjojuawgffr2gf@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Kiran Gunda <kgunda@codeaurora.org>, Bryan Wu <cooloney@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211116120213.n7qxqfi62lrxhyl7@maple.lan>
 <YZPRV2jD1EBYGdHL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZPRV2jD1EBYGdHL@google.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-fbdev@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-16 15:42:15, Lee Jones wrote:
> On Tue, 16 Nov 2021, Daniel Thompson wrote:
> 
> > Hi Lee
> > 
> > On Mon, Nov 15, 2021 at 09:34:50PM +0100, Marijn Suijten wrote:
> > > This patchset fixes WLED's handling of enabled-strings: besides some
> > > cleanup it is now actually possible to specify a non-contiguous array of
> > > enabled strings (not necessarily starting at zero) and the values from
> > > DT are now validated to prevent possible unexpected out-of-bounds
> > > register and array element accesses.
> > > Off-by-one mistakes in the maximum number of strings, also causing
> > > out-of-bounds access, have been addressed as well.
> > 
> > They have arrived piecemeal (during v1, v2 and v3) but all patches on
> > the set should now have my R-b: attached to them.
> 
> I can see that.  Nothing for you to worry about.
> 
> I'll apply these when I conduct my next sweep, thanks.

Thanks for that Lee!  Has the next sweep already passed by?  Seems
everyone is preparing for the 5.17 merge window but these patches
haven't yet landed on the backlight tree [1].  I'd appreciate it if we
can make them appear in the 5.17 window :)

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git/

Thanks!
- Marijn

> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
