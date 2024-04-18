Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6798A9C3F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752BB113CC1;
	Thu, 18 Apr 2024 14:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="2uWWcS5r";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ejosluox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46AE113CC1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:06:55 +0000 (UTC)
Date: Thu, 18 Apr 2024 16:06:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713449214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Idxuchle8AcxxVwUDpWy041qfrtuUfRvGM0E/NVSF/I=;
 b=2uWWcS5rzBA9UwpilUAbugUDdytG6ZhJI7MgLJwTJ/0XfDwYcoNCLh6tjholyWZZNvAWz3
 EKmIqW2hV8HBA6AMsLEEPfHBfJUN9YhwVp1JQDFw5BdzxlllHEh/uPlgS3J1VmWDB77VmO
 R2I8nTGT2qJbPXlE/hBO+vIZyWyJkmjjCo1kfilpME2QmzbFxQ40lz8Upjr9OaycEMce9T
 XhCnWDRW/zZtYCzkpgd9rGfTZ9retKApw4WaJaJi6aooBNmSIjnXXPJnIsM16ulTT3r0oh
 v/hxwVFRJOciB/P5lvgoH05F3wRMlVT8LFZ5eSdOydQnvE4acsXVXFEQedrq2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713449214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Idxuchle8AcxxVwUDpWy041qfrtuUfRvGM0E/NVSF/I=;
 b=EjosluoxqQVNEdbKPkBK1vZISCD5HzUSPH/LPqd0lTe2vCFr85v9qrNJ45ddZJ/CDNZ7tQ
 Q2F9CN4lLBbnyhDQ==
From: Nam Cao <namcao@linutronix.de>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: jayalk@intworks.biz, Daniel Vetter <daniel@ffwll.ch>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tiwai@suse.de, bigeasy@linutronix.de, patrik.r.jakobsson@gmail.com, LKML
 <linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>, Darren Kenny
 <darren.kenny@oracle.com>, chuansheng.liu@intel.com
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
Message-ID: <20240418160652.68df1a86@namcao>
In-Reply-To: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-04-18 Harshit Mogalapalli wrote:
> While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: task hung 
> bug in fb_deferred_io_work()

Which framebuffer device are you using exactly? It is possible that
the problem is with the device driver, not core framebuffer.

Best regards,
Nam
