Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297C1EB657
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF186E092;
	Tue,  2 Jun 2020 07:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5486E103;
 Sun, 31 May 2020 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590927250;
 bh=ZDHIA/BSR3jEXEx/A3Hngit9dmMCk8T17SSyAhSeeEo=;
 h=X-UI-Sender-Class:Subject:Cc:References:From:To:Date:In-Reply-To;
 b=BxBoC5zyscLogezPCphXI2X9wyyIRFx0lDKbgODKO7dvwprsOBkYSm/uUq5nfAyXw
 ECgjpXtxXGIvwgWj1Gie0bAcCe0KzrVGZq9vTDIVQukghjmvjHSY68RnPhmDe5cNCD
 n4HN1xO03sY2frokDGZXBPtnNskWEb9HVEJGJQAg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.19.10]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lhvlm-1j9tei2WcE-00nBSA; Sun, 31
 May 2020 14:14:10 +0200
Subject: Re: drm/nouveau/clk/gm20b: Fix memory leaks after failed
 gk20a_clk_ctor() calls
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <74977dc6-7ace-6ef7-4fcd-3f6c89a3eb5f@web.de>
 <286858ff.db7e3.17269ee5f3f.Coremail.dinghao.liu@zju.edu.cn>
 <5a073b2b-5102-adec-84dd-b62dc48c7451@web.de>
 <1c5b64dc.db888.1726a03b710.Coremail.dinghao.liu@zju.edu.cn>
 <d05224e4-d682-de3e-928f-5af7b8597a8d@web.de>
 <599cd7d4.dbaba.1726a53da96.Coremail.dinghao.liu@zju.edu.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Message-ID: <f02d4f00-965a-12d0-d306-a943e2551184@web.de>
Date: Sun, 31 May 2020 14:14:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <599cd7d4.dbaba.1726a53da96.Coremail.dinghao.liu@zju.edu.cn>
Content-Language: en-GB
X-Provags-ID: V03:K1:/NrRDvnkXic8H3z+KiXbt4LBZ+9MfyLsOwHzaCjgokctMMkwO+y
 c78PnYKZ2QR68cAYOOEE4bQ+BBeRgnsAoP2g0fouMOdW6Ia2bAT1YsUUC4v024+lmAsrLzx
 Ao3P7Bv81ZAbWHpqxfmvrWVIj44xntibCwo21H78Z25C5F2CyOjAV/SEcs6MUu7S/cQfbqt
 JxIsNlWNrsnbMrOqD+3Ww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:teDT0+N85sU=:pYFiIDHjMdxSPQ4JtXbvnU
 9qHXGmZnbI4HDebFPSIt4Fdf6QgA5nIc3HCaUxvwR6gO0m9qXzNU0ns1ejS2may7W8epgcjcT
 2djkAG+4joy3x5+J6d2JA22DntCxMRfxtlOhzsbRLqWLpgTwvmZkb3T2d8F4XwO+E8UEa1M+I
 VSamEviIN1XSfod8XVqgLF6Tyw01PzJuP5U8PY2QoEYTA1PyhbsCjzCEe/0J5QIYKrWcnjt8Q
 im3YxkRKYWlO3NEy7Az1vgt0rtjlyBSFqNmO5Bqq1vwPL+PX6rjZ7hf90MSSi9LTXk5r6l9U2
 qj4YOSyX5C1tAAn6vm4Z1/AHguq0eZZpZYsjxSwjQKtzIhSI1E2eGrHFkFBMQlAQl3TQYWN5g
 BHHRnaXXiph9EKTRBqBK9BcWmrCbA91Tkd3Bhdw2uqZFVEvfSiiVIVNyMOua2QfxbfMv4dlfN
 fwqqK8myWBopnveQjLQlVyNKUgKx6RsCnBOLwVWpXhBYMpfgH3oaC+gmidUfmQk/4wV+hy9lT
 Inpga5cJ5Khrth3aNd00UAx9GNeXPAPjTE2jS15phkCfSZrzGlzTGIewnaxd0NReQpVKHwPWb
 nfRx4O3XML3zjE/Mfn8ZWAcBAu+48tgGj91G/CdtVWOFqXdgsGvcxRPZ6eyrbd0CLn3VEmGnH
 rLKPMKqBeOKoSz8v44GnQGpeMhWn/TzFSI+/hWcbg0yxzfBpzMtisbkusIcG2JLNVeBih2GY3
 pbnTcOF84EsZNesmWV0Hfh0rtzmg2ZJ5JlIKBAVwlwdFYTelqJ3CY49rCzdou+V4HV9Azw7lc
 KqBgzsQwGI4sixFgWho6I0h8x7DRbF0KL2s36qsrrv6UzOGUKuNK77rf2K3rMRHZnkBG3fj6d
 z/REKsHJq3f4xEUR5vtmbwNlSlwIvrt7vAyBO+lotTboLh8NUXOng6Ot0Atloc1fYZ8QYC/Cn
 3z6eI3WSvS7uyj5Hejb8fbvRBWwMDoDVy+2lxNKdRRgAhBeX+/arEEcg9FHcoiu94VJoG0y7E
 oW0XS6BWf/cXNRS0tpr2LaDbQYIZKWNrRo0nubCPGiuoU0cTog+kgie2zJLvy0eW4OT4xOcVl
 9/tjPLZYZ7vAwmk8q4uWKjxDOfp/JKEr/VMYiyHA0Z2sJ+Q6TWIDRjOrvXaBa0zEkSsdMHysF
 gjw+1eayhYqfPaxEGMNs7JZJxlFQbkHDkgYRByZ/MqVYIuOm8OQvVQ2++YjzKXJMsrV//MgO3
 gjx0jZyaCCtmpD4BK
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> In this case, maybe we should check the return value of
> gk20a_clk_ctor() and release clk if it returns -ENOMEM.

All error situations (including failed memory allocations) can matter here.


> And many other functions also have the same issue
> (e.g. gm20b_clk_new_speedo0).

I recommend to increase the error detection and improve the desired
exception handling accordingly.

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
