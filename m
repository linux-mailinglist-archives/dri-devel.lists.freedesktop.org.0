Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E376B66ABED
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 15:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CFD10E067;
	Sat, 14 Jan 2023 14:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E6410E067
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jan 2023 14:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673707251; bh=KawwwvIcAopLS+CUzfaq6FN0lch5RTPmyrMhaJt02v0=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=DWoGChTmpx8Hi/MvtApluGi9U0dqxY3ffHnPILbm+q1GnR7v92R9rHCICpnryyDkH
 jFtRNYbEHSmjwqLSxSqBMYRbCbcxydOdpyrDx5uI9lXmLZgk11INjHQWVkZ7zbSkUY
 MN+pMEspXGbyIB6tifuURqG0eYgOvaBMyQ8oy+Xc=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat, 14 Jan 2023 15:40:51 +0100 (CET)
X-EA-Auth: cIwL7Ka0hJ+AGbeVlaowRBnhJqla2UVvoZQAoVUfAHAR2tdceZTOQcTouU8Ku1/wcCtCCVf10W/RRSSg8uSEN/NIgoADa2h8
Date: Sat, 14 Jan 2023 20:10:43 +0530
From: Deepak R Varma <drv@mailo.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: nvkm_devinit_func.disable() to be made void
Message-ID: <Y8K+61ZOag5fXu8M@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,
It appears that the callback function disable() of struct nvkm_devinit_func does
not need return U64 and can be transformed to be a void. This will impact a few
drivers that have currently implementation of this callback since those always
return 0ULL. So,

Change from
	  8 struct nvkm_devinit_func {
		... ...
	15          u64  (*disable)(struct nvkm_devinit *);
	  1 };

Change to
	  8 struct nvkm_devinit_func {
		... ...
	15          void  (*disable)(struct nvkm_devinit *);
	  1 };


I am unsure if this change will have any UAPI impact. Hence wanted to confirm
with you if you think this transformation is useful. If yes, I will be happy to
submit a patch for your consideration.

Please let me know.

Thank you,
./drv


