Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E5D9E680D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 08:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5D810E5F3;
	Fri,  6 Dec 2024 07:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="T4AcJqsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A55210E5F4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 07:38:37 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-e3892eb6b1dso2897126276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 23:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733470716; x=1734075516;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=08qPRW9xswRt2OtHroBUTIZrJ7mnuAOFiexcUCiCKeI=;
 b=T4AcJqsBu+XWcDe4l94DD9ugSKwn2ejY/TMl+phIYmx/hypOUSWbvgdHRclz1njGMU
 B5a7iKJPffqSCKXdylrz9XUyC/ksd4dGip5b31QGGIL+th2JDjWHZ1wBHx0mo6parGcH
 LJQD9VcooPRXddkhAoUw+PLZiZ55P5oVNKmwlgKLby1SpokYVwz53ycFCt8Xmg7Z+Rq/
 bjQoAbEwevX9IT5HYdJ4OfnAYjTAKX/YipCKKzU/frjXl5urxo3zN92W+vuj8InYp6bc
 jhoRcWv30S5nFVbzftHLYe+nig4GAbU8vVRW07O0YCC8cuOuNVJ1KlOBggcSLcBYMHdw
 9R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733470716; x=1734075516;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=08qPRW9xswRt2OtHroBUTIZrJ7mnuAOFiexcUCiCKeI=;
 b=lnBg6epNshiNX6MiMeox74lm5kOknBz8fhq/obUq2ii3STgLVIw0R1qaDPJdqj2eFU
 F4NZSkiAX0zvA3Xs4Gq4hdzczcITty+ooCF7R2YNIt9bodPezYH58q58GuQST/fHQYZ8
 v26v/GUmqwZZ2rc6rSxH5BE0bKKM5YKIUy3i8a4VD5Mn/6q50ElinluVih2Gb+VTxyOz
 YiczqgvxYMFq8fxgG/0K28UL4htGz2ESCgsN9j9GWfI4r/4w0zrDAxV4Ry1H6lWzdQZa
 Yr/0NFTRYWAqHbhWUJDygYSWSzlpcMgOWRgna8GnDoeFJF19CTjYD/E7Z66hty/bWxRD
 jp3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVtUACM4h0csk7wXsZd2HkE8JDBFpImGHYQWlZVb822yDlpAWQtAbW/LbDpD3354sh4mEh2HK9fpI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhRXKsvUjR2kjBEPGjm6JF18yVFU0gEXVwTh1VfakVgr2vd2yF
 U6hja34270fIa7k8Q/VHEVXXuGZ8AZR+3K3V0ddOZkWuK7S7KpouaUbT4M8afrAZ0qQ8hHubqDA
 VonJncQ==
X-Google-Smtp-Source: AGHT+IEDRTiD4aFoP45cgyoosz12ZeHtxiOVt8IhT1Y6gGd2sajlkNmKprLDP9GTdgZBV9Sm7Qm7+AXk6YX4
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:bff4:a354:8911:79b3])
 (user=irogers job=sendgmr) by 2002:a25:fc1c:0:b0:e33:111b:c6a4 with SMTP id
 3f1490d57ef6-e3a0b073bbdmr902276.1.1733470716612; Thu, 05 Dec 2024 23:38:36
 -0800 (PST)
Date: Thu,  5 Dec 2024 23:38:27 -0800
In-Reply-To: <20241206073828.1119464-1-irogers@google.com>
Message-Id: <20241206073828.1119464-3-irogers@google.com>
Mime-Version: 1.0
References: <20241206073828.1119464-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Subject: [PATCH v5 3/4] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>,
 "G . Branden Robinson" <g.branden.robinson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-man@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Make the sections about eventfd, epoll, signalfd, inotify, fanotify,
timerfd better separated with a clearer subsection header.
---
 man/man5/proc_pid_fdinfo.5 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 2797ae216..c4914f1f3 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -57,6 +57,7 @@ is the ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
 .RE
+.SS eventfd
 .P
 For eventfd file descriptors (see
 .BR eventfd (2)),
@@ -75,6 +76,7 @@ eventfd\-count:               40
 .P
 .I eventfd\-count
 is the current value of the eventfd counter, in hexadecimal.
+.SS epoll
 .P
 For epoll file descriptors (see
 .BR epoll (7)),
@@ -108,6 +110,7 @@ descriptor.
 The
 .I data
 field is the data value associated with this file descriptor.
+.SS signalfd
 .P
 For signalfd file descriptors (see
 .BR signalfd (2)),
@@ -133,6 +136,7 @@ and
 .BR SIGQUIT ;
 see
 .BR signal (7).)
+.SS inotify
 .P
 For inotify file descriptors (see
 .BR inotify (7)),
@@ -173,6 +177,7 @@ file is exposed as a file handle, via three hexadecimal fields:
 .IR fhandle\-type ,
 and
 .IR f_handle .
+.SS fanotify
 .P
 For fanotify file descriptors (see
 .BR fanotify (7)),
@@ -229,6 +234,7 @@ The mask of events that are ignored for this mark
 .P
 For details on these fields, see
 .BR fanotify_mark (2).
+.SS timerfd
 .P
 For timerfd file descriptors (see
 .BR timerfd (2)),
-- 
2.47.0.338.g60cca15819-goog

