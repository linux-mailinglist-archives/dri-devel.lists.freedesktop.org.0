Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7BF1553A8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 09:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587FC6EAA3;
	Fri,  7 Feb 2020 08:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BC66EAA3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581063783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qt+fyI7WDmsP0p9IJBv8U7f1oj6WsoRCDhuKInDOWJQ=;
 b=VcfItGJ1N976lfUbnHk0B1AsvFj/4GpKabNEcfk7MbKyR0K8ezZUKuH18W5u5i+oFrQFrK
 a7PXxwzQh0cnE9kmuSzhA6KUqEsol6fZ9ONasa7Ny0iYwOmimmvc+qrZzSj5U8DppR6606
 vceSV8x7MY1I45B54W2D5+tlOg/4YKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-sWOlLHtWNgipno61rH99JA-1; Fri, 07 Feb 2020 03:22:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D5D01800D42;
 Fri,  7 Feb 2020 08:22:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44AF78E611;
 Fri,  7 Feb 2020 08:22:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 877F9A1E0; Fri,  7 Feb 2020 09:22:57 +0100 (CET)
Date: Fri, 7 Feb 2020 09:22:57 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH 2/2] drm/virtio: remove the global disable_notify state
Message-ID: <20200207082257.ldn7q6vsbmoz34bw@sirius.home.kraxel.org>
References: <20200206192214.86818-1-olvaffe@gmail.com>
 <20200206192214.86818-3-olvaffe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200206192214.86818-3-olvaffe@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: sWOlLHtWNgipno61rH99JA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 06, 2020 at 11:22:14AM -0800, Chia-I Wu wrote:
> The global disable_notify state does not scale well when we start
> using it in more places and when there are multiple threads.  Use
> command-level bools to control whether to notify or not.

Hmm, I don't like passing around the bool everywhere that much.

How about this alternative approach:  Flip the default to NOT kick
commands.  Have an explicit kick function to request a kick when needed.
Maybe automatically kick fenced commands.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
