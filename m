Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A837E396778
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 19:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36006E23F;
	Mon, 31 May 2021 17:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6F76E1BA;
 Mon, 31 May 2021 17:55:07 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 2AB30C800EC;
 Mon, 31 May 2021 19:55:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 7-hu257Dcefd; Mon, 31 May 2021 19:55:05 +0200 (CEST)
Received: from [IPv6:2003:e3:7f2e:2a00:27e7:7520:b2ba:eb7b]
 (p200300e37F2E2a0027e77520B2BaeB7b.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f2e:2a00:27e7:7520:b2ba:eb7b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id BF2BDC800E9;
 Mon, 31 May 2021 19:55:05 +0200 (CEST)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
 <YJvSUCCPvWz7y/r7@intel.com> <20210519123405.4d3218a7@eldfell>
 <YKUXbwkUIwvO/OqK@intel.com>
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <bb22dc43-b0ce-86db-0bc0-91a8eff34b27@tuxedocomputers.com>
Date: Mon, 31 May 2021 19:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKUXbwkUIwvO/OqK@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.21 um 15:49 schrieb Ville Syrj=C3=A4l=C3=A4:
> On Wed, May 19, 2021 at 12:34:05PM +0300, Pekka Paalanen wrote:
>> On Wed, 12 May 2021 16:04:16 +0300
>> Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
>>
>>> On Wed, May 12, 2021 at 02:06:56PM +0200, Werner Sembach wrote:
>>>> Hello,
>>>>
>>>> In addition to the existing "max bpc", and "Broadcast RGB/output_csc=
" drm properties I propose 4 new properties:
>>>> "preferred pixel encoding", "active color depth", "active color rang=
e", and "active pixel encoding"
>>>>
>>>>
>>>> Motivation:
>>>>
>>>> Current monitors have a variety pixel encodings available: RGB, YCbC=
r 4:4:4, YCbCr 4:2:2, YCbCr 4:2:0.
>>>>
>>>> In addition they might be full or limited RGB range and the monitors=
 accept different bit depths.
>>>>
>>>> Currently the kernel driver for AMD and Intel GPUs automatically con=
figure the color settings automatically with little
>>>> to no influence of the user. However there are several real world sc=
enarios where the user might disagree with the
>>>> default chosen by the drivers and wants to set his or her own prefer=
ence.
>>>>
>>>> Some examples:
>>>>
>>>> 1. While RGB and YCbCr 4:4:4 in theory carry the same amount of colo=
r information, some screens might look better on one
>>>> than the other because of bad internal conversion. The driver curren=
tly however has a fixed default that is chosen if
>>>> available (RGB for Intel and YCbCr 4:4:4 for AMD). The only way to c=
hange this currently is by editing and overloading
>>>> the edid reported by the monitor to the kernel.
>>>>
>>>> 2. RGB and YCbCr 4:4:4 need a higher port clock then YCbCr 4:2:0. So=
me hardware might report that it supports the higher
>>>> port clock, but because of bad shielding on the PC, the cable, or th=
e monitor the screen cuts out every few seconds when
>>>> RGB or YCbCr 4:4:4 encoding is used, while YCbCr 4:2:0 might just wo=
rk fine without changing hardware. The drivers
>>>> currently however always default to the "best available" option even=
 if it might be broken.
>>>>
>>>> 3. Some screens natively only supporting 8-bit color, simulate 10-Bi=
t color by rapidly switching between 2 adjacent
>>>> colors. They advertise themselves to the kernel as 10-bit monitors b=
ut the user might not like the "fake" 10-bit effect
>>>> and prefer running at the native 8-bit per color.
>>>>
>>>> 4. Some screens are falsely classified as full RGB range wile they a=
ctually use limited RGB range. This results in
>>>> washed out colors in dark and bright scenes. A user override can be =
helpful to manually fix this issue when it occurs.
>>>>
>>>> There already exist several requests, discussion, and patches regard=
ing the thematic:
>>>>
>>>> - https://gitlab.freedesktop.org/drm/amd/-/issues/476
>>>>
>>>> - https://gitlab.freedesktop.org/drm/amd/-/issues/1548
>>>>
>>>> - https://lkml.org/lkml/2021/5/7/695
>>>>
>>>> - https://lkml.org/lkml/2021/5/11/416
>>>>
>> ...
>>
>>>> Adoption:
>>>>
>>>> A KDE dev wants to implement the settings in the KDE settings GUI:
>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_912370
>>>>
>>>> Tuxedo Computers (my employer) wants to implement the settings deskt=
op environment agnostic in Tuxedo Control Center. I
>>>> will start work on this in parallel to implementing the new kernel c=
ode. =20
>>> I suspect everyone would be happier to accept new uapi if we had
>>> multiple compositors signed up to implement it.
>> I think having Weston support for these would be good, but for now it
>> won't be much of an UI: just weston.ini to set, and the log to see wha=
t
>> happened.
>>
>> However, knowing what happened is going to be important for color
>> calibration auditing:
>> https://gitlab.freedesktop.org/wayland/weston/-/issues/467
>>
>> Yes, please, very much for read-only properties for the feedback part.=

>> Properties that both userspace and kernel will write are hard to deal
>> with in general.
>>
>> Btw. "max bpc" I can kind of guess that conversion from framebuffer
>> format to the wire bpc happens automatically and only as the final
>> step,
> Well, there could be dithering and whatnot also involved. So it's
> not super well specified atm either.
>
>> but "Broadcast RGB" is more complicated: is the output from the
>> abstract pixel pipeline sent as-is and "Broadcast RGB" is just another=

>> inforframe bit to the monitor, or does "Broadcast RGB" setting actuall=
y
>> change what happens in the pixel pipeline *and* set infoframe bits?
> It does indeed compress the actual pixel data. There was once a patch
> porposed to introduce a new enum value that only sets the infoframe and=

> thus would allow userspace to pass through already limited range data.
> Shouldn't be hard to resurrect that if needed.

For the time being I try to keep the functionality of Broadcast RGB the s=
ame and just port it over to AMDGPU, but i
haven't looked into it in detail yet.

>
>> My vague recollection is that framebuffer was always assumed to be in
>> full range, and then if "Broadcast RGB" was set to limited range, the
>> driver would mangle the pixel pipeline to convert from full to limited=

>> range. This means that it would be impossible to have limited range
>> data in a framebuffer, or there might be a double-conversion by
>> userspace programming a LUT for limited->full and then the driver
>> adding full->limited. I'm also confused how full/limited works when
>> framebuffer is in RGB/YCbCr and the monitor wire format is in RGB/YCbC=
r
>> and there may be RGB->YCbCR or YCbCR->RGB conversions going on - or
>> maybe even FB YCbCR -> RGB -> DEGAMMA -> CTM -> GAMMA -> YCbCR.
>>
>> I wish someone drew a picture of the KMS abstract pixel pipeline with
>> all the existing KMS properties in it. :-)
> Here's an ugly one for i915:
>
>     (input RGB vs. YCbCr?)
> [FB] -> [YCbCr?] -> [YCbCr->RGB conversion     ] -> [plane blending] ->=
 ...
>       |             [YCbCr color range/encoding] |
>       \ [RGB?] ----------------------------------/
>
>                                            (output RGB limited vs. RGB =
full vs. YCbCr?)
> ... -> [DEGAMMA_LUT] -> [CTM] -> [GAMMA_LUT] -> [YCbCr?] -> [RGB->YCbCr=
 conversion      ] -> [to port]
>                                               |             [always BT.=
709/limited range]
>                                               \ [RGB?] -> ...
>
> ... -> [RGB passthrough             ] -> [to port]
>      | [Broadcast RGB=3Dfull or       ]
>      | [Broadcast RGB=3Dauto + IT mode]
>      |
>      \ [RGB full->limited conversion] -> [to port]
>        [Broadcast RGB=3Dlimited or    ]
>        [Broadcast RGB=3Dauto + CE mode]
>
> I guess having something like that in the docs would be nice. Not sure
> if there's a way to make something that looks decent for html/etc.
>

