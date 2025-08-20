Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE43B2E86F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 01:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB5810E0A1;
	Wed, 20 Aug 2025 23:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JUHZlj7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5528610E2A6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:05:54 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-246013de800so24025ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 16:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755731154; x=1756335954;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EvRXBj16l2lFtX1Fgv2CXPi4lSLryaOac8dNXUMfY34=;
 b=JUHZlj7p/pUUu9SipKmSJVWrmvvRUCF2k4IH4c5jattWraqvaOc0m0Fh503UQuHkJe
 E8rAuS8Z7vXL1yfsq0Sqfcliy17od4AM9Xl3GbvYaKN7+/KvO16UJioOFStusgWT+In0
 r6dJf6M4gr4MfX6kXDBQg7TYvNV33IcTViLuAkCqpws6nm8tpz2LYcDC1uqgltpr+HQC
 sXzpaVklYe0likioApv/qG0GpwlGuprL+ad/gEltSNht68slrxNoxUgSEoP65cnDSmJn
 YHDr1zNIxFn7uwvjCke8BVm4PIAGQlQTKEo0u1YvGg10hkQSHYdXzRx02MTCeId0saWP
 FNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755731154; x=1756335954;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EvRXBj16l2lFtX1Fgv2CXPi4lSLryaOac8dNXUMfY34=;
 b=vV8bstdpTbLF1WgBd3z+Vhk2r8tWMJOWjbjp05gue1tIJC1/bKmju3CEFbcGDMsw6U
 KbVchIfydta5BidnY9WiPhwN4qJiAFYO951XjiYos0yXLorIy2LvOROVCoc9SKX2xomH
 It6gCiEMYgGgnJpJY4V+Lhhe16J9ftwRHu2mrGN5JzKavGJj2XNw9VZKftpEZoAt0sAK
 15WtlMaF8H1kSA2uS78FSxGyMzluOYPCeFIch/gq8v82tEoP1DeA4Vxi8LZ4gKVkPfTr
 8WWtxBcMQIOs2U6Iko+jqF46W6V7MjkdSFJUGj7qYBJHmY+PBflYTCuz8zsqcadCgY0H
 /L6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYa+badJ6pqCXAZkZfQyaiFk7LXSNSK4RCh3TnMRqVFTQkfkLJ9rDx8uFM3boDkLaFz6iWzaztelk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlhF3MQWaHCCFqcouHjHRwvg5oE7vCo5KNA7Ntc8G/Zf/3KcPn
 AThSuMPxzs0pfa0JTyfTW575R4w3Dfndvrt94CZpXKhFqgZFN4gSsdazEAduWV+fhw==
X-Gm-Gg: ASbGncuCHFk7uZxFwisWa+naca2aso5rHtfg6HXQ6KXO4FLAELnehX6Dk7Vq/kvLj4g
 JpmK7myKe9zMFW0FQcJNGDZSBA+DXU5afZyyo3iKhjsmIQgnp6AXZh+fQtzI1+1Zuc9PuJu+zhm
 E1iAJT/Us7xFyr5YILmAH7oSyIyDiGbYXxVtOZcpVaaF+CnpA6MmLQBtoJf/cqA96OmL/1Ls061
 CZk+elbgUz52yWZH6qKuAcJsoCVshfS2kDp+PA7PiVNuz0NE0qiE79lMAhzdqteFpLXI5tf2l+l
 IamvnnfEV2lXBHt08WB3wDnT/h/vSSpItFK+0CQNc4KtfXQE0Q+ycP/BKAitDEVwVDCk7wSq/hV
 NJxSKnKs3SUvPQOcO4xUwl1MtOYm0oyHweA+JC5qh3YCr2+dPBZRaBoOWhWnvmmN1b4PNLjw6OC
 EvV4bDicM=
X-Google-Smtp-Source: AGHT+IFvkzWLi+5u8K5l7RVeBnffe0urg17dz2IANRHLwSGsPtlIsg6h/lQqrYlNKOX+8CuI2OtkaQ==
X-Received: by 2002:a17:903:1a08:b0:240:2939:361c with SMTP id
 d9443c01a7336-245ff98e26fmr752685ad.4.1755731153531; 
 Wed, 20 Aug 2025 16:05:53 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4cc26dsm36830535ad.75.2025.08.20.16.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 16:05:52 -0700 (PDT)
Date: Wed, 20 Aug 2025 23:05:47 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Atwood <matthew.s.atwood@intel.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org,
 "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: replace basename() with portable strrchr()
Message-ID: <aKZUy_XZxHKLQUAS@google.com>
References: <20250820201612.2549797-1-cmllamas@google.com>
 <peqczm4644mskitmvsq5b2t4r4rs3beei7li3p7uw2nhjne6h6@a3mztccaxfey>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <peqczm4644mskitmvsq5b2t4r4rs3beei7li3p7uw2nhjne6h6@a3mztccaxfey>
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

On Wed, Aug 20, 2025 at 04:15:47PM -0500, Lucas De Marchi wrote:
> On Wed, Aug 20, 2025 at 08:16:11PM +0000, Carlos Llamas wrote:
> > Commit b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
> > introduced a call to basename(). The GNU version of this function is not
> > portable and fails to build with alternative libc implementations like
> > musl or bionic. This causes the following build error:
> > 
> >  drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to ‘const char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
> >    130 |         fn = basename(fn);
> >        |            ^
> > 
> > While a POSIX version of basename() could be used, it would require a
> > separate header plus the behavior differs from GNU version in that it
> > might modify its argument. Not great.
> > 
> > Instead replace basename() with a strrchr() based implementation which
> > provides the same functionality and avoid portability issues.
> > 
> > Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
> > Signed-off-by: Carlos Llamas <cmllamas@google.com>
> > ---
> > drivers/gpu/drm/xe/xe_gen_wa_oob.c | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > index 6581cb0f0e59..0a94a045bcea 100644
> > --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > @@ -125,9 +125,11 @@ static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
> > 
> > static int fn_to_prefix(const char *fn, char *prefix, size_t size)
> > {
> > +	const char *base;
> > 	size_t len;
> > 
> > -	fn = basename(fn);
> > +	base = strrchr(fn, '/');
> > +	fn = base ? base + 1 : fn;
> 
> I think just a xbasename() helper like we've added in kmod would be
> preferred:
> https://github.com/kmod-project/kmod/commit/11eb9bc67c319900ab00523997323a97d2d08ad2
> 
> Alternativelly add it somewhere that can be shared across the userspace
> tools in the kernel tree to fix the mess that we have here:
> 
> 	git grep basename -- tools/**.c
> 

This sounds like a nice idea. However, there is no "centralized" shared
includes/ across the userspace tools that I'm aware of?

> Some dup the arg simply to be able to use the libgen.h version, some use
> one or the other on purpose, etc etc.
> 

Yeah, and I can force the POSIX version if you prefer. I just personally
think the strrchr() alternative ends up being simpler.

--
Carlos Llamas
