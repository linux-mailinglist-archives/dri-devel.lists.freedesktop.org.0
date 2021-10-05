Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516EF42230B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 12:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5726EB4B;
	Tue,  5 Oct 2021 10:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259956EB4B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 10:06:10 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C2A4E3EE89;
 Tue,  5 Oct 2021 12:06:07 +0200 (CEST)
Date: Tue, 5 Oct 2021 12:06:06 +0200
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
Message-ID: <20211005100606.faxra73mzkvjd4f6@SoMainline.org>
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
 <20211004192741.621870-6-marijn.suijten@somainline.org>
 <20211005091947.7msztp5l554c7cy4@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005091947.7msztp5l554c7cy4@maple.lan>
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

On 2021-10-05 10:19:47, Daniel Thompson wrote:
> On Mon, Oct 04, 2021 at 09:27:36PM +0200, Marijn Suijten wrote:
> > When not specifying num-strings in the DT the default is used, but +1 is
> > added to it which turns wled3 into 4 and wled4/5 into 5 strings instead
> > of 3 and 4 respectively, causing out of bounds reads and register
> > read/writes.  This +1 exists for a deficiency in the DT parsing code,
> > and is simply omitted entirely - solving this oob issue - by allowing
> > one extra iteration of the wled_var_cfg function parsing this particular
> > property.
> > 
> > Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > ---
> >  drivers/video/backlight/qcom-wled.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > index 27e8949c7922..66ce77ee3099 100644
> > --- a/drivers/video/backlight/qcom-wled.c
> > +++ b/drivers/video/backlight/qcom-wled.c
> > @@ -1255,17 +1255,17 @@ static const struct wled_var_cfg wled5_ovp_cfg = {
> >  
> >  static u32 wled3_num_strings_values_fn(u32 idx)
> >  {
> > -	return idx + 1;
> > +	return idx;
> >  }
> >  
> >  static const struct wled_var_cfg wled3_num_strings_cfg = {
> >  	.fn = wled3_num_strings_values_fn,
> > -	.size = 3,
> > +	.size = 4, /* [0, 3] */
> 
> 0 is not a valid value for this property.

These comments represent the possible loop iterations the DT "cfg
parser" runs through, starting at j=0 and running up until and including
j=3.  Should I make that more clear or omit these comments entirely?

- Marijn

> >  };
> >  
> >  static const struct wled_var_cfg wled4_num_strings_cfg = {
> >  	.fn = wled3_num_strings_values_fn,
> > -	.size = 4,
> > +	.size = 5, /* [0, 4] */
> 
> Ditto.
> 
> 
> >  };
> >  
> >  static u32 wled3_switch_freq_values_fn(u32 idx)
> > @@ -1520,8 +1520,6 @@ static int wled_configure(struct wled *wled)
> >  			*bool_opts[i].val_ptr = true;
> >  	}
> >  
> > -	cfg->num_strings = cfg->num_strings + 1;
> > -
> >  	string_len = of_property_count_elems_of_size(dev->of_node,
> >  						     "qcom,enabled-strings",
> >  						     sizeof(u32));
> > -- 
> > 2.33.0
> > 
