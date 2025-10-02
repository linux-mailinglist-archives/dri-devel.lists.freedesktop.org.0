Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7289ABB2A00
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 08:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1862C10E798;
	Thu,  2 Oct 2025 06:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MgYnsfyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DEF10E796
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 06:36:06 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-57b8fc6097fso848723e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759386965; x=1759991765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JxJRHM7RKVe2VKLf1OZeMJvur9jkhqQvZ7AlHIqtmE=;
 b=MgYnsfyNc1P8L0Yhpw75kjR/uQcHRe0uSBzVUNwWpdYXY2zNoSy1tAv5IN8Cvs03sj
 txPRTRbkcGhUBE84aZO9W8AXrSFUEsrYFbpA2auoMsQmhIgms2UzRPujMFdTsZJiisXy
 IUbu9eKru0cIfCeZdtRGaHZ1OGvM0bFrxbtADYzSlFbLrB4CbAvJQjCF2h8J46QqB+3Z
 bEK34tH6Sf/96CKIqYxYuNQJ2V+6hTF536SdROS1s0tAgRdKfyW5gzx32FktGqfzteU2
 /PRVD/a8GocBCfFeyZxfZ+6V/2O9tm3xSGqt9hhBKNd1suHI9SAtxliipzt9w/W0q5q3
 SpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759386965; x=1759991765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JxJRHM7RKVe2VKLf1OZeMJvur9jkhqQvZ7AlHIqtmE=;
 b=Sj+BimntXe9TfXKi3Qgc539FczEbLr+PBqsZq7s16gY9XqxnmHZSk5NCwamKEQvzUF
 iw5fCIPc9215FrMv6SagujhI2W5Z+3ugVKggwseVA5+Ip9fQ9sFj7z4Hq16gX19DYl6I
 Q11l5XB/PxMljkh7c3BFrGVSTTW3k3at49seHDsUKTk1ON7KTHd8CFJ2FvRM5EhCul9j
 yMuF1qNbyK2iUsOUSEkDOpF+Mti8ENK4n8MWRT19jyXMUIosCh2QEOTddlxUtN08EzX8
 QNcTim5IkN5/3+ix9KPyA1J8qux43e5/imEfN4hQX2B/fXUiRfE5xppuqbvsBUk1PgQs
 iVrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHxToHsw4Mh6pHPdn0qiOmsMIYNuk0zAXIxJlV7StCzSa2+aHe/GaBNI6WjZuzMfUDsAMMjnWoUx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw99VP4VkDcm5CCDz3zPfyxHXIpI+LYcpMIa3AE0IthfbioOaMi
 eWzMFU1SIw9AWX5vRoruiJrGZeN3iyKtdGV7KLB9ooi5u0tWdZpjv8j/rxVwwS7rvYk5SWcY1Op
 KEXooxWt/oI7+6zdC6Tt4OS+ji1cPMVw=
X-Gm-Gg: ASbGncvEw4EWzPWq39uXFa0r+I1rb7PN8gcq4i6oGc2R1YAsRDh7OjHwsDMFL5Hm7YD
 S8cLh456JwcRzw72N75KGa95hVbvPlPwbb6a906YD/Sqg+FtodZ7T7n8yFYqyoDhEIIyXDXNzk4
 PaABmZ3YtMOQx5ybIPzpDx5RhRKnQKJqRcs32hmVzVp8tg3nuSV6GYNugJfYsuSfEzPjVGjyXwh
 TfI/v9Kfsj+LN+xt/P48CZm3WM67UBNpU2pkTHf16HlYb0rU0kufvQgQ3PUiTdjjg==
X-Google-Smtp-Source: AGHT+IF99G3AYiAUEQrPtjf+2h2PSZdL5Ih8yjphXmvu9P7cETElAJxwS9A+P9E5rAaBZ1LwUTeNFcGEcpOdmxasB90=
X-Received: by 2002:a05:6512:3b8d:b0:573:68fd:7ad2 with SMTP id
 2adb3069b0e04-58af9f6b129mr2083801e87.35.1759386964675; Wed, 01 Oct 2025
 23:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
In-Reply-To: <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
From: sukrut heroorkar <hsukrut3@gmail.com>
Date: Thu, 2 Oct 2025 08:35:53 +0200
X-Gm-Features: AS18NWAtwoESXok4b8-OK2ehiGbNAGs6cVgv71Xx2MQ4h4uKtcLLpvhfJQAkNZ0
Message-ID: <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: David Hunter <david.hunter.linux@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>,
 Bernie Thompson <bernie@plugable.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>, 
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
 skhan@linuxfoundation.org
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

Hi David,
Apologies for the late reply,

On Mon, Sep 29, 2025 at 1:29=E2=80=AFAM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> On 9/27/25 12:12, kernel test robot wrote:
> > Hi Sukrut,
> >
> > kernel test robot noticed the following build errors:
> >
>
> Did you compile and test this code before submitting this patch?
>
>

Yes, I had compiled & loaded the udlfb module with no errors. Please
let me know how to proceed
in this case.
