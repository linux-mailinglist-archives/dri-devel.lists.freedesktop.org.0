Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431C6583A94
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 10:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9292D90488;
	Thu, 28 Jul 2022 08:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E6E2BE29
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 08:47:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 918FF61BEF;
 Thu, 28 Jul 2022 08:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704E4C433C1;
 Thu, 28 Jul 2022 08:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658998034;
 bh=jCsd0BYUuxQPFCGggo3LU7ymg+rWOZhe5SyLYMPuEII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sjSBJyeyjGNBExkzleVUKJJqVo66l495ZESo768hjKGH9VbAxM6Xm3sasdnFBW2Sb
 n3T6EG5M6iwOWhTqD4FIMdgI1abQhslYZZrH59lsDPb7bfQpgL+eW7A0GjxTDOJXRo
 eje3Y0dy/nhLNejdZ4DX/YsEcnRmQUHHxcDY4BwI=
Date: Thu, 28 Jul 2022 10:47:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH v2 0/5] Add Toshiba Visconti DNN image processing
 accelerator driver
Message-ID: <YuJNDxglPxqa3hnf@kroah.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <Yt6Qw/r0FQ0ElYdn@kroah.com>
 <TYAPR01MB62010C6B98C1C197E7E894AF92949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYAPR01MB62010C6B98C1C197E7E894AF92949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
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
Cc: linaro-mm-sig@lists.linaro.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, hverkuil@xs4all.nl, robh+dt@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 26, 2022 at 06:09:50AM +0000, yuji2.ishikawa@toshiba.co.jp wrote:
> Hi Greg
> 
> Thank you for your comments.
> 
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Monday, July 25, 2022 9:47 PM
> > To: ishikawa yuji(石川 悠司 ○ＲＤＣ□ＡＩＴＣ○ＥＡ開)
> > <yuji2.ishikawa@toshiba.co.jp>
> > Cc: Rob Herring <robh+dt@kernel.org>; Hans Verkuil <hverkuil@xs4all.nl>;
> > iwamatsu nobuhiro(岩松 信洋 □ＳＷＣ◯ＡＣＴ)
> > <nobuhiro1.iwamatsu@toshiba.co.jp>; Jonathan Corbet <corbet@lwn.net>;
> > Sumit Semwal <sumit.semwal@linaro.org>; Christian König
> > <christian.koenig@amd.com>; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-media@vger.kernel.org;
> > dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org
> > Subject: Re: [PATCH v2 0/5] Add Toshiba Visconti DNN image processing
> > accelerator driver
> > 
> > On Fri, Jul 22, 2022 at 05:28:53PM +0900, Yuji Ishikawa wrote:
> > > This series is the DNN image processing accelerator driver for Toshiba's ARM
> > SoC, Visconti[0].
> > > This provides DT binding documentation, device driver, MAINTAINER files
> > and documents.
> > >
> > > Best regards,
> > > Yuji
> > >
> > > [0]:
> > >
> > https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-
> > > recognition-processors-visconti.html
> > >
> > > dt-bindings: soc: visconti: Add Toshiba Visconti DNN image processing
> > accelerator bindings
> > >   v1 -> v2:
> > >     - No update
> > >
> > > soc: visconti: Add Toshiba Visconti image processing accelerator common
> > source
> > >   v1 -> v2:
> > >     - checked with checkpatch.pl --strict
> > >
> > > soc: visconti: Add Toshiba Visconti DNN image processing accelerator
> > >   v1 -> v2:
> > >     - checked with checkpatch.pl --strict
> > >     - removed unused code
> > >
> > > MAINTAINERS: Add entries for Toshiba Visconti DNN image processing
> > >   v1 -> v2:
> > >     - No update
> > >
> > > Documentation: driver-api: visconti: add a description of DNN driver.
> > >   v1 -> v2:
> > >     - newly added documents
> > >
> > > Yuji Ishikawa (5):
> > >   dt-bindings: soc: visconti: Add Toshiba Visconti DNN image processing
> > >     accelerator bindings
> > >   soc: visconti: Add Toshiba Visconti image processing accelerator
> > >     common source
> > >   soc: visconti: Add Toshiba Visconti DNN image processing accelerator
> > >   MAINTAINERS: Add entries for Toshiba Visconti DNN image processing
> > >     accelerator
> > >   Documentation: driver-api: visconti: add a description of DNN driver.
> > >
> > >  .../soc/visconti/toshiba,visconti-dnn.yaml    |  54 ++
> > >  Documentation/driver-api/visconti/common.rst  | 115 ++++
> > >  Documentation/driver-api/visconti/dnn.rst     | 394 +++++++++++++
> > >  MAINTAINERS                                   |   2 +
> > >  drivers/soc/Kconfig                           |   1 +
> > >  drivers/soc/Makefile                          |   1 +
> > >  drivers/soc/visconti/Kconfig                  |   7 +
> > >  drivers/soc/visconti/Makefile                 |   8 +
> > >  drivers/soc/visconti/dnn/Makefile             |   6 +
> > >  drivers/soc/visconti/dnn/dnn.c                | 523
> > ++++++++++++++++++
> > >  drivers/soc/visconti/dnn/hwd_dnn.c            | 183 ++++++
> > >  drivers/soc/visconti/dnn/hwd_dnn.h            |  68 +++
> > >  drivers/soc/visconti/dnn/hwd_dnn_reg.h        | 228 ++++++++
> > >  drivers/soc/visconti/ipa_common.c             |  55 ++
> > >  drivers/soc/visconti/ipa_common.h             |  18 +
> > >  drivers/soc/visconti/uapi/dnn.h               |  77 +++
> > >  drivers/soc/visconti/uapi/ipa.h               |  90 +++
> > 
> > Why is this in drivers/soc/?
> 
> Actually, I'm not sure where his module should live in.
> The directory drivers/soc were chosen just because the driver is specific to Visconti SoC.
> Is it better to move the driver to another directory such as drivers/misc ?

Yes please start out in drivers/misc/ unless we find a better place for
it.

thanks,

greg k-h
