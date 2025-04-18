Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3314FA93424
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 10:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33D710E00E;
	Fri, 18 Apr 2025 08:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WrUezZM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53DC10E00E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744963499;
 bh=51VVbUPvsi11hGxYnn3P1u8zo52LPozBe43N+e9Y/WA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WrUezZM/A1MhnO0l6vDsxXGcplIXIAInqPErdjLDT/dylasF3u5UzKzN3H1BvCkdJ
 aND6n5qqdc9iEZG/NVsCsiNOF7MDYzy6hHnBsGr+Gklk/2sr2BqtTKpcS0PC9cIcxQ
 nJIPdrVYnxtJa4UyutWZeFq3M9mFtKI8oW5x7Drcoetdv+LD1dqorwvObuJGUab2+l
 pDh2LZNo6QOymIe2mHT/l7scpa/UKn8R28uXM5fsud4y5idmY8Uv5HRk6TO+qE3sJv
 dBIZLmUrq9wj9yTWeEWRSuCiHOu6fM945ToWufn7AZ61bgb6601Q48e0JP2B7mF+hT
 ZUSwl+QipwPZA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 958DC17E08E3;
 Fri, 18 Apr 2025 10:04:58 +0200 (CEST)
Date: Fri, 18 Apr 2025 10:04:54 +0200
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
Message-ID: <20250418100454.788c9586@collabora.com>
In-Reply-To: <20250418022710.74749-5-adrian.larumbe@collabora.com>
References: <20250418022710.74749-1-adrian.larumbe@collabora.com>
 <20250418022710.74749-5-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Fri, 18 Apr 2025 03:27:07 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> +#ifdef CONFIG_DEBUG_FS
> +static void
> +panthor_gem_debugfs_format_flags(char flags_str[], int flags_len,
> +				 const char * const names[], u32 name_count,
> +				 u32 flags)
> +{
> +	bool first =3D true;
> +	int offset =3D 0;
> +
> +#define ACC_FLAGS(...) \
> +	({ \
> +		offset +=3D snprintf(flags_str + offset, flags_len - offset, ##__VA_AR=
GS__); \
> +		if (offset =3D=3D flags_len) \
> +			return; \
> +	})

I tried applying, but checkpatch complains with:

-:225: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements=
 should be avoided
#225: FILE: drivers/gpu/drm/panthor/panthor_gem.c:359:
+#define ACC_FLAGS(...) \
+	({ \
+		offset +=3D snprintf(flags_str + offset, flags_len - offset, ##__VA_ARGS=
__); \
+		if (offset =3D=3D flags_len) \
+			return; \
+	})

and now I'm wondering why we even need to return early? Oh, and the
check looks suspicious to: snprintf() returns the number of chars
that would have been written if the destination was big enough, so
the offset will actually be greater than flags_len if the formatted
string doesn't fit.

There are a few other formatting issues reported by checkpatch
--strict BTW.

Unfortunately this led me to have a second look at these bits
and I have a few more comments, sorry about that :-/.

> +
> +	ACC_FLAGS("%c", '(');

Now that flags have their own columns, I'm not sure it makes sense
surround them with parenthesis. That's even weird if we start running
out of space, because there would be an open '(', a few flags,
the last one being truncated, and no closing ')'. The other thing
that's bothering me is the fact we don't know when not all flags
have been displayed because of lack of space.


> +
> +	if (!flags)
> +		ACC_FLAGS("%s", "none");
> +
> +	while (flags) {
> +		u32 bit =3D fls(flags) - 1;

I would probably print flags in bit position order, so ffs()
instead of fls().

> +		u32 idx =3D bit + 1;

Why do you have a "+ 1" here? Feels like an off-by-one error to
me.

> +
> +		if (!first)
> +			ACC_FLAGS("%s", ",");
> +
> +		if (idx < name_count && names[idx])
> +			ACC_FLAGS("%s", names[idx]);
> +
> +		first =3D false;
> +		flags &=3D ~BIT(bit);
> +	}
> +
> +	ACC_FLAGS("%c", ')');
> +
> +#undef ACC_FLAGS
> +}

How about something like that:

static void
panthor_gem_debugfs_format_flags(char *flags_str, u32 flags_str_len,
                                 const char * const flag_names[],
                                 u32 flag_name_count, u32 flags)
{
	int offset =3D 0;

	if (!flags) {
        	snprintf(flags_str, flags_str_len, "%s", "none");
		return;
	}

	while (flags) {
		const char *flag_name =3D "?";
		u32 flag =3D ffs(flags) - 1;
		int new_offset =3D offset;

		flags &=3D ~BIT(flag);

		if (flag < flag_name_count && flag_names[flag])
			flag_name =3D flag_names[flag];

		/* Print as much as we can. */
		new_offset +=3D snprintf(flags_str + offset, flags_str_len - offset,
				       "%s%s", offset ? "," : "", flag_name);

		/* If we have flags remaining, check that we have enough space for
		 * the "...".
		 */
		if (flags)
			new_offset +=3D strlen(",...");

		/* If we overflowed, replace what we've written by "..." and
		 * bail out.
		 */
		if (new_offset > flags_str_len) {
			snprintf(flags_str + offset, flags_str_len - offset,
				 "%s...", offset ? "," : "");
			return;
		}

		offset =3D new_offset;
        }
}
