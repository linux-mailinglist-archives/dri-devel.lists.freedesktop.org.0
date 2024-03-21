Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF0885C19
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 16:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAB110E49F;
	Thu, 21 Mar 2024 15:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="YFaNDsZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5533 seconds by postgrey-1.36 at gabe;
 Thu, 21 Mar 2024 11:53:43 UTC
Received: from xmbg7.mail.qq.com (xmbg7.mail.qq.com [101.91.43.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C90210E0DA;
 Thu, 21 Mar 2024 11:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1711022016; bh=CijDDPXIIKYijD0oU6bytFzYpJFbs41y0dCnEbbMEmE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YFaNDsZXxmKxMYKQmXv4qTnQXTQvXHQWiDof8rHF2E6zFGcI0ETk+HwdjkRMnYo/v
 vmZtwkKqkrmcobVon9tagqD/bckVvk0kYA056I+4GhC01FE1K/EbA4bidJ5LLD6X0U
 q56Slb+JSUebtp0k2/93UVfKGqauF/yhYZKdlGnE=
Received: from localhost.localdomain ([153.3.156.52])
 by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
 id C6E2A2A5; Thu, 21 Mar 2024 17:49:46 +0800
X-QQ-mid: xmsmtpt1711014586tr1sopbsu
Message-ID: <tencent_864C9D9720448AC02448E31A5A53C3803007@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoZgDWhwFckWueoxRu1QK8cEr3VHGTtrQE4542GylxBh/fqzsv+S
 VJfMmkUTBwOcG+RPggxAfE1P7MX317RESSqPGtCoSkFh8WGBhhu9TwKYU47q8P++OsGYwVuq6SoF
 DM6sllukwQd4EYBMx5Nrze1aRjJBmgyihDz248GKjI4nSi+QeBkestUgpcf8XRePeLmQ8QPHeLRC
 e3Hxfxt6CG0Ukmf4IALP3n/KL6iz3gUYOXM4/gfofZC5qYKjDU01BBICzuFPdm+J9E5caIxDfh7f
 F5YFgYgGMunjAWFe3uLXdLx3lsCkRHMdd/jluVIBSxnFzJIUb5tZ6Rf71w2ys+EXr8w/47wIE+Fa
 Xs//Ac/lrOfm3VzIxgoAIYcivCLphSsNSISKJF1O1LQw5Nj/80WZeWveRHI+9ZFLB9Brw6kEuhlS
 XtfRlt1dUFjWRLsQgGd8Jt3ndWfuAeCih8a57Z1WV3iRkhBeDUhlnlmoHdqxtjO78nnUIUUHFUDe
 ZI31E1BJyvkvSomMmebhqZBBmTDfLfUT6V1s65MEjl+4bgPrgpRVcAKBXteKWe95g1vVC6x2THwF
 27yUhvyQ3FJbCBS+223pxKdCdwb6Pgkqj/ljpNd/jYrQErrY1E/EvVTpCKUZ60Laee9ycgagj0fd
 GYHazn9wUTom1Bk4M62GqPfdYenM8QHjY8Sh0zyjgysnx+SsZ/O4R899KkHeWdL7rjqxNIR29e3i
 c/IOmL9/JNiH3O96eFDt1ipREiMt6LkAzOFxtXV9IlnZkNrb0Q6fQpVWYXXM3FCdLlcTb+shtIII
 ahBlEGe2sk8wmp+sYIGtsKgXsAyZDZlzoHdqkD90Ao23xlSTwiBeJIthbhn0UReMywROdCXUXVTX
 7X2zKHYoHxugiRMIOw/Ilw7lwIXUR2riPVWjmryRDq8CBCICsFnwnPXabNUCp/xlQkJY0agQM4Y/
 3VqWwV7icg0MHvOMPbIx0N5bOa6s2e9gpA78gLcBd6LR3m747ryQcLszJR5KVStgS2AeAjKPvAfA
 OYbX3hoW354O2P3ed6s7W91/4W0Udl+qxoa4VfxA==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: linke li <lilinke99@qq.com>
To: lilinke99@qq.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: use READ_ONCE() to read vma->iomap in
 concurrent environment
Date: Thu, 21 Mar 2024 17:49:44 +0800
X-OQ-MSGID: <20240321094944.64732-1-lilinke99@qq.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <tencent_1A51A82501181FD23618C68685EBC405990A@qq.com>
References: <tencent_1A51A82501181FD23618C68685EBC405990A@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Mar 2024 15:37:52 +0000
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

Hi, I want to confirm the status of this patch and whether need any
additional information.

