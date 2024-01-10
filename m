Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B06E829B05
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 14:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1120F10E79E;
	Wed, 10 Jan 2024 13:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 307 seconds by postgrey-1.36 at gabe;
 Wed, 10 Jan 2024 13:14:22 UTC
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C2F10E7FF;
 Wed, 10 Jan 2024 13:14:22 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C562B2FC005B;
 Wed, 10 Jan 2024 14:14:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1704892461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3XXWzf6RfsompBPEpJXXqoA3QY72hJE9BCknBlltgU=;
 b=tFOiG5JGP63gUPxytuSaXh/9yy7SdS7kKoiE7F9gkO9wjO53+5d/H/jqPdNpMuqTjvGHft
 5DQe+5DPNJez8uLzSscCUnvJ3yoCroj6fr/rGUf0B+1bO27Wyr7h0rL9JcST9M0Q94BjTG
 ZJXjiUdQlmZjvUbgXnM+Tij+l93L6nA=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <67808818-ee34-4d04-ad90-cd5c6eb9bb26@tuxedocomputers.com>
Date: Wed, 10 Jan 2024 14:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/amd/display: Add handling for new "active color
 format" property
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Andri Yngvason <andri@yngvason.is>
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-4-andri@yngvason.is>
 <ZZ57Nl3CnRMPcfbj@phenom.ffwll.local>
 <CAFNQBQzo17cK4M-S=Mje8Lxub9Y74xFGj7iEq57vKJr47oiz5Q@mail.gmail.com>
 <CAKMK7uGhMCwbztGdEmG4gFgpyhw6j-JFow-AaprFxcX710=qXA@mail.gmail.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <CAKMK7uGhMCwbztGdEmG4gFgpyhw6j-JFow-AaprFxcX710=qXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 10.01.24 um 14:09 schrieb Daniel Vetter:
> On Wed, 10 Jan 2024 at 13:53, Andri Yngvason <andri@yngvason.is> wrote:
>> mið., 10. jan. 2024 kl. 11:10 skrifaði Daniel Vetter <daniel@ffwll.ch>:
>>> On Tue, Jan 09, 2024 at 06:11:00PM +0000, Andri Yngvason wrote:
>>>> +     /* Extract information from crtc to communicate it to userspace as connector properties */
>>>> +     for_each_new_connector_in_state(state, connector, new_con_state, i) {
>>>> +             struct drm_crtc *crtc = new_con_state->crtc;
>>>> +             struct dc_stream_state *stream;
>>>> +
>>>> +             if (crtc) {
>>>> +                     new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>>>> +                     dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>>>> +                     stream = dm_new_crtc_state->stream;
>>>> +
>>>> +                     if (stream) {
>>>> +                             drm_connector_set_active_color_format_property(connector,
>>>> +                                     convert_dc_pixel_encoding_into_drm_color_format(
>>>> +                                             dm_new_crtc_state->stream->timing.pixel_encoding));
>>>> +                     }
>>>> +             } else {
>>>> +                     drm_connector_set_active_color_format_property(connector, 0);
>>> Just realized an even bigger reason why your current design doesn't work:
>>> You don't have locking here.
>>>
>>> And you cannot grab the required lock, which is
>>> drm_dev->mode_config.mutex, because that would result in deadlocks. So
>>> this really needs to use the atomic state based design I've described.
>>>
>> Maybe we should just drop "actual color format" and instead fail the
>> modeset if the "preferred color format" property cannot be satisfied?
>> It seems like the simplest thing to do here, though it is perhaps less
>> convenient for userspace. In that case, the "preferred color format"
>> property should just be called "color format".
> Yeah that's more in line with how other atomic properties work. This
> way userspace can figure out what works with a TEST_ONLY commit too.
> And for this to work you probably want to have an "automatic" setting
> too.
> -Sima

The problem with TEST_ONLY probing is that color format settings are 
interdependent: https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_966634

So changing any other setting may require every color format to be TEST_ONLY 
probed again.

Greetings

Werner

