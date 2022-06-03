Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2AF53C8A2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 12:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8744310F013;
	Fri,  3 Jun 2022 10:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC5410E425
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654252128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ZfNG28iQ+VyzYu7e2tKetM5JR1ifZiThY2dOHLBO+g=;
 b=TYjZhkCwWS/6/0t17SmHoA+qa8ysb5lWCMejLdua7YyJmgUbdsUHUsPWjbcVnxtHYBkE3x
 mhJvWUnUzyzbhPU8zVOEKiPXm7bJqx9qzhjIpjsKuqS454XvQxkMf9fnXKHngC9Abjtzji
 TbbqDXNsfiarm0vetDsToZaGfrzQ4os=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-b7f892PiOp2Dn6uGyxce2Q-1; Fri, 03 Jun 2022 06:28:47 -0400
X-MC-Unique: b7f892PiOp2Dn6uGyxce2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BC8E3C0219C;
 Fri,  3 Jun 2022 10:28:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD0F52166B26;
 Fri,  3 Jun 2022 10:28:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3BB1C18009C4; Fri,  3 Jun 2022 12:28:40 +0200 (CEST)
Date: Fri, 3 Jun 2022 12:28:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220603102840.g5y43spkwtowmdcc@sirius.home.kraxel.org>
References: <20220602154243.1015688-1-zack@kde.org>
MIME-Version: 1.0
In-Reply-To: <20220602154243.1015688-1-zack@kde.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: krastevm@vmware.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> the legacy kms to atomic. This left virtualized drivers, all which
> are atomic, in a weird spot because all userspace compositors put
> those drivers on deny-lists for atomic kms due to the fact that mouse
> clicks were incorrectly routed, e.g:

> - all userspace code needs to hardcore a list of drivers which require
> hotspots because there's no way to query from drm "does this driver
> require hotspot"

So drivers move from one list to another.  Not ideal, but also not worse
than it was before, so:

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

for the qxl and virtio driver changes.

take care,
  Gerd

