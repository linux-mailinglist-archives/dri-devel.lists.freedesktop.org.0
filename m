Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B454D1DC352
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 02:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C826E8C5;
	Thu, 21 May 2020 00:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285F76E8C5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 00:07:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id AAA0A27FDB8
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v5 1/2] drm/ioctl: Add a ioctl to set and get a label on
 GEM objects
Date: Thu, 21 May 2020 02:07:09 +0200
Message-ID: <7761830.T7Z3S40VBb@solembum>
Organization: Collabora Ltd.
In-Reply-To: <CACvgo52mso5kEWtjBQKM9RF51P=KnERRoWGai-emo2ofzJWLXA@mail.gmail.com>
References: <cover.1589468282.git.rohan.garg@collabora.com>
 <a0806974b5c0203ed824500dc2e780eb7af02837.1589468282.git.rohan.garg@collabora.com>
 <CACvgo52mso5kEWtjBQKM9RF51P=KnERRoWGai-emo2ofzJWLXA@mail.gmail.com>
MIME-Version: 1.0
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
Cc: kernel@collabora.com
Content-Type: multipart/mixed; boundary="===============0004000194=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0004000194==
Content-Type: multipart/signed; boundary="nextPart9700878.nUPlyArG6x"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart9700878.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hey Emil
I've applied all the suggestions except the ones I discuss below.

> 
> As a high-level question: how does this compare to VC4_LABEL_BO?
> Is it possible to implement to replace or partially implement the vc4
> one with this infra?
> 
> IMHO this is something to aim for.
> 

Yep, the intention is to replace the VC4 specific labeling with a more generic 
framework that all drivers can use.

> A handful of ideas and suggestions below:
> 
> On Thu, 14 May 2020 at 16:05, Rohan Garg <rohan.garg@collabora.com> wrote:
> > Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> New functionality usually has suggested-by tags. Reported-by tags are
> used when the feature isn't behaving as expected.
> 

This was suggested as part of the previous review process [1].

> > +
> > +       kfree(gem_obj->label);
> > +
> > +       gem_obj->label = adopted_label;
> 
> Do we have any protection of ->label wrt concurrent access? Say two
> writers, attempting to both set the label.
> 

Great catch. I'll protect this from concurrent access.

> 
> > +
> > +       if (!dev->driver->set_label || args->len > PAGE_SIZE)
> 
> AFAICT the PAGE_SIZE check should be a EINVAL.
> 
> Additionally, It would be better, to use the default implementation
> when the function pointer is not explicitly set.
> That should allow for more consistent and easier use.
> 
> Think about the time gap (esp. for some distributions) between the
> kernel feature landing and being generally accessible to userspace.
> 

This is intentional since vmgfx uses TTM and the DRM helpers would not work.
Sure, we could simply add a patch to the series that hooks up the relevant 
code to vmgfx and then calls the DRM label helper for all other drivers, but 
I'd rather have driver developers explicitly opt into this functionality.

> > +               return -EOPNOTSUPP;
> > +
> > +       if (!args->len)
> > +               label = NULL;
> > +       else if (args->len && args->label)
> > +               label = strndup_user(u64_to_user_ptr(args->label),
> > args->len); +       else
> 
> Might be worth throwing EINVAL for !len && label... or perhaps not. In
> either case please document it.
> 

Hm, I'm not entirely sure what documentation I should add here since we 
already document the drm_handle_label struct in the relevant header.

> 
> > +
> > +       if (args->label)
> > +               ret = copy_to_user(u64_to_user_ptr(args->label),
> > +                                  label,
> > +                                  args->len);
> > +
> 
> Consider the following - userspace allocates less memory than needed
> for the whole string.
> Be that size concerns or simply because it's interested only in the
> first X bytes.
> 
> If we're interested in supporting that, a simple min(args->len, len)
> could be used.
> 

I wouldn't be opposed to this if such a need arises in the future.

> s/int/__u32/ + comment, currently no flags are defined.
> > +#define DRM_IOCTL_HANDLE_SET_LABEL      DRM_IOWR(0xCF, struct
> > drm_handle_label)
> Pretty sure that WR is wrong here, although I don't recall we should
> be using read or write only.
> Unfortunately many drivers/ioctls get this wrong :-\
> 

From a quick read of the IO{W,R} documentation, I suppose we should be marking 
SET_LABEL as DRM_IOW and GET_LABEL as DRM_IOR.

Thanks!
Rohan Garg

[1] https://patchwork.freedesktop.org/patch/335508/?
series=66752&rev=4#comment_621167
--nextPart9700878.nUPlyArG6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYitc3NselT9dMmhSpwS9TvJnIJQFAl7Fxi0ACgkQpwS9TvJn
IJRLfw/+N8Cul68GS20ICVV9rEhhkmNEBGw12+Ao2rL/LDp8S/qbEVrjrcwg19hQ
yI/Ccf7GSeM3TxDmPNZ80L484Cfl2/nb+7VIFGsb2ScqnmW0FD6wfrCRRZU3sx0e
GTeCZ/knwXmjC4rbvr4kOB6qg2B6YIbiJy4QdxPIDLe0fhfISw+DymEoMajlEapL
mET/SoPtYGrDNN1rjuHLmqpPm5nqaDKVidXwziNiBf+GyGI3THb+hd3XDt6574L5
QVdAF7l3nUBxRpeyxeIQkBj1CNeG5a5sZYBOXhfiKbfDSWtqgFdR/5QkqnhVz3at
Uhb/69ZqVo/BcKrtBDbFQBdUZIWX2Mw6qGKvGcUsxIwd0uWtv+4CVlkLOKumrqP/
FEYiLsJbXN9ad4DyXku4CGK0FqJAVA77fDLLCaJE9WyY4r8iuTt8hAGqXMi7GUzr
gePArEMd9yixuisJsp5B+JVYF13o8yQm0MADseK3f+yI2FBtIq2wwPhl9avt23tN
FB07ZWv2OvYaUsMXuMUii4lcmmqf4NuHF00vp+/6SS6PTtoQDWtSQtSKh3Tocvpm
195iCmyGDgO4tg17KAnwp+mnLnr80RI7fowzwxXFfJOIfOQTC0RLBUPDaEo1sUoK
v46Fq9+0DXYbM/o/tvzYe873cqFnGo+mcKqQVREEn+i+MF8OemQ=
=kJpt
-----END PGP SIGNATURE-----

--nextPart9700878.nUPlyArG6x--




--===============0004000194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0004000194==--



