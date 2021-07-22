Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2BB3D2B77
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 19:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1535E6EC39;
	Thu, 22 Jul 2021 17:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBDD88284
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2GEg8okcVMAYnKdKmQC+g9S6ixUz1NHqQ1kjsCY4C0=;
 b=fJft5StI+AV3ERKShins3h17g5azGVRiT2IznUIBe8yvs0qrlABcud/8rAm/WYgtsizKPB
 yBzk9Pn+ffr3waxSC3i5fOFnE5PYiYCYYIQ84zK2Mv6Du1WgMOxXtzRTcbIdb2QTGdeAYc
 lJhl3qaoAa7IWDVI8I4JsKaIee6HDpg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-X_LMXvqpOcSnnYIqWp0OiA-1; Thu, 22 Jul 2021 13:53:37 -0400
X-MC-Unique: X_LMXvqpOcSnnYIqWp0OiA-1
Received: by mail-qk1-f200.google.com with SMTP id
 d14-20020a05620a240eb02903b9402486c5so4667744qkn.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 10:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Y2GEg8okcVMAYnKdKmQC+g9S6ixUz1NHqQ1kjsCY4C0=;
 b=XeXQVf2RO7WVAsm1MWE6vwcsHlfVgT8SDTYinvFgMJlj+w8D37w5EbSruoMiCB5Keu
 DXhzM8fy8Qj6sGv+zXaSm6J3VYkHCkMrtfwOEM8arY/juTe+Bq1T8YCy1jZ1FPvLN3uB
 3CmC3/GOgVAVnwj3pVPbJ4pWbK+h4w1f+RkX2uV9ymjpMGFYT2VpvacW8/0W1XpExRrH
 VxpN0ZCiNXVNIc22g+jES6FpKKJQBeH9Axz1I+uHQJjLMeIrDgBpmWtpuKTUeQlC2Kv1
 9fMlVDJZUo/FRgD5489QlTLIzQW9TvtJeoG3IQGGk1r9qgBxdmdPiRa16/ec9ZtbE6Mf
 FBzQ==
X-Gm-Message-State: AOAM532UV7OcGem98kqBj+IwB7xJ6JzdTu/5PMlZmGobWQEAEwK+cqKL
 yPuFosf8Wnl6BGSV2ekhd/EdGEklGXXmivSZTLDp1aG3BgEGxSQ5T1+R47OIiiTQD378aPqIiBN
 kdUjHvuZRLgpRr7P9patWeI/ZjnVf
X-Received: by 2002:a05:6214:129:: with SMTP id w9mr824705qvs.13.1626976416771; 
 Thu, 22 Jul 2021 10:53:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIX3vEtdM0CCkt3/yc6zqizr4OQmJT/HqF+o8uo7lMAGVHdyTFMumcqgcTkFv0yWCssyBNqw==
X-Received: by 2002:a05:6214:129:: with SMTP id w9mr824673qvs.13.1626976416543; 
 Thu, 22 Jul 2021 10:53:36 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id s19sm7294756qtx.5.2021.07.22.10.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:53:36 -0700 (PDT)
Message-ID: <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix return code on sideband message failure
From: Lyude Paul <lyude@redhat.com>
To: khsieh@codeaurora.org, Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu, 22 Jul 2021 13:53:34 -0400
In-Reply-To: <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com>
 <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: rnayak@codeaurora.org, tzimmermann@suse.de, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 aravindh@codeaurora.org, sean@poorly.run, rsubbia@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-07-13 at 15:24 -0700, khsieh@codeaurora.org wrote:
> On 2021-07-07 01:37, Jani Nikula wrote:
> > On Tue, 06 Jul 2021, Kuogee Hsieh <khsieh@codeaurora.org> wrote:
> > > From: Rajkumar Subbiah <rsubbia@codeaurora.org>
> > > 
> > > Commit 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
> > > selftests") added some debug code for sideband message tracing. But
> > > it seems to have unintentionally changed the behavior on sideband 
> > > message
> > > failure. It catches and returns failure only if DRM_UT_DP is enabled.
> > > Otherwise it ignores the error code and returns success. So on an MST
> > > unplug, the caller is unaware that the clear payload message failed 
> > > and
> > > ends up waiting for 4 seconds for the response. Fixes the issue by
> > > returning the proper error code.
> > > 
> > > Changes in V2:
> > > -- Revise commit text as review comment
> > > -- add Fixes text
> > > 
> > > Changes in V3:
> > > -- remove "unlikely" optimization
> > > 
> > > Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing + 
> > > selftests")
> > > 
> > > Signed-off-by: Rajkumar Subbiah <rsubbia@codeaurora.org>
> > > Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> > > 
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > 
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> > 
> > 
> > > ---
> Lyude,
> Any comments from you?
> Thanks,

Hey! Sorry did I forget to respond to this?

Reviewed-by: Lyude Paul <lyude@redhat.com>

> 
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c 
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index 1590144..df91110 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -2887,11 +2887,13 @@ static int process_single_tx_qlock(struct 
> > > drm_dp_mst_topology_mgr *mgr,
> > >         idx += tosend + 1;
> > > 
> > >         ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
> > > -       if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
> > > -               struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> > > +       if (ret) {
> > > +               if (drm_debug_enabled(DRM_UT_DP)) {
> > > +                       struct drm_printer p =
> > > drm_debug_printer(DBG_PREFIX);
> > > 
> > > -               drm_printf(&p, "sideband msg failed to send\n");
> > > -               drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> > > +                       drm_printf(&p, "sideband msg failed to send\n");
> > > +                       drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> > > +               }
> > >                 return ret;
> > >         }
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

