Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63D37A435
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 12:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F9789DA8;
	Tue, 11 May 2021 10:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5FB89DA8;
 Tue, 11 May 2021 10:03:33 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 31208C8009C;
 Tue, 11 May 2021 12:03:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id oFkk6slxw4PC; Tue, 11 May 2021 12:03:31 +0200 (CEST)
Received: from [IPv6:2003:e3:7f0d:a800:b19e:8f3e:6c43:72ad]
 (p200300e37F0da800B19E8f3e6C4372AD.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f0d:a800:b19e:8f3e:6c43:72ad])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id B2F7CC80099;
 Tue, 11 May 2021 12:03:31 +0200 (CEST)
To: Pekka Paalanen <ppaalanen@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20210507192718.35314-1-wse@tuxedocomputers.com>
 <CADnq5_O7uuSj-nmKXRvGVTb9n1e+Bb-SU3Psi7BVhN4AOYhHsQ@mail.gmail.com>
 <20210511110756.7e754c30@eldfell>
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH] drm/amd/display: Expose active display color
 configurations to userspace
Message-ID: <46ad57d2-8fdd-51c3-de32-bcf6a1016a56@tuxedocomputers.com>
Date: Tue, 11 May 2021 12:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511110756.7e754c30@eldfell>
Content-Type: text/plain; charset=windows-1252
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.05.21 um 10:07 schrieb Pekka Paalanen:
> On Mon, 10 May 2021 17:47:01 -0400
> Alex Deucher <alexdeucher@gmail.com> wrote:
>
>> On Fri, May 7, 2021 at 3:27 PM Werner Sembach <wse@tuxedocomputers.com=
> wrote:
>>> xrandr --prop and other userspace info tools have currently no way of=

>>> telling which color configuration is used on HDMI and DP ports.
>>>
>>> The ongoing transsition from HDMI 1.4 to 2.0 and the different bandwi=
dth
>>> requirements of YCbCr 4:2:0 and RGB color format raise different
>>> incompatibilities. Having these configuration information readily
>>> available is a useful tool in debuging washed out colors, color artef=
acts
>>> on small fonts and missing refreshrate options. =20
>> I think we would ideally want these as generic connector properties
>> rather than AMD specific ones since they are not really AMD specific.
>> I believe there is already a generic drm property (max_bpc) for the
>> color depth.  At this point, I think having a generic RGB vs YCbCr
>> property would make sense.  I'm not sure about the color space.

Problem is: amdgpu does not really use generic structs for these 3 proper=
ties as far as I can tell. It uses own defines https://elixir.bootlin.com=
/linux/v5.13-rc1/source/drivers/gpu/drm/amd/display/dc/dc_hw_types.h#L647=
 in own structs https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers=
/gpu/drm/amd/display/dc/dc_stream.h#L141

Intel uses generic defines https://elixir.bootlin.com/linux/v5.13-rc1/sou=
rce/include/linux/hdmi.h#L71 https://elixir.bootlin.com/linux/v5.13-rc1/s=
ource/include/drm/drm_dp_helper.h#L1568 split up between dp and hdmi in o=
wn structs https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/gpu/=
drm/i915/display/intel_display_types.h#L879

So the property would need some translation from amd, intel, hdmi, and dp=
 to one enumeration representing all?

> Hi,
>
> I believe that userspace will definitely want to know what exactly is
> going on on the monitor cable, so I think exposing more information is
> good, but I agree that it needs to be done with generic KMS properties
> as much as possible. Userspace is not going to bother having explicit
> code for driver-specific properties.
>
> I think a major use case will be Wayland color management, where a
> Wayland compositor will want to make sure that the video signal
> parameters have not changed since the monitor was last measured
> (profiled). If the signal configuration is different, the measured
> color profile may be invalid and therefore the end user needs to be
> warned. See some ideas in
> https://gitlab.freedesktop.org/wayland/weston/-/issues/467
> under the heading "Color calibration auditing system".
>
> About the color space: is that something a kernel driver will decide
> on its own? I mean in the same sense as the driver will negotiate
> HDMI/DP link parameters, perhaps falling back to smaller requirements
> if higher requirements signal does not seem to work.
>
> We only need readback properties for things that generic userspace
> won't or cannot control explicitly, e.g. because the kernel driver has
> room to make a choice rather than fail.

Some explanation why I choose these 3 properties:

output color space: Mainly to see if full or limited RGB was chosen. Whil=
e in theory the driver should choose the right one automatically, I read =
articles that in some cases it doesn't (hence why the "Broadcast RGB" pro=
perty for intel-gfx driver and "output_csc" for the old radeon driver exi=
st). The next step ofc would be to bring over the "Broadcast RGB" propert=
y to amdgpu/make it a generic property. But then still: having a feedback=
 channel to see if the chosen setting got correctly applied should not hu=
rt in any way, shape, or form?

pixel encoding: Probably the most important of the 3: This should be acco=
mpanied with a "preferred pixel encoding" user controllable setting and i=
s mainly thought as a feedback channel for that, because it might not alw=
ays the obvious if the Display + GPU + Driver + Link encoder combination =
actually supports and therefore applies the selected "preferred pixel enc=
oding". For example: I have a display here that can display 4k@60Hz or WQ=
HD@120Hz, but YCbCr is only supported by it for 4k@60Hz (also it's not su=
pported for 4k30Hz).

The "preferred pixel encoding" setting is required because certain device=
s (both PC's and display's) might wrongly advertise their capabilities. T=
he current fix in this case is to write a custom edid which is a kinda ha=
cky solution. Examples:
1. RGB and YCbCr4:4:4 in theory carry the same amount of color informatio=
n, but some displays look worse in one or the other, because they do bad =
internal conversion.
2. A laptop wants to output YCbCr4:4:4 but because of bad shielding of th=
e port/the cable/the display, the screen goes black every few seconds. Us=
ing YCbCr4:2:0, and therefore a lower signal clock, stabilizes the connec=
tion without changing hardware.

color depth: While "max bpc" can be used to change the color depth, there=
 is currently no way to check which one actually gets used. While in theo=
ry the driver chooses the best/highest bpc within the max bpc setting a u=
ser might not be fully aware what his hardware is or isn't capable off. T=
his is meant as a quick way to double check the setup.

> Thanks,
> pq

