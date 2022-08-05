Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2F158B12B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E69BA4D3;
	Fri,  5 Aug 2022 21:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE73BA0DC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 21:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659734271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZNlrEXt8H3ovW/I1Y4O4JfffQjM6ZL4QQdyq55TVvI=;
 b=gf36g3UFfbqt0HsdaTt/tt+ZirbW2W6vS8h8ohM6afIy7BE4865FCJop78/XfRIZE2PTCj
 shpQX6sUCNKSp9O0/fSMU9L6pB8+yEXp4LWYp8VMecOWdcEr09HweTjzRsrblzp4iQSbNS
 gZDSEH3JaMy+ch8D+MAP4sYMaCFAH+w=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-ckHbRtJdNkC38o9czUCoGQ-1; Fri, 05 Aug 2022 17:17:49 -0400
X-MC-Unique: ckHbRtJdNkC38o9czUCoGQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 y17-20020a05620a25d100b006b66293d75aso2864634qko.17
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 14:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=RZNlrEXt8H3ovW/I1Y4O4JfffQjM6ZL4QQdyq55TVvI=;
 b=a0uVplrLTdi+EUPEsASwTDkVPvQqVVoIqnAYXrkds+34qFwK8CYzioWDNJxBkFuJqE
 Ps/6mpLf8gmakzi/W6fmKAxiQ0vhHsbWwx2n69lMmL61a3P7Ni9ELE1SCn4O42q6lIFZ
 vxsKdNY+BgeKhKAuu5Vhdkr60Lid8fNzk7UmitpNSlgQoMItDg5RIy2oqPGk5DUWvBlB
 0+N1Okjn0X5xkLbL854ebfUuS6BdezT5oY0YU/mMKcbmz1rm4N4PykEYLXwIXIjVRAJg
 OLpg+LegvgkagFwDV6RfcTqGqA5YdeqyQkj/kQ2uI9JbFks3vetznope30mPob8ffVVG
 rxUw==
X-Gm-Message-State: ACgBeo0tIj5Au7zseJB2OzN1I5KkiUnfi/4izoL7bQuPrb5ixUb8GbC/
 YCd1CUrC+/StiWQMYPxRT6Qc2oH+MopcUieRPpeTNLxkSMDnojuc0iRq7mPOFDqK9uZ3EEmGv6t
 xzu10FVYxuToKXh/s3QpDhKWpdaC7
X-Received: by 2002:a37:b483:0:b0:6b5:8688:5299 with SMTP id
 d125-20020a37b483000000b006b586885299mr6636104qkf.147.1659734269043; 
 Fri, 05 Aug 2022 14:17:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7pmL6DY3sVN5gCS02n3AEyH096euzmB9SRpV1Pn7JxBN+0iCPYIk1jwjNp9v201FEnnIEpPw==
X-Received: by 2002:a37:b483:0:b0:6b5:8688:5299 with SMTP id
 d125-20020a37b483000000b006b586885299mr6636063qkf.147.1659734268786; 
 Fri, 05 Aug 2022 14:17:48 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 d3-20020a05620a158300b006b5e3ca6400sm3439923qkk.103.2022.08.05.14.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:17:48 -0700 (PDT)
Message-ID: <8db8a726d1aac25b3590497db9cbdcc3fe161227.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] drm/dp_mst: add passthrough_aux to struct
 drm_dp_mst_port
From: Lyude Paul <lyude@redhat.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org
Date: Fri, 05 Aug 2022 17:17:46 -0400
In-Reply-To: <20220805211317.176672-1-hamza.mahfooz@amd.com>
References: <20220805211317.176672-1-hamza.mahfooz@amd.com>
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

lgtm!

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-08-05 at 17:13 -0400, Hamza Mahfooz wrote:
> Currently, there is no way to identify if DSC pass-through can be
> enabled and what aux DSC pass-through requests ought to be sent to. So,
> add a variable to struct drm_dp_mst_port that keeps track of the
> aforementioned information.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: define DP_DSC_PASSTHROUGH_IS_SUPPORTED
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
>  include/drm/display/drm_dp.h                  | 1 +
>  include/drm/display/drm_dp_mst_helper.h       | 3 +++
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 67b3b9697da7..71915afd9892 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5921,8 +5921,10 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
>  		/* Enpoint decompression with DP-to-DP peer device */
>  		if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
>  		    (endpoint_fec & DP_FEC_CAPABLE) &&
> -		    (upstream_dsc & 0x2) /* DSC passthrough */)
> +		    (upstream_dsc & DP_DSC_PASSTHROUGH_IS_SUPPORTED)) {
> +			port->passthrough_aux = &immediate_upstream_port->aux;
>  			return &port->aux;
> +		}
>  
>  		/* Virtual DPCD decompression with DP-to-DP peer device */
>  		return &immediate_upstream_port->aux;
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 9e3aff7e68bb..4d0abe4c7ea9 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -239,6 +239,7 @@
>  
>  #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
>  # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
> +# define DP_DSC_PASSTHROUGH_IS_SUPPORTED    (1 << 1)
>  
>  #define DP_DSC_REV                          0x061
>  # define DP_DSC_MAJOR_MASK                  (0xf << 0)
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index 10adec068b7f..4a39c95f8afd 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -86,6 +86,8 @@ struct drm_dp_vcpi {
>   * @next: link to next port on this branch device
>   * @aux: i2c aux transport to talk to device connected to this port, protected
>   * by &drm_dp_mst_topology_mgr.base.lock.
> + * @passthrough_aux: parent aux to which DSC pass-through requests should be
> + * sent, only set if DSC pass-through is possible.
>   * @parent: branch device parent of this port
>   * @vcpi: Virtual Channel Payload info for this port.
>   * @connector: DRM connector this port is connected to. Protected by
> @@ -140,6 +142,7 @@ struct drm_dp_mst_port {
>  	 */
>  	struct drm_dp_mst_branch *mstb;
>  	struct drm_dp_aux aux; /* i2c bus for this port? */
> +	struct drm_dp_aux *passthrough_aux;
>  	struct drm_dp_mst_branch *parent;
>  
>  	struct drm_dp_vcpi vcpi;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

