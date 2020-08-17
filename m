Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DD02469B2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 17:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120F36E125;
	Mon, 17 Aug 2020 15:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03F36E123
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 15:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597677902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYHx22Hjk9SO0WuigHF5xk5EUMKORl8e5JmIgUyAttg=;
 b=PCSldKtesAttqF3WpvmO7Xv+t3QfDFZMcmYs4JnMJQplvXIUDL+u0Fg7TF7WrTMPJhGnzx
 cqh75xfo9ZTixG1cEh0Gr74XGw3gUkenWBaz0PMaApW/DsFRSkmynLdugL/41g4VgsLQX1
 SfwM6MC36/uVMuGVm1ZBNKUl71XO99c=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-egl1q_BxNn2bIt5aj020dQ-1; Mon, 17 Aug 2020 11:24:57 -0400
X-MC-Unique: egl1q_BxNn2bIt5aj020dQ-1
Received: by mail-qk1-f198.google.com with SMTP id q18so11098178qkq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 08:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=YYHx22Hjk9SO0WuigHF5xk5EUMKORl8e5JmIgUyAttg=;
 b=apUVdIADT3aBKSCtnmNhy9UrC7ncyxL7D/ky3aQ93pkFBqGJoCO7bHghkfmenoL5Uc
 18X5bBKNDq9dGczadBgDx91vtZ3dV13HrsKQwu0shnn27Ec4HqCy6PvhkV7k4zoJdfVB
 seiQx+qdARkRl/78rHNnrzJUZ3zUlK0U2LF1nlGZkfwozjCuwBFD/NyUj6y/cAvMQQdL
 Ucia33FksGU0azEq2bOdwpiH7OHLtc5NZqKPC0xys4yKF6Hh+Ey+aLeIn6pWFLQcf9tc
 nzGL05Kdb1zAIPFQtTdIIPu4ea3rd0YqWJIJRG0JagXWmkQAm0l0a5pgoiCCqq+bu/JC
 9oZQ==
X-Gm-Message-State: AOAM532V7CBRysryB0xVdFw8WiJTS8yZP+ngjZX3sw5qc6AGthH7TNxK
 9gsNwFime9JcX3x8zK+EuXq9qW9wO0xT8tsdLprPhLcIpg15qEoUOmmfWoaJr5SP1cCzbD+w0ck
 jtYQ/AgHYsatXBjIULNiwcnUiILzT
X-Received: by 2002:ac8:1342:: with SMTP id f2mr14409906qtj.392.1597677896998; 
 Mon, 17 Aug 2020 08:24:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDJNoTKKNnjyjhaHdfokCMVzskFWoa6w5+Vl7NMOGfJ38y3hnUbk7iTfAKTgzN0pZmky6nMw==
X-Received: by 2002:ac8:1342:: with SMTP id f2mr14409884qtj.392.1597677896802; 
 Mon, 17 Aug 2020 08:24:56 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id b37sm21098426qtk.85.2020.08.17.08.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 08:24:56 -0700 (PDT)
Message-ID: <ef2fd2125b7a4a37437d161cc15e056332556b4a.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Don't return error code when crtc is null
From: Lyude Paul <lyude@redhat.com>
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, mikita.lipski@amd.com, 
 nicholas.kazlauskas@amd.com, alexander.deucher@amd.com
Date: Mon, 17 Aug 2020 11:24:55 -0400
In-Reply-To: <ab808ea5782ea14c7d521d2869c211b925bbcb5a.camel@redhat.com>
References: <20200814170140.24917-1-Bhawanpreet.Lakha@amd.com>
 <ab808ea5782ea14c7d521d2869c211b925bbcb5a.camel@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oh-just noticed this is also missing a CC for stable@vger.kernel.org. I'll add
it before pushing but please make sure to follow the guidelines here when
submitting fixes, since otherwise they might not get backported automatically
to older kernels:

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

(you can ignore the "It cannot be bigger than 100 lines, with context." part,
as long as you're not trying to backport new functionality to stable and
you're actually fixing something they're pretty leniant about that rule)

On Mon, 2020-08-17 at 11:21 -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> I will go ahead and push this to drm-misc-fixes, thanks!
> 
> On Fri, 2020-08-14 at 13:01 -0400, Bhawanpreet Lakha wrote:
> > [Why]
> > In certain cases the crtc can be NULL and returning -EINVAL causes
> > atomic check to fail when it shouln't. This leads to valid
> > configurations failing because atomic check fails.
> > 
> > [How]
> > Don't early return if crtc is null
> > 
> > Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 70c4b7afed12..bc90a1485699 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -5037,8 +5037,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct
> > drm_atomic_state *state, struct drm
> >  
> >  		crtc = conn_state->crtc;
> >  
> > -		if (WARN_ON(!crtc))
> > -			return -EINVAL;
> > +		if (!crtc)
> > +			continue;
> >  
> >  		if (!drm_dp_mst_dsc_aux_for_port(pos->port))
> >  			continue;
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
