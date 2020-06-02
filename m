Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1C31EC44A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 23:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADD36E210;
	Tue,  2 Jun 2020 21:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE696E210
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 21:23:19 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z206so7080120lfc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bg4oW0zzhC9DoMLi8s0gmV/2hMWzV2pEV315rgs2iaw=;
 b=QCn5mx8zXRosBimgjKhFTsn+FeGhvDrnReeXotHK6uQy9JXxxeEZAhHc+iXozHQCg0
 YBbNn5UKAcy2/JQotpmW1NtgSYBASdcaAgUeq+zo+TIz43XBTOkK1l9mZ9vhTsMkWeiB
 st+js1iwZWx8t6+ZZV/2EF3DBmjhWLIeWmHiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bg4oW0zzhC9DoMLi8s0gmV/2hMWzV2pEV315rgs2iaw=;
 b=R4V1BeXViQd+oHRvUrHcbJ2BkTXy4aOQK5Sj3h6H+e9d6RJRahhYFfSG5JL/LlcCcs
 +S1yUFETNGtf4F3IwL19awv71s8Ka/VcF4rl5nRgadSwPF/j9XwRSotqJP3lklg8QNVr
 xl+mMawpgyjc4cGgrFqRQGmk2UUVFkMVmOOZGNatdAGp2csjLGnsoK0sPn9ZW8YFWCDs
 8+FZnt4+CNl5ZWtATTuyyxF2uTWa/v8DFROJkDLaagqPIRrWASQTH5NFyN25bSjWuW6n
 Xfl0rB5SI3CphsOFyAEIPoFbkKf5U7DyQcYWN3p0Lf8l1V7PwRpMvez07irJF2ynw79N
 Q/xA==
X-Gm-Message-State: AOAM530qstvwTRr0AKOQtvU0sKj0MibuFfBO8EFZSvyBT8qyU1mtoZ1R
 VrSyHBgYuCBkOt7C/YBSoyMPbGXbpLc=
X-Google-Smtp-Source: ABdhPJwbej7ljVAQB62kmVaQcF/YXxFyozCnEn9c/kcbFKbuHRGN10Is11ns+HIT/pTh5zH4ppBl5A==
X-Received: by 2002:a19:f11c:: with SMTP id p28mr687852lfh.0.1591132996890;
 Tue, 02 Jun 2020 14:23:16 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id h4sm16132ljg.112.2020.06.02.14.23.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 14:23:15 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id c17so27413lji.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 14:23:15 -0700 (PDT)
X-Received: by 2002:a2e:7e0a:: with SMTP id z10mr489958ljc.314.1591132993601; 
 Tue, 02 Jun 2020 14:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <CAHk-=wjvVjei5d45D=GQMsFMssD8knSFWqxMbd4bH8qSgXk-Lg@mail.gmail.com>
In-Reply-To: <CAHk-=wjvVjei5d45D=GQMsFMssD8knSFWqxMbd4bH8qSgXk-Lg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jun 2020 14:22:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB_J6mWkiAB5Z8SdCGR=jr+N5sMVB0wGvrzg1MkxXOZg@mail.gmail.com>
Message-ID: <CAHk-=wiB_J6mWkiAB5Z8SdCGR=jr+N5sMVB0wGvrzg1MkxXOZg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 2, 2020 at 2:21 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Hmm. Some of them are due to your previous mis-merges.
>
> Your commit 937eea297e26 ("Merge tag 'amd-drm-next-5.8-2020-04-24' of
> git://people.freedesktop.org/~agd5f/linux into drm-next") seems to
> have mis-merged the CONFIG_DEBUG_FS thing in
> drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c.

Sorry, wrong filename. That should have been
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c, I cut-and-pasted
the wrong path from the conflict list..

               Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
