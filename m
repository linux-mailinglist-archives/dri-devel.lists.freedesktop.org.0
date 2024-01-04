Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B29824482
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 16:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE73310E4A2;
	Thu,  4 Jan 2024 15:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE88310E4A2;
 Thu,  4 Jan 2024 15:05:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so3337015e9.1; 
 Thu, 04 Jan 2024 07:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704380747; x=1704985547; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=40Pr59xQ77yAHpGPte/XvKNnRlZJ62H/Bahv1ggqmTE=;
 b=gJu4WVbdKBETz22u/eSlA0bnWd2kG4hjJ4S4VCfS7qC51Tn3OQ/+/CWZkOOS5XGX50
 GjoO4XOw4AJs9Y0m4ORDqx/yZmuibwo3sm5ubgloCoDBArojKAIZZCYhzNuWrDyRZ9BC
 1kaEG1obFJXBGPHqtTNIM0AcyxEKNv9/n49ywORlGWpkbeIkRTfPQurab59Dkaphm2dy
 h15phwe/yXGFuiVrN2Q9gffkCWL2h2B3wMQ5ppW17ulZnqmdyn/r8hYozdUUzG7u9QNm
 S+e8bLvYGYhed0RGXXhdZAPY5aUGTmoVNxOl8aSPHQbdeeYDKfeCmlAUSQAAKJo+bvST
 0o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704380747; x=1704985547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40Pr59xQ77yAHpGPte/XvKNnRlZJ62H/Bahv1ggqmTE=;
 b=J9XE8Iq0R8VJB2h9IY2+jiPeAY19+aYlf9koQoPyb/Vh6J6JZ9Vn9pfn8TsQ69y39i
 dYM1CVfYXKPvjFHkMDz42tsa7B1nb0+1r7Md2umVT1/MHcp6qpFmNYXTWv9lYsLjEm5B
 Npikw3kehmBUAKEhG2JaDU5xj6NhUWVsP+iEJtNUB0psneSn+E6u93QBBjNJ1FjDV7o/
 5PjrYmSgMzclMAQcMoavmMOey3ZQkataZeBroi+OkV7DnxpsVnC2O3znnilO7mcMpYAG
 cipWn8S/0oqMVxiWSenOtSNi2ocXBFhgRVjxZsn+T2YqBJORzly90ZfjRe4W5cyAIF+v
 t8UQ==
X-Gm-Message-State: AOJu0YwSuFWTtrebvY6DBIashgw5S5xYx64u6UnOsu7TWU4C7Uuzu7oU
 gVyXwqjN+QjjLxnefyEidCD1a7KYhzxhwQ==
X-Google-Smtp-Source: AGHT+IHL0hqnEfQEAMZVJER9O6UCJdYcwMn4Bkq3flfAqxl+1ofPBRd85pEEIyXKSY5kpjxj5UlqRg==
X-Received: by 2002:a05:600c:3592:b0:40d:56c1:f73 with SMTP id
 p18-20020a05600c359200b0040d56c10f73mr492143wmq.3.1704380747183; 
 Thu, 04 Jan 2024 07:05:47 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:157f:4100:7224:7d9c:a8ca:3fe9])
 by smtp.gmail.com with ESMTPSA id
 hn33-20020a05600ca3a100b0040d5ae2905asm5845420wmb.30.2024.01.04.07.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 07:05:46 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, nouveau@lists.freedesktop.org,
 jani.nikula@linux.intel.com, kherbst@redhat.com, lyude@redhat.com,
 zackr@vmware.com
Subject: Rework TTMs busy handling
Date: Thu,  4 Jan 2024 16:05:41 +0100
Message-Id: <20240104150545.1483-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

I'm trying to make this functionality a bit more useful for years now
since we multiple reports that behavior of drivers can be suboptimal
when multiple placements be given.

So basically instead of hacking around the TTM behavior in the driver
once more I've gone ahead and changed the idle/busy placement list
into idle/busy placement flags. This not only saves a bunch of code,
but also allows setting some placements as fallback which are used if
allocating from the preferred ones didn't worked.

Intel CI seems to be happy with those patches, so any more comments?

Regards,
Christian.


