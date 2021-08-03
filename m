Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 255883DE881
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 10:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB7C6E454;
	Tue,  3 Aug 2021 08:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 084E36E41B;
 Tue,  3 Aug 2021 08:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 15EA520201B;
 Tue,  3 Aug 2021 10:34:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id fhzOsvkjXHwR; Tue,  3 Aug 2021 10:34:07 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 3757320201A;
 Tue,  3 Aug 2021 10:34:07 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mApsE-000bJw-Dr; Tue, 03 Aug 2021 10:34:06 +0200
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Zhenneng Li <lizhenneng@kylinos.cn>, Alex Deucher
 <alexander.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
References: <20210802074310.1526526-1-lizhenneng@kylinos.cn>
 <e6e77cfb-4e6b-c30e-ae7c-ac84b82c9a75@amd.com>
 <YQetXMaASz/F2EyS@phenom.ffwll.local>
 <CADnq5_PDtEn1y5HJBRHXw8o11LVwSRDKNtQgZtN5u0CW5ZspnQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/radeon: Update pitch for page flip
Message-ID: <6a34fcc3-0aa3-85ff-21c4-86b9b5a48fd5@daenzer.net>
Date: Tue, 3 Aug 2021 10:34:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_PDtEn1y5HJBRHXw8o11LVwSRDKNtQgZtN5u0CW5ZspnQ@mail.gmail.com>
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

On 2021-08-02 4:51 p.m., Alex Deucher wrote:
> On Mon, Aug 2, 2021 at 4:31 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Mon, Aug 02, 2021 at 10:12:47AM +0200, Christian König wrote:
>>> Am 02.08.21 um 09:43 schrieb Zhenneng Li:
>>>> When primary bo is updated, crtc's pitch may
>>>> have not been updated, this will lead to show
>>>> disorder content when user changes display mode,
>>>> we update crtc's pitch in page flip to avoid
>>>> this bug.
>>>> This refers to amdgpu's pageflip.
>>>
>>> Alex is the expert to ask about that code, but I'm not sure if that is
>>> really correct for the old hardware.
>>>
>>> As far as I know the crtc's pitch should not change during a page flip, but
>>> only during a full mode set.
>>>
>>> So could you elaborate a bit more how you trigger this?
>>
>> legacy page_flip ioctl only verifies that the fb->format stays the same.
>> It doesn't check anything else (afair never has), this is all up to
>> drivers to verify.
>>
>> Personally I'd say add a check to reject this, since testing this and
>> making sure it really works everywhere is probably a bit much on this old
>> hw.
> 
> If just the pitch changed, that probably wouldn't be much of a
> problem, but if the pitch is changing, that probably implies other
> stuff has changed as well and we'll just be chasing changes.  I agree
> it would be best to just reject anything other than updating the
> scanout address.

FWIW, that means page flipping cannot be used in some cases which work fine by changing the pitch, which can result in tearing: https://gitlab.freedesktop.org/xorg/xserver/-/issues/839 (which says the i915 driver handles this as well).


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
