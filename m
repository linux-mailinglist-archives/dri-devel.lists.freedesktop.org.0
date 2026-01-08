Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99673D023B4
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C59A10E334;
	Thu,  8 Jan 2026 10:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zlh5/Su3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00D010E6E5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 10:11:03 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7b9215e55e6so1729103b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 02:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767867063; x=1768471863; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9uwAqvKFjHNqaoUbE4IiDPfzSZFqv76YqNJ94qfNIw=;
 b=Zlh5/Su39SmLeTwXHGnK505ITWSnI2+BkQuxP8XCnwOq84Kl0W0hpClyPRWvIiTTIt
 P/z96AxR01OE225CHcltKMjpYCMVvcLoSLgMrH1QMaSexnAk1fAf0VjKHoWuxl1dnLGZ
 9YCP+Iohz1ApW917WpGFzsvh5MitLuNxi3DJNhnMtbGWkNJVrdDA+c52YCVFWJMffFxc
 cL9UDmJnKnAyJmpWxP++WBqIs/czH+uw9rN7AZ+iH9c+Rw52wha+h7HtMkaHAJ5K+HWF
 tSfGw1oOufKX+/swvJP3kGBQZ3EPxjxk8mVRz4U0Wo1AHIhrq4oFchlvokFFy+3zqTV/
 B6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767867063; x=1768471863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h9uwAqvKFjHNqaoUbE4IiDPfzSZFqv76YqNJ94qfNIw=;
 b=uiasQej+zExwQGf7vT8bUZRPmhFxDyJfcQsEqJ+EMCvb3PWGOYppqBfKfwbo719gdd
 RCBHQQK3pDKhJ5yltF/ug/Wftvh18rcudQTJKq3p/lppym3aJsZ1OPphRtIJYgjOhyRP
 OOCdAGmXcGErd2CR7kfl1c1WUzrIa17DgYi3G2kdFqOZmGsEey7eYa/HyAQKm0L/QwKy
 EGI+5UgR85GcVvlEwiPMyrbDv5IGI/ayVT32Wy5veiYpEeS3PlCwWeGCyLUxhQApnCoe
 4hyA56BC3UZwMvp8ehccKhIol/30zbPJ7yIXm09xJqxleT+ygm6birYNcsVF5t3YAXVj
 uVSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Ifmc3YE4BlL6nlWlSTSdPf71bcYOrljaka54h1lt3l+cJc6Yk8/r6/skFOALN6N88O5kV0xqvBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRfA+QyumBfjtoqGEQmwvr+++5cJipn6lfU9gWYGi9kj+MEfIY
 rxX4IxpGxsoL4SdFN19eM5egAGnxeJkw2S1ZIxjiZiGYyYkBJ450qMT8
X-Gm-Gg: AY/fxX47Yu5yLDNP84CL8iueHuRLbcwSlNWdspxbToCMPmPzcPXN7FacCVXlk8zg+U1
 5UZRUH8Tg/7zkQ4BjSnIb3CMunbB/nvv3CNGRAzBFk7Md0eJNL9JuLFbm1Jf4x8L2eURNDlYWx0
 hJU1EZm6cMdngdO24nlJF6Pc2xs0ezy8LcouqXZoL0ULoafBaLrZBuc6jRvzRI7pFlRNzBF1tgt
 vKl91aQVNJb+7uSFU9QM36wF8Vzk/3itwGjXvJvJ2717tuWQuzossGQyUELKb8HQ8uOqe6Hlzck
 Y/6PkFD6N2XctGuyh5VzRtbeGQV7hHo3LfK15/Q3u5ddbD0PG5IwvFAiB8v67HsBf0hnBWqDcv6
 XJMqSXsb/669A1/xfzF10WSvJu8qTH7+JWqaEYI2tHGKYVUf6mVeog3cbOfSHlsuHpnwA3GHCgN
 N5PU/qVbr3oNrKWseMKrJPyd8PAn112K0Dm/qPkp+7z24aLwNJ3fgeKghPh1Y=
X-Google-Smtp-Source: AGHT+IEHYRvD7hq42mCwI2aLKv7F5lVXS2SHsFyfxpXbBk1ir1DO9ZQE/5l1NoYaYnM2SJIL+BGJXQ==
X-Received: by 2002:a05:6a00:8d8e:b0:7b9:ef46:ec61 with SMTP id
 d2e1a72fcca58-81b7f108957mr5322486b3a.26.1767867063293; 
 Thu, 08 Jan 2026 02:11:03 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819baa19242sm7318484b3a.7.2026.01.08.02.11.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Jan 2026 02:11:02 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: align tinylcd write_reg args
Date: Thu,  8 Jan 2026 15:40:57 +0530
Message-ID: <20260108101057.9340-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108094709.92561-1-chaitanyamishra.ai@gmail.com>
References: <20260108094709.92561-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 08 Jan 2026 10:56:33 +0000
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

Thanks Greg,

Agreed. This change does not improve readability, and checkpatch is only a guide.
I will drop this patch.

Regards,
Chaitanya
