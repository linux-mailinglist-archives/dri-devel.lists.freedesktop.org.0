Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DFA8A8FE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 22:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B398310E057;
	Tue, 15 Apr 2025 20:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Ip0ohKqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31B510E057
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 20:14:50 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54b166fa41bso6987414e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744748086; x=1745352886;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QrX5BfBQF2U/SMXR4SwmyIo877XUcxmuZpNerm61EBw=;
 b=Ip0ohKqhdDRdO4VF2BvH8BfHLROzYP4fp2Ibb0LQCUHgrE9+jxcsFnyHUVYZKqqcBM
 PfMdyMP+09cFDABudehVD8ZZozp1Ied46eCH5j6y4b9Lfeb8tYbAMhqI8+Jh695+Jtg7
 RB7518chuyuqDTBWEDTGYVPyiMYE2R7IKRJ65eE+9HUrqLMJ8snAsLwLN3/UvK91wbCy
 j9lWGaxXl47PvGm0wkX+I24TZeWv+U7YOhwpUjWgDzSQCncnSvhs4YE6y69u0RI0EfGL
 +ko2vrCnd5RPMtanuuv1FB5j2/pm7rkKlc8cOB7V8BokjrmJ/iPW84ZLIA1+REdnMQtZ
 xFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744748086; x=1745352886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QrX5BfBQF2U/SMXR4SwmyIo877XUcxmuZpNerm61EBw=;
 b=GUW6ZoMD18YlT33aSEAMa1VbeXcSAULB+/gUK/EbCBfOYWYJByAWXDFyKfwBks8IsF
 UGuYHrYq+WZAWcKoI2nu5Tblv8MrU1QRbe6/jL7ArZ0W8iHEi4YkLKjhbA6dl2HDc2eB
 rIxteHVjsd4k2Yu0y3absAEUsgk2mTwbrMthV+YdWDWwcvI6k7GY5hnCQ5uu5FUdBNsa
 cxg1gmimlUuZKD1xtASvjI9iPpHkucc0OdOEpQ49T++PuwxdHiXBLGn/LvHoa8+lcMpC
 TtO/TcS9oenaVomQ7dA3WVMRJZpSZ+fb6Vgvf/lVGgpaonyFHfZmYhiMaOk94BWCAmNB
 u0Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqq3b8xAzn9w4t+n5k4Nsc7EMAaTdgQGKXsqkldcyhuK5LOvUfVJ6MBpd64bWsEL6d85Drj+NjXK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQLW+zF95Em0iz8jW8Ke/aYZmLnBglXg5MMaUI+dvmlIajwG5W
 Hu+0NoD0toLMub9Qh/Qkyh1Mw1zlzNZk9UcjSNuhNNMUjWUCh8B+3X4Ygaf2q61CJwBvF3CYRAb
 sgqsDXcuzQZokAHrFx85pajR7vfz0aO+ulLs=
X-Gm-Gg: ASbGncuIkb5g/lyyoIRePPfWllbXqHObUhOqje6tkEfLGJgJGJP5v5ddWeRzhVYTV9q
 ATbQg6uN6Z4VNooNEEW0/TQyMo4ON4W1N8H4Jjp3O7hQLsstN+9GEOD7XONfHlG1ZKV+muw8IQx
 ejYj3H3slPTlnazaVmmZNO0/zT3YTsb1T5Zj4jkHsuQynXbLK52sY=
X-Google-Smtp-Source: AGHT+IFmjn22DVWrD3J6egNzsPL6Ng3PyVECAR9T97KHvP2G77xLiJ5TWGIYssFAbUDv+TSvWv030sUAs71yMgQvDH8=
X-Received: by 2002:a05:6512:3e17:b0:549:733b:6afc with SMTP id
 2adb3069b0e04-54d604ccf4cmr100825e87.12.1744748085535; Tue, 15 Apr 2025
 13:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com>
In-Reply-To: <20250415171954.3970818-1-jyescas@google.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 15 Apr 2025 13:14:32 -0700
X-Gm-Features: ATxdqUG4dYOEgBpq3vBJFjWe22Y7nhXg-DziqAyeOFw0AhrMx6YFrW0nd6Oh9O8
Message-ID: <CANDhNCpK86yKWTUkXV5oK6n7gTmeNDn-NsDppBjObXPEMwD44g@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page
 sizes
To: Juan Yescas <jyescas@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 baohua@kernel.org, dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
 Guangming.Cao@mediatek.com, surenb@google.com, kaleshsingh@google.com
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

On Tue, Apr 15, 2025 at 10:20=E2=80=AFAM Juan Yescas <jyescas@google.com> w=
rote:
>
> This change sets the allocation orders for the different page sizes
> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> for large page sizes were calculated incorrectly, this caused system
> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
>
> This change was tested on 4k/16k page size kernels.
>
> Signed-off-by: Juan Yescas <jyescas@google.com>

Seems reasonable to me.
Acked-by: John Stultz <jstultz@google.com>

thanks
-john
