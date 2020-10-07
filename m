Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ECC28604F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 15:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621326E8EF;
	Wed,  7 Oct 2020 13:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBE66E8EF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:38:10 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C154E206DD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602077889;
 bh=Mpv/aTxKaeDudHnV4Ej5vGfK/C5gaMOaXnmfsI2Oxl0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jzj/O9dxuxCHZZq/nwHmglxIXAG6NIw9Xx+RnHXskrQGeWcmdoWkeAN8BymWDAf0D
 NX/wALqPl6guBzmfvTsAM++5y6nlzYdgoPsfvMMKixaTbx8scAw2N3ml+k45Ij40vv
 Q5wLrQy7gBmKXzrp7h3hL8IQVWRms4gVmDGUj9jA=
Received: by mail-ot1-f45.google.com with SMTP id m13so2184797otl.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 06:38:09 -0700 (PDT)
X-Gm-Message-State: AOAM530HPdl5+lAurvDkRxzVg9Kkx91M0yqLlTaiLhJ8kDmqUiT9MNXx
 1a2wf1VkbszTBNuiq06RKIW9bOCYscHo5UJ6HQ==
X-Google-Smtp-Source: ABdhPJy8jP3QJk42AKfJxsNMS6m7FaGHNIqs5htPFMFOAl5cmfQ7APnJKHjm8EcErUop7OP/qfcQG27qMBbMFATO1pk=
X-Received: by 2002:a9d:1c90:: with SMTP id l16mr1971782ota.192.1602077889033; 
 Wed, 07 Oct 2020 06:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
In-Reply-To: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 7 Oct 2020 08:37:58 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+GL98DP7wVMOED7DnJynmOKA-vMFbe9Mkht_DaBvBPeg@mail.gmail.com>
Message-ID: <CAL_Jsq+GL98DP7wVMOED7DnJynmOKA-vMFbe9Mkht_DaBvBPeg@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Add support for KeemBay DRM driver
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, edmund.j.dea@intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 3:03 PM Anitha Chrisanthus
<anitha.chrisanthus@intel.com> wrote:
>
> This is a new DRM driver for Intel's KeemBay SOC.
> The SoC couples an ARM Cortex A53 CPU with an Intel
> Movidius VPU.
>
> This driver is tested with the KMB EVM board which is the refernce baord
> for Keem Bay SOC. The SOC's display pipeline is as follows
>
> +--------------+    +---------+    +-----------------------+
> |LCD controller| -> |Mipi DSI | -> |Mipi to HDMI Converter |
> +--------------+    +---------+    +-----------------------+
>
> LCD controller and Mipi DSI transmitter are part of the SOC and
> mipi to HDMI converter is ADV7535 for KMB EVM board.
>
> The DRM driver is a basic KMS atomic modesetting display driver and
> has no 2D or 3D graphics.It calls into the ADV bridge driver at
> the connector level.
>
> Only 1080p resolution and single plane is supported at this time.
> The usecase is for debugging video and camera outputs.
>
> Device tree patches are under review here
> https://lore.kernel.org/linux-arm-kernel/20200708175020.194436-1-daniele.alessandrelli@linux.intel.com/T/

The bindings should be part of this series.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
