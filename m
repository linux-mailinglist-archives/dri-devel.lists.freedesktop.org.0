Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B3615D45A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 10:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D226E573;
	Fri, 14 Feb 2020 09:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF596E573
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581671340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAQAH+o0k5jJqtbPtBVkDUgqHbASCr0ZVzndvog8DsI=;
 b=bciC8bJL6Apd0kSHAuZ5P6IKjDEJorNzHjv4fV0c+CMQwpYeciDQG9Ud6GXm+nrrToOyE1
 oixyDKg+xLaY6IY5yfE1USa7W4VRQF9ziqS4DbtefcjHMlxc1zH4ZZLo7HZNUFPZxH4O0v
 mi+A2eXv17+70o/w5yIxycX/zPNgBQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-p-SRRMYDMf2yG1MptuP09g-1; Fri, 14 Feb 2020 04:08:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A671005513;
 Fri, 14 Feb 2020 09:08:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1349819C4F;
 Fri, 14 Feb 2020 09:08:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1B70045B4; Fri, 14 Feb 2020 10:08:56 +0100 (CET)
Date: Fri, 14 Feb 2020 10:08:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Nirmoy <nirmodas@amd.com>
Subject: Re: [RFC PATCH 5/6] drm/qxl: don't use ttm bo->offset
Message-ID: <20200214090856.46tmxbyukqwqitkx@sirius.home.kraxel.org>
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <20200213120203.29368-6-nirmoy.das@amd.com>
 <20200213143053.tkbfd6wr5rbspzty@sirius.home.kraxel.org>
 <013434ab-b7a0-b703-bf5a-51e2873e268a@amd.com>
MIME-Version: 1.0
In-Reply-To: <013434ab-b7a0-b703-bf5a-51e2873e268a@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: p-SRRMYDMf2yG1MptuP09g-1
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -=A0=A0=A0=A0=A0=A0 if (bo->mem.mm_node)
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bo->offset =3D (bo->mem.start=
 << PAGE_SHIFT) +
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bdev->man[bo->mem=
.mem_type].gpu_offset;
> -=A0=A0=A0=A0=A0=A0 else
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bo->offset =3D 0;
> -
> =

> =

> My assumption is
> =

>  (bo->tbo.offset - slot->gpu_offset + offset) =3D=3D (bo->tbo.mem.start <=
< PAGE_SHIFT) + bdev->man[bo->mem.mem_type].gpu_offset - slot->gpu_offset +=
 offset)
> =

> -> =3D=3D (bo->tbo.mem.start << PAGE_SHIFT) + offset

That looks better.

> and we loose=A0 slot->gpu_offset so I thought it should be
> =

> ((bo->tbo.mem.start << PAGE_SHIFT) + slot->gpu_offset + offset);

No.

The addressing scheme used by qxl is the slot in the high bits and the
offset within the slot in the low bits.  The qxl device has two pci
memory bars, the driver creates a slot for each of them, for ttm they
are VRAM and PRIV.

So maybe we don't need gpu_offset at all.  Not fully sure how driver and
ttm interact here.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
