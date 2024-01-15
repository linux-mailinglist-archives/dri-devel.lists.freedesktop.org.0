Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5A82DC0B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 16:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA6110E00B;
	Mon, 15 Jan 2024 15:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DEF10E00B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705331168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J6KAw5sRd/rBCtYAadIrUr1C0nBvKZvSQmMmvlANPe0=;
 b=PRr1I5KI7TW9O0CT3CN+oUz6m+GIXDXgwVk0uyXA+KLIV1cRiDoXr+ctCETelxd1CSpPbO
 UEjydgVCZLrlt+lyegyXJHigCqUi9U78WXWy5pEgHiUFHJYNyBen1ctTKDhrKlNBZGzv0A
 Tdnj98xbBNwPvIBATwoweTIRsM3YXMA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-q7vKlC3CNgO-5Na72WXVOQ-1; Mon, 15 Jan 2024 10:06:07 -0500
X-MC-Unique: q7vKlC3CNgO-5Na72WXVOQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-336b8da86eeso5951943f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 07:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705331166; x=1705935966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6KAw5sRd/rBCtYAadIrUr1C0nBvKZvSQmMmvlANPe0=;
 b=Ft2yE1LApf8oHG37o/NKAc6A9aTno/T1lM8EvDnld8qy1x+fRHlMrWL8cR7Nsp+GxJ
 JVREdXCAHeggLdG1nUhplvX/1d1VBUxUzl6Ic9FM+3MwWtwcqzEPJyY64E3rpRPq5E/Y
 h6J17m3IQwazPqugk6RqOvn5WOVKvTBwF0prl2qCl4K0+dvwisgQPtTn0arP/P+TCqcY
 /egFosQ8LBl+AEk79tV/ch3RWu5AEMpf9ZmbH4MENHlGbevbQdVcW3YMYSzPX8vXZOSQ
 5AQKMKoe+syA6rrPgtUw81QBi16Cw+qxpQFJI6iQcT6qNfxqEyhHGQlVQH5OQTA+hxth
 M7lw==
X-Gm-Message-State: AOJu0YyNlJkTvg2DWUuVckFra/PwGpmo+8ZbRnhyVV2OnXfExA2d8z6y
 4FC53xg7eMFV2Y8iU/Mllqt5QAS37dg5ciNr3VjBrJNhMCVoVixfVbTsUIOfi3bT/89c9XN96OI
 YFsAGmh48W6JT7R06u7QrGDPE4LuYbE8smbXi
X-Received: by 2002:a5d:4d47:0:b0:337:61aa:9682 with SMTP id
 a7-20020a5d4d47000000b0033761aa9682mr2972942wru.110.1705331165989; 
 Mon, 15 Jan 2024 07:06:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUUbGFoHl37nmlBps1shDre7Yn9gKUXHYUdoSEBRHHdGC4aQD0Ng5BPuhKqCteY6MZ7Iq1Bg==
X-Received: by 2002:a5d:4d47:0:b0:337:61aa:9682 with SMTP id
 a7-20020a5d4d47000000b0033761aa9682mr2972874wru.110.1705331162657; 
 Mon, 15 Jan 2024 07:06:02 -0800 (PST)
Received: from toolbox ([2001:9e8:8996:a800:5fa3:a411:5e47:8fe5])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a5d5953000000b0033609b71825sm12088386wri.35.2024.01.15.07.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 07:06:02 -0800 (PST)
Date: Mon, 15 Jan 2024 16:06:00 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH v2 0/7] Add YUV formats to VKMS
Message-ID: <20240115150600.GC160656@toolbox>
References: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
MIME-Version: 1.0
In-Reply-To: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 02:44:00PM -0300, Arthur Grillo wrote:
> This patchset aims to add support for additional buffer YUV formats.
> More specifically, it adds support to:
> 
> Semi-planar formats:
> 
> - NV12
> - NV16
> - NV24
> - NV21
> - NV61
> - NV42
> 
> Planar formats:
> 
> - YUV440
> - YUV422
> - YUV444
> - YVU440
> - YVU422
> - YVU444
> 
> These formats have more than one plane, and most have chroma
> subsampling. These properties don't have support on VKMS, so I had to
> work on this before.
> 
> To ensure that the conversions from YUV to RGB are working, I wrote a
> KUnit test. As the work from Harry on creating KUnit tests on VKMS[1] is
> not yet merged, I took the setup part (Kconfig entry and .kunitfile)
> from it.
> 
> Furthermore, I couldn't find any sources with the conversion matrices,
> so I had to work out the values myself based on the ITU papers[2][3][4].
> So, I'm not 100% sure if the values are accurate. I'd appreciate some
> input if anyone has more knowledge in this area.

H.273 CICP [1] has concise descriptions of the required values for most
widely used formats and the colour python framework [2] also can be used
to quickly get to the desired information most of the time.

[1]: https://www.itu.int/rec/T-REC-H.273
[2]: https://www.colour-science.org/

> Also, I used two IGT tests to check if the formats were having a correct
> conversion (all with the --extended flag):
> 
> - kms_plane@pixel_format
> - kms_plane@pixel_format_source_clamping.
> 
> The nonsubsampled formats don't have support on IGT, so I sent a patch
> fixing this[5].
> 
> Currently, this patchset does not add those formats to the writeback, as
> it would require a rewrite of how the conversions are done (similar to
> what was done on a previous patch[6]). So, I would like to review this
> patchset before I start the work on this other part.
> 
> [1]: https://lore.kernel.org/all/20231108163647.106853-5-harry.wentland@amd.com/
> [2]: https://www.itu.int/rec/R-REC-BT.601-7-201103-I/en
> [3]: https://www.itu.int/rec/R-REC-BT.709-6-201506-I/en
> [4]: https://www.itu.int/rec/R-REC-BT.2020-2-201510-I/en
> [5]: https://lists.freedesktop.org/archives/igt-dev/2024-January/066937.html
> [6]: https://lore.kernel.org/dri-devel/20230414135151.75975-2-mcanal@igalia.com/
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
> Changes in v2:
> - Use EXPORT_SYMBOL_IF_KUNIT instead of including the .c test
>   file (Maxime)
> - Link to v1: https://lore.kernel.org/r/20240105-vkms-yuv-v1-0-34c4cd3455e0@riseup.net
> 
> ---
> Arthur Grillo (7):
>       drm/vkms: Use drm_frame directly
>       drm/vkms: Add support for multy-planar framebuffers
>       drm/vkms: Add range and encoding properties to pixel_read function
>       drm/vkms: Add chroma subsampling
>       drm/vkms: Add YUV support
>       drm/vkms: Drop YUV formats TODO
>       drm/vkms: Create KUnit tests for YUV conversions
> 
>  Documentation/gpu/vkms.rst                    |   3 +-
>  drivers/gpu/drm/vkms/Kconfig                  |  15 ++
>  drivers/gpu/drm/vkms/Makefile                 |   1 +
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>  drivers/gpu/drm/vkms/tests/Makefile           |   3 +
>  drivers/gpu/drm/vkms/tests/vkms_format_test.c | 156 ++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>  drivers/gpu/drm/vkms/vkms_formats.c           | 247 ++++++++++++++++++++++----
>  drivers/gpu/drm/vkms/vkms_formats.h           |   9 +
>  drivers/gpu/drm/vkms/vkms_plane.c             |  26 ++-
>  drivers/gpu/drm/vkms/vkms_writeback.c         |   5 -
>  11 files changed, 426 insertions(+), 49 deletions(-)
> ---
> base-commit: eeb8e8d9f124f279e80ae679f4ba6e822ce4f95f
> change-id: 20231226-vkms-yuv-6f7859f32df8
> 
> Best regards,
> -- 
> Arthur Grillo <arthurgrillo@riseup.net>
> 

