Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C43DE73C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 09:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937906E159;
	Tue,  3 Aug 2021 07:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C2CD6E159
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 07:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 736CF20201B;
 Tue,  3 Aug 2021 09:34:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id E8y2sbOCKraz; Tue,  3 Aug 2021 09:34:00 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id DD80920201A;
 Tue,  3 Aug 2021 09:33:59 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mAow2-000aZX-RS; Tue, 03 Aug 2021 09:33:58 +0200
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Simon Ser <contact@emersion.fr>, "Zhang, Tina" <tina.zhang@intel.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>,
 "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <612fd31a51384cb28ac6da9db3e840ca@intel.com>
 <YQepZMFaCNLBNGx9@phenom.ffwll.local>
 <fa53f9db229e481784bfe3a61a195fd3@intel.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Message-ID: <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
Date: Tue, 3 Aug 2021 09:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <fa53f9db229e481784bfe3a61a195fd3@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-08-03 8:11 a.m., Kasireddy, Vivek wrote:
> 
>>> The goal:
>>> - Maintain full framerate even when the Guest scanout FB is flipped onto a hardware
>> plane
>>> on the Host -- regardless of either compositor's scheduling policy -- without making any
>>> copies and ensuring that both Host and Guest are not accessing the buffer at the same
>> time.
>>>
>>> The problem:
>>> - If the Host compositor flips the client's buffer (in this case Guest compositor's buffer)
>>> onto a hardware plane, then it can send a wl_buffer.release event for the previous buffer
>>> only after it gets a pageflip completion. And, if the Guest compositor takes 10-12 ms to
>>> submit a new buffer and given the fact that the Host compositor waits only for 9 ms, the
>>> Guest compositor will miss the Host's repaint cycle resulting in halved frame-rate.
>>>
>>> The solution:
>>> - To ensure full framerate, the Guest compositor has to start it's repaint cycle (including
>>> the 9 ms wait) when the Host compositor sends the frame callback event to its clients.
>>> In order for this to happen, the dma-fence that the Guest KMS waits on -- before sending
>>> pageflip completion -- cannot be tied to a wl_buffer.release event. This means that, the
>>> Guest compositor has to be forced to use a new buffer for its next repaint cycle when it
>>> gets a pageflip completion.
>>
>> Is that really the only solution?
> [Kasireddy, Vivek] There are a few others I mentioned here:
> https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_986572
> But I think none of them are as compelling as this one.
> 
>>
>> If we fix the event timestamps so that both guest and host use the same
>> timestamp, but then the guest starts 5ms (or something like that) earlier,
>> then things should work too? I.e.
>> - host compositor starts at (previous_frametime + 9ms)
>> - guest compositor starts at (previous_frametime + 4ms)
>>
>> Ofc this only works if the frametimes we hand out to both match _exactly_
>> and are as high-precision as the ones on the host side. Which for many gpu
>> drivers at least is the case, and all the ones you care about for sure :-)
>>
>> But if the frametimes the guest receives are the no_vblank fake ones, then
>> they'll be all over the place and this carefully tuned low-latency redraw
>> loop falls apart. Aside fromm the fact that without tuning the guests to
>> be earlier than the hosts, you're guaranteed to miss every frame (except
>> when the timing wobbliness in the guest is big enough by chance to make
>> the deadline on the oddball frame).
> [Kasireddy, Vivek] The Guest and Host use different event timestamps as we don't
> share these between the Guest and the Host. It does not seem to be causing any other
> problems so far but we did try the experiment you mentioned (i.e., adjusting the delays)
> and it works. However, this patch series is meant to fix the issue without having to tweak
> anything (delays) because we can't do this for every compositor out there.

Maybe there could be a mechanism which allows the compositor in the guest to automatically adjust its repaint cycle as needed.

This might even be possible without requiring changes in each compositor, by adjusting the vertical blank periods in the guest to be aligned with the host compositor repaint cycles. Not sure about that though.

Even if not, both this series or making it possible to queue multiple flips require corresponding changes in each compositor as well to have any effect.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
