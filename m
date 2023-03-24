Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3B6C8CCD
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 09:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B81D10E07A;
	Sat, 25 Mar 2023 08:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B75110E182;
 Fri, 24 Mar 2023 18:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1679681952; i=markus.elfring@web.de;
 bh=00A67wpDP1gotk9mR1d6qiW0CG6G98ynt9yJtScsAwQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=mvQNbnQKavf8KLZ+ydyxDtj2jKHDzVyt7fH5p+vLdXSmYD0U2tIaBa8OKqRPiUUgh
 qkfERyFt+G1jzWUjrLntB7CDqPTIDWte77RI+Gsk3/LIcA7GxjAd+jdEyHXrjeOXqc
 7aZlS84ydC6h3JLYHtaaOuyDaIDY5OPwulLP4HksTe6hZ3YKbdox84ceRBUJlglBU3
 efE7xixRatfffzJwPjlKF3YQOXdsBA2toLwgjKQ1+xIN/bP4QXk81LbPT5P2uv5Fse
 cgnMeI5ZT5rfCJ1JB9IgwMSaLBuswhG9n4DOiNrtG6Od/NISHT0qZedMw1Kpy2MmRu
 PFEU33+xxQ2kw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Melax-1qDSf43TTZ-00aODC; Fri, 24
 Mar 2023 19:19:11 +0100
Message-ID: <7a523efc-a82b-a1a1-e846-6047226cc968@web.de>
Date: Fri, 24 Mar 2023 19:19:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH resent] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
Content-Language: en-GB
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Stylon Wang <stylon.wang@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bMnv5agBssFzngTxa6JeEgTiLBePDIU/LFByM6gCbi49wlzsdY5
 XpmDpV/eOKA4qx/7u88hINiOpiTEO/wBDPobzGJRf7+KQVPBiahULRHI1XhAypOAAb+8f2D
 +IdcxUQ5xYewKfHVN0ePDdq97WECjmfGA8aVki/y/CUWL9xKUX53cNHhk+zBMPZY/jH1RUw
 PXa/OdfFr5mUgWLDVCeMg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dI49UMzWgEE=;rxBivc1evzhpimVGxxb01klR7FM
 WaogUt1Lax+oUuycoCP/VHuXdTAgxg9J4U0PMlbnDwZZT+9jugx8aUxzL58L2S/syyP0YTYEG
 MrS+ksAWRmVdwfLinruOrM5Z4j0SucT3tgnAhtWaoOs92EsAt1mY4Dzsqv2ImPIHgRY6KHU2f
 BHS7kTjB974XyC4I5HxHrUTdfSUIYKx9Ow5AnwhdunjH+NkYsJwyyynFYrIz6f1W6W4+ZxYEX
 UU0TNslRwOPAI34S5PFbjf8CptNE0aKqEEReHyN8ALvOOacWwregsZkcFfen8CjYsUZNXH+Ha
 O1/40B6H/1IJGdgGuuOX5PWlo7YH0Sr7TVIVui8MGK1E3mjmu5ZjUp26OuLKgrCnZIROGvghI
 +cQDw2nclwTNn8+UuUPehNcHoowkZz+w800BUVw5B1pq29N2MlXS+AHG0Y65sH2OSckPMk9z4
 ZjbDYyxlemcifwENOLEeCye2WXgqzCIKvmit8jyQxeYmV2K0jL81BWZZMIoVTWSmpBgIgelMk
 jweNNIvJ8OYgb6E0UlL7TDXW5pwr5tQcRUe/MV7U6h5jDArufPnGIVQQt/leGEbFv1Jv5LKws
 HnPFg9SCc3i5hsWEYvDjZqkG/92+1gj4SEc7FTarvgt63NI4smNb+dKwFd3mYCsBP5T5om0HL
 Cff8rmFh8IXQ2sDUfnhGIEsd7khYwJs7M7MYGW74ra9DY7e69UvDa5wZwnhKTRp54NzsKEPRs
 FGbYh/bxoQdXxZIfTka1N1c5PXmWlV0ZlC40th1y5jOImBOBieNxJ845HnzQewf30oMpJ2SAB
 NtGfwDnDIsmzv77unM4ok1RvTMWwl0xzwczx6k2BWQ6QIMvVHsGh2r0uJNOAV0mhHaymuCEwu
 G1wnsTJwrzx7vWJ15JPVFzmojvxHoPlgAIMdvWVrQZUPK1CWSVA3hhOdQ
X-Mailman-Approved-At: Sat, 25 Mar 2023 08:52:41 +0000
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

>> The label =E2=80=9Ccleanup=E2=80=9D was used to jump to another pointer=
 check despite of
>> the detail in the implementation of the function =E2=80=9Cdm_validate_s=
tream_and_context=E2=80=9D
>> that it was determined already that corresponding variables contained
>> still null pointers.
>>
>> 1. Thus return directly if
>> =C2=A0=C2=A0=C2=A0* a null pointer was passed for the function paramete=
r =E2=80=9Cstream=E2=80=9D
>> =C2=A0=C2=A0=C2=A0=C2=A0 or
>> =C2=A0=C2=A0=C2=A0* a call of the function =E2=80=9Cdc_create_plane_sta=
te=E2=80=9D failed.
>>
>> 2. Use a more appropriate label instead.
>>
>> 3. Delete two questionable checks.
>>
>> 4. Omit extra initialisations (for the variables =E2=80=9Cdc_state=E2=
=80=9D and =E2=80=9Cdc_plane_state=E2=80=9D)
>> =C2=A0=C2=A0=C2=A0which became unnecessary with this refactoring.
>>
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Fixes: 5468c36d628524effbb89a9503eb1a2318804759 ("drm/amd/display: Filt=
er Invalid 420 Modes for HDMI TMDS")
>
> Please truncate the hash to 12 characters.

May longer identifiers (or even the complete SHA-1 ID) occasionally also
be tolerated for the tag =E2=80=9CFixes=E2=80=9D?

How do you think about the proposed change possibilities?

Regards,
Markus
