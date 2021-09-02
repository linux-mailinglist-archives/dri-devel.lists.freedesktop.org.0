Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0143FE9C8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 09:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA586E45D;
	Thu,  2 Sep 2021 07:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16EA6E45D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=wsEUpJDilSHKQhB8V4biJ9qqXdXIwzngZTn7EDF2jGE=; 
 t=1630566635; x=1631776235; b=Ittc4UvHuKmI7v4ISfvL7hSleRaCCjX1Uz8HkM6pgqnNiVf
 Eh7ULsgFO9jWF4DhXLF0r/bCs1sDmsyWEpI9Kjg3+CFfri1GwXz2PF+kWM0YezwI5rV604NPEhDgQ
 YCY7iVpgxFOs6nnp2Aw+4qxIjRfhJj74bDqPzAkTw9oihxnfkiXx8DBOJVWx0t4WmVvab7Kw6GEhP
 OpZRRpXTSr1OMx+GmE6/qD0mWi2iF3zDu46hsKzebpFhS4gISJjzSK7jy6CHly+K97MCyTg6E2fA1
 3PQXblnV/qCceaKkmNWu4o6KXLXl7TBohBvXDQJSmfu6cQqUqJ6pU3G93znAh5uw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mLgrd-001VVH-8J; Thu, 02 Sep 2021 09:10:21 +0200
Message-ID: <626cc3f828c2dab14cd66e8cac0c8ea84e7ba088.camel@sipsolutions.net>
Subject: Re: [PATCH] drm/r128: fix build for UML
From: Johannes Berg <johannes@sipsolutions.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Jeff Dike <jdike@addtoit.com>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>,  linux-um@lists.infradead.org
Date: Thu, 02 Sep 2021 09:10:20 +0200
In-Reply-To: <20210902021721.27274-1-rdunlap@infradead.org>
References: <20210902021721.27274-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned
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

On Wed, 2021-09-01 at 19:17 -0700, Randy Dunlap wrote:
> Fix a build error on CONFIG_UML, which does not support (provide)
> wbinvd(). UML can use the generic mb() instead.
> 
> ../drivers/gpu/drm/r128/ati_pcigart.c: In function ‘drm_ati_pcigart_init’:
> ../drivers/gpu/drm/r128/ati_pcigart.c:218:2: error: implicit declaration of function ‘wbinvd’ [-Werror=implicit-function-declaration]
>   wbinvd();
>   ^~~~~~
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") # pre-git

Arguably, that could be

Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")

because prior to that, Kconfig options depending on PCI couldn't be
selected on ARCH=um.

johannes

