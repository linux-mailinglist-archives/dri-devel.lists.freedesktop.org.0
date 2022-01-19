Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE849434A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 23:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8690010E272;
	Wed, 19 Jan 2022 22:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBECF10E26D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 22:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642632973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6jpHE1+BpzE8oEcVzu2U7JQ8f9cnoxZjC0hx7dFA8fk=;
 b=O7d2c7TPto7/m2COa3Zw/pr2aY3Sm8Rh4PTskP4D86gVgtLGvc+YPIrKDO763dlWntm+FS
 BeqX28R41t/R5MSW6BhvVuSDE72CpxpaypLG1H4y5BdOohWWeMohHJ5idPreUc2s5xPl67
 RI2jMfHqj1tGW5rOrQQN/vOsNp7Pgss=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-lQMbjl8PMYan9N6zyGxy1w-1; Wed, 19 Jan 2022 17:56:11 -0500
X-MC-Unique: lQMbjl8PMYan9N6zyGxy1w-1
Received: by mail-qt1-f199.google.com with SMTP id
 c10-20020ac84e0a000000b002c9c1be5a00so2438588qtw.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 14:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=6jpHE1+BpzE8oEcVzu2U7JQ8f9cnoxZjC0hx7dFA8fk=;
 b=fCQh1aoGuo3IK7poeHDITBhMQls950PPgi3A9kTUB98ZszXGQzK+Gs0sbfRYq7hPfP
 2sPj+xc7S4Mj5JNKlJhCLv41i9+Y5viXlKkPoO0zlpeWV3B0apsgJvZXfOK9QNS8x6fv
 ch2agbX/oohMkAQQsT4IbtgTZSZB8nnRBpGryMjhfoEKk3Nb/4huo1qq7u9QMVqVavxk
 gTDe2YLoMX4aEb76DGXKhXqE+tVvs+ou+Cg/kkvkahoTxypXh/wW7xx/gEZmXJCYlMR1
 YOBXpnBCmTsyH1Yg21D3Htt1uQVYqqm4+kQzTJNl9dvKH1ctgt0Is2HhZ3ZjAeJvAMRG
 0GZg==
X-Gm-Message-State: AOAM531jYL2EbbGmZ5f6YTkvm/nC4Y1ZMhwH7hRONm/YbhGH4FHdQXvR
 gspFtmgrNTJs6Pk3MvcJh1dl2rMsIW7/O0D7GOJBjms761zWZp9M43SOVa3LdSaFWp9ojCwEZi/
 E5y1Tn5g7XAvtVt7J/dpOh1TJkKdY
X-Received: by 2002:a05:622a:34a:: with SMTP id
 r10mr26279212qtw.366.1642632971354; 
 Wed, 19 Jan 2022 14:56:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDwfhs6HQW/ujJsVKfvb9EqWiZArF7OrbNbWpbD/kTCfgy+xtlQdS0Pj7WTZmb09QRIlcO+g==
X-Received: by 2002:a05:622a:34a:: with SMTP id
 r10mr26279203qtw.366.1642632971031; 
 Wed, 19 Jan 2022 14:56:11 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id h17sm511894qtk.19.2022.01.19.14.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 14:56:10 -0800 (PST)
Message-ID: <15588b86c92b18144be1574826f38f90e9b752ba.camel@redhat.com>
Subject: [RFC] amdgpu MST questions, and future plans
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Date: Wed, 19 Jan 2022 17:56:09 -0500
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Hi! I'm writing this email because I'm currently finishing up removing pretty
much all of the non-atomic MST code in drm_dp_mst_topology_mgr.c as it's
really made it difficult to maintain MST over time. As well, once that's
complete it's likely I'm going to start on the (extremely overdue) task of
moving as much of amdgpu's MST code for DSC out of amdgpu and into the DRM
code where it's supposed to live.

This brings me to two questions. The first major one being: is anyone capable
of testing the MST support in radeon.ko to figure out whether it works or not?
I've already talked with hwentlan and ag5df about this and they haven't been
able to find anyone to help with testing this. The reason I ask is because
radeon isn't an atomic driver, and is basically the only user of any of the
non-atomic parts of the MST helpers. If anyone want to prevent this from
breaking in the future, I would definitely recommend they step up to try and
help with testing it - otherwise I'm probably going to be pushing for us just
to drop the code entirely.

The second question is: is anyone willing to help me figure out how much of
the code in amdgpu related to DSC is definitely not amdgpu specific and can be
moved out? I'm honestly having a lot of trouble wrapping my head around how
some of this works, and how much of this code is even needed. As well, with
the amount of issues I've already found in it (there's numerous spots where
we're storing MST state outside of atomic state for instance, lots of
duplicates of DP helper functions that should not be here, etc.) it's quite
likely I'm going to be rewriting rather large chunks of it. If anyone would
like to volunteer please let me know, it'd be super appreciated and likely
will make reviewing the patches that will come out of this easier.
-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

