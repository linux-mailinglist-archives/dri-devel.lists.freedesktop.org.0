Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BwFIJmGrWky4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0E230AC3
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB6310E42B;
	Sun,  8 Mar 2026 14:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bhz+ER+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7B210E3F4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 19:57:04 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5a12f88d839so2892911e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 11:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772827022; x=1773431822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FemvMqGcUV/au1GngB7WNKuS2H1VDSQhU9vxX5PjUlg=;
 b=Bhz+ER+6L0ibu44o8CFlR6rGdV2cskuXzKvWVzDkuj5qKY5uGjspYOtH7FsdBTUl47
 DV9BYxrfBVdWBlki7fHyxM+d2HLoyEKvIdSB4z3oT5hQ4Po7qOXeUyFdyqt+PDUAb0IQ
 Tp9tOPXY41BSsy0jz/myHfaI91offBEDDCR0Pnflc+KVkkFY2POLWTKn1ba1GE5zSKOE
 minHoyUP0PKkEkQFiPWcdFrZRzoYIDoqIjby8/eIMxnrGhdLc9kqUJADhAaCmpFl+AgB
 gPI51oGE+WECpCWl4xFfW82QBZ9252dTLyA74YqN/ehO7QCL7/KpuerOeQ2zIvKpP9HI
 5DvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772827022; x=1773431822;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FemvMqGcUV/au1GngB7WNKuS2H1VDSQhU9vxX5PjUlg=;
 b=rX/t8kEsxTjMq2SYL4Vpp1LMWhsJawCKhFKy2bnlf5Vj+wSXDhXA+yJHuYuYoAWaxn
 6vaR2Zo2UaSKAr2omgZeMZG14FfWukRBFZVRv9tAbXAeZGZkNW57AeACj++25wHd6cTF
 k7FGSLdQN4pRqBuY5dWJqHhKvZYAdpMBqcmwJqVH+84+cb9xG05LUbI8c0wNLjnUQv6U
 GMvR7ZRhgQ4UJU3Gj2v+oKZeH54Xwj7ZLdD3ohx7DMUaK3RHEIj2KKP2kCRtoR+NL9Ji
 NIPWLaeIcZWSSU06is9GuKF4vCr+dN2rHxheXKkDr848yRCgOp/5p/a/VWmxPmLDjBzS
 c8Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa8MPQocwaBp0vwn48to26bAH+x17kwe1yzTO1Esj1DjT+19Sn90GjK7PWGQviyFLxOfhDaWGP8as=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/CyeHwqty1Vmtj1XweGH78/eoZiK3NUrIZtSRu0uP5DKcelTJ
 8wgc9L4SZdhoneYXADLBRWuE7CwzJlWpwwRuo7/ryEpLf+onhi4RDSCGj7KHBLrSR60=
X-Gm-Gg: ATEYQzxSdNAPF+xwtBTVDcQQPHObpkEP28LyFm7hJfhZuRn5QdmylfTxYhtQEb0lyLr
 Vc/mDyIg8Vet7lueOTokTGlZIN/UoQPnA8aDThbsWIYm729u9v/5QTfhSrihUYb4prmn8mbfmTW
 BJV/zneOx4v3yB3ivgvDuAY4a/283fDI9qL5nbI8xrMHveOWMnCfNu/lwFh30mQS8WiMe6GUHVX
 /Vni3zusjV+VpZhDRiK1lJqLhPV3ZqGC2ADSKxJ+nJljQOfz71i0WK5mImV/8mmeS6zqAIkzOJv
 om0hIRdiumiefkyy7Jzxo6MtZpRxI7w7p/wiZBAw2im5Wf5UUZ7BfcCMdBO2VzW500FS9KPTPV4
 liyDxi13HzRSoa8B11aWtgL44/Ia/TQ7s7OuRNe/mwsZQV0Id79C7LmFavKo9XKNjUXmjkpp3hL
 Lhar/XT4BVK6ygkrySVhCje8epxHxQhSRbylsHEzSfsSKCTvHqGk7Ww1KV8R7oEzPOBM0VHgOVm
 CM=
X-Received: by 2002:a05:6512:3f10:b0:59e:24e5:a3a5 with SMTP id
 2adb3069b0e04-5a13cceb81cmr1156649e87.29.1772827021859; 
 Fri, 06 Mar 2026 11:57:01 -0800 (PST)
Received: from ehlo.thunderbird.net (broadband-109-173-27-236.ip.moscow.rt.ru.
 [109.173.27.236]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13d08d4a0sm509448e87.87.2026.03.06.11.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 11:57:01 -0800 (PST)
Date: Fri, 06 Mar 2026 22:56:58 +0300
From: Eugene Lepshy <fekz115@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Pengyu Luo <mitltlatltl@gmail.com>, Danila Tikhonov <danila@jiaxyga.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
User-Agent: K-9 Mail for Android
In-Reply-To: <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
References: <20260306092518.37849-1-mitltlatltl@gmail.com>
 <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
Message-ID: <C89A2E4C-6818-4BC8-9144-E76103C0A944@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----45DPAANOKC3D6DT9J8ORQLHOZYYW59
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 2FB0E230AC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	DATE_IN_PAST(1.00)[42];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:danila@jiaxyga.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fekz115@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,jiaxyga.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.881];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fekz115@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

------45DPAANOKC3D6DT9J8ORQLHOZYYW59
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have a concern regarding this patch=2E The Nothing Phone (1) (sm7325-not=
hing-spacewar), which is already supported in mainline, utilizes a panel wi=
th bpc=3D10 and bpp=3D8 (DSC) [1]=2E

Currently, this configuration works properly=2E While I have encountered m=
inor graphical artifacts during brightness changes, the display output is o=
therwise reliable across all supported refresh rates (60/90/120 Hz)=2E

Since this panel is already upstreamed, this patch might cause regressions=
=2E

[1] https://github=2Ecom/NothingOSS/android_kernel_devicetree_nothing_sm73=
25/blob/6f027f0440e3dce8a674d9cbd2f6ad944120e209/msm-extra/display-devicetr=
ee/display/dsi-panel-rm692e5-visionox-fhd-plus-120hz-cmd=2Edtsi#L483-L484

Best regards,
Eugene Lepshy

On March 6, 2026 9:47:23 PM GMT+03:00, Dmitry Baryshkov <dmitry=2Ebaryshko=
v@oss=2Equalcomm=2Ecom> wrote:
>On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
>> In upstream the msm, for bpc greater than 8 are not supported yet,
>> although the hardware block supports this=2E Remove them until we
>> support them=2E
>>=20
>> Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits p=
er component")
>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail=2Ecom>
>
>I hope Marijn, Danila or Eugeny can comment=2E The patch series with this
>patchset added 10 bpc panel and used it for one of the phones=2E
>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_host=2Ec | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host=2Ec b/drivers/gpu/drm/msm=
/dsi/dsi_host=2Ec
>> index e8e83ee61e=2E=2Eb60b26ddb0 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host=2Ec
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host=2Ec
>> @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_ds=
i_host *msm_host, struct drm_dsc
>> =20
>>  	switch (dsc->bits_per_component) {
>>  	case 8:
>> -	case 10:
>> -	case 12:
>>  		/*
>> -		 * Only 8, 10, and 12 bpc are supported for DSC 1=2E1 block=2E
>> -		 * If additional bpc values need to be supported, update
>> -		 * this quard with the appropriate DSC version verification=2E
>> +		 * In the upstream msm, only 8 bpc is supported for DSC 1=2E1/1=2E2
>> +		 * block=2E
>>  		 */
>>  		break;
>>  	default:
>> --=20
>> 2=2E53=2E0
>>=20
>
>--=20
>With best wishes
>Dmitry

------45DPAANOKC3D6DT9J8ORQLHOZYYW59
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Hi,<br><br>I have a concern rega=
rding this patch=2E The Nothing Phone (1) (sm7325-nothing-spacewar), which =
is already supported in mainline, utilizes a panel with bpc=3D10 and bpp=3D=
8 (DSC) [1]=2E<br><br>Currently, this configuration works properly=2E While=
 I have encountered minor graphical artifacts during brightness changes, th=
e display output is otherwise reliable across all supported refresh rates (=
60/90/120 Hz)=2E<br><br>Since this panel is already upstreamed, this patch =
might cause regressions=2E<br><br>[1] <a href=3D"https://github=2Ecom/Nothi=
ngOSS/android_kernel_devicetree_nothing_sm7325/blob/6f027f0440e3dce8a674d9c=
bd2f6ad944120e209/msm-extra/display-devicetree/display/dsi-panel-rm692e5-vi=
sionox-fhd-plus-120hz-cmd=2Edtsi#L483-L484">https://github=2Ecom/NothingOSS=
/android_kernel_devicetree_nothing_sm7325/blob/6f027f0440e3dce8a674d9cbd2f6=
ad944120e209/msm-extra/display-devicetree/display/dsi-panel-rm692e5-visiono=
x-fhd-plus-120hz-cmd=2Edtsi#L483-L484</a><br><br>Best regards,<br>Eugene Le=
pshy</div><br><br><div class=3D"gmail_quote"><div dir=3D"auto">On March 6, =
2026 9:47:23 PM GMT+03:00, Dmitry Baryshkov &lt;dmitry=2Ebaryshkov@oss=2Equ=
alcomm=2Ecom&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;">
<pre class=3D"com-fsck-k9__plain-text-message-pre"><div dir=3D"auto">On Fr=
i, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin-bottom: 1ex; --com-fsck-k9__blockquo=
te-default-border-color: #729fcf;"><div dir=3D"auto">In upstream the msm, f=
or bpc greater than 8 are not supported yet,<br>although the hardware block=
 supports this=2E Remove them until we<br>support them=2E<br><br>Fixes: b0e=
71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits per component")=
<br>Signed-off-by: Pengyu Luo &lt;mitltlatltl@gmail=2Ecom&gt;<br></div></bl=
ockquote><div dir=3D"auto"><br>I hope Marijn, Danila or Eugeny can comment=
=2E The patch series with this<br>patchset added 10 bpc panel and used it f=
or one of the phones=2E<br><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin-bottom: 1ex; --com-fsck-k9__blockquote-default-border-color: #7=
29fcf;"><div dir=3D"auto"><hr> drivers/gpu/drm/msm/dsi/dsi_host=2Ec | 7 ++-=
----<br> 1 file changed, 2 insertions(+), 5 deletions(-)<br><br>diff --git =
a/drivers/gpu/drm/msm/dsi/dsi_host=2Ec b/drivers/gpu/drm/msm/dsi/dsi_host=
=2Ec<br>index e8e83ee61e=2E=2Eb60b26ddb0 100644<br>--- a/drivers/gpu/drm/ms=
m/dsi/dsi_host=2Ec<br>+++ b/drivers/gpu/drm/msm/dsi/dsi_host=2Ec<br>@@ -182=
4,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm=
_host, struct drm_dsc<br> <br> 	switch (dsc-&gt;bits_per_component) {<br> 	=
case 8:<br>-	case 10:<br>-	case 12:<br> 		/*<br>-		 * Only 8, 10, and 12 bp=
c are supported for DSC 1=2E1 block=2E<br>-		 * If additional bpc values ne=
ed to be supported, update<br>-		 * this quard with the appropriate DSC ver=
sion verification=2E<br>+		 * In the upstream msm, only 8 bpc is supported =
for DSC 1=2E1/1=2E2<br>+		 * block=2E<br> 		 */<br> 		break;<br> 	default:<=
br><div class=3D"k9mail-signature">-- <br>2=2E53=2E0<br><br></div></div></b=
lockquote><div dir=3D"auto"><br></div></pre></blockquote></div></body></htm=
l>
------45DPAANOKC3D6DT9J8ORQLHOZYYW59--
