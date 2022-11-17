Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702CD62E6DF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 22:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1125010E68D;
	Thu, 17 Nov 2022 21:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4E010E68D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 21:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668720113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=97FThh15xfv9EeqSVZbyclOYOcxZve/fHK0lBaH1i68=;
 b=EtEffISH21VDtb5tGy7W4aPTFanYOlQ8x20t9hMuOBSB4nVXa30hjApsTd2Aq50/8DYR1V
 8o+lc8W5xLfWjIQpQTOTliT6AUn/VGgJ4NgX9BiQOoyiJXJ8J9AN+sajPf1WFyzXzkXO+O
 2nhLUDftujaL1rcdgigivv+uZm4aBp8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-Sj3advNDOnuH8QTB02Q_AA-1; Thu, 17 Nov 2022 16:21:51 -0500
X-MC-Unique: Sj3advNDOnuH8QTB02Q_AA-1
Received: by mail-lj1-f198.google.com with SMTP id
 u12-20020a2e91cc000000b002770fb05c39so1072238ljg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=97FThh15xfv9EeqSVZbyclOYOcxZve/fHK0lBaH1i68=;
 b=ZSEMvus0dGQjbgG1+mbYsV1xesYMAA/IVlORDyAtwNOZ551Jpz26JyvrWt+ho0EoF8
 VnLOWAQBGi2V+7wPtqUglCijJwDOPJvdmEPEixynnKPZcT4fl1K+r/IXsq7WUWiw5BPw
 Tx/FKVKw3V/PEWr+EXEkYDzZmmYWnV1sUU2ihoeYPilz64Ajjv+uL3gNaTYDDWeO7iso
 2niAmJ2thlGSyDVZEu2WiWcpIQPEFGdMYq2fnUedphD8ZZ/H9nxIsB18zXAvLp5R+ll0
 kAEXl7ddh1ELEBCOVQ0nJLOEYFwtWo4Ee/PQ33CM8U/RycdamB3qPS05WQz3YRejEAYZ
 5JfA==
X-Gm-Message-State: ANoB5pkPxCsy2zh1AIMmNwjyNvM36xnG6CU6MvZNQdBBq5D1NeTG5z9w
 BLX4u68Ye2PZtP4ylvQjop1y86Q/5VCXfut+rcsxAc/7kIqTSkQ+jRbU/anXx7or8StMRox7mM6
 r8t+pzHCKwOw6zGUNAKSiOLlvks8toLVo+zl1qsiY0WoG
X-Received: by 2002:a2e:b5a9:0:b0:277:524c:f83d with SMTP id
 f9-20020a2eb5a9000000b00277524cf83dmr1705404ljn.217.1668720110130; 
 Thu, 17 Nov 2022 13:21:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf49rZ9fpBSLhgDXpB6NcbniWh5vWLLyErIHy7LmmDmhUVlmF+nV1TKkmDDc82Os0PQUdBqKjsX+RWBtigjVtkI=
X-Received: by 2002:a2e:b5a9:0:b0:277:524c:f83d with SMTP id
 f9-20020a2eb5a9000000b00277524cf83dmr1705400ljn.217.1668720109887; Thu, 17
 Nov 2022 13:21:49 -0800 (PST)
MIME-Version: 1.0
References: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
 <da30c1b6-5c9b-0a79-f654-f966f17833ff@pp3345.net>
In-Reply-To: <da30c1b6-5c9b-0a79-f654-f966f17833ff@pp3345.net>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 17 Nov 2022 22:21:38 +0100
Message-ID: <CA+hFU4w0Ns5iSw2giKmGY1XBokfBROY__KFjCXXU7CaYg2RxoA@mail.gmail.com>
Subject: Re: The state of Quantization Range handling
To: Yussuf Khalil <dev@pp3345.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Hi Yussuf,

On Tue, Nov 15, 2022 at 5:26 PM Yussuf Khalil <dev@pp3345.net> wrote:
>
> Hello Sebastian,
>
> I've previously done some work on this topic [1]. My efforts were mostly about
> fixing the situation regarding overrides and providing proper means for
> userspace. I am affected by the issue myself as I own several DELL U2414H
> screens that declare a CE mode as their preferred one, but should receive full
> range data nonetheless. They do not have the respective bit set in their EDID
> to indicate full range support either.
>
> My implementation primarily moved the "Broadcast RGB" to DRM core and re-wired
> it in i915 and gma500. I further added a flag to indicate CE modes to userspace
> so that apps such as gnome-control-center can clearly communicate whether full
> or limited range would be used by default. A v2 branch that I never submitted
> is available at [2]. I also have some code lying around locally that adds the
> required functionality to mutter and gnome-control-center.

Yeah, I now agree that moving the "Broadcast RGB" to DRM core would be
a good decision. The slight behavior change I want to see can be done
afterwards as well. Not so sure about indicating CE modes because
there are other factors (YCC vs RGB, the connector type and version)
which influence the default quantization range.

>
> I had to pause work on the issue back then and never really came around to
> picking it up again, however, I would be interested in working on it again if
> there is consensus on the direction that my patches laid out. I did not
> consider use cases for the out-of-range bits though.

I think we can safely ignore out-of-range bits for now and good to
know you're on board.

>
> Regards
> Yussuf
>
> [1] https://patchwork.kernel.org/project/dri-devel/cover/20200413214024.46500-1-dev@pp3345.net/
> [2] https://github.com/pp3345/linux/commits/rgb-quant-range-v2
>
> On 15.11.22 00:11, Sebastian Wick wrote:
> > There are still regular bug reports about monitors (sinks) and sources
> > disagreeing about the quantization range of the pixel data. In
> > particular sources sending full range data when the sink expects
> > limited range. From a user space perspective, this is all hidden in
> > the kernel. We send full range data to the kernel and then hope it
> > does the right thing but as the bug reports show: some combinations of
> > displays and drivers result in problems.
> >
> > In general the whole handling of the quantization range on linux is
> > not defined or documented at all. User space sends full range data
> > because that's what seems to work most of the time but technically
> > this is all undefined and user space can not fix those issues. Some
> > compositors have resorted to giving users the option to choose the
> > quantization range but this really should only be necessary for
> > straight up broken hardware.
> >
> > Quantization Range can be explicitly controlled by AVI InfoFrame or
> > HDMI General Control Packets. This is the ideal case and when the
> > source uses them there is not a lot that can go wrong. Not all
> > displays support those explicit controls in which case the chosen
> > video format (IT, CE, SD; details in CTA-861-H 5.1) influences which
> > quantization range the sink expects.
> >
> > This means that we have to expect that sometimes we have to send
> > limited and sometimes full range content. The big question however
> > that is not answered in the docs: who is responsible for making sure
> > the data is in the correct range? Is it the kernel or user space?
> >
> > If it's the kernel: does user space supply full range or limited range
> > content? Each of those has a disadvantage. If we send full range
> > content and the driver scales it down to limited range, we can't use
> > the out-of-range bits to transfer information. If we send limited
> > range content and the driver scales it up we lose information.
> >
> > Either way, this must be documented. My suggestion is to say that the
> > kernel always expects full range data as input and is responsible for
> > scaling it to limited range data if the sink expects limited range
> > data.
> >
> > Another problem is that some displays do not behave correctly. It must
> > be possible to override the kernel when the user detects such a
> > situation. This override then controls if the driver converts the full
> > range data coming from the client or not (Default, Force Limited,
> > Force Full). It does not try to control what range the sink expects.
> > Let's call this the Quantization Range Override property which should
> > be implemented by all drivers.
> >
> > All drivers should make sure their behavior is correct:
> >
> > * check that drivers choose the correct default quantization range for
> > the selected mode
> > * whenever explicit control is available, use it and set the
> > quantization range to full
> > * make sure that the hardware converts from full range to limited
> > range whenever the sink expects limited range
> > * implement the Quantization Range Override property
> >
> > I'm volunteering for the documentation, UAPI and maybe even the drm
> > core parts if there is willingness to tackle the issue.
> >
> > Appendix A: Broadcast RGB property
> >
> > A few drivers already implement the Broadcast RGB property to control
> > the quantization range. However, it is pointless: It can be set to
> > Auto, Full and Limited when the sink supports explicitly setting the
> > quantization range. The driver expects full range content and converts
> > it to limited range content when necessary. Selecting limited range
> > never makes any sense: the out-of-range bits can't be used because the
> > input is full range. Selecting Default never makes sense: relying on
> > the default quantization range is risky because sinks often get it
> > wrong and as we established there is no reason to select limited range
> > if not necessary. The limited and full options also are not suitable
> > as an override because the property is not available if the sink does
> > not support explicitly setting the quantization range.
> >
>

