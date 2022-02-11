Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FBC4B2639
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB3A10EB8A;
	Fri, 11 Feb 2022 12:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B5010EB8A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:09 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g7so322553edb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L46JTT3b86tebJ2B8FHYVsFw/Duw20CLn6vO+bSkxpo=;
 b=qvHNPwIKDGJeaKMApJWxNOG7QjufrtEi1zoWrJY3xIDfz37I0r3GG4iaW4fwSt25Vt
 HbcvkOc0LPAuFVJ+cmF+MCYTniIJA5MRvJTp99vNnUCs8YYZ6s7p+coYbUdWT7P3cIM4
 P9pVyESAsc/H6lXD4TlfAQJUNDWDl/y4XvX/xgTcHmdBiE19k556Mt8WNY3yP4QCT1DN
 IS1GMNa2nKnI/bi02iqFdAiAyrlvVEDU/UYvcUe72mxo4ZQNaNMALYH0yb8YcOH79NJf
 WPM+na2RgAw6Q97gBQu8ZEamut59JKHxfQubh45jqPQnWgIz4xnzoIEULFbs9soX1r/3
 T5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L46JTT3b86tebJ2B8FHYVsFw/Duw20CLn6vO+bSkxpo=;
 b=deAiJwvHE/JBBxwwyMggSnwfb4wCeaHNKvER0g+38rHFHDBslJ7OUMaphLhuIQ9kcX
 L5gVIyAQjOpuoZ9M5147cdsZ1vhgpf0vs85HazCi0vSc9aBxdrKzWTHPxRykeEHH7HNb
 ojB28l3SChI0yHyutu8kDRLWopzG2r5fMWxaCdjf+IadAwFTXMVFis68lL08XqF4DDdN
 rTEGSJIvj4KHQ7xdhBVeg32jJhfrs/JyCckAiz29ZwtqVpDkRKPjjgJmEcO8g26e7u3N
 KZtYsRySWS+AaP2OPyoUs+0W0uER//8vx8RXm4cgNTViAuHSZ8QISlizGZzwQ7EdT/HA
 6bkQ==
X-Gm-Message-State: AOAM532YHo3CvRZiPqP5Bf+xiCe/NmL882qnI6TA2UYzw4znGgjQWhIg
 uCzPetm4HSTrCNrK3H3CtAI=
X-Google-Smtp-Source: ABdhPJzsbz7iDbghUhothmJ6/RVer/geufXzsJrfKPptuE1oZE2x/0CefJGZDmIOpMRc8uUw22O6YQ==
X-Received: by 2002:a05:6402:942:: with SMTP id
 h2mr1108985edz.328.1644583807530; 
 Fri, 11 Feb 2022 04:50:07 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:06 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: completely rework the dma_resv semantic
Date: Fri, 11 Feb 2022 13:49:40 +0100
Message-Id: <20220211125003.918447-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

by now that should be a rather well known set of changes.

The basic idea is that instead of the fixed exclusive/shared classes we now
attach an usage to each fence in the dma_resv object describing how the
operation represented by the fence is using the resources protected by
the dma_resv.

I've addressed quite a bunch of comments already and I think this set has
already been discussed quite well now. As improvement to the last version
I've now added CCs for all the relevant maintainers to the patches changing
some functionality inside drivers.

Please review and comment,
Christian.


