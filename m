Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B84AB30864
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 23:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499D710EA2E;
	Thu, 21 Aug 2025 21:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uVRB6JRW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442FA10EA2E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 21:32:13 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-24611734e50so23935ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755811933; x=1756416733;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Dz7RDdIAdym4j5xhdixGaxPIwJbWp2rNz7mv9bLh3G0=;
 b=uVRB6JRW7TsLjrvZV5jZnkAnB1m8WZQ4WHt8CaSe0BbIQ1WNJSbEFKSCy8w25A8aX9
 IgvXqRK5Ff89wWVFpHiEg2Jlw99usX7jvgOJNHd8VjcHBvz1nKCJbR8se6kXpGE13cXM
 A9lA4B5i+GnFtnUM71uw9Nf0/PvzL+gNueCmHLII/5XUdMOrbqGiDKr6hapI30mwkInI
 7NuuNfhRx4NjOyLiG7I1zcp2xnWPU+VLtOOq/2vBK5SHOuhhzkqr+OEPTjftSWD8V52N
 Fl9Hix+IAYIatZXDAmajV0WIPC6YEGx5MhhIMlwASZCYd49Uw/IzneoggqfmPdxTYl/K
 Upuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755811933; x=1756416733;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dz7RDdIAdym4j5xhdixGaxPIwJbWp2rNz7mv9bLh3G0=;
 b=oNr0ZHfEgJArMbUaZ8nlnAprCSTsoSk1QBxW4vPIbt2Cf+X8S2s1hbkzlp2PZ0IUYS
 LaWIRp7AmHig0mZaagp4HG4RPCT4VKDj4FatuK5pw3Z5F6hjDk+VzEIwiFVirmJ7MhC2
 xgMrks+gw/D8CawtZSSiWMqvQjso0NnldbNTPq34zLdYZkOqkGBVA4rdFPflPwB6GT8U
 bYfB4GrCSINOApKQZ+jy83/tfiCJqHBqHvGOPHsSiPRhzYh0PWhe0+iAvbyqcE5sAB/g
 JU8U3B8i2GKI4lxXn3DPeWi6yFekBP8nF+Ymxd7xjjN1xBjd/OzccXr7KI3r+0SPN5l0
 o0Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBaPIBOYh20ONLL20UecWYKoTQjP8nxiKgip3Itgrd3jivu35lwXITn84BFzvDFWvLCsEdsDQ2hqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRQlckDZ/jh8HhJ+QN9HaAYIJi6+km1gRj2kBl8mq7Nl2vwlbV
 Z8FeLpP66uy/klpCAp5r4D4GSeGfMf6Z1awVH8CQ5v28t34LAqe3QDPFt6X5ngpB1g==
X-Gm-Gg: ASbGnct4Lt6q60C7siiQ/7PzS8H/TndcjUW/Z/cfe96/bMcCe6uyVheRjJa06IExIZb
 9f9xQp/LMMt8nEhsYCy3fukqFcdcj84ZBMsV1SCUK04AcsSr1qiiUEdHk1BX6de+LZa072o5l0A
 Fn/c9O9hfY/VO6Y0WpLKXLdF1NpUUxZHZ00XklB45tECcfr7Rl1a5fBXbT2sSWuSUqFZK2/RS8A
 eXNnNhbzD8wKJsUQQXpEunj38eX4P1+NHnJvWiSq7f8X/thn9L6bChnpJVlFVjfyzN7BeMOawQ1
 ChZ13bfMUaldDqQBoGZa8N+A7wzE7CiOUznaJLOkQo2g7Es7FXuXrqfetPVLcaM+U6w7Dc1tNYG
 2EIs/ZvgowIPPaaT1FEitCj+bMr2eq9EmQYWxidtLzDKPrT5QTfDyYAKXk0uC1w==
X-Google-Smtp-Source: AGHT+IEjUQbjSOhgPioiI9ZU+wJJPwSs4HepY0QfCBtA7GumDrWid1z4G3QnghW1ZWO3O5vL9kL0iQ==
X-Received: by 2002:a17:902:e749:b0:237:e45b:4f45 with SMTP id
 d9443c01a7336-24639f24399mr417285ad.1.1755811932524; 
 Thu, 21 Aug 2025 14:32:12 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090714sm5482103a12.32.2025.08.21.14.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 14:32:11 -0700 (PDT)
Date: Thu, 21 Aug 2025 21:32:07 +0000
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
Message-ID: <aKeQV4EeNgfIsX_k@google.com>
References: <20250820201612.2549797-1-cmllamas@google.com>
 <peqczm4644mskitmvsq5b2t4r4rs3beei7li3p7uw2nhjne6h6@a3mztccaxfey>
 <aKZUy_XZxHKLQUAS@google.com>
 <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
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

On Thu, Aug 21, 2025 at 04:00:33PM -0500, Lucas De Marchi wrote:
> 
> IMO the POSIX version is horrible. Let's add a xbasename() in this
> xe_gen_wa_oob.c and use it:
> 
> /*
>  * Avoid the libgen.h vs string.h differences or lack thereof, just use
>  * our own.
>  */
> static const char *xbasename(const char *s)
> {
> 	const char *p = strrchr(s, '/');
> 	return p ? p + 1 : s;
> }
> 
> static int fn_to_prefix(const char *fn, char *prefix, size_t size)
> {
> ...
> 	fn = xbasename(fn);
> ...
> }
> 

Sounds good. Would you mind if I use __basename()? I'll send the v2 in a
bit.
