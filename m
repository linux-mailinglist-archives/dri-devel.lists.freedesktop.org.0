Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBEA3B79FA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 23:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44B66E8FE;
	Tue, 29 Jun 2021 21:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3B56E8FE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 21:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625002702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=556hAVcxkakk3x66+sCCRkRCbnFq/lA0vFoRpZZIZRk=;
 b=SsgWnfQHhcXy/KQ5eO+rmJ8/bd87KkxMDqAYVAy/0tYeS9VLyulKgducSAaJvweY3i4iSA
 FRWv7IdcpuWtC9uz1SfST3/pBvl3A5RrH1DVGX8CKrct4r4mIq1GtbXJqhAgEniF7TzINY
 fkgzSlwSrX6p50xwE6JFAhENVEWaCs8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-rnq2tG_pN2CVahvR_tYYHA-1; Tue, 29 Jun 2021 17:38:20 -0400
X-MC-Unique: rnq2tG_pN2CVahvR_tYYHA-1
Received: by mail-qk1-f198.google.com with SMTP id
 r190-20020a375dc70000b02903acea04c19fso136218qkb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 14:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=556hAVcxkakk3x66+sCCRkRCbnFq/lA0vFoRpZZIZRk=;
 b=NAS5KDhU23184Dvz8wAVrBv3C2htoXojJK5ENucfa/RCMe4kSN83KCffQcSsi9OPec
 BD1JnqKpyZNNgpr0PeR0VVNznEo8HCoL/JbBPhhctnHeua0NNbenBcC4n8O1+gXBNCkS
 u9WvIMBIIgXD5lHPHlQR+S9UhgTryrH7KC70/Wd1mXsOaaIZKfyZGg6arfXtecD/GUh1
 deCyOt58oCAOgMyITG/Oz+/MOvuOHn5Ez4/E/uEfRmwWpdSu++IHHtzbZwXWQaIjWXp3
 pBgqfN7ywMmO2hFPMSdDY+fXRNjX48a6TJ6tVSkt/sdOU5YRn18VmlTThg9SRKoItYZf
 RSIQ==
X-Gm-Message-State: AOAM530VUKvcpDmpmHSumA0JNnVpv01OKrWv4we0UaQNzJ2Hu7cQceE/
 cxJ7zzfTyHF6g/CMv1BJ6d95dpvQRbJpf0BGzJKjI7PObZ8g6fwmxMAIlvy2zHqBNYiJsUUMAp0
 0z+P6UayDYbBQxED58sM7sYrGzMWU
X-Received: by 2002:a05:620a:62e:: with SMTP id
 14mr23446257qkv.180.1625002700440; 
 Tue, 29 Jun 2021 14:38:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh0LaLNSmT7YCUeuFj0ztZxSOcVXe4qks8kATy5bQNb++niof019SEITuHPzGZcc57m7Tavg==
X-Received: by 2002:a05:620a:62e:: with SMTP id
 14mr23446240qkv.180.1625002700239; 
 Tue, 29 Jun 2021 14:38:20 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id b188sm12497748qkf.133.2021.06.29.14.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 14:38:19 -0700 (PDT)
Message-ID: <d8e09114428307a029f31dc1a7da77e21f9b2b34.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Fix return code on sideband message failure
From: Lyude Paul <lyude@redhat.com>
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <khsieh@codeaurora.org>,  robdclark@gmail.com, sean@poorly.run
Date: Tue, 29 Jun 2021 17:38:17 -0400
In-Reply-To: <CAE-0n50onDrop=67VvMWL2sbSJedxhKEX13PsiZNaokucSgLew@mail.gmail.com>
References: <1624997336-2245-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n50onDrop=67VvMWL2sbSJedxhKEX13PsiZNaokucSgLew@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, rsubbia@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

JFYI this is on my radar and I'll take a look asap

On Tue, 2021-06-29 at 13:41 -0700, Stephen Boyd wrote:
> +Lyude, author of fixed commit. Please add relevant folks in the future.
> 
> Quoting Kuogee Hsieh (2021-06-29 13:08:56)
> > From: Rajkumar Subbiah <rsubbia@codeaurora.org>
> > 
> > The commit 2f015ec6eab69301fdcf54d397810d72362d7223 added some debug
> 
> Please write
> 
> Commit 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
> selftests") added some debug
> 
> > code for sideband message tracing. But it seems to have unintentionally
> > changed the behavior on sideband message failure. It catches and returns
> > failure only if DRM_UT_DP is enabled. Otherwise it ignores the error code
> > and returns success. So on an MST unplug, the caller is unaware that the
> > clear payload message failed and ends up waiting for 4 seconds for the
> > response.
> > 
> > This change fixes the issue by returning the proper error code.
> 
> $ git grep "This patch" -- Documentation/process
> 
> > 
> > Change-Id: I2887b7ca21355fe84a7968f7619d5e8199cbb0c6
> 
> Please replace with
> 
> Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
> selftests")
> 
> > Signed-off-by: Rajkumar Subbiah <rsubbia@codeaurora.org>
> 
> Should be a Signed-off-by from Kuogee Hsieh here.
> 
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 1590144..8d97430 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -2887,11 +2887,13 @@ static int process_single_tx_qlock(struct
> > drm_dp_mst_topology_mgr *mgr,
> >         idx += tosend + 1;
> > 
> >         ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
> > -       if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
> > -               struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> > +       if (unlikely(ret)) {
> > +               if (drm_debug_enabled(DRM_UT_DP)) {
> > +                       struct drm_printer p =
> > drm_debug_printer(DBG_PREFIX);
> > 
> > -               drm_printf(&p, "sideband msg failed to send\n");
> > -               drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> > +                       drm_printf(&p, "sideband msg failed to send\n");
> > +                       drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> > +               }
> >                 return ret;
> >         }
> > 
> 
> With the above fixed up
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

