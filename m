Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B18C9347
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 03:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081AE10E12C;
	Sun, 19 May 2024 01:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 563 seconds by postgrey-1.36 at gabe;
 Sun, 19 May 2024 01:28:49 UTC
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com
 [216.40.44.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4939810E075;
 Sun, 19 May 2024 01:28:49 +0000 (UTC)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay10.hostedemail.com (Postfix) with ESMTP id 0BF52C056A;
 Sun, 19 May 2024 01:19:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf08.hostedemail.com (Postfix) with ESMTPA id A84B020027; 
 Sun, 19 May 2024 01:19:19 +0000 (UTC)
Message-ID: <03cc262da2a3db817aa5663fbce6c914708b74f8.camel@perches.com>
Subject: Re: [PATCH] drm/nouveau/nvif: Avoid build error due to potential
 integer overflows
From: Joe Perches <joe@perches.com>
To: Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@gmail.com, dakr@redhat.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com, javierm@redhat.com,
 kherbst@redhat.com, linux-kernel@vger.kernel.org, lyude@redhat.com, 
 mripard@kernel.org, nouveau@lists.freedesktop.org, tzimmermann@suse.de, 
 linux-hardening@vger.kernel.org
Date: Sat, 18 May 2024 18:19:18 -0700
In-Reply-To: <a912c2d1-9008-410a-92cc-912e17c63695@roeck-us.net>
References: <20240518143743.313872-1-linux@roeck-us.net>
 <34a6d812-b4ed-4465-b0ec-e641d185b9b1@wanadoo.fr>
 <202405181020.2D0A364F@keescook>
 <a912c2d1-9008-410a-92cc-912e17c63695@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: A84B020027
X-Spam-Status: No, score=-0.10
X-Stat-Signature: w3iik6tbsay1qy16e34mbnwb8cwgnmib
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19bAkmZyo+dJgltxs9NfI23KEnolHXqvm0=
X-HE-Tag: 1716081559-138596
X-HE-Meta: U2FsdGVkX1/NTsnVtjEKYHeeHCzZZWbJc+2s8OyWMfrImO+5aFN+RcWD+M6lUiPJt90JXXVs6VNH9RVnjo0SIbesh5wlYX/L1/Js40Zh10YqeTQ4A1BqQx71+JOEhyzPPcQvSopjounJG+N+Brc38ie+i/JEzH6Hx+tyhKpHLgy47jtUB0yWXaMZQ8gWS8Q8j6gtIR05ZXdxHqPou0c2d1TrTLTjCo1chif3e5HhxrwGcOM7bFFJ928ZMzqD6+OMWtKPVnqWIDQNS5IvOUo7UGzlQBvO+QZ0jEPkO3HnATz0taCXaujQL+UZNKdHjWp3
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

On Sat, 2024-05-18 at 11:23 -0700, Guenter Roeck wrote:
> On 5/18/24 10:32, Kees Cook wrote:
>=20
[]
> > I think the INT_MAX test is actually better in this case because
> > nvif_object_ioctl()'s size argument is u32:
> >=20
> > ret =3D nvif_object_ioctl(object, args, sizeof(*args) + size, NULL);
> >                                        ^^^^^^^^^^^^^^^^^^^^
> >=20
> > So that could wrap around, even though the allocation may not.
> >=20
> > Better yet, since "sizeof(*args) + size" is repeated 3 times in the
> > function, I'd recommend:
> >=20
> > 	...
> > 	u32 args_size;
> >=20
> > 	if (check_add_overflow(sizeof(*args), size, &args_size))
> > 		return -ENOMEM;
> > 	if (args_size > sizeof(stack)) {
> > 		if (!(args =3D kmalloc(args_size, GFP_KERNEL)))

trivia:

More typical kernel style would use separate alloc and test

		args =3D kmalloc(args_size, GFP_KERNEL);
		if (!args)

> > 			return -ENOMEM;
> >          } else {
> >                  args =3D (void *)stack;
> >          }
> > 	...
> >          ret =3D nvif_object_ioctl(object, args, args_size, NULL);
> >=20
> > This will catch the u32 overflow to nvif_object_ioctl(), catch an
> > allocation underflow on 32-bits systems, and make the code more
> > readable. :)
> >=20
>=20
> Makes sense. I'll change that and send v2.
>=20
> Thanks,
> Guenter
>=20
>=20

