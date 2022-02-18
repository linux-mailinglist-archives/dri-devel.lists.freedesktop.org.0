Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 125144BB3B6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 08:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B9010EB42;
	Fri, 18 Feb 2022 07:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6300110EBC2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 07:58:12 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2d07ae11462so36618207b3.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 23:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=URNN4JDAS2rJK/SsmuwfW0pd7j7Yza7iayBlpkhGFLc=;
 b=EBGQU4gek4jI2VHo57UusHs/wBde2oMRrnCtCmvYuBRGiig/b+r8mypTt+pMzb70F+
 eui57kZL0D/54jmqGjPrmsWd0gCCmIddw38zfF9pbmDCKJlhAdFSEiYaxzW6GmFO49Yu
 4RQaHEq87uRGZVdETZV+edy95vXUKC33J17G8BU6e3WahR+nFckwqtWorOj6MMQ/YOvZ
 gl2yOMRPf+OuLe+iUFLdgXX42Wt9q4ukxNsPwtPrcQkgE8bBuiANjsLn54dhHyW0HIeI
 DXlmWM+XgNzhDKEWkVKRqXrhzm++Sv6+QkC4DoMdzkdUGfb51BKxH9jR5kdWZcjQ0pa2
 EbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=URNN4JDAS2rJK/SsmuwfW0pd7j7Yza7iayBlpkhGFLc=;
 b=tHJZJtn/JFvm+jf7TfuUY8qYyTJZbXBgqvrVkvxufeAyyZTpBHDSJiTk3y3rRmJc5C
 yb3wj8OghckjvvkhpVZ9CDEwUid8P0y2/a+4uvrO2QmEwlX6pHTCHwSBBiIHALLwyPLQ
 Vev1IQV3cuk23z7a5Y95HaEBsekRyCJGoxlpBuvOCpnS7q6HJwAFvp+J4r0lijRYw+11
 1ndSW095LVwA67dhz0bVDrcHSUmadSXXeowqjL7wPoOqFexZly0jibJBPNkxzG6IgdeC
 Nje04CRAfNHKCo9A8Xm4QUwM9VrBaeuM32bufdiu5rtAIS5B5WnrzhIIw5m6S/ZAHuZG
 ZnWQ==
X-Gm-Message-State: AOAM530VHTv/XkDAJ8zBd1hePBJVPAZWPK9iZlSdGZSGKFmn4mMZEmQi
 HftyPYu2BdCGsh+be6OZ121CzSckBbcTEg==
X-Google-Smtp-Source: ABdhPJzkXNI0mIB4QIL1eB63wzi9+92ViwlJdKnUh9PGSnuYSdteX3Ps478m374ivFv5Kh1qd98wF5JtWHxwTw==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a81:f611:0:b0:2cf:aa3c:ab17 with SMTP id
 w17-20020a81f611000000b002cfaa3cab17mr658303ywm.410.1645171091604; Thu, 17
 Feb 2022 23:58:11 -0800 (PST)
Date: Fri, 18 Feb 2022 15:57:27 +0800
In-Reply-To: <20220218075727.2737623-1-davidgow@google.com>
Message-Id: <20220218075727.2737623-5-davidgow@google.com>
Mime-Version: 1.0
References: <20220218075727.2737623-1-davidgow@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH 4/4] kunit: tool: Disable broken options for --alltests
From: David Gow <davidgow@google.com>
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Gow <davidgow@google.com>, linux-rdma@vger.kernel.org,
 felix.kuehling@amd.com, x86@kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a number of Kconfig options which break compilation under UML wit=
h
allyesconfig.  As kunit_tool's --alltests option is based on allyesconfig a=
nd
UML, we need to update the list of broken options to make --alltests build
again.

Note that, while this does build again, it still segfaults on startup,
so more work remains to be done.

They are:
- CONFIG_VFIO_PCI: Needs ioport_map/ioport_unmap.
- CONFIG_INFINIBAND_RDMAVT: Needs cpuinfo_x86 and __copy_user_nocache
- CONFIG_BNXT: Failing under UML with -Werror
ERROR:root:../drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c: In function =
=E2=80=98bnxt_ptp_enable=E2=80=99:
../drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:400:43: error: array subsc=
ript 255 is above array bounds of =E2=80=98struct pps_pin[4]=E2=80=99 [-Wer=
ror=3Darray-bounds]
  400 |                         ptp->pps_info.pins[pin_id].event =3D BNXT_P=
PS_EVENT_EXTERNAL;
      |                         ~~~~~~~~~~~~~~~~~~^~~~~~~~
- CONFIG_PATA_CS5535: Needs MSR access (__tracepoint_{read,write}_msr)
- CONFIG_VDPA: Enables CONFIG_DMA_OPS, which is unimplemented. ('dma_ops' i=
s not defined)

These are all issues which should be investigated properly and the
corresponding options either fixed or disabled under UML. Having this
list of broken options should act as a good to-do list here, and will
allow these issues to be worked on independently, and other tests to
work in the meantime.

Signed-off-by: David Gow <davidgow@google.com>
---
 tools/testing/kunit/configs/broken_on_uml.config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/kunit/configs/broken_on_uml.config b/tools/testi=
ng/kunit/configs/broken_on_uml.config
index 690870043ac0..546482b0bc4d 100644
--- a/tools/testing/kunit/configs/broken_on_uml.config
+++ b/tools/testing/kunit/configs/broken_on_uml.config
@@ -42,3 +42,8 @@
 # CONFIG_ADI_AXI_ADC is not set
 # CONFIG_DEBUG_PAGEALLOC is not set
 # CONFIG_PAGE_POISONING is not set
+# CONFIG_VFIO_PCI is not set
+# CONFIG_INFINIBAND_RDMAVT is not set
+# CONFIG_BNXT is not set
+# CONFIG_PATA_CS5535 is not set
+# CONFIG_VDPA is not set
--=20
2.35.1.265.g69c8d7142f-goog

