Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7E04005BE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 21:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C33C6E8C7;
	Fri,  3 Sep 2021 19:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Fri, 03 Sep 2021 19:21:14 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDB66E8C7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 19:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1630696873;
 bh=3y/ozd6+JcTWumX/d8r3OnCWqsmcAG1NxcIlCOoPo4s=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=EkqapG9JSyiH/g7H3ediXMHI0Es4bzTawmSv83b6cg1P2UShU/54Wg2I2Y5aKku0T
 mOY0NVTLixABrSxOmaenVy54/Q+a5kZp6beXpo/QoDKBvCf3mh1cg91s1dEZ/M5CzW
 0WmiNZrgnThmbI6gcJZPXCvkYxDqU1SPdlkAADDI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from reader ([198.144.120.234]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MAvKi-1mEVJ30zPY-009x52; Fri, 03
 Sep 2021 21:08:29 +0200
Received: by reader (Postfix, from userid 1000)
 id BE29227CE; Fri,  3 Sep 2021 21:08:21 +0200 (CEST)
Date: Fri, 3 Sep 2021 21:08:21 +0200
From: Dennis Filder <d.filder@web.de>
To: dri-devel@lists.freedesktop.org
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: Handling DRM master transitions cooperatively
Message-ID: <YTJypepF1Hpc2YYT@reader>
Mail-Followup-To: dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:7AzGSz9qyAPUWHrqMcPOS2kRWyOqKyFiNSJiPATTqwwIOFID6uc
 M6GPDToZxDIi6Feg+iShEoaBrKb7jI7jPfIWv+2tNbsTION8SADu7VKYUuhWl1Xd3BZXWzt
 nB//krJ3ySdDf1vQXXQkZTZ1tVTXquPVnT37IoYmi9IvTp9k2x2cPGYEZNmLd7LzR5yid+C
 Hpk1rnJ55UaGW8DoKoH+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CLfGrvm18Ts=:JTD7Z8UjOUYfrHYzzgZUO2
 U0e/+h0iB/VErNiExh3H6GXTlYPptLOzs6K7+ho3eEp5FPJT1FZfAknXv2vX4B+Q5G/tWVbf7
 6F2ZnCaQEK9SG/L9fm/QfQI8YC8qFliFAV7mbIvAmopgR/sSv8P9pP+Hz5j9bj8BZQfWEIjY8
 G9Qj3txjqBJyGDrXPiLu+mxJoAYk/EZFfF09epKWY40u8Xp2ifeGNxkLTvx+xxG2EW5375Yu2
 GgMTMUEsyeR8S5awBfQXq5b12aD1w3ngsgWPmXGtQ+C00o2BkjJ/GE922Eum2+H7yJuQsEz2y
 jEPiMDcCyAzrb6LW1CCOQRonfPLhlq8io4S0apSpxECKohJ+4U2AOz3tvyNo1KqmJiBXshweY
 8e6miU0sK5QlPPCmWMizRiIFCc6WGoLxZkPp/vNFJuqpZlteYREH/EV8qqVn17o0s++2zyCLP
 fMq9l95wnGQJtwXpdDQsJ/G1ospYdkZWj9ecJNSyl0iGOMcLpO7YmGtK+HzvDdmrW6k6C49Cs
 iLVNpQfIZh6a7eAM0QoznHe2kcDNvINt3XR9zt8zNBM4dwIdY3MrEuqQAOoFN4/iRxNJKTFq0
 JY5HuYRhEwf1e2vmDmeZcDvSjLWoy/YYrrytNN93qBWfHITOhPMOXXpEAmkEyvSCR1qar0MBm
 zBqhAJz4RzOloQ7TC923W9tRpIpScU8wRXWmkIYhROiq1SARmNzLpjFIO8a69kFNe6OK3adGm
 5rkrzK+fTmTImCTOIs8uP0193v/oVdypVOIsKRPcnMIUAW0+ttIfFfvICXGZp6a8v7YnuSaUA
 v7HJtM/8FyaA6plfHcs0rhLII1HIIa3XNqV0Is/BWH9s7Xyr2MjFsx45/3CgdDBkkKQCKJYFi
 4gP/Mnc6CF+XePQFQRXLsDa5EMfnGDJz48tcXJ+oTT0y3GjwUGXwS4uB63ZZOLjEieZ0Tn1dZ
 SazAc6HSg7EcZCCf5zmom+gK7xO1n/Ojy+GHMBahoIt3catzXCbyu0GNPb4L8B7+3qyiJYiY4
 rGRwXkAEbGF9ISKv888xEoK64yzuHBnroeknMWvrj7L9yrAs8c50g2r6aQ8Co+xpBWoN1KvH+
 vw48qvrTWOEB6sHfO08lXQARIRVgMEv2UeuZiB4q6vitTLX50zSgtBL5A==
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

Hans de Goede asked me to take a topic from a private discussion here.
I must also preface that I'm not a graphics person and my knowledge of
DRI/DRM is cursory at best.

I initiated the conversation with de Goede after learning that the X
server now supports being started with an open DRM file descriptor
(this was added for Keith Packard's xlease project).  I wondered if
that could be used to smoothen the Plymouth->X transition somehow and
asked de Goede if there were any such plans.  He denied, but mentioned
that a new ioctl is in the works to prevent the kernel from wiping the
contents of a frame buffer after a device is closed, and that this
would help to keep transitions smooth.

I am a bit disappointed with this being considered a desirable way of
handling that transfer of control over a shared DRM device as it shows
a lack of ambition.  Sure, it's probably easy to implement, but it
will also greatly limit how such transitions can be presented to the
user.  In practice it would mean plymouthd closing the DRM device and
exiting so that systemd can start the display manager which then
starts an X server to present the login screen.  If for that several
shared libraries have to first be loaded and relocated while the
system is under heavy load then there will be a noticeable delay
manifesting as a frozen screen.  After that the best you can hope for
is blending the still-frame over into the login screen (or whatever
comes then).  The VT-API-based switching mechanism currently en vogue
suffers from similar limitations.

If the approach to transferring control were to be changed to a scheme
that involves both donor and recipient process connecting to each
other on a unix socket and actively coordinating the transfer
(i.e. the calls to drmSetMaster and drmDropMaster) then this would
open the door to a host of possibilities.  Not only could the
transition be kept infinitesimally short since both processes are
already up, but it could also involve e.g. the recipient continuing an
animation the donor had going reusing state that is transferred as a
memfd.  This way there wouldn't be any noticeable freezes on the
display making for a far more polished, and thus impressive
experience.  It would be a feat a program alone cannot achieve on its
own.  Another option made possible would be implementing a watchdog.
If the recipient transfers e.g. file descriptors for a pipe and a
pidfd of itself, then the donor could monitor those for a
heartbeat/process termination and take back control over the device if
something goes awry (deadlock/crash) and initiate a recovery
mechanism.  With the other approach implementing such features is
simply not possible.

Making processes talk to each other and work together like this would
also be a far more accurate software representation of what is
actually going on: different subsystems passing control over a shared
device around to work towards the common goal of a good user
experience.

A bit of context: The idea underlying this came from my experience
with accessibility technology under Linux where uncoordinated fighting
over the audio device among all kinds of processes led to countless
ways in which things would break with no hope of ever fixing anything.
It instilled in me the conviction that user-facing programs are broken
if they are not written to talk to each other to coordinate access to
shared resources for the goal of rendering a good user experience, but
instead leave it to the distro maintainer/user to set things up into a
static, brittle working order.  Seeing a much-needed cultural shift
begin somewhere would be nice.  The Plymouth->X transition would lend
itself well as a starting point since many building blocks are already
there.

Regards
