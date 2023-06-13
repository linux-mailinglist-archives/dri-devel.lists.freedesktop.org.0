Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE9972DE1B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 11:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC94110E362;
	Tue, 13 Jun 2023 09:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89B710E357
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 09:46:15 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 269196606F02;
 Tue, 13 Jun 2023 10:46:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686649574;
 bh=lZqQFMyareOe6OvViczKYe5GS2s6xKP3KTvSq806QXg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IivQOF4OEwPLvGND6J9pvLacvI7FbLafTD6EZ0TEk4ifzHyPsRmAGmYukaozKcPSG
 hjU5S6OamNKUl2sYAXv2UdEZSeJUZcrqcVwvqP62vB/wtOqArRr5QnsnKjxabem2X+
 +qzNP/tT5ISEIUqnogARvFZ86L/56fhSfTXp4T9Nts6OllUoVYjpm8cKktAQJDnQpZ
 niobGup8QvSUAH6EFmBGKsiSMOMInQ0efBGPDykbaksFJ3ooBZ6XEINcfxYN1fAosv
 vGHr6MBXwnusgoQoFcVk2WsODB+stJJ6Jv2RdvXAHv14AgrUz9km7x6UDJtPH7Bp5q
 VrTz54efWNzfA==
Date: Tue, 13 Jun 2023 11:46:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/sched: Call drm_sched_fence_set_parent() from
 drm_sched_fence_scheduled()
Message-ID: <20230613114611.11402411@collabora.com>
In-Reply-To: <20230613094424.2176746-1-boris.brezillon@collabora.com>
References: <20230613094424.2176746-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023 11:44:24 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Drivers that can delegate waits to the firmware/GPU pass the scheduled
> fence to drm_sched_job_add_dependency(), and issue wait commands to
> the firmware/GPU at job submission time. For this to be possible, they
> need all their 'native' dependencies to have a valid parent since this
> is where the actual HW fence information are encoded.
> 
> In drm_sched_main(), we currently call drm_sched_fence_set_parent()
> after drm_sched_fence_set_parent(), leaving a short period of time

after drm_sched_fence_scheduled(), ...

> during which the job depending on this fence can be submitted.
> 
> Since setting parent and signaling the fence are two things that are
> kinda related (you can't have a parent if the job hasn't been scheduled),
> it probably makes sense to pass the parent fence to
> drm_sched_fence_scheduled() and let it call drm_sched_fence_set_parent()
> before it signals the scheduled fence.
