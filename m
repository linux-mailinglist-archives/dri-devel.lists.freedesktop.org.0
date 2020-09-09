Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8D32631FC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 18:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6835A6EE8F;
	Wed,  9 Sep 2020 16:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA596EE8F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599669195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydUEDRTQHx4pHV71ApF5AUGdVHqxSu2qaRj9XnFjsic=;
 b=A/I50b6+iIOFoBouKQ9QAcX3gxZHYxXobclpABD4MCGR4lQWDLX3jRWU26/N++PeT5RpCF
 Jzl57CXuiIMeSx7GnuuvSt2DkeT0FVG3IvLeEWs8yCtfyykDuRwFhnzue858OOtNu3dbkx
 TFubooXKcjxqmDZRPesP1rky06UMNT8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-dAs1HiNBOdeWra4C8m1Arw-1; Wed, 09 Sep 2020 12:33:11 -0400
X-MC-Unique: dAs1HiNBOdeWra4C8m1Arw-1
Received: by mail-qv1-f72.google.com with SMTP id d30so1703899qve.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 09:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ydUEDRTQHx4pHV71ApF5AUGdVHqxSu2qaRj9XnFjsic=;
 b=KyZPe4FIfTht5G6CNVh5wyfpPUQIDsBgxS8O2dFIoLb2aAIA31OpJYDdKUo02JkZqH
 5BRB0ZnqPvpmjtPmv7XpZU3XkkzKad/JLTDMltVHqrXnD0nbf6crJflTLN4Tb82gWWb8
 ooi0byh4N9q491sKiAb49biAuJCr97+bjSGO2A8XTxNVUJNWoOR6/CZfENdBgzOArcNo
 t3ojGvqJwPVqvbpQb9CVxbmquvdbxqCsz5KkX6kfKM7LAQ9J+pHDG1sE3r6181nXf6f7
 qE0iAfU75NSuZVfTJmdFZi9oFLesFCTRM4VpSjsuwpFzObuQ2iN8GKShO+3UF/UEjnei
 faIQ==
X-Gm-Message-State: AOAM532zkqNlc7WaCVUWpET2YlIoqxzty9eMrV7e7MHor0111Wqs1hV6
 kA6x1adJyGx49VHcovipTIey2Za6SObMfXS59h70vx5HV/C6VZaVu3WOfGa5fieKlumDSbX6RGL
 Kctp+n1UZAybtkp+i+ozrcM7UaahJ
X-Received: by 2002:aed:2946:: with SMTP id s64mr3916121qtd.335.1599669191404; 
 Wed, 09 Sep 2020 09:33:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlPSv1t4uQJliUFOWasTHsIqACn1sYRHgZH9OsiLyUio1qii1cEYYNP86dD7m0A9TE/nxZxw==
X-Received: by 2002:aed:2946:: with SMTP id s64mr3916097qtd.335.1599669191102; 
 Wed, 09 Sep 2020 09:33:11 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 192sm3225151qkn.9.2020.09.09.09.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:33:10 -0700 (PDT)
Message-ID: <b1dcaf433b7ebe2d0284693724f0e7d8a7fa4825.camel@redhat.com>
Subject: Re: [PATCH] drm/dp: For MST hub, Get max_link_rate&max_lane from
 extended rx capability field if EXTENDED_RECEIVER_CAPABILITY_FILED_PRESENT
 is set.
From: Lyude Paul <lyude@redhat.com>
To: Koba Ko <koba.ko@canonical.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Date: Wed, 09 Sep 2020 12:33:09 -0400
In-Reply-To: <CAJB-X+WPiUR8N5sLMS2UC-rPHj=TGJy2ezeBPjjeUXzbN5bfcg@mail.gmail.com>
References: <20200827053053.11271-1-koba.ko@canonical.com>
 <CAJB-X+WPiUR8N5sLMS2UC-rPHj=TGJy2ezeBPjjeUXzbN5bfcg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: Anthony Wong <anthony.wong@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We just added a new helper for DPCD retrieval to drm_dp_helper.c (which also
handles grabbing the extended receiver caps), we should probably make use of
it here 

On Wed, 2020-09-09 at 14:31 +0800, Koba Ko wrote:
> On Thu, Aug 27, 2020 at 1:30 PM Koba Ko <koba.ko@canonical.com> wrote:
> > Currently, DRM get the capability of the mst hub only from DP_DPCD_REV and
> > get the slower speed even the mst hub can run in the faster speed.
> > 
> > As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1, read the DP_DP13_DPCD_REV
> > to
> > get the faster capability.
> > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0, read DP_DPCD_REV.
> > 
> > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 67dd72ea200e..3b84c6801281 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -3497,6 +3497,8 @@ static int drm_dp_get_vc_payload_bw(u8 dp_link_bw,
> > u8  dp_link_count)
> >  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr,
> > bool mst_state)
> >  {
> >         int ret = 0;
> > +       u8 dpcd_ext = 0;
> > +       unsigned int dpcd_offset = 0;
> >         struct drm_dp_mst_branch *mstb = NULL;
> > 
> >         mutex_lock(&mgr->payload_lock);
> > @@ -3510,9 +3512,15 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > drm_dp_mst_topology_mgr *mgr, bool ms
> >                 struct drm_dp_payload reset_pay;
> > 
> >                 WARN_ON(mgr->mst_primary);
> > +               drm_dp_dpcd_read(mgr->aux,
> > +                                DP_TRAINING_AUX_RD_INTERVAL,
> > +                                &dpcd_ext, sizeof(dpcd_ext));
> > +
> > +               dpcd_offset =
> > +                       ((dpcd_ext &
> > DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT) ?  DP_DP13_DPCD_REV :
> > DP_DPCD_REV);
> > 
> >                 /* get dpcd info */
> > -               ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd,
> > DP_RECEIVER_CAP_SIZE);
> > +               ret = drm_dp_dpcd_read(mgr->aux, dpcd_offset, mgr->dpcd,
> > DP_RECEIVER_CAP_SIZE);
> >                 if (ret != DP_RECEIVER_CAP_SIZE) {
> >                         DRM_DEBUG_KMS("failed to read DPCD\n");
> >                         goto out_unlock;
> > --
> > 2.25.1
> > 
> Add Lyude Paul
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
