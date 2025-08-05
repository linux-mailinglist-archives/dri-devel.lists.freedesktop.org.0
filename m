Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1655CB1B8D5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 18:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717EC10E0BA;
	Tue,  5 Aug 2025 16:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="cRNqwbev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995D510E0BA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 16:55:33 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-879d2e419b9so3694026a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 09:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1754412933; x=1755017733;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1wkz91KHprB6isKf23cxufh6A8qop4qxhhEsx0NJGcM=;
 b=cRNqwbevbE0CSZW9yYIe6Oy914U2HSMuHUgHtxdTfoPdjhAQY17mwkGDl8tBfRmotw
 B8OjsnNy+Q0fKIyXtHBUv0pZ+rymtDMuesEqt1fbRET6ucUo23UbOxW9rdgohRvsCSUe
 9XSaoZe/IdUWUByeBdP5YuG2vNsO7wCVXnUeSAXO+fnre6aaMOJ1NRaNWHhTq/qbYBBM
 r7+SSqvKRjaL+EhKe9Ad6Nbo5QNxWybVUXMLF7zuIEXrlTfvfTCZSHyog5QBHessZ7Zk
 N39bcoZGmtQENqqBq5a2Y/afBpjEVytLRsKahfLYAXYHawtcovCq5L+s45fCmj5N3PKW
 8KWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754412933; x=1755017733;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1wkz91KHprB6isKf23cxufh6A8qop4qxhhEsx0NJGcM=;
 b=XyKFu24a21sbGHlEKmHcvyx1MXhPWyUYGOBaJ4n5WkAlOxkM8FseGXLWFK+86X2cTm
 2BPGxjvTGMWd0KK5/5RuzxLH513nu9x1HItGH8e8EkyuX5uFZ2dKzKJLCArxFP9z9UQc
 ZEwRo8T8lYFa9ofEeC5wWi8wO546Vm5omGX+wPHm2MwA9MGAIo4uYWkGvBmwLm6Z6+fX
 og2CsbO1kPViUDdwsDR7K1MHrZkhnO48zc5+xG8bqZZyQjuVOoPJJbQVNkMvwXwY6ubL
 aOsrmpLmHrqkczAphWeuQUp5o23RdHBwXz713eJ/Z/GfTIycrtXCrXI9Wqv/wbTtBDqD
 ErBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3baIzRMfKaJTkv0hw6SOMxhDekFNt9qfLD3djzrB/vcWYRI0/U2t+CclmWW9mSWl3cvmQF6KGgBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmrCdLzurimGZefQfJ7WXXCSFouZf/cYe2B7NKcdYifK3eQKNg
 /vh4T+E0JXAb2aOfAiIeoxDYw9YB4EkgM/eg4HtF60/QVaix4uxXRm7LdpLQIWEQ37I=
X-Gm-Gg: ASbGnctNNwuLfUWIkUV7kifYJf1EQKKM+o1laIAscDKJLguU6YlM01T/97h19raFjrw
 KxknUBbLkGL0IlDnW/h0FdnaCqPwyW9i6ojeAK1MXuYyL3x0P2RKeQ2jhX2wmxToQ50xCbyecFo
 c399atjKiyzZbpHGe0V6Kfn0TKtlSmKOfvaQLLnjzqDx7fsWODBq3Kmn1gf6HesQ37V/iBIeBUq
 BoabKY9mEqrBOFMZIi0cEka4xA5irNpRvZ51AwpS+c42EcSKn8EKMqNmDzBoyZeY7+hFH4WFWZJ
 N9P2mWBzkFPDuaCnFWcC50oBu/xk5l4XL5NKAER73GLgqkIGdfOlSCKC4QMud0aQ698ZxXUrd9B
 Rs9e6TEcKc3yamYkj+zE=
X-Google-Smtp-Source: AGHT+IGAfhYUa7PhuRsJVXdjeXsZjVW5MeNg35FqZ+gfJ661zQM8GUygCqYfQ1PuCGyCdesm2o1qQw==
X-Received: by 2002:a17:903:2f87:b0:23f:cf96:3071 with SMTP id
 d9443c01a7336-24247033f3dmr220933225ad.49.1754412932893; 
 Tue, 05 Aug 2025 09:55:32 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaf855sm138621195ad.168.2025.08.05.09.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 09:55:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 10:55:30 -0600
Message-Id: <DBUNH9S9HCXH.SIOBPAT3U91N@brighamcampbell.com>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] drm: Add directive to format code in comment
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Giant Sand Fans" <rampxxxx@gmail.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250804212902.22554-1-rampxxxx@gmail.com>
 <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
 <CABPJ0vgz6gib5LdKY1O6uhPq7Tk5GN2X_dcGBwtx3b=TRQUw-Q@mail.gmail.com>
In-Reply-To: <CABPJ0vgz6gib5LdKY1O6uhPq7Tk5GN2X_dcGBwtx3b=TRQUw-Q@mail.gmail.com>
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

On Tue Aug 5, 2025 at 5:53 AM MDT, Giant Sand Fans wrote:
> On Tue, 5 Aug 2025 at 12:49, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>> Fixes tag?
>    Sorry, what do you mean?

Dmitry is looking for a tag in the body of your patch (much like your
"Signed-off-by" tag) which describes the commit which introduced the bad
behavior[1]. In this case, it looks like this block was introduced with
the incorrect kerneldoc code block formatting by commit 471920ce25d5, so
the correct Fixes tag would look like the following:

Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")

[1]: https://docs.kernel.org/process/submitting-patches.html#using-reported=
-by-tested-by-reviewed-by-suggested-by-and-fixes

Cheers,
Brigham
