Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C95B69CC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 10:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10D810E656;
	Tue, 13 Sep 2022 08:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCC0F10E656
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 08:45:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C5581063;
 Tue, 13 Sep 2022 01:45:51 -0700 (PDT)
Received: from [10.57.48.96] (unknown [10.57.48.96])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F41D3F73B;
 Tue, 13 Sep 2022 01:45:44 -0700 (PDT)
Message-ID: <5898d7a6-14c2-8e20-abc3-5971a4bcfd85@arm.com>
Date: Tue, 13 Sep 2022 09:45:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/panfrost: Give name to anonymous coredump object union
Content-Language: en-GB
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 robh@kernel.org, alyssa.rosenzweig@collabora.com,
 dri-devel@lists.freedesktop.org
References: <20220912164413.2181937-1-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220912164413.2181937-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 12/09/2022 17:44, Adrián Larumbe wrote:
> Building Mesa's Perfetto requires including the panfrost drm uAPI header in
> C++ code, but the C++ compiler requires anonymous unions to have only
> public non-static data members.
> 
> Commit 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
> introduces one such union, breaking the Mesa build.
> 
> Give it a name, and also rename pan_reg_hdr structure because it will
> always be prefixed by the union name.
> 
> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7195
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Ouch! It's frustrating how C++ isn't quite a superset of C. However I
think we can solve this with a simpler patch, I'd appreciate testing
that this does indeed fix the build issues with Mesa with all supported
compilers (I'm not so familiar with C++):

----8<----
From 492714a7dff0710ac5b8b457bcfe9ae52b458565 Mon Sep 17 00:00:00 2001
From: Steven Price <steven.price@arm.com>
Date: Tue, 13 Sep 2022 09:37:55 +0100
Subject: [PATCH] drm/panfrost: Remove type name from internal structs

The two structs internal to struct panfrost_dump_object_header were
named, but sadly that is incompatible with C++, causing an error: "an
anonymous union may only have public non-static data members".

However nothing refers to struct pan_reg_hdr and struct pan_bomap_hdr
and there's no need to export these definitions, so lets drop them. This
fixes the C++ build error with the minimum change in userspace API.

Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7195
Fixes: 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 include/uapi/drm/panfrost_drm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/panfrost_drm.h
b/include/uapi/drm/panfrost_drm.h
index eac87310b348..bd77254be121 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -242,7 +242,7 @@ struct panfrost_dump_object_header {
 	__le32 file_offset;

 	union {
-		struct pan_reg_hdr {
+		struct {
 			__le64 jc;
 			__le32 gpu_id;
 			__le32 major;
@@ -250,7 +250,7 @@ struct panfrost_dump_object_header {
 			__le64 nbos;
 		} reghdr;

-		struct pan_bomap_hdr {
+		struct {
 			__le32 valid;
 			__le64 iova;
 			__le32 data[2];
-- 
2.34.1

