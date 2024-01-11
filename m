Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC9882B84A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 00:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF26510E9CD;
	Thu, 11 Jan 2024 23:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A966810E9CD;
 Thu, 11 Jan 2024 23:54:24 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id ED4E52FC004D;
 Fri, 12 Jan 2024 00:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1705017262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3IfLCse3UJcBLmJvnzPNY6fFxZA/lm8oP7csgqnKhM=;
 b=U7gPxWWbUFgN6lR9PsCx7iFIS7VaYhSRtvW7k9kPEBaiN4r3yiJwU4qffqhS9RcYXp3ZN/
 mHzpt5VeY5o7vPpbpXc+ErHgvQLLYXqpY0PuH9eMMmC/6gUpiGjAWAl7mItLea8tk/IXDj
 hO7qEu4WW/MNPC5ofwyVgOofQIJu00Q=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <2a74b609-1f75-4179-8e63-7825a0d39166@tuxedocomputers.com>
Date: Fri, 12 Jan 2024 00:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/amd/display: Add handling for new "active color
 format" property
To: Andri Yngvason <andri@yngvason.is>
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-4-andri@yngvason.is>
 <ZZ57Nl3CnRMPcfbj@phenom.ffwll.local>
 <CAFNQBQzo17cK4M-S=Mje8Lxub9Y74xFGj7iEq57vKJr47oiz5Q@mail.gmail.com>
 <CAKMK7uGhMCwbztGdEmG4gFgpyhw6j-JFow-AaprFxcX710=qXA@mail.gmail.com>
 <67808818-ee34-4d04-ad90-cd5c6eb9bb26@tuxedocomputers.com>
 <CAFNQBQyg+yXSJRtZtyHXMfyBOYrQpU0R0XFUJLcof9rakrBYQA@mail.gmail.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <CAFNQBQyg+yXSJRtZtyHXMfyBOYrQpU0R0XFUJLcof9rakrBYQA@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 10.01.24 um 18:15 schrieb Andri Yngvason:
> Hi Werner,
>
> mið., 10. jan. 2024 kl. 13:14 skrifaði Werner Sembach <wse@tuxedocomputers.com>:
>> Hi,
>>
>> Am 10.01.24 um 14:09 schrieb Daniel Vetter:
>>> On Wed, 10 Jan 2024 at 13:53, Andri Yngvason <andri@yngvason.is> wrote:
>>>> mið., 10. jan. 2024 kl. 11:10 skrifaði Daniel Vetter <daniel@ffwll.ch>:
>>>>> On Tue, Jan 09, 2024 at 06:11:00PM +0000, Andri Yngvason wrote:
>>>>>> +     /* Extract information from crtc to communicate it to userspace as connector properties */
>>>>>> +     for_each_new_connector_in_state(state, connector, new_con_state, i) {
>>>>>> +             struct drm_crtc *crtc = new_con_state->crtc;
>>>>>> +             struct dc_stream_state *stream;
>>>>>> +
>>>>>> +             if (crtc) {
>>>>>> +                     new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>>>>>> +                     dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>>>>>> +                     stream = dm_new_crtc_state->stream;
>>>>>> +
>>>>>> +                     if (stream) {
>>>>>> +                             drm_connector_set_active_color_format_property(connector,
>>>>>> +                                     convert_dc_pixel_encoding_into_drm_color_format(
>>>>>> +                                             dm_new_crtc_state->stream->timing.pixel_encoding));
>>>>>> +                     }
>>>>>> +             } else {
>>>>>> +                     drm_connector_set_active_color_format_property(connector, 0);
>>>>> Just realized an even bigger reason why your current design doesn't work:
>>>>> You don't have locking here.
>>>>>
>>>>> And you cannot grab the required lock, which is
>>>>> drm_dev->mode_config.mutex, because that would result in deadlocks. So
>>>>> this really needs to use the atomic state based design I've described.
>>>>>
>>>> Maybe we should just drop "actual color format" and instead fail the
>>>> modeset if the "preferred color format" property cannot be satisfied?
>>>> It seems like the simplest thing to do here, though it is perhaps less
>>>> convenient for userspace. In that case, the "preferred color format"
>>>> property should just be called "color format".
>>> Yeah that's more in line with how other atomic properties work. This
>>> way userspace can figure out what works with a TEST_ONLY commit too.
>>> And for this to work you probably want to have an "automatic" setting
>>> too.
>>> -Sima
>> The problem with TEST_ONLY probing is that color format settings are
>> interdependent: https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_966634
>>
>> So changing any other setting may require every color format to be TEST_ONLY
>> probed again.
>>
> If we put a bit map containing the possible color formats into
> drm_mode_mode_info (I'm thinking that it could go into flags), we'd be
> able to eliminate a bunch of combinations early on. Do you think that
> would make things more bearable?

That would eliminate some, but note that for example YCBCR444 needs a faster 
pixel clock then YCBCR420, so it's interdependent with everything else that 
changes the required pixel clock like bpc, resolution and refresh rate.

So the config space is n-dimensional with no "right angle box" clearly 
separating working from non working combinations.

But I just had the idea:

Currently in KDE and Gnome UI you first select the resolution, to then wee what 
refresh rates are available. So I guess this concept could be appended to color 
properties -> Define a sequence for the different properties to be applied 
across all drivers and as soon as you select one, the next property in the 
sequence is TEST_ONLYed.

e.g.:

1. Select resolution -> Available refresh rates are updated

2. Select refresh rate -> Available color formats are updated

3. Select color format -> Available bpc are updated

etc.

So you can't select a bpc that doesn't fit your current color format. Changing 
color format can change the available bpc. One maybe counter intuitive thing 
here is that color format "auto" might not have all bpc settings available, as 
auto will for example actually be RGB which has higher pixel clock requirements 
then ycbcr420. And in this model, color format is always decided first. Or vice 
versa if bpc is decided to be before color format in the sequence.

>
> I'm thinking, something like this:
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 128d09138ceb3..59980803cb89e 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -124,6 +124,13 @@ extern "C" {
>   #define  DRM_MODE_FLAG_PIC_AR_256_135 \
>                          (DRM_MODE_PICTURE_ASPECT_256_135<<19)
>
> +/* Possible color formats (4 bits) */
> +#define DRM_MODE_FLAG_COLOR_FORMAT_MASK (0x0f << 22)
> +#define DRM_MODE_FLAG_COLOR_FORMAT_RGB (1 << 22)
> +#define DRM_MODE_FLAG_COLOR_FORMAT_YCBCR444 (1 << 23)
> +#define DRM_MODE_FLAG_COLOR_FORMAT_YCBCR422 (1 << 24)
> +#define DRM_MODE_FLAG_COLOR_FORMAT_YCBCR420 (1 << 25)
> +
>   #define  DRM_MODE_FLAG_ALL     (DRM_MODE_FLAG_PHSYNC |         \
>                                   DRM_MODE_FLAG_NHSYNC |         \
>                                   DRM_MODE_FLAG_PVSYNC |         \
> @@ -136,7 +143,8 @@ extern "C" {
>                                   DRM_MODE_FLAG_HSKEW |          \
>                                   DRM_MODE_FLAG_DBLCLK |         \
>                                   DRM_MODE_FLAG_CLKDIV2 |        \
> -                                DRM_MODE_FLAG_3D_MASK)
> +                                DRM_MODE_FLAG_3D_MASK |        \
> +                                DRM_MODE_FLAG_COLOR_FORMAT_MASK)
>
>   /* DPMS flags */
>   /* bit compatible with the xorg definitions. */
