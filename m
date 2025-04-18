Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9083AA93EB2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 22:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B7810E171;
	Fri, 18 Apr 2025 20:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Tx9rN2u/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6038A10E171
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 20:15:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745007339; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=m+xGF99crS759iWSC/0HbndrdyOZ39WoR6M65UKVHTwTBPiP5R9OOycqCtrv09ojKNPPriD2DfZ/8dFJtfN5pyR1oCTOP+yODSRji6RlJn+Rgc2JMLWpUqmDTNkv1PRPYFXby5hIL+kZBxhOqaHpN58DE2UegR5XfmTcBT/aqXw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745007339;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xLB8xw6JsvA42VrDm77ZluMHEKchpBI69N/Mm7m5j78=; 
 b=UK3yXMNYGDaHGrLZSPpdMP+CkWm2P3mucV/svBDEOlvPj1xTiIzrCZOkNlpqIxtSSTjSmr9ehReHtBX9VxgkSSGIu9sNuO2pnmBUypp+Kn3+7FjQBEIeqZy+ZllwU+ikYQxAtD0O6/rf5JoK+wybf2gjrUgyrQJ+gbwk2xFA59Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745007339; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=xLB8xw6JsvA42VrDm77ZluMHEKchpBI69N/Mm7m5j78=;
 b=Tx9rN2u/Suw/snvacIO95cbIqen6DewTaWv6Qb22KkpWDMsbv3/qQGaX2pOvGwLJ
 7o84JUcIwL0HoyeUEo/d7UOYfkhEanUilHJJNS9iho5AAcePdb03nzDIaO3IJK0AH61
 Q6jUto6NRftjzKUUJW4x03BM17agNp9AibtIwu/Y=
Received: by mx.zohomail.com with SMTPS id 1745007338201768.2221916882789;
 Fri, 18 Apr 2025 13:15:38 -0700 (PDT)
Date: Fri, 18 Apr 2025 21:15:32 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 kernel@collabora.com, Liviu Dudau <liviu.dudau@arm.com>, 
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v9 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <talp23dokjtrzmwjoj3gvwoh5rvaf5txf3bsjpc5yqfdqabdhv@dex6idqtckci>
References: <20250418022710.74749-1-adrian.larumbe@collabora.com>
 <20250418022710.74749-5-adrian.larumbe@collabora.com>
 <20250418100454.788c9586@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418100454.788c9586@collabora.com>
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

Hi Boris,

On 18.04.2025 10:04, Boris Brezillon wrote:
> On Fri, 18 Apr 2025 03:27:07 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
> > +#ifdef CONFIG_DEBUG_FS
> > +static void
> > +panthor_gem_debugfs_format_flags(char flags_str[], int flags_len,
> > +				 const char * const names[], u32 name_count,
> > +				 u32 flags)
> > +{
> > +	bool first = true;
> > +	int offset = 0;
> > +
> > +#define ACC_FLAGS(...) \
> > +	({ \
> > +		offset += snprintf(flags_str + offset, flags_len - offset, ##__VA_ARGS__); \
> > +		if (offset == flags_len) \
> > +			return; \
> > +	})
>
> I tried applying, but checkpatch complains with:
>
> -:225: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
> #225: FILE: drivers/gpu/drm/panthor/panthor_gem.c:359:
> +#define ACC_FLAGS(...) \
> +	({ \
> +		offset += snprintf(flags_str + offset, flags_len - offset, ##__VA_ARGS__); \
> +		if (offset == flags_len) \
> +			return; \
> +	})
>
>
> and now I'm wondering why we even need to return early? Oh, and the
> check looks suspicious to: snprintf() returns the number of chars
> that would have been written if the destination was big enough, so
> the offset will actually be greater than flags_len if the formatted
> string doesn't fit.

I noticed this warning when running checkpatch myself, and while a return isn't strictly
necessary, I thought there was no point in going down the function when no more bytes
could be written into the format string because it's already full.

I did check the code for other locations where flow control is happening inside a macro
and found this:

#define group_queue_work(group, wname) \
	do { \
		group_get(group); \
		if (!queue_work((group)->ptdev->scheduler->wq, &(group)->wname ## _work)) \
			group_put(group); \
	} while (0)

although I'm not sure whether the do {} while (0) is right there to make the warning go away.

> snprintf() returns the number of chars
> that would have been written if the destination was big enough, so
> the offset will actually be greater than flags_len if the formatted
> string doesn't fit.

Good catch, I don't know why I thought snprintf() would print at most 'flags_len
- offset' bytes, and would return exactly that count at most too, rather than
throwing a hypothetical max value. Then maybe checking whether 'if (offset >=
flags_len)' would be enough ?


> There are a few other formatting issues reported by checkpatch
> --strict BTW.
>
> Unfortunately this led me to have a second look at these bits
> and I have a few more comments, sorry about that :-/.

> +
> +	ACC_FLAGS("%c", '(');

> Now that flags have their own columns, I'm not sure it makes sense
> surround them with parenthesis. That's even weird if we start running
> out of space, because there would be an open '(', a few flags,
> the last one being truncated, and no closing ')'. The other thing
> that's bothering me is the fact we don't know when not all flags
> have been displayed because of lack of space.
>
> > +
> > +	if (!flags)
> > +		ACC_FLAGS("%s", "none");
> > +
> > +	while (flags) {
> > +		u32 bit = fls(flags) - 1;
>
> I would probably print flags in bit position order, so ffs()
> instead of fls().
>
> > +		u32 idx = bit + 1;
>
> Why do you have a "+ 1" here? Feels like an off-by-one error to
> me.
>
> > +
> > +		if (!first)
> > +			ACC_FLAGS("%s", ",");
> > +
> > +		if (idx < name_count && names[idx])
> > +			ACC_FLAGS("%s", names[idx]);
> > +
> > +		first = false;
> > +		flags &= ~BIT(bit);
> > +	}
> > +
> > +	ACC_FLAGS("%c", ')');
> > +
> > +#undef ACC_FLAGS
> > +}
>
> How about something like that:
>
> static void
> panthor_gem_debugfs_format_flags(char *flags_str, u32 flags_str_len,
>                                  const char * const flag_names[],
>                                  u32 flag_name_count, u32 flags)
> {
> 	int offset = 0;
>
> 	if (!flags) {
>         	snprintf(flags_str, flags_str_len, "%s", "none");
> 		return;
> 	}
>
> 	while (flags) {
> 		const char *flag_name = "?";
> 		u32 flag = ffs(flags) - 1;
> 		int new_offset = offset;
>
> 		flags &= ~BIT(flag);
>
> 		if (flag < flag_name_count && flag_names[flag])
> 			flag_name = flag_names[flag];
>
> 		/* Print as much as we can. */
> 		new_offset += snprintf(flags_str + offset, flags_str_len - offset,
> 				       "%s%s", offset ? "," : "", flag_name);
>
> 		/* If we have flags remaining, check that we have enough space for
> 		 * the "...".
> 		 */
> 		if (flags)
> 			new_offset += strlen(",...");
>
> 		/* If we overflowed, replace what we've written by "..." and
> 		 * bail out.
> 		 */
> 		if (new_offset > flags_str_len) {
> 			snprintf(flags_str + offset, flags_str_len - offset,
> 				 "%s...", offset ? "," : "");
> 			return;
> 		}
>
> 		offset = new_offset;
>         }
> }

This looks good to me. However, I'm starting to wonder whether it makes sense to
try to come up with a very elaborate flag formatting scheme, because of two
reasons:

- It messes up with the output because we need to provide enough headroom in
case the flag set will increase in the future. This is not a big deal because
the debugfs file is meant to be parsed by UM tools, but ...

- In case we go over the space available to print flags, not printing the
remaining ones feels even less informative than printing let's say a hexadecimal
mask, because parsing tools would rather deal with no missing data than the
absence of human-readable flag names.

On top of that, I think, while these flags could be mostly of interest to parsing
tools, they'd be less so to someone casually peeking into the raw textual
output. I think they'd be mostly interested in the process which triggered
their creation, their size, virtual address in the VM, and above all their name
(potentially a very long one).

With all these things born in mind, I'd say we'd best just print a 32 bit mask
for both flag fields, for which we'd always know the exact span in bytes, and
then print all the available flag names in the debugfs file prelude for parsing
tools to pick up on.

Adrian Larumbe
