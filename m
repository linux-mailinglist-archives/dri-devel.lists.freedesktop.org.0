Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26A61B3827
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CEE6E9B3;
	Wed, 22 Apr 2020 06:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576296E8F6;
 Tue, 21 Apr 2020 09:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587461686;
 bh=Y9htZmZvjU829LzF/gQDRezZV/bjAVzm4sRlk87odHU=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=JB8SEqxn3qGKwpJtqByb9blL4rtKdU6K2TLhRN2kN0VUs2PMVgB8s/hBdz+1L/HcW
 gUJHACCsJIom3u4mNumCvtiBs1AxVwhxqod5i3rFws7CRm1whfdWLfuUnzrdLuRo0R
 rWFFpDB1GHlim8NzqKTVkON1UP8sBdViML/RgyBA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.91.59]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MQ6LH-1jM8Kj238d-005I7R; Tue, 21
 Apr 2020 11:34:46 +0200
Subject: Re: [V3] amdgpu: remove unnecessary condition check
To: =?UTF-8?B?6LW15Yab5aWO?= <bernard@vivo.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>, =?UTF-8?Q?Felix_K=c3=bchling?=
 <Felix.Kuehling@amd.com>
References: <AIsA-wCZCFCxiq0WKb3WjKr*.3.1587458683834.Hmail.bernard@vivo.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <63c80c16-cb28-4b18-e191-90e4a2c4192e@web.de>
Date: Tue, 21 Apr 2020 11:34:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AIsA-wCZCFCxiq0WKb3WjKr*.3.1587458683834.Hmail.bernard@vivo.com>
Content-Language: en-US
X-Provags-ID: V03:K1:b15Lo3qUagUK+OaRj9z0KcOF0eoEbMYLwxIbmlbS6on3lzObO81
 HuvKelZ3LRt0DKx34H0/YnmRM9ZckmdBP80J0I+3RFRXOTwPSLf6Qv5YyicLxjRipVPPEMF
 zlHd7PTS7DBUinM3ppXIjTSVcAf95FsxqBkcsataChVectvxPLGkq65kZZQHK5wf76j+rkd
 Pvx4UfHvxMbTduUZeRWrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QtmNn0nvB2g=:ZG6G0rh6H1smGiPpJrKGXl
 CXZA3jXxeidaEJ4SyhByRJUUhvRvPd4qb6LuDtcyeQdT/MwwaWXhAiSrpFIPYaoYT4zLTDxk7
 MhPHvoAoTIQ2wnOCU+MEpBz0YeWVS+13Zf45oI6lchxadhbD0heVPCoDf73/zt0dDv01/tnpr
 IUGQKTUAp/NkSIjrR3DDpLFhvQoakOaZQZpAjHaOxTFI5ZiwQOmVHWxZpsow9xE+xXH+Z/haF
 6ty+x3kj5X11mVTfmJ/Pp0lABLQiRepwVm025bMSwFIoMgxxbT40DnT/ex4tvQ484Ur9asz6G
 DrvrUted53iFLR/JwQp0Cme2r7DG9H8JpDMsvR1pXzPJh3ctcMXBsJv8QontgV3Q3fxcEWne9
 9tE/sOYPz5BX1K7XCKUStQZ2+rxYbn0iXKgmjcF/XRgHqftMZGWgxIFm+zvFhPhiGf/g0mZ1L
 a1fNoSZbAsmAQPBh+OBEJA7uAxscjmEshqbB4LhxryQh0es8DJo44+yeBqnfjw2dns6hNQkdD
 oJMNgiclFkCRTtm56qFuGKeOMNVXU0O6yv8NIj/l2GYvvKrBekAiUDDdpoWg3hDu4xS0iLLrL
 9ziyZsoLurOyCswV+WdQ46nmmltnuOXWeiqSjHhoWismrrdpLXrOE0JKOSxyFzGyC9ilnxAo3
 YhcjRdsYQzimeb3Jn2iHlfver8qQXL2eipRPowJILnVxJ2T98foSSa0Buou+UxXrFxI/G/N6z
 gO3JcuHWkhPpWto+o+L8JrTiPLA+uyUljKa7+6GnO57OIJdZLLOTBuR629lPAVWuHHXJl5dvZ
 gsmteWDDeMMz3uT6XgMPWf6+8mIFtCLi2CE7SMrBSHudx9rKQsjkfW/rqAK2pksNHz4bx+TA6
 POB4iPGRgDKoMtVtS4xgJgPlhEdFBlsGEkOvo+UKpxFOYLlZKPvSrhOZ57REu9wmRZ8yCT5Oc
 pfmdWb4LkLvrO7mbEOxDgoAnFb220pZ1CXf2WgbpwTagVjtjn8Xan5Tp+ux0AZkfcM7y8bqoB
 f452d8Kx1Olsl7N1E8rAggR78wzBiuEHGlZfemONtazXCdFPwS5gSH3k+nttGudVWVwDE6lrY
 dt8159hp0feikGg7gmcXDXAaTGttuDg+tB8dXz8qbMZLYlRkAKMqW/wBEN6jjfe/gU/XAweuS
 oANXIB/kl6WtHdcQ3WILiHHg0lz83rzKqHVVjmFuBECN+A+uB/BDmApxcHaQPULMZTCPKfrl+
 dMNnSg5YDgS76wMEe
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, opensource.kernel@vivo.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> But i have to say there are so many code not follow the kernel code-style in amdgpu module.
> And also the ./scripts/checkpatch.pl did not throw any warning or error.

Will such information become more interesting for further evolution
in the affected software areas?

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
