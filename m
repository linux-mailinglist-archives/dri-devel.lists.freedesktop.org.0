Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B152025893E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988AF6E82C;
	Tue,  1 Sep 2020 07:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D06189E0E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 17:33:12 +0000 (UTC)
Received: from mail.ispras.ru (unknown [83.149.199.84])
 by mail.ispras.ru (Postfix) with ESMTPSA id 72BAF40D4004;
 Mon, 31 Aug 2020 17:33:09 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 31 Aug 2020 20:33:09 +0300
From: lutovinova@ispras.ru
To: peter.senna@gmail.com
Subject: fotg210-udc: Error in type cast in fotg210_in_fifo_handler()
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <b8b01720ee550840c7c0fc39d3e9e5f9@ispras.ru>
X-Sender: lutovinova@ispras.ru
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: ldv-project@linuxtesting.org, lutovinova@ispras.ru, jernej.skrabec@siol.net,
 martyn.welch@collabora.co.uk, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, martin.donnelly@ge.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If in fotg210_udc_probe() after initialization 
INIT_LIST_HEAD(&ep->queue)
and after a registration of an interrupt handler in fotg210_irq()
fotg210_in_fifo_handler() is calling then in fotg210_in_fifo_handler()
list_entry() tries to get struct fotg210_request from ep->queue.next, 
but
after initialization ep->queue.next is from struct fotg210_udc.

Also this problem appears in  fotg210_out_fifo_handler().

In fotg210_ep0in() and fotg210_ep0out()
there is checking by list_empty() before calling list_entry ().

Found by Linux Driver Verification project (linuxtesting.org).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
