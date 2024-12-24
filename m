Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E79FBB4C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 10:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE70810E0D5;
	Tue, 24 Dec 2024 09:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 459 seconds by postgrey-1.36 at gabe;
 Tue, 24 Dec 2024 09:36:12 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3720310E0D5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 09:36:12 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id B069D100DECA6;
 Tue, 24 Dec 2024 10:28:31 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 7E7CC35A1CC; Tue, 24 Dec 2024 10:28:31 +0100 (CET)
Date: Tue, 24 Dec 2024 10:28:31 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: simona.vetter@ffwll.ch, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z2p-v-xjhzhPso6u@wunner.de>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
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

On Tue, Dec 24, 2024 at 12:05:19PM +0530, Sumit Garg wrote:
> Restricted memory is a feature enforced by hardware specific firewalls
> where a particular TEE implementation governs which particular block
> of memory is accessible to a particular peripheral or a CPU running in
> a higher privileged mode than the Linux kernel.
[...]
> - Another possible use-case can be for the TEE implementation to store
> key material in a restricted buffer which is only accessible to the
> hardware crypto accelerator.

Just a heads-up:

For RSA sign/verify operations using rsassa-pkcs1 encoding,
the message to be signed/verified (which I understand could
be located in restricted memory) is prepended by a padding.

The crypto subsystem does the prepending of the padding in software.
The actual signature generation/verification (which is an RSA encrypt
or decrypt operation) may be performed in hardware by a crypto
accelerator.

Before commit 8552cb04e083 ("crypto: rsassa-pkcs1 - Copy source
data for SG list"), the kernel constructed a scatterlist
consisting of the padding on the one hand, and of the message
to be signed/verified on the other hand.  I believe this worked
for use cases where the message is located in restricted memory.

However since that commit, the kernel kmalloc's a new buffer and
copies the message to be signed/verified into it.  The argument
was that although the *kernel* may be able to access the data,
the crypto accelerator may *not* be able to do so.  In particular,
portions of the padding are located in the kernel's .rodata section
which is a valid virtual address on x86 but not on arm64 and
which may be inaccessible to a crypto accelerator.

However in the case of restricted memory, the situation is exactly
the opposite:  The kernel may *not* be able to access the data,
but the crypto accelerator can access it just fine.

I did raise a concern about this to the maintainer, but to no avail:
https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/

This is the alternative solution I would have preferred:
https://lore.kernel.org/r/3de5d373c86dcaa5abc36f501c1398c4fbf05f2f.1732865109.git.lukas@wunner.de/

> I am also in favour of end to end open source use-cases. But I fear
> without progressing in a step wise manner as with this proposal we
> would rather force developers to upstream all the software pieces in
> one go which will be kind of a chicken and egg situation. I am sure
> once this feature lands Mediatek folks will be interested to port
> their secure video playback patchset [3] on top of it. Similarly other
> silicon vendors like NXP, Qcom etc. will be motivated to do the same.

The crypto use case may be easier to bring up than the video decoding
use case because you don't need to implement a huge amount of
user space code.

Thanks,

Lukas
