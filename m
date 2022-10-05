Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EE5F5AAA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 21:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3283A10E766;
	Wed,  5 Oct 2022 19:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6DB10E766
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 19:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664998651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=om/4sfRsXfwNwWQKPv9CFi8IwmnaiLcb7IYF4maF9ko=;
 b=FFMTAw/OOw4LyK1YBIdyL2S8ULSwvFQq8k0q47DYvQ+QzK8eLgFb+fziCfwiruT/tFblH1
 BWcAAiGkmNjdlKbzKv9eNo53XtDbQs6J3rXNYXrYEv7Zu/JcsfOzoPRTXfu9/vDtMRobHs
 DxKKw0EC3kqmuIhfCBQ5rKilQGCcunQ=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-La_aRso2PoqkXg-cJBv69Q-1; Wed, 05 Oct 2022 15:37:30 -0400
X-MC-Unique: La_aRso2PoqkXg-cJBv69Q-1
Received: by mail-io1-f69.google.com with SMTP id
 b5-20020a05660214c500b006a43c89e0bdso11790585iow.22
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 12:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=om/4sfRsXfwNwWQKPv9CFi8IwmnaiLcb7IYF4maF9ko=;
 b=hOauwfjKkF+z0YldyOEF8deMDHh4PtG1FukmDMmmlkEKkd2bH1CxBRZRlPsv3QGXno
 S0xd7PVCy3rgo1xvTxkv3phdk72N69dwfrBcSwBjn1loiOzdLy9+qs0QmhZDCkunxY4d
 JN3xsVjKSg3Y1gIY5g3ipgL32eCdPhNStI3li8N58fF6TYrRG1eMDhV9v93VqzXXXdA2
 FCMhyLEaCDF5Co2CEK7iN8TtPLDnRDVYZj82C8YS0y+qvg87bFq27v7ewAgXOPm5NWNh
 Ymj8HacuOKD3+wjImAA8h4dDHgIz71ubuLRO0IZsEghjZvoyFUNDPTjQADO/mJ3fNtH0
 o0nA==
X-Gm-Message-State: ACrzQf1lPS6Scv4QusH6dBC5fmJnJ85vkyoOay5h0h/niwNP4WxA+1Q2
 x2/+fZOpWdadloBY9DaMtxUeV6apfvbUVE56JhWQHke4QFVk057qtWaPOcjJvJgYbC/WsIM6fek
 cpcDIq4OIyPL/5zgpg8e4iW+cm4ex
X-Received: by 2002:a92:ca4c:0:b0:2f9:5143:faad with SMTP id
 q12-20020a92ca4c000000b002f95143faadmr601813ilo.3.1664998649690; 
 Wed, 05 Oct 2022 12:37:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XbJTCCAKAeqFGgRlGD4yz9P7kGpD2LZ94vAS1Q5FqKSmlWF3438/LCyxGKw4Wvc+9bqy0jQ==
X-Received: by 2002:a92:ca4c:0:b0:2f9:5143:faad with SMTP id
 q12-20020a92ca4c000000b002f95143faadmr601788ilo.3.1664998649468; 
 Wed, 05 Oct 2022 12:37:29 -0700 (PDT)
Received: from [10.56.18.113] ([140.209.96.86])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a056e02068900b002f4ab5c3d7fsm6109000ils.62.2022.10.05.12.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 12:37:28 -0700 (PDT)
Message-ID: <128762cfb6524d17e6ee7308aa7e859dd350fa63.camel@redhat.com>
Subject: Re: [PATCH] drm/amdgpu/dm/mst: Fix incorrect usage of
 drm_dp_add_payload_part2()
From: Lyude Paul <lyude@redhat.com>
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Wed, 05 Oct 2022 14:37:25 -0500
In-Reply-To: <d3b272e1-3b5d-c843-e8ac-57dc5e3a7ced@amd.com>
References: <20221004202429.124422-1-lyude@redhat.com>
 <d3b272e1-3b5d-c843-e8ac-57dc5e3a7ced@amd.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: Ian Chen <ian.chen@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-10-04 at 16:46 -0400, Rodrigo Siqueira Jordao wrote:
> 
> On 2022-10-04 16:24, Lyude Paul wrote:
> > Yikes, it appears somehow I totally made a mistake here. We're currently
> > checking to see if drm_dp_add_payload_part2() returns a non-zero value to
> > indicate success. That's totally wrong though, as this function only
> > returns a zero value on success - not the other way around.
> > 
> > So, fix that.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Issue: https://gitlab.freedesktop.org/drm/amd/-/issues/2171
> > Fixes: 4d07b0bc4034 ("drm/display/dp_mst: Move all payload info into the atomic state")
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > index b8077fcd4651..00598def5b39 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > @@ -297,7 +297,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
> >   		clr_flag = MST_ALLOCATE_NEW_PAYLOAD;
> >   	}
> >   
> > -	if (enable && drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, payload)) {
> > +	if (enable && drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, payload) == 0) {
> >   		amdgpu_dm_set_mst_status(&aconnector->mst_status,
> >   			set_flag, false);
> >   	} else {
> 
> Hi Lyude,
> 
> Maybe I'm missing something, but I can't find the 
> drm_dp_add_payload_part2() function on amd-staging-drm-next. Which repo 
> are you using?

If it's not on amd-staging-drm-next then it likely hasn't gotten backported to
amd's branch yet and is in drm-misc-next

> 
> Thanks
> Siqueira
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

