Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CDB2759BF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 16:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5FA6E162;
	Wed, 23 Sep 2020 14:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8AC6E162
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600870684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00seU7d+SoucboqzE8lt6myQo/TE6faprIC1HbLkiSI=;
 b=N/E6Tb4GN1Y/at4ZfxzFhD4n8c1DcpR6F1yOnqSvXPmxiNEjSTXqiyOE+bHhyVG/w3v+mi
 Ctkf6DyAB+94bp1XfVL/mhjhx7glzzrB8xbF3JxqT4t1cwqemJhbgQUhmrRRj11DZ8YKmS
 F+qvsAOgQHSDi403mAHrqVvVqkYYLfQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-2BZ_n56rOA66ysRjS_yptg-1; Wed, 23 Sep 2020 10:18:02 -0400
X-MC-Unique: 2BZ_n56rOA66ysRjS_yptg-1
Received: by mail-qt1-f199.google.com with SMTP id 60so19355372qtf.21
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 07:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=00seU7d+SoucboqzE8lt6myQo/TE6faprIC1HbLkiSI=;
 b=E7/Op2Et8LEiiN4v6zynhUjxt26rOm26fUN3TgdkpoIp9j7UHMXRlMpTPsfqrEZYPQ
 T/JyLvhJqKCeR6I16yl3PZKyqOq4LebkL0IxTQj3GzhGfcRh6ocWI21s/Um7o7zc9QJD
 4HD3HVs5MndcWMOlLjrcKG+Z+OfC0vNL+r1AxwOCRRTVH/Ro/JA6oOyK5uMZEFfquDZ6
 wLhDOlP++4EY2Xi/6RsZ6r2Ongjz0MLk+/qUiAxi8DMMz4W5h1Xd1LkmKcUwkch4Y2Oe
 N0rX4//BxigqCSRRslMKzy2PWoEf7YMA3FDpfVxGcCPhlQXPS2ED3ZlJD0tCdqXCkeIm
 P4Rg==
X-Gm-Message-State: AOAM5316wERpzo19KFv0QVT5XL8fmlVCVrIdjW7wngPDWMj+Ew/TiIqX
 LgV7+C/vNyuzmln2w0k1bX/915gJ7ogCr1Ux3pi0JJVfDcB5oUpqWHrCeJ6RcNVY1x3WvSTMU40
 1RQYKFl5wueSrxti8GYbCBj/lvJsS
X-Received: by 2002:a05:620a:4c1:: with SMTP id 1mr86397qks.420.1600870681847; 
 Wed, 23 Sep 2020 07:18:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwr8aM1veFfHsIXYesof9K7McKgBVEL/+koWqT2HvdqRjkvGc3XfUlnc5C1EEF1++R8E2Vfw==
X-Received: by 2002:a05:620a:4c1:: with SMTP id 1mr86371qks.420.1600870681535; 
 Wed, 23 Sep 2020 07:18:01 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id d5sm15987312qtm.36.2020.09.23.07.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 07:18:00 -0700 (PDT)
Message-ID: <9a4f2216cb621f349aa393de5d64763e4a23bc2b.camel@redhat.com>
Subject: Re: [PATCH V4] drm/dp_mst: Retrieve extended DPCD caps for topology
 manager
From: Lyude Paul <lyude@redhat.com>
To: Koba Ko <koba.ko@canonical.com>
Date: Wed, 23 Sep 2020 10:17:59 -0400
In-Reply-To: <CAJB-X+U0M1YXUyAX2nDxddwwxnPygfkk47PFrFnvERh4fUBxiw@mail.gmail.com>
References: <20200922065313.4794-1-koba.ko@canonical.com>
 <7231e2199a19aa6c8ecbecf5e80725e2a1aded73.camel@redhat.com>
 <CAJB-X+U0M1YXUyAX2nDxddwwxnPygfkk47PFrFnvERh4fUBxiw@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Anthony Wong <anthony.wong@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-09-23 at 10:16 +0800, Koba Ko wrote:
> Thanks for the review.
> Sorry for that I thought the review tag should be appended by myself.
> One thing to confirm with you, will you or I push this patch to drm-misc-
> next ?

I already pushed it with the change, so everything is all set

> Thanks a lot.
> 
> On Wed, Sep 23, 2020 at 2:01 AM Lyude Paul <lyude@redhat.com> wrote:
> > One last change I realized we should do is print the name of the AUX
> > adapter
> > in question. I don't mind just adding that myself before I push it though
> > so
> > you don't need to send a respin.
> > 
> > Going to go push this to drm-misc-next, thanks!
> > 
> > On Tue, 2020-09-22 at 14:53 +0800, Koba Ko wrote:
> > > As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> > > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1,read the DP_DP13_DPCD_REV
> > > to
> > > get the faster capability.
> > > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0,read DP_DPCD_REV.
> > > 
> > > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index e87542533640..63f8809b9aa4 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -3686,9 +3686,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > > drm_dp_mst_topology_mgr *mgr, bool ms
> > >               WARN_ON(mgr->mst_primary);
> > > 
> > >               /* get dpcd info */
> > > -             ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd,
> > > DP_RECEIVER_CAP_SIZE);
> > > -             if (ret != DP_RECEIVER_CAP_SIZE) {
> > > -                     DRM_DEBUG_KMS("failed to read DPCD\n");
> > > +             ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
> > > +             if (ret < 0) {
> > > +                     drm_dbg_kms(mgr->dev, "failed to read DPCD, ret
> > > %d\n",
> > > ret);
> > >                       goto out_unlock;
> > >               }
> > > 
> > --
> > Cheers,
> >         Lyude Paul (she/her)
> >         Software Engineer at Red Hat
> > 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
