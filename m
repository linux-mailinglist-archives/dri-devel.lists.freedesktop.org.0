Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD07A1AB75
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 21:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7E510E89D;
	Thu, 23 Jan 2025 20:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="b6sjNMpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EDA10E89B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1737664410; x=1737923610;
 bh=YqWY5jbFSw2AQ431MsSvaZTcptL00P5dkLw6Ru/wdjc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=b6sjNMpbVPmwGkbpeZ0pqDbaSlq0DTRHIeRjGxoNmDW54ZtsY7xQCIA/rGE+MIAFA
 RZF4nloBhwmz57ZLbIqsUsrbYTJjkaujDEyuMA7ALp1kvP9o0Hanw96NTHHfJH99R6
 1tpGolc2DI4msiAhYUwN3u1IWaLTfSEsPC0bZrWxJjDS/VDztgr7Tt3Nr0G5WO/9WX
 rtyc1xcISDePKMBTcXYW8xidgErqKXXgPx1jQmKwXYtbpExahxROVdgdwS82HM11y+
 fDRo6NBcrZFxF8vgN1QMBCLrpe7xS1kmIbbIXWYoc+1lLuqjZLNoapWBItdZNiEU06
 sTy1dSFrMrpcA==
Date: Thu, 23 Jan 2025 20:33:24 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Subject: Re: [V7 29/45] drm/colorop: Add PQ 125 EOTF and its inverse
Message-ID: <gPhjQA9ZwgBDW5ZG10bnkJZ6dS6rs1sSaf7KHdauN7zcxIDEqPiX7wCmAIC9PAQ2xXkiNtVhxSfTQqNpRKuBwRqyzmuCuLBaRoT_jEzG8zI=@emersion.fr>
In-Reply-To: <16986d2f-abd8-41d8-b150-55d6b1c6ba6c@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-30-alex.hung@amd.com>
 <owMi7HF_zONkAALlmHM6WhUNrOAyMbEYyjD7We0OGgWht2Tgj7o4OSByObPiwf8lZ0qwyy80r8kuf3pTea1ayGXzSua0oZc5OtydzYkF-M0=@emersion.fr>
 <16986d2f-abd8-41d8-b150-55d6b1c6ba6c@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 63b9b6e8041ff3f50fd1a1362044603cd945d172
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thursday, January 23rd, 2025 at 21:06, Harry Wentland <harry.wentland@am=
d.com> wrote:

> On 2025-01-15 03:00, Simon Ser wrote:
>=20
> > Is this 125 magic number something we can expect other hardware to
> > implement as well?
>=20
> It's based on MS's CCCS interpretation of 80 nits as 1.0f [1]. Based on
> this definition one needs to use 125.0f to represent 10,000 nits,
> the maximum value PQ can represent.
>=20
> It's hard to say whether other HW will implement it the same way,
> though most drivers for HW that supports HDR on Windows might have
> a similar concept somewhere.

I see, thanks for the explanation!

> > Could AMD use the HDR multiplier or another block to behave as if
> > the multiplier didn't exist?
>=20
> Gamescope makes use of this scaled PQ EOTF and its inverse, so I'd
> like to expose at least one color pipeline that we can use to move
> gamescope from the AMD-private color properties to the color pipeline
> API.
>=20
> We only have a single HDR multiplier but three curves (1 and 3 are EOTF,
> curve 2 is the inverse). We could only mode a PQ curve in the range of
> 0 to MAX_VALUE (1.0, 255, 1024, etc.) for the 1st EOTF, not for the 2nd o=
r
> 3rd curves. I'm not sure how useful that would be.

Yeah, I don't see a good way out of this. I was hoping there could be a
way to expose something more generic.

Then maybe this curve ends up only being exposed by AMD, but as we
discussed in the past that's fine.
