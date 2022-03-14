Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21784D8F19
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 22:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CAF10E2C3;
	Mon, 14 Mar 2022 21:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDA410E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 21:53:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id BF1831F43145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647294814;
 bh=+76du0ietVMwBWMjPTy1r3IfwLhAXgOLR85mjcWfOAM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AImFmnn1Mewf9kbep8zs9GBANqYox62KFHiTWBVDLDFOtYVF4BJrxMLZ7sSlOFaHV
 EZhvd8xmF7CXX2VWQsGorFBJT2AC2IG4BJoxEyj71v+u/WlSOrIU6yQB5csGBVj9jw
 XlddzwFbnLi8E1djouXPcbwSDb5AvcvHdjLaZSDBy8Sj2JZFWaUak+/uzIWvXgV2Wx
 e1ga/DNphrZ+q9zNJPMqm9HOUnVK3KCIak4FBAhxyt913vBSTc9bEph+usRhI063YV
 EWR3rlDd1KlrYE1I6qjuFZlQBajJKauI1yiPXN0zxBEmUGJNCNfrfoo9mVmpK7uOeL
 ANk/b4DjQie9Q==
Message-ID: <32a34a20-f9b5-3b7b-95f5-a6a34ad225c4@collabora.com>
Date: Tue, 15 Mar 2022 00:53:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: BUG: KASAN: use-after-free in drm_atomic_helper_wait_for_vblanks()
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <4438d667-1be2-24f1-c987-1a8e3fb85bcc@collabora.com>
 <20220311142205.ztg6njrubmnjud7c@houat>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220311142205.ztg6njrubmnjud7c@houat>
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/11/22 17:22, Maxime Ripard wrote:
> Hi Dmitry,
> 
> On Thu, Mar 10, 2022 at 03:33:07AM +0300, Dmitry Osipenko wrote:
>> I was playing/testing SuperTuxKart using VirtIO-GPU driver and spotted a
>> UAF bug in drm_atomic_helper_wait_for_vblanks().
>>
>> SuperTuxKart can use DRM directly, i.e. you can run game in VT without
>> Xorg or Wayland, this is where bugs happens. SuperTuxKart uses a
>> non-blocking atomic page flips and UAF happens when a new atomic state
>> is committed while there is a previous page flip still in-fly.
>>
>> What happens is that the new and old atomic states refer to the same
>> CRTC state somehow. Once the older atomic state is destroyed, the CRTC
>> state is freed and the newer atomic state continues to use the freed
>> CRTC state.
> 
> I'm not sure what you mean by "the new and old atomic states refer to
> the same CRTC state", are those the same pointers?

Yes, the pointers are the same. I'd assume that the newer atomic state
should duplicate CRTC state, but apparently it doesn't happen.

>> The bug is easily reproducible (at least by me) by playing SuperTuxKart
>> for a minute. It presents on latest -next and 5.17-rc7, I haven't
>> checked older kernel versions.
>>
>> I'm not an expert of the non-blocking code paths in DRM, so asking for
>> suggestions about where the root of the problem could be.
> 
> Does it occur with other platforms? Can you easily test on something else?

Shouldn't be easy to replicate this on other platforms, but I'll try.
