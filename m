Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BCC83E0E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DDA10E378;
	Tue, 25 Nov 2025 08:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qlw0MouQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CBC10E2C6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 13:38:55 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-64320b9bb4bso197149a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 05:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763991534; x=1764596334; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fGnf1zvNYnk55vDoYwHQmt5WFO2pnbA0Jle9HXGkL5k=;
 b=Qlw0MouQ4fmVJMkPfgnp1hVG9KBWYrdIqU/pdFM4H5lMEzhLNeZd74yBrqI/9sloQM
 Bczu1ZmEnH/TEZWfz3h+t/+aw4qtWO42oD8o9iV1rt5/7AmH+cgOYmwb625pnIQkYRmv
 gl3yFqK40FNN37gqXZ+UR10nsS8fnRzqL9/jAGrcYBU+hjy42dDUSIfulGIF1CYV5oWd
 APzmhJ+nreNFtYb3R7Iv4AZnsx8UA6R2325cIW9Vl9lAK69qvbG+Tmbz4C7wKE0L4wao
 PcPr8DBti71wtcXD1SVRz5hYUM7LiPQF7nu2usbRwEnqdzPjdtrcybbh2j+anlloCmky
 vnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763991534; x=1764596334;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGnf1zvNYnk55vDoYwHQmt5WFO2pnbA0Jle9HXGkL5k=;
 b=u2vsgaGnyDdvumPw3hKF/m+LQP6bVLvMFY7i/cd7V6CEOrI3vyN0jrpJmgGmLiE+VH
 Dsv901O51Sy1EKxe2rumm55kH8Plcz9ju1RtG5ruOCGvvLd9/cCM4EOtxl1N9d0etrF0
 rzn/pVHivf8VtH1DJzbHPE+caK8sjt51b7sDBe0g5A9Th8La9Pa/gIT1rCi1rp0BpJ7J
 LqXeMZgjr2+7tZkEVZUadgmtXudcuWNnexKLc1XwIG6xmq2NAto4xugqwsH1UlKn3KN9
 nsXpY6oS7I5budQkwI+99/xL4Z1h0sUbqBS/OUtnR09SxKJE26tAIA+Tx0D8FaddaFNB
 L+FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmNlWHh8bu1aOahZ/sVddEeshlCe+rGm/GswaDpUNEwIHuFbTRSS9v4POn/HO1GOARGZ0ZR/UZ6cA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJbjDAFDf1wbufAfBiOkvfgdV5ZpuJXvTXziEA7oBAMdZUOasS
 6nEVE+yZ2vC2Qc7zcrBIipSWtN2mS7cuGvCpwmMMWzHhF8lzR4/W1dMfyphWlZoP4Fb9BlSrK1u
 bQRodRrCA4b8yiS9XkR33+2sObq89fA==
X-Gm-Gg: ASbGnctLYitWJYIClB60/GQQvqhz6igzdkfbI8uzUnn+IhEFoEYv+xmBygfZPb91BIH
 8+lzKpCsmOgc/k+ihn/08/d9nEv9dTU0LeIAch0pTty6xxw4PNKDSUtDW3nu6pGr59wWWHyrP9S
 1D3qr4BAvYfQRCSuu3k1zOxOYuSap/80GoZ5suOf06FswQUrCqd+GAJuMx5qdc8kZ5hSypNhjch
 Fu2yiIYpPKF9WIuoCqs4wXuEPGiruUY3Tgo4f5+NZ859kh0mmBHpg1p+TDskrvjJihF6yVA31Ql
 mL+uw7gSL70kH+GRGZWNUGS5e2XChkDpOzcKmdG8s5lMZ0SWjv0WON6Y40ZyZn9267o=
X-Google-Smtp-Source: AGHT+IEIrrPvcFC3+rTLrgAPrW5zl0/cNdfSGGH+WdJU8CBkNncTEWdpxNp4QGdNjnbB8MXP5BRq+4un+OL6bxIbhcQ=
X-Received: by 2002:aa7:d814:0:b0:640:93ea:8ff3 with SMTP id
 4fb4d7f45d1cf-6453969fc53mr9852940a12.13.1763991533736; Mon, 24 Nov 2025
 05:38:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com>
 <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
In-Reply-To: <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Mon, 24 Nov 2025 19:08:16 +0530
X-Gm-Features: AWmQ_bnDcYvcgkdgCo-kXgELlQbBhcvXrCXwL82qa0EngBmCaaIoNiIBz4Az0nk
Message-ID: <CACzX3As+CR4K+Vxm2izYYTGNo1DezNcVwjehOmFjxTqaqLrDGw@mail.gmail.com>
Subject: Re: [RFC v2 05/11] block: add infra to handle dmabuf tokens
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

> +void blk_mq_dma_map_move_notify(struct blk_mq_dma_token *token)
> +{
> +       blk_mq_dma_map_remove(token);
> +}
this needs to be exported as it is referenced from the nvme-pci driver,
otherwise we get a build error
