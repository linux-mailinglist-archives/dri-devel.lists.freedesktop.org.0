Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B105A0D75
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 12:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0503B10F1D7;
	Thu, 25 Aug 2022 10:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B78B89580
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661421633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDMJM4xaNa8F6qNLeCk3gtnCuTZkfmjtMxMyvWQIl8c=;
 b=Uq9drrFedHyRq1fI33EUssWsLX/1jAhtV/rAlkxjXpqAMVJQ4kvpVWZFhnAzdqJYLutPAC
 mms1xaWEO81iekNm70oSw+mtUPPv9SZmd/MOb5H3DQprmVjfxSUGb9bT9w87ptQk/chQUB
 rUouXj0QT1Upj1Oen/s6vo0lrvVR3t4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-5yqQhZGfOKuiatigGXtubw-1; Thu, 25 Aug 2022 06:00:30 -0400
X-MC-Unique: 5yqQhZGfOKuiatigGXtubw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 748BC8032F6;
 Thu, 25 Aug 2022 10:00:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47865141510F;
 Thu, 25 Aug 2022 10:00:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E11881800082; Thu, 25 Aug 2022 12:00:28 +0200 (CEST)
Date: Thu, 25 Aug 2022 12:00:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] udmabuf: Set ubuf->sg = NULL if the creation of sg table
 fails
Message-ID: <20220825100028.gyuyvy6o4zjvksvh@sirius.home.kraxel.org>
References: <0000000000001b37dc05e68ce911@google.com>
 <20220825063522.801264-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220825063522.801264-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: syzbot+c80e9ef5d8bb45894db0@syzkaller.appspotmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 11:35:22PM -0700, Vivek Kasireddy wrote:
> When userspace tries to map the dmabuf and if for some reason
> (e.g. OOM) the creation of the sg table fails, ubuf->sg needs to be
> set to NULL. Otherwise, when the userspace subsequently closes the
> dmabuf fd, we'd try to erroneously free the invalid sg table from
> release_udmabuf resulting in the following crash reported by syzbot:
> 
> general protection fault, probably for non-canonical address
> 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN

[ ... ]

> Reported-by: syzbot+c80e9ef5d8bb45894db0@syzkaller.appspotmail.com
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Pushed to drm-misc-next.

thanks,
  Gerd

