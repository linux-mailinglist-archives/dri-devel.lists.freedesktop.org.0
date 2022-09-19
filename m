Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF285BC30D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 08:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4A810E3AA;
	Mon, 19 Sep 2022 06:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2169A10E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 06:44:15 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E4936601A05;
 Mon, 19 Sep 2022 07:44:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663569854;
 bh=t44ml2mzBQmP+N6G0ew4Z0ab+fnOH7KiAr2hEmY23xw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dHsXO6hemfoVbk0cZKsSZO42K/YnQREw7GYbMB8leEid1J6Zii0RUKAsXXTRXd7/6
 AM6ua9OHSEhgFcwHE6qCknHbkFGjOezOHFfTbMpD36o8OUcUhlznTdd75/AItsktO3
 fxecFupQeFeHWY0TuaXOvWxNHdNZ4v6eRnODapPPjoiJxYdmuDCk2GIIV/cgzDhDAc
 SmKuiTgLBm/rD+8cSaNBMAxVo1GbPzKojUdMd3UzGZs+0fwg6M+IDIEW16xwVoctQy
 D1rLgP5IVXwMqM5Lkp2D5Sg4xCErHCaoyZuccQ4gm3TMAG3TLKrrOOmgKgcDzy6RsU
 ByGmiskMfDc5A==
Date: Mon, 19 Sep 2022 07:44:11 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Give name to anonymous coredump object union
Message-ID: <20220919064411.lmco2cyb4lpb5etu@sobremesa>
References: <20220912164413.2181937-1-adrian.larumbe@collabora.com>
 <5898d7a6-14c2-8e20-abc3-5971a4bcfd85@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5898d7a6-14c2-8e20-abc3-5971a4bcfd85@arm.com>
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
Cc: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

On 13.09.2022 09:45, Steven Price wrote:
>On 12/09/2022 17:44, Adrián Larumbe wrote:
>> Building Mesa's Perfetto requires including the panfrost drm uAPI header in
>> C++ code, but the C++ compiler requires anonymous unions to have only
>> public non-static data members.
>> 
>> Commit 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
>> introduces one such union, breaking the Mesa build.
>> 
>> Give it a name, and also rename pan_reg_hdr structure because it will
>> always be prefixed by the union name.
>> 
>> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7195
>> 
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

>Ouch! It's frustrating how C++ isn't quite a superset of C. However I
>think we can solve this with a simpler patch, I'd appreciate testing
>that this does indeed fix the build issues with Mesa with all supported
>compilers (I'm not so familiar with C++):

I just tested your changes on Mesa and they do fix the build.

>----8<----
>From 492714a7dff0710ac5b8b457bcfe9ae52b458565 Mon Sep 17 00:00:00 2001
>From: Steven Price <steven.price@arm.com>
>Date: Tue, 13 Sep 2022 09:37:55 +0100
>Subject: [PATCH] drm/panfrost: Remove type name from internal structs
>
>The two structs internal to struct panfrost_dump_object_header were
>named, but sadly that is incompatible with C++, causing an error: "an
>anonymous union may only have public non-static data members".
>
>However nothing refers to struct pan_reg_hdr and struct pan_bomap_hdr
>and there's no need to export these definitions, so lets drop them. This
>fixes the C++ build error with the minimum change in userspace API.
>
>Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7195
>Fixes: 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
>Signed-off-by: Steven Price <steven.price@arm.com>
>---
> include/uapi/drm/panfrost_drm.h | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/include/uapi/drm/panfrost_drm.h
>b/include/uapi/drm/panfrost_drm.h
>index eac87310b348..bd77254be121 100644
>--- a/include/uapi/drm/panfrost_drm.h
>+++ b/include/uapi/drm/panfrost_drm.h
>@@ -242,7 +242,7 @@ struct panfrost_dump_object_header {
> 	__le32 file_offset;
>
> 	union {
>-		struct pan_reg_hdr {
>+		struct {
> 			__le64 jc;
> 			__le32 gpu_id;
> 			__le32 major;
>@@ -250,7 +250,7 @@ struct panfrost_dump_object_header {
> 			__le64 nbos;
> 		} reghdr;
>
>-		struct pan_bomap_hdr {
>+		struct {
> 			__le32 valid;
> 			__le64 iova;
> 			__le32 data[2];
>-- 
>2.34.1
