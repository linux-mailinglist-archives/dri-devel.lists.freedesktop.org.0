Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD123B5A2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9586E440;
	Tue,  4 Aug 2020 07:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050E66E02D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 14:47:44 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id q3so26277517qkj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=jSEcpjJOquc529ZwoycPhflNQKRcL97Z3GUPK/MTFhg=;
 b=NGJ+cGs/7Y5yanvxauvBQNlpaQtun8x5OXswBR95fjESI+Q1GyxIm26mBIJiQZlchx
 DnHpQPnaiAYiQeJ7fbILu6QdY5Rd11V8/qKJe4l/2w1iWVLomfjMRhY7F1HbDB+a88/v
 OxW7fJVYu/9qupGnZQbIDl8RQ39QYHWJjpj6Y7eEVD2A8NOnmSLcJvTqsh8RSUHTZPrm
 iB78LpIkLOgboZguy+rRN/6HLRUkZASiQtIdBkfmKC7u09IfxeH6wtHsiiiO6m7p/yy5
 JixVWy5wqO/esbMdb7V3i86xLFulz50ivT2vhoOcOZ+NFnlgeqV1YkGRMJJ5EjFVX0il
 hJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=jSEcpjJOquc529ZwoycPhflNQKRcL97Z3GUPK/MTFhg=;
 b=hGh7diA1+1A58JqilnfmANCCMf/eh5eh9Pn9qqSL6n8X/K5XGZwTPl2PoGJ3Bwh7Ut
 xxDiEUEfj7GlaaKbW656V2uGhleyPOMsomy6TOWyxIEs5sV8ruCCSmae8WAPJtBj7i2K
 +iz127O/NC7F4cKEo9c0jLgjKzlvzpToRSuUsAX+9NLZscNC3UNyCD7KCgvPTEfyIEl4
 oPXYSAGbF2nMrdO+kt8lceSUACwqZ8bCcnqU/Mnh5Bc5JEIUkBd7m0kEKr4g/hrZ6vtA
 HjlAQ1JiogRSrN8Er7VkLWWYeVwMUYoBYE90jf7FmOK7zXGWgYAkPf6p4z1GqKqQzDXT
 ir9g==
X-Gm-Message-State: AOAM530IqrLAhbktGgPydDnaqZP45K+dW9OAvD3VIpbqK16mLxIbEjb0
 jbIjOmqu3DX+b+PkaWUZyUbccA35BxngtzI5vQ==
X-Google-Smtp-Source: ABdhPJw7sHEqkxXBQdZEh6QBRcoghAHfysqJXJXhfAsQDkKtCR//v760mqThiImnXfcrSB5dpdxJ6/pM/TKRNguNpQ==
X-Received: by 2002:ad4:4482:: with SMTP id m2mr15332118qvt.102.1596466063346; 
 Mon, 03 Aug 2020 07:47:43 -0700 (PDT)
Date: Mon,  3 Aug 2020 14:47:17 +0000
Message-Id: <20200803144719.3184138-1-kaleshsingh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH 0/2] Per process tracking of dma buffers
From: Kalesh Singh <kaleshsingh@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: linux-doc@vger.kernel.org, kernel-team@android.com,
 Ioannis Ilkos <ilkos@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 linux-fsdevel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since debugfs doesn't have stable abi. This patch series enables per
process accounting of dma buffers using trace events.

Kalesh Singh (2):
  fs: Add fd_install file operation
  dmabuf/tracing: Add dma-buf trace events

 Documentation/filesystems/vfs.rst |  5 ++
 drivers/dma-buf/dma-buf.c         | 29 ++++++++++++
 fs/file.c                         |  3 ++
 include/linux/fs.h                |  1 +
 include/trace/events/dma_buf.h    | 77 +++++++++++++++++++++++++++++++
 5 files changed, 115 insertions(+)
 create mode 100644 include/trace/events/dma_buf.h

-- 
2.28.0.163.g6104cc2f0b6-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
