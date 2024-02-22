Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093CD860029
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FC310E9DA;
	Thu, 22 Feb 2024 17:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NOGt+MNe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48CC10E9D9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:57:20 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-512e39226efso98442e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1708624638; x=1709229438;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2n36AeyXiuh8a+bUOx1L+r2cwQosoX8vn/3R6qLfBBs=;
 b=NOGt+MNeEculupiN89ii1tDDn+8UxHqWbWs5X4jfW1AdOlXpd2hXFEfkbDWDhaOpQK
 PGm0p1n9Dwf2Kj116jLLPQlO05zfAoV4ctfuLjrY8NLHnd2ImGC8BIo9UGKPgiNRLzyw
 0yCE2RQP5bCp74YsUMRR5ViFKsqy1ej1vLZwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708624638; x=1709229438;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2n36AeyXiuh8a+bUOx1L+r2cwQosoX8vn/3R6qLfBBs=;
 b=NQ48Ssko1TIqSCey9XdcI0Nm0UCAZ4SxCzXrBTUC2wxEcav+K6yOfTkuQC1ot2V7Q0
 Le9bxiGsgBLQN6zCpmLTPozA2wW6mAZxeI25pWKNp75PbXYNMidBxaA5rEy7QYSFlt22
 S+y7IvR84oQF34HnUEReZIsdmItOU9FHYOKKwFw3wcWpvjnjrZ95VCr2e2x5j39CGnDs
 Llpw457ehU54an76Z00cFH8LTHAMy46AUrLqK4B3fpMKaRCyT6tZIXc1tIIjhLjIRSyr
 CUUOkWOq9oBHrUx2Jcd861gIuWenaRP+N3PX3xxXy2rzs6rvK6dJ/bCOQwnS06dc+/o6
 FwgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMDmqXvsIkrSxDOw98MrAtW1O2l339JbysBRcqVTSurV98sz741PLevMMNuQQb29IgfnkOOLKbo+8+jBJqldLk7COaL7lUgdsMNWkaTpDX
X-Gm-Message-State: AOJu0YxE9CqeUCG3yCw95nbey5wdl//nghTjOTRYiDZujTQNmc4F5GVb
 HZj93PXJ7rRjFegBympANirjB5H+LUnJyg2VNp7bRHz1Ns70rcm+2Gm03YgLcq+QlzoRBWcaNDp
 DFffPgQ==
X-Google-Smtp-Source: AGHT+IHxBa7MQrk6PYrCrBL3I+I4zK/AX7XzxPCU+RYYxbhFB3eLPKQnLxU1Lg/w66ZhznznNKIHXw==
X-Received: by 2002:a05:6512:3f29:b0:512:ca34:664a with SMTP id
 y41-20020a0565123f2900b00512ca34664amr6511748lfa.32.1708624638682; 
 Thu, 22 Feb 2024 09:57:18 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 o7-20020ac24347000000b00512dededc0asm263067lfl.228.2024.02.22.09.57.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 09:57:18 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-512e39226efso98407e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:57:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW9qxySk9n7A7u/qvXfGbvYZxCiRDD2qbp9lnzA8A1o99o74/UtrteODaXxRKzcR5umeE2pQqWcesK4y0i8SsjqwI28pgcPdS8E1Dv2QgHj
X-Received: by 2002:a05:6512:3089:b0:512:acf1:6970 with SMTP id
 z9-20020a056512308900b00512acf16970mr11555378lfd.35.1708624617484; Thu, 22
 Feb 2024 09:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-3-davidgow@google.com>
 <20240221201008.ez5tu7xvkedtln3o@google.com>
 <CABVgOSn+VxTb5TOmZd82HN04j_ZG9J2G-AoJmdxWG8QDh9xGxg@mail.gmail.com>
 <CAGS_qxoW0v0eM646zLu=SWL1O5UUp5k08SZsQO51gCDx_LnhcQ@mail.gmail.com>
In-Reply-To: <CAGS_qxoW0v0eM646zLu=SWL1O5UUp5k08SZsQO51gCDx_LnhcQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 22 Feb 2024 09:56:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiODww51Kz-TTWn0ka5T8oMtt0AfbO9t0U3iJqfLZO+8w@mail.gmail.com>
Message-ID: <CAHk-=wiODww51Kz-TTWn0ka5T8oMtt0AfbO9t0U3iJqfLZO+8w@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/cmdline: Fix an invalid format specifier in an
 assertion msg
To: Daniel Latypov <dlatypov@google.com>
Cc: David Gow <davidgow@google.com>, Justin Stitt <justinstitt@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Rae Moar <rmoar@google.com>, Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 22 Feb 2024 at 09:36, Daniel Latypov <dlatypov@google.com> wrote:
>
> Copying the line for context, it's about `p-r` where
>   p = memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
> `p-r` should never be negative unless something has gone horribly
> horribly wrong.

Sure it would - if 'p' is NULL.

Of course, then a negative value wouldn't be helpful either, and in
this case that's what the EXPECT_PTR_EQ checking is testing in the
first place, so it's a non-issue.

IOW, in practice clearly the sign should simply not matter here.

I do think that the default case for pointer differences should be
that they are signed, because they *can* be.

Just because of that "default case", unless there's some actual reason
to use '%tu', I think '%td' should be seen as the normal case to use.

That said, just as a quick aside: be careful with pointer differences
in the kernel.

For this particular case, when we're talking about just 'char *', it's
not a big deal, but we've had code where people didn't think about
what it means to do a pointer difference in C, and how it can be often
unnecessarily expensive due to the implied "divide by the size of the
pointed object".

Sometimes it's actually worth writing the code in ways that avoids
pointer differences entirely (which might involve passing around
indexes instead of pointers).

                 Linus
