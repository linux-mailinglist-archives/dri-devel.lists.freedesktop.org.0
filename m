Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAA21EB670
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D683B6E38A;
	Tue,  2 Jun 2020 07:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886D26E0BC
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590915620;
 bh=fhkDwnu7+vDhSS/yeEIy2SkfDALNJ8pN4WSpeV4qi9E=;
 h=X-UI-Sender-Class:Subject:Cc:References:To:From:Date:In-Reply-To;
 b=OQ7F68Am+nIbBazBDmWlzsh4FDeSAj+rRao3EZtfMhdFP3oehMg5vKYyiTf/1IB/l
 YY/L+lunpM4jP8JBQR89VxUQBEojpHN5+f/SIcqYJpIsAoxUE/XiOFjq8yJa3XMmdd
 5NOr+zEUH7o4TkqC60PwgUCBiuuDvPtgIMxT4m34=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.19.10]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M9ZeA-1jc0Rc1aIm-005hgd; Sun, 31
 May 2020 11:00:20 +0200
Subject: Re: drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <74977dc6-7ace-6ef7-4fcd-3f6c89a3eb5f@web.de>
 <286858ff.db7e3.17269ee5f3f.Coremail.dinghao.liu@zju.edu.cn>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5a073b2b-5102-adec-84dd-b62dc48c7451@web.de>
Date: Sun, 31 May 2020 11:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <286858ff.db7e3.17269ee5f3f.Coremail.dinghao.liu@zju.edu.cn>
Content-Language: en-GB
X-Provags-ID: V03:K1:aMG7zfaQUOqYEZ66qdQxluuIw7Wk0OYJrIJYOR4VtwX2r98+AZ2
 PhXDVDOZe9RKOlSpvcfqxPl+wvZejkmIHnHXl+zkyHoivrI+5s2A500f1lj9/Dp1WJKTbk9
 iJ8VXImG6oUmWaTMDLQyA0iLjXQnB5agX97ByXp1vvfN35cRurJRhmIaYYCoZ4Lkvz89Nqh
 F+0ES7Dd5voZ4tZxvnrtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f60psGJt0pI=:v+M+MN2NZL0YSZtnUhlcC+
 UPU50f7R6lu9y8PJZd/5XDk0rQLHA22i7APsSSOr+WMTYTNiwXa6oQPOhWIDu4pzfejn+n4nb
 HZA1bOeTy1/srAfHul1u5VteXVyvcXWk3QSGkmPVa7fhWAE5l9rt6dALfV777tyTjqRJ7Hywr
 2tJ+6GnpXGPuBsx8rOw/TKNPIaru5cU0vbKLFBawuBNi+bsK1QOe9uQJR31kcPPGn6bX3FJLN
 GLEf66Wa1TR+hdnSvrhA8lSR54av589gxEMa4VvOqNvgt0G1T+8ZNY4syKjZ0MKcCYLz8DYZO
 w9jS165ssLxwx/bAhXEM4ICtnak7sKMKbrtSY/iWtQ6CN87g1m7Qy/vWQY1uYUdmKvgna74Ti
 Y897HpfRDtcVMSzY2L9zZe3arU5MotNmgLECkn57wWX9LUPxw1z6+lvk2aYELrVGeTvEKC8M7
 cl0aPdnXo2boGKWQ+DL4SSnMUOb3AUKrqKt9dkV6cpDOgh7ryNF99UGGfrJQxWh8n0u+JTsdW
 T0594e8UTu4G9SqpXoSFOOm8231EMgrNqAxpCY4VUFQYBL2pikwatZcOdCgFU3N1iqOMz2N6b
 5JjL7coihrYex6BUznOBaDp0tkDKsMYq27u8dthO59/EGqIszvk354sLRjes71ppwxZURth7E
 xvqTCOWH4qocGaf8fKAFca2MqNwX1GqspNLo17B69EadNPPchtHM3sFKWF3TVY0lnLzNxgbuX
 mV7CUexRFhIy0dZ+4aXpP0fWG9MFTaaA1JWVPILVFUnrfuVGa0uO8rkB4jsk5GJsFkWkB8mnP
 e9SsFqATVls8fxea5rIECyg+d7UlKMoFCgbLr1Bjv7njFvnBMGoceMCyh0uMngo3ykNjvSbVL
 i/FF6QswvAxKB2voUkNkld00e083DO8rIJN/OoUbvjhG6Iy8O5c+Fa3lnHj7WaN8MKJy2jWA4
 h3oNyxO57NzAXuHqFJLzy+0XjRSjomM2bYqhee0n1hYAeS6xomjVdzLewTTDf8wv+qIX996pW
 VjrYA+eOPEA9NMWh2PNbmLWe94UVh08nn9eFR1JMdMqy6Z0SRJxd7wWv3P8c2VFMZgAcYWdy8
 ark60f7saYIfvu2nhOmKER6AyoMLVCGXL9wsbl0M2+x0oyLqotbXFCiIxBXV/qtblQ+09G4Th
 /Xay1b2G/Wc+4hVrVy5WB37rGvxmWgCpp0PGdCpLlSG8beBWUNS0nB6AeNh2Xqti/WzbxAI7p
 EJgSvRWApeXRrYrn+
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

> I just found that clk is referenced by pclk in this function. When clk is freed,
> pclk will be allocated in gm20b_clk_new_speedo0(). Thus we should not release clk
> in this function and there is no bug here.

Can there be a need to release a clock object after a failed gk20a_clk_ctor() call?

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
