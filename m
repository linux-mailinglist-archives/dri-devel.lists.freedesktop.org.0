Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CBD629EFB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 17:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E108D10E15E;
	Tue, 15 Nov 2022 16:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Tue, 15 Nov 2022 16:26:18 UTC
Received: from bananas.pp3345.net (bananas.pp3345.net [176.31.107.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D3110E15E;
 Tue, 15 Nov 2022 16:26:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 41C62200CDB; Tue, 15 Nov 2022 17:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net; s=saul;
 t=1668529140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=lw0D3uI230cmTafAFcv/xLpYDFnzHqHfkKivbPHf6c0=;
 b=PQFOFL/OdI06u6ru90TT/ltLv7vs82okxoR02+1CFv4vcJbR0mggzLE9KZO35rP0HvrSzM
 8HId27mOeWXLw40Krs5wM+lO0i1yXYRSusvRPH1NvOd6c5P1UUOH64PKguu7laejjuQnUx
 7UcmuoEPYm4v2EX4wfE2UqMhB1Y7pUrb1hBrBOh/6qCXDL7QGNm8Jg1HQA4izF0HvFcsUM
 jwU1dSjVXwyYR8Hc/ZFvkAVBqMH6rCN947GzB3/Z64keBe6pS/upSkCEPpSCpMUOr7TzS2
 XLEMxFPjegq9F81nlJHuQXo5IVjIf4WMmBUf9D9bT6meZmBzblDxAycFxK/0aQ==
Message-ID: <da30c1b6-5c9b-0a79-f654-f966f17833ff@pp3345.net>
Date: Tue, 15 Nov 2022 17:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: The state of Quantization Range handling
Content-Language: en-US
To: Sebastian Wick <sebastian.wick@redhat.com>
References: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
From: Yussuf Khalil <dev@pp3345.net>
In-Reply-To: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sebastian,

I've previously done some work on this topic [1]. My efforts were mostly about 
fixing the situation regarding overrides and providing proper means for 
userspace. I am affected by the issue myself as I own several DELL U2414H 
screens that declare a CE mode as their preferred one, but should receive full 
range data nonetheless. They do not have the respective bit set in their EDID 
to indicate full range support either.

My implementation primarily moved the "Broadcast RGB" to DRM core and re-wired 
it in i915 and gma500. I further added a flag to indicate CE modes to userspace 
so that apps such as gnome-control-center can clearly communicate whether full 
or limited range would be used by default. A v2 branch that I never submitted 
is available at [2]. I also have some code lying around locally that adds the 
required functionality to mutter and gnome-control-center.

I had to pause work on the issue back then and never really came around to 
picking it up again, however, I would be interested in working on it again if 
there is consensus on the direction that my patches laid out. I did not 
consider use cases for the out-of-range bits though.

Regards
Yussuf

[1] https://patchwork.kernel.org/project/dri-devel/cover/20200413214024.46500-1-dev@pp3345.net/
[2] https://github.com/pp3345/linux/commits/rgb-quant-range-v2

On 15.11.22 00:11, Sebastian Wick wrote:
> There are still regular bug reports about monitors (sinks) and sources
> disagreeing about the quantization range of the pixel data. In
> particular sources sending full range data when the sink expects
> limited range. From a user space perspective, this is all hidden in
> the kernel. We send full range data to the kernel and then hope it
> does the right thing but as the bug reports show: some combinations of
> displays and drivers result in problems.
> 
> In general the whole handling of the quantization range on linux is
> not defined or documented at all. User space sends full range data
> because that's what seems to work most of the time but technically
> this is all undefined and user space can not fix those issues. Some
> compositors have resorted to giving users the option to choose the
> quantization range but this really should only be necessary for
> straight up broken hardware.
> 
> Quantization Range can be explicitly controlled by AVI InfoFrame or
> HDMI General Control Packets. This is the ideal case and when the
> source uses them there is not a lot that can go wrong. Not all
> displays support those explicit controls in which case the chosen
> video format (IT, CE, SD; details in CTA-861-H 5.1) influences which
> quantization range the sink expects.
> 
> This means that we have to expect that sometimes we have to send
> limited and sometimes full range content. The big question however
> that is not answered in the docs: who is responsible for making sure
> the data is in the correct range? Is it the kernel or user space?
> 
> If it's the kernel: does user space supply full range or limited range
> content? Each of those has a disadvantage. If we send full range
> content and the driver scales it down to limited range, we can't use
> the out-of-range bits to transfer information. If we send limited
> range content and the driver scales it up we lose information.
> 
> Either way, this must be documented. My suggestion is to say that the
> kernel always expects full range data as input and is responsible for
> scaling it to limited range data if the sink expects limited range
> data.
> 
> Another problem is that some displays do not behave correctly. It must
> be possible to override the kernel when the user detects such a
> situation. This override then controls if the driver converts the full
> range data coming from the client or not (Default, Force Limited,
> Force Full). It does not try to control what range the sink expects.
> Let's call this the Quantization Range Override property which should
> be implemented by all drivers.
> 
> All drivers should make sure their behavior is correct:
> 
> * check that drivers choose the correct default quantization range for
> the selected mode
> * whenever explicit control is available, use it and set the
> quantization range to full
> * make sure that the hardware converts from full range to limited
> range whenever the sink expects limited range
> * implement the Quantization Range Override property
> 
> I'm volunteering for the documentation, UAPI and maybe even the drm
> core parts if there is willingness to tackle the issue.
> 
> Appendix A: Broadcast RGB property
> 
> A few drivers already implement the Broadcast RGB property to control
> the quantization range. However, it is pointless: It can be set to
> Auto, Full and Limited when the sink supports explicitly setting the
> quantization range. The driver expects full range content and converts
> it to limited range content when necessary. Selecting limited range
> never makes any sense: the out-of-range bits can't be used because the
> input is full range. Selecting Default never makes sense: relying on
> the default quantization range is risky because sinks often get it
> wrong and as we established there is no reason to select limited range
> if not necessary. The limited and full options also are not suitable
> as an override because the property is not available if the sink does
> not support explicitly setting the quantization range.
> 
