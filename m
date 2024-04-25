Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BB8B1C0E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBCD11A23D;
	Thu, 25 Apr 2024 07:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="CB8AsS3+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A321611A23A;
 Thu, 25 Apr 2024 07:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1714030776; x=1714635576; i=friedrich.vock@gmx.de;
 bh=q1pp9aP+2gbzwTN1O+NPHOHH3ZwZ909Le2fQLRghyRM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=CB8AsS3+o7uXVOsJhcNSKfs9sMR5FQpUDPA1fjEYOJ5HvHYQG6pywvYgfgqMbLER
 ywHhsnCDDq5bb6rbO9wzs6k9kwYg0+K8OxCjBAk5H5dUGyRkMVF6HU/33MA0BB+nN
 R9i20KWDMuotjRL2Ks+jpqfuqc2iphFnvevxVu9d73CMzVY8z7785d00wcNuL5zSy
 5Z8lr05QkKE5xxm5YQiswdg1/6iYEsxiIhGcytIeKYWxcVgqgdRN9dhubFATCW2rT
 Y7lXBANiS4UawQnMCyYBk/cz63F6gsBS3Q4iCb5qrmxsUONG5ma1I4dANg+WQ2TmG
 vdYhqLu7uxF3xLUCHA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGW7-1sL9bp0Ac1-00OuRr; Thu, 25
 Apr 2024 09:39:36 +0200
Message-ID: <716004ab-8893-4ef1-8492-00ea64da3646@gmx.de>
Date: Thu, 25 Apr 2024 09:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/18] drm/amdgpu: Don't add GTT to initial domains
 after failing to allocate VRAM
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-11-friedrich.vock@gmx.de>
 <7a112162-8fae-418d-a58e-bf12713b8e7e@amd.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <7a112162-8fae-418d-a58e-bf12713b8e7e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xn3GPS+rS3v6nA6jzxcFWqfEvjAddHQllbEK3KVUEXdj5BZJ+R2
 d3v1Yj0O20R/7dDCvZR4hiKMfU1bmm97+UkgQlg8lP6cfe/WdH9NqZ+/OUjXd6K3/WY12Hb
 1kGqqw9LcQjyAYqPh/1nxNBIkV7UnzkoOBpn0kjLkqxJ6cBEM5x75v0EmBKRi4/uY3rsNGt
 jCuxJeWqf3PoGlOsEzXFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HX0DD6Shb7c=;HNvzT/cnBOLdR8TQcLkm8QoObxv
 ckWHAdxC6vLXjcxH9vEVuORq++zWmQ1Ljwpptls9xPLq7g+OOlnWqrxLKf5GlMjd0IJ1axC8W
 At4hW2IsLaXd4VnQ7+G4vKMyKrqxED7z9Qq+LB39UK9kSixonYeVJ4zWw6xwaziU7cS6YTRwX
 OOqZDChB0SsLwZU/y9zA0PLUJxZWpnaKFg3kampMU+r17V2vCZsNwiSMJaZ2SThtYQTJmmZ+O
 dGUdbXNSF2TOC+tzcCtQSOJLaddBpPbHUrK+V8g4uUt+jOMXkDc+K12N7Zb72eQcHlW1Pl+gI
 /171iW3qe9nmwXLB1MfTFpep9Tb3etqPBrmZPH8qSlxDN7QOr7Nogl8mBTHqKxbOhn+pvT6hC
 KO1CFhjfuHuPTmghegFCIb39XYEMe7tCeyIOJHgrkeTEq+6TyFANze8SM6NweI5RHbXPobiVf
 5Fp3jePsEOr2g0s1WQQ2/qSZy7qMZvXOPs/GXEE09ssHfo0OYcLIeBExgKNRCg0tuXs78yhbX
 P5v+0qCySc4I00pZ48pe7GDjDvVYf3pB3Iw2KOsOyDkazQ0w3lmo8GxABX49GFqb8n8ew0h6x
 EQaJdgOACHRlIWdhP6q2cJf8TibUR3RVTh2EVWypKGotIIJqW8+X5dqmakqFu0busOCe9CWEa
 WwwOHkQB1t+ddiF7A5VMqoJMFkhCDesXx0h3mx6HqOTo5nhnSNxZC/iKkS0XBARVUDd2fVym4
 EFs9M+U5rqZeLgnr8wiRi05S/GVjJNFX7HfTAXctCv/fjP2qECzFDPuA7CImjGGdk9lGnZcHo
 L4TOK/DB6wqRI89CRCWoGLwzsorBnvC0nfTPisaeBfsmk=
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

On 25.04.24 08:25, Christian K=C3=B6nig wrote:
> Am 24.04.24 um 18:57 schrieb Friedrich Vock:
>> This adds GTT to the "preferred domains" of this buffer object, which
>> will also prevent any attempts at moving the buffer back to VRAM if
>> there is space. If VRAM is full, GTT will already be chosen as a
>> fallback.
>
> Big NAK to that one, this is mandatory for correct operation.
>
Hm, how is correctness affected here? We still fall back to GTT if
allocating in VRAM doesn't work, I don't see a difference except that
now we'll actually try moving it back into VRAM again.

Regards,
Friedrich

> Regards,
> Christian.
>
>>
>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>> ---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=A0 | 4 --=
--
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
>> =C2=A0 2 files changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index 6bbab141eaaeb..aea3770d3ea2e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -378,10 +378,6 @@ int amdgpu_gem_create_ioctl(struct drm_device
>> *dev, void *data,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 goto retry;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (initial_domain =3D=3D A=
MDGPU_GEM_DOMAIN_VRAM) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ini=
tial_domain |=3D AMDGPU_GEM_DOMAIN_GTT;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o retry;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_DEBUG("Faile=
d to allocate GEM object (%llu, %d, %llu,
>> %d)\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size, initial_domain, args->in.alignment=
, r);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 85c10d8086188..9978b85ed6f40 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -619,7 +619,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 AMDGPU_GEM_DOMAIN_GDS))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_bo_placem=
ent_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_bo_placement_from_do=
main(bo, bp->domain);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_bo_placement_from_do=
main(bo, bo->allowed_domains);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bp->type =3D=3D ttm_bo_type_kernel)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->tbo.priority=
 =3D 2;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (!(bp->flags & AMDGPU_GEM_CREATE=
_DISCARDABLE))
>> --
>> 2.44.0
>>
>
