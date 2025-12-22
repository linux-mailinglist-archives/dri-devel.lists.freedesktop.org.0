Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20468CD7126
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 21:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BC910E05C;
	Mon, 22 Dec 2025 20:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.b="ApEwevB5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1063910E05C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 20:26:17 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a0eaf55d58so31785365ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 12:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wbinvd.org; s=wbinvd; t=1766435177; x=1767039977; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+DxzbqKFHsT4b/4uUhTmGkgX6zZO5THXjLNxNVuEr44=;
 b=ApEwevB5q41iquHu53coO9vs70NWdAAP6ZoW6VgML1InicmQjxVGm8VAKt/B/hfbQN
 SlVGAEymjGVLzMUtwS6eagYSsrAxz+QUyhN9y1A+u3zBWsVl1u8TEOcidc2eqkaQOaaP
 UzcCDVqRFxJ9lHc6cWTh4LhygG6EhmjHwPREdAiZqicW4hBnQEMemHBSruY1MicHYJWu
 qk1xEiIlBpV3QZ+qxrqbQ7K9YlYinpJktNVB065f5bh3Y4PCtQe711IL6BL//fkjhzCv
 ZD/JRxXO2B/hBL53m6vT8+oG+NXulatGbMi9oeuWz5jNoT5g61jG+SruQ++qEsAJZHFt
 DWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766435177; x=1767039977;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+DxzbqKFHsT4b/4uUhTmGkgX6zZO5THXjLNxNVuEr44=;
 b=v6d2aT8xOK814LxNlwFf+QLyhOJo7vpJXXhKe5N3c5KHHmWlc0noKAmL5NeE3mh3ZN
 tniGDT5TrPQPiq/CyLeSBaLnNWsNeqA2Th/pUlY8RqoKKWOVSACGOQq1io7XS1Pykbrx
 MkFwfjH458eBB4Dzz2+23YbRoGAjtKjGR60DPkKov62iZkhRNDvcnJUPogiugaYC6IYk
 Nm+e4YlwVqeIZQPiQbktCf/RsC02WmTd3cGMTh+zcW1hG6l4JQepdIOv/dmRmK/V/gwI
 p9alM0SB5bNiZU3lJBpje1WoI7iIuVxhlRK3Y1tqlVSejKqZ8aCHKtkNOI4A5L+BRIgW
 /fHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUstkI728eV0L0RE4nrtm6K9M24kXtKTKkTB2mkSZ9hJxYTVF8H8S6z5/JBObEU1jl/YJvc/6b9Fbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxDrVewf39eRfupEOtF62s3WpM1ER8Uq4qnXsBTBz90yws7nYf
 j3LpeRjoSEKYospzWT30zOqfddGyGcUDEj3R7BJDqCAjPBKENnKOpksNs4Ud+cOalnY=
X-Gm-Gg: AY/fxX5X7VTGpVvWZionj5YJom/tvv/+WDaRclNXg81Q+ogAVP58Xb2F2LGgxnMt1xB
 7DW2+vUPzI4+YF750JJvqwdFoKPftgFX0kqGVNRF7fUdjY/aarfA0c0Evkh+Kc3KuRWELzLMJ6Z
 DpyEd7ErK6XyX2GTf/o3oDGGE04xeExdJ6bDS9wVwBKl18RPHR+05XNFXoliEjO5ndO/7QIayTU
 kbfUH499boEUFd4ImIyGt5azAseyyMY7LUYMjysDtvdQpLad3PUgRRboqoYPmZ6YvupWq9K0owv
 ECqt19vptRBl8JQ5GTwzIz2k7eBWQfjZEy7SiHbxsmqretm2gs02PWi+Zira4qJcbQegw8uOfrd
 gqUql0cnIUtMUUzZYMIkXbKjy197nNeZnQ7r55CoAm6fL3KxOd5nvTu7u1bsfdTj5xGRG9of6no
 qw5Uez7RqkCiLVgw==
X-Google-Smtp-Source: AGHT+IEef3h4w4xy+0//cSAXBXPqJ6FpxI5XKGCOhkF8d53cw2jZ45moHevagz8DR3MnmSRpzd0mAw==
X-Received: by 2002:a17:902:d48e:b0:29e:fc06:b8a5 with SMTP id
 d9443c01a7336-2a2cab16368mr168301475ad.18.1766435177388; 
 Mon, 22 Dec 2025 12:26:17 -0800 (PST)
Received: from mozart.vkv.me ([2001:5a8:468b:d007:f7c3:5e3f:f742:635e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c666d5sm104099455ad.21.2025.12.22.12.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 12:26:17 -0800 (PST)
Date: Mon, 22 Dec 2025 12:26:15 -0800
From: Calvin Owens <calvin@wbinvd.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
Subject: Re: [PATCH] drm/xe: Don't use absolute path in generated header
 comment
Message-ID: <aUmpZzD_5RauueUo@mozart.vkv.me>
References: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
 <aUhQHcgL4U-HgSv6@mozart.vkv.me>
 <40b24664850c231b1a2fd80a084d4a7f32b8148e.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40b24664850c231b1a2fd80a084d4a7f32b8148e.camel@intel.com>
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

On Monday 12/22 at 16:56 +0000, Vivi, Rodrigo wrote:
> On Sun, 2025-12-21 at 11:53 -0800, Calvin Owens wrote:
> > On Friday 10/31 at 07:48 -0700, Calvin Owens wrote:
> > > Building the XE driver through Yocto throws this QA warning:
> > > 
> > >     WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue:
> > > File /usr/src/debug/linux-
> > > stable/6.17/drivers/gpu/drm/xe/generated/xe_device_wa_oob.h in
> > > package linux-stable-src contains reference to TMPDIR [buildpaths]
> > >     WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue:
> > > File /usr/src/debug/linux-
> > > stable/6.17/drivers/gpu/drm/xe/generated/xe_wa_oob.h in package
> > > linux-stable-src contains reference to TMPDIR [buildpaths]
> > > 
> > > ...because the comment at the top of the generated header contains
> > > the
> > > absolute path to the rules file at build time:
> > > 
> > >     * This file was generated from rules: /home/calvinow/git/meta-
> > > house/build/tmp-house/work-shared/nuc14rvhu7/kernel-
> > > source/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > > 
> > > Fix this minor annoyance by putting the basename of the rules file
> > > in
> > > the generated comment instead of the absolute path, so the
> > > generated
> > > header contents no longer depend on the location of the kernel
> > > source.
> > 
> > Hi all,
> > 
> > This is about as trivial as it gets: it's been a couple months, can I
> > get some eyes on this please?
> > 
> > This is the only place in the entire kernel source where the content
> > of
> > a generated header depends on the absolute path to the kernel tree.
> > It
> > makes kernel source packages non-reproducible.
> 
> Sorry about that and for the delay.
> 
> I just resent the patch for CI:
> https://lore.kernel.org/intel-xe/20251222165441.516102-2-rodrigo.vivi@intel.com/
> 
> We can push after passing it.

No apology necessary, thanks for kicking it for me :)

Calvin

> Thanks,
> Rodrigo.
> 
> > 
> > Thanks
> > Calvin
> > 
> > > Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gen_wa_oob.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > index 247e41c1c48d..e7a50b1348b7 100644
> > > --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > @@ -195,7 +195,8 @@ int main(int argc, const char *argv[])
> > >  		}
> > >  	}
> > >  
> > > -	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn,
> > > prefix, prefix);
> > > +	fprintf(args[ARGS_CHEADER].f, HEADER,
> > > xbasename(args[ARGS_INPUT].fn),
> > > +		prefix, prefix);
> > >  
> > >  	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
> > >  		    args[ARGS_CHEADER].f, prefix);
> > > -- 
> > > 2.47.3
> > > 
