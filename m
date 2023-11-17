Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E62C7EF0E0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 11:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8240610E742;
	Fri, 17 Nov 2023 10:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FA210E742
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 10:44:46 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1e99b05c8f4so192334fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1700217886; x=1700822686; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nGWhpvEe+yw2xaw+AfrLaZq0v0m8nxdrO9p+O1/cciY=;
 b=a7dpOM04QUnxpkK/c9i3bcZaQMfqQQWBj3fYYVnijnCnhZnA/PQPqn0LQcOgJuju+6
 CQMzKcuPaVL5figMi1jA1YqMw42we8r1T3S7PKFe9UAu464tPjgdm/x+NPRf/aacm5ZL
 w3HsszPFEfz48zcxuAd5Zt8635t4kwYb+hcqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700217886; x=1700822686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nGWhpvEe+yw2xaw+AfrLaZq0v0m8nxdrO9p+O1/cciY=;
 b=lJNNuzGppgI5dBcYzfEk11PSJgIPM/vQbKb+DJvzjzMKNw+0nbgM0yLMD7YixOU31O
 Kch7m3mtUJqdIPTq0/F0oNPi1/6Xc3g4A1NragYPORHtN48PAtFunPj9CUuEmk2YkqF0
 PtBp9CRBDB9HRRVGoWypnaiR3nEzOJTLgCXmZHw1kNZRRl/33OdSE4gcozyjMgiF+F1G
 VIgDYxe5ItIjzfwzdNVjN6SUC5QcwN5aunhgIi2geN32ECZT6yCC3hZjI2kDeSwZSj2N
 SQbrdtGY6D3nFRzqOiZ3VQxut6nV1VSJlz2IUwafTzstet59h5O0es35GW834Fkxw7Kt
 PXeQ==
X-Gm-Message-State: AOJu0YwvNnaZ5bpPV6/ZIX7U79Xk+guBoybQTuwabi2aaBDSqfRCEzDt
 Ptz4jY3/DD85238CI806veDrQypj/GYz033Ss+W6Lg==
X-Google-Smtp-Source: AGHT+IH6d8pugRzCyCPpgsD/p3S0ErPfdXLzHU0/BD0Ge8OqcLZ+VCXqpt8W7BHkvzmvNVD+wx/r1Kj0tXeX1vl1m0k=
X-Received: by 2002:a05:6870:7e04:b0:1ea:972:d2b6 with SMTP id
 wx4-20020a0568707e0400b001ea0972d2b6mr12410000oab.3.1700217886205; Fri, 17
 Nov 2023 02:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20231009141018.11291-1-tzimmermann@suse.de>
 <skb2mpjs5hawsl4daczcunfplds65uj762vdpcvp3lurrldxdb@e65uaawi2kpu>
 <e445fb5d-0cdd-4ba0-aafd-1f025bcca30b@suse.de>
In-Reply-To: <e445fb5d-0cdd-4ba0-aafd-1f025bcca30b@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 17 Nov 2023 11:44:34 +0100
Message-ID: <CAKMK7uGj2Z7dFsVL_iQu-pGJS16-j1na+tSE13qp104q5wxVMw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] drm: Reuse temporary memory for format conversion
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: jfalempe@redhat.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, noralf@tronnes.org, Maxime Ripard <mripard@kernel.org>,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Nov 2023 at 11:07, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 17.11.23 um 10:34 schrieb Maxime Ripard:
> > On Mon, Oct 09, 2023 at 04:06:29PM +0200, Thomas Zimmermann wrote:
> >> DRM's format-conversion helpers require temporary memory. Pass the
> >> buffer from the caller to allow the caller to preallocate the buffer
> >> memory.
> >>
> >> The motivation for this patchset is the recent work on a DRM panic
> >> handler. [1] The panic handler requires format conversion to display an
> >> error to the screen. But allocating memory during a kernel panic is
> >> fragile. The changes in this patchset enable the DRM panic handler to
> >> preallocate buffer storage before the panic occurs.
> >>
> >> Patch 1 adds struct drm_format_conv_state, a simple interface to pass
> >> around the buffer storage. Patch 2 adds an instance of the struct to
> >> the shadow-plane state. Patch 3 moves the buffer's memory management
> >> from the format helpers into their callers within the DRM drivers. Most
> >> of the affected drivers use the state instance stored in their shadow-
> >> plane state. The shadow-plane code releases the buffer memory automatically.
> >>
> >> Patches 4 to 7 update three drivers to pre-allocate the format-conversion
> >> buffer in their plane's atomic_check function. The drivers thus detect OOM
> >> errors before the display update begins.
> >>
> >> Tested with simpledrm.
> >
> > So, I just discovered that you merged that series.
> >
> > You've complained before about "sneaking patches in", and while I was
> > disagreeing with you then, this particular instance is definitely a
> > strong case for it. You've merged it without telling anyone, and despite
> > our ongoing conversation on the v4 that was active more recently than
> > the v5. And that you never responded to.
> >
> > Awesome.
>
> My apologies. From my point of view, that conversion had ended. I left
> the patch set for a while to wait for further comments or questions, but
> nothing happened. So I merged it.
>
> Revert it if you cannot live with the changes. IIRC you found the
> reduced number of alloc/free cycles to be irrelevant. But even then, the
> patches allow us to move the allocation from atomic_update to
> atomic_check, thus detecting allocation failures early. That's an
> improvement to me.

Just a small comment on this, I didn't read up the full discussion:

Yeah allocating memory in atomic_commit after the point of no return
is no-go. Usually the best spot is the prepare_fb hooks since that
avoids doing expensive allocations for TEST_ONLY commits, but since
the allocation is fairly small it probably doesn't matter overall.
Well the new-ish begin/end_fb_access helpers would be even better I
guess for the atomic flow, but break the panic handler use-case I
think.

Oh and a bikeshed, _copy() feels a bit like a funny postfix for
something that does a state duplication, everywhere else in atomic we
put _duplicate into the name for these functions.

Cheers, Sima

>
> Best regards
> Thomas
>
> >
> > Maxime
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
