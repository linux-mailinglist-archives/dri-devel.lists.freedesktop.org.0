Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED411B7114
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 11:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8746E180;
	Fri, 24 Apr 2020 09:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C246E44B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 09:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587721137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nY77n/20zmLetgnKpJkDZ07V8rLoj2xSSNharl9JauM=;
 b=EQSHh+vzmYX9/G5AmgyN+c4klvRVflG0EBYsEVsBl8B6iPpOqc86+t2ty3Y8xHuT31ccd1
 Yyeefp2G1+8+VAKvMzT5GEdgJKaamanACjxYjIFI86qtUntpXbNodGqWRblvzZ+TsCqqfV
 fGG1vFaOO3YQmmpdXj+3lIo88Yek9J0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-NswXcEY3NhyE3ZQJqFhncg-1; Fri, 24 Apr 2020 05:38:53 -0400
X-MC-Unique: NswXcEY3NhyE3ZQJqFhncg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F6D145F;
 Fri, 24 Apr 2020 09:38:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E8CB5D70C;
 Fri, 24 Apr 2020 09:38:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C0D299D98; Fri, 24 Apr 2020 11:38:49 +0200 (CEST)
Date: Fri, 24 Apr 2020 11:38:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
Message-ID: <20200424093849.tiyukod37qeztaxb@sirius.home.kraxel.org>
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
 <b9315d4b-0f3e-712b-8a26-0ed5e3ac6f68@suse.de>
MIME-Version: 1.0
In-Reply-To: <b9315d4b-0f3e-712b-8a26-0ed5e3ac6f68@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: airlied@linux.ie, sam@ravnborg.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> At some point one has to choose to switch to top-down, and then back
> again at one of the next BOs. So the current patch effectively splits
> vram into a lower half and an upper half and puts BOs in alternating halves.

Hmm, so maybe just make the split explicit instead of playing tricks
with top_bottom?  Register the lower vram half as TT_VRAM, register the
upper half as TT_PRIV.  That'll make sure you never have a big
allocation in the middle blocking things.  Or maybe add a allocation
strategy flag to ttm which effectively does the same.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
