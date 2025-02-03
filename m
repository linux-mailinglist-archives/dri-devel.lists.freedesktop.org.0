Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B894A26D96
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D8C10E5B3;
	Tue,  4 Feb 2025 08:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mgnet.work header.i=pancake@mgnet.work header.b="vlTpZm9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Mon, 03 Feb 2025 10:03:41 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F2410E2CE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mgnet.work;
 s=s1-ionos; t=1738577019; x=1739181819; i=pancake@mgnet.work;
 bh=CXG4/Gqud+GA9zCiVPKBTrNOlcZAYvolb9tzOuzGqQs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 References:In-Reply-To:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=vlTpZm9BeV24qJvQR/ufvbFR+yUqp0JbfqZCR+U0GSdljcjGZHzEP1FN0ATXKw2D
 hkFFXv+H1vssVWi0F1yrgG7CfDcKI4IjEtZ4dgKVUQZZB6oAls72w2+5aGP3e3mfS
 saT4ovVd5le5x+ECDUdeg1EilKiAlGnk/g5POhtP1YxTHWjlu4gW7uk65uYNcfRVU
 nfTEhh21XjpIvgybT0xTFlxogrXGsf/8azIHy5Ku6v8e7V+PCCNB+EQBmzMaNorFP
 06mhyzhuK15PDopSYqNxegXovSpFqesVAjzVokjVoV1c1l+GTsbijCm7ynZCikI7B
 64MfO6N+OKOreP7ePg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [172.16.0.24] ([84.136.91.147]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis) id
 1MEF87-1tXVF812bl-000xyh for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb
 2025 10:58:35 +0100
Message-ID: <5baa47c4-e92e-467e-a20a-0fb3a6374636@mgnet.work>
Date: Mon, 3 Feb 2025 10:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] drm: Picking a compatible CRTC for a connector seems
 not to work as expected
From: Emilia Schotte <pancake@mgnet.work>
To: dri-devel@lists.freedesktop.org
References: <516D691A-CFAE-4340-9EC0-5DFC8C7357DD@mgnet.work>
Content-Language: en-US
In-Reply-To: <516D691A-CFAE-4340-9EC0-5DFC8C7357DD@mgnet.work>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bDDlmDlP30jeC0pgLuYzOsPiqDk4ll+vHonjFgQ1IgLTw7fQyhZ
 hG/39niCPjsUdZTb/PlchSiJTobrYD2N35w7YzIzqfr5ENe1YOh+ViVyrGcAswM1iLTd4RL
 Y1YGznBl+5VklIA4po8CbJYJsh75ch1IBnKwX+1Ji4jpzjlBEFRqcTHBWAnDwwYGswfXSOd
 D/m35H48afnYBbMNJvXCw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qVsBPXhIbYc=;qTju6FuJfNyU9rF3VnLn4ZVzJff
 Spf+oIYbJjHyMyHRNWny3ZLxtLc4C7vB+HlUOYmiPKe/M3240qh6/vlT3dhuBSz7XNiEJ1Gv6
 JwFjwEt4iD7llKeAl7kkFK+EtYAMZN7ZRF/6G2sTgbxP54ZLixaSJ1M4f0srds6iRq23FhzoV
 tUDOb8wcTz0nKWFLAcf14iU9FUe9NEH74g4r7PrcKRg3OA2NFJwIX4u+3ZerC6FdCZavFp2CJ
 XAdJC8WqfbvPRDIbL26jNLh22iXGkV4K0zdL8ccX9VXRBFJyY2TJtbX7DiDQa1Qjnnl2KVJ91
 OQ20YntoNQrQt0l6Oabkdfixg9/R1wFPLWKa6N7Oq+PYTbB7y5rEKfk6xLzsp4ZiDBgxzrgmJ
 DGGd6bFbqVWVkElyQkkqAV6ssQJcZ4EHUHbTSpKlVFvMDTBpVfDkgWzp9E0BDwMPYalKg7Ooh
 Qyuy+r9sLbGSjH9OEwQQB/f1PcrZ03t+0vgdiTHPxJ675EIJg0n+b/Dov/UekWaNMaAo5/A9b
 BgxSSGCI1HSNoKHGUBY73VrKkqiQU08xToKKocOtmDqBVYzczZObqUGBOTvry2ZEX1BIm9Z5M
 NaOO49rtDjg//rZYOJrQnuXzosoF9aZ2C+khfGNUV+upAxfnmnQVhOAfVh4YyBnm99YlnSjno
 yEYrdGGQJ5BESDrwD0BWCSDAnq4tZ63Coiv945a7NJu4N29HiVc5uGrM0lA2HU/cEHeTh4/c0
 AtNGGUx+sMpfdaRBDr+UdbpjE66sPHbqy2v40z3CyGq3ks+DB07oQfJjk7+dTOuCDb0ceBdKa
 HT+tGZX37Jq6lC6erBEv775fvGjCualjP6Q4qytK6losJv6B8r4XIf1MrLMarluwwaFg7tr1m
 NLy7Df5UgNv4xQbDGDxD1fdi/oKa2L06759NJ9qsUfB0qSlbYCl9GqdZisR/z5y3SONwTeqyz
 JV1P4CT8xaLFe7c/YneYi8Nv5hYEfjSmVKa/drOZufGC+xAJ8AX1ShLFd3qRZkiThKlEUN+L5
 DJ5dRzLEFAjnZ66vOr+LQ4XKvVSDmevU/2yvwtyvoP9Pb2ZbyyYdVqrveDXNArMs3hQ3l23Fs
 RGc5YbPeNyau54f1F9dPFOXE/yigRttC3Zp1ccY8JeTPC72NT4qSHewMtoJZhxF3XyNIxA8/c
 bFOr86vIMISBnykCVOaXRlBZsE/qHgYT4m+TQ/kk9bTTTariyOYNa3XJxSN/G0JrZpv9OAgk0
 4KZHOlnSOE9RM++Wj8Rb5XM+DUdykw67WMv92N3P1XIyShaoID8RhC4=
X-Mailman-Approved-At: Tue, 04 Feb 2025 08:48:22 +0000
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

Hi again,

now I feel really silly. You can in fact use any CRTC with any
connector, just like the API suggests. I however got stuck in object
oriented (?) hell, where the CRTC was already being used with another
connector as stored in.. some object I don't know exactly but it was
probably something the CRTC_ID property of another connector. My modeset
request did not unset this property as it simply left the connector
alone, which obviously now won't work anymore. Annoyingly, the debug log
did not indicate this at all and the error was incredibly vague.

Issue is fixed now, was not a bug

On 2/2/25 2:09 AM, Pancake wrote:
> =EF=BB=BFHello!
>
> I'm working on getting a modeset to happen via atomic commit and I've go=
t most of my code done already but there's one small thing I'm getting hun=
g up on.
> In order to display something I need to dedicate a CRTC to a connector, =
but not all CRTCs can be used for all connectors. As far as I have underst=
ood, each connector has a list of compatible encoders and every encoder ha=
s a bit set for all compatible CRTCs. Now I've used a variety of things to=
 check which connector is compatible with what CRTC:
> - I ran drm_info which showed that each connector supports a unique subs=
et of encoders, but each encoder supports all 4 CRTCs.
> - I wrote a small c program where I called drmModeConnectorGetPossibleCr=
tcs(), which resulted in the same outcome.
> - And I used my main application written in rust, which I encountered th=
is issue with in the first place.
> I tested this both on an NVIDIA GPU with proprietary drivers as well as =
an integrated AMD GPU with, I believe, the amdgpu driver. Same outcome.
> This leads me to believe I can freely choose any CRTC to attach to a con=
nector (as long as I don't reuse them, obviously), however this isn't the =
case. Only when iterating through the connectors and CRTCs in the order th=
at I initially received them in when getting the resource handles, does my=
 modeset work. If not in this exact order the atomic commit fails with inv=
alid parameter and logs into dmesg something along the lines of "CRTC/conn=
ector mismatch".
> Am I encountering bugs in both the AMD and NVIDIA drivers here, or is th=
ere something I'm missing when it comes to choosing a compatible CRTC?
> If this is some sort of quirk, what's the best way to work around it?
>
> Easiest way to replicate this is to simply grab drm_info from emersion's=
 gitlab, or write a small c program that fetches the resource handles and =
iterates over all connectors, calling drmModeConnectorGetPossibleCrtcs() a=
nd observing the lower 4 bits.
>
> Thanks!
> Emilia
>
