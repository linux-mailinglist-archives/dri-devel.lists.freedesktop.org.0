Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA10A24E36
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 14:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C23810E046;
	Sun,  2 Feb 2025 13:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nKaRFTdn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F7F10E046;
 Sun,  2 Feb 2025 13:27:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43635796b48so21395995e9.0; 
 Sun, 02 Feb 2025 05:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738502831; x=1739107631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WAvOQI1Wn4DH9Wv7uUKNmkcHNCqY1/iZtJSY08Wnp3U=;
 b=nKaRFTdnhg+Tto1tqkOweOaxUZzGpTh4faAPU50vw1+I/hJ6OmD7IyKcuMSoYX0E8o
 Z9LFvaGAmLz9URYSljaf/5wC3/6navmL0GFOtycQVIwm0qaSInxznoDlkiw6GqLEvRBB
 VuOHGQl8aKGkWun/YpijvJHiSvWjLUbjk/7aS2Ip73G+APGHgcb5jTeAL4F0yZqXB9+7
 XXNeThsYcv2TEF17PayCBGkqHu91lZ0QGC6bPjH2lGqOV8Puoe1foiWyZHe+VPskO1yG
 8FvNZ71/38ZLAdcTdlVMAQYwYZdpGRr28DsLGcnG2DkSL8OG4te4k4p1eyBdRYUofsMb
 Xy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738502831; x=1739107631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WAvOQI1Wn4DH9Wv7uUKNmkcHNCqY1/iZtJSY08Wnp3U=;
 b=iiRXXTqyezfM+Q5AhbQpUY3G0Ip1pDuD7LDsx+nqRvvpcvNfrNnBup4BRYmbCZ/OY5
 oVnpexwHvzdc56RMRZpmFYkKhxwyqCFIOD+VaWpNs8JNrb2iHAVv2VA6VwDgqcZtFF12
 Hh6aF8AeX1UAXTMSOsta+u0bYuTnSuLAyL7oub5W2MSjgPbHJ8w8tEBSMW4TsctFCZys
 kUfYtPdJXy5lcmDD/L/b34PAxGg+FE20mGEjO3oMuyjB6LoC4dw3/IZr1v17O/0l+2k4
 0zchFKEILjwgZFv5sbZ3fmUCdB58C1SnVWgjozfNJ6lsjOgNiyHUK4rCGtkNMCR1T5/L
 4jQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX61arZkrxceIjAu91rIJZSewx5QBo29HXIt8h8ql31m3EnczlgqgydemlHtDuQ49B/n2tDvEaFDKwo@lists.freedesktop.org,
 AJvYcCXAB+uQxOg4sN0zoac5eDIESePR5fTxCVVoP5ssi+UZjGUPOi2JGRgKAkavmGKt5Xp4adbHPpk4LEc=@lists.freedesktop.org,
 AJvYcCXToiMEZWV0SwML//7kOjIYg3YVY1Art5W7i6Rpay7NXqm4OPUb5FrgTdNKv+MSs6r+SHjT7xrQOQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwJs51Oxxs2tb83vljxfvtAW4V0oS7Y1j+tzqFG2hH+uqFRrOv
 E0b5Yn5ujALufjiF1Lj5gPEZ9kSdtADFQhJ1mHZyL5cvfusjt+Gx
X-Gm-Gg: ASbGncsafdCgx+gfSj0jksUtX0sTttWR01S/HryphD7SlgvDOlx2udMXF/TAiQbTLUU
 iW8DpI3pgSfqpl+9QNLpybiAEgq+FC1uFJTad+ZLgHFGJSau75JkMrdx0002AyogieT3uTSe0kW
 V+SAo9UuXLC9SRp+s+DjcIUK4qF99RYGNytJtT2VD+/Wu9MY4a3rLZFGYkroLvvThFpvJkB82eB
 Dccw3Lrh/2UewTJlQ7bwx8GAzJQilqXYXHbzyIjqmEm65Nb+xolLAu5rxrNnvkQL/4TIiLRRMWp
 Lw7Ituvheirf72CBvTluaBv88/QVelc6uVdmX4GDfOpkbnIb82PHCw==
X-Google-Smtp-Source: AGHT+IFhxc419TFWlww4Aer27PrCQcXjY0iJFZ6vSCeovYji+JiCAIeiqg0F1EozClpYtrlYh0mnDw==
X-Received: by 2002:a05:600c:34c6:b0:436:1b77:b5aa with SMTP id
 5b1f17b1804b1-438e6ed5faamr75285655e9.8.1738502830692; 
 Sun, 02 Feb 2025 05:27:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d444bsm122686965e9.8.2025.02.02.05.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 05:27:10 -0800 (PST)
Date: Sun, 2 Feb 2025 13:27:09 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Guenter Roeck
 <linux@roeck-us.net>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/backlight: Return immediately when scale()
 finds invalid parameters
Message-ID: <20250202132709.3ab54376@pumpkin>
In-Reply-To: <CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
References: <20250121145203.2851237-1-linux@roeck-us.net>
 <Z5AmlJ8stVQ4L5jS@intel.com>
 <CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 21 Jan 2025 15:15:09 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, 21 Jan 2025 at 14:59, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >
> > I'm pushing this soon to drm-intel-next, unless Linus want to take
> > this one directly to his tree  
> 
> Let's just go through the proper channels and go through the drm tree.
> 
> Unless I've issed something, I think this is only an active issue on
> parisc (and only with certain compiler versions at that), so it isn't
> some super-urgent thing that needs to be expedited.

It probably wants pushing into rc-2.
The build bot is complaining again.

	David
