Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D823383073
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007FF6E986;
	Mon, 17 May 2021 14:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7BA6E0F8;
 Mon, 17 May 2021 14:28:57 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 30BFEC800D5;
 Mon, 17 May 2021 16:28:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id igc_7ctTk_pN; Mon, 17 May 2021 16:28:55 +0200 (CEST)
Received: from [IPv6:2003:e3:7f46:6a00:49cc:a8cc:f41d:5272]
 (p200300e37f466a0049cca8ccF41D5272.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f46:6a00:49cc:a8cc:f41d:5272])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id A6182C800D4;
 Mon, 17 May 2021 16:28:55 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <ec482a3d-a6cd-870d-96a3-52a7ed9089fb@tuxedocomputers.com>
Date: Mon, 17 May 2021 16:28:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.05.21 um 14:06 schrieb Werner Sembach:
> Hello,
>
> In addition to the existing "max bpc", and "Broadcast RGB/output_csc" d=
rm properties I propose 4 new properties:
> "preferred pixel encoding", "active color depth", "active color range",=
 and "active pixel encoding"

As an alternative/additional to the feedback channels: Maybe the kernel s=
hould not only communicate resolutions and
refresh rates of available modes, but also color capabilities.

I tested with a monitor, for example, that had several 4k@60Hz modes/timi=
ngs offered by the edid, but only some of them
supported YCbCr 420.

>
> Motivation:
>
> Current monitors have a variety pixel encodings available: RGB, YCbCr 4=
:4:4, YCbCr 4:2:2, YCbCr 4:2:0.
>
> In addition they might be full or limited RGB range and the monitors ac=
cept different bit depths.
>
> Currently the kernel driver for AMD and Intel GPUs automatically config=
ure the color settings automatically with little
> to no influence of the user. However there are several real world scena=
rios where the user might disagree with the
> default chosen by the drivers and wants to set his or her own preferenc=
e.
>
> Some examples:
>
> 1. While RGB and YCbCr 4:4:4 in theory carry the same amount of color i=
nformation, some screens might look better on one
> than the other because of bad internal conversion. The driver currently=
 however has a fixed default that is chosen if
> available (RGB for Intel and YCbCr 4:4:4 for AMD). The only way to chan=
ge this currently is by editing and overloading
> the edid reported by the monitor to the kernel.
>
> 2. RGB and YCbCr 4:4:4 need a higher port clock then YCbCr 4:2:0. Some =
hardware might report that it supports the higher
> port clock, but because of bad shielding on the PC, the cable, or the m=
onitor the screen cuts out every few seconds when
> RGB or YCbCr 4:4:4 encoding is used, while YCbCr 4:2:0 might just work =
fine without changing hardware. The drivers
> currently however always default to the "best available" option even if=
 it might be broken.
>
> 3. Some screens natively only supporting 8-bit color, simulate 10-Bit c=
olor by rapidly switching between 2 adjacent
> colors. They advertise themselves to the kernel as 10-bit monitors but =
the user might not like the "fake" 10-bit effect
> and prefer running at the native 8-bit per color.
>
> 4. Some screens are falsely classified as full RGB range wile they actu=
ally use limited RGB range. This results in
> washed out colors in dark and bright scenes. A user override can be hel=
pful to manually fix this issue when it occurs.
>
> There already exist several requests, discussion, and patches regarding=
 the thematic:
>
> - https://gitlab.freedesktop.org/drm/amd/-/issues/476
>
> - https://gitlab.freedesktop.org/drm/amd/-/issues/1548
>
> - https://lkml.org/lkml/2021/5/7/695
>
> - https://lkml.org/lkml/2021/5/11/416
>
>
> Current State:
>
> I only know bits about the Intel i915 and AMD amdgpu driver. I don't kn=
ow how other driver handle color management
>
> - "max bpc", global setting applied by both i915 (only on dp i think?) =
and amdgpu. Default value is "8". For every
> resolution + frequency combination the highest possible even number bet=
ween 6 and max_bpc is chosen. If the range
> doesn't contain a valid mode the resolution + frequency combination is =
discarded (but I guess that would be a very
> special edge case, if existent at all, when 6 doesn't work but 10 would=
 work). Intel HDMI code always checks 8, 12, and
> 10 and does not check the max_bpc setting.
>
> - "Broadcast RGB" for i915 and "output_csc" for the old radeon driver (=
not amdgpu), overwrites the kernel chosen color
> range setting (full or limited). If I recall correctly Intel HDMI code =
defaults to full unless this property is set,
> Intel dp code tries to probe the monitor to find out what to use. amdgp=
u has no corresponding setting (I don't know how
> it's decided there).
>
> - RGB pixel encoding can be forced by overloading a Monitors edid with =
one that tells the kernel that only RGB is
> possible. That doesn't work for YCbCr 4:4:4 however because of the edid=
 specification. Forcing YCbCr 4:2:0 would
> theoretically also be possible this way. amdgpu has a debugfs switch "f=
orce_ycbcr_420" which makes the driver default to
> YCbCr 4:2:0 on all monitors if possible.
>
>
> Proposed Solution:
>
> 1. Add a new uAPI property "preferred pixel encoding", as a per port se=
tting.
>
> =C2=A0=C2=A0=C2=A0 - An amdgpu specific implementation was already shar=
ed here: https://gitlab.freedesktop.org/drm/amd/-/issues/476
>
> =C2=A0=C2=A0=C2=A0 - It also writes back the actually used encoding if =
the one requested was not possible, overwriting the requested
> value in the process. I think it would be better to have this feedback =
channel as a different, read-only property.
>
> =C2=A0=C2=A0=C2=A0 - Make this solution vendor agnostic by putting it i=
n the drm_connector_state struct next do max_bpc
> https://elixir.bootlin.com/linux/v5.13-rc1/source/include/drm/drm_conne=
ctor.h#L654 and add patches to amdgpu and i915 to
> respect this setting
>
> 2. Convert "Broadcast RGB" to a vendor agnostic setting/replace with a =
vendor agnostic setting.
>
> =C2=A0=C2=A0=C2=A0 - Imho the name is not very fitting, but it pops up =
in many tutorials throughout the web (some other opinions? how
> could a rename be handled?".
>
> =C2=A0=C2=A0=C2=A0 - Also move it from Intel specific structs to the dr=
m_connector_state struct (please let me know if there is a
> better place)
>
> 3. Strive for full implementation of "max bpc"
>
> =C2=A0=C2=A0=C2=A0 - I need to double check the Intel HDMI code.
>
> 4. Add 3 feedback channels "active color depth", "active color range", =
and "active pixel encoding" as vendor agnostic
> settings in the drm_connector_state struct
>
> =C2=A0=C2=A0=C2=A0 - Possible values are:
>
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - unknown, undefined, 6-bit, 8-bi=
t, 9-bit, 10-bit, 11-bit, 12-bit, 14-bit, 16-bit (alternatively: an integ=
er
> from -1 (unknown), 0 (undefined) to 16, let me know what would be more =
suitable)
>
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - unknown, undefined, full, limit=
ed
>
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - unknown, undefined, rgb, ycbcr4=
44, ycbcr422, ycbcr420
>
> =C2=A0=C2=A0=C2=A0 - it's the responsibility of the driver to update th=
e values once the port configuration changes
>
> =C2=A0=C2=A0=C2=A0 - if the driver does not support the feedback channe=
ls they are set to unknown
>
> =C2=A0=C2=A0=C2=A0 - if the driver uses a non listed setting it should =
set the property to undefined
>
> =C2=A0=C2=A0=C2=A0 - A more detailed description why I think these feed=
back channel are important and should be their own read-only
> property can be found here: https://lkml.org/lkml/2021/5/11/339
>
>
> Adoption:
>
> A KDE dev wants to implement the settings in the KDE settings GUI:
> https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_912370
>
> Tuxedo Computers (my employer) wants to implement the settings desktop =
environment agnostic in Tuxedo Control Center. I
> will start work on this in parallel to implementing the new kernel code=
=2E
>
>
> Questions:
>
> I'm very curious about feedback from the dri-devel community. Would the=
 concept outlaid above be accepted as new uAPI
> once it's fully implemented?
>
> Where would be the best way to store the new vendor agnostic settings? =
Following the implementation of max_bpc i would
> put it in the drm_connector_state struct.
>
> My way forward would be to implement the feedback channels first, becau=
se they can be very useful for debugging the
> setting properties afterwards. I will split each of it up it in 3 or 5 =
patch sets: 1 for the vendor agnostic part, 1 for
> Intel (or 2 split up between HDMI and DP), and 1 for AMD (or 2 split up=
 between HDMI and DP)
>
> Kind regards,
>
> Werner Sembach
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

