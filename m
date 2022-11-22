Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402346343AA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 19:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB42610E19F;
	Tue, 22 Nov 2022 18:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC0F10E19F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669141933; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:in-reply-to:
 references; bh=ls59NSxoowl1YHzKUqoYm3Umwpb9DLx70E9cFNt3ycM=;
 b=r42SA0DwiOL65+NfArUpGDbV6z+GbEWK2qOdJkFc2XomKCrLE6QgFb7RQKQsNb20YWjEfE
 u51qN4XQx66gPijxZteWQnSXznbXx05uhctrb/D0NYVfRyilu+s7PANoEubQfVyKUG81dt
 D1TocMiLfCqWaA5mwGK+Yq/E6IlZFIc=
Date: Tue, 22 Nov 2022 18:32:04 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Running into problems with UDMABUF
To: Gerd Hoffman <kraxel@redhat.com>
Message-Id: <G5IRLR.SOU1QOC25SGY@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

I'm running into a problem trying to use UDMABUF and I'm not sure if 
it's a bug in udmabuf, or I'm just using it wrong.

I create a UDMABUF in userspace, enable CPU access to it, copy some 
data, disable CPU access, then register it with the IIO subsystem using 
an ioctl I'm working on (not yet upstream).

In udmabuf.c, the "get_sg_table" function is first called by the 
"begin_cpu_udmabuf", and then called a second time by "map_udmabuf" 
when the IIO subsystem creates a dma_buf_attachment then maps it.

Now the behaviour I'm seeing, is that the first call to 
"dma_map_sgtable" in get_sg_table sets sg->nents == 1 which is equal to 
sg_nents(sg->sgl) and as such is the expected value, but the second 
call to "dma_map_sgtable" will set sg->nents == 0 and I don't 
understand why.

I wonder if you are seeing this behaviour as well?

Cheers,
-Paul


