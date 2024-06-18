Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DA590D5C0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 16:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5319D10E6BA;
	Tue, 18 Jun 2024 14:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.b="K2JszsMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4910710E6B8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:43:54 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-797b24b8944so522643485a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.com; s=google; t=1718721833; x=1719326633; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H1+SS+CgyscfT+wjW8/qeAG6YffPFvdXGu7/EUf5Kw8=;
 b=K2JszsMQqlmmQe7oZUoQFjT/cBscxeswWRpMlnZWAc4U1TbeOnF2CVRbA/KQ8/A9RL
 l3z8uvUPPuOJMvrDOEbNXOYWizayMHABhHsa7W7vXl0qgFfKPAUdO1zrSQ/2REo+lBFQ
 /15hZHWTCios6lNum2gxR45jhV0YctZSv4W0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718721833; x=1719326633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H1+SS+CgyscfT+wjW8/qeAG6YffPFvdXGu7/EUf5Kw8=;
 b=tw3Z34YVA2mCLyDWjm0wCd/76+jG5fqnvaDBwVF+Z01N2cKMJZKnIJrhv6WXlA7Yre
 H+X81vMlFfyKdR/Oj+CSCG1epwRAYf/1IUbJav42ZpTjc433Wg/+98M2ldJOMK0ZTlBZ
 nQtdHfCjcobS7+7EEKErz9od40CKoozmyNDY7+ADribApKcjF1LJdTiqufzG8bl1R0sh
 7znPn1xNwMp1vaWR5tX0chuu5Ps/yS5jLBArWIw3Bak3omi/+h37JrKpQsc16Wv+Nx2t
 xQsZwewuNfW3xtvjHPVyJ0Z7YqJtC8ha8YAoLdCqEi8a4ObcC6SpEmm2D/MV8zameMa4
 dsQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpIPvTkdhvWgB8NMqxF1PbQoMF+vy4nlcTWq3yGzsyKvklH7onF8ToR2Tyn91fQ20DGBAL6Jglo0CQIP3FRP2/Jy2VxcNcG7w2OTR2b8Ce
X-Gm-Message-State: AOJu0Yws7THztf7kgE3ELJ9MJJQI4mTpRhpaF/jw1HhE0mFHhG3hqVLV
 u/XuDWkiLgkAyNsRshgk7tHBeRpz+0ifIWYysdCvmh65LRPwWAeW8nAp7kFHLUI=
X-Google-Smtp-Source: AGHT+IE1YlRuWEi0vQfDOPjPfHR2PbvrEzE38XoxBE6yNs4Wq+SxKec9MZIMG60RC/XOLzcX9esWng==
X-Received: by 2002:a05:620a:2a11:b0:797:ee31:c39d with SMTP id
 af79cd13be357-798d23f0d1dmr1496021585a.11.1718721832764; 
 Tue, 18 Jun 2024 07:43:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc0cf98sm523962485a.80.2024.06.18.07.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:43:52 -0700 (PDT)
Date: Tue, 18 Jun 2024 16:43:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Direct Rendering Infrastructure development <dri-devel@lists.freedesktop.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZnGdJoCtbIrf4-dW@macbook>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook> <Zm-FidjSK3mOieSC@itl-email>
 <Zm_p1QvoZcjQ4gBa@macbook> <ZnCglhYlXmRPBZXE@mail-itl>
 <ZnDbaply6KaBUKJb@itl-email>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZnDbaply6KaBUKJb@itl-email>
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

On Mon, Jun 17, 2024 at 08:57:14PM -0400, Demi Marie Obenour wrote:
> Given the recent progress on PVH dom0, is it reasonable to assume that
> PVH dom0 will be ready in time for R4.3, and that therefore Qubes OS
> doesn't need to worry about this problem on x86?

PVH dom0 will only be ready (whatever ready means in your use-case)
when people test and fix the issues, otherwise it would stay in the
same limbo it's currently in.

I guess the main blocker for Qubes is the lack of PCI passthrough
support in order to test it more aggressively?

Thanks, Roger.
