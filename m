Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07418AA2C7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 21:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD26B113F49;
	Thu, 18 Apr 2024 19:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="BS29PgEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781F5113F48
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 19:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713468599; x=1714073399; i=deller@gmx.de;
 bh=+qPebcqkijmpejiAsFg4+LeCVvQ99DkwFSGw6uBdRfk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BS29PgEdovGlE236FFXT5vd7JeaTXskt4NDDEyqAKpYn3LnoePUl5QRxbHMICscY
 vTuAroUzIV3dhcFa3U+YDE+lDC1W4Y3+opzrkgKEVTW6WC5Rv6X/CkfSUG0jAWEpQ
 uHqTD844qI1Ok7yfu9xyL1eXEYOWeZvp+DEBzma0GdHjFHwboRyTiZXEO9Yc8ydix
 J+ngsmrbQ6xLh0E2zbMcqqMxye+7mxHUC0Hzlyj4lhmancm9iEJi7HFiMWPEIhlqN
 hlSnIJj1fEzA5j1IZFHNw7vb0Ger4XEAwHAxY7P4UFLaoRiRls8iE1RLQjCeCi1dM
 VeZi1/lBO6+ymhUA3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([89.244.184.44]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeI8-1s7KZ12P0G-00RX3z; Thu, 18
 Apr 2024 21:29:59 +0200
Message-ID: <a7843657-c3f6-4d2e-8c36-5541d4c52956@gmx.de>
Date: Thu, 18 Apr 2024 21:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
To: Takashi Iwai <tiwai@suse.de>, Nam Cao <namcao@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bigeasy@linutronix.de,
 patrik.r.jakobsson@gmail.com, LKML <linux-kernel@vger.kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <20240418160652.68df1a86@namcao> <87ttjywxv5.wl-tiwai@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <87ttjywxv5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HwANtY5pHX9qYll2jJJf4uOJIN+l61iXICErTSTzPZFd3Vw2k/u
 N1hnYThu6D0Km2BQUPRL5mUUfHMNfwVEgAbF1CZIeHZFIg8ncO4e3JTKGyHcwTroK23ibQA
 rE7IhaMGYIUrgTnljq/YB/bdaXefSM3CvV7JPwYb7uvdWmPSRsVYQ+qaoReJ5m5G5RW9Ghf
 /s2NNjCj0JSmKT7LjGvuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jG/myljbTF4=;XPgAA4qo5ZIYpJtOlwbLSQBsokR
 6qH4ow+QPVJ+ryv/KBeGIP0ttNGiSC8lizgwQxwCRRct7do+0/oiRTFX+1onIOtT8z4QBIl07
 UgzY9stE243qLk2UXNHvnNX2CLA8N+rztXofZoekxibMOZyfxrsx8wQ/uSohxV2Jg7+zRocA1
 35flv2MaiKB9dBe4VS7Fscg0S9I3rEjfcikxNJ6orik0v+AjNmf8i1yT48ljDCb3pjL9usdES
 56B4Cx7Az16c4AjkxdW14F/fTKX9SQAWCogHGks9/F3tbNVlZ8eic1oEvzMXsHtBylmjkYGpB
 IQ7mk7/2n9dg/IrxExBMT6bBWcW6bxDW+lePowFjUO3RwxbVOWoQrIj8S53IKoemvuaI/baBn
 GTdVBp36Ut6+K/X9KXiw3a5lfrnzBG9a1pOFh0Muy/apVFZjdqx5RVDubXDH8k1K2W5HgUmmt
 PY6lEN+9nJ77iD2Myi7uPM98nzpTgYOmsFYTXLGT6faFnh/h6sgzYY+kmppE+kKEqk+tESiXM
 YyG48Hq7Gx8WfKiZVQ6j8MD61U2qdOwiU9ELeIX/ipatw9+NzlGhYxcn7KGmZdv+KpfWW1qCW
 hmqTQnaxuWOKyfsz8CbAWryRK0R4TAfCqe/0XAeU6VsrElkEf3g2aO8hI3zoC0YoDJDbGdqmU
 j4Xttq98kVKPZYNYkXa9m/LT+QPumgaebWxv/qe1NBQSbE6BcwrSJO/j1dfZ1f6oEj4K990tN
 Z/AjgoygKtKeeEFX/jWv2miNB/2yGa08gF7EUjKJbqTFpqZIZc0CEUtAfCoBahUjuvxJunEtc
 08RK2hk3ZyTqpITWf8ciiSZaCO6iCoaQuX4pP4n45UAic=
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

On 4/18/24 16:26, Takashi Iwai wrote:
> On Thu, 18 Apr 2024 16:06:52 +0200,
> Nam Cao wrote:
>>
>> On 2024-04-18 Harshit Mogalapalli wrote:
>>> While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: task hu=
ng
>>> bug in fb_deferred_io_work()
>>
>> Which framebuffer device are you using exactly? It is possible that
>> the problem is with the device driver, not core framebuffer.
>
> Note that it was already known that using flush_delayed_work() caused
> a problem.  See the thread of the fix patch:
>    https://lore.kernel.org/all/20230129082856.22113-1-tiwai@suse.de/

Harshit reported the hung tasks with kernel v5.15-stable, and can even rep=
roduce
that issue with kernel v6.9-rc4 although it has all of your patches from
that referenced mail thread applied.
So, what does your statement that "it was already known that it causes pro=
blems" exactly mean?
Can it be fixed? Is someone looking into fixing it?

> BTW, the problem is seen with bochs drm.

Helge
