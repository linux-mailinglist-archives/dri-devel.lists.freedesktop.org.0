Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D02553AAF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 21:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B5010E8EC;
	Tue, 21 Jun 2022 19:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2177010E943
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655840261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qu+hqkp0ZSoYmNwiO1knCkx+ca27suxkvWUEOC/mfPk=;
 b=C1iWYcPC9cw9LlzpE/3a0VAj2Jzb4QFBo9p+mbp6Is3I96svecLNwrhMRgwjgXgAYHXzOP
 8xNmw3nzAYTeqrcb+LSoCEnB8Twoi5fI9emKTnzYuDv0Z/OKfnqYCAMZvI/eG/y3bJj8Dw
 Pco7Vi6yuj+hld8Or7qJ+oaHGlFAlMk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-tSAFAVP4NlyCB1Cac92RKQ-1; Tue, 21 Jun 2022 15:37:40 -0400
X-MC-Unique: tSAFAVP4NlyCB1Cac92RKQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 t15-20020a05620a450f00b006a75bf35680so17544790qkp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=qu+hqkp0ZSoYmNwiO1knCkx+ca27suxkvWUEOC/mfPk=;
 b=3/taF0en9yvJam62/XlpEhIdoxcJGzJSPeaDBBmUc6BifK5zRx7Pb7yLTBT7tRudX0
 lnWv34QkaQjS3f3Vnna/Fv9OPleSmiBjEkwrAOTnuoCgCVq8gwOCGLVlMbd3qaTCrU0G
 lIHYAG0WBKipg5PPyZWyWkMkYZpmPEl1gAbe0vJLfxx0b2Og/qUqajHsaZXRDkt5A7MD
 +dYDyzbqkv5n3Wa6EqzUNyTfweRNWFiqFNmkQV1yKhinoFT7OqhBZ2b/BJIcYOS2GkH+
 bKM6yWo77h4VEV3tawD1moesGBaCTaPpLMV8NH0dz2e83gvQVT8X5XEDeGl07DZsZIVM
 /tLw==
X-Gm-Message-State: AJIora/Wx3MqT8hjMPaIpJ/TnoV9IuYWRADCoJebHTH5H/KVSxA4XG0Y
 stEMtnO6AYlLQ9VJVznHBv55dpjMQSZN+w0KbHzBs+NyJd+9IYaPjJaMzeswd8S1/zVAS6Versp
 7FCNM42HLqB1s7vtgP/LcrK7sTRB8
X-Received: by 2002:a05:620a:28d3:b0:6a7:4622:6da8 with SMTP id
 l19-20020a05620a28d300b006a746226da8mr21552944qkp.541.1655840260211; 
 Tue, 21 Jun 2022 12:37:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tDZnCDXrNfnnhHJs9Wcc9ITw4Hnhpqjh0ps0HnfSLrIwbq7dpnHJ5fkHKap+vHwesdk2nAQw==
X-Received: by 2002:a05:620a:28d3:b0:6a7:4622:6da8 with SMTP id
 l19-20020a05620a28d300b006a746226da8mr21552932qkp.541.1655840259973; 
 Tue, 21 Jun 2022 12:37:39 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05620a408900b006a740bb8578sm15626152qko.83.2022.06.21.12.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 12:37:39 -0700 (PDT)
Message-ID: <758b642ece93bd025d24080bf1d33703ba6f6ee1.camel@redhat.com>
Subject: Re: [PATCH 3/3] drm/dp_mst: Get rid of old comment in
 drm_atomic_get_mst_topology_state docs
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Tue, 21 Jun 2022 15:37:38 -0400
In-Reply-To: <CO6PR12MB5489D6138C8CC26344618172FCAB9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220602201757.30431-1-lyude@redhat.com>
 <20220602201757.30431-4-lyude@redhat.com>
 <CO6PR12MB5489D6138C8CC26344618172FCAB9@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 Rajkumar Subbiah <rsubbia@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks! Will push these two patches upstream

On Mon, 2022-06-13 at 09:59 +0000, Lin, Wayne wrote:
> [Public]
> 
> Hi Lyude,
> 
> Feel free to add
> Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>
> 
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Friday, June 3, 2022 4:18 AM
> > To: dri-devel@lists.freedesktop.org
> > Cc: David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>;
> > Thomas
> > Zimmermann <tzimmermann@suse.de>; Lin, Wayne
> > <Wayne.Lin@amd.com>; Jani Nikula <jani.nikula@intel.com>; Lakha,
> > Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Rajkumar Subbiah
> > <rsubbia@codeaurora.org>; open list <linux-kernel@vger.kernel.org>
> > Subject: [PATCH 3/3] drm/dp_mst: Get rid of old comment in
> > drm_atomic_get_mst_topology_state docs
> > 
> > We don't actually care about connection_mutex here anymore, so let's get
> > rid of the comment mentioning it in this function's kdocs.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index d6e595b95f07..9f96132a5d74 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -5458,8 +5458,7 @@
> > EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
> >   *
> >   * This function wraps drm_atomic_get_priv_obj_state() passing in the MST
> > atomic
> >   * state vtable so that the private object state returned is that of a
> > MST
> > - * topology object. Also, drm_atomic_get_private_obj_state() expects the
> > caller
> > - * to care of the locking, so warn if don't hold the connection_mutex.
> > + * topology object.
> >   *
> >   * RETURNS:
> >   *
> > --
> > 2.35.3
> 
> --
> Regards,
> Wayne Lin
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

