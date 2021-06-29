Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A583B7172
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A046E870;
	Tue, 29 Jun 2021 11:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362C789DFB;
 Tue, 29 Jun 2021 11:39:20 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id EDBD9C80062;
 Tue, 29 Jun 2021 13:39:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id I7QdrTSmtBys; Tue, 29 Jun 2021 13:39:18 +0200 (CEST)
Received: from [IPv6:2003:e3:7f39:4900:84eb:1779:dd70:1696]
 (p200300E37f39490084eB1779dd701696.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:84eb:1779:dd70:1696])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 735CDC80042;
 Tue, 29 Jun 2021 13:39:18 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 12/17] drm/uAPI: Add "preferred color format" drm
 property as setting for userspace
To: Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-13-wse@tuxedocomputers.com>
 <20210622101516.6a53831c@eldfell>
 <jIDQ2rRRMWlhDDPf08Z8xZlEE8HTBx7fHsylFdK0joSSFVyES8D444Giyiji9zbIm7dU4QpbsXZLvIDTbGW0wEoUWKsMEI4evizn0UdGMvM=@emersion.fr>
 <20210629141712.21f00c38@eldfell>
Message-ID: <6d8716e0-e68a-e7b7-a341-a7471c413e9c@tuxedocomputers.com>
Date: Tue, 29 Jun 2021 13:39:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141712.21f00c38@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 29.06.21 um 13:17 schrieb Pekka Paalanen:
> On Tue, 29 Jun 2021 08:12:54 +0000
> Simon Ser <contact@emersion.fr> wrote:
>
>> On Tuesday, June 22nd, 2021 at 09:15, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>>> yes, I think this makes sense, even if it is a property that one can't
>>> tell for sure what it does before hand.
>>>
>>> Using a pair of properties, preference and active, to ask for something
>>> and then check what actually worked is good for reducing the
>>> combinatorial explosion caused by needing to "atomic TEST_ONLY commit"
>>> test different KMS configurations. Userspace has a better chance of
>>> finding a configuration that is possible.
>>>
>>> OTOH, this has the problem than in UI one cannot tell the user in
>>> advance which options are truly possible. Given that KMS properties are
>>> rarely completely independent, and in this case known to depend on
>>> several other KMS properties, I think it is good enough to know after
>>> the fact.
>>>
>>> If a driver does not use what userspace prefers, there is no way to
>>> understand why, or what else to change to make it happen. That problem
>>> exists anyway, because TEST_ONLY commits do not give useful feedback
>>> but only a yes/no.  
>> By submitting incremental atomic reqs with TEST_ONLY (i.e. only changing one
>> property at a time), user-space can discover which property makes the atomic
>> commit fail.
> That works if the properties are independent of each other. Color
> range, color format, bpc and more may all be interconnected,
> allowing only certain combinations to work.
>
> If all these properties have "auto" setting too, then it would be
> possible to probe each property individually, but that still does not
> tell which combinations are valid.
>
> If you probe towards a certain configuration by setting the properties
> one by one, then depending on the order you pick the properties, you
> may come to a different conclusion on which property breaks the
> configuration.

My mind crossed another point that must be considered: When plugin in a Monitor a list of possible Resolutions+Framerate
combinations is created for xrandr and other userspace (I guess by atomic checks? but I don't know). During this drm
properties are already considered, which is no problem atm because as far as i can tell there is currently no drm
property that would make a certain Resolutions+Framerate combination unreachable that would be possible with everything
on default.

However for example forcing YCbCr420 encoding would limit the available resolutions (my screen for example only supports
YCbCr420 on 4k@60 and @50Hz and on no other resolution or frequency (native is 2560x1440@144Hz).

So would a "force color format" that does not get resetted on repluging/reenabling a monitor break the output, for
example, of an not updated xrandr, unaware of this new property?

>> I'm not a fan of this "preference" property approach. The only way to find out
>> whether it's possible to change the color format is to perform a user-visible
>> change (with a regular atomic commit) and check whether it worked
>> after-the-fact. This is unlike all other existing KMS properties.
> I agree. FWIW, "max bpc" exists already.
>
>> I'd much rather see a more general approach to fix this combinatorial explosion
>> than to add special-cases like this.
> What would you suggest?
>
> Maybe all properties should have an "auto" value in addition to the
> explicit no-negotiation values where at all possible?
>
> That might help probing each property individually with TEST_ONLY
> commits, but it says nothing about combinations.
>
> A feedback list perhaps? TEST_ONLY commit somehow returning a list of
> property/value tuples indicating what value the "auto" valued
> properties actually get?
>
> What should a kernel driver optimize for when determining "auto" values?
>
>
> Thanks,
> pq
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
