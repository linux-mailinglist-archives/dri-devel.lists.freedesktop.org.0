Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7180C752500
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 16:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240FB10E6E7;
	Thu, 13 Jul 2023 14:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 618F910E03A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 14:18:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC0991570
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:19:39 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 085E33F73F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:18:56 -0700 (PDT)
Date: Thu, 13 Jul 2023 15:18:37 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: cuigaosheng <cuigaosheng1@huawei.com>
Subject: Re: [PATCH v2 3/3] drm/komeda: Fix IS_ERR() vs NULL check in
 komeda_component_get_avail_scaler()
Message-ID: <ZLAHvSw31SdR_WjC@e110455-lin.cambridge.arm.com>
References: <20230713020556.1956639-1-cuigaosheng1@huawei.com>
 <20230713020556.1956639-4-cuigaosheng1@huawei.com>
 <ZK-72h3fVj6PlGB0@e110455-lin.cambridge.arm.com>
 <c37832f4-9957-1d7e-01f9-ee7fbdf569a1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c37832f4-9957-1d7e-01f9-ee7fbdf569a1@huawei.com>
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
Cc: neil.armstrong@linaro.org, quic_eberman@quicinc.com, sam@ravnborg.org,
 quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org, a39.skl@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 james.qian.wang@arm.com, angelogioacchino.delregno@somainline.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 05:51:34PM +0800, cuigaosheng wrote:
> Thanks for taking time to review this patch.
> 
> Maybe we can submit another separate patch to fix ERR_CAST(st), because I'm not
> sure which commit should be used as a fixes-tag.
> 
> Also, Maybe we should fix ERR_CAST(st) in komeda_pipeline_get_state_and_set_crtc()
> and komeda_component_get_state_and_set_user(), please make another separate patch.

Yeah, you're right, there are other places where this needs to be fixed.

I will add this to my list of ToDos.

Best regards,
Liviu

> 
> Let me know if there's anything I can do, thanks for your work again!
> 
> Gaosheng,
> 
> On 2023/7/13 16:54, Liviu Dudau wrote:
> > Hello,
> > 
> > On Thu, Jul 13, 2023 at 10:05:56AM +0800, Gaosheng Cui wrote:
> > > The komeda_pipeline_get_state() returns an ERR_PTR() on failure, we should
> > > use IS_ERR() to check the return value.
> > While reviewing the change I've realised that komeda_pipeline_get_state_and_set_crtc()
> > is also mishandling the return value from komeda_pipeline_get_state(). If IS_ERR(st) is
> > true it should use return ERR_CAST(st), following the same pattern as komeda_pipeline_get_state().
> > 
> > If you don't want to update this patch I can send a separate patch. Otherwise,
> > the change looks good to me.
> > 
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > 
> > Best regards,
> > Liviu
> > 
> > 
> > > Fixes: 502932a03fce ("drm/komeda: Add the initial scaler support for CORE")
> > > Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> > > ---
> > >   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> > > index 3276a3e82c62..e9c92439398d 100644
> > > --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> > > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> > > @@ -259,7 +259,7 @@ komeda_component_get_avail_scaler(struct komeda_component *c,
> > >   	u32 avail_scalers;
> > >   	pipe_st = komeda_pipeline_get_state(c->pipeline, state);
> > > -	if (!pipe_st)
> > > +	if (IS_ERR(pipe_st))
> > >   		return NULL;
> > >   	avail_scalers = (pipe_st->active_comps & KOMEDA_PIPELINE_SCALERS) ^
> > > -- 
> > > 2.25.1
> > > 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
