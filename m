Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 109631516C8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB356EDE7;
	Tue,  4 Feb 2020 08:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB50E6ED08
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 20:44:58 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id k29so8150774pfp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 12:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=va5DBE6oZtmvrnAxbgrJjKkUp22YgwiCAYX6nZ8Ahbk=;
 b=FMECbffE6XFv4e+f0oDgakKul4lKZHsnhycGgsdjDbTz61LHoPNVd0lPLruipb0Opn
 t5M173BhvTST3xEbvKMK5O+CnLCJIOSPmcX/Jhe2PBaFVSvmW/pUDXhvrNJBFGhKMrUr
 Yhmr/0fWcqqCtV5lboiBcaG4FXW9+TJVrvdRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=va5DBE6oZtmvrnAxbgrJjKkUp22YgwiCAYX6nZ8Ahbk=;
 b=fGmSidajpcFLV9wfMKOtUuqvqQSwMy4di4bPzdWQDb+G7nPeHnrWRxCjwvFlYMN/MP
 ObaHHvJhG1ol5mc6rNukX5R1cZwSEadoJuhIF9QaoQaPiGXrs8PyiO/b8Zkbw49wQgSc
 KsVn1beTCvaS3WzkdrywrqCNRW76FwPpwLAzz3FOf459CWTc8YmBb1JsrvMqwuWqv8vt
 6IouCzHis1LZrmm4NXSG6m990o63LUXLaalAyYBLqwnhbtp9D8BatDi/fSrlu94gW5H9
 JRbZatcvQXEQPWOXONw5iWOsm2FlzJeeNR4KTixNtcWX6bevQFX/xFh5uBfm7y75q4bg
 Cn8w==
X-Gm-Message-State: APjAAAV7OQ5mXAE2NmOsvwmN5bVX9XiWqe33d/Sls0gEX7ZvBjs6wrqg
 qqmC/84WelPB0VWKejr9o0LB
X-Google-Smtp-Source: APXvYqzZpXEsyt4pvTHVh1uxIuR5rrATIyfVTcWfjFnitmTgd5tUG7ISVv4dN8rUa40hom62fDhmPQ==
X-Received: by 2002:a63:7515:: with SMTP id q21mr27921141pgc.63.1580762698349; 
 Mon, 03 Feb 2020 12:44:58 -0800 (PST)
Received: from [192.168.1.139]
 (172-127-176-197.lightspeed.snantx.sbcglobal.net. [172.127.176.197])
 by smtp.gmail.com with ESMTPSA id f1sm320830pjq.31.2020.02.03.12.44.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Feb 2020 12:44:58 -0800 (PST)
From: Tianlin Li <tli@digitalocean.com>
Message-Id: <D9D0C673-E931-46D2-A0F2-48F46901EA20@digitalocean.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v2] drm/radeon: have the callers of set_memory_*() check
 the return value
Date: Mon, 3 Feb 2020 14:44:56 -0600
In-Reply-To: <6e5a18f6-b7f6-c401-c845-fe24b183f348@amd.com>
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20200203161827.768-1-tli@digitalocean.com>
 <6e5a18f6-b7f6-c401-c845-fe24b183f348@amd.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
Cc: Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1666521766=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1666521766==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FA0004EA-541F-4FCC-8B3B-CDCAD16BAC91"


--Apple-Mail=_FA0004EA-541F-4FCC-8B3B-CDCAD16BAC91
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 3, 2020, at 11:16 AM, Christian K=C3=B6nig =
<christian.koenig@amd.com> wrote:
>=20
> Am 03.02.20 um 17:18 schrieb Tianlin Li:
>> Right now several architectures allow their set_memory_*() family of
>> functions to fail,
>=20
> Oh, that is a detail I previously didn't recognized. Which =
architectures are that?
>=20
> Cause the RS400/480, RS690 and RS740 which are affected by this are =
integrated in the south-bridge.

At least x86 is.=20
Some details: =
https://lore.kernel.org/netdev/20180628213459.28631-4-daniel@iogearbox.net=
/ =
<https://lore.kernel.org/netdev/20180628213459.28631-4-daniel@iogearbox.ne=
t/>

>>  but callers may not be checking the return values.
>> If set_memory_*() returns with an error, call-site assumptions may be
>> infact wrong to assume that it would either succeed or not succeed at
>> all. Ideally, the failure of set_memory_*() should be passed up the
>> call stack, and callers should examine the failure and deal with it.
>>=20
>> Need to fix the callers and add the __must_check attribute. They also
>> may not provide any level of atomicity, in the sense that the memory
>> protections may be left incomplete on failure. This issue likely has =
a
>> few steps on effects architectures:
>> 1)Have all callers of set_memory_*() helpers check the return value.
>> 2)Add __must_check to all set_memory_*() helpers so that new uses do
>> not ignore the return value.
>> 3)Add atomicity to the calls so that the memory protections aren't =
left
>> in a partial state.
>>=20
>> This series is part of step 1. Make drm/radeon check the return value =
of
>> set_memory_*().
>>=20
>> Signed-off-by: Tianlin Li <tli@digitalocean.com>
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com =
<mailto:christian.koenig@amd.com>>
>=20
>> ---
>> v2:
>> The hardware is too old to be tested on and the code cannot be simply
>> removed from the kernel, so this is the solution for the short term.
>> - Just print an error when something goes wrong
>> - Remove patch 2.
>> v1:
>> =
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.k=
ernel.org%2Flkml%2F20200107192555.20606-1-tli%40digitalocean.com%2F&amp;da=
ta=3D02%7C01%7Cchristian.koenig%40amd.com%7Cba2176d2ca834214e6b108d7a8c4bb=
1d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637163435227030235&amp;sda=
ta=3DmDhUEi3vmxahjsdrZOr83OEIWNBHefO8lkXST%2FW32CE%3D&amp;reserved=3D0 =
<https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kernel.org%2Flkml%2F20200107192555.20606-1-tli%40digitalocean.com%2F&amp;d=
ata=3D02%7C01%7Cchristian.koenig%40amd.com%7Cba2176d2ca834214e6b108d7a8c4b=
b1d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637163435227030235&amp;sd=
ata=3DmDhUEi3vmxahjsdrZOr83OEIWNBHefO8lkXST%2FW32CE%3D&amp;reserved=3D0>
>> ---
>>  drivers/gpu/drm/radeon/radeon_gart.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/radeon/radeon_gart.c =
b/drivers/gpu/drm/radeon/radeon_gart.c
>> index f178ba321715..a2cc864aa08d 100644
>> --- a/drivers/gpu/drm/radeon/radeon_gart.c
>> +++ b/drivers/gpu/drm/radeon/radeon_gart.c
>> @@ -80,8 +80,9 @@ int radeon_gart_table_ram_alloc(struct =
radeon_device *rdev)
>>  #ifdef CONFIG_X86
>>  	if (rdev->family =3D=3D CHIP_RS400 || rdev->family =3D=3D =
CHIP_RS480 ||
>>  	    rdev->family =3D=3D CHIP_RS690 || rdev->family =3D=3D =
CHIP_RS740) {
>> -		set_memory_uc((unsigned long)ptr,
>> -			      rdev->gart.table_size >> PAGE_SHIFT);
>> +		if (set_memory_uc((unsigned long)ptr,
>> +			      rdev->gart.table_size >> PAGE_SHIFT))
>> +			DRM_ERROR("set_memory_uc failed.\n");
>>  	}
>>  #endif
>>  	rdev->gart.ptr =3D ptr;
>> @@ -106,8 +107,9 @@ void radeon_gart_table_ram_free(struct =
radeon_device *rdev)
>>  #ifdef CONFIG_X86
>>  	if (rdev->family =3D=3D CHIP_RS400 || rdev->family =3D=3D =
CHIP_RS480 ||
>>  	    rdev->family =3D=3D CHIP_RS690 || rdev->family =3D=3D =
CHIP_RS740) {
>> -		set_memory_wb((unsigned long)rdev->gart.ptr,
>> -			      rdev->gart.table_size >> PAGE_SHIFT);
>> +		if (set_memory_wb((unsigned long)rdev->gart.ptr,
>> +			      rdev->gart.table_size >> PAGE_SHIFT))
>> +			DRM_ERROR("set_memory_wb failed.\n");
>>  	}
>>  #endif
>>  	pci_free_consistent(rdev->pdev, rdev->gart.table_size,


--Apple-Mail=_FA0004EA-541F-4FCC-8B3B-CDCAD16BAC91
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 3, 2020, at 11:16 AM, Christian K=C3=B6nig &lt;<a =
href=3D"mailto:christian.koenig@amd.com" =
class=3D"">christian.koenig@amd.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Am 03.02.20 um 17:18 schrieb =
Tianlin Li:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Right =
now several architectures allow their set_memory_*() family of<br =
class=3D"">functions to fail,<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Oh, that is a detail I =
previously didn't recognized. Which architectures are that?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Cause the RS400/480, RS690 and =
RS740 which are affected by this are integrated in the =
south-bridge.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><br class=3D""></div><div>At least =
x86 is.&nbsp;</div><div>Some details:&nbsp;<a =
href=3D"https://lore.kernel.org/netdev/20180628213459.28631-4-daniel@iogea=
rbox.net/" =
class=3D"">https://lore.kernel.org/netdev/20180628213459.28631-4-daniel@io=
gearbox.net/</a></div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><blockquote type=3D"cite" style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">&nbsp;but callers may not be checking the return values.<br =
class=3D"">If set_memory_*() returns with an error, call-site =
assumptions may be<br class=3D"">infact wrong to assume that it would =
either succeed or not succeed at<br class=3D"">all. Ideally, the failure =
of set_memory_*() should be passed up the<br class=3D"">call stack, and =
callers should examine the failure and deal with it.<br class=3D""><br =
class=3D"">Need to fix the callers and add the __must_check attribute. =
They also<br class=3D"">may not provide any level of atomicity, in the =
sense that the memory<br class=3D"">protections may be left incomplete =
on failure. This issue likely has a<br class=3D"">few steps on effects =
architectures:<br class=3D"">1)Have all callers of set_memory_*() =
helpers check the return value.<br class=3D"">2)Add __must_check to all =
set_memory_*() helpers so that new uses do<br class=3D"">not ignore the =
return value.<br class=3D"">3)Add atomicity to the calls so that the =
memory protections aren't left<br class=3D"">in a partial state.<br =
class=3D""><br class=3D"">This series is part of step 1. Make drm/radeon =
check the return value of<br class=3D"">set_memory_*().<br class=3D""><br =
class=3D"">Signed-off-by: Tianlin Li &lt;<a =
href=3D"mailto:tli@digitalocean.com" =
class=3D"">tli@digitalocean.com</a>&gt;<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Reviewed-by: Christian K=C3=B6nig =
&lt;</span><a href=3D"mailto:christian.koenig@amd.com" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">christian.koenig@amd.com</a><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&gt;</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">---<br class=3D"">v2:<br class=3D"">The=
 hardware is too old to be tested on and the code cannot be simply<br =
class=3D"">removed from the kernel, so this is the solution for the =
short term.<br class=3D"">- Just print an error when something goes =
wrong<br class=3D"">- Remove patch 2.<br class=3D"">v1:<br class=3D""><a =
href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Flkml%2F20200107192555.20606-1-tli%40digitalocean.com%2=
F&amp;amp;data=3D02%7C01%7Cchristian.koenig%40amd.com%7Cba2176d2ca834214e6=
b108d7a8c4bb1d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63716343522703=
0235&amp;amp;sdata=3DmDhUEi3vmxahjsdrZOr83OEIWNBHefO8lkXST%2FW32CE%3D&amp;=
amp;reserved=3D0" =
class=3D"">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flore.kernel.org%2Flkml%2F20200107192555.20606-1-tli%40digitalocean.co=
m%2F&amp;amp;data=3D02%7C01%7Cchristian.koenig%40amd.com%7Cba2176d2ca83421=
4e6b108d7a8c4bb1d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63716343522=
7030235&amp;amp;sdata=3DmDhUEi3vmxahjsdrZOr83OEIWNBHefO8lkXST%2FW32CE%3D&a=
mp;amp;reserved=3D0</a><br class=3D"">---<br =
class=3D"">&nbsp;drivers/gpu/drm/radeon/radeon_gart.c | 10 ++++++----<br =
class=3D"">&nbsp;1 file changed, 6 insertions(+), 4 deletions(-)<br =
class=3D""><br class=3D"">diff --git =
a/drivers/gpu/drm/radeon/radeon_gart.c =
b/drivers/gpu/drm/radeon/radeon_gart.c<br class=3D"">index =
f178ba321715..a2cc864aa08d 100644<br class=3D"">--- =
a/drivers/gpu/drm/radeon/radeon_gart.c<br class=3D"">+++ =
b/drivers/gpu/drm/radeon/radeon_gart.c<br class=3D"">@@ -80,8 +80,9 @@ =
int radeon_gart_table_ram_alloc(struct radeon_device *rdev)<br =
class=3D"">&nbsp;#ifdef CONFIG_X86<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(rdev-&gt;family =3D=3D CHIP_RS400 || rdev-&gt;family =3D=3D CHIP_RS480 =
||<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;rdev-&gt;fa=
mily =3D=3D CHIP_RS690 || rdev-&gt;family =3D=3D CHIP_RS740) {<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>set_memory_uc((unsigned long)ptr,<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;rdev-&gt;gart.table_size &gt;&gt; PAGE_SHIFT);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(set_memory_uc((unsigned long)ptr,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;rdev-&gt;gart.table_size &gt;&gt; PAGE_SHIFT))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>DRM_ERROR("set_memory_uc failed.\n");<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">&nbsp;#endif<br class=3D"">&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>rdev-&gt;gart.ptr =3D ptr;<br =
class=3D"">@@ -106,8 +107,9 @@ void radeon_gart_table_ram_free(struct =
radeon_device *rdev)<br class=3D"">&nbsp;#ifdef CONFIG_X86<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>if (rdev-&gt;family =3D=3D CHIP_RS400 || rdev-&gt;family =
=3D=3D CHIP_RS480 ||<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;rdev-&gt;fa=
mily =3D=3D CHIP_RS690 || rdev-&gt;family =3D=3D CHIP_RS740) {<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>set_memory_wb((unsigned long)rdev-&gt;gart.ptr,<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;rdev-&gt;gart.table_size &gt;&gt; PAGE_SHIFT);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(set_memory_wb((unsigned long)rdev-&gt;gart.ptr,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;rdev-&gt;gart.table_size &gt;&gt; PAGE_SHIFT))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>DRM_ERROR("set_memory_wb failed.\n");<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">&nbsp;#endif<br class=3D"">&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	=
</span>pci_free_consistent(rdev-&gt;pdev, =
rdev-&gt;gart.table_size,</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_FA0004EA-541F-4FCC-8B3B-CDCAD16BAC91--

--===============1666521766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1666521766==--
