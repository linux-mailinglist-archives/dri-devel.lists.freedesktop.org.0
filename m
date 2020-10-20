Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC72933DE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 06:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF16D6EC13;
	Tue, 20 Oct 2020 04:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CD86EC13
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 04:16:14 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-Yr8BKKhTOguoC1gVy-HpSQ-1; Tue, 20 Oct 2020 00:16:10 -0400
X-MC-Unique: Yr8BKKhTOguoC1gVy-HpSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E8861868417;
 Tue, 20 Oct 2020 04:16:09 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C778C5D9D2;
 Tue, 20 Oct 2020 04:16:08 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC HACKY] ttm don't allow multihop moves
Date: Tue, 20 Oct 2020 14:16:05 +1000
Message-Id: <20201020041606.1701145-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an RFC for a hacky idea I had to at least move the converation forward.

The branch with this in it is:
https://github.com/airlied/linux/tree/ttm-bounce

it won't apply to any other tree as it's based on all those patches I posted and some other refactorings.

The basic idea is if the driver gets a move request from the TTM core that requires it to bounce the buffer
through another domain, it returns -EMULTIHOP and puts the domain details into the mem_type, the core
code then just does the mem space for the new temp placment, and retries the final placement again.

I've tested on nouveau that the code gets executed (a printk prints at least), and it all doesn't burn
down, but it's very lightly tested.

It does allow getting rid of a lot of driver code to handle bouncing moves.

I'm sure this could be prettier or done in a very different way more effectively, but hey this was
my chance to misuse an errno value.

Dave.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
