Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39609A0A2F6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 11:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D168D10E572;
	Sat, 11 Jan 2025 10:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fA+6neuv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6686110E08C;
 Sat, 11 Jan 2025 05:26:05 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21644aca3a0so59268675ad.3; 
 Fri, 10 Jan 2025 21:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736573165; x=1737177965; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JS6WXMTbjU4YYrHebPwqUTLlx1cdj04e9iX6ASznndc=;
 b=fA+6neuvt5H6Ky2HzwT2/jlVeffb8KG7HrYenNudVXKtuXfd4q7xc/Tnq7k/9hxw9t
 d/ixZw3o7VE0IMHUisxo8xS6rn6B5xxO7rDrd0+l9WjFgxVECoHSdlCzqcxJKH4sQHOb
 tZkWoPCCHzCpabsXGDbsa+UYLUh5wRkAF0ni+UO48XI8f2CUcBwFLOuSOmVV8ZFtH/Oa
 T9bJcUrQexyzrBOABLyqKUGpMWv/MS5HVvDy10m8jUWg8fFWa7bPBE8etIazyBDI8Zkz
 IKFsTyoaLAs3x6vw6hDUGQD5mx+5MzRYiGLvOF/OomtBTYdJDhoDOXeu7CwD6JJnHVSG
 +MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736573165; x=1737177965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JS6WXMTbjU4YYrHebPwqUTLlx1cdj04e9iX6ASznndc=;
 b=NhAh/sqfloN+20/ivYh9Q3cWIJlJjtNA8R4EKbkgePJws5gt4mgdthYHxys+6uO5t6
 7bwlrQziJoLJGIS6bowni54W3c0DHxpwMnFEFhF1LgKg6JHKMVRHXzb7ek9FHWCgb9ei
 xzptd8BsSDzv8mbLceDgFaMBLHIlYE3CkIb8C0GLItiyRrGRObnvrVDLWy3lG9+jnP+Z
 d/ZVx67txEpZtRn/XwEZCM/vfrEQuV6HKwbT0Y6cB2dmqDg3JmigqFybRF4Y3YilNzIb
 6WDXrasJZTGu0oUY9LjKidpn2TSiBxTpEoZorPHoSlHpRv19FgGO36nY4iw76Fjtl07/
 bcJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUurvEsIIjfsNNfUy7dmlBwZiuWpp/A+q24wCNyCV6sG/z/A+Q595uIvbortqo/ykiujZXni42XsqJJ@lists.freedesktop.org,
 AJvYcCVIBrhuH6sHXMOIM11xxfesTaAbODAEK9IODu4ja/yRblAELjUe2Ps8MXz4nREyPt4LLoOcqsp2jCpmTfkUUQ==@lists.freedesktop.org,
 AJvYcCVoB3wqzaLf1wPqW8XIdxTY2/sTbJXQWMYr2KBHOLd+8Vm5tTCrz0Av0o1tc52pxuqKFoB6/NdlU30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3f9G2VElTHwOwStZ/e6Ecf387dUwvGUtxOEUoUULsUauO/TLX
 mV91D3kbnQvjrSTBQ9qKk3XaVzLfFhIUKze4CYK178NtIwjMEaGx
X-Gm-Gg: ASbGncu2K9/ujac/Ds6M9z8R5SL9mGyzpUQlvx6agaHnIVoejLJVf0bT7V6ZNdz2nof
 /4YQ+LXUdKqTxfdg7uUk7GMnQrs7ucZmlRljNU6zNuMD51ApnS5PWo1XJq1duIb4cnHo0Wtda1z
 O5tNLqiGfL5gEjvXwEmRzzbxC1gHatidAlhBOQF9M5zorDVPvOSf8ECT+5nKSZRsiMjrn9Gac35
 e0iF8UbsuleMW8W50uKNiBFytDQVEEysOLffW0BiHIV/I/oeZamQs9f1cYBLMXmEduzQqcY4R1g
 G+Ogfiyd/b9W7Yfh
X-Google-Smtp-Source: AGHT+IGzslLWI5aOMH3XvWKMyISik0CH3l4HD7ofF3L8Xed0puLxx3+C+PjbmUys8bNoAzTvPakygQ==
X-Received: by 2002:a17:903:2310:b0:212:4ac2:4919 with SMTP id
 d9443c01a7336-21a83f56e97mr189421425ad.17.1736573164818; 
 Fri, 10 Jan 2025 21:26:04 -0800 (PST)
Received: from localhost (softbank126159121187.bbtec.net. [126.159.121.187])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f12ff3fsm20779195ad.79.2025.01.10.21.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 21:26:04 -0800 (PST)
Date: Sat, 11 Jan 2025 14:26:01 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, zhiyuan.lv@intel.com,
 james.y.wu@intel.com, kevin.tian@intel.com
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 zhi.wang.linux@gmail.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: GVT-g status (was: Re: [PATCH 0/3] drm/i915/gvt: Deadcoding)
Message-ID: <Z4IA6XtXX-e0Du-6@dell-wzy>
References: <20241222002043.173080-1-linux@treblig.org>
 <Z2dcZfW8eNMnxT0v@gallifrey> <Z3uGjO36tfhQsnfp@dell-wzy>
 <Z4A7QDtTrU6w2Yhv@intel.com> <877c73j64o.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c73j64o.fsf@intel.com>
X-Mailman-Approved-At: Sat, 11 Jan 2025 10:51:03 +0000
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

On Fri, Jan 10, 2025 at 12:49:27PM +0200, Jani Nikula wrote:
> On Thu, 09 Jan 2025, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > On Mon, Jan 06, 2025 at 04:30:20PM +0900, Zhenyu Wang wrote:
> >> On Sun, Dec 22, 2024 at 12:25:09AM +0000, Dr. David Alan Gilbert wrote:
> >> > Note: zhenyuw@linux.intel.com's address bounces:
> >> > 
> >> 
> >> yeah, I've left Intel so can't use that box any more, looks Rodrigo hasn't
> >> queue up my address change patch yet. Rodrigo?
> >
> > pushed to drm-intel-next now, although I was assuming this to come
> > on a gvt pull request...
> >
> > what about this patch here? coming in a PR or should I take this
> > directly at drm-intel-next as well?
> 
> AFAICT the last gvt-next pull request was more than two years ago and
> gvt-fixes slightly less than one year ago.
> 
> There's a single cleanup commit in gvt-next applied two years ago for
> which there hasn't been a pull request.
> 
> The GVT github page [1] says, "This repository has been archived by the
> owner on Oct 3, 2024. It is now read-only." The intel-gvt-dev mailing
> list [2] appears to be mostly spam.
> 
> Seems to me something like this would be appropriate:
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1c3eab5d2b1a..161206fdaf05 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11557,11 +11557,10 @@ F:	drivers/gpio/gpio-tangier.h
>  INTEL GVT-g DRIVERS (Intel GPU Virtualization)
>  M:	Zhenyu Wang <zhenyuw.linux@gmail.com>
>  M:	Zhi Wang <zhi.wang.linux@gmail.com>
> -L:	intel-gvt-dev@lists.freedesktop.org
>  L:	intel-gfx@lists.freedesktop.org
> -S:	Supported
> +S:	Maintained
>  W:	https://github.com/intel/gvt-linux/wiki
> -T:	git https://github.com/intel/gvt-linux.git
> +T:	git https://gitlab.freedesktop.org/drm/i915/kernel.git
>  F:	drivers/gpu/drm/i915/gvt/
>

Looks fine with me.

Acked-by: Zhenyu Wang <zhenyuw.linux@gmail.com>

>  INTEL HID EVENT DRIVER
> 
> But I don't think it would be far from the truth to have "S: Odd Fixes"
> either. And the extreme would be to just remove the whole maintainers
> entry and have it fall back to the i915 entry.
> 
> Thoughts?
>

When I left Intel, I have raised similar question to manager or related
people to see their ideas on how to keep GVT-g maintenance work for upstream,
but I didn't get real answers before my last day at Intel...So still cc some
intel gvt related people to double confirm.

For me, it's fine to remove the maintainer entry maybe only keep as reviewer?

Thanks to raise up this issue, Jani! 
