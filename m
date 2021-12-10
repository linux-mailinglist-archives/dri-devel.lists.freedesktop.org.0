Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B94701FC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 14:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D044089F99;
	Fri, 10 Dec 2021 13:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 555 seconds by postgrey-1.36 at gabe;
 Fri, 10 Dec 2021 13:04:31 UTC
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D9710E725
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 13:04:31 +0000 (UTC)
Date: Fri, 10 Dec 2021 20:54:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1639140912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzxqsTgGJOyZ40XRab11234nAk9h8VZSbl6iUK3fRT4=;
 b=S8zk/nGvHzSFSxJv//mDbTN7KWkIMz/ZgSm+Q34vw3kWfKLE4GQqy2XFppxiUhyBlDOJVx
 hXKUQo1AkfuDjrsUW73AezwF++o76hHsE4dsdwJCSHr8BZV3pa+R+Xkjti3WOLjIcBHKnt
 KaQDlDlODZVWYseVulf+shO9uq5MyqA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: Habanalabs, Ask for the linux firmware code which loads by
 coprocesseor
Message-ID: <20211210125443.GA21176@chq-T47>
References: <20211207071830.GA14915@chq-T47>
 <CAFCwf117oZaqMSSVUxqJDeJ1TmGzhXj0SZurfyK+dDV=0wYrYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf117oZaqMSSVUxqJDeJ1TmGzhXj0SZurfyK+dDV=0wYrYw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: cai.huoqing@linux.dev
X-Mailman-Approved-At: Fri, 10 Dec 2021 13:41:30 +0000
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
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09 12月 21 14:23:45, Oded Gabbay wrote:
> On Tue, Dec 7, 2021 at 9:19 AM Cai Huoqing <cai.huoqing@linux.dev> wrote:
> >
> > Hi Oded Gabbay and habanalabs folks.
> >
> > I'm insterested in this kind of AI acceralator.
> >
> > After scanning the driver code.
> > It seems that there are a linux firmware which is loaded by
> > coprocessor(an slave cpu ?).
> > shows in the code.
> >
> > ./goya/goya.c:74:#define GOYA_LINUX_FW_FILE     "habanalabs/goya/goya-fit.itb"
> > ./goya/goya.c:2436:     return hl_fw_load_fw_to_device(hdev, GOYA_LINUX_FW_FILE, dst, 0, 0);
> > ./goya/goya.c:2507:     fw_loader->linux_img.image_name = GOYA_LINUX_FW_FILE;
> > ./gaudi/gaudi.c:63:#define GAUDI_LINUX_FW_FILE  "habanalabs/gaudi/gaudi-fit.itb"
> > ./gaudi/gaudi.c:3945:   return hl_fw_load_fw_to_device(hdev, GAUDI_LINUX_FW_FILE, dst, 0, 0);
> > ./gaudi/gaudi.c:4011:   fw_loader->linux_img.image_name = GAUDI_LINUX_FW_FILE;
> >
> > And the host driver(/driver/misc/habanalabs) communicate with the slave firmware
> > by MMIO or share memory, right?
> >
> > If that, would you mind provide the source code of linux firmware
> > to avoid the confusion from code reading.
> Hi Cai,
> 
> You can download the source code from:
> https://vault.habana.ai/artifactory/misc/hl-linux.bz2
Thanks, that's what I need, pretty nice code!
And I will be glad to see you taking it into the linux mailine soon.

Thanks,
Cai
> 
> >
> > BTW, where can I find the register description datasheet
> We don't supply this information.
> Thanks,
> Oded
