Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C197815CD45
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 22:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7906E409;
	Thu, 13 Feb 2020 21:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFA66E409
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 21:30:39 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id m13so2987712pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UjVzNJBK83ikW0TIlSzbtH1BgwGaguqWKS1Uh0bPMR8=;
 b=dTiM0Mz/slq1uUJKEcofNHhqiUiy7xB79p/2HWlp3laiLYDRlanVmv3B8fHGkWuNmG
 yzNk+Kf2OaG7UYgZ9A7v4voYtOSO6A7JeYhJo4K0oLnKldbLXjrdldMSlwwdfd9hwmAj
 u3qY3vh6IN6M7aP/dB6pXf6BpjJZw5VLmyqlMxeSS1SU9MFZW7BjJRRCw2X6oT0i0VVT
 luAobTHEoP9utgoebAvgXbND66i1qqR0Qpm/fnGAxfLog89sj3CDq4TVNufkTkJcBehj
 JbRpscT+pLn99ueAjpSGZ+SeX4RvFIrleYVCnr4h6WxpM8JnKtlu1zNzIjIK2zFNVQVo
 2eXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UjVzNJBK83ikW0TIlSzbtH1BgwGaguqWKS1Uh0bPMR8=;
 b=uCKBZdqSfpGXSdu2Rmw/3DFsJ9/Jfu3iVo13DfmIy7mN/ZEQtVC8eIeNCulDIfAiog
 P3aYFJqlFzZ8ERlvNgntEpr/YbbGGKcyyZ60yAOWPjesYnPLSMqfj9bYv3r84apaPIuN
 RTOf/LWyPKcpQ9argbdqFWA79W3PjRXatV5bqAwzlyxKZrLB9F9yzNIP3DIHcccJA+pT
 d035uyQrnG7CHB6tUWC5FFegmC8YW8zwyyVfwyNJWNxOYNACqynLH4/Ens0Uv1zT04oN
 6RxI3P2TbDYjT5zdXFi2wslYgKzDhEhd/Ge0BGUrkeOWnosyy69EQGJj2GGUQKvJ3i5R
 Oj0w==
X-Gm-Message-State: APjAAAWutqljbJxtNd1Xue4HZIv8rSrFLaW+PmQT5s5ha5uJxtIjLv63
 NSNvq1qrKx4y0OhnphMY9QY=
X-Google-Smtp-Source: APXvYqzp6i4zNTju3fPQFtSvmNIUZa6xjTh/ZBrude8YNxGPXiOUyGFvHEPV8DEPau1cdMHscsnW5g==
X-Received: by 2002:a17:90a:20c4:: with SMTP id
 f62mr7709341pjg.70.1581629438674; 
 Thu, 13 Feb 2020 13:30:38 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id s130sm4346683pfc.62.2020.02.13.13.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 13:30:38 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Date: Thu, 13 Feb 2020 13:30:33 -0800
Message-Id: <20200213213036.207625-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
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
Cc: wanpengli@tencent.com, joro@8bytes.org, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, kraxel@redhat.com, pbonzini@redhat.com,
 vkuznets@redhat.com, jmattson@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Host GPU drivers like to give userspace WC mapping.  When the userspace makes
the mapping available to a guest, it also tells the guest to create a WC
mapping.  However, even when the guest kernel picks the correct memory type,
it gets ignored because of VMX_EPT_IPAT_BIT on Intel.

This series adds a new flag to KVM_SET_USER_MEMORY_REGION, which tells the
host kernel to honor the guest memory type for the memslot.  An alternative
fix is for KVM to unconditionally honor the guest memory type (unless it is
MMIO, to avoid MCEs on Intel).  I believe the alternative fix is how things
are on ARM, and probably also how things are on AMD.

I am new to KVM and HW virtualization technologies.  This series is meant as
an RFC.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
