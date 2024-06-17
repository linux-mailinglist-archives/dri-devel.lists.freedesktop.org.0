Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0818990A62C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 08:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AA58930B;
	Mon, 17 Jun 2024 06:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="GCj5plbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855798930B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718607423; x=1719212223; i=markus.elfring@web.de;
 bh=xYrgvg9WCy9r9u5H7qn2mdlOD8NoWnHTZFUH9pAD1xQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GCj5plbZrqt60p1OqOM56a4JCCTVsMe2MCHDuSnFcWd8H3SKEjRtvgUhpHPlFxr0
 AfNvgrBsAVU5VugDCyQjEqz/GpSYKBrvvNYHzyjM8/XCVMK60t6ckdPrCVZEx4SiP
 hID6uSohRtcOm6Iq4vpjEAWDBU7x4Jdr+X0AUchPul/0qrQy3o3ow1lhfeewTJHw1
 rdHz6GzEZexLUUEiQVYIqbaJqH+27pgbYSUCtFdX6jlPtdc2h1sUL1znF+GVfwCa4
 I8wvZiQLbnL/b3xoFHxRHDuPApPDbYO3891wggaB+v0sy78zV1jbgSSlrTfqgxXHq
 oVH5Nnt339gSg7nUoQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MEUS0-1sBxPZ0DKk-000iy7; Mon, 17
 Jun 2024 08:57:03 +0200
Message-ID: <6a41fd88-5496-462a-86d2-446c2990fcf7@web.de>
Date: Mon, 17 Jun 2024 08:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Paul Cercueil <paul@crapouillou.net>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, linux-iio@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
References: <20240605110845.86740-4-paul@crapouillou.net>
Subject: Re: [PATCH v10 3/6] iio: core: Add new DMABUF interface infrastructure
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240605110845.86740-4-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mUazHyeVCXYVnz6oK+LWMeQZXEK3hfSQQEB660iCeLwFYnqkjQ+
 Ud585WwQdmOnvKsazfb+JBL625SKwogz20mU04M7cTelcw3J6jvrcay8aCvzIgt5Zo/u0tG
 HA8BNYiVjjRu1Y+4OsPoPx6KQH/SZ/sPPYoYD8KqvEsuerJYNwyB4WIq2T3jsfm4PgHe3GT
 6DwW9Rzy0tHqw4LOWDrPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EpUgWLDuQOE=;TpqYd2BsYAhSrklupWm0bdGxi0w
 k0gP4myeMywXz7z2416cAKfPZc+sozlXCm/dg03s156BdOSpNvAWLhscEVizpeQGJ02tGKcs+
 gPpHtLG9/4DSygIbsZCwwGVPv2tYnhthrp5KD5bNINXFLg8ymCfDhgNDu1QiKmG0LiXN/kYTC
 tyZia5fF2hlrZlk+Mp8kxXJgv9UgtBL/FmNNSPm6N7jOTR4Zcdgt0cJXiJEJ5aNLFfHYF1TED
 sqA3TpJuSMnBqp6+Y27A4GFBqiMckBrfdUi+aB1w9Jo9aVv0/5sHHtuWD7Mufed2c3xZm8bFi
 6P/eXkYxEGfvYjuTun684PUf8EPFV0MxlSafXkax97B0gf7RMsDhoZ/57lr/LEPbYd5/MMGpo
 2FZcmWJJfumMFT/IEiEfiR4teoq7q4oHTPBre96PjFDkipfK0DXEysOlrBb+tFcfYbjIwlF3T
 6Y3XM6LdKz4qEO97XcWy/wPj8GbkMKxKFI1QJs0PRE79Kk587L8rJgWiHZKCZ80uvRyCzXJCI
 /t6zPRNRF6ePoZIKc/44UiTxO/fQ1zMmlaRzVy56MQ8x2G3ANq75aaCd9qVNk4v0wRaTB5Lu0
 uA43DJQ1ptxtQhryfZiI0B3NSnmo4fO95dmi7e1GlRXJk1Udd4JIcfjaeXw6fLTmobKBJAeQe
 s3a1aiZESl6a5AD2Kc1QybZRvr4ec/TYMtpTSxix+F+QAvs4PwefO+Ljy+3Y6lEH5cgLdmGuZ
 6xuPuGo9iZgV77V+kDtZMkQ+soB22ssbAGAuVuIsUgYD7b72EPWZkPvIfjmmh3OCCEewBvW+R
 CzKOponlPubLU84J17FFUB0n3ggAX9n0xY2QTca53XWm4=
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

=E2=80=A6
> +++ b/drivers/iio/industrialio-buffer.c
=E2=80=A6
>  static int iio_buffer_chrdev_release(struct inode *inode, struct file *=
filep)
>  {
=E2=80=A6
>  	wake_up(&buffer->pollq);
>
> +	mutex_lock(&buffer->dmabufs_mutex);
> +
> +	/* Close all attached DMABUFs */
=E2=80=A6
> +	mutex_unlock(&buffer->dmabufs_mutex);
> +
>  	kfree(ib);
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&buffer->dmabufs_mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L1=
96

Regards,
Markus
