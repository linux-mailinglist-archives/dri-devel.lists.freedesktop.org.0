Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830FF85784E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 10:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7507910E6CC;
	Fri, 16 Feb 2024 09:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YCzORuYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF6410E67E;
 Fri, 16 Feb 2024 09:00:22 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-128.elisa-laajakaista.fi
 [91.154.35.128])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56387564;
 Fri, 16 Feb 2024 10:00:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1708074017;
 bh=SkPF05zi1FFkC5mvRTPYwqGozbga3ft2n9Q6OzdOph0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YCzORuYAlZghv2vuK2qntd9dZivp26YGwNW4MEzYH6S7cjxtTmaFtqrx7WskQR7Pa
 YdbAqY4gN4QCDEqsJNsF6eWW3x89tjVVwFTdboNIIVNr0J9/Axlrck25Ds7xdYuDbC
 1vuKzmF2zc9fpnu+sYzC9oJWHvr87DgFv8BOeK3o=
Message-ID: <263c5e9b-d6fb-41a8-9d8a-84ea49eef51c@ideasonboard.com>
Date: Fri, 16 Feb 2024 11:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/tidss: Fix initial plane zpos values
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>,
 Marius Vlad <marius.vlad@collabora.com>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Devarsh Thakkar <devarsht@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Francesco Dolcini <francesco@dolcini.it>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Randolph Sapp <rs@ti.com>
References: <20240213-tidss-fixes-v1-0-d709e8dfa505@ideasonboard.com>
 <20240213-tidss-fixes-v1-1-d709e8dfa505@ideasonboard.com>
 <20240213110440.13af335a@eldfell>
 <bb8089cd-2a57-4ed0-a8bd-2140a89b0887@ideasonboard.com>
 <ZctCCCJORdDEaDl1@xpredator>
 <CAPj87rPpdOQLLu5oGVfqDUh0_j9NXqc3XgZe5=tcOzUfVoeeqg@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <CAPj87rPpdOQLLu5oGVfqDUh0_j9NXqc3XgZe5=tcOzUfVoeeqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 13/02/2024 13:39, Daniel Stone wrote:
> Hi,
> 
> On Tue, 13 Feb 2024 at 10:18, Marius Vlad <marius.vlad@collabora.com> wrote:
>> On Tue, Feb 13, 2024 at 11:57:59AM +0200, Tomi Valkeinen wrote:
>>> I haven't. I'm quite unfamiliar with Weston, and Randolph from TI (cc'd) has
>>> been working on the Weston side of things. I also don't know if there's
>>> something TI specific here, as the use case is with non-mainline GPU drivers
>>> and non-mainline Mesa. I should have been a bit clearer in the patch
>>> description, as I didn't mean that upstream Weston has a bug (maybe it has,
>>> maybe it has not).
> 
> Don't worry about it. We've had bugs in the past and I'm sure we'll
> have more. :) Either way, it's definitely better to have the kernel
> expose sensible behaviour rather than weird workarounds, unless
> they've been around for so long that they're basically baked into ABI.

Yeah, that's always a worry. I do hope that no user of tidss expects the 
plane zpos values to be the current funny ones. But we'll probably find 
out when I merge this =).

>>> The issue seen is that when Weston decides to use DRM planes for
>>> composition, the plane zpositions are not configured correctly (or at all?).
>>> Afaics, this leads to e.g. weston showing a window with a DRM "overlay"
>>> plane that is behind the "primary" root plane, so the window is not visible.
>>> And as Weston thinks that the area supposedly covered by the overlay plane
>>> does not need to be rendered on the root plane, there are also artifacts on
>>> that area.
>>>
>>> Also, the Weston I used is a bit older one (10.0.1), as I needed to go back
>>> in my buildroot versions to get all that non-mainline GPU stuff compiled and
>>> working. A more recent Weston may behave differently.
>>
>> Right after Weston 10, we had a few minor changes related to the
>> zpos-sorting list of planes and how we parse the plan list without having
>> a temporary zpos ordered list to pick planes from.
>>
>> And there's another fix for missing out to set out the zpos for scanout
>> to the minimum available - which seems like a good candidate to explain
>> what happens in the issue described above. So if trying Weston again,
>> please try with at least Weston 12, which should have those changes
>> in.
> 
> Specifically, you probably want commits 4cde507be6a1 and 58dde0e0c000.
> I think the window of breakage was small enough that - assuming either
> those commits or an upgrade to Weston 12/13 fixes it - we can just ask
> people to upgrade to a fixed Weston.
> 
>>> Presuming this is not related to any TI specific code, I guess it's a
>>> regression in the sense that at some point Weston added the support to use
>>> planes for composition, so previously with only a single plane per display
>>> there was no issue.
> 
> That point was 12 years ago, so not that novel. ;)

Hmm, so do I understand it right, the plane code from 12 years back 
supposedly works ok, but somewhere around Weston 10 something broke, but 
was fixed with the commits you mention above?

  Tomi

