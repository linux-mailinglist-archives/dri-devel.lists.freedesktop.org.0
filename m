Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6944641B511
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 19:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9DE6E8F9;
	Tue, 28 Sep 2021 17:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BDF6E8F9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 17:22:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632849784; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mb/o+TU/jtzYpiRKctEI+EzDEsfd4AjUR8iTNCtSlZo=;
 b=NXU8BmSLWeoi9UuC6UF6HMRRiWKlu/GQMSX894mZ4qeb2AbEffS4XZZWosDt1thCXlIACG4I
 zkBWLW4iq7S8ajcmZwuW8jmNNgqG4pbBkMyo7diG3MPqe1FaxAAe4QrKByvAKbihj9tj/66c
 ceHdRvKy4rdZ3Q6xyyYVeTourMg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61534f64a5a9bab6e8c9faa8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 17:22:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6073CC44BC2; Tue, 28 Sep 2021 17:22:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B7904C008EF;
 Tue, 28 Sep 2021 17:22:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 28 Sep 2021 10:22:41 -0700
From: khsieh@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar
 <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kalyan
 Thota <kalyan_t@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP controllers
In-Reply-To: <YSkdaljt7DPbyTDe@builder.lan>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-4-bjorn.andersson@linaro.org>
 <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
 <YSkdaljt7DPbyTDe@builder.lan>
Message-ID: <66f0f29e449b02e30678ed2e3487c7f2@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-08-27 10:14, Bjorn Andersson wrote:
> On Fri 27 Aug 00:20 CDT 2021, Stephen Boyd wrote:
> 
>> Quoting Bjorn Andersson (2021-08-25 16:42:31)
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> > index 2c7de43f655a..4a6132c18e57 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> > @@ -78,6 +78,8 @@ struct dp_display_private {
>> >         char *name;
>> >         int irq;
>> >
>> > +       int id;
>> > +
>> >         /* state variables */
>> >         bool core_initialized;
>> >         bool hpd_irq_on;
>> > @@ -115,8 +117,19 @@ struct dp_display_private {
>> >         struct dp_audio *audio;
>> >  };
>> >
>> > +
>> > +struct msm_dp_config {
>> > +       phys_addr_t io_start[3];
>> 
>> Can this be made into another struct, like msm_dp_desc, that also
>> indicates what type of DP connector it is, i.e. eDP vs DP? That would
>> help me understand in modetest and /sys/class/drm what sort of 
>> connector
>> is probing. dp_drm_connector_init() would need to pass the type of
>> connector appropriately. Right now, eDP connectors still show up as DP
>> instead of eDP in sysfs.
>> 
> 
> I like it, will spin a v3 with this.
> 
> Regards,
> Bjorn

Hi Bjorn,

Have you spin off V3 yet?
When you expect your patches related to DP be up streamed?

Thanks,
kuogee
> 
>> > +       size_t num_dp;
>> > +};
>> > +
>> > +static const struct msm_dp_config sc7180_dp_cfg = {
>> > +       .io_start = { 0x0ae90000 },
>> > +       .num_dp = 1,
>> > +};
>> > +
>> >  static const struct of_device_id dp_dt_match[] = {
>> > -       {.compatible = "qcom,sc7180-dp"},
>> > +       { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>> >         {}
>> >  };
>> >
