Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F4B106F6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D3310E917;
	Thu, 24 Jul 2025 09:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DI+WEhdc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0041610E914
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:50:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2286C601DE;
 Thu, 24 Jul 2025 09:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77AEC4CEF4;
 Thu, 24 Jul 2025 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753350625;
 bh=aAWDBlkY+gH35bX083Tsc9S0NiwEW6cV9EEvBuzhrAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DI+WEhdcOE0W0Jm5G4k//z5/3G2oA0dhWKD0vfvVPDqYfCbrMcDdl4blnwb7a1NmB
 gOxYFnBQkKZw8LW41x9wWHOMhTZ/59NKgD5EXS7Vo6/hRh5D1zAjlCEa4NYCttxluM
 f/nAQzz/mj013fowzTb8NDoFWAyAeBY9mbDgjbotXDB6GZcSebH2o+KBSIAt0c3f05
 qnvXRYHuPs+vTVXVzjwbfh87UItGw9JqDMbohH0rmwJV0ssziBV2PBX6pNlmxvEGvy
 mUtcvUxCCVDfEweHJnamze1Kvx9/HxSNQlmzqIXmRhgFMB9zfV+v2ZmFb6TRfQ+Rl/
 VfhrXicAqH4QA==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1uesai-000000006aw-2ZCe;
 Thu, 24 Jul 2025 11:50:20 +0200
Date: Thu, 24 Jul 2025 11:50:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <aIIB3G6WEEzldXEn@hovoldconsulting.com>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
 <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
 <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
 <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
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

On Thu, Jul 24, 2025 at 11:42:38AM +0200, Neil Armstrong wrote:
> On 24/07/2025 11:32, Dmitry Baryshkov wrote:
> > On Thu, 24 Jul 2025 at 12:08, <neil.armstrong@linaro.org> wrote:
> >> On 20/05/2025 10:06, Johan Hovold wrote:
> >>> On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
> >>>> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
> >>>>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> >>>>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:

> >>>>>>>> +     /*
> >>>>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> >>>>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> >>>>>>>> +      * the sink must use the MIN value as the effective PWM bit count.
> >>>>>>>> +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> >>>>>>>> +      * correct brightness scaling on compliant eDP panels.
> >>>>>>>> +      */
> >>>>>>>> +     pn = clamp(pn, pn_min, pn_max);
> >>>>>>>
> >>>>>>> You never make sure that pn_min <= pn_max so you could end up with
> >>>>>>> pn < pn_min on broken hardware here. Not sure if it's something you need
> >>>>>>> to worry about at this point.
> >>
> >> I'm trying to figure out what would be the behavior in this case ?
> >>
> >> - Warn ?
> >> - pn_max = pn_min ?
> >> - use BIT_COUNT as-is and ignore MIN/MAX ?
> >> - pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
> >> - reverse clamp? clamp(pn, pn_max, pn_min); ?
> >> - generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?
> > 
> > Per the standard, the min >= 1 and max >= min. We don't need to bother
> > about anything here.
> 
> Yeah, I agree. But I think a:
> if (likely(pn_min <= pn_max))
> is simple and doesn't cost much...

> >> Or just bail out ?

Yeah, just bail out. If we ever run into broken hardware like this, we
can determine some workaround then.

Johan
