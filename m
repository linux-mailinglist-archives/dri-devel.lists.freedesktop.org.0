Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD7C3EFDF9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDB389358;
	Wed, 18 Aug 2021 07:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6FB6E479;
 Wed, 18 Aug 2021 07:41:20 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id j1so2058219pjv.3;
 Wed, 18 Aug 2021 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E3tKLo4xSINmwLRhCWFdK6hj3HPWsZp310jfHIOH2bI=;
 b=eYlqI7+uh+RIUCvEG+ElTKQ65oYiO/7b9n5s4gD+lLB6dI3+1tBTrfM+E9gHq8+ghC
 pG+mnIdCtT+Qw/TcAMOTN1jsKNfeHJwUKNjPciJDepeHxgQuMRRs7kyHxyN3OR70HFEk
 fH+FOFElAQ4Gsek+UHpdno02wP1O8QQA6kKroGAfCuSk73VvPdce0uYe68NM9b0/lhWN
 +ViMb30Poox2EIE3XtkHQvZtKdTkqedODzSILqubxYNdgynB3qc8Ix+Nz5Uqdi4f6qGm
 3QkmjB9cvkubT2qFaKfHNev6sn1lvzQ9lLvI0mmtvOsFiagT4KeuiRaSXnwiqAQmm3v2
 i6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E3tKLo4xSINmwLRhCWFdK6hj3HPWsZp310jfHIOH2bI=;
 b=EyIYx18MzFvlEiusbIRGw8dtQ1Vu2io2POXzw8F+FfrpuSfhQWxSMn3v0wA2LSSzuc
 NzVfPZusfaSvxF6hcAlIcawXErM8Z3sXXCdpZmP8sThszQk7W5DXfl03fEBWhJ9ByBev
 rW3AlkGGCxZRtepO7INJC8zB6/N78MOyRDummrAG5U+DcAYFYWphP7lYyfzwaRyZhlB5
 eXcyHt9K+arGuj91HgnT2NBrhbD0jvca0mdS0ExKIQDq8mW9Oz2F2GaOecfqw++e8OrL
 I5E75unOv/IhG+IlNnkdAluA1y7yazkIfKWo1N4twgQf99UahpQrJ0PAgYYGnP9dVqtW
 UiXQ==
X-Gm-Message-State: AOAM530AwQrQ3v6JMucH32PMMaJHT17elOs4luyL2Ew2jW6X98LT3Saa
 XUXI7Y6XhhNBRVBgAj4/oxg=
X-Google-Smtp-Source: ABdhPJyntCa9RBP+wiR85wtfYtfjM9dTewB7E46OvMfEVp35CNo8y0LFchz5LQwPRQnlto9UE/Tv5g==
X-Received: by 2002:a17:902:a406:b029:12b:c50a:4289 with SMTP id
 p6-20020a170902a406b029012bc50a4289mr6303191plq.56.1629272480446; 
 Wed, 18 Aug 2021 00:41:20 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:41:20 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v3 8/9] kernel: export task_work_add
Date: Wed, 18 Aug 2021 15:38:23 +0800
Message-Id: <20210818073824.1560124-9-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The task_work_add function is needed to prevent userspace races with
DRM modesetting rights.

Some DRM ioctls can change modesetting permissions while other
concurrent users are performing modesetting. To prevent races with
userspace, such functions should flush readers of old permissions
before returning to user mode. As the function that changes
permissions might itself be a reader of the old permissions, we intend
to schedule this flush using task_work_add.

However, when DRM is compiled as a loadable kernel module without
exporting task_work_add, we get the following compilation error:

ERROR: modpost: "task_work_add" [drivers/gpu/drm/drm.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 kernel/task_work.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/task_work.c b/kernel/task_work.c
index 1698fbe6f0e1..90000404af2b 100644
--- a/kernel/task_work.c
+++ b/kernel/task_work.c
@@ -60,6 +60,7 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
 
 	return 0;
 }
+EXPORT_SYMBOL(task_work_add);
 
 /**
  * task_work_cancel_match - cancel a pending work added by task_work_add()
-- 
2.25.1

