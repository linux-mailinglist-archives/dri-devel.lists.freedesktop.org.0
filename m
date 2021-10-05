Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7752E422C55
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AA66E417;
	Tue,  5 Oct 2021 15:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3873A6E417
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 15:23:29 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5D90B3E8D8;
 Tue,  5 Oct 2021 17:23:27 +0200 (CEST)
Date: Tue, 5 Oct 2021 17:23:26 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
Message-ID: <20211005152326.5k5cb53ajqnactrg@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-6-marijn.suijten@somainline.org>
 <20211005091947.7msztp5l554c7cy4@maple.lan>
 <20211005100606.faxra73mzkvjd4f6@SoMainline.org>
 <20211005103843.heufyonycnudxnzd@maple.lan>
 <20211005105312.kqiyzoqtzzjxayhg@maple.lan>
 <20211005114435.phyq2jsbdyroa6kn@SoMainline.org>
 <20211005140349.kefi26yev3gy3zhv@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005140349.kefi26yev3gy3zhv@maple.lan>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-10-05 15:03:49, Daniel Thompson wrote:
[..]
> > I much prefer doing that instead of trying to wrangle enumeration
> > parsing around integer values that are supposed to be used as-is.  After
> > all this variable is already named to set the `+ 1` override currently,
> > and `qcom,enabled_strings` has "custom" handling as well.  I'll extend
> > the validation to ensure num_strings>=1 too.
> 
> Great.
> 
> 
> > In addition, and this needs some investigation on the dt-bindings side
> > too, it might be beneficial to make both properties mutually exclusive.
> > When specifying qcom,enabled_strings it makes little sense to also
> > provide qcom,num_strings and we want the former to take precedence.
> 
> If we are designing a "fix" for that then my view is that if both are
> passed then num-strings should take precedence because it is an
> explicit statement about the number of strings where enabled_strings
> is implicit. In other words, if num-strings <= len(enabled_strings) then
> we should do what we are told, otherwise report error.

IMO both should be identical (num-strings == len(enabled-strings)) to
avoid ambiguity, but do read on.

> > At that point one might ask why qcom,num_strings remains at all when
> > DT can use qcom,enabled_strings instead.  We will supposedly have to
> > keep backwards compatibility with DTs in mind so none of this can be
> > removed or made mutually exclusive from a driver standpoint, that all
> > has to be done in dt-bindings yaml to be enforced on checked-in DTs.
> 
> So... perhaps I made a make offering a Reviewed-by: to a patch
> that allows len(enabled-strings) to have precedence. If anything
> currently uses enabled-strings then it *will* be 4 cells long and
> is relying on num-strings to ensure the right things happens ;-) .

Unfortunately Konrad (one of my team members) landed such a patch at the
beginning of this year because I failed to submit this patchset in time
while it has been sitting in my queue since 2019 after being used in a
downstream project.  This is in pmi8994 which doesn't have anything
widely used / production ready yet, so I'd prefer to fix the DT instead
and remove / fix his comment:

    /* Yes, all four strings *have to* be defined or things won't work. */

But this is mostly because, prior to this patchset, no default was set
for WLED4 so the 0'th string would get enabled num-strings (3 in
pmi8994's case) times.

Aside that there's only one more PMIC (also being worked on by
SoMainline) that sets qcom,enabled-strings: this is pm660l, pulled from
our local tree, and it actually has enabled-strings of length 2 which is
broken in its current form, exactly because of relying on this patchset.

Finally, we already discussed this inside SoMainline and the
number/enabled leds should most likely be moved out of the PMIC dtsi's
as they're probably panel, hence board or even device dependent.

> We'd like that case to keep working so we must allow num-strings to have
> precedence. In other words, when you add the new code, please put it at
> the end of the function!

Since there don't seem to be any substantial platforms/PMICs using this
functionality in a working manner, can I talk you into agreeing with
fixing the DT instead?

PS. In -next pmi8994_wled is only enabled for sony-xperia-tone, and
pm660l_wled has yet to be enabled by anything.

- Marijn
