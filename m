Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76882589332
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 22:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A3918B7F7;
	Wed,  3 Aug 2022 20:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3295810ED49
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659558479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVq6qfh71Z4eyfH2Jr7IUkThH+5zHyp5mI30K20IkZo=;
 b=BeRBvLB8/IGUl2vKmcXF69HZXCB3SLyDOzw2wlm9in3ujQuSL86bWdo+EVC1/8om4Anto7
 LGltrhR2VgF9pTQiFCoxCL7ZusO++eTYf16BSBqcqwJlkMNYC1AiIsINVHayGqhORmodhL
 XRePLuDK9IOPT47PyfxYPXy1L4u+56g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-GK5_3IO3My2cfuMv2y2l5g-1; Wed, 03 Aug 2022 16:27:56 -0400
X-MC-Unique: GK5_3IO3My2cfuMv2y2l5g-1
Received: by mail-qk1-f199.google.com with SMTP id
 bm34-20020a05620a19a200b006b5f1d95ceeso14209465qkb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 13:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=oVq6qfh71Z4eyfH2Jr7IUkThH+5zHyp5mI30K20IkZo=;
 b=VB41KHipqjTn4aJLk1QNBlofBCddSldmYILokTn0glj2+sWpuBIfK0gqxZwit7hf7/
 UuR9soc5neH2NH+6ADmN2zLrzBSjsUBW+zgKo2hv7aVyDnm4yRtNTIIxN88oYVbljXHU
 t9e+3/lHM07YthcIr2jP9fCb35QOclGmmqzPz1HjonoBfpNNe/OS2nx4WwJxOglLmfwT
 IKsGBBE2bVoLA8qMamS5vrUazyveV2Ws51VTpTr4XROXY1T5DJlndj01JyvpZz0v9nMo
 utEWznf6o37axGXiKb61IGw89LiqiomRhlKkt2YXefSUcRttu/Whm/7x13/Scskyxrtg
 Tzng==
X-Gm-Message-State: AJIora8bNyUn9laNSyVEo0ONWY2t02UDmDXaQkCROTFZbOEM/oOApjfz
 YjkGNXcxbu7r/KhBoY+MpnceJXXfnGhjke4465Az4TyboOxaBEn3VJFnTXxhHjtfemUwmrjyflN
 OcvHXb6h6MKm5bRbVI3sfNxZsszKY
X-Received: by 2002:a05:620a:1a20:b0:6b5:fb66:c0ed with SMTP id
 bk32-20020a05620a1a2000b006b5fb66c0edmr20320486qkb.582.1659558475286; 
 Wed, 03 Aug 2022 13:27:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sYkLbaReZU3W97WVBuS4zUUlBeI7W8a0WinyCLm13NPrWmXKMpW3LlStpLdb0upC3LPX+pRA==
X-Received: by 2002:a05:620a:1a20:b0:6b5:fb66:c0ed with SMTP id
 bk32-20020a05620a1a2000b006b5fb66c0edmr20320447qkb.582.1659558474989; 
 Wed, 03 Aug 2022 13:27:54 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 r4-20020ae9d604000000b006b614fe291bsm12931459qkk.28.2022.08.03.13.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 13:27:54 -0700 (PDT)
Message-ID: <848f35a693b26bfd15b3c6539eacd3e313dcd3a7.camel@redhat.com>
Subject: Re: [RESEND RFC 18/18] drm/display/dp_mst: Move all payload info
 into the atomic state
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Date: Wed, 03 Aug 2022 16:27:51 -0400
In-Reply-To: <CO6PR12MB5489BAFF2DDCD67F8BDCD827FC819@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
 <20220607192933.1333228-19-lyude@redhat.com>
 <CO6PR12MB5489BAFF2DDCD67F8BDCD827FC819@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
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
Cc: "Chen, Ian" <Ian.Chen@amd.com>, Karol Herbst <kherbst@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 open list <linux-kernel@vger.kernel.org>, "Lei, Jun" <Jun.Lei@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, "Li, 
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Shih,
 Jude" <Jude.Shih@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Strauss,
 Michael" <Michael.Strauss@amd.com>, Juston Li <juston.li@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 "open list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 Luo Jiaxing <luojiaxing@huawei.com>, "Liu, Wenjing" <Wenjing.Liu@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Ma,
 Leo" <Hanghong.Ma@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Sean Paul <sean@poorly.run>, He Ying <heying24@huawei.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Li, Roman" <Roman.Li@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Claudio Suarez <cssk@net-c.es>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Colin Ian King <colin.king@intel.com>,
 "Kazlauskas, 
 Nicholas" <Nicholas.Kazlauskas@amd.com>, Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-07-05 at 09:10 +0000, Lin, Wayne wrote:
> > +struct drm_dp_mst_port;
> > +
> >   /* DP MST stream allocation (payload bandwidth number) */
> >   struct dc_dp_mst_stream_allocation {
> >    uint8_t vcp_id;
> >    /* number of slots required for the DP stream in
> >    * transport packet */
> >    uint8_t slot_count;
> > + /* The MST port this is on, this is used to associate DC MST payloads
> > with their
> > + * respective DRM payloads allocations, and can be ignored on non-
> > Linux.
> > + */
> 
> Is it necessary for adding this new member? Since this is for setting the DC
> HW and not relating to drm.

I don't entirely know, honestly. The reasons I did it:

 * Mapping things from DRM to DC and from DC to DRM is really confusing for
   outside contributors like myself, so it wasn't even really clear to me if
   there was another way to reconstruct the DRM context from the spots where
   we call from DC up to DM (not a typo, see next point).
 * These DC structs for MST are already layer mixing as far as I can tell,
   just not in an immediately obvious way. While this struct itself is for DC,
   there's multiple spots where we pass the DC payload structs down from DM to
   DC, then pass them back up from DC to DM and have to figure out how to
   reconstruct the DRM context that we actually need to use the MST helpers
   from that. So, that kind of further complicates the confusion of where
   layers should be separated.
 * As far as I'm aware with C there shouldn't be any issue with adding a
   pointer to a struct whose contents are undefined. IMHO, this is also
   preferable to just using void* because then at least you get some hint as
   to the actual type of the data and avoid the possibility of casting it to
   the wrong type. So tl;dr, on any platform even outside of Linux with a
   reasonably compliant compiler this should still build just fine. It'll even
   give you the added bonus of warning people if they try to access the
   contents of this member in DC on non-Linux platforms. If void* is preferred
   though I'm fine with switching it to that.

-- 
Cheers, Lyude Paul (she/her) Software Engineer at Red Hat

