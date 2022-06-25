Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F355AB57
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 17:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B07E14A459;
	Sat, 25 Jun 2022 15:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD0F14A45B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656171524;
 bh=H21FLTrDaQSqV0tZvUG58TLBnTRJsXMwEj3F150hahw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KaJyFiftUMzZ9SocxVhza+2BgkIiXkG9pp+0/WEHGZx/K1aqutwW1fvWqeiFGAuEq
 NNM6aKkJE6UOE6TUUEngsPktIPFRKflfiaUJjk2GMNGhXAIxsXiwLiiKoGVfBnyeYc
 6voAMj2wGg8Ixph7Os7a+8CcrNboblIEzNd3h2z0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.162.44]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEm6L-1ntHNn1OKB-00GGGm; Sat, 25
 Jun 2022 17:38:44 +0200
Message-ID: <b2ea1c0b-ce52-c645-37e9-26dd849bd74d@gmx.de>
Date: Sat, 25 Jun 2022 17:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/4] fbmem: Catch possible driver bugs regarding too
 small virtual screen size
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-5-deller@gmx.de> <YrcHo5dEaROdWMjo@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YrcHo5dEaROdWMjo@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dYr9ikJjOhRqut+rI/7QAZs9pAAhEdRp+NWjA/Ih8MFoDDKdBBc
 Prs5S8t0BvwF6e1ZPunBJESD/gKfFUK/qy6Doj34zj6hd2RqfAL4PmnRwzh4iLJW/lz8IX8
 8dLFmsTWOc174IbZ6pCPNkY/d5SrcPN5LEvcg7sxdUswoAaw5Tywyf092XzW7UWMF9UO0uX
 mGgpVyYr5m9MSJS628S5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0v9PWa5hSn0=:nJT0rma0sQgWkhqoGatqQP
 +yKMoyYmAnoHsshDZTPfrjgOVJO2TH+2TpSwzvIpA31biVJKL1MSZjHD2zrhUyAIU5V7yIV+Y
 rcCccIPIc4PXeEYNG5Mfnq6Dz1qIbI6dYNj2RmpL8LG5G0Y1OZ51niaI7hUvAl59RvkaKh/5U
 wSswp533f4EKu9+uzGp0iLmpgMNZ4J8gFF++YnUKisnpELjKYMeOSnYspBP4m30oz2GI2v0A2
 PGen/jkLDEGcvCP5Q2e7zKCwO9h8+XRbYzA4Q5bHVxkszPr3QurWszncW+IYVM/GCHEDDaFDV
 6TRTe7ecNspkm+goxIomq9zYnRrP3RMBXYM95NYPK9NMUrOZXx095quJLZdkMETROfOTT5DwB
 gIAMlj2sBsfbYaNMDZPKqOK9wYlId/e4hbbwxmleSBTOpo20Ne2oJuLy4ickmkVkz2rfpKLRZ
 XCl0LuXlcqLLa63eUpylq/gdJg9ZnDO6Pd3hlS5glae7FV6nq7HFEqoZaH4KUZzVJeyOn5fHK
 OUELb6T4uwAtWhyuoLiEkvxAXqhPqVdzwKcgLC7azaW9MGjiV24wC5oOXiHhNii4PQeshEPwk
 h9gH7+6+bM/y85e69KYOlfX7FXxnJpsrK0jWLbsJ3T1seSFy+jhWHgMwggWo6lZ3OayI8V2Ra
 M1h6+X08D77wr4d0v17lZMt7mzkLxv9IbbCd/xYfkTjow7r1U7MLVNsTgwCRjPNQ2ORRll+hs
 KAZup6cOcvuMLY4zg8HIWYYi5vPb8n/d1Pkur1WMLUIibuLUzl79/+oIv7F7FFW/DC6FVKq8a
 hbX1FQt+WsffRtEVb9B/LNNRP/qYJRQLVMyRdP3SjflDeFObJjVhthqGr5TTSP1CeZ87qNt2Y
 nu72vnWyMdsq/xofN3yKcKsheiBEmLjvY/iBLKb+uCt/7BRqUW1LZVYWEA7J6537NgwH7GZFu
 BIsD7PV6+6Oezrmo8Mk+qhweOh5m61jEJsE/iPS/nRWElxlydbWWcdjuLx2tBvEmJN+OT+yme
 bhmTNAtS48J9ACiLp6dVg1pEbOOV2krtsF3JS44mRnRDjREw52cM8xU1lL0ricIxvPlfE6hqt
 suxk6sL4HNE99phdef8Ff6EJzK2iKMpo7br5t1vaWgx8SMc9Nqe4nWZBg==
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/25/22 15:03, Daniel Vetter wrote:
> On Sat, Jun 25, 2022 at 02:25:02PM +0200, Helge Deller wrote:
>> Make sure that we catch, report and fix up fbdev and drm graphic driver=
s which
>> got the virtual screen resolution smaller than the physical screen reso=
lution.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.4+
>
> No cc: stable for this, it's not fixing any bugs just helps validate
> driver code.

Ok.

> Also if you just move the check from the ioctl code to here we don't nee=
d
> to duplicate anything (and drivers which don't check their set_var are
> kinda busted no matter what).

See previous mail. We need to decide which way we go, then I'll change it.

Thanks!
Helge

> -Daniel
>
>> ---
>>  drivers/video/fbdev/core/fbmem.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/cor=
e/fbmem.c
>> index 50fb66b954d6..6d262e341023 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_s=
creeninfo *var)
>>  	if (var->xres < 8 || var->yres < 8)
>>  		return -EINVAL;
>>
>> +	/* make sure virtual resolution >=3D physical resolution */
>> +	if (WARN_ON(var->xres_virtual < var->xres))
>> +		var->xres_virtual =3D var->xres;
>> +	if (WARN_ON(var->yres_virtual < var->yres))
>> +		var->yres_virtual =3D var->yres;
>> +
>>  	/* Too huge resolution causes multiplication overflow. */
>>  	if (check_mul_overflow(var->xres, var->yres, &unused) ||
>>  	    check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused)=
)
>> --
>> 2.35.3
>>
>

