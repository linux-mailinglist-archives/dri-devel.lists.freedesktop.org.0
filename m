Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B143A36C78
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 08:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D80810E183;
	Sat, 15 Feb 2025 07:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YTN/HZ2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A917010E181
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739605097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9SPJu0ZBIiiVkYEwkjayrxT/oy/c7Iuvd5fIj5BIhro=;
 b=YTN/HZ2JRUgoiwan/uolT3/axdZHXZScuBGo4TWI+q+CILKvGQWrDqcmpSjKFyoCbCpJUE
 bMAWOLYEqY82EorVagm5oz9KVGYcLVn5CJMuhEEgFwZOh9RtgXwReb828onOP4mXwI8t9i
 Cy/Gex0tniysI4tQsLgy/tbKJcfAsAo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-suv893FhNcGxlNmL24lZfQ-1; Sat, 15 Feb 2025 02:38:15 -0500
X-MC-Unique: suv893FhNcGxlNmL24lZfQ-1
X-Mimecast-MFC-AGG-ID: suv893FhNcGxlNmL24lZfQ_1739605095
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5dece867fe2so3003578a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 23:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739605094; x=1740209894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9SPJu0ZBIiiVkYEwkjayrxT/oy/c7Iuvd5fIj5BIhro=;
 b=m0n6x5gFIBMeURL9S9kNLpFJ/wgr7AIkAZE5dh4piKPxPZ7GSjDtqgmiA+go8aIXJ+
 HwJOdMrijpfp7fkmXmgcNWHn7VFV87MsODzKqaDhu8/p4SWbcjdI/gF9uM2/E//PayKo
 K1Ovw8d26f/fW8biBXTN4MY4Ct5pk3LddWYmcixvV8FDWOQZYcIjdyJ7qnuC4VtkEOSu
 ro3fm2P7K1eK/Umw/bOvxvHzYF8YOpdVtaR6mFuHqZWFN9y4Y3J7d1eHlodIX3zD+KnT
 p62xuqMNUlIHd2KNqS/6mgJYbHEyUVxACz2wFBYdYA7EcPaXvi+30inkni5dRHOp69U8
 pk8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz8xZEaYFRJWyIEYFc9PmyL4JD2sk8u0ee/J1aRMwVxRyw9E2GRlCeBaO+Mp+4rntNJA6dUqOsosU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNDFog3FzdQ0x9Vnz1GC0eLR4LLS4kJKhUgen0fpir0OQGTmVa
 HnKYH2ohXLT+geMq1o8bNh1GUra3Muz4K7cFUd201pTkTcPI+0M0hd04yX3HmchoqsEkJiV+8h6
 U8IduYRTzBkcBpK9riFeLLku97Pt8sklvbFcm32FreMFM7dpcfNImDaddg+kIfGh8gA==
X-Gm-Gg: ASbGncvG3MQZ4rw45HHc2HDU5CN5taSdOmDgRFCch9KO9BuXhq3MiiYVJwFvmbSL/Ck
 RQlgRl7phnv8Y8kw8tcr2dugvDZBVCGU2/98gcWLsd/vsg7j845mKpsQk41a0e+buZEe1EpyD0G
 kNOUpzy0nIkLkilZxF79mkMIG0/p4uGjYmQfthrP/BaoICAMnKk/9GumZb4GqFdEUh/2/MwoSpw
 K/1+W8KBE1ci3OXq0e310e7q9lrLjPfmY2DG6EQ6rBIviLGRwJWnBDp+mxclKkCFkaqJ+wqyav6
 TzA=
X-Received: by 2002:a05:6402:1ece:b0:5de:aa54:dc30 with SMTP id
 4fb4d7f45d1cf-5e0360441bbmr1752476a12.5.1739605094578; 
 Fri, 14 Feb 2025 23:38:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFHAhvVe5Py0hdiB94bUaSN07AMDxg4HYAot7e2ntkAqpIGaEmu0Phl9/Q2zVhnBH9f47G6g==
X-Received: by 2002:a05:6402:1ece:b0:5de:aa54:dc30 with SMTP id
 4fb4d7f45d1cf-5e0360441bbmr1752458a12.5.1739605094200; 
 Fri, 14 Feb 2025 23:38:14 -0800 (PST)
Received: from kherbst.lan ([188.192.20.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ded69e7c33sm3195322a12.61.2025.02.14.23.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 23:38:13 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>
Subject: [PATCH 0/1] Me stepping down as a nouveau kernel maintainer
Date: Sat, 15 Feb 2025 08:37:52 +0100
Message-ID: <20250215073753.1217002-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i7LN3XHnLelMrGk_IJG56qUYTNheK2kp4ouw6YwWcOI_1739605095
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

I was writing this up on Wednesday night, chatted with a few folks about
it. A lot of things have happened. I often thought about at least
contributing some patches again once I find the time, but...

Anyway, you'll find a full and proper statement in the patch itself. And I
wish everybody the best of luck and all the strength needed.

Karol Herbst (1):
  MAINTAINERS: Remove myself

 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

-- 
2.48.1

