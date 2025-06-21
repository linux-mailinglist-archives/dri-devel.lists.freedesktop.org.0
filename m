Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9450EAE27A9
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 08:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C6510E276;
	Sat, 21 Jun 2025 06:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="m7mFIe0T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F05310E276
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 06:58:26 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7c597760323so205134085a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 23:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750489105; x=1751093905;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bUNdx/2ldmooF+wfGIUFoptMG2S7gkeOO/JL2A6zVvE=;
 b=m7mFIe0TnSCSUWN875T7MGG613sG+CzAgLiQa62ubrd+De3Nlf8q0KQVhOGHNQ/H1W
 ucctCo8DkmMHvTWMeUJ6rlUZHVqxB6EdJQIJvcqKWElUCRqfzVcrjYLmd2jBlEUx7eOH
 ZECmxuI7041+RMuQn+5UWWQNePPzUAFnYW3WcRT17ce19qcVHJfCfjYBbW73MCMTVF4T
 9zG/GIq+W0+qZbQLlqLVibnRHAsnU4Xs2L0+n+PDxnYll3YftU4KhSWE7+eT71E7rSH/
 JvgeinLq9no5bhF5mjhqbyI2ak/TKIbXJOBqbP3FWX1j2tnbLVAytX4OY+lJyKUV7iFm
 6kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750489105; x=1751093905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bUNdx/2ldmooF+wfGIUFoptMG2S7gkeOO/JL2A6zVvE=;
 b=MysigI+6x+iWvG/07OEwPeiTfYz1TQBYInnpEY4Dx2hJuhmb207rXatKZmwIJC2WWd
 HrXRAvgt35+PO4nt10q2rpP6GsJgHBB0a9Tq12qcG4hz/pHVy6M9gT+mx8AimD34U3U8
 dL3/UOml7xPmmGpI+QVrM0WZ880y6t/5U89c9L0bnyEV2tjFWDzboL6zZDB60MOSVvQ3
 JGhJiQq+9HA7WAJkdQaImUnhkyJMqtnMjNcHV/Jgh3OH/x2SX46rJ1JjIEC/0wNBAbcq
 7ajJ4L9YAaxh4WW1f5XHyb+JXCwYSG1XnrCVclIhfzxbRewieoi452QqhG5NxwyzUa5/
 ap9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxcyePXPzsddMhrAJ9d29AxVzJ8KakDk9XmPmQ472Rrb1PNCYMtKSi4ljFQdxRKdZDmlM7d1aqfm4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDsJYZEBkij5SWZdpZBGPZ4WNQJUdwZlCyHIkQdoe2JlhzECoK
 E6C7qS/iZReazaIodnPC1Q9aYOspt8qtXIQt4TfYUp0Cr0QQ45rUjV6DGr1sBQP6xsjiPAOzVg8
 dl1rI7yWWYVScjNleLOhfdheAYsxNHZhTysE2hSGW
X-Gm-Gg: ASbGnctkkqUzmhMKhfwi2CwGTZ3gDHNCXGfEf04ylQ74TUhMMxuITo/qVNubBNllrim
 pmTiC1TbfMnbIJXOIdaDfH1U7JJFLgDxCrVmevRE5hTaJQzDNZFFSDTkAKiT7GSXpKhLsmWExXW
 xAFktKxK7khqdI0WAI/sv6GBmYwDWlXaG5bP0HFJ8sCQ==
X-Google-Smtp-Source: AGHT+IEHz/JR7YYi2lViA2o0Sn5CmXAFfiTDbM+tNqv2elv69zznKvkvAvdBvr86Y6n0SdUPLLuoC5Osau5RVKtSEw4=
X-Received: by 2002:a05:620a:3185:b0:7d0:97b1:bfa with SMTP id
 af79cd13be357-7d3f98c769amr837848985a.8.1750489104823; Fri, 20 Jun 2025
 23:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
 <20250619171339.1bf28dc7@kernel.org>
In-Reply-To: <20250619171339.1bf28dc7@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 20 Jun 2025 23:58:14 -0700
X-Gm-Features: AX0GCFsu87MFC7EBTBMwXAysv70gmAeinWhBQnHzTvKtmqPLtPM0HB23PPllhK0
Message-ID: <CANn89iLX9XTk96=mU7pSmNkyFfj0DpMe_mTfOc+TYArLkwYXLg@mail.gmail.com>
Subject: Re: [PATCH v15 0/9] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Krzysztof Karas <krzysztof.karas@intel.com>, 
 Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, 
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 19, 2025 at 5:13=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 18 Jun 2025 10:24:13 -0400 Jeff Layton wrote:
> > For those just joining in, this series adds a new top-level
> > "ref_tracker" debugfs directory, and has each ref_tracker_dir register =
a
> > file in there as part of its initialization. It also adds the ability t=
o
> > register a symlink with a more human-usable name that points to the
> > file, and does some general cleanup of how the ref_tracker object names
> > are handled.
>
> Thanks Jeff!
>
> I'm going to apply this based on v6.16-rc2 and merge to net-next.
> If anyone would like to also pull into their trees the hash will
> be 707bd05be75f. Happy to create a branch if necessary, too.

Nice work Jeff, thanks a lot !
