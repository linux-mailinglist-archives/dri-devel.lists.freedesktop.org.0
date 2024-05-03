Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C518BA4AA
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 02:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3B9112772;
	Fri,  3 May 2024 00:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PmsBayAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8FF112773
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 00:41:26 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1ecddf96313so14049125ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 17:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714696885; x=1715301685;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ag+GJVh/sQYDPGeOkIngGB4bIRPX939JLId/QM0OSvU=;
 b=PmsBayAsaojD3C1JEmj97ASYMkTPZbivCI26PNDwADfDXXrFCziiH5Z4CNrVo9q6I5
 q1QUf3VxUMvVv8d7yOQhDcdP0FqqpQKbH6xU6OSGAO5Mn6CN/MkGnNsu8AlY3U8ezhPj
 /9AZxpJwsHBLVUvyegZtpY4Kwt78j8xe30Gvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714696885; x=1715301685;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ag+GJVh/sQYDPGeOkIngGB4bIRPX939JLId/QM0OSvU=;
 b=djbzudNaAJdbgQWVjqQl0hgRF3YxdeUcYNN/Kpen8fSWSyCETKJ/Zcw0hUZ855bGPQ
 tX8cm98qyCnibjQXDqNVoQgfzAH6fr8eHAjeHeTZ4QZ6QDKWAEjBLseWJjCvWWL2yp6Z
 hLppUD7NGxrJW1COPtIscCoUt4DRyXLbvqt1CnHT+m+pTjjMBOfOfJtI/sbDx9fVGx2z
 rPJ5dvTSni094KZ2t7rtJauEBXMAr0QtVOWhDB2wAiOvyMv7Rgy1veIowZRQy44Zst5s
 JF7u0LoWMdY0JIiTpQLYI5qeimQFnXCIE7C5whcfiPvQ901Hqln5dbqJJOJVFukktZ6x
 ZrKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5tBGEZ1SrW9RD46u0djItw+a0tb5en8M99pqeqrhFVva7n1L8Up3wLOpvlZjIkOwc0jyFkHMbVHW6cqkglXThjFCfi+w3up28KhwTVBRs
X-Gm-Message-State: AOJu0YwFZpsUeMgxNKgIq/agwVu7EdAc8uKdts8A1LlzUErl7vQVcHf3
 FXSVtriu7QMW1EvUjrjcj/uHCFjcsnfrvmUHrhvi/hMDUSoo1betCTyEg1QWOA==
X-Google-Smtp-Source: AGHT+IGVw+PoNIInYTycTHxfqWIBoyYdGBoTX5SvKBDwlvlFcv6C6IZTK45dYCllqIK8OWMFfs/z6Q==
X-Received: by 2002:a17:902:f648:b0:1e4:19e3:56cb with SMTP id
 m8-20020a170902f64800b001e419e356cbmr1772102plg.12.1714696885501; 
 Thu, 02 May 2024 17:41:25 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902ce8200b001ecf865a019sm1958663plg.224.2024.05.02.17.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 17:41:25 -0700 (PDT)
Date: Thu, 2 May 2024 17:41:23 -0700
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
Message-ID: <202405021736.574A688@keescook>
References: <20240502222252.work.690-kees@kernel.org>
 <20240502223341.1835070-5-keescook@chromium.org>
 <20240502224250.GM2118490@ZenIV> <202405021548.040579B1C@keescook>
 <20240502231228.GN2118490@ZenIV> <202405021620.C8115568@keescook>
 <20240502234152.GP2118490@ZenIV> <202405021708.267B02842@keescook>
 <20240503001445.GR2118490@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503001445.GR2118490@ZenIV>
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

On Fri, May 03, 2024 at 01:14:45AM +0100, Al Viro wrote:
> On Thu, May 02, 2024 at 05:10:18PM -0700, Kees Cook wrote:
> 
> > But anyway, there needs to be a general "oops I hit 0"-aware form of
> > get_file(), and it seems like it should just be get_file() itself...
> 
> ... which brings back the question of what's the sane damage mitigation
> for that.  Adding arseloads of never-exercised failure exits is generally
> a bad idea - it's asking for bitrot and making the thing harder to review
> in future.

Linus seems to prefer best-effort error recovery to sprinkling BUG()s
around.  But if that's really the solution, then how about get_file()
switching to to use inc_not_zero and BUG on 0?

-- 
Kees Cook
