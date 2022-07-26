Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4903858184A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07ADD95709;
	Tue, 26 Jul 2022 17:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2C8956DB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DRhy3XGBmLg1udTr5AzppCNHJ5niWdcLqIRyqjodBfk=;
 b=WjxRbfix1MCn3AHDG4/RtcQv+EzdA3eiL4shpZvwJACVJOLxrnswwthO+jIkI+i/f/QKYWt2avfWp
 xAICJ7IFqLQibFSzQtRYFmmich3+/SMFjDbJT2v4b9PfZETuQvZtyMiAhvQrxZAPDxgN3J9zey2u2Z
 PgiDe8o1Ltj4DCNiQV3cbCTVKmadjsm+VZ6snH7pgabukXe5xtoQ4Svx0wuDukyBZiEM130cuVhjjM
 HvePA3LpRGXJCVo8IE8dpOCsmtZ8Ao9rR+iCuuXBEW3m8ylBdqBO+SUcS0Gf9LKYMRnRpchYqnOrFa
 hPZAjE0svApuPEa48IntjxbLZfRZc0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DRhy3XGBmLg1udTr5AzppCNHJ5niWdcLqIRyqjodBfk=;
 b=p9eDkL0uW+povVlhVLWBkM7guKTDciPkoswB7Y1byvekhfRAg+6rQSPsjQtcNXu1k+RMRwpLmXdf4
 hlmJfCUAw==
X-HalOne-Cookie: 1ab96e00759eec4218229468b5eaeefe3b442357
X-HalOne-ID: a97ad866-0d07-11ed-a918-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a97ad866-0d07-11ed-a918-d0431ea8a290;
 Tue, 26 Jul 2022 17:23:28 +0000 (UTC)
Date: Tue, 26 Jul 2022 19:23:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Alisa Khabibrakhmanova <khabibrakhmanova@ispras.ru>
Subject: Re: [PATCH] drm/via: Add new condition to via_dma_cleanup()
Message-ID: <YuAjDvYey1hhI1AJ@ravnborg.org>
References: <20220725104555.124044-1-khabibrakhmanova@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725104555.124044-1-khabibrakhmanova@ispras.ru>
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
Cc: David Airlie <airlied@linux.ie>, ldv-project@linuxtesting.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alisa,

On Mon, Jul 25, 2022 at 01:45:55PM +0300, Alisa Khabibrakhmanova wrote:
> Pointer dev_priv->mmio, which was checked for NULL at via_do_init_map(),
> is passed to via_do_cleanup_map() and is dereferenced there without check.
> 
> The patch adds the condition in via_dma_cleanup() which prevents potential NULL
> pointer dereference.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 22f579c621e2 ("drm: Add via unichrome support")
> Signed-off-by: Alisa Khabibrakhmanova <khabibrakhmanova@ispras.ru>

Thanks for your patch. Due to other changes in drm-misc where we
maintain the via driver this patch fails to apply.
It would be great if you could redo the patch after -rc2 - on top of
-next. Then we can apply it to drm-misc.

You will see that the individual files for the driver is merged to a
single file, and this change does not hit -next until later.

	Sam
