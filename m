Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425213ECDED
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 07:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4434589BCD;
	Mon, 16 Aug 2021 05:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AFB89C03
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 05:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629090554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5qkh2C2La3ey/Vsv9JPicPzhTyViOg6QWHSyAc9QpBU=;
 b=P8HC3KctTcMZp6RgkfqasfO1D9rHxXcoMbd7ki/FKgK50mCAsevpsmPDiQkdnTfybwcluN
 EepaENlrT1gWXuOT2nGdGD2ML+fjQZq9hbqY7PYgWvMwRbJaFSeXvu3CtyROOCSm//c+zI
 BX5e99/gvAZKk/REXLZEmkYspDK1Rpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-UwWGrvngOlyQRtK1RJi_lw-1; Mon, 16 Aug 2021 01:09:09 -0400
X-MC-Unique: UwWGrvngOlyQRtK1RJi_lw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB4E51008062;
 Mon, 16 Aug 2021 05:09:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A79A21017CF5;
 Mon, 16 Aug 2021 05:09:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1DCD61800382; Mon, 16 Aug 2021 07:09:07 +0200 (CEST)
Date: Mon, 16 Aug 2021 07:09:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: lepton <ytht.net@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: Why we didn't use embedded gem object for virtio gpu when making
 ttm bo a gem bo subclass?
Message-ID: <20210816050907.wvenbw6ds4tgp56a@sirius.home.kraxel.org>
References: <CALqoU4wAf2EcedVJ+favUQv+3Pfj-3_OvONGY=ae3a6zrk2_OA@mail.gmail.com>
 <20210816044556.iqkdatwbkdig2pr2@sirius.home.kraxel.org>
 <CALqoU4yU3mySw9DQ0V1O=wZ_iWgftSngmZFZZbGN9Y0tYNHq9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALqoU4yU3mySw9DQ0V1O=wZ_iWgftSngmZFZZbGN9Y0tYNHq9g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Sun, Aug 15, 2021 at 09:51:02PM -0700, lepton wrote:
> Hi Gerd,
> 
> Thanks for your reply. I was aware of that change, but need a fix for
> 5.4 kernel as a temp solution for now.
> If the reason is just that you will move away from ttm soon,then I
> guess a CL like http://crrev.com/c/3092457 should
> work for 5.4, just hope I don't miss anything else.

Looks sane on a quick glance.

take care,
  Gerd

