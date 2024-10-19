Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADC59A4E0B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 15:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FE910E248;
	Sat, 19 Oct 2024 13:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wiredspace.de header.i=@wiredspace.de header.b="1ypJ/Wvd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 528 seconds by postgrey-1.36 at gabe;
 Sat, 19 Oct 2024 07:54:16 UTC
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF7A10E13E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 07:54:16 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
 s=key1; t=1729324002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/QX/lS6xRABHzsJFCN2mnwAkudqf4WZN4eEakuqqVs=;
 b=1ypJ/WvdK7goCa5xjq7zVTXZq4tklKOTOjtfNdORugecDz1IKja1XnRjuqPaWhmAmr8P/0
 VbYOOMEJQRalQFK+f6DL/3JGoYZUaWrqSF0H9Fw1UuPAI8WFGuPYYp7WDMCnR9u1AUYi6v
 7nICfbwQURqbDLqM+5H3BGNMWaucgiE=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Oct 2024 09:46:39 +0200
Message-Id: <D4ZM720DHP6L.3JT8TO5FP71XU@wiredspace.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: =?utf-8?q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>
To: "Jocelyn Falempe" <jfalempe@redhat.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] drm/panic: avoid reimplementing Iterator::find
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <CANiq72kG0Ai2DHfERD0aPDVuEpLYrZ_2uYdw17=eeHRp+2Q1Rg@mail.gmail.com>
 <cfde8e06-0931-4a53-bae5-469219e77b49@redhat.com>
In-Reply-To: <cfde8e06-0931-4a53-bae5-469219e77b49@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 19 Oct 2024 13:04:47 +0000
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

On Mon Oct 14, 2024 at 11:06 AM CEST, Jocelyn Falempe wrote:
> Hi Thomas,

Hi Jocelyn,

> If you want to send a v2, the easiest way is to download the mbox series=
=20
> from https://patchwork.freedesktop.org/series/139924/
> and apply it with git am.
>
> That way you will have my reviewed-by automatically added.

That's neat to know, thank you! That makes the use-case of patchwork a
bit clearer for me.

> Best regards,
>
> --
>
> Jocelyn

Kind regards,

--=20
Thomas B=C3=B6hler
https://wiredspace.de

