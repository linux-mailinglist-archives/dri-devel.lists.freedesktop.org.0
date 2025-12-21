Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93EDCD4526
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 20:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099FE10E046;
	Sun, 21 Dec 2025 19:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.b="FIhQbnix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAF710E0D4
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 19:53:05 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a099233e8dso28953375ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 11:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wbinvd.org; s=wbinvd; t=1766346785; x=1766951585; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jEjmW7sBy/OhukW+TepC17drhf54qbJ+YmqntK5sJBo=;
 b=FIhQbnixyfzDFgVhl/qOXG4fWndLgwgHQ3k2LwTKmlTlNBMxeXnegDK8SLPRyiyTGc
 EEXdaFRo2JY+RuSJeOqGVAl/OSS9q2E2LsrbY4Q7xPDsX4wa4Qg4SUGhOiTugTUEwBXE
 0UmvYYYaulzAXNhUtbyGn0srP7yBlym433oVusjp+H7BPOoZQP4DWUJOVZDVbz+oW0LR
 B8U9sWM38cJUlWFGenUidADYHuJp2AY9ePfPdZuX73jZalTkbOOtLW7HjsmQCeGmhifU
 adQ2Hqj3TBwXdYT8Kh1Hyocw7abbn268GUkKT08BBrYfWfpt2xlWGYGLxH6IRBsnU9ve
 Ldkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766346785; x=1766951585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEjmW7sBy/OhukW+TepC17drhf54qbJ+YmqntK5sJBo=;
 b=Z6BwhkFDIsI/4BoyruvDotWQCkqm62INnpKcirb+W9mat7/2GA4e0pgspWxu3GQFb+
 9fcy8hV9xLiKaCS4NHxe4n6DZwYYS+f4drwCs25ozf0cbRVX8i3Ouz9dKdUknQ5pti6H
 cKptEQAQuEsd2kWfI7ugqdRkoTsZ6d4XAHWaD3ggOI/v5b047qjwULJ7OZGUAwSt2y40
 eF4dLFV9Wsl+GJOJcmgZ8eT+0XA7TqoxVRsXPQPuPb62hDEVl6bukC6BaYdA7ZFF+qwr
 zOpWFEqf7HbbvuBCDoqn6QcmEuNEsDB7DvJwAFfw7eKSpAV4Q3L8U+6KxG7jhipz6RHi
 UKgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAFNJVCtmK5lHqXm8/w5B4oNQ975bSmd2A/G2xD5guU2tYkWHYx6QAllArUq8AhOFRWxCtgePGHXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNaYJwQ1BaZKjN/o6a7pJm8iVgEbGjlP2eh0DY+PD11I9p/46I
 1ZB5ourv3YKGt92woMk2q8zLN2nmahzRXXNepEbZoqPWeblEZIWBVsvKezQ0rocANRs=
X-Gm-Gg: AY/fxX4ver1dw5V/VIm2wx4EU/TJquVZ0Rd8wMUeHbE/Iw2DV4UL3ys9JvSLZ5vXuMS
 452WpxLX7xjMymU4TUeearlvtglHRMixveStAloT9BxQlA+94GkL8HC1WsZ4cwCh8sXkvui8bSi
 BDyfh4GetUcS0kIeJ/0MGs8L9Ep6PTKVe8/eWHmxPnJpKw3WV3exu/UQj7SgIv/OJKuqVN5CkC6
 WlkU5ypSiwXjmmyPeOPOSFZKpUwbPAsmtXjuujj3tdUmhmLPBwqArg3d9p8OGpGiMHNvdQkxJY6
 6vtO4Izsmst1I2LSix0H/bzzW03KGTpFG02VdUwCrLCYCcQ6+AHFeAXaa0yjeEFtFz+f9AFQkWk
 9WXkV1yE2TPhenQnTAHc6Gvo81ol51749eVNFFdTA/4fJM8VVkLsqcKL2w/ih9xlQ0KVSLJesfO
 llR4GkRO09qw2JjBctljluEZBM6p4xk1uPAkQILojzsM9bcIp7IKkTWKJ5Dl7X
X-Google-Smtp-Source: AGHT+IG3LOjpIDH/sz7EDarLNDTzoIzs5U677C/74YpF2B/xSOI5PQdoQPisXzHRvY3GmbzjU8Wf5g==
X-Received: by 2002:a05:701b:230a:b0:11b:9386:8254 with SMTP id
 a92af1059eb24-121722ec414mr10109138c88.41.1766346785115; 
 Sun, 21 Dec 2025 11:53:05 -0800 (PST)
Received: from mozart.vkv.me (syn-076-081-111-208.biz.spectrum.com.
 [76.81.111.208]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217253bfe2sm26739123c88.10.2025.12.21.11.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Dec 2025 11:53:04 -0800 (PST)
Date: Sun, 21 Dec 2025 11:53:01 -0800
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 thomas.hellstrom@linux.intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Don't use absolute path in generated header
 comment
Message-ID: <aUhQHcgL4U-HgSv6@mozart.vkv.me>
References: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
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

On Friday 10/31 at 07:48 -0700, Calvin Owens wrote:
> Building the XE driver through Yocto throws this QA warning:
> 
>     WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_device_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]
>     WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]
> 
> ...because the comment at the top of the generated header contains the
> absolute path to the rules file at build time:
> 
>     * This file was generated from rules: /home/calvinow/git/meta-house/build/tmp-house/work-shared/nuc14rvhu7/kernel-source/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> 
> Fix this minor annoyance by putting the basename of the rules file in
> the generated comment instead of the absolute path, so the generated
> header contents no longer depend on the location of the kernel source.

Hi all,

This is about as trivial as it gets: it's been a couple months, can I
get some eyes on this please?

This is the only place in the entire kernel source where the content of
a generated header depends on the absolute path to the kernel tree. It
makes kernel source packages non-reproducible.

Thanks
Calvin

> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>  drivers/gpu/drm/xe/xe_gen_wa_oob.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> index 247e41c1c48d..e7a50b1348b7 100644
> --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> @@ -195,7 +195,8 @@ int main(int argc, const char *argv[])
>  		}
>  	}
>  
> -	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, prefix, prefix);
> +	fprintf(args[ARGS_CHEADER].f, HEADER, xbasename(args[ARGS_INPUT].fn),
> +		prefix, prefix);
>  
>  	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
>  		    args[ARGS_CHEADER].f, prefix);
> -- 
> 2.47.3
> 
