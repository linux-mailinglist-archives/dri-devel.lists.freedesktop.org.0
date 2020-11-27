Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20552C7C3E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233DC6E40A;
	Mon, 30 Nov 2020 01:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB8B6F40E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 21:15:54 +0000 (UTC)
Received: from [IPv6:2804:431:e7dc:db22::def] (unknown
 [IPv6:2804:431:e7dc:db22::def])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3C3CA1F46611;
 Fri, 27 Nov 2020 21:15:49 +0000 (GMT)
Subject: Re: [PATCH] drm/vkms: detect modes during output initialization
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel <dri-devel@lists.freedesktop.org>
References: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
 <20201124143947.GP401619@phenom.ffwll.local>
 <9365f1d0-2bb7-d7e8-dad6-62111abadee8@collabora.com>
Message-ID: <2da40178-2f33-d5ab-3b70-c245b023c4cc@collabora.com>
Date: Fri, 27 Nov 2020 18:16:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9365f1d0-2bb7-d7e8-dad6-62111abadee8@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/27/20 6:10 PM, Leandro Ribeiro wrote:
> In userspace we can use drmGetConnector() or drmGetConnectorCurrent() in
> order to retrieve connector information. The difference between both is
> that the former retrieves the complete set of modes and encoders
> associated with the connector, while the latter only retrieves the
> currently known set of modes and encoders - but is much faster.
> 
> This performance improvement is the reason why userspace applications
> may prefer to use drmGetConnectorCurrent() when they need to retrieve
> information from a device. The problem is that until now VKMS used to
> init its output with an encoder, but without any valid mode, so
> these userspace applications would not be able to use VKMS.
> 
> Call drm_helper_probe_single_connector_modes() during VKMS output
> initialization in order to start with the set of all valid modes.
> 
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  drivers/gpu/drm/vkms/vkms_output.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 4a1848b0318f..20343592d38a 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -80,6 +80,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		goto err_attach;
>  	}
>  
> +	ret = drm_helper_probe_single_connector_modes(connector, XRES_MAX, YRES_MAX);
> +	if (ret == 0) {
> +		DRM_ERROR("Failed to get modes for connector\n");
> +		goto err_attach;
> +	}
> +
>  	ret = vkms_enable_writeback_connector(vkmsdev);
>  	if (ret)
>  		DRM_ERROR("Failed to init writeback connector\n");
> 

After this patch we start to receive the warning from
drivers/gpu/drm/drm_modes.c:110

Thanks,
Leandro Ribeiro.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
