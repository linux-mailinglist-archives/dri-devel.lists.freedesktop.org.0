Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4639D810
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 10:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC2E6E886;
	Mon,  7 Jun 2021 08:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4076E886
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 08:58:48 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id h9so17341764oih.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KYnST4xMNeuPgPPOl1Uc/yBeQ+ULnP011tDSPQY7mds=;
 b=alduiESxQyHmn+lmEJJlxSUIDuFAmqKoDodwRAUztGncFlRs3bi/9tPuJIk2Pdecnm
 3Ysi20vtMd5eW7s79N+RHEI/4G1NI1pxD1I0XH1VQ8yWTODpgfYesLmeGcPwuxJfK2bE
 JQuQvKprgMJE2sJAebt+0bL/gRASkDhV86pVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KYnST4xMNeuPgPPOl1Uc/yBeQ+ULnP011tDSPQY7mds=;
 b=toW8tIxVpICdvK1Vn2daap2Se48DBOvBLsISHFoaAU0u0J+7j71XTw1fq2XxCiime3
 XMmi8czT6C/9hcCmGMCoWE5fr7Yi9oWggw5YnLmWsReAhVhl9LZ0iUNhTKuesBBxOElF
 /4B5WujLfXXgMyb/0DpZnbhqQ7C86aGphETTFMSq8tjtEgdSYKr7nWgwYdOH+QRHTikc
 6k+iP8yQYyI4tep4dfp48bIqOMTLeZwrVl7x2vEfoZ6fpYBUxb5+iz5PESErgoEk3ke7
 i73jKqDBAepA3G5meR/Xa/B7uYOq5aJP+iENywNanCVOmWgeSAouS1QfshMArOSXvpw1
 bepQ==
X-Gm-Message-State: AOAM533Ay0UHdiHe8UFrKchJORgNALgHfPuUev3wgiqeMIMIw9l9O2/l
 NsnVsWK+i+S2pvAGFI9VJ17OJTGzAtYMnk9JHeHGBw==
X-Google-Smtp-Source: ABdhPJwRkRjbr3WBfbmKDBLRY/aux3RdUwwRn9OzYs5gWHlJy0Dt5RR/2L+p6H/3xW+2JCoDSbW4kEKaGXOlSYUq8nE=
X-Received: by 2002:a05:6808:1142:: with SMTP id
 u2mr18063404oiu.101.1623056327527; 
 Mon, 07 Jun 2021 01:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210606100312.119176-1-christian.koenig@amd.com>
In-Reply-To: <20210606100312.119176-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 7 Jun 2021 10:58:36 +0200
Message-ID: <CAKMK7uGX7z2KdymWus2fk9VR57wU+Rj4jcS0j=j_sYwaH8zrLg@mail.gmail.com>
Subject: Re: handle exclusive fence similar to shared ones
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

So unfortunately I got distracted with some i915 bugs and fun last
week completely, so didn't get around to it.

On Sun, Jun 6, 2021 at 12:03 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi Daniel,
>
> as discussed here are the patches which change the handle around exclusiv=
e fence handling.
>
> The main problem seems to have been the dma_resv_test_signaled() function=
 which ignored the exclusive fence when shared fences where present. This w=
as already rather inconsistent since dma_fence_wait_timeout() takes the exc=
lusive one into account even if shared ones are present.
>
> The second patch then fixes nouveu to also always take the exclusive fenc=
e into account.
>
> The third then removes the workaround in amdgpu around the VM page table =
clearing handling. Since I'm not sure if there are no other places which re=
lies on the existing behavior I will hold this one back for a while.
>
> Is that what you had in mind as well?

I think from the semantics something where we treat the exclusive
fence as an IPC mechanism that the kernel doesn't care much about
(exceptions apply), and but more consistently count all access from
any CS as a shared fence. So in a way what you've done here, and also
what you've done in the earlier series with setting the read/write
flags on shared fences.

For actual approach what I've picked is a bit of what amdgpu does +
what other drivers do with NO_IMPLICIT, but with the bugs fixed
(there's a bunch of them): Essentially we try to always set the shared
fences, and exclusive fences are set additionally on top when the
implicit sync IPC calls for that. And on the depdendency side we do
clever logic to only take in the exclusive fence when required.
Currently for amdgpu this means introspecting the fence owner (there's
some nasty tricks there I think to do to make this work and not be a
security bug), for others that's done with the NO_IMPLICIT flag (but
again some nasty corners there, which I think a bunch of drivers get
wrong).

There's two reasons I'm more leaning in that direction:
- The annoying thing is that the audit on the dependency side is a lot
trickier since everyone rolls their own dependency handling. If we
don't change (for now at least) the rules around dma_resv then an
oversight in the audit isn't going to be a huge problem.
- Wording becomes inconsistent: An exclusive fence which is also a
shared is a bit confusing. I think it's better if we stick to the
current rules for dma_resv, change the semantics we want in drivers (I
think that's doable, at maybe some code cost e.g. Jason's import ioctl
would be simpler with your changed rules, but still doable with the
current dma_resv rules). And then when we have that, we figure out
what to change with the dma_resv struct/rules.

Wrt the patches: Good thing is that what you change here and what I've
found thus far is 100% not overlapping, so at least we didn't waste
time auditing the same code :-)

Cheers, Daniel
>
> Regards,
> Christian.
>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
