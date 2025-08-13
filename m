Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB88B244A7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 10:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBE210E1CC;
	Wed, 13 Aug 2025 08:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NarqDTiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BE310E1CC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:47:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A049601DB;
 Wed, 13 Aug 2025 08:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A16C4CEEB;
 Wed, 13 Aug 2025 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755074847;
 bh=Jl9GkOX9FJmKNs34ThsQyxlOoP4otk7CGGGV079WIG8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=NarqDTiUVDuz8yxSdPCdhbSrCmGtg9u2CsV1g2KsJ9wApg+PHpuFs/R0K9eJ8NmDD
 z6tHI0t5wyHVNN9adMfoAnIhpT8JtjanYTwW/G70narjHW0kPun5cZ8EunlUuss/dt
 JVzUU9IzubNw1a6mX1e1nGqO8zMZW+qINI4E/0t5IzZsQF5XTbcTSPcSK3lpGR9eVe
 fhxqO+Zdn3up9TbOAubzgJMLvF5SQ/AUv3QHnoGiUqc9KddT6qwE6oUpaFY+MYlowa
 m2/vDnux/VsrEX9Kw9jVVf0DD8nOS7WGTf8eV4MfFq9u5YKd9732aWdLX9VjKZa5jH
 4rzxKhfycPXuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 10:47:24 +0200
Message-Id: <DC163WZ061ZZ.V59JJD4PDIKZ@kernel.org>
Subject: Re: [PATCH 2/3] drm/nouveau: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Cc: <imre.deak@intel.com>, <dri-devel@lists.freedesktop.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, "Lyude
 Paul" <lyude@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-3-imre.deak@intel.com>
 <cab8be18-1cb3-49d8-a967-767174b0dc79@kernel.org>
 <4abed396-5225-4b5c-a538-ced4f4619239@kernel.org>
 <aJt2-wXhhYojy7Hy@ideak-desk>
 <85623d31-000c-4ca1-aa2c-2c059534eb99@kernel.org>
 <e2d1fb66-642b-46e1-a5ef-527ae21855c3@suse.de>
In-Reply-To: <e2d1fb66-642b-46e1-a5ef-527ae21855c3@suse.de>
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

On Wed Aug 13, 2025 at 9:25 AM CEST, Thomas Zimmermann wrote:
> Hi
>
> Am 12.08.25 um 19:24 schrieb Danilo Krummrich:
>> On 8/12/25 7:16 PM, Imre Deak wrote:
>>> The fix is in drm-misc-next-fixes atm and Thomas has sent already
>>>
>>> https://lore.kernel.org/all/20250812064712.GA14554@2a02-2454-fd5e-fd00-=
2c49-c639-c55f-a125.dyn6.pyur.net=20
>>>
>>
>> Ok, that's great! (No further action needed AFAIC. :)
>
> Please don't cherry-pick across trees unless absolutely necessary. It's=
=20
> a hassle for later backporting and merging.

No worries, maintaining a couple trees myself I'm not willing to contribute=
 to
such kind of mess. :)

I didn't know if this patch was picked up somewhere else already (since I w=
as
asked for an ACK previously). Hence, I asked if this has happened and if no=
t, I'd
have taken it thorugh -fixes myself, ideally getting the corresponding -rc
backmerged into -next.

Thanks,
Danilo
