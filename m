Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF631306D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 12:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16D16E892;
	Mon,  8 Feb 2021 11:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 581 seconds by postgrey-1.36 at gabe;
 Mon, 08 Feb 2021 11:14:47 UTC
Received: from mx01-muc.bfs.de (mx01-muc.bfs.de [193.174.230.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053406E892;
 Mon,  8 Feb 2021 11:14:47 +0000 (UTC)
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
 by mx01-muc.bfs.de (Postfix) with ESMTPS id B10F22047A;
 Mon,  8 Feb 2021 12:05:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901; 
 t=1612782302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxpjNCvWyShQs0o1xq2uDFgwlPhrqmfb2L5lPzxXM3M=;
 b=OFLyk+a+Z8eVqnoDxE/QHZVfJq9ru1nkBWO4mH7cAUviwaY7WxARb/7PiqiiHpt8dAGrNz
 xTdvNxve4nAq9UE2r0GIuhJPOZYrC3xjMuSfw7iqWuUhL2vbyQGj8+Zufk0IIg4CTXCt/c
 B1/ab2fbTZBCl1ReXrkAi+pz7F11XsReMBD4bBq3F3JVCsszmRBbim0A7+3miEYwI+OBV+
 SV1IIiAxpbIjjsH+WXHUxakTvlTAhWwhniOHBkxTcJEStsXRuPOL9MVGlC0k35KyN71vzU
 3QXRVCkjE6ZiUSw0aXShWxkXUQHRig38ydperu5MYTGpitet1sJMGWyNM9vDfg==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Mon, 8 Feb 2021
 12:05:01 +0100
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%13]) with mapi id
 15.01.2176.002; Mon, 8 Feb 2021 12:05:01 +0100
From: Walter Harms <wharms@bfs.de>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Colin King
 <colin.king@canonical.com>, Alex Deucher <alexander.deucher@amd.com>,
 "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Huang Rui
 <ray.huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: AW: [PATCH] drm/amdgpu: fix potential integer overflow on shift of a
 int
Thread-Topic: [PATCH] drm/amdgpu: fix potential integer overflow on shift of a
 int
Thread-Index: AQHW/aZibC6c7NmnTEaIp1k5r3gR16pN6nEAgAAuR34=
Date: Mon, 8 Feb 2021 11:05:01 +0000
Message-ID: <3aed86cfb8014badbcbc4ee9f007976d@bfs.de>
References: <20210207230751.8576-1-colin.king@canonical.com>,
 <c6c99dba-aea9-304c-2246-e24632955479@amd.com>
In-Reply-To: <c6c99dba-aea9-304c-2246-e24632955479@amd.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.39]
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-25960.007
x-tm-as-result: No-10--6.720600-5.000000
x-tmase-matchedrid: lfH7Ftdh6lTRubRCcrbc5grcxrzwsv5u3dCmvEa6IiHgYNP0+4v1nuhN
 0jwIx2vHzn+cUF7VynIdD9u7d6Y7FKN1pQF++HP3XFf6l1YcdowBDya2JbH/+rZ52dbbIRC11t2
 9KLWKRj6byHEAgTCz2nD4B0GOmh08ipQL3tF+LWYoSebb2328i4Y+RHPfLBFEZRL+gCLSlhcTw7
 jCStQ0rnghiIvM4QIVF5qQsg8KVCCZQ6EsnBvpj3YZxYoZm58FnyQFaVgMM2AiB3Nk/d/KP6xIj
 SYfsSaZpsX84hgxtppmaTFBWBkYZHYRnQp9B8yrhVNduS+1i+96i696PjRPiFjBUeMsjed6lcHM
 CyWAI7MGOdbFG3K/Wb1Odlcux5HWv1l2Uvx6idpWdFebWIc3VsRB0bsfrpPIcSqbxBgG0w72wx8
 FaxvvRiPj7iuobbW2LdXivd77fLD2Oot69ouQubHgvpw09rhJzph8hz1Y0dXA51S6Y1zM1eO4aG
 TUmfUKhw0KiQrko1bn97Tpk1RUclMrCGEFu0pWavaGrHEVCAms7r0bSXKIZA==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--6.720600-5.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-25960.007
x-tm-snts-smtp: 92B2D6A4070B1EEB7945842EE8C97399B33CFA6A7FB59C2DB058153D8A2724F32000:9
MIME-Version: 1.0
X-Spam-Status: No, score=0.00
X-Spamd-Result: default: False [0.00 / 7.00]; ARC_NA(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; HAS_XOIP(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_SPAM(0.00)[16.99%];
 DKIM_SIGNED(0.00)[bfs.de:s=dkim201901];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: mx01-muc.bfs.de;
	none
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i am curious:
what is the win to have a unsigned 64 bit integer in the first
place ?

re,
 wh
________________________________________
Von: Christian K=F6nig <christian.koenig@amd.com>
Gesendet: Montag, 8. Februar 2021 10:17:42
An: Colin King; Alex Deucher; David Airlie; Daniel Vetter; Huang Rui; Junwe=
i Zhang; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Betreff: Re: [PATCH] drm/amdgpu: fix potential integer overflow on shift of=
 a int

Am 08.02.21 um 00:07 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> The left shift of int 32 bit integer constant 1 is evaluated using 32
> bit arithmetic and then assigned to an unsigned 64 bit integer. In the
> case where *frag is 32 or more this can lead to an oveflow.  Avoid this
> by shifting 1ULL.

Well that can't happen. Take a look at the code in that function:

>                 max_frag =3D 31;
...
>         if (*frag >=3D max_frag) {
>                 *frag =3D max_frag;
>                 *frag_end =3D end & ~((1ULL << max_frag) - 1);
>         } else {
>                 *frag_end =3D start + (1 << *frag);
>         }

But I'm fine with applying the patch if it silences your warning.

Regards,
Christian.

>
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: dfcd99f6273e ("drm/amdgpu: meld together VM fragment and huge page=
 handling")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index 9d19078246c8..53a925600510 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1412,7 +1412,7 @@ static void amdgpu_vm_fragment(struct amdgpu_vm_upd=
ate_params *params,
>               *frag =3D max_frag;
>               *frag_end =3D end & ~((1ULL << max_frag) - 1);
>       } else {
> -             *frag_end =3D start + (1 << *frag);
> +             *frag_end =3D start + (1ULL << *frag);
>       }
>   }
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
