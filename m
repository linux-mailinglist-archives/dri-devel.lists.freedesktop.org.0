Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D01290C43F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9736810E5A0;
	Tue, 18 Jun 2024 07:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ZAaxwRlr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3171310E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718695349; x=1719300149; i=markus.elfring@web.de;
 bh=Bg3TIL3KzmjNs9lk8+SASEJZvZeUEBVqupiovsiTnss=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZAaxwRlrcDx0PCUvBtnXqrsiSNHNscYtnpXW3gtMAuUSGj7pQhStYq/XKutIVp56
 UaFzrLJLtCiY1/L81xaJ4vLb2HjBan605/HVBJBYM9pg6nSlIj3IxVmPOLj0ewt1r
 a8XLes3LhC9PEuCL+Fo4OKaN0q6+9jIIqhuiJw7XG70oVWcxB/cDGEk74bjQaHLnw
 gN0gS1F71wo6DWYzC9OrL7H5+IewSLK8mc338mARjN91R3JXgQqpkUqHgKjgN/8Fz
 rpGu+drIIOhV2cNX7JjNgi9tLPmUVTleoQmaUFKVJosUhyHWq7/4icxlisnYRJZA3
 9ccHftpWfRUSzN8f2A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mtgyp-1ser2g39mZ-010pwq; Tue, 18
 Jun 2024 09:22:29 +0200
Message-ID: <ad8716ac-cff3-4fe5-86e1-f5f188e8b6b1@web.de>
Date: Tue, 18 Jun 2024 09:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Stultz <jstultz@google.com>, "T. J. Mercier" <tjmercier@google.com>, 
 Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Brian Starkey
 <Brian.Starkey@arm.com>, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Fritz_K=C3=B6nig?=
 <frkoenig@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Simon Horman <horms@kernel.org>,
 Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20240516122102.16379-7-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v6 06/24] dma-heap: Add proper kref handling on dma-buf
 heaps
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240516122102.16379-7-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/+1vL2hF7w7/U6j+yJ4izBj1AbDZAVu4X1KpoJgdg2qMKCHU9BN
 Ifzm7y0IJZmLWnGCgmLUXzMukVIIELPS2EhhatKYzu6tegs4kxeySDupbDGTrWDASOQJbOg
 w9mOFs8Z1DfRanYvPSUkCR/gV8N0LYIh/MMX5DaY5G2apsoDTwnw29KpsyxShh4kisbe83Z
 9Cw/fKtyKjptSRJf//RyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U8P0/GzVv8g=;JqrQtoY7YisOf6G5dLTpAxpmI8u
 UFlogheq71vxQwctu+U17hGJGx1e0HgWjuqEj2EXCNpHlvCP8TBGwWMaQoHnE1mMJqYTmm7RO
 Hhc94KlC1DelubZ5B+fXFdo+h/FkZpOUrd69UF8y2tCbPaV+zInRsxLq1UqQ358gU/EAHdehr
 TjsysmHaHnK00+gSR7hSY5BYGSrzuZBrX6viwHhtKSUHGi4+L0l6Aozpec8jLoGYUcbkQeMm9
 uhzGvk1yY8Av24P33qsqMjQwn01CAyTWSxyiuGuzMF4GtF38lOU8xjEug2UvzTDMRZNyVLhUT
 U+I0ydY/tuZRz8NpxgoWlaNzkUw5uJSTFxzO5oxtKD78/hfpLtUBzE0qKH6hhYMYnZquucjI1
 ghhamIqV+LBcwq2feNe1NOyfGfFX7aR8vS1H4jgAX09nYH2XXYg7tYqNsHmvZK2C86GhtVuKS
 w1mocZ4vHdgG1L0fQxKce3KZ4p9Br4Ebys5u5+zT6y/bPJ2dzke/SE8f9vlhyBYJalm0Qhjk4
 DXLfQt7zZFbLrK7DcoFO6CQ4X/ohCwOndeGEORneIy6/n8HBP+elbGyy7Y25+SoHccXmgbcuc
 b3FNLH4GZWv9XmhHn1HiUwWAShJla3r/9Lawn065g0aNjsLCShH8yU3EPUM1aFIwHz4OrDOWa
 I09c9SFF/tEcnNinSpKIT73FSejNr4NxRapyYFCYkYODb6rW62DeXWoR79XEvl9Q2KQpqGpLG
 iMikMNBnwC3zVIuFmmy4OjMH0oyAP5JmcqLOy2OZxqFHk1S9JwKgbzYHNIFOgdGwd3+WDmEJc
 Qxb+EpsaK7s31isNgGSIQIiL2vfV4oPG+DtW8o2JotqH0=
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

> Add proper refcounting on the dma_heap structure.

             reference counting?


> While existing heaps are built-in, we may eventually
> have heaps loaded from modules, and we'll need to be
> able to properly handle the references to the heaps

You may occasionally put more than 52 characters into text lines
of such a change description.


=E2=80=A6
> +++ b/drivers/dma-buf/dma-heap.c
=E2=80=A6
> +static void dma_heap_release(struct kref *ref)
> +{
=E2=80=A6
> +	mutex_lock(&heap_list_lock);
> +	list_del(&heap->list);
> +	mutex_unlock(&heap_list_lock);
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&heap_list_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/mutex.h#L1=
96

Regards,
Markus
