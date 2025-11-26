Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D659C8A483
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7655E10E635;
	Wed, 26 Nov 2025 14:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fX2GVEgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF5210E636
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:20:27 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42b3c965df5so3690752f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 06:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1764166825; x=1764771625;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K+mX3K4EZWXpumEvNCBx9+WunDYcwtTk4SgV9tqSlww=;
 b=fX2GVEggeIWwyylfupsU7FBjTHVurzr+2/wLA4JYqFyPpSdW1ACtsnasbEzEGi/+jk
 GV3cul1rsJwyoKSR8BbeMDO3kO1ZojVFkZguyRs0TvQRlvuXstL6CEWgPmDJiFLccD4k
 0ZEz63OjmIoeQ3osSloCV0wOVvYm1UheVQnx+cjwEmm9Hd//8Uchq6MLQ3w/3MhqzLRn
 A8Eec3RLNi80SWAiMY0hhSxw9uT3sVu0NosVmJWV2RLKFtR7pEcgSuvmpiMJlvHTmgIi
 g826fUMFIU6hTK8jSn8gLtiDO2++fSxMjw4J+yjimXdl93p8FN7Ex1Rrc0/FieleWm8d
 nuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764166825; x=1764771625;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+mX3K4EZWXpumEvNCBx9+WunDYcwtTk4SgV9tqSlww=;
 b=MNUxNsaGrVx1bVMDlRvCScQvZdjw4VozcRQXbJphSx59LjtOf/vzK7RyQHe6KPb2Ef
 s7Zs0pj5q4YfPYVuzR+ZzDiOaDUzS3YQE7MSknKol2OEpL2foxfE/ftIpai3sb+UKc4P
 SvdoATQKppnUdQ6IgAW1U8Gh4gBG/K1zP90oMHC4w2OABVKU03doHAMo8/IaH6AfUgM1
 1iv4KOqCkiE9ZTzruR0Ri9PhJIlqFWX6nRy9lLXFxDOMcainSqPxZOpGPfR7jFC+/Btz
 TYKhtdQyl8SxXvjRcoGO9cJUhXEVXr1KU7RlLAWP6nQZbvOHGMPhd6vb7GrR1cB7FcIT
 CBjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZvDfGI82LAr0pOaQSVMAp+nM73/iz8tRx+h7+Wmd1uAaDqFtsuVBC5/xJ2zVuYziE42sqWGgqiw0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0yQwzDqOd7K0oU18Sp3OaHoiaXyAPwMaIJqOmj+0FteoZUMk/
 8bYwoPwDx5RhILF+pdujUDOTo4SIK9PplSvlwjfX9PvmFaEqX4MckYxietQUfksBKJ8=
X-Gm-Gg: ASbGncvPnxPbQuoFP/Nu9pl3odHlg+G88m/1adcbET/iyjoMfmWlF2/+JUiiiX4hG+b
 qanwm0OfTnn27z8PkMMHo4hu6pajbHZhhjApNtxlYfcRyCQSP+qlVVznIIwCIE6kRbc37jIo6zw
 oWH1T9YI8mQe+nCRZeFSc5rL7f9j3dSARBKrnacEBeNrmlDBZ1wmsvRd4oPA80nlJus/IRmgz6/
 WPGXUecSgOCvQnbJ2qCQ9LyKBeQRfyIRHARoa8/OrqJyKD6rG9DCRD5rEjnQylxGeQZOmHYquPn
 sqzqMVKy0F2pBvw34wwtFcXNUeVtp2prkXr+OKBJzKL1r2KNxrlwBi+yVzORvJ12wKE2daDDAVY
 P1/iP8gFfxQFhZyXegWEJmbCN5/xLt4/OmwgR/6E3jWaMRh8UbCEY4jQ9rj74Tk8CMwgX1xmbp4
 T+W2MyCw/9hPNX991W9f3YcILTx0QWNZSzQHxpcImTQX7e+Tf5dSkXqjj5w4cY1bhVMiiIEQ==
X-Google-Smtp-Source: AGHT+IHetDpaeSCLD158eeBfnLMa77d0GWcu9KkUU/dpWWOreiarVBFn16/gIezMUQj2z9CZm6a8yQ==
X-Received: by 2002:a05:6000:40c9:b0:42b:3806:2bb7 with SMTP id
 ffacd0b85a97d-42e0f1e35c2mr7360017f8f.6.1764166825367; 
 Wed, 26 Nov 2025 06:20:25 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fba20esm40814603f8f.37.2025.11.26.06.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 06:20:24 -0800 (PST)
Date: Wed, 26 Nov 2025 14:20:22 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Thompson <danielt@kernel.org>,
 Doug Anderson <dianders@chromium.org>, simona@ffwll.ch,
 airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org,
 deller@gmx.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jason.wessel@windriver.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nir Lichtman <nir@lichtman.org>
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
Message-ID: <aScMprMh6Eh4JU5D@aspen.lan>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
 <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
 <aSbwWLTLe0bMhOKV@aspen.lan>
 <054f60ca-b898-488f-81f4-14eed0a1360b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <054f60ca-b898-488f-81f4-14eed0a1360b@suse.de>
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

On Wed, Nov 26, 2025 at 02:32:32PM +0100, Thomas Zimmermann wrote:
> Hi
>
> Am 26.11.25 um 13:19 schrieb Daniel Thompson:
> > On Tue, Nov 25, 2025 at 07:26:33AM -0800, Doug Anderson wrote:
> > > On Tue, Nov 25, 2025 at 5:06 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > <snip>
> > > > Therefore remove the remaining support for kdb from the DRM drivers
> > > > and from DRM fbdev emulation. Also remove the hooks from fbdev, as
> > > > there are no fbdev drivers with kdb support.
> > > >
> > > > If we ever want to address kdb support within DRM drivers, a place to
> > > > start would be the scanout buffers used by DRM's panic screen. These
> > > > use the current display mode. They can be written and flushed without
> > > > mode setting involved.
> > > >
> > > > Note: kdb over serial lines is not affected by this series and continues
> > > > to work as before.
> > > >
> > > > Thomas Zimmermann (5):
> > > >    drm/amdgpu: Do not implement mode_set_base_atomic callback
> > > >    drm/nouveau: Do not implement mode_set_base_atomic callback
> > > >    drm/radeon: Do not implement mode_set_base_atomic callback
> > > >    drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
> > > >    fbcon: Remove fb_debug_enter/_leave from struct fb_ops
> > > Personally, I've never worked with kdb over anything other than
> > > serial, so this won't bother any of my normal workflows. That being
> > > said, at least as of a year ago someone on the lists was talking about
> > > using kdb with a keyboard and (presumably) a display. You can see a
> > > thread here:
> > >
> > > http://lore.kernel.org/r/20241031192350.GA26688@lichtman.org
> > >
> > > Daniel may also have comments here?
> > TL;DR - I'm pretty relaxed about these changes... but I'd like
> >          to know how to test the changes.
> >
> > Like Doug I only really use kdb via serial but, since I'm maintain
> > the thing I do occasionally test kdb works on the qemu console. I don't
> > do it very often though because it's a manual test!
> >
> > I'd assume that will still work since it won't involve any of the
> > drivers above. I'm afraid I can't double check that since patch 4
> > doesn't apply cleanly in v6.18-rc7 (nor to linux-next... and neither
> > does the base-commit appear in linux-next).
>
> To test its effects, ignore this series and simply clear the two calbacks at
> [1]. This is where the debugger invokes fbcon. The series removes their
> implementation in the final patch.
>
> [1] https://elixir.bootlin.com/linux/v6.17.9/source/drivers/video/fbdev/core/fbcon.c#L3202

Thanks. Explanation in original cover letter was great and there's
certainly been no harm to QEMU.

Acked-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
