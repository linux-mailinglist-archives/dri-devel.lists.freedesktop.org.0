Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F23446BA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C0B6E4C1;
	Mon, 22 Mar 2021 14:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17C16E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616422107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FVgT8cREJNNCZgsvwdo4IVCZkhVlPEV4H/HRfF+vQHs=;
 b=CHZliN66hPXgCQNWamKXsT2D0mInGwS8uG4hgCmsTfQi5FLDKkc6QSeA1HeoyfwVbZsGef
 lty5iL/GSY3FJOovgyCFuyKJi3E9xoKDQ+Pchl8Z0C0wm3gw3MyXZ9g6umWnZ1RG9mNorM
 7MhIcuURK9RTjjX61xkl+oWWx/zWMik=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-9l-cANgpP92BJa2btkBNFA-1; Mon, 22 Mar 2021 10:08:26 -0400
X-MC-Unique: 9l-cANgpP92BJa2btkBNFA-1
Received: by mail-qt1-f198.google.com with SMTP id b18so17996299qte.21
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FVgT8cREJNNCZgsvwdo4IVCZkhVlPEV4H/HRfF+vQHs=;
 b=SkMD1MCNPdSkQB5VyHS2A3bWC9Mh85+IYTISw8iChsf5EjsxnTBJ0+brYVuyPECBVp
 VW/wL0BeASwTVieqSOg0tyPJjQIkX0AXzBvAWX1zMs7ykgKTU3yHYwc6CBu/qWJrA6aC
 fGAC7pbsnURXu0fg/P3ZK/FhINUVjNr6KGEyXxjrI+QqD0qyip8q5QvRUddIld6TR6fE
 Lr3ViNnlZSUO2+yzGvmwlC7CW14rU1jT+pYqtocFAZXDUL8HUrgSWLkDiygpMkWOOFMS
 VCavppVOaU7tbzJLayFBiWOXKYEde0nXUe1X7sQIzpUYsMJufVcXD4EoKpS3SDy0tNo8
 lA2g==
X-Gm-Message-State: AOAM533pPougTPW6SrPyLuAlOrY5Rvc+jv8aaSQxs1AiWD2OxIziLMTX
 puZXovo11D8uugCBHDUwoVJyLZP18+OV96sPpd0JIu7wU1vGC2UIUCIgi387pwVcoD4e/AgOVx9
 v59Rl0ur5sakjf5+vtexeA1tY77xo
X-Received: by 2002:a37:a74e:: with SMTP id q75mr170966qke.165.1616422105589; 
 Mon, 22 Mar 2021 07:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrUVuJJE09nrcOBM4NdtiV05nyirk+Tg8pFgeTN9VypOp5y986vzL315hHiWdFn7UBNMA7CQ==
X-Received: by 2002:a37:a74e:: with SMTP id q75mr170943qke.165.1616422105378; 
 Mon, 22 Mar 2021 07:08:25 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id z8sm9014413qtn.12.2021.03.22.07.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:08:25 -0700 (PDT)
Subject: Re: [PATCH] amdgpu: avoid incorrect %hu format string
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210322115458.3961825-1-arnd@kernel.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <eefe9a55-4212-4d51-6add-9eb9ead0b5ed@redhat.com>
Date: Mon, 22 Mar 2021 07:08:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322115458.3961825-1-arnd@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Sonny Jiang <sonny.jiang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, xinhui pan <xinhui.pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, Chen Li <chenli@uniontech.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/22/21 4:54 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang points out that the %hu format string does not match the type
> of the variables here:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:263:7: warning: format specifies type 'unsigned short' but the argument has type 'unsigned int' [-Wformat]
>                                   version_major, version_minor);
>                                   ^~~~~~~~~~~~~
> include/drm/drm_print.h:498:19: note: expanded from macro 'DRM_ERROR'
>         __drm_err(fmt, ##__VA_ARGS__)
>                   ~~~    ^~~~~~~~~~~
>
> Change it to a regular %u, the same way a previous patch did for
> another instance of the same warning.

It would be good to explicitly call out the change.

ex/ do you mean mine ?

0b437e64e0af ("drm/amdgpu: remove h from printk format specifier")

This was for a different reason.

imo, you do not need to include what another patch did.

so you could also just remove this bit from the commit log.


The change itself looks good.

Reviewed-by: Tom Rix <trix@redhat.com>

>
> Fixes: 0b437e64e0af ("drm/amdgpu: remove h from printk format specifier")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index e2ed4689118a..c6dbc0801604 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -259,7 +259,7 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
>  		if ((adev->asic_type == CHIP_POLARIS10 ||
>  		     adev->asic_type == CHIP_POLARIS11) &&
>  		    (adev->uvd.fw_version < FW_1_66_16))
> -			DRM_ERROR("POLARIS10/11 UVD firmware version %hu.%hu is too old.\n",
> +			DRM_ERROR("POLARIS10/11 UVD firmware version %u.%u is too old.\n",
>  				  version_major, version_minor);
>  	} else {
>  		unsigned int enc_major, enc_minor, dec_minor;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
