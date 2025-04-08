Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BFAA814C4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 20:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC0110E2DB;
	Tue,  8 Apr 2025 18:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dqrCc/s7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D56810E2CE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 18:37:00 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-736ee709c11so4995782b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 11:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744137419; x=1744742219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sQx5kL2HMBRicxt7p/SiPvwoIXxU9EbXiMpn/Q8TNZ0=;
 b=dqrCc/s79LzgrpwpbRqzjOr888OJpQpyU77B6fLUQ/ihfEl+DGYnFqsfJI6cRveXJE
 CMvQ/0hye9857XjzAX3u/n7xWRXcrPETq7lGMkfxpdBWkhueZbQL1OVkmwSgYd+g1YNi
 5p0x+eXIYLATj+sYgaP3CNjNE1CyVHna6md9R3awE2xsUe57r5gI5ray5g+Am2hGfLBC
 P90VzJNGQXiNdspomUnxL9FMjcliNfaZSKxQReDHq/VPFtt0lfsBLO2YvpkJoLNylA8H
 Vi7PaVrSF8sP0sn6MzsFScba4SXYTHT1X2LZYWUSv+vkaAyhBRkj3+64iJyIAhodfL+P
 qscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744137419; x=1744742219;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sQx5kL2HMBRicxt7p/SiPvwoIXxU9EbXiMpn/Q8TNZ0=;
 b=ZPbnXD8fHcRne0Ja+A+FfNZ59y3U2n+PY082tnMM2nW/EoXVXz54xys+2jey0cmYpD
 N6faxqT38agk5z0XcYQigSlBEI7p5s0Wi+Nwwi8zQYZvVTPgHmG0LxH8YQegwTXUGApR
 Lthc8844mbMcKx6QeLpRExR3TvyOmp7s5YSLqcOg8/Cag6ID20BGaVQ8luboNNwtEQUj
 7itIbfbH/8iJBv597DarsD3aqK2dnhNJehNhTKfzlqOssoL5JBYVnfVRFUH/10jBkYwo
 1QKh5/HS1G9RKzrlBZVE0xdh24Pr4bHH33kGZJkvkssohqtFsaxa16wZIUFuP40ebT8b
 +3pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFKVtUUKpd4+kBEl1i8ORN0Ak7VtynCAQF+dOfsk4O+/aqGIErcZrHzlCPH7F1Ag4mk6SwHnLIzgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRl3IzHQS2qKn/VwtD+fjiJTd+fGKQtOGZ45k+GuRXdDkYmQXi
 z3PW96n0fiTLY4KUsi31Q1GDcB3WVyfxKz4rcgjsPVCgXH01aKVG
X-Gm-Gg: ASbGnctH7FIYkzs+SgdX4tQh6r7v03Y+cBUIxSXv0PFCNRVQzSyzBuKJAnt/1Dgfn7N
 TvY6XfuZ+9mvFvEBwIN8QGu2LUqJmm9DAacMjdcg3s9MbSQ8SgnyUHaobOrgBwurpkhGq7ogaeB
 m3k4i58vpKl0gyUhIGNVZjvCpRITIlpeSx2q8kIJPnNozvdfEVEIaby8a1I8O7UZcb1P2uisdps
 mqmQ1Pe7epTsRc5S6HWGXHr1Y82dqnR1Cdkccr6F1xGJxHWjLK5jzGKklhppHbBbsAna2KfKppx
 HX0uJouLx23sY7wWpRFzn5G6mpYZi6bZjk6c+u9MdCGrAJXBNySnfkrJjo5933POGVxYMjqX0+/
 /Y3lAKifluErLS8sQCeV+MH4=
X-Google-Smtp-Source: AGHT+IEjwArdNPWWYuDFcDmnKKWKrgBr6kLPXpKsC7dfbpRyYKqI8aTmyy8lbfzaFKrF/1/S/MR/dw==
X-Received: by 2002:a05:6a00:1152:b0:736:ab21:6f37 with SMTP id
 d2e1a72fcca58-73bae30912bmr152104b3a.0.1744137419397; 
 Tue, 08 Apr 2025 11:36:59 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739d97d32b2sm10960469b3a.5.2025.04.08.11.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 11:36:59 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: jayalk@intworks.biz, simona@ffwll.ch, deller@gmx.de,
 haiyangz@microsoft.com, kys@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH 1/3] mm: Export vmf_insert_mixed_mkwrite()
Date: Tue,  8 Apr 2025 11:36:44 -0700
Message-Id: <20250408183646.1410-2-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408183646.1410-1-mhklinux@outlook.com>
References: <20250408183646.1410-1-mhklinux@outlook.com>
MIME-Version: 1.0
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

Export vmf_insert_mixed_mkwrite() for use by fbdev deferred I/O code,
which can be built as a module. For consistency with the related function
vmf_insert_mixed(), export without the GPL qualifier.

Commit cd1e0dac3a3e ("mm: unexport vmf_insert_mixed_mkwrite") is
effectively reverted.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 mm/memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memory.c b/mm/memory.c
index 9d0ba6fe73c1..883ad53d077e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2660,6 +2660,7 @@ vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
 {
 	return __vm_insert_mixed(vma, addr, pfn, true);
 }
+EXPORT_SYMBOL(vmf_insert_mixed_mkwrite);
 
 /*
  * maps a range of physical memory into the requested pages. the old
-- 
2.25.1

