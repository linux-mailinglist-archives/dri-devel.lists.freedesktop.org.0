Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF757FF45
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 14:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB61AD483;
	Mon, 25 Jul 2022 12:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57608AD483
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 12:48:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CFDABB80DCD;
 Mon, 25 Jul 2022 12:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19D0C341C8;
 Mon, 25 Jul 2022 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658753299;
 bh=qAnVSX5x86qMP5IdsAOZd+epe/BYqA3hZHfOWKWVjGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hUDe4HDOY+CFXvceyY8SSSnKqJV1vBz7byKDOeHSySHrhz4N4E2MrZRLXPh5G/Fdt
 tRgFYl4Os306khdCifK9zq/ZHJRlmp2odPzPgyBDFP/DCfA2XTezYjh7fEwgzhPpfF
 d49s/awbT9tghBDe3t8SRnTu/jIZnNAJoAZXs8Bk=
Date: Mon, 25 Jul 2022 14:48:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH v2 3/5] soc: visconti: Add Toshiba Visconti DNN image
 processing accelerator
Message-ID: <Yt6RD2atLwkDrrsu@kroah.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <20220722082858.17880-4-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722082858.17880-4-yuji2.ishikawa@toshiba.co.jp>
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
Cc: linaro-mm-sig@lists.linaro.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 05:28:56PM +0900, Yuji Ishikawa wrote:
> Add support to DNN image processing accelerator on Toshiba Visconti ARM SoCs.
> The accelerator is applicable to DNN inference tasks.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
> v1 -> v2:
>   - applied checkpatch.pl --strict
>   - removed unused code
> ---
>  drivers/soc/visconti/Kconfig           |   6 +
>  drivers/soc/visconti/Makefile          |   2 +
>  drivers/soc/visconti/dnn/Makefile      |   6 +
>  drivers/soc/visconti/dnn/dnn.c         | 523 +++++++++++++++++++++++++
>  drivers/soc/visconti/dnn/hwd_dnn.c     | 183 +++++++++
>  drivers/soc/visconti/dnn/hwd_dnn.h     |  68 ++++
>  drivers/soc/visconti/dnn/hwd_dnn_reg.h | 228 +++++++++++
>  drivers/soc/visconti/uapi/dnn.h        |  77 ++++
>  8 files changed, 1093 insertions(+)
>  create mode 100644 drivers/soc/visconti/dnn/Makefile
>  create mode 100644 drivers/soc/visconti/dnn/dnn.c
>  create mode 100644 drivers/soc/visconti/dnn/hwd_dnn.c
>  create mode 100644 drivers/soc/visconti/dnn/hwd_dnn.h
>  create mode 100644 drivers/soc/visconti/dnn/hwd_dnn_reg.h
>  create mode 100644 drivers/soc/visconti/uapi/dnn.h
> 
> diff --git a/drivers/soc/visconti/Kconfig b/drivers/soc/visconti/Kconfig
> index 8b1378917..a25287d0c 100644
> --- a/drivers/soc/visconti/Kconfig
> +++ b/drivers/soc/visconti/Kconfig
> @@ -1 +1,7 @@
> +if ARCH_VISCONTI
> +
> +config VISCONTI_DNN
> +    bool "Visconti DNN driver"
> +

We can't take Kconfig options with no help text at all, please provide
the needed information here.

And why can't this be a module?

