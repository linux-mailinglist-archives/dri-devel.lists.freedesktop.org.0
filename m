Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6C606EDE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 06:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A7B10E5A4;
	Fri, 21 Oct 2022 04:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D4010E5A4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 04:24:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0E1BB82A05;
 Fri, 21 Oct 2022 04:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90CFC433C1;
 Fri, 21 Oct 2022 04:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666326275;
 bh=UmX8ef2JDQIqTzvwh9bE+uP68tS+yRb7stDvk5PBVrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2CvdGBilt0mBkjLTnjXi3sBHe2XnnlzEkL56JSnnVayhWp0aFfCF7+gDmDQpdutlJ
 9Nip1+EwL32EyjWyr6+zyK+MmIDSXy9gVD3UPPbVdLjB5VmRtDlh5kJAMMgVBX/S+I
 4z8QDr0fEYFVLPtJ1G0FmhPaUi3W5gXcFFkfP3pw=
Date: Fri, 21 Oct 2022 06:25:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Subject: Re: [PATCH v5 08/10] gna: add GNA_WAIT ioctl
Message-ID: <Y1IfNAhnjhXw3eTv@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-9-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-9-maciej.kwapulinski@linux.intel.com>
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
Cc: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 07:53:32PM +0200, Maciej Kwapulinski wrote:
> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> 
> Although the patch adds GNA_WAIT ioctl, it's main purpose is to provide FIFO
> work-queue logic, which offloads each score operation in sequence to GNA
> accelerator. When it's done, process(es) WAITing for score to be finished are
> woken up.


I do not understand the "Although" here at all :(

> +static irqreturn_t gna_interrupt(int irq, void *priv)
> +{
> +	struct gna_device *gna_priv;
> +
> +	gna_priv = (struct gna_device *)priv;
> +	gna_priv->dev_busy = false;
> +	wake_up(&gna_priv->dev_busy_waitq);
> +	return IRQ_HANDLED;
> +}

irq handling, nice!  Why wan't that discussed in the changelog?

{sigh}

I'm stopping here, this needs lots of work to make it reviewable to
understand what is going on at all.

Please take the time and get proper internal-Intel review first, before
asking community members to take their time to tell you the things that
they should have already told you.

thanks,

greg k-h
