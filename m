Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2574A96250
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322BF10E542;
	Tue, 22 Apr 2025 08:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l66ke73c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACA010E542
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745311501;
 bh=TFNUnXhDe+l5cW2aDpz4oiWpjyRdFW3fpEV13zT27+A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l66ke73c+jJ2XMFJHm+CQ2fLrCjlk9IELtpGTUvO6396Dnza8HB2gSSktCZeZtJjm
 r1q3uHgjto9bf2pkNnyaey1PrCvgV49hrsfuRWxgqfUdIg6njQPBJru2ULhGP3j9dV
 izxk8aHe3FCJuVtiuQZnOb+j7hPY3HfZgUeKQADmGIu9+fL+A1McsFa1IZxmZTzXKl
 aeBo+n18ZRt5m5sfA3iV0ywo8Q7YCUvlz4+/f3mnS5RotySW7/+JOiWsxiRXSEFefv
 WMwHxTAdTVQeCZDwCvNO26B0c5UORZm012RsuAujzSYNznvtij9EFb8cvWJUct8knI
 f2I7echgm0/Uw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8639F17E0FF6;
 Tue, 22 Apr 2025 10:45:00 +0200 (CEST)
Date: Tue, 22 Apr 2025 10:44:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Liviu Dudau <liviu.dudau@arm.com>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v9 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250422104456.6fcca401@collabora.com>
In-Reply-To: <talp23dokjtrzmwjoj3gvwoh5rvaf5txf3bsjpc5yqfdqabdhv@dex6idqtckci>
References: <20250418022710.74749-1-adrian.larumbe@collabora.com>
 <20250418022710.74749-5-adrian.larumbe@collabora.com>
 <20250418100454.788c9586@collabora.com>
 <talp23dokjtrzmwjoj3gvwoh5rvaf5txf3bsjpc5yqfdqabdhv@dex6idqtckci>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Fri, 18 Apr 2025 21:15:32 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Hi Boris,
>=20
> On 18.04.2025 10:04, Boris Brezillon wrote:
> > On Fri, 18 Apr 2025 03:27:07 +0100
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> > =20
> > > +#ifdef CONFIG_DEBUG_FS
> > > +static void
> > > +panthor_gem_debugfs_format_flags(char flags_str[], int flags_len,
> > > +				 const char * const names[], u32 name_count,
> > > +				 u32 flags)
> > > +{
> > > +	bool first =3D true;
> > > +	int offset =3D 0;
> > > +
> > > +#define ACC_FLAGS(...) \
> > > +	({ \
> > > +		offset +=3D snprintf(flags_str + offset, flags_len - offset, ##__V=
A_ARGS__); \
> > > +		if (offset =3D=3D flags_len) \
> > > +			return; \
> > > +	}) =20
> >
> > I tried applying, but checkpatch complains with:
> >
> > -:225: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statem=
ents should be avoided
> > #225: FILE: drivers/gpu/drm/panthor/panthor_gem.c:359:
> > +#define ACC_FLAGS(...) \
> > +	({ \
> > +		offset +=3D snprintf(flags_str + offset, flags_len - offset, ##__VA_=
ARGS__); \
> > +		if (offset =3D=3D flags_len) \
> > +			return; \
> > +	})
> >
> >
> > and now I'm wondering why we even need to return early? Oh, and the
> > check looks suspicious to: snprintf() returns the number of chars
> > that would have been written if the destination was big enough, so
> > the offset will actually be greater than flags_len if the formatted
> > string doesn't fit. =20
>=20
> I noticed this warning when running checkpatch myself, and while a return=
 isn't strictly
> necessary, I thought there was no point in going down the function when n=
o more bytes
> could be written into the format string because it's already full.
>=20
> I did check the code for other locations where flow control is happening =
inside a macro
> and found this:
>=20
> #define group_queue_work(group, wname) \
> 	do { \
> 		group_get(group); \
> 		if (!queue_work((group)->ptdev->scheduler->wq, &(group)->wname ## _work=
)) \
> 			group_put(group); \
> 	} while (0)
>=20
> although I'm not sure whether the do {} while (0) is right there to make =
the warning go away.

No, the main difference is that it doesn't return behind the callers'
back which is what checkscript is complaining about, though using do {}
while(0) is usually preferred over ({}) when
you have nothing to return.

>=20
> > snprintf() returns the number of chars
> > that would have been written if the destination was big enough, so
> > the offset will actually be greater than flags_len if the formatted
> > string doesn't fit. =20
>=20
> Good catch, I don't know why I thought snprintf() would print at most 'fl=
ags_len
> - offset' bytes, and would return exactly that count at most too, rather =
than
> throwing a hypothetical max value. Then maybe checking whether 'if (offse=
t >=3D
> flags_len)' would be enough ?

It should.

>=20
>=20
> > There are a few other formatting issues reported by checkpatch
> > --strict BTW.
> >
> > Unfortunately this led me to have a second look at these bits
> > and I have a few more comments, sorry about that :-/. =20
>=20
> > +
> > +	ACC_FLAGS("%c", '('); =20
>=20
> > Now that flags have their own columns, I'm not sure it makes sense
> > surround them with parenthesis. That's even weird if we start running
> > out of space, because there would be an open '(', a few flags,
> > the last one being truncated, and no closing ')'. The other thing
> > that's bothering me is the fact we don't know when not all flags
> > have been displayed because of lack of space.
> > =20
> > > +
> > > +	if (!flags)
> > > +		ACC_FLAGS("%s", "none");
> > > +
> > > +	while (flags) {
> > > +		u32 bit =3D fls(flags) - 1; =20
> >
> > I would probably print flags in bit position order, so ffs()
> > instead of fls().
> > =20
> > > +		u32 idx =3D bit + 1; =20
> >
> > Why do you have a "+ 1" here? Feels like an off-by-one error to
> > me.
> > =20
> > > +
> > > +		if (!first)
> > > +			ACC_FLAGS("%s", ",");
> > > +
> > > +		if (idx < name_count && names[idx])
> > > +			ACC_FLAGS("%s", names[idx]);
> > > +
> > > +		first =3D false;
> > > +		flags &=3D ~BIT(bit);
> > > +	}
> > > +
> > > +	ACC_FLAGS("%c", ')');
> > > +
> > > +#undef ACC_FLAGS
> > > +} =20
> >
> > How about something like that:
> >
> > static void
> > panthor_gem_debugfs_format_flags(char *flags_str, u32 flags_str_len,
> >                                  const char * const flag_names[],
> >                                  u32 flag_name_count, u32 flags)
> > {
> > 	int offset =3D 0;
> >
> > 	if (!flags) {
> >         	snprintf(flags_str, flags_str_len, "%s", "none");
> > 		return;
> > 	}
> >
> > 	while (flags) {
> > 		const char *flag_name =3D "?";
> > 		u32 flag =3D ffs(flags) - 1;
> > 		int new_offset =3D offset;
> >
> > 		flags &=3D ~BIT(flag);
> >
> > 		if (flag < flag_name_count && flag_names[flag])
> > 			flag_name =3D flag_names[flag];
> >
> > 		/* Print as much as we can. */
> > 		new_offset +=3D snprintf(flags_str + offset, flags_str_len - offset,
> > 				       "%s%s", offset ? "," : "", flag_name);
> >
> > 		/* If we have flags remaining, check that we have enough space for
> > 		 * the "...".
> > 		 */
> > 		if (flags)
> > 			new_offset +=3D strlen(",...");
> >
> > 		/* If we overflowed, replace what we've written by "..." and
> > 		 * bail out.
> > 		 */
> > 		if (new_offset > flags_str_len) {
> > 			snprintf(flags_str + offset, flags_str_len - offset,
> > 				 "%s...", offset ? "," : "");
> > 			return;
> > 		}
> >
> > 		offset =3D new_offset;
> >         }
> > } =20
>=20
> This looks good to me. However, I'm starting to wonder whether it makes s=
ense to
> try to come up with a very elaborate flag formatting scheme, because of t=
wo
> reasons:
>=20
> - It messes up with the output because we need to provide enough headroom=
 in
> case the flag set will increase in the future. This is not a big deal bec=
ause
> the debugfs file is meant to be parsed by UM tools, but ...
>=20
> - In case we go over the space available to print flags, not printing the
> remaining ones feels even less informative than printing let's say a hexa=
decimal
> mask, because parsing tools would rather deal with no missing data than t=
he
> absence of human-readable flag names.
>=20
> On top of that, I think, while these flags could be mostly of interest to=
 parsing
> tools, they'd be less so to someone casually peeking into the raw textual
> output. I think they'd be mostly interested in the process which triggered
> their creation, their size, virtual address in the VM, and above all thei=
r name
> (potentially a very long one).
>=20
> With all these things born in mind, I'd say we'd best just print a 32 bit=
 mask
> for both flag fields, for which we'd always know the exact span in bytes,=
 and
> then print all the available flag names in the debugfs file prelude for p=
arsing
> tools to pick up on.

Yeah, I think I agree with you. The flag printing is messy as it is,
and if we're going to use a tool to parse the output, we're probably
better off with an hexadecimal value here.

Regards,

Boris
