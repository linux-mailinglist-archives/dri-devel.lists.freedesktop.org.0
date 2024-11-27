Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6479DA711
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 12:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0A410EAA9;
	Wed, 27 Nov 2024 11:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jA5JvupG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F9510EAB1;
 Wed, 27 Nov 2024 11:47:09 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21288ce11d7so52706685ad.2; 
 Wed, 27 Nov 2024 03:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732708028; x=1733312828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kh6bddqnZi0Jk8P/+StFE9apNLAJyAYwCrJWGP3mQEw=;
 b=jA5JvupG8Skia0MSmNnW3bG/izlQhLZzrr/6em2dkFU65LGQjeI5arLV5qc6U/E9jI
 UKhpXwWCCh6LDk7MUDle1ZsH7COkTStMKlyH8TeaHyh2TL/AxaMAccOIb2z9G784410m
 lWze8R0wDUZZMnLCGFkn+2XRAQ/BCT9rFLFjrL9clZ2erpeQatPQEy+aUvCYBUqPMm7B
 P0K4HDzJf8tB5fPCzAldiDvjQOoTfqciN7DI2VqI7G/yT8nxVTqDoJmpOPmkugyOPm5f
 Yes48rBmMr5h+4bTbBw2yni3+mDKt/9jJ2qYEbfU9N2u9QhoJt8cWzCLh2GBsGl64bMV
 wGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732708028; x=1733312828;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kh6bddqnZi0Jk8P/+StFE9apNLAJyAYwCrJWGP3mQEw=;
 b=W0GwCSgIIhJVlZsPcX3R2mF8MVk5liIGHmKzHGHc+OTJzDS4PgsYUAPMZKy7FZY9tW
 J9gF40DYjCNXr3qjOw6fYMD66CFrhfc5wbXCp9XfIhoYWDVBI4985zCgPsVouLz+hqU8
 E5OInGE2nEw1P2qTtkD9h2CuLdRYA+ijQw52R/MmyFD2EqUX1eTQ+AyRXFsvX0qefebw
 d0em5uqTUWUNvIhMcyne5TeAdzHjV8D8l4+1PsVXdIofB44aHWeDpW3Z5MPpfADFSMkS
 6AtM6eaAvl7J2Lm6QQ0urZF1qnuj34pRMfEi4ixKW5U5aG3rP05MBa5O5LWBegDIZZLm
 XYZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSdYrxN1aUwrXQUvi/50Id8L7z+0LJJ9aT6Hhd84ftfD6D44nA+XtEwmUxU43qzi+JS/zFDpXTYHHE@lists.freedesktop.org,
 AJvYcCW6xRcu+hV9Q21VZSjJpjpc0BgWc5Ubdm5wbnVgHNI7LplsT+xJo0QjdIWFlz095DTsQGvdbZSM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMFZK74qVM3KVZXX/JEAo/RYWR+DUCJUcMRl0YXQCiWV9P1S8/
 6/hBkPJAV7b0ltJIdkTQ8Sxw5b/x4OJ065crmTT/WLzbVxe/0oyNstMJHkG8ejk=
X-Gm-Gg: ASbGncsVV2hyp0mGdsnvmeHWbuv69/RTM5SAbCC0Rt0bkUfZTvdrrNt7hc3he2zSdKZ
 6YI9rp6P3mOCOMsTFqSwwpCNsTm8FBFM/HOFvv4hJEznJ5rwHj8sxzPsQTYbOSrLBtP4TFQ1D+E
 0w1/EmMth/OJ3xg3K07Zoo9Fx7u9nwtUKVsMWx8U2L/+uKDgBxo6OcMrIsjBpCGSj51xySp2St/
 IdaPLT51PX2mHPenUQnG7gOK27JjE2leGsyhIkHCwdI6lFshf8Ky42b9YvnmjDZBL5stdmqP1i8
 +A==
X-Google-Smtp-Source: AGHT+IHihpjvcI1BlDLzyC9VZbD85R46tQlCudAYuP0VXXMA7mlJGUngy95fEvQGSagVPN/Fafe39Q==
X-Received: by 2002:a17:902:e88b:b0:212:55cc:6ba7 with SMTP id
 d9443c01a7336-21501095f82mr27411875ad.4.1732708028190; 
 Wed, 27 Nov 2024 03:47:08 -0800 (PST)
Received: from miley.lan (c-73-162-202-2.hsd1.ca.comcast.net. [73.162.202.2])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2129dbfa834sm100805645ad.117.2024.11.27.03.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 03:47:07 -0800 (PST)
From: Mika Laitio <lamikr@gmail.com>
To: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Hawking.Zhang@amd.com, sunil.khatri@amd.com,
 lijo.lazar@amd.com, kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lamikr@gmail.com
Subject: [PATCH 0/1] amdgpu fix for gfx1103 queue evict/restore crash v2
Date: Wed, 27 Nov 2024 03:46:37 -0800
Message-ID: <20241127114638.11216-1-lamikr@gmail.com>
X-Mailer: git-send-email 2.41.1
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

This is the corrected v2 version from the patch that was send earlier.
Fixes:
- add cover letter
- use "goto out_unlock" instead of "goto out" in restore_process_queues_cpsch 
method after the mutex has been acquired in the code.
- fixed typo on patch subject line and improved patch description

Patch will fix the evict/restore queue problem on AMD 
gfx1103 iGPU. Problem has not been seen on following other AMD GPUs tested:
- gfx1010 (RX 5700)
- gfx1030 (RZ 6800)
- gfx1035 (M680 iGPU) 
- gfx1102 (RX 7700S)

From these devices the gfx1102 uses same codepath 
than gfx1102 and calls evict and restore queue methods which will
then call the MES firmware.

Fix will remove the evict/restore calls to MES in case the device is iGPU.
Added queues will still be removed normally when the program closes.

Easy way to trigger the problem is to build the the
ML/AI support for gfx1103 M780 iGPU with the
rocm sdk builder and then running the test application in loop.

Most of the testing has been done on 6.13 devel and 6.12 final kernels
but the same problem can also be triggered at least with the 6.8
and 6.11 kernels.

Adding delays to either to test application between calls \
(tested with 1 second) or to loop inside kernel which removes the
queues (tested with mdelay(10)) did not help to avoid the crash.

After applying the kernel fix, I and others have executed 
the test loop thousands of times without seeing the error to happen again.

On multi-gpu devices, correct gfx1103 needs to be forced in use by exporting
environment variable HIP_VISIBLE_DEVICES=<gpu-index>

Original bug and test case was made by jrl290 on rocm sdk builder bug issue 141.
Test app below to trigger the problem.

import torch
import numpy as np
from onnx import load
from onnx2pytorch import ConvertModel
import time

if __name__ == "__main__":
    ii = 0
    while True:
        ii = ii + 1
        print("Loop Start")
        model_path = "model.onnx"
        device = 'cuda'
        model_run = ConvertModel(load(model_path))
        model_run.to(device).eval()

        #This code causes the crash. Comment out to remove the crash
        random = np.random.rand(1, 4, 3072, 256)
        tensor = torch.tensor(random, dtype=torch.float32, device=device)

        #This code doesn't cause a crash
        tensor = torch.randn(1, 4, 3072, 256, dtype=torch.float32, device=device)

        print("[" + str(ii) + "], the crash happens here:")
        time.sleep(0.5)
        result = model_run(tensor).numpy(force=True)
        print(result.shape)
Mika Laitio (1):
  amdgpu fix for gfx1103 queue evict/restore crash

 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

-- 
2.43.0

