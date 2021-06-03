Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAAF399B9E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 09:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DB66F40B;
	Thu,  3 Jun 2021 07:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F03C6F40B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 07:32:37 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id d21so5391369oic.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 00:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tbqXxzBQan5qZOKDHud6woka91j0ECnjHRdGUPfgw84=;
 b=UNDElItiuSVuFJY6RhUGyRLX/vcc9GuhIfJzApQ7tzNzc+K4jbKnP4HS8091PodGsR
 BeY6HZRqDMDA+abrWzc+7zQ2iW1kXpvoDUtEws2/ldepeZsMV+l5JdAg0flQHAoozBxt
 cOV0ddcIdwtjDjbo1UMBO9kV4gBKWu2Mri238=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tbqXxzBQan5qZOKDHud6woka91j0ECnjHRdGUPfgw84=;
 b=BKS1MN05ZdxuuGvFr9cfjQOfsO/8uekZdBXy57VMQlBnxyxhdwL5+hH+z1h/Szwtbc
 cFXC7bWOLBKebRj2+ni0CAlnIsUjqzYry2D4dXbIJemmsN3lYGqtAr9B1Fq7sQeG8h+8
 3GBWd2c8OeuxCuXsfUh+yQzkxHVJeSelwXUszJqefQkRod02ANx0gmEFa+DjxpmJSkTz
 ce9MyU0kQxxEexkbk3JR8xkcTLRHB3aXja3FEDQx746MwuysH26Xo2BjE82ZWjMT8KQZ
 r+AkuFBtt7Vy1wXo47GDjP3L3iz5F4AV6a4+nYBhHL7YSkf/Ii6HjpB3YnunuFsMxJbb
 ZTvQ==
X-Gm-Message-State: AOAM532ii5yOmKoDMAd5btKubmnwcEZlygBqQUCzpuSBOj4NnafUsMtZ
 MCRIl2CsCpd80roUykIBPeZC4FBF1d/wK6oVBaV8B7JCfmI=
X-Google-Smtp-Source: ABdhPJxsXyGXmMMwj+H0+yYoAAlJQ64btO9wlxK2VBEVYaIliZxWr/H8ggDlea1r4cS40Kqq6SjWOB30zJwcIwIdUY4=
X-Received: by 2002:aca:5701:: with SMTP id l1mr8487681oib.128.1622705556953; 
 Thu, 03 Jun 2021 00:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210527162650.1182544-1-jason@jlekstrand.net>
 <20210527162650.1182544-22-jason@jlekstrand.net>
 <YLSoXSnKlZV/EQwD@phenom.ffwll.local>
 <CAOFGe973O_GJ9iqKQaE17TmWoKpaCYokxupzyOkuKG6U9pEyfg@mail.gmail.com>
In-Reply-To: <CAOFGe973O_GJ9iqKQaE17TmWoKpaCYokxupzyOkuKG6U9pEyfg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Jun 2021 09:32:26 +0200
Message-ID: <CAKMK7uGcs_x50R98TC_c0jTXNdmgN-0AH6Vg6itn5sPU3nB6Jg@mail.gmail.com>
Subject: Re: [PATCH 21/29] drm/i915/gem: Use the proto-context to handle
 create parameters (v2)
To: Jason Ekstrand <jason@jlekstrand.net>
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

On Thu, Jun 3, 2021 at 12:23 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Mon, May 31, 2021 at 4:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, May 27, 2021 at 11:26:42AM -0500, Jason Ekstrand wrote:
> > > +static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
> > > +                              struct i915_gem_proto_context *pc,
> > > +                              const struct drm_i915_gem_context_param *args)
> > > +{
> > > +     struct drm_i915_private *i915 = fpriv->dev_priv;
> > > +     struct set_proto_ctx_engines set = { .i915 = i915 };
> > > +     struct i915_context_param_engines __user *user =
> > > +             u64_to_user_ptr(args->value);
> > > +     unsigned int n;
> > > +     u64 extensions;
> > > +     int err;
> > > +
> > > +     if (!args->size) {
> > > +             proto_context_free_user_engines(pc);
> > > +             memset(&pc->legacy_rcs_sseu, 0, sizeof(pc->legacy_rcs_sseu));
> >
> > Hm I wonder whether we shouldn't put this into the cleanup helper, and
> > then maybe call it proto_context_reset_user_engines()? I think that makes
> > the entire user engines vs sseu flow a notch clearer again.
>
> I fought with myself over this.  The other two callers of
> free_user_engines() would be fine with clearing out the SSEU as well,
> I think, but neither of them need it.  I erred on the side of putting
> it in the one place it's actually needed to make it clear what's going
> on here.  I can move it if you'd like.

So I'm wondering about semantics here a bit, and whether this is all
real, as in, used in real userspace:

Instead of resetting engines here, shouldn't we just complain if
there's more than one engines_set command, ever, on a context?

> As a bit of a P.S., I really hate the SSEU handling.  It's horrible.
> If I had it to do all over again, SSEU would be a purly dynamic
> context param that you aren't allowed to set at create time.  But,
> sadly, we're in the mess we're in. :-(

Yeah it's rather annoying. If we go with "only one engines_set per ctx
create", then maybe we could streamline the SSEU stuff some more too?
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
