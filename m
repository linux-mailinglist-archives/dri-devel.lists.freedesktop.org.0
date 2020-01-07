Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842E71321F1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 10:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE7B6E808;
	Tue,  7 Jan 2020 09:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B5C6E808
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 09:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578388272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dkf8YLy72H/e6qdBSMk1Rri7+601l7EepyZljlwd0so=;
 b=UJxbY0M9aQlzTeJ1v41v9Ve6VqyYjrI4XtmFwegDOj3fxFykn1EOSfLwAA41+MGp6/5O5N
 PgNjUr4yM82xWffuDT1ipweOw7UQH9qHVcmUgS7VpsW2wzxNCf0Ui6UbrAqwz78CBTGEu8
 tyc6vj2oXHuZOvw1eCxbHhtLGjnZHR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-TUQT1P1DNNGZ5Suq0TNuow-1; Tue, 07 Jan 2020 04:11:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F9CD800D4C;
 Tue,  7 Jan 2020 09:11:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A9F68177C;
 Tue,  7 Jan 2020 09:11:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 82D599DA5; Tue,  7 Jan 2020 10:11:06 +0100 (CET)
Date: Tue, 7 Jan 2020 10:11:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 8/8] drm/vram-helper: Support struct
 drm_driver.gem_create_object
Message-ID: <20200107091106.7qiodkzrpgfc7jai@sirius.home.kraxel.org>
References: <20200106125745.13797-1-tzimmermann@suse.de>
 <20200106125745.13797-9-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200106125745.13797-9-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: TUQT1P1DNNGZ5Suq0TNuow-1
X-Mimecast-Spam-Score: 0
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
Cc: puck.chen@hisilicon.com, kong.kongxinwei@hisilicon.com,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 zourongrong@gmail.com, airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 06, 2020 at 01:57:45PM +0100, Thomas Zimmermann wrote:
> Drivers that what to allocate VRAM GEM objects with additional fields
> can now do this by implementing struct drm_driver.gem_create_object.
> 
> v3:
> 	* separately check allocation failure in if/else branches
> 	  before upcast to gbo
> v2:
> 	* only cast to gbo within if branch; set gbo directly
> 	  in else branch
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
