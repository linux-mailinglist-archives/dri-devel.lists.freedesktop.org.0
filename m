Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C91258E246
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 00:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991C9D0EC8;
	Tue,  9 Aug 2022 22:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F74ED0DCA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 22:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660082515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXClH5jdUWIe5M+ib/xHzOhaf9sL3Q8vI0p0DQ3TOBg=;
 b=P7FvOr5kS8+TtEV7ZZcUvi/hhXsjxM5utX6o6Q4h2aj5zo2/NtAWImYL7panOEMU6z0Up2
 w6qB28qLdkEkU55BuD464FLDwrZAKt2l2pzSSI1w5ZlhYdQXgyTKFU7TU7rlfOQ+UFTRW7
 FejxklQthLd84eWbVkd5xB89p86qVBc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-wac7rijtPSunsFssM95F1w-1; Tue, 09 Aug 2022 18:01:52 -0400
X-MC-Unique: wac7rijtPSunsFssM95F1w-1
Received: by mail-qk1-f199.google.com with SMTP id
 de4-20020a05620a370400b006a9711bd9f8so11112384qkb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 15:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=hXClH5jdUWIe5M+ib/xHzOhaf9sL3Q8vI0p0DQ3TOBg=;
 b=LmqLipY7n78SLk2wCK8YwFqilXEHqeshRBlKGiO6d9WXaQJIfjpPsOu3ILOPwCeRDD
 CqkrV+PzJI+I5zI8DzpJRXt1mnMJ9Cs/y2sITYtUK9ar/twCq+xPSWz6flB61iLY74JH
 Dhb4r4fP03tgreTKRx/Z9hIigVPXAzwqZkTLpI9UVXaaN2SwgIxHKQpHWAhxvI4WoMRb
 bKbiikwO86FUcZzkf9Q6gQbjs9uLNCSipKlGpSVb9O8t+4czRh/0Ywtti7WxYX2g8g9a
 RLf6WGuDbJDHpKDmUm1WcUCr9aEuUlzv6CPoHBcrwa1DldMNjoUKonOlqBzEpQSMJRGI
 YKyQ==
X-Gm-Message-State: ACgBeo0c3mZENppIo1AGIuWKVcH0pqZ9YFzjHhRAcnvgQizZ7Az6QD6f
 ZYWtaY7yo8r30OPckxrrmERgIqalPvTRi1nQVzp5SVPgu3njtbT0trgZyfARj3wZVCu37+dBXmy
 /je6fQiFS1twVzQUwlR6+b1VWIi87
X-Received: by 2002:a05:622a:406:b0:343:7ae:4fe9 with SMTP id
 n6-20020a05622a040600b0034307ae4fe9mr4263142qtx.541.1660082511917; 
 Tue, 09 Aug 2022 15:01:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7j97sgEEk3li4n4X8PZTGGsvKpjv63PR41p3SkEOYsJC//AlysS6kFFWEKTw7244zroa4EKg==
X-Received: by 2002:a05:622a:406:b0:343:7ae:4fe9 with SMTP id
 n6-20020a05622a040600b0034307ae4fe9mr4263108qtx.541.1660082511664; 
 Tue, 09 Aug 2022 15:01:51 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 u18-20020a37ab12000000b006b945519488sm5268186qke.88.2022.08.09.15.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 15:01:51 -0700 (PDT)
Message-ID: <3690a632acc9d5d83ae8a33dfc8b88db7fe8aebf.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] drm/dp_mst: add passthrough_aux to struct
 drm_dp_mst_port
From: Lyude Paul <lyude@redhat.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org
Date: Tue, 09 Aug 2022 18:01:49 -0400
In-Reply-To: <b6e10f4a-6834-fccb-0cba-0990dda37a76@amd.com>
References: <20220805211317.176672-1-hamza.mahfooz@amd.com>
 <8db8a726d1aac25b3590497db9cbdcc3fe161227.camel@redhat.com>
 <b6e10f4a-6834-fccb-0cba-0990dda37a76@amd.com>
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

Ah yes of course! Probably should have asked when I gave the r-b :). Also,
just so patchwork actually catches it I will say the magic incantation:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Do we want to merge just this patch to drm-misc-next, or do you want to merge
the whole series through there? If you'd rather just merge this through amd's
branch I'm fine with that as well

On Tue, 2022-08-09 at 11:15 -0400, Hamza Mahfooz wrote:
> Hey Lyude,
> 
> On 2022-08-05 17:17, Lyude Paul wrote:
> > lgtm!
> > 
> 
> Any chance you can apply this to drm-misc-next?
> 
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > On Fri, 2022-08-05 at 17:13 -0400, Hamza Mahfooz wrote:
> > > Currently, there is no way to identify if DSC pass-through can be
> > > enabled and what aux DSC pass-through requests ought to be sent to. So,
> > > add a variable to struct drm_dp_mst_port that keeps track of the
> > > aforementioned information.
> > > 
> > > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > > ---
> > > v2: define DP_DSC_PASSTHROUGH_IS_SUPPORTED
> > > ---
> > >   drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> > >   include/drm/display/drm_dp.h                  | 1 +
> > >   include/drm/display/drm_dp_mst_helper.h       | 3 +++
> > >   3 files changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > index 67b3b9697da7..71915afd9892 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -5921,8 +5921,10 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
> > >   		/* Enpoint decompression with DP-to-DP peer device */
> > >   		if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
> > >   		    (endpoint_fec & DP_FEC_CAPABLE) &&
> > > -		    (upstream_dsc & 0x2) /* DSC passthrough */)
> > > +		    (upstream_dsc & DP_DSC_PASSTHROUGH_IS_SUPPORTED)) {
> > > +			port->passthrough_aux = &immediate_upstream_port->aux;
> > >   			return &port->aux;
> > > +		}
> > >   
> > >   		/* Virtual DPCD decompression with DP-to-DP peer device */
> > >   		return &immediate_upstream_port->aux;
> > > diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> > > index 9e3aff7e68bb..4d0abe4c7ea9 100644
> > > --- a/include/drm/display/drm_dp.h
> > > +++ b/include/drm/display/drm_dp.h
> > > @@ -239,6 +239,7 @@
> > >   
> > >   #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
> > >   # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
> > > +# define DP_DSC_PASSTHROUGH_IS_SUPPORTED    (1 << 1)
> > >   
> > >   #define DP_DSC_REV                          0x061
> > >   # define DP_DSC_MAJOR_MASK                  (0xf << 0)
> > > diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> > > index 10adec068b7f..4a39c95f8afd 100644
> > > --- a/include/drm/display/drm_dp_mst_helper.h
> > > +++ b/include/drm/display/drm_dp_mst_helper.h
> > > @@ -86,6 +86,8 @@ struct drm_dp_vcpi {
> > >    * @next: link to next port on this branch device
> > >    * @aux: i2c aux transport to talk to device connected to this port, protected
> > >    * by &drm_dp_mst_topology_mgr.base.lock.
> > > + * @passthrough_aux: parent aux to which DSC pass-through requests should be
> > > + * sent, only set if DSC pass-through is possible.
> > >    * @parent: branch device parent of this port
> > >    * @vcpi: Virtual Channel Payload info for this port.
> > >    * @connector: DRM connector this port is connected to. Protected by
> > > @@ -140,6 +142,7 @@ struct drm_dp_mst_port {
> > >   	 */
> > >   	struct drm_dp_mst_branch *mstb;
> > >   	struct drm_dp_aux aux; /* i2c bus for this port? */
> > > +	struct drm_dp_aux *passthrough_aux;
> > >   	struct drm_dp_mst_branch *parent;
> > >   
> > >   	struct drm_dp_vcpi vcpi;
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

