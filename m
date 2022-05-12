Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C6524B30
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 13:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4781B10E60E;
	Thu, 12 May 2022 11:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7443910E60E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 11:14:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C94ED61E4A;
 Thu, 12 May 2022 11:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27528C385B8;
 Thu, 12 May 2022 11:14:36 +0000 (UTC)
Message-ID: <b5e35985-c159-6b11-8752-d6dd29fc6a64@xs4all.nl>
Date: Thu, 12 May 2022 13:14:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/4] Add Toshiba Visconti DNN image processing accelerator
 driver
Content-Language: en-US
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yuji,

On 4/28/22 15:11, Yuji Ishikawa wrote:
> This series is the DNN image processing accelerator driver for Toshiba's ARM SoC, Visconti[0].
> This provides DT binding documentation, device driver, MAINTAINER files.
> 
> The second patch "soc: visconti: Add Toshiba Visconti image processing accelerator common source"
> and the fourth patch "MAINTAINERS: ..." are the same as the ones in the preceding post for affine driver.

There appears to be no documentation whatsoever, unless I am missing something.

How is the uAPI supposed to be used? What does it do? What formats does it accept
or produce?

If this processes images, then (as Laurent mentioned) this is more suitable as a
V4L2 mem2mem driver.

See https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-mem2mem.html
and the many drivers in drivers/media that use it (git grep v4l2-mem2mem.h).

But without any explanation whatsoever I have no idea what does or does not make sense.

Regards,

	Hans

> 
> Best regards,
> Yuji
> 
> [0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html
> 
> Yuji Ishikawa (4):
>   dt-bindings: soc: visconti: Add Toshiba Visconti DNN image processing
>     accelerator bindings
>   soc: visconti: Add Toshiba Visconti image processing accelerator
>     common source
>   soc: visconti: Add Toshiba Visconti DNN image processing accelerator
>   MAINTAINERS: Add entries for Toshiba Visconti DNN image processing
>     accelerator
> 
>  .../soc/visconti/toshiba,visconti-dnn.yaml    |  54 ++
>  MAINTAINERS                                   |   2 +
>  drivers/soc/Kconfig                           |   1 +
>  drivers/soc/Makefile                          |   1 +
>  drivers/soc/visconti/Kconfig                  |   7 +
>  drivers/soc/visconti/Makefile                 |   8 +
>  drivers/soc/visconti/dnn/Makefile             |   6 +
>  drivers/soc/visconti/dnn/dnn.c                | 533 ++++++++++++++++++
>  drivers/soc/visconti/dnn/hwd_dnn.c            | 183 ++++++
>  drivers/soc/visconti/dnn/hwd_dnn.h            |  68 +++
>  drivers/soc/visconti/dnn/hwd_dnn_reg.h        | 228 ++++++++
>  drivers/soc/visconti/ipa_common.c             |  55 ++
>  drivers/soc/visconti/ipa_common.h             |  18 +
>  drivers/soc/visconti/uapi/dnn.h               |  77 +++
>  drivers/soc/visconti/uapi/ipa.h               |  88 +++
>  15 files changed, 1329 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-dnn.yaml
>  create mode 100644 drivers/soc/visconti/Kconfig
>  create mode 100644 drivers/soc/visconti/Makefile
>  create mode 100644 drivers/soc/visconti/dnn/Makefile
>  create mode 100644 drivers/soc/visconti/dnn/dnn.c
>  create mode 100644 drivers/soc/visconti/dnn/hwd_dnn.c
>  create mode 100644 drivers/soc/visconti/dnn/hwd_dnn.h
>  create mode 100644 drivers/soc/visconti/dnn/hwd_dnn_reg.h
>  create mode 100644 drivers/soc/visconti/ipa_common.c
>  create mode 100644 drivers/soc/visconti/ipa_common.h
>  create mode 100644 drivers/soc/visconti/uapi/dnn.h
>  create mode 100644 drivers/soc/visconti/uapi/ipa.h
> 

