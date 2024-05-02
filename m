Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947808B9C5A
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 16:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87C810F244;
	Thu,  2 May 2024 14:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VTKP8R/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F16F10F798
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 14:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kCQZNGhAOjYKiPZKGE+05pX2aMeFieH0QJc09CNwW/s=; b=VTKP8R/nS86c6GCmqOL25lWRgp
 VzCpKpUGdiL1b2rN7JAlMQi9JtH8JYBAP0O5qjRTMGNGl+ieQRut9SuakeCmxg/pDFe8kFO75pxbK
 ztFSLSk97Z615LviXiINnVWduKQdFzSTc/M4ielOd/QHA/346iTfQhDj3GWOuEpi56TeZfcBHEMJq
 5sP/H/II2uV+mhlFzKE35+TU/hxgIO20Y2EzsL7ktAn91jXdzkIGPfjssURFXPOMNF76nALSMJQSH
 7jOzXCpF9q2CYrSs8dQkGAMbj1mY3eBAiricx/AkCV1R6ugAcsiblukBHitAttAteD6tAkNBUsIFy
 HZPHwLQw==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s2XVQ-0031Qt-3i; Thu, 02 May 2024 16:33:51 +0200
Message-ID: <7236d76a-8e6d-4a8e-9e4e-e2644c5df2d7@igalia.com>
Date: Thu, 2 May 2024 15:33:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: drm scheduler and wq flavours
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi all,

Continuing after the brief IRC discussion yesterday regarding work 
queues being prone to deadlocks or not, I had a browse around the code 
base and ended up a bit confused.

When drm_sched_init documents and allocates an *ordered* wq, if no 
custom one was provided, could someone remind me was the ordered 
property fundamental for something to work correctly? Like run_job vs 
free_job ordering?

I ask because it appears different drivers to different things and at 
the moment it looks we have all possible combos or ordered/unordered, 
bound and unbound, shared or not shared with the timeout wq, or even 
unbound for the timeout wq.

The drivers worth looking at in this respect are probably nouveau, 
panthor, pvr and xe.

Nouveau also talks about a depency betwen run_job and free_job and goes 
to create two unordered wqs.

Then xe looks a bit funky with the workaround/hack for lockep where it 
creates 512 work queues and hands them over to user queues in 
round-robin fashion. (Instead of default 1:1.) Which I suspect is a 
problem which should be applicable for any 1:1 driver given a thorough 
enough test suite.

So anyway.. ordered vs unordered - drm sched dictated or at driver's choice?

Regards,

Tvrtko
