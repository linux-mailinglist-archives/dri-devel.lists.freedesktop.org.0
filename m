Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2158BA3E6
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 01:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C832B112739;
	Thu,  2 May 2024 23:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cMCXYtdt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D235112739
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 23:21:15 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6ed3cafd766so7722188b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 16:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714692074; x=1715296874;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yb4bKEByKdlz4UZjReMUHUSYQEXXrh5q/y+c7lUVAhc=;
 b=cMCXYtdt6Y5Fd0KMVe1LYV5ff0lwqS1YVxQAVzx4ele4HY+W0EqZbr94+V3P3IgyVF
 9Xl+oBOE2Lhw0fVkgstUhhVwnwJlpv/UHFA1Ai1TGbmgHIscLkQvqASBNWTmrJGRAI5K
 kS2Cy8Eq0OX9h9KfmMJuRloJhx6i3SqPGeDVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714692074; x=1715296874;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yb4bKEByKdlz4UZjReMUHUSYQEXXrh5q/y+c7lUVAhc=;
 b=eVmgYZm8uRbN3772dcebgFcMtnKrHezbwIF8paz4barNMail/zaWMXMm7SrX8TPfTn
 vxTXlo+fkfxXP3cmR9ziJ0mZ8uHTf73DTt3YM+4AstsVh0z2qM0QtYBNu5oqdsSOB6Vm
 FTJnLsSL0jPiny6W9WuNwpkPnu44qBtupnQltOpZIvLdiceVW6xWQjBHTM6bRDYguiWZ
 Cc5ZZUkd2rw7l4pEnO0bI5GjFmp9RoUrp/iKHbBPX0S/N/MMg+KO2jQ2xQT8X2XrULBY
 jcbiELtkDtEpVFSAeSWarvdV9R3kE2Ovqw4HwDIuaOUCk/11mkZTU+baigzTWx7KlgP5
 xMeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPs6+IdO5ZpJxl1fpVoPYO43QW6Dp09j/n/rhSYGFNb/T1oRknB4MvtIDoX9vwtaPvyTw6ZBbEA78I3rZmvEFaT6bhjvtNBFOIP8xWG1Oj
X-Gm-Message-State: AOJu0YzQGoBGagZlarTRZTkIM6c3SQr+UHv2bWsCbGZgcrfmo4xBq7KH
 LEq0gqIBN6Smmk2+UcbBRx7D0PRXQ8NSwUZXvtvuUnTIEMgWBhNfX+bsJrLtWQ==
X-Google-Smtp-Source: AGHT+IErA5BfNjNMgVipEBvX/O4/Zlw4xwfnpXOv3ZrPWth9wG6pzC2gQkNN14O91XqQe1Da/qOaqw==
X-Received: by 2002:a05:6a20:7f96:b0:1a9:b2ee:5f72 with SMTP id
 d22-20020a056a207f9600b001a9b2ee5f72mr1455527pzj.36.1714692074451; 
 Thu, 02 May 2024 16:21:14 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 ls30-20020a056a00741e00b006f4123491d2sm1821750pfb.108.2024.05.02.16.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 16:21:13 -0700 (PDT)
Date: Thu, 2 May 2024 16:21:13 -0700
From: Kees Cook <keescook@chromium.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] fs: Convert struct file::f_count to refcount_long_t
Message-ID: <202405021620.C8115568@keescook>
References: <20240502222252.work.690-kees@kernel.org>
 <20240502223341.1835070-5-keescook@chromium.org>
 <20240502224250.GM2118490@ZenIV> <202405021548.040579B1C@keescook>
 <20240502231228.GN2118490@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502231228.GN2118490@ZenIV>
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

On Fri, May 03, 2024 at 12:12:28AM +0100, Al Viro wrote:
> On Thu, May 02, 2024 at 03:52:21PM -0700, Kees Cook wrote:
> 
> > As for semantics, what do you mean? Detecting dec-below-zero means we
> > catch underflow, and detected inc-from-zero means we catch resurrection
> > attempts. In both cases we avoid double-free, but we have already lost
> > to a potential dangling reference to a freed struct file. But just
> > letting f_count go bad seems dangerous.
> 
> Detected inc-from-zero can also mean an RCU lookup detecting a descriptor
> in the middle of getting closed.  And it's more subtle than that, actually,
> thanks to SLAB_TYPESAFE_BY_RCU for struct file.

But isn't that already handled by __get_file_rcu()? i.e. shouldn't it be
impossible for a simple get_file() to ever see a 0 f_count under normal
conditions?

-- 
Kees Cook
