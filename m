Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA139A5BA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7626E5A3;
	Thu,  3 Jun 2021 16:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078C26E5A3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 16:29:45 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id b9so9631825ybg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9rXXKQrsKPV/FTNHF+TjG0VgdXgVapwzGgt1vqwqwL4=;
 b=O1oE+pAio21HAIQXtMnlixovz2XzsnIYQdX5ESFuzyPnz91URweb2HhFvI9rbAVjhk
 jvVCUf9X20us1RNJl6zpZ0GpG9Ljg1j1QUkH2X+zAnhbKvHrzR68cXawY03CxiLj13bW
 xrU5/zGvZWpWL/4N11dxkSyis/fYJRGc0748e+0Lf+YgWu0re78dQLmik7Ky81zl68Ih
 iTfjmVwDAoFssmx90xfvbkuGPTvSvXyQ/PqiJ+RqYzcHSv+NKObLE7PvujWdn/VvFQBp
 bArj3iQlsQcvAaRwz+tOw/N9MU0emzMB5b4uk0DP9IljCdB5uYkc6PzKRjCJDfZijfI/
 vQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9rXXKQrsKPV/FTNHF+TjG0VgdXgVapwzGgt1vqwqwL4=;
 b=WWDkA2bqfpAvOnN3sy8rEIJ0o7a3/tabuZ4y7zLN/cdDorRpdPfDIZiRRlfuBBpZq2
 60QVztCooRNuIPDvW4HZYdDBfpEIoZhYIe7cJTh/IQbD8+drSMo9yNBiPWJieoMsQg+J
 ugx6CYbuWykAGy/qHua3LqgqiPHiK/YOixEyS+CmmOLrge7W9+31OYVBziyONlasARll
 O48ln7O+KgSlR0vcRPZnhsVx7RqYLPLzgGRlqpjoVbdtLK4TY+/kd0uqrOfolrzrwwUQ
 vHrVV3gS/42EWhqFZ3YZeI2lUh14QHCzw9syVzsv4K3kne60RYXly2Jy+VoBMaJO+CD2
 Yp+w==
X-Gm-Message-State: AOAM533+ay1dzYlYoSr73INLvamXYza4HWFXjTEHSILiBrjptC9GduHN
 6LtWCWCt+oVLkFrj9cO5L0IYgYZjuMKSVGTzx/j96A==
X-Google-Smtp-Source: ABdhPJxgvvRx8jDRWg5V6wKNHGUkNYXN2JHHeml6afcrBbRlSZVT1Ojnd1t0TNsnWbrO8gjtE8JJySEcw4N4eoSGc+g=
X-Received: by 2002:a5b:392:: with SMTP id k18mr1203914ybp.180.1622737784106; 
 Thu, 03 Jun 2021 09:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210527162650.1182544-1-jason@jlekstrand.net>
 <20210527162650.1182544-22-jason@jlekstrand.net>
 <YLSoXSnKlZV/EQwD@phenom.ffwll.local>
 <CAOFGe973O_GJ9iqKQaE17TmWoKpaCYokxupzyOkuKG6U9pEyfg@mail.gmail.com>
 <CAKMK7uGcs_x50R98TC_c0jTXNdmgN-0AH6Vg6itn5sPU3nB6Jg@mail.gmail.com>
In-Reply-To: <CAKMK7uGcs_x50R98TC_c0jTXNdmgN-0AH6Vg6itn5sPU3nB6Jg@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 3 Jun 2021 11:29:32 -0500
Message-ID: <CAOFGe941U-ahAs=PE8zrkRdtyBCB3aEdUfS27MBcorDJWqNsRA@mail.gmail.com>
Subject: Re: [PATCH 21/29] drm/i915/gem: Use the proto-context to handle
 create parameters (v2)
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 2:32 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jun 3, 2021 at 12:23 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > On Mon, May 31, 2021 at 4:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Thu, May 27, 2021 at 11:26:42AM -0500, Jason Ekstrand wrote:
> > > > +static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
> > > > +                              struct i915_gem_proto_context *pc,
> > > > +                              const struct drm_i915_gem_context_param *args)
> > > > +{
> > > > +     struct drm_i915_private *i915 = fpriv->dev_priv;
> > > > +     struct set_proto_ctx_engines set = { .i915 = i915 };
> > > > +     struct i915_context_param_engines __user *user =
> > > > +             u64_to_user_ptr(args->value);
> > > > +     unsigned int n;
> > > > +     u64 extensions;
> > > > +     int err;
> > > > +
> > > > +     if (!args->size) {
> > > > +             proto_context_free_user_engines(pc);
> > > > +             memset(&pc->legacy_rcs_sseu, 0, sizeof(pc->legacy_rcs_sseu));
> > >
> > > Hm I wonder whether we shouldn't put this into the cleanup helper, and
> > > then maybe call it proto_context_reset_user_engines()? I think that makes
> > > the entire user engines vs sseu flow a notch clearer again.
> >
> > I fought with myself over this.  The other two callers of
> > free_user_engines() would be fine with clearing out the SSEU as well,
> > I think, but neither of them need it.  I erred on the side of putting
> > it in the one place it's actually needed to make it clear what's going
> > on here.  I can move it if you'd like.
>
> So I'm wondering about semantics here a bit, and whether this is all
> real, as in, used in real userspace:
>
> Instead of resetting engines here, shouldn't we just complain if
> there's more than one engines_set command, ever, on a context?

I don't think it's ever used.  Let's kill it.

> > As a bit of a P.S., I really hate the SSEU handling.  It's horrible.
> > If I had it to do all over again, SSEU would be a purly dynamic
> > context param that you aren't allowed to set at create time.  But,
> > sadly, we're in the mess we're in. :-(
>
> Yeah it's rather annoying. If we go with "only one engines_set per ctx
> create", then maybe we could streamline the SSEU stuff some more too?

It certainly gets rid of this weird corner.

--Jason
