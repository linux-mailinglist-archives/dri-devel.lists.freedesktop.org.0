Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CEB5E9415
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 17:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F72010E1E1;
	Sun, 25 Sep 2022 15:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F256510E1E1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664120848;
 bh=0hkhVjvY/ygZUbAaEfpX1kwcs+jyZLR1+/SmlkcaXAM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RTJHml5ugJvCJxqeD61QsegCaYnvu2LPCHM3BvmLwFIWy2z29+1u2gKUB6rK4t/j1
 EJKxUd4KTTVM4OXWsOQOcRdAOjQoZyIL77DGwWPYrQUJ8QBfIoaBaeBvA07+a23wt6
 rlcfUUJ6KyXUCSaWyjEy3FnOplybPL0Mes/3Mbbw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2O6Y-1ogKPG0Rm2-003sul; Sun, 25
 Sep 2022 17:47:28 +0200
Message-ID: <37915429-7b4d-6e64-8ef7-a28bf8015fd5@gmx.de>
Date: Sun, 25 Sep 2022 17:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3] video: fbdev: smscufx: Fix use-after-free in
 ufx_ops_open()
Content-Language: en-US
To: Hyunwoo Kim <imv4bel@gmail.com>, steve.glendinning@shawell.net
References: <20220925133243.GA383897@ubuntu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220925133243.GA383897@ubuntu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JOrA8gw47agTlXhRZBKS15wNguuEPi83J/XtrK841D6fkqjKHiP
 drFONPGRt13+Yio/Sj9d7lMGu1sdVCJlmNWruESoLoK7TqU4b4twEF/jkxPtz6WOjSYzlLm
 3f/TccRlTxV3TiZ++MI8Pv2aHpyOMP50rYwft4Gg5iRs3onxe7nED+yz/uwsxORN/6lhxBG
 MtQNZt6vP7XyTIIfQsp4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:02U4KP+3IWs=:QXlh9eICwJQxLAqYIdOkfN
 9HNMY9c0jONgByg7LEmu21p6kbqbF/7kQPaP1GvEJFhdsNGi5GoQu3UeTtWW9LN1PZ5wcBiMO
 B6+ACAOlffqeA+yyMk5TMU7K9XzMyIN6KhpivfVXeYfcBJsLaJ1whcM2OZJoS5QM0EMoVVmyq
 AF9dP+H3+ssSF28hQbySsIWT6VhiPZE64zony48o1gjOq0VKoYJ7gX5Fiq1dN01NNzuSffiZ9
 k4Tkib5w2w9c5DJ4ZSGSyr8VHcRid2rs8wDoF+8eMh2oex4JbfJIoBRlaLIeUv/mB6kfNx1UV
 XrJOIc1ua2FqybjA4WL2LPdlFANf4FOUeXQ7roHt9Vd/xFMdg5SH2AMMQiGlQEB8ohMz+6zGU
 nBxYuxg6sAUrVMEKYSgIiT5KuY9L7pNRZE6mxXN/od+HaPMb7R7TOIwo/WJGeyuZZeZlkG9Sw
 MxhNFSEJ5m1NrFjbobm8w31uZSr+Ne3Vk5XdJVeJI9eMiV7Sx74JN0x1PoKdKp1iJ38Dp9aRX
 hRHSKDVgpDw4+UyFdnk0ojkBW7nMqHT3aM31LbdH042i9wSvRu2WeHLjjBjYTB5UmovMbpdn0
 dJxU8yAG02iya5Hr8Gj8lTJqwIXYMdNqtbyvTs7E8iHkvtGThxERhOepALshC3+o0LN9UxVwn
 1oppx3QtQMmzzqgJ7bwSfFwbbhP28eWCY7sZFOilXCoOcU1IRZRTW1zA7sY7Fu9GRvrh61Gv2
 8AAg47xS+KRG5n1fbgyUffinVNTq5k4o3IdUWgqOyjcmJ17zLAkpSZCdT9V+mPIwcp3oKcrd4
 NNIGvNIrpPoiWMQ8p+kNkbsaTIZMVZo4GyIDYXYjGDzTKBUGPNciF4G4T2Kfs6P75q+X2tQX9
 cekbQxVpwcK5kJm48FFrUME9sXBIzPlsMCNQjPkr/HzKbba+2vdrFP2MHJsN+09tWk5TfVbqJ
 197JTPVZFioiv7ybAtaZY4svmROYMVBTpvk/b3fI5xit9RptbG5AV1ZRImGoPlHiotAtXA8Om
 k9JATfgNGA4DAq2LFo+rIGaBKR5I9P8I6eqjhKkVG5SDbmOaW6m4AwFCAT4XZyCwBRyhAVyj9
 1jMNOgK1SJAt9VQ7L7j9EC+Aet2FOCPPuca5lf+tWG/aHZk+Efx4si9550DS+NKM/jUAAXZBG
 HSdgnoDCSE+2zxpIjA4LZ2I2O2
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/25/22 15:32, Hyunwoo Kim wrote:
> A race condition may occur if the user physically removes the
> USB device while calling open() for this device node.
>
> This is a race condition between the ufx_ops_open() function and
> the ufx_usb_disconnect() function, which may eventually result in UAF.
>
> So, add a mutex to the ufx_ops_open() and ufx_usb_disconnect() functions
> to avoid race contidion of krefs.
>
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>

applied.

Thanks!
Helge
