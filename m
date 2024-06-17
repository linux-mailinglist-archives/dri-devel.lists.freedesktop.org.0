Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08A690B33A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0993010E411;
	Mon, 17 Jun 2024 15:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="FA7meC4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C540E10E416
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=nIdL7P86hcKvhF+tvLQiYN1713n2GXUoWwoYBL1KXZc=; b=FA
 7meC4EcKsGp7Bc73EpvI0iZ/MsHIgAybJgVbVC5Dbqt3O1gcwASYCJO+vqF3E/eh8PgwhsbGLdgK2
 KlnA+Qs3YMiNXd6JaB1DKBD5gyC7kNy/Prlkmw0HZ9hNhRahFNONHYSP2pruUmCQPrBnyHll/jJfr
 WIFSCPlQDoP/MdI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sJDsG-000HYN-Gp; Mon, 17 Jun 2024 17:02:24 +0200
Date: Mon, 17 Jun 2024 17:02:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Abhilash K V <kvabhilash@habana.ai>,
 Andrey Agranovich <aagranovich@habana.ai>,
 Bharat Jauhari <bjauhari@habana.ai>, David Meriin <dmeriin@habana.ai>,
 Omer Shpigelman <oshpigelman@habana.ai>,
 Sagiv Ozeri <sozeri@habana.ai>, Zvika Yehudai <zyehudai@habana.ai>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Message-ID: <f2ddbeaa-e053-467f-96d2-699999d72aba@lunn.ch>
References: <20240613082208.1439968-2-oshpigelman@habana.ai>
 <9d13548f-7707-4741-9824-390146462db0@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d13548f-7707-4741-9824-390146462db0@web.de>
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

On Mon, Jun 17, 2024 at 04:05:57PM +0200, Markus Elfring wrote:
> …
> > +++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
> > @@ -0,0 +1,5954 @@
> …
> > +int hbl_cn_read_spmu_counters(struct hbl_cn_port *cn_port, u64 out_data[], u32 *num_out_data)
> > +{
> …
> > +	mutex_lock(&cn_port->cnt_lock);
> > +	rc = port_funcs->spmu_sample(cn_port, *num_out_data, out_data);
> > +	mutex_unlock(&cn_port->cnt_lock);
> > +
> > +	return rc;
> > +}
> …
> 
> Would you become interested to apply a statement like “guard(mutex)(&cn_port->cnt_lock);”?
> https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/mutex.h#L196

Hi Markus

We decided for netdev that guard() was too magical, at least for the
moment. Lets wait a few years to see how it pans out. scoped_guard()
is however O.K.

   Andrew
