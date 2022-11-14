Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3FF628D36
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 00:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA1110E112;
	Mon, 14 Nov 2022 23:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19D710E10E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 23:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668467530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=PEtfssi18HAZfmVNdoLv8zQxUSDj4YRCmGEyCZWSD54=;
 b=egBdm3r+doiKhDOEd/Ta0qj3VVQ9XEERvUHSYWJ6iU4ekp8mIadA7zwc+PZndQt0cXIExZ
 dsemGavK1/FTK/kslkjM3aoH2nx3iqzWmVKdnEhbSp2zFMid2GWpIxJ0re5xWFqBVYESxS
 UeuZ5r8hSXO5t0RP+iTjlEQk6bVu3qo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-186-w8bFXy2TN2-jrz8O0C1Uaw-1; Mon, 14 Nov 2022 18:12:09 -0500
X-MC-Unique: w8bFXy2TN2-jrz8O0C1Uaw-1
Received: by mail-lj1-f199.google.com with SMTP id
 x7-20020a2ea7c7000000b002770aeb6d15so4555970ljp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 15:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PEtfssi18HAZfmVNdoLv8zQxUSDj4YRCmGEyCZWSD54=;
 b=edRfMVMwCD1WbRnvaFjk2Prd29yt/yPBNC41PkKOt9rCzR8Dbng5nyhY41SQ24+7GN
 yRhzX2hanieYr+mJAGfzVhYWkLycO6+yFtoAcfFQeLTpWpEeCyiC+Z2qijUnkqCo59IS
 OPlcqzM+KpWHCoA9DmlEuJa/YI9isIKqn6QnHOBlMBUxiaSFscAwp3/c6dsSHS4UVWUk
 qHOIeF5H/R7LG1cpNb13WMQTOUlbZmTdf0+ZEsU6BFf4O4WEzUGmoGWNP8QHksCBLzF6
 +6aDvvTdyAKUjOjmtSvVNLWXev1caZd/3a10+f5/babH/NHlNRyrDLB0tUSQf7pz1pNT
 N31A==
X-Gm-Message-State: ANoB5pn4Fq1W524uflnHgVm89g8pTyzvR60dvbJ0X38zZIFmblqUUtGr
 unK18Ut68E+nWKzvhrA6vG7l2GMQA8gzVQviwav7YokWZGYzTu9m/9Xq41xYFt2bjXZKQ9SCEiH
 0TEEm7VgErTvL7PeguI9jSI5+Of2ENUFWjNuZw1Zdj2zE
X-Received: by 2002:a2e:300c:0:b0:277:524c:f83d with SMTP id
 w12-20020a2e300c000000b00277524cf83dmr5248618ljw.217.1668467527441; 
 Mon, 14 Nov 2022 15:12:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5qBYz/hwF2FG4amMEMpgy/zsFVoKxBRwMd8Bt48aFXaQPIjAF21Jp95qkhDT6jjPSq9o9NLcHUFgTKiSXIfOI=
X-Received: by 2002:a2e:300c:0:b0:277:524c:f83d with SMTP id
 w12-20020a2e300c000000b00277524cf83dmr5248613ljw.217.1668467527041; Mon, 14
 Nov 2022 15:12:07 -0800 (PST)
MIME-Version: 1.0
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 15 Nov 2022 00:11:56 +0100
Message-ID: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
Subject: The state of Quantization Range handling
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 wayland <wayland-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are still regular bug reports about monitors (sinks) and sources
disagreeing about the quantization range of the pixel data. In
particular sources sending full range data when the sink expects
limited range. From a user space perspective, this is all hidden in
the kernel. We send full range data to the kernel and then hope it
does the right thing but as the bug reports show: some combinations of
displays and drivers result in problems.

In general the whole handling of the quantization range on linux is
not defined or documented at all. User space sends full range data
because that's what seems to work most of the time but technically
this is all undefined and user space can not fix those issues. Some
compositors have resorted to giving users the option to choose the
quantization range but this really should only be necessary for
straight up broken hardware.

Quantization Range can be explicitly controlled by AVI InfoFrame or
HDMI General Control Packets. This is the ideal case and when the
source uses them there is not a lot that can go wrong. Not all
displays support those explicit controls in which case the chosen
video format (IT, CE, SD; details in CTA-861-H 5.1) influences which
quantization range the sink expects.

This means that we have to expect that sometimes we have to send
limited and sometimes full range content. The big question however
that is not answered in the docs: who is responsible for making sure
the data is in the correct range? Is it the kernel or user space?

If it's the kernel: does user space supply full range or limited range
content? Each of those has a disadvantage. If we send full range
content and the driver scales it down to limited range, we can't use
the out-of-range bits to transfer information. If we send limited
range content and the driver scales it up we lose information.

Either way, this must be documented. My suggestion is to say that the
kernel always expects full range data as input and is responsible for
scaling it to limited range data if the sink expects limited range
data.

Another problem is that some displays do not behave correctly. It must
be possible to override the kernel when the user detects such a
situation. This override then controls if the driver converts the full
range data coming from the client or not (Default, Force Limited,
Force Full). It does not try to control what range the sink expects.
Let's call this the Quantization Range Override property which should
be implemented by all drivers.

All drivers should make sure their behavior is correct:

* check that drivers choose the correct default quantization range for
the selected mode
* whenever explicit control is available, use it and set the
quantization range to full
* make sure that the hardware converts from full range to limited
range whenever the sink expects limited range
* implement the Quantization Range Override property

I'm volunteering for the documentation, UAPI and maybe even the drm
core parts if there is willingness to tackle the issue.

Appendix A: Broadcast RGB property

A few drivers already implement the Broadcast RGB property to control
the quantization range. However, it is pointless: It can be set to
Auto, Full and Limited when the sink supports explicitly setting the
quantization range. The driver expects full range content and converts
it to limited range content when necessary. Selecting limited range
never makes any sense: the out-of-range bits can't be used because the
input is full range. Selecting Default never makes sense: relying on
the default quantization range is risky because sinks often get it
wrong and as we established there is no reason to select limited range
if not necessary. The limited and full options also are not suitable
as an override because the property is not available if the sink does
not support explicitly setting the quantization range.

