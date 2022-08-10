Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC58358F3CD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 23:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7DB8D1F3;
	Wed, 10 Aug 2022 21:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997B011BBFD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 21:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660166662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CH+bsRVfRKAzxfRz0Y6zPUvP9PuA2dTgow9CTkbokJU=;
 b=RqtKHfICD1U/7rfRVju1Emb2GJrX5ouPFtWM/23GBEQvcUWlUMXq2jsWPqIlRZezGvKyvK
 xcO6mAyXklqDwgKejS5tOKpK1nGUzu6waHx6U0V3YNrZ0QQUsQ7KMUJLZyXqjBiJg5O9fU
 GC8dqYf1fUgYIjNCvfnO8j3+5BxtKxM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-w51bhevlPhyu7QeoCXMvVQ-1; Wed, 10 Aug 2022 17:24:21 -0400
X-MC-Unique: w51bhevlPhyu7QeoCXMvVQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 e30-20020ac8011e000000b00342f61e67aeso8066098qtg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 14:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=CH+bsRVfRKAzxfRz0Y6zPUvP9PuA2dTgow9CTkbokJU=;
 b=5juFbBIdy1L4k/8740iK+2j/fW9l6XBt2u3r2k2rZl7ItCW87CcTRlR6jJDf/dIHZi
 wzM+nkje/Mcdx9D6ixO4km26ogqzQat1PTFjAQWxFw7gioi+T66fH5ZqeibjSvMIM/Nh
 olmwsY67uZkC4xvRN8uH9xhcffF4HidS3Ep5Cxrt6XA4BW8TeYlwqXEGd+e+d73uCy+Q
 UznwYr9M4DkdZHIkykbRz6RnJJj4iSIE9RSfo4fbedhz38npbih59yHdR8KkITZni71c
 mB3QOVk7fKF7brQsXtoNUg+7+5Kk9JDNqRmGWQdUPVv0lzRLbs4dmhwzKveeLH6Ejncg
 lxrQ==
X-Gm-Message-State: ACgBeo10PFuMCY3Iy51oTDbT44Wx589GKQO7G18Z7qYodUhV5t7KHoYM
 /Rvr6+Uc/Ov+TiL1/jTKtC4faut1Jox11UqZix66CI6uSstHHacBsnypnhT9IVtIdmVwVlM8cmg
 SfBgH12mC9y26nZYxGi1ehzNeP1xx
X-Received: by 2002:ad4:5c8c:0:b0:477:d19:1a44 with SMTP id
 o12-20020ad45c8c000000b004770d191a44mr25810457qvh.15.1660166661109; 
 Wed, 10 Aug 2022 14:24:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7XpKjHRWLRkaNX1FxNV371wKY9RaiC7cNv4LC+I+YThDc2iSlxEACY5NpVokJ14lxVzaofjw==
X-Received: by 2002:ad4:5c8c:0:b0:477:d19:1a44 with SMTP id
 o12-20020ad45c8c000000b004770d191a44mr25810417qvh.15.1660166660820; 
 Wed, 10 Aug 2022 14:24:20 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 bq19-20020a05620a469300b006b59ddb4bc5sm708593qkb.84.2022.08.10.14.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 14:24:20 -0700 (PDT)
Message-ID: <df2b8017427dc2ebab9bcf70e406d0732ef59299.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] drm/dp_mst: add passthrough_aux to struct
 drm_dp_mst_port
From: Lyude Paul <lyude@redhat.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org
Date: Wed, 10 Aug 2022 17:24:18 -0400
In-Reply-To: <a8de299f-0868-eef7-7bef-de8207900370@amd.com>
References: <20220805211317.176672-1-hamza.mahfooz@amd.com>
 <8db8a726d1aac25b3590497db9cbdcc3fe161227.camel@redhat.com>
 <b6e10f4a-6834-fccb-0cba-0990dda37a76@amd.com>
 <3690a632acc9d5d83ae8a33dfc8b88db7fe8aebf.camel@redhat.com>
 <a8de299f-0868-eef7-7bef-de8207900370@amd.com>
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
Cc: Ian Chen <ian.chen@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Imran Khan <imran.f.khan@oracle.com>,
 Kees Cook <keescook@chromium.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, hersenxs.wu@amd.com,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Zhang <dingchen.zhang@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Roman Li <Roman.Li@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-08-10 at 09:23 -0400, Hamza Mahfooz wrote:
> On 2022-08-09 18:01, Lyude Paul wrote:
> > Ah yes of course! Probably should have asked when I gave the r-b :). Also,
> > just so patchwork actually catches it I will say the magic incantation:
> > 
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > Do we want to merge just this patch to drm-misc-next, or do you want to merge
> > the whole series through there? If you'd rather just merge this through amd's
> > branch I'm fine with that as well
> 
> In that case, it is preferable to have all of the patches in this series
> to get merged through amd's branch.\

Sounds totally fine to me! Just make sure to run it by Harry or another amdgpu
maintainer first, and then you should be good to go.

> 
> > 
> > On Tue, 2022-08-09 at 11:15 -0400, Hamza Mahfooz wrote:
> > > Hey Lyude,
> > > 
> > > On 2022-08-05 17:17, Lyude Paul wrote:
> > > > lgtm!
> > > > 
> > > 
> > > Any chance you can apply this to drm-misc-next?
> > > 
> > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > 
> > > > On Fri, 2022-08-05 at 17:13 -0400, Hamza Mahfooz wrote:
> > > > > Currently, there is no way to identify if DSC pass-through can be
> > > > > enabled and what aux DSC pass-through requests ought to be sent to. So,
> > > > > add a variable to struct drm_dp_mst_port that keeps track of the
> > > > > aforementioned information.
> > > > > 
> > > > > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > > > > ---
> > > > > v2: define DP_DSC_PASSTHROUGH_IS_SUPPORTED
> > > > > ---
> > > > >    drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> > > > >    include/drm/display/drm_dp.h                  | 1 +
> > > > >    include/drm/display/drm_dp_mst_helper.h       | 3 +++
> > > > >    3 files changed, 7 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > index 67b3b9697da7..71915afd9892 100644
> > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > @@ -5921,8 +5921,10 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
> > > > >    		/* Enpoint decompression with DP-to-DP peer device */
> > > > >    		if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
> > > > >    		    (endpoint_fec & DP_FEC_CAPABLE) &&
> > > > > -		    (upstream_dsc & 0x2) /* DSC passthrough */)
> > > > > +		    (upstream_dsc & DP_DSC_PASSTHROUGH_IS_SUPPORTED)) {
> > > > > +			port->passthrough_aux = &immediate_upstream_port->aux;
> > > > >    			return &port->aux;
> > > > > +		}
> > > > >    
> > > > >    		/* Virtual DPCD decompression with DP-to-DP peer device */
> > > > >    		return &immediate_upstream_port->aux;
> > > > > diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> > > > > index 9e3aff7e68bb..4d0abe4c7ea9 100644
> > > > > --- a/include/drm/display/drm_dp.h
> > > > > +++ b/include/drm/display/drm_dp.h
> > > > > @@ -239,6 +239,7 @@
> > > > >    
> > > > >    #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
> > > > >    # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
> > > > > +# define DP_DSC_PASSTHROUGH_IS_SUPPORTED    (1 << 1)
> > > > >    
> > > > >    #define DP_DSC_REV                          0x061
> > > > >    # define DP_DSC_MAJOR_MASK                  (0xf << 0)
> > > > > diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> > > > > index 10adec068b7f..4a39c95f8afd 100644
> > > > > --- a/include/drm/display/drm_dp_mst_helper.h
> > > > > +++ b/include/drm/display/drm_dp_mst_helper.h
> > > > > @@ -86,6 +86,8 @@ struct drm_dp_vcpi {
> > > > >     * @next: link to next port on this branch device
> > > > >     * @aux: i2c aux transport to talk to device connected to this port, protected
> > > > >     * by &drm_dp_mst_topology_mgr.base.lock.
> > > > > + * @passthrough_aux: parent aux to which DSC pass-through requests should be
> > > > > + * sent, only set if DSC pass-through is possible.
> > > > >     * @parent: branch device parent of this port
> > > > >     * @vcpi: Virtual Channel Payload info for this port.
> > > > >     * @connector: DRM connector this port is connected to. Protected by
> > > > > @@ -140,6 +142,7 @@ struct drm_dp_mst_port {
> > > > >    	 */
> > > > >    	struct drm_dp_mst_branch *mstb;
> > > > >    	struct drm_dp_aux aux; /* i2c bus for this port? */
> > > > > +	struct drm_dp_aux *passthrough_aux;
> > > > >    	struct drm_dp_mst_branch *parent;
> > > > >    
> > > > >    	struct drm_dp_vcpi vcpi;
> > > > 
> > > 
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

