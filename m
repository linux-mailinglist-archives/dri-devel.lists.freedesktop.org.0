Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095939ECACF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 12:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572FC10E3A8;
	Wed, 11 Dec 2024 11:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YQxW6jR+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D5510E3A8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733914856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xeXK6oo6a/cFPofBTRfrRWLI2MChLj5r9dEbz7oo2dQ=;
 b=YQxW6jR+pcQDG2aEbK4Ig0BIgczg6W9gj1xOrdskCHpaUR1KQwKdrdLhU8h4Zyffir4Pm7
 LAsJo2aufZnbzYiN7+b0Bxyto2IyKaaacNn5BnjGQX5vNJKvNblSmuBxzRwxJVVX9odMk2
 NHdk1Jd35NV4AT3ZAiuq+jVKoXAPCRg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-Bm02yziOMgWbDPbWeitF5w-1; Wed, 11 Dec 2024 06:00:54 -0500
X-MC-Unique: Bm02yziOMgWbDPbWeitF5w-1
X-Mimecast-MFC-AGG-ID: Bm02yziOMgWbDPbWeitF5w
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-7f3e30a441aso4407225a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 03:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733914853; x=1734519653;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xeXK6oo6a/cFPofBTRfrRWLI2MChLj5r9dEbz7oo2dQ=;
 b=OL9JgSyPbDJ4O3BJ3VNjLccYwIA8bCBfMUsO3TxXI+oroCo32pprjQyUsv7WIpsv96
 ZxGKtTI0n5hh/UV+OBuZI/RHV2zYUT9Gnn5sE0TerHXlXJPIpHwxPIhADieiQXjkD6rM
 DSLJKNOPeX/FNQggOVQRp+lTFp9nMhud3Hn2sIP92KIeN9TdENxozzesGkBgkSO6XmQ5
 BKMdmR2cj4K5+wI35n5E8MVe4nX22pYU1jiqA15KDhohBEpN9SKzPxQdGbJd7HjOZPMC
 J53mGSvRSRRI1nkRGMvwAzC0M5MWxLoBn+GPspMHNWN1F2BXk0ayild7gxgMkQloZx4V
 ioPA==
X-Gm-Message-State: AOJu0YxEc4MRK4/eGOTLIQAfQ3n8ASdNS4rSU2vxpbPojVTMY/QXp3QA
 +Z75M04PgpKwXlSjGu5QmOat/lCS06sA9BMvk2mSyY34p4y+gjtc2XMMc4BnnNxKlWREzAk/rvJ
 57t8dAYn3gLNViUdqL2HX6N9COf7yL0bBDQgIscEytaKtNZpD/qAHB24s1IH6JBNbFZbFdgaxvw
 sv
X-Gm-Gg: ASbGncub25y7CftHBiBgj+q6aGD7e6FxxRuF6C4MU5D0YCssJFtVWMy6OBa/+5zYB+t
 6ceozjK+oH5Jpm2Bkvtv2g7p2v7++TDjkWsMk58jSjO7JDc9iKyqIh02Yd4fLLrh8TzNeO7BTat
 U68uNCXFTZWO4JOQ9YHUEMLbjpT7ZOBP/FLq0wl953mj1PzI3UrUOOawh7IxLSfKEbKAXejHgz6
 5XxZXsQXoOLYLqQvWu+Pq9liwbNfmguFGkco0mqT1EPlU2E/ZX0n8y6jNDDSn8DBZkLqerr/k4v
 HffO
X-Received: by 2002:a05:6a21:39a:b0:1e0:d73b:15e4 with SMTP id
 adf61e73a8af0-1e1c13dd187mr4396433637.29.1733914853675; 
 Wed, 11 Dec 2024 03:00:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESCpXx9KQdJ0iGvt/X0i6+dpwHXQlu6/SbcCXNHePo1jbyJA0XeNWSEB0Lbs2aldNMT3Meug==
X-Received: by 2002:a05:6a21:39a:b0:1e0:d73b:15e4 with SMTP id
 adf61e73a8af0-1e1c13dd187mr4396407637.29.1733914853416; 
 Wed, 11 Dec 2024 03:00:53 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725d8e5393csm7198945b3a.48.2024.12.11.03.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 03:00:53 -0800 (PST)
Message-ID: <868200a94a19f4dc4558ec40d80ad9a8bbc0beab.camel@redhat.com>
Subject: DRM GPU Scheduler Maintainership
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Cc: dri-devel@lists.freedesktop.org, matthew.brost@intel.com, dakr@kernel.org
Date: Wed, 11 Dec 2024 12:00:45 +0100
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bJoW2qOC96SyYciNl10bfmKML3TqXE-W2H02jZ_M2jU_1733914854
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luben,

haven't seen you in a while on-list. Are you still up to maintaining
the GPU Scheduler? You're still on the MAINTAINERS file.

Greetings,
Philipp

