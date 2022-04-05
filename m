Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B64F572C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F0F10ED6E;
	Wed,  6 Apr 2022 08:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 525 seconds by postgrey-1.36 at gabe;
 Tue, 05 Apr 2022 14:14:06 UTC
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89A810E383
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 14:14:06 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4KXqD12pDbzDrl3;
 Tue,  5 Apr 2022 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1649167521; bh=0j8pdCFwK+vsLeKLCbRx2HihbHdkkBXL+vv3PljYrJ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d+Th/u1NmtRvXD8MND1VzS7MxNf3YPoURZr6coOfWoNGfS261bMwf33Hv61h90vsV
 gIOe6dslfGrDNmb+8iIZBc3oHN4Eed1EGq1R6VWDkrlM/6U/TsPuGtz532xOfMDSCa
 Fz8JFPYXY8A4EkSYApePFzB26VmqXs3enULTTwes=
X-Riseup-User-ID: B80079A6AC902702CD272F327A407AB064A0553D7449E597F5ACE9B647EC4803
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4KXqCx1MLMz5vRF;
 Tue,  5 Apr 2022 07:05:16 -0700 (PDT)
Message-ID: <1d9f669a-d453-4792-67ab-cb82e3fd7bff@riseup.net>
Date: Tue, 5 Apr 2022 11:05:15 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/9] drm: vkms: Alloc the compose frame using vzalloc
Content-Language: en-US
To: Igor Torrente <igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-2-igormtorrente@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@riseup.net>
In-Reply-To: <20220404204515.42144-2-igormtorrente@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Apr 2022 08:00:38 +0000
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
Cc: melissa.srw@gmail.com, hamohammed.sa@gmail.com, tzimmermann@suse.de,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 Melissa Wen <mwen@igalia.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Igor,

Thanks for your patch!

Às 17:45 de 04/04/22, Igor Torrente escreveu:
> Currently, the memory to the composition frame is being allocated using
> the kzmalloc. This comes with the limitation of maximum size of one
> page size(which in the x86_64 is 4Kb and 4MB for default and hugepage
> respectively).
>
> Somes test of igt (e.g. kms_plane@pixel-format) uses more than 4MB when
> testing some pixel formats like ARGB16161616 and the following error were
> showing up when running kms_plane@plane-panning-bottom-right*:
>
> [drm:vkms_composer_worker [vkms]] *ERROR* Cannot allocate memory for
> output frame.
>
> This problem is addessed by allocating the memory using kvzalloc that

addessed -> addressed

OTOH, I would write this in imperative mood, as in "Address this by
allocating..." or "Fix this..."

> circunvents this limitation.

circunvents -> circumvents

>
> V5: Improve the commit message and drop the debugging issues in VKMS
> TO-DO(Melissa Wen).
>

Patch changelog are very useful for the mailing list, but not very
useful for the git log. For that reason, I usually put this right after
the --- in the patch, so the log will be dropped when the patch is applied.

Those comment applies for the rest of your series.

> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
