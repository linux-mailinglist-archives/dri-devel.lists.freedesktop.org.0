Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F291D3C300
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 10:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23B810E590;
	Tue, 20 Jan 2026 09:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Jx08zulJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F3310E590
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 09:08:51 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-431026b6252so5201819f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 01:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768900130; x=1769504930;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=m0gC0kf1LN2c3lXGpvzmQRYw5J4jv726UtOthXTVGD8=;
 b=Jx08zulJCOgZtQv1Vc2H6wq9jW7EcQmWr+H85fvM0mFcuVDFqsi6JuDdnDb3BuvRBe
 wzLd0hRwOzAmPsiXmnWj1IHEsqnUAixqvQBHX+6lBTWpLJLv3Z3rJ8YHrUbAgHVZMAyx
 BY24W/0R9YZ3eOB3XV6nYCIuNmbarilrILEOujhvvhFNRcDi4TfMVKdoCvn8GOYI9zGS
 8CqKmW5wREZhU+80GQKX/ShvfkD2nwxHTDlsutEo8IYnYD6wucVAcJe2vzsS+0KUDRx8
 LOcF5lwzQ02O28MFvw0dpCLd/AeeKECvxSv/YxLe9dIGf+W5bVyJlRT9yTRWLJmxWvZ3
 mScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768900130; x=1769504930;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m0gC0kf1LN2c3lXGpvzmQRYw5J4jv726UtOthXTVGD8=;
 b=COpxii1j6BWsg5NiSKhNU+ik5RA1tXAB5wKvqdCBsuJPISwZH1lHPCnwvwQ3goUnGw
 mxstN+UDMv/0BAp8P1GnxHXmf2vlSqHissWVtjEVDU9MkMvrYvCDMrvC5ib/isw5OT7H
 L9TM8tbbf8sUuC6Saune1DGYOct98VbghgwxbRo/j0RuteCk23gCJqmPj1xoWlpT1hRD
 WUEx5f4y9STNHAu88ilD6V/C917SBhUvbbLK/QXB1q+jFfIB4yZ2n6dSwi49XKMbUsax
 5IHdtrH6dsNMCycNGqj46MKhVuGpmgrVdNlqUf30h1JWxKgDlOh9gt/pZL9pYGpLqjII
 O+vA==
X-Gm-Message-State: AOJu0Yxr7I3m5NBwOUOc0v2Cg28Pp4zwzOzuZjL4X605L0NT9n4BPcbs
 FVzZU5AeOrwwBG/eFRiguW0yZzJPaH2R5vVHRWq6/gXLR2qvQEYNCJ0i9iiBaXN23WZ/1vwsOx0
 t/E2m15ofFHOX9veWbw==
X-Received: from wrbhb6.prod.google.com ([2002:a05:6000:4906:b0:434:3054:ca87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1861:b0:432:dd71:8f2c with SMTP id
 ffacd0b85a97d-4356a03321dmr19272507f8f.10.1768900130207; 
 Tue, 20 Jan 2026 01:08:50 -0800 (PST)
Date: Tue, 20 Jan 2026 09:08:49 +0000
In-Reply-To: <20260119202645.362457-1-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260119202645.362457-1-deborah.brouwer@collabora.com>
Message-ID: <aW9GIafnsiCVnUbD@google.com>
Subject: Re: [PATCH v2] drm/tyr: use read_poll_timeout
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com, gary@garyguo.net
Content-Type: text/plain; charset="utf-8"
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

On Mon, Jan 19, 2026 at 12:26:45PM -0800, Deborah Brouwer wrote:
> The L2 power-on sequence and soft reset in Tyr previously relied on fixed
> sleeps followed by a single register check, since polling helpers were not
> available in Rust at the time.
> 
> Now that read_poll_timeout() is available, poll the relevant registers
> until the hardware reports readiness or a timeout is reached.
> 
> This avoids unnecessary delays on start-up.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Merged into drm-rust-next, thanks!
