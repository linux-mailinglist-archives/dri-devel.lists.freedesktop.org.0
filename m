Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB9CB9A55
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 20:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA95910E65B;
	Fri, 12 Dec 2025 19:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="VLZJ9iNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703B710E347
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 19:37:56 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3437c093ef5so1636709a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 11:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1765568276; x=1766173076;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=StTVbGf1mPsXgZZ3d28QJjsQQzKmymRGuXpSNQalBC0=;
 b=VLZJ9iNMoxC/EbNcwuXIyzZCsABFzUiRRj5Uwr8PDhe/Wu7RCa5W2CMUI15Cnt1uyd
 ec9NguqBuMS5W+9cVfVdisZNo21dMxZ1jHFBXPjic7vF6UBuAR9IdtA55a2dYheOgS2V
 Z5I23rkLx/QJ0MZ8c5ARxL5kLcTYIlR64o7O8ViF3Xzj0q/N3uu9ZeJ3TcNlvWTG/uoV
 e5LXogH+QnjoIbQT5XrgjChqJP11IDJr5jIWcE8ggdePCCpfhhL/HvgFTNPGVhSxIl8C
 D/aoseUPFfz5GdN5GjOPTWLwWucaH+mL4EW03WZWiam7o+Vl77yhhjQytZ4eu/4Hw9UW
 0h8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765568276; x=1766173076;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=StTVbGf1mPsXgZZ3d28QJjsQQzKmymRGuXpSNQalBC0=;
 b=nzeDfjv3UBeDPcgirPosN1qniWa1RXjnckdVL/BV0cDB8NlUl4cHg40MUmGzRUWRT7
 52b9gFiFJ4ZfMWOH+T3KD1Vm9v1uFF8RSgr4z9HnEzFnzol2Tp/gTn2txz4aFm321zgJ
 U03ah5UyunZsxXCL4zGHsjxzOgCStNuLygU+Wbp7cZVBEef+NuNFrbS5qaoDbJLOS4AP
 Ryn0eEpCbLTh+KuyBW7bxCcTd1J+J67rGTPhbMv1s5tOV8YLgifVQseMkSflEJVsmva0
 QgrzJNo2YnTID2iMV9RM/APNiHJ+yCtpeF4vx2sRlp9Yat0KIAUvuZnNujS203BBNwRY
 HetA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvoEdjGfzpQWskPMf7u+EPun/QpXyBKy9B0pxZ1sFt08CIOEMn6ubyu47cV1FYhU8qMraMSs6suDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+0XlTeHntqslToWdXsfGKyfgpt1E+HbdozQO2ufbWyxamY+FO
 0YT10bE3TUL1HgUGq7RCrAA1Z4jHSTzuCyFmN9oLLjIYk+kXUPztaaVdJrVfDmoUuU4=
X-Gm-Gg: AY/fxX4JNnQyqyvT1kGqvS0woqicRrJOsnrIpH2IqF7twhRCuh0isvzlFlxGMJTzTzS
 D1hK+26KqZCuBv79DjpyBzQgRqaAf1ULXUP5NbWvm/i1ujYB08Jda8MDnJXcwQ7KTLcZF84Ja35
 I1i8fpcqHnzrDFrolEPsR8Ii1ip9c+JOVk9P9wmZG7Ev0/OXWDwP2l2XLBBn/g60VCCRggpYosK
 oFA9uqGOD55xZVFSkLxEBVX6kHqcoz90QwXecIu17BMKZwRNIM4hnu98xB+/mTJOVk6a2FDZYQ5
 46XhgvBWEojAYGaHeoAEwAhnZk6T+i/jC0/SH0BnLx9ShxwEVxSh8kwIM8F/A2sDtNDJTAUi3KC
 2yruQmCribVx1BWfqI8nKvp7eT56tk4x1MdOR0IreNrjZeths18NlAjaf78eUiL2ne+fZuD/l6T
 HJgpuQGnjWroyXoAk/ZXtHr8VGyhmexIARrnUDupO4K8XD25zYknGI7ARK
X-Google-Smtp-Source: AGHT+IGRg2Nd8ny+lEY1UTB7dhC5oApF/NmRzRo0kswvAor/xhBJns1Qxh+lICHO2/Y0nRHD/a4u7Q==
X-Received: by 2002:a05:7022:e1c:b0:11e:354:32cb with SMTP id
 a92af1059eb24-11f34c39abemr3023356c88.49.1765568275584; 
 Fri, 12 Dec 2025 11:37:55 -0800 (PST)
Received: from [127.0.0.1] (221x255x142x61.ap221.ftth.ucom.ne.jp.
 [221.255.142.61]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11f2e2b4867sm20294552c88.6.2025.12.12.11.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 11:37:54 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
 Pavel Begunkov <asml.silence@gmail.com>
Cc: Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
In-Reply-To: <cover.1763725387.git.asml.silence@gmail.com>
References: <cover.1763725387.git.asml.silence@gmail.com>
Subject: Re: (subset) [RFC v2 00/11] Add dmabuf read/write via io_uring
Message-Id: <176556827123.851918.9976241171726294701.b4-ty@kernel.dk>
Date: Fri, 12 Dec 2025 12:37:51 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Sun, 23 Nov 2025 22:51:20 +0000, Pavel Begunkov wrote:
> Picking up the work on supporting dmabuf in the read/write path. There
> are two main changes. First, it doesn't pass a dma addresss directly by
> rather wraps it into an opaque structure, which is extended and
> understood by the target driver.
> 
> The second big change is support for dynamic attachments, which added a
> good part of complexity (see Patch 5). I kept the main machinery in nvme
> at first, but move_notify can ask to kill the dma mapping asynchronously,
> and any new IO would need to wait during submission, thus it was moved
> to blk-mq. That also introduced an extra callback layer b/w driver and
> blk-mq.
> 
> [...]

Applied, thanks!

[03/11] block: move around bio flagging helpers
        commit: d9f514d3e6ee48c34d70d637479b4c9384832d4f

Best regards,
-- 
Jens Axboe



