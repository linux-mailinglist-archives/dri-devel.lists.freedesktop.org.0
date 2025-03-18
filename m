Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4601CA66D4A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F33910E1FB;
	Tue, 18 Mar 2025 08:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LC2Up8dd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E259210E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:03:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D700A48E80;
 Tue, 18 Mar 2025 07:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17495C4CEEE;
 Tue, 18 Mar 2025 08:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742285025;
 bh=rYG3PWvuAMncrnBiyOeKXgOkJoHrMxZjLoDTUff4qJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LC2Up8ddOnIwy1KB+r+HhQmU1G3KStunUgfI0nLLbbM/LD80TgE3AXhhyTk6aSPRd
 WgFHWiCD88cnfHT3MjjWtIDxa5Bs43zYiIVzRK/iEiYpRjl1I9K9MJgQZAF5Aq4jZN
 rzloZMHcXj5p7GGHN79Hllzp2VRpp9RRSEUBaW1uZVZzF/Xaxxu+0io8u2xplIQ1pC
 o09tHHkDLPrK4I+4H+oRGrJcCM5pJRQsapTvjfcWuqFigvvFjqEgongvi0WtGhrQoy
 0XumEQjTCLCH7HaNVN5ZzDrhQqAmHJL6FG1bqkSJyAVYognkR+P5lVKffYjFzmggby
 Kjkk5w6p6kzGA==
Date: Tue, 18 Mar 2025 09:03:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Phil Elwell <phil@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v6 2/5] dt-bindings: gpu: v3d: Add per-compatible
 register restrictions
Message-ID: <20250318-complex-serious-aardwolf-c77afa@krzk-bin>
References: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
 <20250317-v3d-gpu-reset-fixes-v6-2-f3ee7717ed17@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250317-v3d-gpu-reset-fixes-v6-2-f3ee7717ed17@igalia.com>
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

On Mon, Mar 17, 2025 at 10:01:10PM -0300, Ma=C3=ADra Canal wrote:
> In order to enforce per-SoC register rules, add per-compatible
> restrictions. For example, V3D 3.3 (used in brcm,7268-v3d) has a cache
> controller (GCA), which is not present in other V3D generations. Declaring
> these differences helps ensure the DTB accurately reflect the hardware
> design.
>=20
> The example was using an incorrect order for the register names. This
> commit corrects that by enforcing the order established in the register
> items description.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 86 ++++++++++++++++=
++----
>  1 file changed, 73 insertions(+), 13 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

