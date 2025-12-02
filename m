Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E20C99EA2
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 03:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBFB10E4FC;
	Tue,  2 Dec 2025 02:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KdXDVIlM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C25510E511
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 02:50:34 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-63f996d4e1aso5157779d50.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 18:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764643833; x=1765248633; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u4fZQuQJ65AJK2A7tpNQAB3pVThD3W5ngX9pcfsdMkk=;
 b=KdXDVIlM11BQ5vk0wToKrJ3tQJI5yTUGyDS9Ddd9oH/L+J9Bc1PcGzjKOo2M0amFKs
 Ozru40gwO0OW4Py5XihSyrNpxUg07I3Dw1XsNyf4ah0IUD16n6bmvjSmukTaXXWgyOcF
 2xYhAfxPB7FrqgKIu7aI+ZfKvY45lOyKoxLa5YnHoRGiRphWsrlxNxeIIhpF3CGvbbKU
 p0f8uTMlRJkLPSTCGw4QCuq0TIySbLDCSB8IJxd2S6VepRjDvh9vrQ7D9ThY/l+JTzwZ
 FMo8OC+RJujF3Z98Tz+fNSIXZIQHAusRcCXhpQJpRTr16vxuT78uYyGj89f4LUvCRc8H
 syFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764643833; x=1765248633;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u4fZQuQJ65AJK2A7tpNQAB3pVThD3W5ngX9pcfsdMkk=;
 b=r0R2MwHITALsrp+expzS7tmtwsLJtnyQS89B3qEfUDyD0DhZSwS3n94S+EbDhYG263
 P89rGff7S/c3awzZAR8BnZLnqyb2SGf6XgRdKfMPmRI+Vm9hluZvxRnKKf013plbnYJz
 dqiwSnK5O6u3Nnx8nYEnB8Z3XNrvBMdCXf/SwFS82p4uImJg9Fgc3Lz7hjUIpjSCYdob
 KBwQqZ0ezncPxZoqkCJdPlQYWIy14qR0M2p2L/1Gxb4bnBlglCRBowL7MW1ZCIo2jXUQ
 Fc1SdPzmHfXSw/gf7DoUL3NdBAvaRNo/HxIfgpKffR0xdiMrc0p9BGoWtz+4sannc/kG
 e3NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcUq/S9p+5W3QAb6/KdUJ0oOYxfxTWteQENNBwg6SKEgPl5IZflq7s5g3rxENruRgQ0cRoYO9bBPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm3WUD8YoNsCZr3o3XfSUlvMmTVAirqGNfFSWnQ97yGVw4WCdJ
 c45scxZld5zFR1VC+ssFXL3Lnq+bH+Ew2Rhy2dGRgPnjooGbmkuVwLq9
X-Gm-Gg: ASbGncsY9FlD7BuUuZ/PySvNWiB+bgno1jcUJF6aj3Zy0bUwDsKgrkYnFxaIQls31Gm
 xj07ueR2C4fevgT7U6Claqmiw0vMwt/lICOz1++ALR5Xy6GEXffY1W5wq6FEM20gm/PvVN8uiGd
 MrcfWaiu563HugWl4nbEAqBTQJGgDyECG6PNxHjAIfN4Eb1DU1N3nNQCRZSuhk5/XWZckngnJVP
 aqQEGrKdpzaJiE/7qbu+KBCCDxEX3AxlNAMeVZZZuafpd/vrfmgsrNvAHw3VZaqgWP/HTDr2rXF
 ssRlF9ntUErAy/HIG+aZMNQGrpR7egkylV32aPTwL5+tGxFzlYXCLIqkUBMwEWVUfAChTfmQsEQ
 9l9s/y+eLf9DUMJzu3hpFbsavtI89e4NkbCsDmOwm3P5jJZCThKdtmlYdlb6t4VcoWDze6yi5JG
 VEWZmDZfQ=
X-Google-Smtp-Source: AGHT+IFvjnC2S/Jp93rH0uVWc/73vRFOoYQepG4E9Ug5xxnCcXms6vpoqWinBuFed3GkRDU5HYh1CQ==
X-Received: by 2002:a05:690c:2781:b0:787:e9bc:fa1f with SMTP id
 00721157ae682-78a8b54d8cemr340242637b3.46.1764643833002; 
 Mon, 01 Dec 2025 18:50:33 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:8738:665d:bba8:afd0])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78ad1043a08sm58083027b3.52.2025.12.01.18.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 18:50:32 -0800 (PST)
Date: Mon, 1 Dec 2025 21:50:31 -0500
From: Yury Norov <yury.norov@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kernel.h: drop STACK_MAGIC macro
Message-ID: <aS5T9-1z7PK32q9R@yury>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-2-yury.norov@gmail.com>
 <3e7ddbea-978f-44f7-abdd-7319908fd83c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e7ddbea-978f-44f7-abdd-7319908fd83c@kernel.org>
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

On Mon, Dec 01, 2025 at 10:38:01AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 29/11/2025 à 20:53, Yury Norov (NVIDIA) a écrit :
> > The macro is only used by i915. Move it to a local header and drop from
> > the kernel.h.
> 
> At the begining of the git history we have:
> 
> $ git grep STACK_MAGIC 1da177e4c3f41
> 1da177e4c3f41:arch/h8300/kernel/traps.c:        if (STACK_MAGIC !=
> *(unsigned long *)((unsigned long)current+PAGE_SIZE))
> 1da177e4c3f41:arch/m68k/mac/macints.c:          if (STACK_MAGIC !=
> *(unsigned long *)current->kernel_stack_page)
> 1da177e4c3f41:include/linux/kernel.h:#define STACK_MAGIC        0xdeadbeef
> 
> Would be good to know the history of its usage over time.
> 
> I see:
> - Removed from m68k by 3cd53b14e7c4 ("m68k/mac: Improve NMI handler")
> - Removed from h8300 by 1c4b5ecb7ea1 ("remove the h8300 architecture")
> - Started being used in i915 selftest by 250f8c8140ac ("drm/i915/gtt:
> Read-only pages for insert_entries on bdw+")

STACK_MAGIC was added in 1994 in 1.0.2.  It was indeed used in a couple
of places in core subsystems back then to detect stack corruption. But
since that people invented better ways to guard stacks.

You can check commit 4914d770dec4 in this project:

https://archive.org/details/git-history-of-linux
