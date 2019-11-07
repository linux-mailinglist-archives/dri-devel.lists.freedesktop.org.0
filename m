Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6CF35B9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 18:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18226F75A;
	Thu,  7 Nov 2019 17:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 988486F755;
 Thu,  7 Nov 2019 17:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 6B2FA10017F9;
 Thu,  7 Nov 2019 09:30:35 -0800 (PST)
Received: from anholt.net ([127.0.0.1])
 by localhost (wales.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id HoZuJZOcm_Oi; Thu,  7 Nov 2019 09:30:35 -0800 (PST)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 5B22010010D4;
 Thu,  7 Nov 2019 09:30:35 -0800 (PST)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 2C06A2FE2F98; Thu,  7 Nov 2019 09:30:53 -0800 (PST)
From: Eric Anholt <eric@anholt.net>
To: Rob Clark <robdclark@gmail.com>, Fritz Koenig <frkoenig@google.com>
Subject: Re: [PATCH] drm/msm/dpu: Add UBWC support for RGB8888 formats
In-Reply-To: <CAF6AEGuXv+ePcGtuN2XTFazrMrtyCYMjZOvYn5CZ3bKE2UhVQg@mail.gmail.com>
References: <20191106232553.76553-1-frkoenig@google.com>
 <CAF6AEGuXv+ePcGtuN2XTFazrMrtyCYMjZOvYn5CZ3bKE2UhVQg@mail.gmail.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.3
 (x86_64-pc-linux-gnu)
Date: Thu, 07 Nov 2019 09:30:50 -0800
Message-ID: <87wocbiofp.fsf@anholt.net>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1987673359=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1987673359==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Clark <robdclark@gmail.com> writes:

> On Wed, Nov 6, 2019 at 3:26 PM Fritz Koenig <frkoenig@google.com> wrote:
>>
>> Hardware only natively supports BGR8888 UBWC.
>> UBWC support for RGB8888 can be had by pretending
>> that the buffer is BGR.
>
> Just to expand, this aligns with how we handle RGB component order in
> mesa for tiled or tiled+ubwc.  If uncompressed to linear the component
> order is RGB, but in tiled or tiled+ubwc, the component order is
> always the hw "native" order (BGR) regardless of what the outside
> world thinks.  But that detail kinda doesn't matter, it's not like
> generic code is going to understand the tiled or tiled+ubwc format in
> the first place.. and code that does understand it, knows enough to
> know that tiled/tiled+ubwc is always in the native component order.
>
>> Signed-off-by: Fritz Koenig <frkoenig@google.com>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Seems like a reasonable workaround to me, and permissible by our fourcc
modifier rules ("you just have to have one way to address the pixels
given a fourcc and a modifier").

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl3EVMoACgkQtdYpNtH8
nuizTw/9FlTG19QgaCUdQ4TnHR4KS0aHUTewrapoe5LZ96DKl4JAKdkzdT7oGaWq
jIX26+6DpG6WF3VWqYBG1j9or0m+lZZGxAb548KpcDlW3N7HJh226acI12AGV1M4
GbiJKlsSosYtn1+OsvaXHQILN1+kBgoXbGrYq5FBIakAJ/E/lSp4r89U0mPAQu5H
OBooVqdOZTzE6wf2VAuxW/Wi7PUuHQ5ba1CkUJYj3/3uyyy+X7dKAhKuknTksnMQ
35PpPXB9qyt5DIC0j2DG4htxzvAIMzhy/WYw6KWqFKFkCqHCn9JfZQokob+VK2az
JXBosScS1tfx7+Rzdjk3ACzJXgjqRSPSKHkfclDRujXL0K2bDEdCl4Os68RyaFtn
0aiSpcdhTEMdxmP8vm3gUHrQSokHU1ZMGot6BvwSZO3WqT7BM3vGCIriWbGmvdbu
zGWuCxSE8LqTnDNBGAgvI8tNfYw0dO/E73J+ARCrq5dniqHrNAahXquZKQQSVKbX
zGIIpXamrlp6EXyeDu4ljxqKMo6FQFJUSMc9tKY9Us4KOAB2lgoSDwf9F5GYZk7+
113gqrWzUFEV1oQZnuHnYTF24J784uzoEwxjAD11C0+JQ1s9PTpe44As0iJiUiq7
D7e1pPWOBmpd1Ej5YrOalr7Qn7IUyPTVrahc9GPZ5377VYEoZdo=
=0F+3
-----END PGP SIGNATURE-----
--=-=-=--

--===============1987673359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1987673359==--
