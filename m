Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4195EA63543
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 12:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47D210E027;
	Sun, 16 Mar 2025 11:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LTZcDJZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53F010E027;
 Sun, 16 Mar 2025 11:17:12 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-726819aa3fcso2313154a34.0; 
 Sun, 16 Mar 2025 04:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742123832; x=1742728632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+7jSFadTV9A/Fg7psg6f9yxG1LE2BjltriuoZ2nFmIY=;
 b=LTZcDJZXrqBE7puAreDxVez69E4lMj/VOeBkbJ5u11J1lDuZBBJ/OuQlq0GhIdz9gY
 i5by0M+zR/okE/AH3lfTcZR4IK3ij862XpGUNs2NxuLzdZeUXMzRVerosLVcyeoNQLRU
 BCj5AXQ4U17TrBavDs5P7yE2Kq1SqdWQbS2VNW8+dAo1Lf7m8DfWIlLi1/ITKFL57bIU
 lGdGnAG+Tk8RdykCZqocnzx7wOhG6jgttcXauNNBdEzzsx20/9tF+R9p+XglCLcRKZXl
 QYGvKpNuq84TtXvEUFiz2IMfsintdobuh/0jLCypeoUBn6NdGPRfdHWJxaxVWRfrENpP
 w8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742123832; x=1742728632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+7jSFadTV9A/Fg7psg6f9yxG1LE2BjltriuoZ2nFmIY=;
 b=KceVvWtAQ3Dwte9w6o/FlBrWhH7kZzb/ZkW/BERPaV9s6zvwAB91XM19RYOslvrn/v
 vPyM9fRd46ZB7nz/RhG9UyLRGj2OQfbTny/wu1nktxZt0TYb+A96k76WVerz9XjYFW+Y
 WFzoo+oCt/3qlt1UC2dlygtHEb0ynAdj1fxSfk+NVeW4LLUMDCdAHX/j1AX1dtZSERar
 LNgZVbtF3ihWVdtzRFllxv59DRIBEtpK6cqHu+urwoyYHhIyzgQdBjjEFxUxlmYtBTWF
 0s/+ZOdDNucbCvRq21y6J56c2NEhcrnyrWl9gmsG6TKBOM1cnvjcBg/ZlRiy1Vwfs4CA
 GzPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz4caJ1qcaK0wyO3jVTHLxlr0Tc+eGBTotRVsw6loj/rUbsn2EMCma/ZWLYigBMs2dDpEZYbFPVw==@lists.freedesktop.org,
 AJvYcCXXowAwkbeltAdEo3ZjF1DRuPFYY5V9yhEaRdknLYCfGnf4Tshgipq+1wij2mRPdYns6dvzIM9sfLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjFHC+hWRNlwrTkIduPyUjQYq+SkcMtCb8qeZLV7KteL/JELsY
 rsH2g7V0ixfw8o2ayX05TmS8lRGXlWj8Y4VJxv7BExwnPdR6CJGe
X-Gm-Gg: ASbGncvloUMN7+dT6N44ClszATZdyMd1Qmuiut5Q/ftgRnHW1zHqeQ3Y3w/efdrg86d
 j+tVmBfpbhTIx6pOKaTETjW2Cuua/rRzk7I+b9jcChif4EpA0ZHH3y3Qs605V7HRmI7N3Ffzzga
 4K8pBcE9pXeF1xrz1Fv2JhaV7zi0Uw0zvnQ14szbw4sMzOr2p+EKEbCPhhBbrT8napfnbYp6Bxz
 G0RkRfo+dLgEth0DOytfXaDLwnYe0weRmOs36ASmyLqPRMMhepH9ycwdgl9yi/rnwOrodLXMzMk
 WOZIm4rfGCLr6B9bBas3CHnJu+1nr6jCCCxnrCy8jH/5zrwAZZ+2bT6clthik8MNlsJMyGA067u
 eh0tMMz/kgKECCsOW
X-Google-Smtp-Source: AGHT+IHv5t3gQ55bzS+qLlelppCqZRdREWE+WDUuqOccgurK2T+zzctVZElnhWhnl3PVs2DrOmfNeQ==
X-Received: by 2002:a05:6808:10c7:b0:3f8:4523:2697 with SMTP id
 5614622812f47-3fdf0928cabmr5073566b6e.37.1742123831755; 
 Sun, 16 Mar 2025 04:17:11 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 5614622812f47-3fe832ce015sm715978b6e.7.2025.03.16.04.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 04:17:11 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, andrewjballance@gmail.com, acourbot@nvidia.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/3] rust: alloc: add Vec::resize and Vec::truncate
Date: Sun, 16 Mar 2025 06:16:41 -0500
Message-ID: <20250316111644.154602-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series implements the Vec::truncate and Vec::resize methods
that were needed by the nova driver and removes the corresponding item
from their task list

changes in v2:
 - updated safety comments
 - fixed rustdoc comment spacing
 - reworded commit messages to be imperative
 - Link to v1: https://lore.kernel.org/rust-for-linux/20250315024235.5282-1-andrewjballance@gmail.com/

Andrew Ballance (3):
  rust: alloc: add Vec::truncate method
  rust: alloc: add Vec::resize method
  gpu: nova-core: remove completed Vec extentions from task list

 Documentation/gpu/nova/core/todo.rst | 10 -----
 rust/kernel/alloc/kvec.rs            | 62 ++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 10 deletions(-)

-- 
2.48.1

