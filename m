Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE533153767
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C846E9D3;
	Wed,  5 Feb 2020 18:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB9A6E9D3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:19:58 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 2so1607915pfg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kIv2EuI4V+Hnm8FGBCB/JTn+kuyf7xKhLdjbo7G73jg=;
 b=abaQoM5NDTItvTo+4sAO29qubHwKjbKNTaxSaxso7ijR3OueHXc55CZVm3FJ20DxN+
 JLkKEyPSLF4Yhvq9rngl9+NvKYHB6rJMoinM9+C6yrKRZ27EH48tAB2rSuR8S9NrtlGJ
 MT8U2JDPY4uVD/pFeNefTn92DrN6Dq66PjU9DDVUZDRXl90FpQlBrmzT0610zmFDpaKo
 QKWkOZVaSXwkkcVSIR4/cAkcvFgmC4NdD+Xy7BsUPd8joZroE2RNmy0X5Dlqc22xfQMQ
 kLljkhKykk0/pYdBenh2W2Gs+ubl68kV90QEhF80JgBQji46wBXmeAGZc1EBvqzQ9MhV
 8Jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kIv2EuI4V+Hnm8FGBCB/JTn+kuyf7xKhLdjbo7G73jg=;
 b=IcUcGFoQjXiw5rW3Xc6rYHPXjQVivUW2ta/cKFhv6tXF/h6JY6CG5A8Cwl0sBFfz68
 57zg0/jfx17Y5TU22fGXsCllpcfNyGMxyVOsKJKGeGk1k8x5y6Rkb9+2rXw8IB+0TCdj
 JXUXgFyuw6SbODu1lMMfWws9THM1XlOHgoB0uO8Qf8BAzh539r3Te+++QgtslU6gkjhJ
 6vsQqAaWtQ1w8V4vKJ9qs6H08mejmhinNlW9C5uAMshTvNJ8eYqHNfbqJhsKGCafxGBO
 R5LRJZkxbZVoG8u8WKmYDUeuBvd1F95TwOWsmnse4xirswPSAcGFIYqwqrv0kglsWMwZ
 dmqQ==
X-Gm-Message-State: APjAAAWavSgzl8GkmCa//XNtU4hTubsEXH5Q6buPk21Iir6JLJyC5Eoi
 gqRQr8yump3GPXTdWRjPBf6y5KWj
X-Google-Smtp-Source: APXvYqzMo1eIfdkz+Renk9yWlPds0fy5VYtx74mY1USP40H0yQTZ/E4lU/SVd1ufMmqd80jD8sVitg==
X-Received: by 2002:a63:3e05:: with SMTP id l5mr37988483pga.293.1580926797726; 
 Wed, 05 Feb 2020 10:19:57 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:19:57 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/11] drm/virtio: fixes and cleanups for vbuf queuing
Date: Wed,  5 Feb 2020 10:19:44 -0800
Message-Id: <20200205181955.202485-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
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
Cc: kraxel@redhat.com, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series consists of fixes and cleanups for
virtio_gpu_queue_fenced_ctrl_buffer, except for the last patch.  The fixes are
for corner cases that were overlooked.  The cleanups make the last patch
easier, but they should be good in themselves as well.

The last patch changes the disable_notify mechanism to call
virtqueue_kick_prepare only once in virtio_gpu_enable_notify.  It should be
more efficient than doing that after each command is queued.

There is a follow-up patch that replaces the global disable_notify state by
command-level bools to disable notify for individual commands, so that one
process cannot affect another process.  I can include it in v2 if you want to
review it together with this series.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
