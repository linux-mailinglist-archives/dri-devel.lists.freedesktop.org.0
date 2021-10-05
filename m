Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C4422326
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 12:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBE188FBF;
	Tue,  5 Oct 2021 10:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580E4890F9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 10:12:34 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E09AC3F0AC;
 Tue,  5 Oct 2021 12:12:31 +0200 (CEST)
Date: Tue, 5 Oct 2021 12:12:30 +0200
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
Subject: Re: [PATCH 09/10] backlight: qcom-wled: Consistently use
 enabled-strings in set_brightness
Message-ID: <20211005101230.sp2ldu3gfvh5eiit@SoMainline.org>
Mail-Followup-To: Daniel Thompson <daniel.thompson@linaro.org>,
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
 <20211004192741.621870-10-marijn.suijten@somainline.org>
 <20211005093331.4houxsc5b6lfzmbz@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005093331.4houxsc5b6lfzmbz@maple.lan>
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

On 2021-10-05 10:33:31, Daniel Thompson wrote:
> On Mon, Oct 04, 2021 at 09:27:40PM +0200, Marijn Suijten wrote:
> > The hardware is capable of controlling any non-contiguous sequence of
> > LEDs specified in the DT using qcom,enabled-strings as u32
> > array, and this also follows from the DT-bindings documentation.  The
> > numbers specified in this array represent indices of the LED strings
> > that are to be enabled and disabled.
> > 
> > Its value is appropriately used to setup and enable string modules, but
> > completely disregarded in the set_brightness paths which only iterate
> > over the number of strings linearly.
> > Take an example where only string 2 is enabled with
> > qcom,enabled_strings=<2>: this string is appropriately enabled but
> > subsequent brightness changes would have only touched the zero'th
> > brightness register because num_strings is 1 here.  This is simply
> > addressed by looking up the string for this index in the enabled_strings
> > array just like the other codepaths that iterate over num_strings.
> 
> This isn't true until patch 10 is applied!

Patch 9 and 10 were split up at a last resort to prevent a clash in the
title, apologies for that.

> Given both patches fix the same issue in different functions I'd prefer
> these to be squashed together (and doubly so because the autodetect code
> uses set_brightness() as a helper function).

That's a fair reason, and solution I agree on.  I'll figure out how to
generify the title and re-spin this patchset except if there are other
reviewers/maintainers I should wait for.

- Marijn

> Daniel.
