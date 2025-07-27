Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB80B1303B
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DF410E01F;
	Sun, 27 Jul 2025 16:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="WiVpeKdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0E810E01F
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1753632120; x=1754236920; i=deller@gmx.de;
 bh=crl2NY3z8ht7kT2f4GAg9DUloR/Qxz14Lpt5cIkZZcc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=WiVpeKddOKCGXyux5T8LVNhSkDHG397OUtcWti6F4adLO9QwkB3UBdBrlwXk/43P
 5yg6VOYBOZHxYw/8NvbS4DmB3LQ7NbOlDifhfBPUQlEAlTRTEGV43pmQEsJgpmDoR
 UH5msDYOyolf93bQdsgahB0u8VqCmwYztfo9Wlpf597U4i5RQN4jNX7prISQ/purM
 bUBhLsKaAmdAv1J5IQRDrtJaWdPbl1aGchK5OWvhwId4+8CRLIfmJC5i5tsGUJhSV
 HdvBvMLtVdaFOMf7HID8fsLCe3fCj59U27KzJ1bQ+GXP6HggCrbtEV05YkquYwNpf
 /PplV4jPKl1WdGcUPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUqF-1uphvM40x5-00HDcA; Sun, 27
 Jul 2025 18:02:00 +0200
Message-ID: <cd0f78c1-354b-452a-880e-cbdb12f76292@gmx.de>
Date: Sun, 27 Jul 2025 19:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: simplefb: Use of_reserved_mem_region_to_resource()
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250703183514.2074928-1-robh@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250703183514.2074928-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rKmM2tfwVz/4DQST8SYcBqplU7G3sPUm7Rseicrovt3Vx4s8Q9w
 u+/uwsdPIULdRyGRw3h/lGvWdLtKA2sOWvOmlLWtP+Kt0zZop2La3ZTQ1/dN50npcp5ftmE
 4RSKKNA2uBxK/4j/ZERPAh6sz2TCYxnqQjfD6QBieQRzaWLYn8+gUUsUoYPEX1MF+yykMAE
 WjBHIC80u/t1cVem2N6+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zHFtaK5eRIU=;vuYsHAVWmKCHd4NRj/ri+ijZMm7
 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
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

On 7/3/25 20:35, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
>=20
> The error handling is a bit different. "memory-region" is optional, so
> failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   drivers/video/fbdev/simplefb.c | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-

applied.

Thanks!
Helge
