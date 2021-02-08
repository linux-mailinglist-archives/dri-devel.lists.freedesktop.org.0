Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7813138CA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 17:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FA76E923;
	Mon,  8 Feb 2021 16:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 523 seconds by postgrey-1.36 at gabe;
 Mon, 08 Feb 2021 16:04:04 UTC
Received: from mx02-sz.bfs.de (mx01-sz.bfs.de [194.94.69.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B34D6E924;
 Mon,  8 Feb 2021 16:04:04 +0000 (UTC)
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
 by mx02-sz.bfs.de (Postfix) with ESMTPS id 74B9F204F3;
 Mon,  8 Feb 2021 16:55:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901; 
 t=1612799717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q4HzirnLJM+HViDyDhv1Iv1CcEDPj4NYgUsCPRWFOew=;
 b=aa7jb1qMtg3IF54oaINCd8U3kJ5ybkDW3rt/h6GHNSJRpcN0o9DwwixE/Bg5YW3I8rKl+I
 qyykWQtk1m5iFB8BZpjW07wn7jV/jQtQloFMskJuctENTMAtHOvQWCbu84f5lm3DhKPb/N
 NMx/23sgYKlp+w3fbRwb+uQq+N3AIiNMzgbXyfCUKlUM4T4lAoz71oFEEURXsDNEKavkWD
 iWePkaN6/0KZDCjhToopivDBD2/x+0AELN8yGHjkT+cf6BsoYVA7Wl4QrQEfqOt61ardd9
 EzfbCYffPOuvCMOYOyZOUBK0e5csuEVpA/rGIvXdd0Kd2tPf0KCDDnBkBh2gLw==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Mon, 8 Feb 2021
 16:55:16 +0100
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%13]) with mapi id
 15.01.2176.002; Mon, 8 Feb 2021 16:55:16 +0100
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
Thread-Index: AQHW/aZibC6c7NmnTEaIp1k5r3gR16pN6nEAgAAuR36AAAM1gIAATkm8
Date: Mon, 8 Feb 2021 15:55:16 +0000
Message-ID: <b9d63b56e0f849f1a5a2def73c899047@bfs.de>
References: <20210207230751.8576-1-colin.king@canonical.com>
 <c6c99dba-aea9-304c-2246-e24632955479@amd.com>
 <3aed86cfb8014badbcbc4ee9f007976d@bfs.de>,
 <877bdf13-08d3-b471-40fb-02941cce3e4e@amd.com>
In-Reply-To: <877bdf13-08d3-b471-40fb-02941cce3e4e@amd.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.40]
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-25962.000
x-tm-as-result: No-10--6.728500-5.000000
x-tmase-matchedrid: dtkKbEKn3AnRubRCcrbc5grcxrzwsv5u3dCmvEa6IiFVKNUgZ3luWnLM
 2R9NW5DWbdmNIofb74J0NVTfdsoLhdxNhdpa5boviVJZi91I9JgORjM32hn2b63DfQXYDXXmRiM
 0r5DoZkB5MS8Z0lVS9j9wo1JHFTI2cLf/qdMcXRsjCTunWqnclng+heom5LgRAg3B8AeZrNzn9R
 Ub2w6sFdDaNZpK9gNYEi2pD9yuIToXgRHNsAEPAMzSKGx9g8xhF8lNgsbZcW+Qh1IdwvRaDMASM
 1FbRaAi1P0GXW6c5H7/W3GjkvPseF5Saok1/fZC72Rb2bEJC+0N5vzU/2kgxH3Oo/70kBrausTh
 0mw9TQnfPhslDCCNNpscC5DV1Se5wxJ3bCddR8Zwju9EALAXQn0tCKdnhB581B0Hk1Q1KyLUZxE
 AlFPo846HM5rqDwqtDGOPLcPHxZMNsOtWzwsguS5xc40Grrs8djI7RHudf/gKeUc3m2FtmpDl99
 zmxDOhKUWv6klB9qHZzZxu20/SO8O5fvxIK4XIKKz2OxxCkpzNG0L98j8bMvraKq/vKbWfY+pdI
 oZ/f0rVm/fNL/ipsw==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--6.728500-5.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-25962.000
x-tm-snts-smtp: AB96EA7908BCA3CC0F264015106D55C460AB61EC7E14EBC137F4B49FF802374F2000:9
MIME-Version: 1.0
X-Spam-Status: No, score=-2.76
Authentication-Results: mx02-sz.bfs.de;
	none
X-Spamd-Result: default: False [-2.76 / 7.00]; ARC_NA(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; HAS_XOIP(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[bfs.de:s=dkim201901];
 RCPT_COUNT_SEVEN(0.00)[11]; NEURAL_HAM(-0.00)[-1.000];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-2.76)[98.97%]
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

thx for info
________________________________________
Von: Christian K=F6nig <christian.koenig@amd.com>
Gesendet: Montag, 8. Februar 2021 13:14:49
An: Walter Harms; Colin King; Alex Deucher; David Airlie; Daniel Vetter; Hu=
ang Rui; Junwei Zhang; amd-gfx@lists.freedesktop.org; dri-devel@lists.freed=
esktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Betreff: Re: [PATCH] drm/amdgpu: fix potential integer overflow on shift of=
 a int

For start and end?  The hardware has 48 bit address space and that won't
fit into 32bits.

Only the fragment handling can't do more than 2GB at the same time.

Christian.

Am 08.02.21 um 12:05 schrieb Walter Harms:
> i am curious:
> what is the win to have a unsigned 64 bit integer in the first
> place ?
>
> re,
>   wh
> ________________________________________
> Von: Christian K=F6nig <christian.koenig@amd.com>
> Gesendet: Montag, 8. Februar 2021 10:17:42
> An: Colin King; Alex Deucher; David Airlie; Daniel Vetter; Huang Rui; Jun=
wei Zhang; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Betreff: Re: [PATCH] drm/amdgpu: fix potential integer overflow on shift =
of a int
>
> Am 08.02.21 um 00:07 schrieb Colin King:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The left shift of int 32 bit integer constant 1 is evaluated using 32
>> bit arithmetic and then assigned to an unsigned 64 bit integer. In the
>> case where *frag is 32 or more this can lead to an oveflow.  Avoid this
>> by shifting 1ULL.
> Well that can't happen. Take a look at the code in that function:
>
>>                  max_frag =3D 31;
> ...
>>          if (*frag >=3D max_frag) {
>>                  *frag =3D max_frag;
>>                  *frag_end =3D end & ~((1ULL << max_frag) - 1);
>>          } else {
>>                  *frag_end =3D start + (1 << *frag);
>>          }
> But I'm fine with applying the patch if it silences your warning.
>
> Regards,
> Christian.
>
>> Addresses-Coverity: ("Unintentional integer overflow")
>> Fixes: dfcd99f6273e ("drm/amdgpu: meld together VM fragment and huge pag=
e handling")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vm.c
>> index 9d19078246c8..53a925600510 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -1412,7 +1412,7 @@ static void amdgpu_vm_fragment(struct amdgpu_vm_up=
date_params *params,
>>                *frag =3D max_frag;
>>                *frag_end =3D end & ~((1ULL << max_frag) - 1);
>>        } else {
>> -             *frag_end =3D start + (1 << *frag);
>> +             *frag_end =3D start + (1ULL << *frag);
>>        }
>>    }
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
