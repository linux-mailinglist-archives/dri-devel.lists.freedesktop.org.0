Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CD0BA44A7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 16:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40E510E08B;
	Fri, 26 Sep 2025 14:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bCGgg6d7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FE010E08B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758898244;
 bh=lkJsYmF8Kl21o6zCOGz9tWZVCz7DsbIQo9CnfdffJK0=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=bCGgg6d7N1nKdUSC0HJWaHssrCzjWqRvacKFweotVYKtKS7ar6fwsx7H7EkHJSfMA
 fu3s7dKH+B3C54DqkJsk312ekdUW2lUqih2iMOF0bDK7jkJgw1cEW+p2YnqBON4K9v
 UdKkK+VuO/zH+W1FXt4tN6eUVwOGRRHlDwMcS4FIoTAirypHrU8Pq6eIFilyApLiA+
 M5kLztvpA0IdCM6+L0i+K82skmy1/Itzr8dGzoa3ImenHVMm829pjNDWyLzYo7n9HQ
 db2NtNiJSCPG608OS3SkvPbgdJGcp1jiea8bk6RsX3wOq+ZJnDLJ507EsYG5/n4KK1
 zp99dCMbjn0ZQ==
Received: from [192.168.1.90] (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 378E717E00B0;
 Fri, 26 Sep 2025 16:50:44 +0200 (CEST)
Message-ID: <0b9be3f0-c775-44a3-b15d-1e139dbbbf91@collabora.com>
Date: Fri, 26 Sep 2025 17:50:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 4/8] drm: Add enum conversion from/to HDMI_COLORSPACE to
 DRM_COLOR_FORMAT
To: Maxime Ripard <mripard@kernel.org>
Cc: Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org, 
 wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-5-marius.vlad@collabora.com>
 <20250912-wealthy-hopeful-dodo-2f4cbc@penduick>
Content-Language: en-US
In-Reply-To: <20250912-wealthy-hopeful-dodo-2f4cbc@penduick>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025/09/12, Maxime Ripard wrote:
> On Thu, Sep 11, 2025 at 04:07:35PM +0300, Marius Vlad wrote:
> > This would please the compiler to have a enum transformation from one to
> > another even though the values are the same. It should also make things
> > obvious that we use different enums.
> >
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >  .../gpu/drm/display/drm_hdmi_state_helper.c    |  4 +++-
> >  drivers/gpu/drm/drm_connector.c                | 18 ++++++++++++++++++
> >  include/drm/drm_connector.h                    |  3 +++
> >  3 files changed, 24 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index f9aa922d25d3..dc2f32651cb9 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -653,9 +653,11 @@ hdmi_compute_config(const struct drm_connector *connector,
> >  				       conn_state->max_bpc,
> >  				       8, connector->max_bpc);
> >  	int ret;
> > +	enum hdmi_colorspace hdmi_colorspace =
> > +		color_format_to_hdmi_colorspace(conn_state->color_format);
> >
> >  	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> > -				      HDMI_COLORSPACE_RGB);
> > +				      hdmi_colorspace);
> >  	if (ret) {
> >  		if (connector->ycbcr_420_allowed) {
> >  			ret = hdmi_compute_format_bpc(connector, conn_state,
>
> Does it really make sense to have the fallback to YUV420 here? I would
> expect to get rid of it, or only use that for "auto".

I think we should keep both RGB and YUV420 fallbacks, obviously making
them conditional on the requested color format to avoid redundant
checks.  E.g. if user-space has a preference on YUV444 which ends up not
being supported, switch to RGB, unless we're on a YUV420-only mode.

This would also require a reverse conversion from the resulting HDMI
colorspace stored in conn_state->hdmi.output_format and update
conn_state->color_format accordingly, so that all involved parties will
employ the actual color format rather than the user-preferred one.
