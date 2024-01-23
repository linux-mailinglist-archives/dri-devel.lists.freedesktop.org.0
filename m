Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA024839178
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 15:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC2110E7E8;
	Tue, 23 Jan 2024 14:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9CD10F2B2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 14:34:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 79CE961E19;
 Tue, 23 Jan 2024 14:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45568C433B1;
 Tue, 23 Jan 2024 14:33:49 +0000 (UTC)
Date: Tue, 23 Jan 2024 09:35:19 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [BUG] BUG: kernel NULL pointer dereference at ttm_device_init+0xb4
Message-ID: <20240123093519.3ed37601@gandalf.local.home>
In-Reply-To: <c45df2c7-695b-42be-b893-a4f520d9e723@amd.com>
References: <20240122180605.28daf23a@gandalf.local.home>
 <20240122181547.16b029d6@gandalf.local.home>
 <20240122181901.05a3b9ab@gandalf.local.home>
 <CAHk-=whry+-JUDiiCkDkDn2TDg7SA5OvZpPbcQ_jkM_J5=ySdA@mail.gmail.com>
 <27c3d1e9-5933-47a9-9c33-ff8ec13f40d3@amd.com>
 <20240122203552.529eeb20@gandalf.local.home>
 <CAPM=9tyQ22nw4_u366EX=PnROYcWPD7ONRFpPEKxRvTZo0B4zQ@mail.gmail.com>
 <CAPM=9tyCN1ZhvCTjoKn-Yg5BhnrMae4E5Ci4_u7BZ2vv5gDnKw@mail.gmail.com>
 <20240122215200.1ec02a4a@gandalf.local.home>
 <c45df2c7-695b-42be-b893-a4f520d9e723@amd.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Dave Airlie <airlied@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Fedor Pchelkin <pchelkin@ispras.ru>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024 10:43:04 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> While applying the fix a week ago I was under the impression that QXL=20
> doesn't use a device structure because it doesn't have one and so can't=20
> give anything meaningful for this parameter.
>=20
> If QXL does have a device structure and can provide it I would rather=20
> like to go down this route and make the device and with it the numa node=
=20
> mandatory for drivers to specify.

Then at a minimum my original fix should be applied. Perhaps with a warning
too. That is, I added at the beginning of that function:

	if (!dev)
		return -EINVAL;

Could have that be:

	if (WARN_ON_ONCE(!dev))
		return -EINVAL;

In any case, it should not cause the system to crash.

-- Steve
