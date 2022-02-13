Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B28DC4B3D1B
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 20:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB0210E14F;
	Sun, 13 Feb 2022 19:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A0B10E14F
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 19:25:38 +0000 (UTC)
Date: Sun, 13 Feb 2022 19:25:26 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 01/12] iio: buffer-dma: Get rid of outgoing queue
To: Jonathan Cameron <jic23@kernel.org>
Message-Id: <EMC97R.6CF1131XF9J13@crapouillou.net>
In-Reply-To: <20220213185740.0322a83d@jic23-huawei>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-2-paul@crapouillou.net>
 <20220213185740.0322a83d@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Le dim., f=E9vr. 13 2022 at 18:57:40 +0000, Jonathan Cameron=20
<jic23@kernel.org> a =E9crit :
> On Mon,  7 Feb 2022 12:59:22 +0000
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  The buffer-dma code was using two queues, incoming and outgoing, to
>>  manage the state of the blocks in use.
>>=20
>>  While this totally works, it adds some complexity to the code,
>>  especially since the code only manages 2 blocks. It is much easier=20
>> to
>>  just check each block's state manually, and keep a counter for the=20
>> next
>>  block to dequeue.
>>=20
>>  Since the new DMABUF based API wouldn't use the outgoing queue=20
>> anyway,
>>  getting rid of it now makes the upcoming changes simpler.
>>=20
>>  With this change, the IIO_BLOCK_STATE_DEQUEUED is now useless, and=20
>> can
>>  be removed.
>>=20
>>  v2: - Only remove the outgoing queue, and keep the incoming queue,=20
>> as we
>>        want the buffer to start streaming data as soon as it is=20
>> enabled.
>>      - Remove IIO_BLOCK_STATE_DEQUEUED, since it is now functionally=20
>> the
>>        same as IIO_BLOCK_STATE_DONE.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>=20
> Trivial process thing but change log should be here, not above as we=20
> don't
> want it to end up in the main git log.

I'm kinda used to do this now, it's the policy for sending patches to=20
the DRM tree. I like it because "git notes" disappear after rebases and=20
it's a pain. At least like this I don't lose the changelog.

But okay, I'll change it for v3, if there's a v3.

Cheers,
-Paul

>>   drivers/iio/buffer/industrialio-buffer-dma.c | 44=20
>> ++++++++++----------
>>   include/linux/iio/buffer-dma.h               |  7 ++--
>>   2 files changed, 26 insertions(+), 25 deletions(-)
>>=20


