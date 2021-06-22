Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13B3B0B17
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 19:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDE06E7FA;
	Tue, 22 Jun 2021 17:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEA66E0F4;
 Tue, 22 Jun 2021 17:06:47 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id E528EC800A8;
 Tue, 22 Jun 2021 19:06:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id TuehJwAt2jeS; Tue, 22 Jun 2021 19:06:45 +0200 (CEST)
Received: from [IPv6:2003:e3:7f39:4900:c2fa:5078:90c:9046]
 (p200300e37F394900C2fA5078090C9046.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:c2fa:5078:90c:9046])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 7C062C800A7;
 Tue, 22 Jun 2021 19:06:45 +0200 (CEST)
Subject: Re: New uAPI for color management proposal and feedback request
To: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
 <YJvSUCCPvWz7y/r7@intel.com> <20210519123405.4d3218a7@eldfell>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <faf25c43-656d-bbb3-d2f2-8205353e19f6@tuxedocomputers.com>
Date: Tue, 22 Jun 2021 19:06:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519123405.4d3218a7@eldfell>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
 intel-gfx@lists.freedesktop.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 19.05.21 um 11:34 schrieb Pekka Paalanen:
> On Wed, 12 May 2021 16:04:16 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>
>> On Wed, May 12, 2021 at 02:06:56PM +0200, Werner Sembach wrote:
>>> Hello,
>>>
>>> In addition to the existing "max bpc", and "Broadcast RGB/output_csc" drm properties I propose 4 new properties:
>>> "preferred pixel encoding", "active color depth", "active color range", and "active pixel encoding"
>>>
>>>
>>> Motivation:
>>>
>>> Current monitors have a variety pixel encodings available: RGB, YCbCr 4:4:4, YCbCr 4:2:2, YCbCr 4:2:0.
>>>
>>> In addition they might be full or limited RGB range and the monitors accept different bit depths.
>>>
>>> Currently the kernel driver for AMD and Intel GPUs automatically configure the color settings automatically with little
>>> to no influence of the user. However there are several real world scenarios where the user might disagree with the
>>> default chosen by the drivers and wants to set his or her own preference.
>>>
>>> Some examples:
>>>
>>> 1. While RGB and YCbCr 4:4:4 in theory carry the same amount of color information, some screens might look better on one
>>> than the other because of bad internal conversion. The driver currently however has a fixed default that is chosen if
>>> available (RGB for Intel and YCbCr 4:4:4 for AMD). The only way to change this currently is by editing and overloading
>>> the edid reported by the monitor to the kernel.
>>>
>>> 2. RGB and YCbCr 4:4:4 need a higher port clock then YCbCr 4:2:0. Some hardware might report that it supports the higher
>>> port clock, but because of bad shielding on the PC, the cable, or the monitor the screen cuts out every few seconds when
>>> RGB or YCbCr 4:4:4 encoding is used, while YCbCr 4:2:0 might just work fine without changing hardware. The drivers
>>> currently however always default to the "best available" option even if it might be broken.
>>>
>>> 3. Some screens natively only supporting 8-bit color, simulate 10-Bit color by rapidly switching between 2 adjacent
>>> colors. They advertise themselves to the kernel as 10-bit monitors but the user might not like the "fake" 10-bit effect
>>> and prefer running at the native 8-bit per color.
>>>
>>> 4. Some screens are falsely classified as full RGB range wile they actually use limited RGB range. This results in
>>> washed out colors in dark and bright scenes. A user override can be helpful to manually fix this issue when it occurs.
>>>
>>> There already exist several requests, discussion, and patches regarding the thematic:
>>>
>>> - https://gitlab.freedesktop.org/drm/amd/-/issues/476
>>>
>>> - https://gitlab.freedesktop.org/drm/amd/-/issues/1548
>>>
>>> - https://lkml.org/lkml/2021/5/7/695
>>>
>>> - https://lkml.org/lkml/2021/5/11/416
>>>
> ...
>
>>> Adoption:
>>>
>>> A KDE dev wants to implement the settings in the KDE settings GUI:
>>> https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_912370
>>>
>>> Tuxedo Computers (my employer) wants to implement the settings desktop environment agnostic in Tuxedo Control Center. I
>>> will start work on this in parallel to implementing the new kernel code.  
>> I suspect everyone would be happier to accept new uapi if we had
>> multiple compositors signed up to implement it.
> I think having Weston support for these would be good, but for now it
> won't be much of an UI: just weston.ini to set, and the log to see what
> happened.

Since a first version of the patch set is now feature complete, please let me know if a MR regarding this is started.

Thanks

>
> However, knowing what happened is going to be important for color
> calibration auditing:
> https://gitlab.freedesktop.org/wayland/weston/-/issues/467
>
> Yes, please, very much for read-only properties for the feedback part.
> Properties that both userspace and kernel will write are hard to deal
> with in general.
>
> Btw. "max bpc" I can kind of guess that conversion from framebuffer
> format to the wire bpc happens automatically and only as the final
> step, but "Broadcast RGB" is more complicated: is the output from the
> abstract pixel pipeline sent as-is and "Broadcast RGB" is just another
> inforframe bit to the monitor, or does "Broadcast RGB" setting actually
> change what happens in the pixel pipeline *and* set infoframe bits?
>
> My vague recollection is that framebuffer was always assumed to be in
> full range, and then if "Broadcast RGB" was set to limited range, the
> driver would mangle the pixel pipeline to convert from full to limited
> range. This means that it would be impossible to have limited range
> data in a framebuffer, or there might be a double-conversion by
> userspace programming a LUT for limited->full and then the driver
> adding full->limited. I'm also confused how full/limited works when
> framebuffer is in RGB/YCbCr and the monitor wire format is in RGB/YCbCr
> and there may be RGB->YCbCR or YCbCR->RGB conversions going on - or
> maybe even FB YCbCR -> RGB -> DEGAMMA -> CTM -> GAMMA -> YCbCR.
>
> I wish someone drew a picture of the KMS abstract pixel pipeline with
> all the existing KMS properties in it. :-)
>
>
> Thanks,
> pq
