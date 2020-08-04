Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBE223C6C4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949996E511;
	Wed,  5 Aug 2020 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202686E4B1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 18:20:16 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id v12so14360374ljc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 11:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7ab9dgq8B8KdhCdKDB1Fbso0T3wS/7dRI84QUk0MD9Y=;
 b=YoEFJY0CS/1+lz4j+o6LZIogXyAzeP2qdq+2N21cOIH4RbNPr+E3RTiXlTQRvayFIq
 vucdcFagcB+ZAFs1CKdcUt2I8uUvWLuCmhHzciz/EpEKzVrFbwwlpWFKRAeEv1ZXiJGB
 TzpIFMr3BOvH4ihMzz1u2Ofp3s9fjwMeFGkL80zOqMD5uDKYl2trroK0gT6L4HWQA9yI
 OfhDr3vg9ZoYCS7N80smzfWgrYg/e9Xy/3C1KhpXyw/n6MMI/Wm5R1jS5gia9HcOj0MK
 lyb9OcomAt2EtevRWsOhYK62s45F6KdWOBg6m1hh6XB58gOXS4B/iKfoPkQ/IFOTOae9
 hy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7ab9dgq8B8KdhCdKDB1Fbso0T3wS/7dRI84QUk0MD9Y=;
 b=kcGLqy/FSI0c25EEPhgmMhxPVzEobxcfn9n4aO5BMT1LpXfUrIzuYViX2AoRF7ZYI5
 L67AiBevMItSKGUEP+xAGSZnn7pBVJ6KE50qKt7QLhENm+VcVt5p2LIW1WuEUdapk/qb
 ro259NOOq/dUaw7Aga21746C22MMuQd2YiJYed/8k5GDFE4fpBFHpnvA5lC3FE/FiStx
 zaSzw2vQtma6OLc9x0mKMcEIiBDYggLKK8r2yBtMOcJQeYEcgyNBpTNeeQ5WthnffV7D
 lkBdFoLDE+lEsm5qRolx0scxorqQrj4tQnJPAu9X/yLkKZf9UHe58DZVgTOC75DRn9Oc
 4mqQ==
X-Gm-Message-State: AOAM530viD2ECkuPTDe3BDoZiFoN4h8hLye9i85Pqu+QD70v6EZiLKIF
 44Mu+OCIHzPq5cKShq2HBNjG3s7cIQR/VmP+XmMUw7nNzw==
X-Google-Smtp-Source: ABdhPJyVDF39fVxMkK3LA72303pOlaCls2f72f8wUQWs4i1C0JE6wftDe+fhkhc1dq601qGXW0hDTQG1UGWNXEv2r4M=
X-Received: by 2002:a2e:b0c9:: with SMTP id g9mr5048044ljl.65.1596565213516;
 Tue, 04 Aug 2020 11:20:13 -0700 (PDT)
MIME-Version: 1.0
From: Yiwei Zhang <zzyiwei@google.com>
Date: Tue, 4 Aug 2020 11:20:02 -0700
Message-ID: <CAKT=dD=_8daRz2h9pCvRQV4bvM6Wu6QGsBu7676-Jujfaf-Tuw@mail.gmail.com>
Subject: Question about per process GPU context global priority enforcement
To: dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Peiyong Lin <lpy@google.com>, Prahlad Kilambi <prahladk@google.com>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi friends,

For Vulkan/EGL, upon creating gpu contexts, applications can ask for a
system-wide higher priority levels via VK_EXT_global_priority or
EGL_IMG_context_priority extensions.

I'm curious if we have certain rules(some form of process privilege
check) in the kernel to limit non-privileged ones to never go beyond
default system-wide gpu scheduling priority. (e.g. not allow random
app processes to contend the GPU queues repeatedly/infinitely with
high/realtime priorities)

Many thanks,
Yiwei - from Android Platform Graphics Team
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
