Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2BD82313C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 17:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1BB10E164;
	Wed,  3 Jan 2024 16:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B702410E164
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1704299096; x=1704903896; i=markus.elfring@web.de;
 bh=ClXQs64Aybn4pQe7H31+xNfShyDpOwOZKsYydbx2rjA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=fLAJKfpkrLG9s4UgDUFDP3oIUuxwbdEVTCLm2Bu68Zlw8xL5zmIcHVdq+QQbjvxy
 XikMA3IxCAA/zqX2Iz7S1Q+xeCtBI6mOFbAdUyHP448rUvYpe/2kRGoInjlmrZSAF
 rUwUgiePTeUzFqgskwsWyxLcnqRsYXQIUckwuDEzECs54FCuOazgBkpUnR2BjObG4
 Ka0ACPJ1IYlFEv8GdcgswYPjhIvNxb7ZagHZHdSeHz7j48YtEQDi18aluMkKShKhj
 UgQd3dYsu8AWbhUJWvSPR7kcZy2bBAFgDAsNPPQ6OmeNWQU/IwtcmoHjemz3Ja1ee
 A37NTp8A3elNUfQvZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mvbn2-1r2qi60Q5e-00sm8S; Wed, 03
 Jan 2024 17:24:56 +0100
Message-ID: <c5f1a7bf-b444-4934-a205-3c2b3a045ff7@web.de>
Date: Wed, 3 Jan 2024 17:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: property: One function call less in
 drm_property_create() after error detection
Content-Language: en-GB
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
 <9b1e7330-f4f6-47f8-a568-eaea1624bb6f@web.de>
 <37647c33-7f9d-4763-8bf4-cfc5c9a811de@mailbox.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <37647c33-7f9d-4763-8bf4-cfc5c9a811de@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m52ma2VKpDCFMhQhjPfaQSHvNMcIEZqritcXHHLGW3bJuSnNW0V
 KbJHlIwID4pTZjo+NtHfxXqxjnURS5twcbiC+E47w5mbyvuJcDICd7vCJEdZsfpk00OTXFi
 47y6MIvagOxoo+NLlzdISCDsKTge0EspM5uLcZ+CSkkODIBWdn1Xj15cUhGB8nKsYe+ILFS
 agPjAnMNbDP5zDe4ksrpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UuoOhNjX3vY=;TThZ/Kyymlf05+h0ctlxFzQW+Sv
 Yv6cYl0qVJGnivhBtF/e0aquTh8g0tpw7Y+jy1KSBJ/eEKowyV0mqYukZ40qOcyUok9tfOTqm
 +vrnNbeilm3FqYN26pAHaZ2cR09uIMESQYdT3DcCTgGiwkuZK0mTqriuFdkkpSv+yZbT4Fhfc
 u4KXhsAN9cPhCF9TD+8s39YyaNViGuQoK3L9o83z8c9n3kEoHAV9hGeGYHuSrB+Vf7dx8wWyp
 pzjW3Xwe2Va/WgmnTyVBG+5PP6ElrLzccYBvAVRnKtu008jiM0vcT99slwHS//aBgXpEnvMXm
 //E6Zw6jA+FPZ/SzgFjcjOQtY7niBlWsh46+BBDJPygJBPzYrV9GJm1vkcmtet3eQufh4r6Sx
 IjeU+LrJcJrUB2Ac0iJOrS/osioP0+vkt0k3IrC5eLeelBzug44RZfofSomc6s344XSYdk4SH
 M4oEbCxq1maXc9KAUja1o9+nDKwICGz1Sn8aAzp/KoYwn+ejRApYjTlydCJFdOmKOOwmxohaU
 Zzvpc38fuZvrp4yBO5prB7VmXon5JzAtaucdtfI9cKqAm8KTdF+c3J04okGrrxK/tt4to/9ka
 g57Qi1w4cLwZcxj83PAORfZ5KQDf+XeTC6jLBivZzfOCtF039UzgbC/IFEw1OdtlkvJXXt/ca
 u/n96kdC/nhxVM0m/3rlTJkhVd3GkvhSaHUYNhSKIYEsQVwcZ80GdHcE4i0FOq0aVLpRNtRaW
 S3laOZJB794Qb9MCCeFZ1eTIfF9C/bbHfNiTM6/agd+TBCJjWeGMCuKcKHIq160dcmYwUobP3
 nS3HUi7R+ztTG1DN+OGRnNxWJVJ/H0NbS5CCRpHyg5OiatRBcv20ewji7jZufkKAjZHZWXr5p
 POAY7Kxw4Cuz6MKfvgKUQg70//dZSufZKF3iRgu6ryfxwtX5RaWrZqXm7XUkkxL9HJzR+Lzg7
 Wahs/w==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> The kfree() function was called in one case by the
>> drm_property_create() function during error handling
>> even if the passed data structure member contained a null pointer.
>> This issue was detected by using the Coccinelle software.
>>
>> Thus use another label.
=E2=80=A6
>> +++ b/drivers/gpu/drm/drm_property.c
>> @@ -117,7 +117,7 @@ struct drm_property *drm_property_create(struct drm=
_device *dev,
>>  		property->values =3D kcalloc(num_values, sizeof(uint64_t),
>>  					   GFP_KERNEL);
>>  		if (!property->values)
>> -			goto fail;
>> +			goto free_property;
>>  	}
>>
>>  	ret =3D drm_mode_object_add(dev, &property->base, DRM_MODE_OBJECT_PRO=
PERTY);
>> @@ -135,6 +135,7 @@ struct drm_property *drm_property_create(struct drm=
_device *dev,
>>  	return property;
>>  fail:
>>  	kfree(property->values);
>> +free_property:
>>  	kfree(property);
>>  	return NULL;
>>  }
=E2=80=A6
> This change is pointless at best, kfree(NULL) works fine.

* Would you interpret such a special function call as redundant?

* Do you find advices applicable from another information source
  also for this function implementation?
  https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+=
goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resou=
rces


> Out of curiosity, what exactly did Coccinelle report?

Some SmPL scripts from my own selection tend to point questionable impleme=
ntation details out.

Regards,
Markus
