Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593F9F2CF2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D3D10E55B;
	Mon, 16 Dec 2024 09:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="eNz6lWkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA75310E557;
 Mon, 16 Dec 2024 09:27:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YBZN42ckmz9sFn;
 Mon, 16 Dec 2024 10:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1734341236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NtkO2Xhf8nxzP/ehXM+41u0WU5dv5qLl/KeRVlfHA0=;
 b=eNz6lWkzf9AvIc1PtCH2i+eQUjliy8Q89w9p8hXL0v19R+m3AqJnN8D+5+Qaz01yioJMGF
 jiA5h64Vl1dnkSWQ9XKiOHvrNdsRj8nuyEjp37NUPzdfsmJNjZsfg0N+tytsQLmjeGATIQ
 T4Cx2+xW/v4SIwogvMrPlmv9WHnykFf1SIZjSVEm5P2kPgVGOjJWUi+cdE8uHUdBMK8urx
 EC+r33AAi6OlWFX/KNrq/EtkmLShMqEbAE9lb8/1w/bZCRrZKKu5+XduhWgauYZX4prCA8
 jJe057xhD7UuWe8GR6e4BbF1x2U+S/YUqS3cg3vkTXzvsmcCzRrxlC8+OEf+Hw==
Message-ID: <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
Date: Mon, 16 Dec 2024 10:27:15 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 705e921a0385482e9b5
X-MBO-RS-META: 69cnhhzumprqzd1btpghuegq46uih1px
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

On 2024-12-15 21:53, Marek Olšák wrote:
> The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
>    
> Signed-off-by: Marek Olšák <marek.olsak@amd.com <mailto:marek.olsak@amd.com>>
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 78abd819fd62e..8ec4163429014 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -484,9 +484,27 @@ extern "C" {
>   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2 ioctl),
>   * which tells the driver to also take driver-internal information into account
>   * and so might actually result in a tiled framebuffer.
> + *
> + * WARNING:
> + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but only
> + * support a certain pitch alignment and can't import images with this modifier
> + * if the pitch alignment isn't exactly the one supported. They can however
> + * allocate images with this modifier and other drivers can import them only
> + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR is
> + * fundamentically incompatible across devices and is the only modifier that
> + * has a chance of not working. The PITCH_ALIGN modifiers should be used
> + * instead.
>   */
>  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
>  
> +/* Linear layout modifiers with an explicit pitch alignment in bytes.
> + * Exposing this modifier requires that the pitch alignment is exactly
> + * the number in the definition.
> + */
> +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)

It's not clear what you mean by "requires that the pitch alignment is exactly the number in the definition", since a pitch which is aligned to 256 bytes is also aligned to 128 & 64 bytes. Do you mean the pitch must be exactly the width rounded up to the next / smallest possible multiple of the specified number of bytes?


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
