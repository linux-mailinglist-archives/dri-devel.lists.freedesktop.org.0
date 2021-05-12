Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC2D37BC3B
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 14:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D946EB7E;
	Wed, 12 May 2021 12:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C516EB7C;
 Wed, 12 May 2021 12:07:02 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 16C0EC800DB;
 Wed, 12 May 2021 14:07:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 3YDOHybVgylk; Wed, 12 May 2021 14:07:00 +0200 (CEST)
Received: from [IPv6:2003:e3:7f15:cc00:73bb:e3c1:c946:13a6]
 (p200300e37F15Cc0073BBE3C1C94613A6.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f15:cc00:73bb:e3c1:c946:13a6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 15564C800D9;
 Wed, 12 May 2021 14:06:58 +0200 (CEST)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: New uAPI for color management proposal and feedback request
Message-ID: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
Date: Wed, 12 May 2021 14:06:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
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
 intel-gfx@lists.freedesktop.org, amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

In addition to the existing "max bpc", and "Broadcast RGB/output_csc" drm=
 properties I propose 4 new properties:
"preferred pixel encoding", "active color depth", "active color range", a=
nd "active pixel encoding"


Motivation:

Current monitors have a variety pixel encodings available: RGB, YCbCr 4:4=
:4, YCbCr 4:2:2, YCbCr 4:2:0.

In addition they might be full or limited RGB range and the monitors acce=
pt different bit depths.

Currently the kernel driver for AMD and Intel GPUs automatically configur=
e the color settings automatically with little
to no influence of the user. However there are several real world scenari=
os where the user might disagree with the
default chosen by the drivers and wants to set his or her own preference.=


Some examples:

1. While RGB and YCbCr 4:4:4 in theory carry the same amount of color inf=
ormation, some screens might look better on one
than the other because of bad internal conversion. The driver currently h=
owever has a fixed default that is chosen if
available (RGB for Intel and YCbCr 4:4:4 for AMD). The only way to change=
 this currently is by editing and overloading
the edid reported by the monitor to the kernel.

2. RGB and YCbCr 4:4:4 need a higher port clock then YCbCr 4:2:0. Some ha=
rdware might report that it supports the higher
port clock, but because of bad shielding on the PC, the cable, or the mon=
itor the screen cuts out every few seconds when
RGB or YCbCr 4:4:4 encoding is used, while YCbCr 4:2:0 might just work fi=
ne without changing hardware. The drivers
currently however always default to the "best available" option even if i=
t might be broken.

3. Some screens natively only supporting 8-bit color, simulate 10-Bit col=
or by rapidly switching between 2 adjacent
colors. They advertise themselves to the kernel as 10-bit monitors but th=
e user might not like the "fake" 10-bit effect
and prefer running at the native 8-bit per color.

4. Some screens are falsely classified as full RGB range wile they actual=
ly use limited RGB range. This results in
washed out colors in dark and bright scenes. A user override can be helpf=
ul to manually fix this issue when it occurs.

There already exist several requests, discussion, and patches regarding t=
he thematic:

- https://gitlab.freedesktop.org/drm/amd/-/issues/476

- https://gitlab.freedesktop.org/drm/amd/-/issues/1548

- https://lkml.org/lkml/2021/5/7/695

- https://lkml.org/lkml/2021/5/11/416


Current State:

I only know bits about the Intel i915 and AMD amdgpu driver. I don't know=
 how other driver handle color management

- "max bpc", global setting applied by both i915 (only on dp i think?) an=
d amdgpu. Default value is "8". For every
resolution + frequency combination the highest possible even number betwe=
en 6 and max_bpc is chosen. If the range
doesn't contain a valid mode the resolution + frequency combination is di=
scarded (but I guess that would be a very
special edge case, if existent at all, when 6 doesn't work but 10 would w=
ork). Intel HDMI code always checks 8, 12, and
10 and does not check the max_bpc setting.

- "Broadcast RGB" for i915 and "output_csc" for the old radeon driver (no=
t amdgpu), overwrites the kernel chosen color
range setting (full or limited). If I recall correctly Intel HDMI code de=
faults to full unless this property is set,
Intel dp code tries to probe the monitor to find out what to use. amdgpu =
has no corresponding setting (I don't know how
it's decided there).

- RGB pixel encoding can be forced by overloading a Monitors edid with on=
e that tells the kernel that only RGB is
possible. That doesn't work for YCbCr 4:4:4 however because of the edid s=
pecification. Forcing YCbCr 4:2:0 would
theoretically also be possible this way. amdgpu has a debugfs switch "for=
ce_ycbcr_420" which makes the driver default to
YCbCr 4:2:0 on all monitors if possible.


Proposed Solution:

1. Add a new uAPI property "preferred pixel encoding", as a per port sett=
ing.

=C2=A0=C2=A0=C2=A0 - An amdgpu specific implementation was already shared=
 here: https://gitlab.freedesktop.org/drm/amd/-/issues/476

=C2=A0=C2=A0=C2=A0 - It also writes back the actually used encoding if th=
e one requested was not possible, overwriting the requested
value in the process. I think it would be better to have this feedback ch=
annel as a different, read-only property.

=C2=A0=C2=A0=C2=A0 - Make this solution vendor agnostic by putting it in =
the drm_connector_state struct next do max_bpc
https://elixir.bootlin.com/linux/v5.13-rc1/source/include/drm/drm_connect=
or.h#L654 and add patches to amdgpu and i915 to
respect this setting

2. Convert "Broadcast RGB" to a vendor agnostic setting/replace with a ve=
ndor agnostic setting.

=C2=A0=C2=A0=C2=A0 - Imho the name is not very fitting, but it pops up in=
 many tutorials throughout the web (some other opinions? how
could a rename be handled?".

=C2=A0=C2=A0=C2=A0 - Also move it from Intel specific structs to the drm_=
connector_state struct (please let me know if there is a
better place)

3. Strive for full implementation of "max bpc"

=C2=A0=C2=A0=C2=A0 - I need to double check the Intel HDMI code.

4. Add 3 feedback channels "active color depth", "active color range", an=
d "active pixel encoding" as vendor agnostic
settings in the drm_connector_state struct

=C2=A0=C2=A0=C2=A0 - Possible values are:

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - unknown, undefined, 6-bit, 8-bit,=
 9-bit, 10-bit, 11-bit, 12-bit, 14-bit, 16-bit (alternatively: an integer=

from -1 (unknown), 0 (undefined) to 16, let me know what would be more su=
itable)

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - unknown, undefined, full, limited=


=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - unknown, undefined, rgb, ycbcr444=
, ycbcr422, ycbcr420

=C2=A0=C2=A0=C2=A0 - it's the responsibility of the driver to update the =
values once the port configuration changes

=C2=A0=C2=A0=C2=A0 - if the driver does not support the feedback channels=
 they are set to unknown

=C2=A0=C2=A0=C2=A0 - if the driver uses a non listed setting it should se=
t the property to undefined

=C2=A0=C2=A0=C2=A0 - A more detailed description why I think these feedba=
ck channel are important and should be their own read-only
property can be found here: https://lkml.org/lkml/2021/5/11/339


Adoption:

A KDE dev wants to implement the settings in the KDE settings GUI:
https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_912370

Tuxedo Computers (my employer) wants to implement the settings desktop en=
vironment agnostic in Tuxedo Control Center. I
will start work on this in parallel to implementing the new kernel code.


Questions:

I'm very curious about feedback from the dri-devel community. Would the c=
oncept outlaid above be accepted as new uAPI
once it's fully implemented?

Where would be the best way to store the new vendor agnostic settings? Fo=
llowing the implementation of max_bpc i would
put it in the drm_connector_state struct.

My way forward would be to implement the feedback channels first, because=
 they can be very useful for debugging the
setting properties afterwards. I will split each of it up it in 3 or 5 pa=
tch sets: 1 for the vendor agnostic part, 1 for
Intel (or 2 split up between HDMI and DP), and 1 for AMD (or 2 split up b=
etween HDMI and DP)

Kind regards,

Werner Sembach


