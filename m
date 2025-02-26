Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A86A4523C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 02:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B3E10E82C;
	Wed, 26 Feb 2025 01:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="DSr0p5U6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0CB10E832
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 01:36:39 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51Q1ZSdu1502812
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 25 Feb 2025 17:35:29 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51Q1ZSdu1502812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1740533740;
 bh=T0pKCclIvHKyDRUHCJs7P4mfoEs4SIcJGp6SSmwXCZc=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=DSr0p5U6PuFacB2sJlJBShpK+caegDMEmn8OYplTp/ukKNtEFfrkn97ga+OT2dXpz
 K/n5OJZ9p7wF026A4N5Ms8I4Ha7wXxIE31o+eevCv66LWleUk5egaKa/T1wzR+OiP5
 pBftNRMbRUke7ubIKWI6Trw88YIoPJ//UlgWSqbBalJrMQ6XLeWdsBqjIBFJ2BqBTU
 NxN3soIqU4psmCdpeI68cUVCZ/T8YSni/GX+FUYtyTt8DqQzRz5FBJx8rRSkQsq+0n
 LFOV9xO0DwzRQLOdgcR413cBdNqea/GHzmtBr2NpUvBJ8KgVfK7MCUU4fZDlrEdXny
 PWA/+ls6AlysA==
Date: Tue, 25 Feb 2025 17:35:26 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au,
 andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
 arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
 bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
 davem@davemloft.net, david.laight.linux@gmail.com,
 dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
 eajames@linux.ibm.com, edumazet@google.com, eleanor15x@gmail.com,
 gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
 jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
 jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux@rasmusvillemoes.dk, louis.peens@corigine.com,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 neil.armstrong@linaro.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
 simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de,
 vigneshr@ti.com, visitorckw@gmail.com, x86@kernel.org, yury.norov@gmail.com
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
User-Agent: K-9 Mail for Android
In-Reply-To: <8052b316-9f72-42c7-9e11-e23e690d80c4@citrix.com>
References: <3BC57C78-1DFF-4B83-85AA-A908DBF2B958@zytor.com>
 <8052b316-9f72-42c7-9e11-e23e690d80c4@citrix.com>
Message-ID: <4259A207-7B5F-4D25-A8AE-144D24554201@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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

On February 25, 2025 1:43:27 PM PST, Andrew Cooper <andrew=2Ecooper3@citrix=
=2Ecom> wrote:
>> Incidentally, in all of this, didn't anyone notice __builtin_parity()?
>
>Yes=2E=C2=A0 It it has done sane for a decade on x86, yet does things suc=
h as
>emitting a library call on other architectures=2E
>
>https://godbolt=2Eorg/z/6qG3noebq
>
>~Andrew

And not even a smart one at that=2E
