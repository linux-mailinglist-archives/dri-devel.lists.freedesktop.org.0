Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 142F26FFCA5
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 00:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A2310E601;
	Thu, 11 May 2023 22:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD84F10E601
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 22:30:53 +0000 (UTC)
Received: from SoMainline.org (144-178-94-186.static.ef-service.nl
 [144.178.94.186])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 160D52012F;
 Fri, 12 May 2023 00:30:49 +0200 (CEST)
Date: Fri, 12 May 2023 00:30:48 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 4/8] drm/msm: Add MSM-specific DSC helper methods
Message-ID: <vb2cssihvxuqxyw5qtxcm662za6jvejmwbhyiqfsiozdkzr2em@jm47tmyxkdyt>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-4-df48a2c54421@quicinc.com>
 <4jjgeylpyofynlybonwuveumwvyjphtnbtctu6pwdrigckropw@dmkahbb3au3d>
 <489fb0ea-3b37-f7ed-0183-f4cb1b003326@quicinc.com>
 <rvqyvkpspwos6peqzf3lrmnv4pkxrnyxm2eohdza6yujyykwui@xe2m33ez6mec>
 <c13adcf7-61e0-4665-c281-28d734159255@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c13adcf7-61e0-4665-c281-28d734159255@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-11 13:05:15, Abhinav Kumar wrote:
<snip>
> > Don't think the DP series alone should point that out, as it heavily
> > depends on the relation between slice size and bpp parameters, and
> > whether those end up with a fractional part or not (are you able to test
> > and confirm all those combinations?).  Regardless it seems more natural
> > to use slice_chunk_size which is used in various other ways and sent in
> > the PPS: it wouldn't make sense to adhere to a different slice byte
> > count elsewhere.
> > 
> 
> They are not totally different.
> 
> I guess what Jessica is trying to say here is we will have to do more 
> validation with slice/bpp combinations for DP to conclude whether there 
> is a difference in math. We can go with two approaches:
> 
> 1) Either go with slice_chunk_size for now and re-validate with the 
> monitors we have and drop this particular helper
> 2) Keep this particular helper for now and upon more validation if we 
> see it's same across more combinations, drop this later.

I would argue that if we need a different rounding strategy on the
number of bytes within a slice, shouldn't the DRM helper calculating
slice_chunk_size be updated as well?  This sounds/feels like a thing
that is specified in the DSC docs, as all the parameters involved are
part of the DSC spec (but I am not currently in a position to review
that within the coming few days).

> I just have a slight preference for (2), but looks like your preference 
> is for (1) but this is just more validation work for us which is fine I 
> guess this time since we will revalidate DP again anyway.

Thanks, that's appreciated, but do make sure to test the cases where the
rounding method actually makes a difference in the resulting value.

> >> I also want to note that this math has stayed the same throughout all 7
> >> revisions. In the interest of making review more efficient, I think it
> >> would be helpful to point out important details like this early on in
> >> the process. That way we can address major concerns early on and keep
> >> the number of revisions per series low.
> > 
> > I've already expressed to Abhinav and you that the revisions for all
> > these series were coming in way too hot, leaving no time for review and
> > discussions before the next revision hits the list.  If you want to keep
> > the number of revisions low, v8 shouln't have already been sent.
> > 
> 
> You had the concern for DSC 1.2 DPU series from kuogee. So to respect 
> that we held that back the entire end of last week and early this week 
> (~6 days) and posted today.
> 
> Now, you have the same concern with this series from jessica. Sorry, as 
> much as i would like to get your feedback on every series, I cannot hold 
> back every QC display developer to wait for your reviews on patch rev 1 
> before posting patch rev 2. They all work mostly independently. So if 
> one reviewer say dmitry has reviewed one revision and we agreed on the 
> comments, in the absence of another comment from another reviewer, the 
> developer is going to post the next revision for more reviews as its 
> more efficient to manage their time as they are in the same context. 
> This is nothing unusual from normal upstream development.

I am not saying that it is unusual to send many revisions (though in
"quick succession", which is only loosely defined).  Just that it is
unusual to "demand" reviews (which are seemingly perceived as requesting
a lot, even though I don't think I'm asking anything outrageous here) to
stop when the revisions reach a certain number, or to have happened
early on in the series.  I understand it's annoying from a developer
perspective, but sometimes it is what it is.

This whole process would be better if there's a more explicit list of
"these specific people have to test, review and sign off on every patch"
before this series is ready to be merged, but I understand that people
do not want to commit to that from both sides.

> If by the time you start reviewing its going to be revision 7 or 8, then 
> start it as a fresh review which it is for you, folks are obviously 
> going to question why you didnt review revisions 1-7 so far. So I cannot 
> take sides on this.

Fine to question it, and my answer is: besides having a hard time
finding enough free time to look at this, I also want to test it by
piecing together all the various series, and besides regression-testing
on sdm845 even managed to use these series in a very positive way to
finally (albeit with some additional fixes) get working DSC and panels
on my SM8150 and SM8250 boards.  Meaning I have even more hardware and
configurations to test, valudate, **and provide feedback** on, taking
away from the review time initially.

> I wish I could help more to accommodate your schedules but its hard to 
> control who pushes when with distributed development and tell each of 
> them to hold back.
> 
> > I desire to review *and test* all these patches (which I believe is in
> > everyone's best interest) and have not initially been able to do so as
> > all these efforts come out of my free time, which is sometimes limited
> > of has been used to finalize the INTF TE series (which is a dependency
> > of these series).
> > 
> > It should be pretty obvious to see that this patch has not had a reply
> > from me on any of the previous revisions, and there are more patches
> > that I have not been able to comment on yet.
> > 
> > The alternative to that is of course not seeing enough value in my
> > review and testing (or ""late"" comments...) and merging it regardless
> > at some point, but that's not up to me to decide.
> > 
> > - Marijn
> 
> Thats true even for mine or other's reviews :) that if i am not able to 
> get to some patches on time and other reviewers are happy with it they 
> do get landed in the tree. Has happened many times and I have not 
> complained. I just fix the issues on top of them (which again happens a 
> lot) and move on.

That is totally fine, but in this case the series is not merged yet (nor
seems to happen within the next couple of hours) so I rather share
findings rather than keeping them on a private list to send
cleanups/fixes days after it lands.  Especially in the event that this
takes a few more revisions.  In other words, I understand that my review
gets rightfully ignored/dropped if the maintainer has already picked or
is about to pick it.

> So there doesnt seem to be any rule as such today that wait for this 
> particular developer to review and validate.

Exactly.  As mentioned briefly above this process would involve
committing to a fixed list of reviewers to at least have r-b'd or
replied to every patch, but (as also said above) I can see from both
sides that might not be desirable to commit to.

Thanks for the patience and cooperation thus far!  I'll try to give this
another review- and testing round over the weekend.

- Marijn

<snip>
