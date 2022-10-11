Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D605FB947
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 19:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC57310E663;
	Tue, 11 Oct 2022 17:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7243F10E835
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 17:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665509195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eYEYAe9fLAOLBvxf2chPDCV+/M1VFUTfl2N3k/lfuBI=;
 b=DC9iV2vu/8mvf/gi/zaQrCnFadrCFAcXARI9XCvY0Ie35SnTp+WpofCScH8+7O5ioBsgd+
 kW9p2af84cwapHhqxYf9z8MSSGD1Srs49Tcz4HRv9v/u96ucAlmO1MeW3f/aDu316qwhkk
 jTcal+qde1zlnVVySfEo0MJlfCmQEjI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-SI2mO8-QPcu95tlFE87A-A-1; Tue, 11 Oct 2022 13:26:34 -0400
X-MC-Unique: SI2mO8-QPcu95tlFE87A-A-1
Received: by mail-wm1-f72.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so3931732wmh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 10:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eYEYAe9fLAOLBvxf2chPDCV+/M1VFUTfl2N3k/lfuBI=;
 b=Xt2sQZcYOguqe4hp1jLpU3GXofay0LVdUAtGfz50hj90WqVDBT2zrirdkrMR+Iw7Kf
 G8fpHpbXWjsZxiCj50/h/Yv9V19wMD/uhm2qYEOwKDziY4iP+odxsmr2yHDztammxagi
 ImHts26NF43O8Q+Zg/fv1dKy/TdMYfT+YXhOt8crboBXhdbycb8XTe6tXb6/Opxsvtsj
 g/p5ALL7tIjZhsAH9J5QQ0I28uZxOTHcw//WMsA6NMrRlwVdDIDkPLNCxiov1v+9Nf6N
 uU8yZG6ijCg9f8cIswau6JNzjliZvskHE+aFJttiTMimfBgakOaOFX4YArE1cKtaoHg4
 RamQ==
X-Gm-Message-State: ACrzQf0+q5kCV6Wd1Mk5zZK40976R+K0ap3EtboxOueuihQIGzn9sfTf
 wkuyVmaOef+EEurc4UCGmuT3vEOdixUbMVH1zf/5gRC23M6ZOy6MmEygYLmZvApzyb4oGgtfQ2u
 JxQ8iqVS2EWihkgwrDDBueliUy6Hy
X-Received: by 2002:a05:600c:1d2a:b0:3c6:b7be:2879 with SMTP id
 l42-20020a05600c1d2a00b003c6b7be2879mr141311wms.84.1665509190121; 
 Tue, 11 Oct 2022 10:26:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6zrxc0AgFxFDNLUUwT5/sQzmmSOmXEXO2THv4sgqdo9q6YnmTY3ch9AltIGQhCV9Og2N0sLA==
X-Received: by 2002:a05:600c:1d2a:b0:3c6:b7be:2879 with SMTP id
 l42-20020a05600c1d2a00b003c6b7be2879mr141297wms.84.1665509189936; 
 Tue, 11 Oct 2022 10:26:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c1d2400b003a62052053csm24835760wms.18.2022.10.11.10.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 10:26:29 -0700 (PDT)
Message-ID: <5e841ef0-de79-2e1c-83e1-2b6d31732ce9@redhat.com>
Date: Tue, 11 Oct 2022 19:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 0/8] drm/ast: Convert ast driver to SHMEM
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
References: <20221010103625.19958-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20221010103625.19958-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks a lot for your series. This solves a big performance impact when 
using Gnome/Wayland on some Aspeed chip, with BMC.
This also remove the need for "shadowFB" workaround in userspace.

With the small change in patch 8, and the two typo's,
the whole series is

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>

Best regards,

-- 

Jocelyn

On 10/10/2022 12:36, Thomas Zimmermann wrote:
> This patchset converts ast to GEM SHMEM helpers. Fixes problems with
> memory allocation and BMC scanout updates.
> 
> Patches 1 to 3 are fixes for various minor problems in the ast driver.
> We should merge them even without SHMEM support.
> 
> Patches 4 to 6 prepare the driver for the conversion. The cursor double
> buffering is not required and prevents reuse among the plane code. Style
> issues are being fixed separately from the conversion.
> 
> The conversion itself is in patch 7. Not only does it fix problems with
> memory allocation, it also brings back several high-res display modes
> that got lost during the ast driver's conversion to atomic modesetting.
> There was an earlier RFC patch of this code that had issues with
> rendering performnce. [1] We've meanwhile improved these areas and
> performance was acceptable on the test systems.
> 
> With SHMEM in place, the scanout address for the primary plane does not
> have to be changed often. Patch 8 fixes a performance problem where the
> BMC output freezes for several seconds after reprogramming the scanout
> address.
> 
> Tested on AST 2100 and 2300 with fbdev emulation, weston, and Gnome in
> X11 and Wayland mode.
> 
> [1] https://lore.kernel.org/dri-devel/5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de/
> 
> Thomas Zimmermann (8):
>    drm/ast: Acquire I/O-register lock in atomic_commit_tail function
>    drm/ast: Call drm_atomic_helper_check_plane_state() unconditionally
>    drm/ast: Do not call drm_atomic_add_affected_planes()
>    drm/ast: Remove cursor double buffering
>    drm/ast: Rename struct ast_cursor_plane to struct ast_plane
>    drm/ast: Style cleanups in plane code
>    drm/ast: Convert ast to SHMEM
>    drm/ast: Avoid reprogramming primary-plane scanout address
> 
>   drivers/gpu/drm/ast/Kconfig    |   4 +-
>   drivers/gpu/drm/ast/ast_drv.c  |   4 +-
>   drivers/gpu/drm/ast/ast_drv.h  |  34 +--
>   drivers/gpu/drm/ast/ast_main.c |   5 +-
>   drivers/gpu/drm/ast/ast_mm.c   |  14 +-
>   drivers/gpu/drm/ast/ast_mode.c | 399 ++++++++++++++++-----------------
>   6 files changed, 219 insertions(+), 241 deletions(-)
> 
> 
> base-commit: 74e2443e7681e4d442b45f551ddf12d09a6f00c3

