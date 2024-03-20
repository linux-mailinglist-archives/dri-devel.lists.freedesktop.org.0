Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A317E8816EB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 18:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B18710E305;
	Wed, 20 Mar 2024 17:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hIfpQJSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1345D10E352
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 17:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710957529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Axnmc3c8wXrwtc1SqEBNyEeeabqX4hMnATXLfXqHXCQ=;
 b=hIfpQJSSUQ/zPaV69Zpvtjdi4Q4wBu4iV/ONfv7tBLkG8HDDMftD3+17HCiQXlp8eJ3EEm
 UWqDzK/pRRTSbrqVoogHkrOVU1TBYmJ1VWwiJk4lOM8Nfyh+7EJzspOhectVT4/GicHQhk
 8kTx2UXAi7o9rxwLJeZg4tZ5JBuf9BU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-O9RzNP5XOAC63Jmmt589jw-1; Wed, 20 Mar 2024 13:58:48 -0400
X-MC-Unique: O9RzNP5XOAC63Jmmt589jw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a46e26556a2so5317366b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 10:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710957527; x=1711562327;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Axnmc3c8wXrwtc1SqEBNyEeeabqX4hMnATXLfXqHXCQ=;
 b=b+H2E6sJFgt+k1/+8iSX+AkXJwKtYkjcBZI6WqnEpETJK7QoVE/AwsoJkxcyL15SM4
 ljphOalsZD179vCtdE34gCP2GYQk2ibGr31sZryLy7289eb7+L+MeIvGlZxQWab4paYa
 ekT2etVK8zrQcWHQ8TkVNsHo2WSuF3R94TRTWPQQEK2CPqpL5d2vL+Zvd1DaEXJThbhK
 DzY8WuS9yuvzpB6hOW/2yJngWImioABMQHnZVWC+3CFgUh9/wKx7/llBib2ScooX+Bnk
 MJmDQnRD1yldd3ltoN6dwdt2NEpiRspa8UlpYZjvyuXmoFUR3WUN8OuNlhxtkLXVCppp
 Q82w==
X-Gm-Message-State: AOJu0YymvFff0m2hf8M8TUR/O4BE3FgoWIcdR8qsxT0sluo9122BxXOJ
 LXoHUW0z2Qyiaxl27juz3aRH4cnqt/FhKGfLPuHv4PM3RuSx6wIH6EukOfSbyPHgxO1XaBptL0i
 QtXeHCQrrOpsUDuhg/IM4/Q1A9GocPjNPKTI47KocX2Layqe/LDgiMID31qQuCNcXrWn5Y+DAdS
 ifGUY+tWQN0bg/jNNZ+FIo1l3HXFijRooScnc7BzCiUhf9
X-Received: by 2002:a17:907:807:b0:a46:c09b:f1f3 with SMTP id
 wv7-20020a170907080700b00a46c09bf1f3mr8390477ejb.41.1710957526766; 
 Wed, 20 Mar 2024 10:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5Zx5r74eNhXZfhgJG5SH2zSD9Ut4jqyawrs+DA3asxApbNiexXMDrJi/MSunnoKnvm8HnXg==
X-Received: by 2002:a17:907:807:b0:a46:c09b:f1f3 with SMTP id
 wv7-20020a170907080700b00a46c09bf1f3mr8390453ejb.41.1710957526324; 
 Wed, 20 Mar 2024 10:58:46 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 sd9-20020a170906ce2900b00a4628cacad4sm7529443ejb.195.2024.03.20.10.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 10:58:45 -0700 (PDT)
Date: Wed, 20 Mar 2024 18:58:43 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, gregkh@linuxfoundation.org
Cc: airlied@redhat.com, lyude@redhat.com, pstanner@redhat.com,
 ajanulgu@redhat.com, mcanal@igalia.com, lina@asahilina.net,
 a.hindborg@samsung.com
Subject: Nova and staging Rust abstractions
Message-ID: <Zfsj0_tb-0-tNrJy@cassiopeiae>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

In this mail I briefly want to announce the Nova project and subsequently talk about the first
efforts taken in order to upstream required Rust abstractions:

We just started to work on Nova, a Rust-based GSP-only driver for Nvidia GPUs. Nova, in the long
term, is intended to serve as the successor of Nouveau for GSP-firmware-based GPUs.

With Nova we see the chance to significantly decrease the complexity of the driver compared to
Nouveau for mainly two reasons. First, Nouveau's historic architecture, especially around nvif/nvkm,
is rather complicated and inflexible and requires major rework to solve certain problems (such as
locking hierarchy in VMM / MMU code for VM_BIND currently being solved with a workaround) and
second, with a GSP-only driver there is no need to maintain compatibility with pre-GSP code.

Besides that, we also want to take the chance to contribute to the Rust efforts in the kernel and
benefit from from more memory safety offered by the Rust programming language. Ideally, all that
leads to better maintainability and a driver that makes it easy for people to get involved into this
project.

With the choice of Rust the first problem to deal with are missing C binding abstractions for
integral kernel infrastructure (e.g. device / driver abstractions). Since this is a bit of a chicken
and egg problem - we need a user to upstream abstractions, but we also need the abstractions to
create a driver - we want to develop Nova upstream and start with just a driver stub that only makes
use of some basic Rust abstractions.

In particular, we want to start with basic device / driver, DRM and PCI abstractions and a Nova stub
driver making use of them.

Fortunately, a lot of those abstractions did already exist in various downstream trees (big thanks
to all the authors). We started picking up existing work, figured out the dependencies, fixed a few
issues and warnings and applied some structure by organizing it in the following branches.

Remotes: drm-misc [1], rust (Rust-for-Linux) [2], nova [3]

- drm-misc/topic/rust-drm:  [4] contains basic DRM abstractions, e.g. DRM device, GEM; depends on
                                 rust-device
- rust/staging/rust-device: [5] contains all common device / driver abstractions
- rust/staging/rust-pci:    [6] contains basic PCI abstractions, e.g. PCI device, but also other
                                 dependencies such as IoMem and Ressources; depends on rust-device
- rust/staging/dev:         [7] integration branch for all staging Rust abstractions
- nova/stub/nova:           [8] the nova stub driver; depends on rust-drm and rust-pci

All branches and commits are functional, but the code and commit messages are not yet in a state for
sending actual patch series. While we are working on improving those patches we would like to ask
for feedback and / or improvements already.

@Greg, can you please have a first quick look at rust-device [5]?

- Danilo

[1] https://cgit.freedesktop.org/drm/drm-misc
[2] https://github.com/Rust-for-Linux/linux
[3] https://gitlab.freedesktop.org/drm/nova
[4] https://cgit.freedesktop.org/drm/drm-misc/log/?h=topic/rust-drm
[5] https://github.com/Rust-for-Linux/linux/tree/staging/rust-device
[6] https://github.com/Rust-for-Linux/linux/tree/staging/rust-pci
[7] https://github.com/Rust-for-Linux/linux/tree/staging/dev
[8] https://gitlab.freedesktop.org/drm/nova/-/tree/stub/nova

