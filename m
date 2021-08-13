Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA953EC164
	for <lists+dri-devel@lfdr.de>; Sat, 14 Aug 2021 10:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D488930F;
	Sat, 14 Aug 2021 08:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F24F6E8C8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 19:43:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q6so3182516wrv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 12:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6DRqcCpufPwNLpj+lq/ozHv4ev3o5zivpQ94UUQiOwU=;
 b=CPhM3Pucl7Cll0k+pNiK4/sXyD+fP5CpDiyM3WrSiF92uZ8vSN2JJRLpglxkuhjNsO
 qNkGZR0xZm2m4WBHzSxvSxMd0dIDO143l7ET/Yed+Ke2ZrskDNnoSFKSRBjPCXUGp1dV
 xH3dt0boB3J/mPvpDgj95QW+NVMPn3WOwDqmcAujIul81/npQldGXL4OL+INSmHjFfz8
 HaQhFQ/NVUj4bgsDx8fr/IAxXlpHwjELUSD9DAAouYEQwxaDSpsnW1ixpzVuoJEM4eg5
 sVoQm6BvELr9X/31n84d1WrrtBV5eCqDvt4/5EGVmcv59XuHQ0GGNdrd9U/y8vfGWbyT
 fG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6DRqcCpufPwNLpj+lq/ozHv4ev3o5zivpQ94UUQiOwU=;
 b=tVZawAAVF6ZaTZfZG48FyOJcPfzZzE6pPXitQT7PxhBbpM8aW9y5fUVDANgdYCjvSu
 1KBsk9QXB4MC8X4kpql/KquoeewQGkqpd/F6DB863rs5yNIEDCp1+GqdyMfoN6SiWc0E
 MXxBdkEPKCWjw9+EspmQofXVmW0zopQ/WiHNkgVJixgL6eKWlw4v2GzHGTjy5OQkw1Bi
 QvGCvWQPrfZwrwYBwLFuki07dF4uQrlkz7UtHQy/1a7i1UFScOTBXTMUFowIqu7jfI9q
 vyk9jnTtgoGD2HlixlNEQ8O5xT0kOUBN0ujtGWqZWWPfV/NzDR2FfcDZFh+tn2XUcn+h
 VYPg==
X-Gm-Message-State: AOAM533pm7U+HSg2wHCyil8t5h9N8zuVB0RIayDnbibH0aEgjImv7gnp
 XYFRLgtz0uNwkr25F5XFCPG2tHKNd5xxcb6lLEgTqhy+NcQgfQ==
X-Google-Smtp-Source: ABdhPJzDtVsyCT9eGYvrjStwaaJ+IrSxmceS84SryRoD3nwQ31MaPMRN7M3JUDQ6dJEr8kVlcNr1trw9hhnIX7u6KCw=
X-Received: by 2002:adf:9d86:: with SMTP id p6mr4985913wre.156.1628883782570; 
 Fri, 13 Aug 2021 12:43:02 -0700 (PDT)
MIME-Version: 1.0
From: lepton <ytht.net@gmail.com>
Date: Fri, 13 Aug 2021 12:42:51 -0700
Message-ID: <CALqoU4wAf2EcedVJ+favUQv+3Pfj-3_OvONGY=ae3a6zrk2_OA@mail.gmail.com>
Subject: Why we didn't use embedded gem object for virtio gpu when making ttm
 bo a gem bo subclass?
To: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 14 Aug 2021 08:26:09 +0000
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

Hi Gerd,

We found a bug in 5.4 kernel and virtgpu_gem_prime_mmap doesn't work
because it references vma_node in gem_base object while ttm code
initialized vma_node in tbo.base object. I am wondering, in your
original serial:
https://patchwork.kernel.org/project/dri-devel/cover/20190805124310.3275-1-kraxel@redhat.com/
(drm/ttm: make ttm bo a gem bo subclass), why you changed to use
embedded gem object for most gpu drivers but skipping virtio gpu? Is
there some specific reason?

I am thinking about CL like this (http://crrev.com/c/3092457) to fix
it and not sure if I missed something.

Thanks for your help!
