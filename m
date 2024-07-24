Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0519B93B2A5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 16:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9E210E6FA;
	Wed, 24 Jul 2024 14:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EgsqkOJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8DC10E6FA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721831278;
 bh=zJ3NyoiJsV3IvrPUmwyZbhqENJB71DAFnSh0D4rXbCs=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=EgsqkOJbNbE0RLaxYENLsuIakCPpc7evdDAJ64qCXrca4k42YMpsG6LNsiFJCtan7
 DVKkdh3kv6epe8b1ylnXxrtRmBtGJZ82FiPmiCmHIpe+FCQVtYGgwtiy8FHAi2+b+o
 njZqIQa9k/ORZxuKmtBfLnj55jn3IqQiC6zbGIi/YfvewDU+YQnzSXSzJ0wViMx3qx
 rvU3tolFqVXrfjxT/wxMwnrWZphgYi0jhf6ruHH4bg/6qkESrgr5VFlo+nsR5qCnpT
 qJOQSMFcTRRUx0+8IcwqPQZPED6yCbbRgH/i30ctzy0dy0j0FoxwNiesBl/uFKY2yY
 95aPBLNcJ6mcQ==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 413E43780C11;
 Wed, 24 Jul 2024 14:27:54 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <6b60a83d-8416-4cf8-b373-dc3c697c788a@arm.com>
Date: Wed, 24 Jul 2024 11:27:40 -0300
Cc: Rob Herring <robh@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Asahi Lina <lina@asahilina.net>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1CF0978E-344C-4EC9-A221-4F19EBA4B988@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
 <20240723180642.73502856@collabora.com>
 <6ce8fd12-b175-4a8f-8ea9-6221a555b69c@arm.com>
 <CAL_Jsq+Dr5zO5MKEGq0dW9SuTuawaJMhHziFd73Ef_S1zbOkXw@mail.gmail.com>
 <6b60a83d-8416-4cf8-b373-dc3c697c788a@arm.com>
To: Steven Price <steven.price@arm.com>
X-Mailer: Apple Mail (2.3774.600.62)
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

Hi Steven!

> On 24 Jul 2024, at 10:54, Steven Price <steven.price@arm.com> wrote:
>=20
> [1] Although I have to admit for a debugging feature like devcoredump
> there might well be pressure to implement this in C as well purely so
> that customer issues can be debugged=E2=80=A6

FYI: I picked devcoredump because it was self-contained enough that I
could make a proof-of-concept and get the discussion started. I think
that, at least from this point of view, it has been successful, even if =
we
decide against a partial Rust driver! :)

I was informed early on that delaying a debugging feature until the
abstractions were merged would be a problem. Don=E2=80=99t worry: I can =
rewrite
the kernel part in C, that would indeed be a very small patch.=20

=E2=80=94 Daniel=
