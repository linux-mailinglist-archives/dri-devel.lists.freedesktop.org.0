Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046BE58D05C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 00:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FD3A2360;
	Mon,  8 Aug 2022 22:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FD3A2274
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659999198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPqclY0FSVViUDl2UYDey0E/+Y0xI7OX+B7XXIVceOQ=;
 b=gdBzzaQMpZgyCsaonF6RNE4We54P5diiv6K7zE/HA1XFItIA8myMyljN6b2g+UguMtWdJL
 YwCaC/L5DBSHuSmm+8U5X7qkjJxMTYFu5FH0B32Ri0mnXmsxppJv2IKRz2W33foKING6om
 07Fp3dTSu3APmsQwHHy2J5erUZkOPt0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-awi-vKiFMViD2WOGMSR5mQ-1; Mon, 08 Aug 2022 18:53:17 -0400
X-MC-Unique: awi-vKiFMViD2WOGMSR5mQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 k9-20020ac80749000000b0034302b53c6cso1598624qth.22
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 15:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=rPqclY0FSVViUDl2UYDey0E/+Y0xI7OX+B7XXIVceOQ=;
 b=7ZDGU3gO4XNdbUvn3mAu3rgRFlbRYWPya1PYZOrO58M6VHBTHXGLAMR/2MvQykrhvW
 VHwhFiLhfn/SqCJX/60QDBE+ABwozL2/t1T3f7eED+fszwqpjcGPprnPAkijdjK9YT1g
 fQ+tn6bacoBFxbJNIuxdNtvVNoz7dT1KY4d/rkNSI4i1VyqxkHFb15pnRYx49InCKQtf
 AN1L+S959tYnGFDQ3lhxQ91uthxu50jFr6PVYIP8SJ9gWAJ4Pt0nmqYC5SXmZ67cZ3cr
 BGioYX35GynuoGzX09tbpbPK83jj1D/ChyA13Xq29dnJZKfg7Ae0io5EDx5sZYJRiBVa
 /Ouw==
X-Gm-Message-State: ACgBeo2axt0j2ylWsl0VDgaqXXQV2yRr/QRgriD+WJHEx/VSM0gCk4+j
 qWGBxwrRSmXXJy/+2FlKYObYUx/w2l7G28JcyMzZhEPkyiX11MmML7d8WbE8+l0aa8JwH04zQtk
 vYB+WsbV9gTdY2KEUFD4hJLTbldds
X-Received: by 2002:a05:622a:19a7:b0:33e:ca27:6206 with SMTP id
 u39-20020a05622a19a700b0033eca276206mr18143242qtc.629.1659999197068; 
 Mon, 08 Aug 2022 15:53:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6keWmjIk9Kdkkn+Z2BPeGcqVR5KnxuwQWKh/amSVfycmJNCYkwfkDof+GiBWGMkH9wNX9cLQ==
X-Received: by 2002:a05:622a:19a7:b0:33e:ca27:6206 with SMTP id
 u39-20020a05622a19a700b0033eca276206mr18143191qtc.629.1659999196813; 
 Mon, 08 Aug 2022 15:53:16 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 bj41-20020a05620a192900b006b91c0b6404sm7731982qkb.41.2022.08.08.15.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 15:53:16 -0700 (PDT)
Message-ID: <4ea5f21ea66446ad7924bc883af30b136fa0ca22.camel@redhat.com>
Subject: Re: [RESEND RFC 18/18] drm/display/dp_mst: Move all payload info
 into the atomic state
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Date: Mon, 08 Aug 2022 18:53:13 -0400
In-Reply-To: <CO6PR12MB54896ECA603462858C9AFBA2FC639@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
 <20220607192933.1333228-19-lyude@redhat.com>
 <CO6PR12MB5489BAFF2DDCD67F8BDCD827FC819@CO6PR12MB5489.namprd12.prod.outlook.com>
 <848f35a693b26bfd15b3c6539eacd3e313dcd3a7.camel@redhat.com>
 <CO6PR12MB54896ECA603462858C9AFBA2FC639@CO6PR12MB5489.namprd12.prod.outlook.com>
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

On Mon, 2022-08-08 at 10:02 +0000, Lin, Wayne wrote:
> [Public]
> 
> 
> 
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Thursday, August 4, 2022 4:28 AM
> > To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> > nouveau@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>; Zuo, Jerry
> > <Jerry.Zuo@amd.com>; Jani Nikula <jani.nikula@intel.com>; Imre Deak
> > <imre.deak@intel.com>; Daniel Vetter <daniel.vetter@ffwll.ch>; Sean Paul
> > <sean@poorly.run>; Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun
> > peng (Leo) <Sunpeng.Li@amd.com>; Siqueira, Rodrigo
> > <Rodrigo.Siqueira@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> > Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Jani Nikula
> > <jani.nikula@linux.intel.com>; Joonas Lahtinen
> > <joonas.lahtinen@linux.intel.com>; Rodrigo Vivi <rodrigo.vivi@intel.com>;
> > Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Ben Skeggs
> > <bskeggs@redhat.com>; Karol Herbst <kherbst@redhat.com>; Kazlauskas,
> > Nicholas <Nicholas.Kazlauskas@amd.com>; Li, Roman
> > <Roman.Li@amd.com>; Shih, Jude <Jude.Shih@amd.com>; Simon Ser
> > <contact@emersion.fr>; Lakha, Bhawanpreet
> > <Bhawanpreet.Lakha@amd.com>; Mikita Lipski <mikita.lipski@amd.com>;
> > Claudio Suarez <cssk@net-c.es>; Chen, Ian <Ian.Chen@amd.com>; Colin Ian
> > King <colin.king@intel.com>; Wu, Hersen <hersenxs.wu@amd.com>; Liu,
> > Wenjing <Wenjing.Liu@amd.com>; Lei, Jun <Jun.Lei@amd.com>; Strauss,
> > Michael <Michael.Strauss@amd.com>; Ma, Leo <Hanghong.Ma@amd.com>;
> > Thomas Zimmermann <tzimmermann@suse.de>; José Roberto de Souza
> > <jose.souza@intel.com>; He Ying <heying24@huawei.com>; Anshuman
> > Gupta <anshuman.gupta@intel.com>; Andi Shyti
> > <andi.shyti@linux.intel.com>; Ashutosh Dixit <ashutosh.dixit@intel.com>;
> > Juston Li <juston.li@intel.com>; Sean Paul <seanpaul@chromium.org>;
> > Fernando Ramos <greenfoo@u92.eu>; Luo Jiaxing
> > <luojiaxing@huawei.com>; Javier Martinez Canillas <javierm@redhat.com>;
> > open list <linux-kernel@vger.kernel.org>; open list:INTEL DRM DRIVERS
> > <intel-gfx@lists.freedesktop.org>
> > Subject: Re: [RESEND RFC 18/18] drm/display/dp_mst: Move all payload info
> > into the atomic state
> > 
> > On Tue, 2022-07-05 at 09:10 +0000, Lin, Wayne wrote:
> > > > +struct drm_dp_mst_port;
> > > > +
> > > >   /* DP MST stream allocation (payload bandwidth number) */
> > > >   struct dc_dp_mst_stream_allocation {
> > > >    uint8_t vcp_id;
> > > >    /* number of slots required for the DP stream in
> > > >    * transport packet */
> > > >    uint8_t slot_count;
> > > > + /* The MST port this is on, this is used to associate DC MST
> > > > + payloads
> > > > with their
> > > > + * respective DRM payloads allocations, and can be ignored on non-
> > > > Linux.
> > > > + */
> > > 
> > > Is it necessary for adding this new member? Since this is for setting
> > > the DC HW and not relating to drm.
> > 
> > I don't entirely know, honestly. The reasons I did it:
> > 
> >  * Mapping things from DRM to DC and from DC to DRM is really confusing for
> >    outside contributors like myself, so it wasn't even really clear to me if
> >    there was another way to reconstruct the DRM context from the spots
> > where
> >    we call from DC up to DM (not a typo, see next point).
> >  * These DC structs for MST are already layer mixing as far as I can tell,
> >    just not in an immediately obvious way. While this struct itself is for DC,
> >    there's multiple spots where we pass the DC payload structs down from
> > DM to
> >    DC, then pass them back up from DC to DM and have to figure out how to
> >    reconstruct the DRM context that we actually need to use the MST helpers
> >    from that. So, that kind of further complicates the confusion of where
> >    layers should be separated.
> >  * As far as I'm aware with C there shouldn't be any issue with adding a
> >    pointer to a struct whose contents are undefined. IMHO, this is also
> >    preferable to just using void* because then at least you get some hint as
> >    to the actual type of the data and avoid the possibility of casting it to
> >    the wrong type. So tl;dr, on any platform even outside of Linux with a
> >    reasonably compliant compiler this should still build just fine. It'll even
> >    give you the added bonus of warning people if they try to access the
> >    contents of this member in DC on non-Linux platforms. If void* is preferred
> >    though I'm fine with switching it to that.
> > 
> > --
> > Cheers, Lyude Paul (she/her) Software Engineer at Red Hat
> 
> Hi Lyude,
> 
> Thanks for your time!
> I was thinking that our DC just mainly takes care of HW related programming. 
> Struct dc_dp_mst_stream_allocation is only used to construct a copy of the virtual 
> channel payload ID and slots count of payload allocation table determined by
> dm/drm. ID and slots are only things required for programming HW registers.
> I think there shouldn't be any spots to try to construct the DRM context from
> this dc struct since there is no such concept in HW level. Our HW should only 
> take care of local DP link and it doesn't have overall topology info.

Looking at the code I wrote again and realizing I slightly misspoke, looking
at the code again I think I probably can drop this. It's likely I just got
totally lost with the DC codebase and thought this was necessary when it
wasn't. Will drop in the respin

> 
> Thanks!
> 
> Regards,
> Wayne

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

