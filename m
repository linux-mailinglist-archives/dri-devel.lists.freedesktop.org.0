Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78D95073C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 16:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BEA10E366;
	Tue, 13 Aug 2024 14:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYP9tGgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1A710E366
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723558312; x=1755094312;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=jcyO1t/F6QSCuTMPpYmyG4FhhEPbx9Z1SU3Jy9ePKow=;
 b=AYP9tGgGpYv5apB+5eM9V62/vZUwuGLVYIciVk21TH1A00p1j1+OEnjN
 tvTAW795lFNENx54pKGqQKz5rHXM2mbErjOFwLaoF07E0mzqwbI3KlJFj
 l4+1yXwnyjMGPa/AzErkhHneB8AutlP0Y9AS2of3KSaHE2vQWeBPnZaHt
 h+NflicjkVU0G4aJg+8j4KsT7VCcgGhHLjQsYBFCSGHwzXpU3IJSCm6Hn
 7ZKxYTpcH929gQJ9WSHlqt3GYQxJDuMb74+UJMecXd7/DQxXDK1hhdhUq
 9XcsZaIv8gJpa4wQLGyTMRQj0HityLdnyr9Bl2Qy2P+/zWimTS13fVjGM Q==;
X-CSE-ConnectionGUID: FWolp6QwRVuKFHks2/5zag==
X-CSE-MsgGUID: FfxuwntNT3Ca67E5+LE0/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33128718"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="33128718"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 07:11:51 -0700
X-CSE-ConnectionGUID: JxP01tMkQtaJqIAoHGTDBQ==
X-CSE-MsgGUID: r3SwNOPFS2a5ngLhX9Tmiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58764819"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 07:11:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Bjorn Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Danilo
 Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v6 2/4] drm/rect: Add drm_rect_overlap()
In-Reply-To: <87frr924nj.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812123147.81356-1-jfalempe@redhat.com>
 <20240812123147.81356-3-jfalempe@redhat.com> <87sev926na.fsf@intel.com>
 <60e55a9d-70bb-45d1-ac97-e4f6f6ffa9a9@redhat.com>
 <87frr924nj.fsf@intel.com>
Date: Tue, 13 Aug 2024 17:11:37 +0300
Message-ID: <87mslgzf52.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 12 Aug 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 12 Aug 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 12/08/2024 15:49, Jani Nikula wrote:
>>> On Mon, 12 Aug 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>> Check if two rectangles overlap.
>>>> It's a bit similar to drm_rect_intersect() but this won't modify
>>>> the rectangle.
>>>> Simplifies a bit drm_panic.
>>> 
>>> Based on the name, I'd expect drm_rect_overlap() to return true for
>>> *any* overlap, while this one seems to mean if one rectangle is
>>> completely within another, with no adjacent borders.
>>
>> It's what I intended, but I may have messed up the formula.
>
> Hmm, then I may have messed up the review. :)

Yeah, my bad, sorry for the noise.

I think I was thrown off by the comparisons mixing r1 and r2 as the
first operand. Something like this might have been easier for *me* to
parse, but not sure if it's worth changing anything:

return (a->x1 < b->x2 && a->x2 > b->x1 &&
        a->y1 < b->y2 && a->y2 > b->y1);


BR,
Jani.


>
> Gotta run now, but I'll get back.
>
> BR,
> Jani.
>
>
>
>>> 
>>> I'd expect a drm_rect_overlap() to return true for this:
>>> 
>>>   +-------+
>>>   |   +---+---+
>>>   |   |       |
>>>   +---+       |
>>>       |       |
>>>       +-------+
>>
>> if r1 is the top left rectangle, you've got:
>>
>> r1->x2 > r2->x1   => true
>> r2->x2 > r1->x1   => true
>> r1->y2 > r2->y1   => true
>> r2->y2 > r1->y1   => true
>>
>> So they count as overlap.
>>
>> Checking in stackoverflow, they use the same formula:
>> https://stackoverflow.com/questions/306316/determine-if-two-rectangles-overlap-each-other
>>
>>> 
>>> While this seems to be required instead:
>>> 
>>>   +-------+
>>>   | +---+ |
>>>   | |   | |
>>>   | +---+ |
>>>   +-------+
>>> 
>>> 
>>> IOW, I find the name misleading.
>>> 
>>> BR,
>>> Jani.
>>> 
>>> 
>>>>
>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_panic.c |  3 +--
>>>>   include/drm/drm_rect.h      | 15 +++++++++++++++
>>>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>>>> index 0a047152f88b8..59fba23e5fd7a 100644
>>>> --- a/drivers/gpu/drm/drm_panic.c
>>>> +++ b/drivers/gpu/drm/drm_panic.c
>>>> @@ -529,8 +529,7 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>>>>   	/* Fill with the background color, and draw text on top */
>>>>   	drm_panic_fill(sb, &r_screen, bg_color);
>>>>   
>>>> -	if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
>>>> -	    logo_width <= sb->width && logo_height <= sb->height) {
>>>> +	if (!drm_rect_overlap(&r_logo, &r_msg)) {
>>>>   		if (logo_mono)
>>>>   			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
>>>>   				       fg_color);
>>>> diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
>>>> index 73fcb899a01da..7bafde747d560 100644
>>>> --- a/include/drm/drm_rect.h
>>>> +++ b/include/drm/drm_rect.h
>>>> @@ -238,6 +238,21 @@ static inline void drm_rect_fp_to_int(struct drm_rect *dst,
>>>>   		      drm_rect_height(src) >> 16);
>>>>   }
>>>>   
>>>> +/**
>>>> + * drm_rect_overlap - Check if two rectangles overlap
>>>> + * @r1: first rectangle
>>>> + * @r2: second rectangle
>>>> + *
>>>> + * RETURNS:
>>>> + * %true if the rectangles overlap, %false otherwise.
>>>> + */
>>>> +static inline bool drm_rect_overlap(const struct drm_rect *r1,
>>>> +				    const struct drm_rect *r2)
>>>> +{
>>>> +	return (r1->x2 > r2->x1 && r2->x2 > r1->x1 &&
>>>> +		r1->y2 > r2->y1 && r2->y2 > r1->y1);
>>>> +}
>>>> +
>>>>   bool drm_rect_intersect(struct drm_rect *r, const struct drm_rect *clip);
>>>>   bool drm_rect_clip_scaled(struct drm_rect *src, struct drm_rect *dst,
>>>>   			  const struct drm_rect *clip);
>>> 
>>

-- 
Jani Nikula, Intel
