Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55021B323FA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 23:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0167710EBBE;
	Fri, 22 Aug 2025 21:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iUVFX2eU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAA710EBBA;
 Fri, 22 Aug 2025 21:14:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D5A5C601D3;
 Fri, 22 Aug 2025 21:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC99DC4CEED;
 Fri, 22 Aug 2025 21:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755897257;
 bh=SUODiX3PEP0YteZeTBND9JDx9lv8ES1Apf1YUhokTWM=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=iUVFX2eUJmagt6E5Fsim3zhCDYLX1diTczATuvakk2dwk1dNKfGt808Qld/GTf/UM
 F6mjnD2MDF2VHGx1Cd76LwTjt6w1KUUCOnCNFnNfMGwdEO+lnVGHcB0XwYPXfpt6f5
 k+kFDH7nSzdQ290E23HZFIlzicOB2qx8TR8m2WIT84Z04cA2e5h+A5iehVZBUBIhIh
 PnAsFC3lkA8JCAmBbO5s5b99Qdo3l6J0kEZVej4pEWrYVKSE5CSVhjkaOIivTaDj6h
 CgRxAgISTJdbCZc0xgrYKOFoth8zEQ1L0Wdr0yHSlc9pdrk78IfX1wNKAQn2U5VAcF
 ifB9jFV2Rk0XQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Aug 2025 23:14:14 +0200
Message-Id: <DC99MMSCWQSM.5KF4ISD63U4X@kernel.org>
Subject: Re: [PATCH 2/3] drm/nouveau/disp: Always accept linear modifier
Cc: "Lyude Paul" <lyude@redhat.com>, "Faith Ekstrand"
 <faith.ekstrand@collabora.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
To: "James Jones" <jajones@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-3-jajones@nvidia.com>
 <DC99870U9374.HUXNLLZ5ZYBE@kernel.org>
 <69bd369e-ceae-490f-8f14-28a2a8e874bc@nvidia.com>
In-Reply-To: <69bd369e-ceae-490f-8f14-28a2a8e874bc@nvidia.com>
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

On Fri Aug 22, 2025 at 11:11 PM CEST, James Jones wrote:
> On 8/22/25 13:55, Danilo Krummrich wrote:
>> On Tue Aug 12, 2025 at 12:00 AM CEST, James Jones wrote:
>>> On some chipsets, which block-linear modifiers are
>>> supported is format-specific. However, linear
>>> modifiers are always be supported. The prior
>>> modifier filtering logic was not accounting for
>>> the linear case.
>>>
>>> Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly=
/nvdisp")
>>> Signed-off-by: James Jones <jajones@nvidia.com>
>>=20
>> This issue seems to be present since v5.10, what's the implication of th=
is? I
>> assume this has to be backported into stable releases?
>>=20
>> Does the subsequent patch break strictly depend on this fix, or can it g=
o
>> separately?
>
> Without this fix, the next patch breaks linear modifier use on=20
> Blackwell2+. In my testing, that meant fbcon was severely corrupted (In=
=20
> a manner that suggests it ends up with a block-linear surface rendered=20
> to as if it was linear).
>
> Yes, it has to go back to a fair number of stable branches to fix=20
> similar issues on pre-fermi GPUs, though oddly in my testing=20
> before/after this patch, fbcon came up fine on my NV50, so the effects=20
> might not be as severe there for some reason.

Ok, thanks! This sounds like we should apply the fix, backmerge the -rc it =
lands
in and then merge the rest of this series.

- Danilo
