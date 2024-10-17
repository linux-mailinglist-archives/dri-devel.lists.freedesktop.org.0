Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E713F9A1D71
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 10:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E3A10E1CF;
	Thu, 17 Oct 2024 08:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AfYLf3QO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F5A10E1CF;
 Thu, 17 Oct 2024 08:43:13 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2e2a999b287so558498a91.0; 
 Thu, 17 Oct 2024 01:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729154593; x=1729759393; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQAB3nnQ+Mdlc/tt0eBAd1ec+dzX44ggYry/kZq7/hI=;
 b=AfYLf3QOsX9ZhB3XAQPYF12xh25nA9V5CgX3ujOXuwkDeIdtcRetx22Y76PVMkxdZQ
 ULTI6C2nN9aKa6qCjdWQgx1ShMMXjOHwTF21HJvig0x+vLa9M/XI0H3O7Upu0e6Nhh65
 MDD9BBWc/GJRGG9hB5X649MUlLkz2P69/aTzHsnT2EJaqusRxAWvAWWqpPiz4Y56+X7i
 VEw39pmJ/5tfVdhjVTJ0LSDmgKbrzXbGGzpXNydq/mM3IH5KKynlHPNe4eeTKbOT3jbr
 PKY2pktiADuOO3d3kYlbdZp0oMP3va3KzeaoxQIg0FFT7+Lu7IAF5j/Qx0jLMHz5DvxS
 bVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729154593; x=1729759393;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yQAB3nnQ+Mdlc/tt0eBAd1ec+dzX44ggYry/kZq7/hI=;
 b=BY5RhF727T1qfV4cxzZIOb8PZ5F/n/zJuE+EZwrQuhU3EjaVNVgsndcIymqejxKzuV
 uvUjsl69vXUjrEuzj3CWp5lWPX5tYNs3obhgfu530yKqGzRRqFZzKIGbK1gIx57b1WT8
 00tEOhz4ttFeoF1LHbBwb2ts9QpVRBkRERiv4xRNQxEB2pRrqAAtFgUibqu+7XHLlfHC
 ZQqulIvYptp01FQyWjGUJ8MhSYVZ0t8u9tkSBama+dLPtUXsftbtNmteAvHQAiRbVZlH
 hp1VLPUtzI45G1StuW6DjBgCSSlsG3MADoM0/DOh37yjnYXOaHEdwlF9c7oeOJzZcRca
 q5Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Z5X4cvC3eQOwzLflgWQCfLHXfPTDGHQWlA1YfiZNJMbjZtUo/ThRRRAd0DSNg4KqJCNp2blsvjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoBBH3y6mbVrwq4x2GkGwvV2HEWmiiO5jAMnQRIEvAz7TAXEt4
 ShgMQPGtiWpQ92wDaXsaUaEBCbaOX+6qxTel9as1mKV6M+2NKc0d
X-Google-Smtp-Source: AGHT+IGyP031j7KiczoaeT0zkXTCu6uPPcWuYBfUrEHy6wZ3NZAs2wt8XjaAOno4+gv2ZLCwzZsYcA==
X-Received: by 2002:a17:90a:d808:b0:2e2:d74f:65b5 with SMTP id
 98e67ed59e1d1-2e2f0ad1729mr23181386a91.16.1729154592825; 
 Thu, 17 Oct 2024 01:43:12 -0700 (PDT)
Received: from [192.168.1.101] (14-202-215-216.tpgi.com.au. [14.202.215.216])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e3e090756bsm1280567a91.50.2024.10.17.01.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 01:43:12 -0700 (PDT)
Message-ID: <65fe0dd4-e7bb-40d1-9b89-7b330984268a@gmail.com>
Date: Thu, 17 Oct 2024 16:43:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Tuo Li <islituo@gmail.com>
Subject: [BUG] drm/amd/display: possible null-pointer dereference or redundant
 null check in amdgpu_dm.c
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com,
 hamza.mahfooz@amd.com, Roman.Li@amd.com, chiahsuan.chung@amd.com,
 aurabindo.pillai@amd.com, Wayne.Lin@amd.com, hersenxs.wu@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
Content-Type: text/plain; charset=UTF-8
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

Hello,

Our static analysis tool has identified a potential null-pointer dereference or
redundant null check related to the wait-completion synchronization mechanism in
amdgpu_dm.c in Linux 6.11.

Consider the following execution scenario:

  dmub_aux_setconfig_callback()      //731
    if (adev->dm.dmub_notify)        //734
    complete(&adev->dm.dmub_aux_transfer_done);  //737

The variable adev->dm.dmub_notify is checked by an if statement at Line 734,
which indicates that adev->dm.dmub_notify can NULL. Then, complete() is called
at Line 737 which wakes up the wait_for_completion().

Consider the wait_for_completion()

  amdgpu_dm_process_dmub_aux_transfer_sync()    //12271
    p_notify = adev->dm.dmub_notify;            //12278
    wait_for_completion_timeout(&adev->dm.dmub_aux_transfer_done, ...); // 12287
    if (p_notify->result != AUX_RET_SUCCESS)    //12293

The value of adev->dm.dmub_notify is assigned to p_notify at Line 12278. If
adev->dm.dmub_notify at Line 734 is checked to be NULL, the value p_notify after
the wait_for_completion_timeout() at Line 12278 can also be NULL. However, it is
dereferenced at Line 12293 without rechecking, causing a possible null dereference.

In fact, dmub_aux_setconfig_callback() is registered only if
adev->dm.dmub_notify is checked to be not NULL:

  adev->dm.dmub_notify = kzalloc(...);    //2006
  if (!adev->dm.dmub_notify) {            //2007
    ......
    goto error;                           //2009
  }                                       //2010
  ......
  register_dmub_notify_callback(..., dmub_aux_setconfig_callback, ...)  //2019

I am not sure if adev->dm.dmub_notify is assigned with NULL elsewhere. If not,
the if check at Line 734 can be redundant.
Any feedback would be appreciated, thanks!

Sincerely,
Tuo Li


