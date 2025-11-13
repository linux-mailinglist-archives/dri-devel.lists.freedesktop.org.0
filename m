Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8446C586D1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 16:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7805710E053;
	Thu, 13 Nov 2025 15:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JOkqNX/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E84010E053
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:38:52 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d6kvX4Tdsz9tPW;
 Thu, 13 Nov 2025 16:38:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763048328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUSR+TpBErBQ2J7ZzmI3k+vdDnH2mo5zrxiXUTuyUus=;
 b=JOkqNX/gCjc0fnZtLCY0i4SclH/OXjgvHgtQyCZd/9eb4fF2LFnGs3Tn9y1OImaM1yZ1sT
 c35DMNXuuaH584RtTOjZGrfM4LbAf1KzPt+wf63F1xJHjyPj3NalXDQh9d+QRZ6RDp3cGq
 aIAvvSVokGyKYRLsRkiBIlj80fCx0zksLDCKq7Cb3D81Z+NyTVlB+U0DtUorfntQueD7Hs
 teCbmPqL52fWDkQZKqEsDs7FvJ9dfjpSLcx0eNg9wP+UalEJMzZC3sldizezRrMjBZCjxC
 hIRJ5OzQD+DEP92SR+Z0RGgp1zXMjLVSi1SsY7yCcS44qr1YgjZ0U/2YhK+KVw==
Message-ID: <bd64a6ca-2a3c-419b-afd8-237a26c9fa1c@mailbox.org>
Date: Thu, 13 Nov 2025 16:38:47 +0100
MIME-Version: 1.0
Subject: Re: Plea for low-latency cursor rendering functionality.
To: rat marrow <ratmarrow@gmail.com>
References: <CAP4Oc0n+CHTR+BNrDhLEjHd5+AK73W5qthaPu6d2jSiD1jC=Ug@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
Cc: dri-devel@lists.freedesktop.org
In-Reply-To: <CAP4Oc0n+CHTR+BNrDhLEjHd5+AK73W5qthaPu6d2jSiD1jC=Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 38634f3dab5c269cfda
X-MBO-RS-META: 1g7rbn9xpor53ffdzsu89eyn77or3ty4
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

On 11/13/25 08:33, rat marrow wrote:
> I came here from a discussion on the Hyprland repo a few months back: https://github.com/hyprwm/Hyprland/discussions/10823#discussioncomment-13601563 <https://github.com/hyprwm/Hyprland/discussions/10823#discussioncomment-13601563>
> 
> I was initially planning to just bide my time until maybe, just maybe, someone with more know-how would have the same issue I have and take action on it, but I figured maybe reaching out couldn’t hurt?
> 
> To preface, I do not have the technical knowledge to fully /understand/ what I am asking for, as in what would have to be done to support such a functionality.
> 
> I also want to say that I am not coming from the perspective of gaming, as there have been many strides in conditional tearing control. This is about the desktop experience.
> 
> As I’m sure you all know, in X11, assuming one hasn’t modified the functionality in some way, the cursor is updated as soon as possible. This means minimal latency, at the cost of barely noticeable tearing on the cursor plane,

There's no tearing of the cursor plane that I know of (it's up to the KMS driver).


> and artifacts where, as an example, a window you are dragging will lag behind the cursor.
> 
> Now, obviously for a lot of users, the latency trade-off is worth the more visually perfect frame, but there are some people (Hi!) who would be willing to sacrifice that perfection for a more responsive system.
> 
> What I am asking for, put simply, is functionality that allows an end-user to enable this behaviour and accept the trade-offs that come with it.

The choices you're describing are mostly up to the Wayland compositor.

I implemented more or less the same cursor handling as Xorg in mutter in https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4249 . I was asked by kernel KMS developers not to do this though, because it might tickle kernel bugs (in which case Xorg should tickle at least some of them as well though...), so I abandoned it.

Instead, I'm proposing a HW_DONE_DEADLINE CRTC property, which the compositor can use to minimize cursor latency. See https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4540 , which also references the kernel changes.

(Speaking to AMD developers, apparently my assumption that AMD GPUs can reflect cursor position changes while a frame is being scanned out was wrong, in which case this should allow getting cursor latency very close to Xorg, certainly within a millisecond)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
