Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B784F1EB65F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A416E177;
	Tue,  2 Jun 2020 07:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E522D6E105;
 Sun, 31 May 2020 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590918663;
 bh=S5j/Sm8NnP1xV65eR+sEb2cXuO8q6nCGXukhuHwjBaA=;
 h=X-UI-Sender-Class:Subject:Cc:References:To:From:Date:In-Reply-To;
 b=r3PZjfP5an+D9LTPapg94SwJDWvtMYEMrbheICsajtbRqjX1bf6kvcPGWrd6X6Ho7
 /StqgfCBz0KktO/Ri37vwdWX5FwU/plJKbuz9sqCNk1pcx0QIouzGGdzqwdn/1cCaY
 XGx/5ROHzo350Su+oGkt9CJ7ENRJYZAyyUp7L8MM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.19.10]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N947J-1itDqy2d1j-01642W; Sun, 31
 May 2020 11:51:03 +0200
Subject: Re: drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <74977dc6-7ace-6ef7-4fcd-3f6c89a3eb5f@web.de>
 <286858ff.db7e3.17269ee5f3f.Coremail.dinghao.liu@zju.edu.cn>
 <5a073b2b-5102-adec-84dd-b62dc48c7451@web.de>
 <1c5b64dc.db888.1726a03b710.Coremail.dinghao.liu@zju.edu.cn>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d05224e4-d682-de3e-928f-5af7b8597a8d@web.de>
Date: Sun, 31 May 2020 11:51:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1c5b64dc.db888.1726a03b710.Coremail.dinghao.liu@zju.edu.cn>
Content-Language: en-GB
X-Provags-ID: V03:K1:/ee/2WhjWj59Unuy9PwSUsZvLgkFxcD8y/bK90J4pFqMch/Fw0E
 wmrtpOU/JWrcPUdZFgZDZiD3H0YhCfiqds8/Yr3FtejBatagCIDKjIADBEdV0Uezvh3wkSf
 wtA89S6KLwwmgnwKVvXl9QhrYfiueQaYtqkRPU/7j4AGS8cgp2Dxgr5OF/Ax5enPPXFwf/E
 273r5oFNzEEu/DlkH9G9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1VtH0CB2aE8=:dQ7GG2NgZOrjkVDiT/vHIp
 kD4hq7fpX/FVlE5HV1KPEUseF4UOVt6eybrYDm7xAYgU+yyOXwyoQavg0F+1jqgabUezGzARR
 D3AcpRbQw0gG97HHAVKVsaBLCPE74U+GAt38Ob44uNLkR0+GrS2GKQO6nqJ+EvvsTOADRBzAi
 u0zTnzDxpAupRJKJgotwMEorVscW5ZOCGlbMB+lBSjf2Yf0WXC4wo0Vq+qTRhmuIvIVHXJRz0
 QNrs0VME/pamFgHfjZPRI5mCFOwVau1ePwtKPHhs6N+yZ5P5DEgEzIjEfh3XUG4Y1OXxRANNn
 L/oEmlaku9fRXLJARBdGqU7tBmNaivB14g6iYNCzydmctij9IQKqpnOOsaW8zh7CCLIjdJDcZ
 dEEXgQyIl5noH14gsOcmD5MTuJ46/OsvB7F+P7BVHAlbrvhCji6UXmhUJFbqnqgVQImkwGfhW
 X6FfO4isFuPRLvBfsknFK16NtetXoWJPTzaSj5x/5Ab/CByO16J/bHR4ZhCqlxqvHM6XS82Fg
 UGEi/F11Owdj+/E6t7gDVaZ8cRSyvdjUKD6zrgk7ujue+6ZzmCKpAQp8ZmD/kILlo8EEg65vU
 TGc6T8eOE5rFBVFRvtQNAv/+tiECbmszo0X29H8fg/pwtRD1sHtF36v3Trn6loo5+P4tODbc7
 NwljP1i2pU8t3cBMPaK2qOzcvENgVukJRjOuD1lSJ5s/k5wS8pB/jpt5ZSVtUgRqdHd3SUAFn
 wDINAtnx1MM3g5lauYwEa2spcyQG3pUA2LwWThzzQwUhVKxehj9HLlGJPy6XR63gvhU+D6y/F
 yHCZSJ7QD+FYwOx1+FLnYiMSwVRzzo+rTYWLVRC4bDeoME/xLS3tqUtrv8eVwnyMTgPzyH38U
 +pNsPjpx8xA4nApbq6fzVknXUkDABzYzX/sNllBnyo40tojT0Li4+Q2O9l8NpUYPj6OccvLOR
 T5mJVTmM9cQGEABqJJJ+/SVJBA6r6vCSuKa1qzB55tFSUGvc54+SJ6VPQdsYA3Nf3KG16VOCv
 YTSLZMdCpyUYD2M53Nok1Ie64AWCpZRto/t6HH1ePEw8/Jh0Zc2Ez3ID6/78C+RgWzOTvYsDn
 OkbdKkz2di/R8nXghjx0/TvuvUYGsnEzbnNu6i8UwNKFVultcuWivmKkIrT14M7MvI/5BJ2ju
 Sp6GDCsp5B91hfeL8UH/btQP57DSGnZANZ1jbe4ANki685f2nKlvgFUaGkbOUnQ0amcWy9OSA
 HAIrQI2M1z1x/i105
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

> If gk20a_clk_ctor() never returns such an error code,
> we may need not to release this clock object.

Would you like to achieve complete exception handling
also for this function implementation?

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
