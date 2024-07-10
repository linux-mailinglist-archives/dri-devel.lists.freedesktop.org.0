Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738192C9F6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 06:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B065210E5C1;
	Wed, 10 Jul 2024 04:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6619D10E5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 04:43:11 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-6bce380eb9bso3454807a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 21:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720586591; x=1721191391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBYghxQmqV/MFATMMEglTXAf1WvrRLlEEQWG723lE6o=;
 b=iD8ne9xgbrypPEmEADgDc/hr9I5kcyVND1WJiXd4dHUVs4XUfNUcU8RcoFoj37igBU
 KH8dA5Pfn79zrGpgbyEI/RI1wQimON4uh6FNfeQPQDeuyPqadQ46WmayxQkyA1wij6yd
 T1B64uR0jwMVEQcVhLvkMnEI8aXC5V3vBBqjVFdYoaxScooUNk4qDZQqiEFVpSJ7r80G
 dDZhtYi5xfE1teQxaHyPQN4ZdilrNP1GQeMlo92j4JD5aIGHLoU3ufSsB3Qi3rkrmBHt
 pVg5WaTvGU8d91pdjstRzCB1NkQYjHXvE7d7v6a4rCDAaK8b185RIOXmLBIgf5fXU9Vo
 R3jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/s86DakqTgCe7w3ONNUfWrLrcBQO7Ize3p3HXG4m+PmXRUQnj75pvNXNZyV+5oxsLOfI+RL3gTtfCgbUSMKVgfYbEOpHzZEznwHgEc3kc
X-Gm-Message-State: AOJu0YyWnqlIBdcxYm5I2QmroZwTRj/sYNY/ZZvuSkCUDMn6c2EJV5DH
 NSjuUgSL8gLM/yunUF+FFASlCn1Tno3z/yZyxZnelZhmkKJpYzXu
X-Google-Smtp-Source: AGHT+IEAO4qJLwa4pIrOQy3qP7xw1m9erjS4/J/aulalRNzfb4Pguda20bTz3MpfO10uaj2g1qbm4g==
X-Received: by 2002:a05:6a20:daa5:b0:1c2:a69c:3cd9 with SMTP id
 adf61e73a8af0-1c2a69c3e93mr2514416637.54.1720586590826; 
 Tue, 09 Jul 2024 21:43:10 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c99aa9277csm10919612a91.53.2024.07.09.21.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 21:43:10 -0700 (PDT)
Date: Wed, 10 Jul 2024 13:43:08 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Ashish Kalra <Ashish.Kalra@amd.com>, airlied@gmail.com,
 bhelgaas@google.com, dakr@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sam@ravnborg.org, tzimmermann@suse.de, thomas.lendacky@amd.com,
 mario.limonciello@amd.com
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
Message-ID: <20240710044308.GA3755660@rocinante>
References: <20240613115032.29098-11-pstanner@redhat.com>
 <20240708214656.4721-1-Ashish.Kalra@amd.com>
 <426645d40776198e0fcc942f4a6cac4433c7a9aa.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <426645d40776198e0fcc942f4a6cac4433c7a9aa.camel@redhat.com>
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

[...]
> pci_intx() calls into pcim_intx() in managed mode, i.e., when
> pcim_enable_device() had been called. This recursive call causes a bug
> by re-registering the device resource in the release callback.
> 
> This is the same phenomenon that made it necessary to implement some
> functionality a second time, see __pcim_request_region().
> 
> Implement __pcim_intx() to bypass the hybrid nature of pci_intx() on
> driver detach.

Squashed against devres branch, thank you!  See:

  https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=devres&id=37c9f6c55cfd63a9e38a98b5aa1d7da75845c2b2

To credit Ashish, I kept the Fixes: and Tested-by: tags.

	Krzysztof
