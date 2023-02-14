Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA74695AC7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 08:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A1210E7F9;
	Tue, 14 Feb 2023 07:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C757A10E042;
 Tue, 14 Feb 2023 07:42:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id y1so14679443wru.2;
 Mon, 13 Feb 2023 23:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xy4pf8U3PaAc9XKe8RmRoPJooTfu/zUcpdrWaen243w=;
 b=HtX16xs8UUpsheVvHM28zTRL07ZMTFDjqsWHqRnYbVp03u1EX1YBitkbjkV0InDmpj
 XaL8VqDjn8/uDdqwm4VGFtlsvG5Hp5MCYzIb8eAI+JjxcNsd2qJs7ef7tPJL2SOF9pny
 FUCehzW9ZiyBHKCjCVe2lg72KB3ZhZZWg7jX8XkLW27Azn02xvQH9Qyv4nLYY58NwGSe
 NMXqkBUhz+LCgdM67DBf2+NZVSjF714TazAyc9VrtyMvYho9g1OuM3BYI1Tv5R8Zjq2j
 5n2KvWIL5S7tD/mcbTIqU4ySzsyWsiNO5NweciY6dAtIYNsCLukMa4WeUKrMEbYOsgp5
 ggtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xy4pf8U3PaAc9XKe8RmRoPJooTfu/zUcpdrWaen243w=;
 b=MpZQno4GRc1RfI+SPzI99K7PuN2PgDaLImma1gwqR8Qa3txiaW0+p0qUqbbUJvMJBY
 r2MN78Bb7eRexVeKaEdWd5rAifMSZA8yGty1i8Cg7vDKbcgvhVuFcziTWu6ZgMWneHrk
 Kaiwwz/oSvzAQCZ4lxOto86qW7lRu0iD8uC50Nqtz6A0xazCTlEgAWskLLXLvYFa3wf1
 q5mDlagJdc/nm9qEY8ogNeE5eYnkJQ/wizjjW3uR3iUu5KUrebA65L17GEFKYsc4F6AL
 7diwZ4ZodWx7EogX2a3Xe/YsTDndErwfxD8AQ9rYygxAsgn/MKXCQ9eWxfzt4efbo/l1
 a8SA==
X-Gm-Message-State: AO0yUKVmf1Mbn1AUeDpFEsOOIsqE5EQpX4+vcHRmRM+HTMgIcM45b+jO
 r5PFmQZd2SDRRtosm7vdz6Q5lkHETsU=
X-Google-Smtp-Source: AK7set+7FWO1uxAe7QjT1iovOUZtvLN4s1m5nYKqCUgCnJtvRiGCVltgqpAGXnOGWp+MEeoG+HaSDA==
X-Received: by 2002:adf:e590:0:b0:2c3:db4f:f336 with SMTP id
 l16-20020adfe590000000b002c3db4ff336mr1144669wrm.39.1676360561192; 
 Mon, 13 Feb 2023 23:42:41 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a5d65ce000000b002c561805a4csm1679855wrw.45.2023.02.13.23.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 23:42:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Change TTM from using pfn to bytes
Date: Tue, 14 Feb 2023 08:42:35 +0100
Message-Id: <20230214074238.65865-1-christian.koenig@amd.com>
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
Cc: Amaranath.Somalapuram@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

this is an extract from Amar's earlier patch set with quite some
re-ordering, bug fixes and separating changes into smaller patches.

Background is that we want to use GEM/TTM to manage all kind of
resources which most are not accounted in pages but rather bytes or even
arbitary units (hw blocks for example).

Sending this out so that the Intel CI can take another look at it.

Regards,
Christian.


