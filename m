Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FC3F4C47
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 16:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EED89F71;
	Mon, 23 Aug 2021 14:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B205989F85
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 14:23:21 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id o10so10304366plg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 07:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=WtsUEsqMTxeu0ASY9ZGldGWSKXK/Bt2mBtS4t1K1jok=;
 b=Twno2VV6Mfpk9mFt1zef4nXG4k9+uk+hiqK3q7qn6xzeS8fqb9Sd0RsRYk+AW49Sup
 kwtvnA0rQxXUqxgPFcN5FFmZ1DHdc6mRIoougB08bPum5ctx5mGdYBLMBllI20ZQwywX
 GsosFTC7bkpcR7C+TuJ+4VIi+eYChTNMCf2uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=WtsUEsqMTxeu0ASY9ZGldGWSKXK/Bt2mBtS4t1K1jok=;
 b=TgOzjNj+eMQWzYMjjeHd/r5JCqivbmf4X7R0CwxIvGBczQygY/fuo43UZY3XsDQluL
 jX2vGNLUEGxF8VQnhP2Oau8dfAAuFYlKSwy/vNu7PeGuSb7iwPW3ezaWyiS3bqrv7BQZ
 zxlg7miQ+a0I7Jnk4yzjX8ddY8mSLC367ot0anDNbrp70qQv1gC4WinFJ937nqfr7s9r
 y9ypIBkOzo/N1WDxclzN1Sai0hxsCqZMUuwcQrnJktRY1aIOYVkDVNOCqDPvNYyeTLpF
 0+jcLFFTiWc2DzPfrAYiOyfJ8UieQa0KFsd3SzPBogC7SCM/VH9ltvAXacKPk3D7bmYp
 8WYg==
X-Gm-Message-State: AOAM5330Drhs/HHVcckQjX/jTHPwclgprWcr63s+uXl3De7PdoAosrgv
 7UOdeXUQ6Bi3Ca11R3Q7qXRDgQ==
X-Google-Smtp-Source: ABdhPJyi22ur2sPI/DYF4luwUXxBY5gmZaV71bLC6h6PGLbA+cDZDfqrOe18jGG3kcfwjHp+QTWrPQ==
X-Received: by 2002:a17:90b:4b84:: with SMTP id
 lr4mr20672140pjb.32.1629728601332; 
 Mon, 23 Aug 2021 07:23:21 -0700 (PDT)
Received: from [127.0.0.1] ([67.219.225.50])
 by smtp.gmail.com with ESMTPSA id 10sm16158814pjc.41.2021.08.23.07.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 07:23:20 -0700 (PDT)
Date: Mon, 23 Aug 2021 07:23:14 -0700
From: Kees Cook <keescook@chromium.org>
To: =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>
CC: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Jiawei Gu <Jiawei.Gu@amd.com>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Dennis Li <Dennis.Li@amd.com>, 
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 David M Nieto <David.Nieto@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Lee Jones <lee.jones@linaro.org>, John Clements <John.Clements@amd.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_drm/amd/pm=3A_And_destina?=
 =?US-ASCII?Q?tion_bounds_checking_to_struct_copy?=
User-Agent: K-9 Mail for Android
In-Reply-To: <4922d89d-1293-7b32-d684-c731c246e6c1@amd.com>
References: <20210819201441.3545027-1-keescook@chromium.org>
 <4922d89d-1293-7b32-d684-c731c246e6c1@amd.com>
Message-ID: <FB2A077F-78CB-4D84-A8F2-C63C57923496@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On August 22, 2021 11:28:54 PM PDT, "Christian K=C3=B6nig" <christian=2Eko=
enig@amd=2Ecom> wrote:
>
>
>Am 19=2E08=2E21 um 22:14 schrieb Kees Cook:
>> [=2E=2E=2E]
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu=2Eh b/drivers/gpu/drm/am=
d/amdgpu/amdgpu=2Eh
>> index 96e895d6be35=2E=2E4605934a4fb7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu=2Eh
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu=2Eh
>> @@ -1446,4 +1446,29 @@ static inline int amdgpu_in_reset(struct amdgpu_=
device *adev)
>>   {
>>   	return atomic_read(&adev->in_gpu_reset);
>>   }
>> +
>> +/**
>> + * memcpy_trailing - Copy the end of one structure into the middle of =
another
>> + *
>> + * @dst: Pointer to destination struct
>> + * @first_dst_member: The member name in @dst where the overwrite begi=
ns
>> + * @last_dst_member: The member name in @dst where the overwrite ends =
after
>> + * @src: Pointer to the source struct
>> + * @first_src_member: The member name in @src where the copy begins
>> + *
>> + */
>> +#define memcpy_trailing(dst, first_dst_member, last_dst_member,		   \
>> +		        src, first_src_member)				   \
>
>Please don't add a function like this into amdgpu=2Eh, especially when it=
=20
>is only used by the SMU code=2E

Sure, I'm happy to move it=2E It wasn't clear to me which headers were con=
sidered "immutable"=2E Which header should I put this in?

>And please give it an amdgpu_ prefix so that we are not confusing it=20
>with a core function=2E

Sure, I will include that=2E

>Apart from that looks good to me=2E

Thanks!

-Kees
