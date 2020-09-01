Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC4258CDE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 12:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5776E3A0;
	Tue,  1 Sep 2020 10:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB796E3A0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:34:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w5so927230wrp.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 03:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jKyzOb5SSjLTlidGXj8nXzunjb6G7Xj1PMn/IF7Kh0Q=;
 b=Qqnyi90epWKP7jewklh6e9RqunmvmQed0dKzS7CXCIVEkImfyXoD6VtIpPFDWTw9x4
 /I8UiTnWNBVYyd/F7rLaSu7grnq8YFxbwQprL6snyFJnWBrP+9mjyeG9AayJelNTylxG
 8fnJcXzhNavwJhm4Rrp+xe5KF7vrXkFXr3afo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jKyzOb5SSjLTlidGXj8nXzunjb6G7Xj1PMn/IF7Kh0Q=;
 b=t5tElRvFDZDL89qk3HeAF1rM4F1ZBNqDi396bBnvlb4IzTV8hgA/bOC6VHVZeRXETB
 h3tfA9sgEsS0XG2ZXf0EzoIgHV1+J6MsDK5nbFhZCQJmAwMPkXJwsoRPX+s6QqUWPEO5
 Scij8viuL7lGsaumdtAaVxQccmr79HorsVnga/l40TTX8qyAHiSsKNQz8lvBS8Sc8zzh
 OPBhUsqj9MHJ1jPW6t2MowHyys9wylac4FEpIX2gEwOGGwsow+/tBqGmJvEsI6oQzk6f
 OOGnLJZ8KjsVtYpAMyDet2oe6d3G0J4fUfqDghwSOvR5wL+s7KwPzf/VBlqkCBNzt28A
 hnig==
X-Gm-Message-State: AOAM532WkuU+FVEjZK4LGFRXDHpZdnb5mbN2exxcHcqGwzL4xoCHMFYB
 gdrjOXUn5XUiqJrcTwrQGJntDw==
X-Google-Smtp-Source: ABdhPJwX3BtpzPEM8bwIoBP6M24mJ4sxhTaPj5GAjfsE+Vc7Wf+oU9kCjsGF8ynZ4dKIOy50GyyzLA==
X-Received: by 2002:adf:ec08:: with SMTP id x8mr1086804wrn.235.1598956444120; 
 Tue, 01 Sep 2020 03:34:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v4sm1167712wml.46.2020.09.01.03.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:34:03 -0700 (PDT)
Date: Tue, 1 Sep 2020 12:34:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
Message-ID: <20200901103401.GA2352366@phenom.ffwll.local>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <58dc5ed0-307e-74c9-1a8b-1e998be04900@amd.com>
 <91391bb3-a855-1a29-2d2e-a31856c99946@daenzer.net>
 <20200824104327.559503f7@eldfell>
 <b8bc3e37-d9b3-2aeb-8580-f265f1b8c830@daenzer.net>
 <20200901075719.GX2352366@phenom.ffwll.local>
 <52d558d2-3277-716f-6386-b8b90e6f41d3@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52d558d2-3277-716f-6386-b8b90e6f41d3@daenzer.net>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 10:56:42AM +0200, Michel D=E4nzer wrote:
> On 2020-09-01 9:57 a.m., Daniel Vetter wrote:
> > On Tue, Aug 25, 2020 at 04:55:28PM +0200, Michel D=E4nzer wrote:
> >> On 2020-08-24 9:43 a.m., Pekka Paalanen wrote:
> >> =

> >>> Sounds like the helpers you refer to are inadequate for your case.
> >>> Can't you fix the helpers in the long run and land this patch as an
> >>> immediate fix?
> >> =

> >> I'd rather leave working on those helpers to KMS developers. :)
> > =

> > I thought the issue is the rmfb ioctl trickery, which has this assumpti=
on
> > fully backed in. The wiggle room in there for semantic changes is iirc
> > pretty much nil, it took us a pile of patches to just get to the current
> > state. So it's not helper code, it's core legacy ioctl code for atomic
> > drivers.
> =

> My bad. Should I respin with an amended commit log?

Yeah if it's not yet merged then I think would be good to clarify that
this assumption is baked into rmfb, and that together with the assumption
the the legacy cursor ioctls just work we have fallout.

If (and hey I've been on vacations for 2 weeks, so good chances I remebers
this all wrong) this is indeed what we discussed a few weeks ago.

Cheers, Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
