Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0874EC95363
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 19:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47A110E27B;
	Sun, 30 Nov 2025 18:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U6isQ2fh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADED10E27B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 18:27:46 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-64308342458so2894094d50.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 10:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764527266; x=1765132066; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gQ0UOimIv+Gqhv0/1FQc2e2rNrHodQEz9DgOtiLMoSM=;
 b=U6isQ2fhf2qu7YIhnwn+4JfFPEdYILm5b7bv4EeyrhT/FwokHy3ckIQwBzcRlMZUJY
 P7ROCyG9ix9Xbm+7PW0eGsTs/lcEQiNn7gnBeyD2w007x+5WWobeB1r2GZGi2OqU/opV
 zDvGQqCKsZ0cQhGqhO7/SGmN8xF1B/8hqLNPAB8Nn3eZvOSYtcqVu+P3TQZaMtjFDgOF
 ye8JbFq9QpTN7j86TvsOE78HJ7WRAZqyqzhV51EzQ4t2h3PMDq8XCZ8SaH58jHBA8sf9
 6GEayT+b87pp2/IvOv5FbAi9uu8vlkH0IDO4twb3LX0wSXYP0W+GttFhy1kFVkJ62Nks
 pAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764527266; x=1765132066;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gQ0UOimIv+Gqhv0/1FQc2e2rNrHodQEz9DgOtiLMoSM=;
 b=BXxFgmSryZw499y9StnT6LgtrWCVrcAA+vuRHZqUVSLG8UASFmVLZlDN/dV0Hm5dsR
 q4GIfhNqkoTk27GP+9SumLJGbHTtS8WWbW+vLpwXfhH4Ar4iexcf9uKZsVRi6s5cTUCW
 VPP0ilkGZaRlPqvE5CPlEXN1cUYleaGLRpEEtryqVITHdI8yA1cbEoMiAED34VxQa115
 c39hxSK5ZFm1RfyHIvbfBFKfBae0yNXFVReLw87suU5teGQa0J5Pd8Kc1Ozjd5T3z1Wi
 knV7f9aM1IdRYnp+OjsYyckpA08W//kpvipEJsYjNIH3QT0E1v+D+WuBsczF0RrR42NJ
 fCvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmKfLMmtDVf96U1Qon0Hi5WbRR9JLU+I1AqvhvHZkQB59sv9g1+Znw4KcPc03aaYd9I/TTp917j+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0Up2idJGPSeojT5m+6hY+DtJOFqdr5Y+jUK3jwZJSPVX3LcQk
 YxWyJnkBaoUolEQtVUdeHu49ltufNbVnLqUFDGPDSnzpWfWvx24T6Tbo
X-Gm-Gg: ASbGncu7fTQ8txt415si6U/vwFaxIHu5QsVDWJVXaL7GXQjMowyW/+p2IPsfjVjc4xm
 1LHFzJ6Jaf3utshapWhgezi7aoy9cP084y2/3BT0p1Jh+TChBBHI61Mfxe1+TcSz1SpxKwWB+/7
 h733Z3dPvJAzJNwcWTYZOZj8Ac0vP3NKYCplpL+EANw752/uftczZjbGk3oHi/Pzhegg3sFYGPp
 wkGk2Mi/5oBGnzgYsI8FPRXDtVSt7AUuNVjpChC3387s5/OR/VTYDKHXswJy77g2cF5JRBDOBji
 8S24/ubWijKtY4P03ofaCzC3R/ZUZfOTknVzsxyob8AJlkcxmtZ44E9EErX8PSdhqaXeSvnj+ts
 6upYZCN9ZNgAr1JohCneKWQzxtZlcL7F9SN9fRfraAqTaSlOAIfIUbd76EsMguLPcfpZ83X3JR6
 l4D1wdvd8=
X-Google-Smtp-Source: AGHT+IFDyYOeUhT8Bbb9GCbxFDItrQuSs7u5k0phj03PaXnRWntIOvKeCN52kZaBXAUM/+2zDMUHvw==
X-Received: by 2002:a53:b2f5:0:b0:63e:1ca0:be73 with SMTP id
 956f58d0204a3-64302ac3594mr20527544d50.37.1764527265793; 
 Sun, 30 Nov 2025 10:27:45 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:b42b:4ad9:10af:cabc])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78ad1011c00sm39418837b3.33.2025.11.30.10.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 10:27:45 -0800 (PST)
Date: Sun, 30 Nov 2025 13:27:45 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
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
Subject: Re: [PATCH 2/3] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
Message-ID: <aSyMobJnY4qKmsdk@yury>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-3-yury.norov@gmail.com>
 <aStWkK6exUj9YEC1@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aStWkK6exUj9YEC1@smile.fi.intel.com>
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

On Sat, Nov 29, 2025 at 10:24:48PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 29, 2025 at 02:53:01PM -0500, Yury Norov (NVIDIA) wrote:
> > The macro is related to sysfs, but is defined in kernel.h. Move it to
> > the proper header, and unload the generic kernel.h.
> 
> Tough guy :-)
> I hope it builds well in your case.
> 
> FWIW,
> https://lore.kernel.org/lkml/20220603172101.49950-1-andriy.shevchenko@linux.intel.com/
> https://lore.kernel.org/lkml/20240212115500.2078463-1-max.kellermann@ionos.com/
> https://lore.kernel.org/lkml/20240215093646.3265823-1-max.kellermann@ionos.com/

Oh, OK. Surely I didn't want to undercut your or Max's work. Do you
know why it wasn't merged in 2022 and 2024?
 
> Assuming it builds in allmodconfig, allyesconfig on x86_32/64 and arm/64
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

It seemingly builds well. Thanks for review.
