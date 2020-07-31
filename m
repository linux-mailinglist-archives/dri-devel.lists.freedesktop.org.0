Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B2233DE0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D906E996;
	Fri, 31 Jul 2020 04:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779796E996
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:05:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-p96lg11dNy-9gyJHS1vR3g-1; Fri, 31 Jul 2020 00:05:29 -0400
X-MC-Unique: p96lg11dNy-9gyJHS1vR3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 840BC80183C;
 Fri, 31 Jul 2020 04:05:28 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29A82100238C;
 Fri, 31 Jul 2020 04:05:23 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/49] ttm mem manager refactoring.
Date: Fri, 31 Jul 2020 14:04:31 +1000
Message-Id: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I started pulling on a thread, and it led me down a hole.

This series refactors the ttm ttm_mem_type_manager object into
a driver owned, allocated, subclassaed object.

It starts with two minor fixes for some bad assumptions in two drivers.

Enables a new init path, ports all the drivers to the new init
path, and cleans up the old init path.
Enables a new takedown path, ports all the drivers to the new takedown
path, and cleans up the old takedown path
Wraps all access to the memory managers in the bo_device in a wrapper
across all drivers.
Make debug callback optional
Enables driver to provide their own mem manager objects
Subclasses the objects in all drivers and makes them into driver owned object
Drops the bo_device arrays of pointers, and some unneeded links and
struct members
Cleans up one api.

I think I'd probably want to merge all this via drm-misc, so if I can collect
acks/r-b from driver maintainers that would be good.

This is also based on Chrisitan's work to remove init_mem_type, so it won't
apply until he's finished getting all of that into drm-misc.

https://cgit.freedesktop.org/~airlied/linux/log/?h=ttm-refactor-mem-manager
is the tree I've built this on top off, so it's probably going to get rebased
but the code should stay mostly the same.

I've done some boot testing on nouveau, and I hope to test it on vmwgfx and
amdgpu soon.

Dave.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
