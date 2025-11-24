Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CEAC83DFC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5758310E0C6;
	Tue, 25 Nov 2025 08:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z7OPPOdv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF6710E2C6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 13:41:37 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-63c489f1e6cso145929a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 05:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763991696; x=1764596496; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9WiU+fUOoaOr/u86tVujVIv6iGVYl9gAhlsoumb2r9I=;
 b=Z7OPPOdvWHPB5gRczldk+0NLb0WAp2TU0pUMX49Sv615+XFUMWHIzChldvnZ6adQZ8
 bA7su7u878ATRekSWAvAXh82rn157vNkBF6+KoJxkgdBF+2u9a2X9y9najgFNE/zK4+9
 WflknO50P6JZeoIFTLZtFnjauCP1HnfBLx6QyJ/c+/72ocHIfzNtN1C8ZVh6bjBlqOn1
 z9e5TUgt7R/lNNCsOvaODPD5e04+k8eko5/kuBUqEp3+ctIF7pXM0uOcg5WBMJT2kDMG
 31IKS+FIgUjP0ZTtcjfZxuScEFIXXSXykqgs5wH3Z2fwUk8G3AcgCcMFEuPNAADoHbav
 dpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763991696; x=1764596496;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9WiU+fUOoaOr/u86tVujVIv6iGVYl9gAhlsoumb2r9I=;
 b=bYwSGH+UNhTsK+aUSUm7qK1n9y3ZjFMwN2Oo3FSB3IXr8hkvOfXozhMmenj3Yfxvo5
 4fnUAbn1aXE/bydDrStk3Jem9IAS4DDvpJrZD1MWUpKgdMBHifIs2Vs8xpRSTHzrObL1
 KChO4ekMwxttqn7V/VO88utho5XtQcdXaDrsT4pBJ65UwaSlZ9sb+HgF87B+9jWwlXPQ
 Ct7bg+u1W2QXnXt2f+I20rmXmfgWAy+YXaPqu3LtXchJhDAJuTdVnfgS3kL6Xarc2P3c
 hfb269jnG1J8C0lxcryd3LG838NeVEi6ZiurAu1JrSSewm10sLULjE5ahJWQQB4S7/zP
 Mwnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrBqKMZ5srilutvjPc3ZdeMbmEv6B1Sg9KOxvXPk8ERIkVJ/r9zlM4yCDSMONXH2RH5lW+FGyfdTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/GpSVmXh43DncauStNbfL//gRbrtxa1CQLNbg7i9509pACwqn
 4ToVLj7uv6LPwkhL0p7bDA9MgOeKD808vGUKCrPr1/1bh/Y35jDCDQMKx52STeZgQwA8DZSjOAE
 iZs2OWEYPn8H0OXmYnXgBvRQe1leHeA==
X-Gm-Gg: ASbGncvSGqdGwVv7pZUSQysZ/iuAwb0NocACBc1yuNMIuh/55PS3JgPZMiuum5kmx9B
 5j1bQO/v2Md7Qpb0rGCtU5s09Qsid5Sx9W+kY9UEPw/1vzaqloIWigh6LNtZN9F9Xyxg5s8qzsq
 Tz1zTp0JO55SO8nOcIMJuIMznmwgcRXThbb/farmhVnX7cs9Iuj367bAEdi3KFg94w+R30OXP9n
 MypFd5LrvzMWar7apX+SuZ0k8+cmkapVrBDhrYmf+/7XC7ZPz/ey/uSCohnKJDGNTU2lmgDEf7P
 5WH9z64deNAexIjEfu+DAz2E4WI/ydwlmXZ7DzI88UIrmkl1chSpSjSi
X-Google-Smtp-Source: AGHT+IGfVsoGjX5Sxy1dySCnIJESUxRCyabV8O63iUc1Le7y4o1Ai34RI3broPwT+Hj5nWquSwgUdOuJhlEdpZCZaGc=
X-Received: by 2002:a05:6402:40c1:b0:640:ef03:82de with SMTP id
 4fb4d7f45d1cf-645550809a7mr11399195a12.4.1763991695708; Mon, 24 Nov 2025
 05:41:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com>
 <9bc25f46d2116436d73140cd8e8554576de2caca.1763725388.git.asml.silence@gmail.com>
In-Reply-To: <9bc25f46d2116436d73140cd8e8554576de2caca.1763725388.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Mon, 24 Nov 2025 19:10:59 +0530
X-Gm-Features: AWmQ_blM0KWu7aUv8ArY5r4a9fsKMGwJG-SFJqiYxWiv8fYwoMfNFeWPT1HOzl8
Message-ID: <CACzX3AsXD_C50CY0KYNjt5yMY4hm-ZDLQU5dQSJAmP3Duerauw@mail.gmail.com>
Subject: Re: [RFC v2 06/11] nvme-pci: add support for dmabuf reggistration
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com, 
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 25 Nov 2025 08:03:45 +0000
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

nit:
s/reggistration/registration/ in subject

Also a MODULE_IMPORT_NS("DMA_BUF") needs to be added, since it now uses
symbols from the DMA_BUF namespace, otherwise we got a build error
