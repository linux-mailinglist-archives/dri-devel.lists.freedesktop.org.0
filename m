Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5658640B75C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 20:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4916E54C;
	Tue, 14 Sep 2021 18:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EC46E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 18:59:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="209195677"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="209195677"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:59:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="544240275"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:59:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list\:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Linus W <linus.walleij@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 04/15] drm/edid: Use new encoded panel id style for
 quirks matching
In-Reply-To: <CAD=FV=XgLcOBOOp9kgShE4+T8g8UZcO_Ff3hhAbGTyLkdE7HNA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210909210032.465570-1-dianders@chromium.org>
 <20210909135838.v4.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid>
 <87ee9r10qw.fsf@intel.com>
 <CAD=FV=XgLcOBOOp9kgShE4+T8g8UZcO_Ff3hhAbGTyLkdE7HNA@mail.gmail.com>
Date: Tue, 14 Sep 2021 21:59:23 +0300
Message-ID: <87y27zyodw.fsf@intel.com>
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

On Tue, 14 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Tue, Sep 14, 2021 at 11:16 AM Jani Nikula
> <jani.nikula@linux.intel.com> wrote:
>>
>> On Thu, 09 Sep 2021, Douglas Anderson <dianders@chromium.org> wrote:
>> > In the patch ("drm/edid: Allow the querying/working with the panel ID
>> > from the EDID") we introduced a different way of working with the
>> > panel ID stored in the EDID. Let's use this new way for the quirks
>> > code.
>> >
>> > Advantages of the new style:
>> > * Smaller data structure size. Saves 4 bytes per panel.
>> > * Iterate through quirks structure with just "==" instead of strncmp()
>> > * In-kernel storage is more similar to what's stored in the EDID
>> >   itself making it easier to grok that they are referring to the same
>> >   value.
>> >
>> > The quirk table itself is arguably a bit less readable in the new
>> > style but not a ton less and it feels like the above advantages make
>> > up for it.
>>
>> I suppose you could pass vendor as a string to EDID_QUIRK() to retain
>> better readability?
>
> I would love to, but I couldn't figure out how to do this and have it
> compile! Notably I need the compiler to be able to do math at compile
> time to compute the final u32 to store in the init data. I don't think
> the compiler can dereference strings (even constant strings) and do
> math on the result at compile time.

Ah, right.

>
> I _think_ you could make it work with four-character codes (only
> specifying 3 characters), AKA single-quoting something like 'AUO' but
> I think four-character codes are not dealt with in a standard enough
> way between compilers so they're not allowed in Linux.
>
> If you like it better, I could do something like this:
>
> #define ACR_CODE 'A', 'C', 'R'
> #define AUO_CODE 'A', 'U', 'O'
> ...
> ...
>
> ...then I could refer to the #defines...

Nah.

>
>
>> Just bikeshedding, really. ;)
>
> I'll take this comment (without any formal tags) as:
>
> * You've seen this patch (and the previous ones) and wouldn't object
> to it merging.
>
> * You're not planning on any deeper review / testing, so I shouldn't
> wait for more stuff from you before merging. Please yell if this is
> not the case. I'm happy to wait but I don't want to wait if no further
> review is planned.

I have now reviewed the ones where my review is relevant, and certainly
don't expect me to comment on the rest. ;)

BR,
Jani.

>
>
> In general I'm still planning to give this series at least another
> week for comments before merging. ${SUBJECT} patch also is the only
> one lacking any type of Review / Ack tags so I'll see if I can find
> someone to give it something before merging, too.
>
>
> -Doug

-- 
Jani Nikula, Intel Open Source Graphics Center
