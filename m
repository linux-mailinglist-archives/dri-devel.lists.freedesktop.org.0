Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECDF48726D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C0911322C;
	Fri,  7 Jan 2022 05:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5CD113220;
 Fri,  7 Jan 2022 05:29:56 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id s6so5907439ioj.0;
 Thu, 06 Jan 2022 21:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e63T25IY0LrfOuX+XUbFrW7daTp0yjRBy27VA81f73c=;
 b=lrazqIvRI7nkcOWlxTYZ9i/W0BZLR+6pq9AkUgro+ggvyCEnHKGma1fZ9YSYg9sLXs
 t7BZGjrvTexU9tKlOt269njn3U2ieCQjxn3V0E4N2eAeb9iyPqe2sWWyYgK0Nfuor0Kj
 7o8gVKi/QiHWa/zkHJSlpIbe+W1LFcV611bn1lba/8aTTOeI83SnxuUYqeOkhgc6fxis
 r+O2Hwht/mRN4l4ezOOBpeBeIejoXY9HrP/Tk+J5BH7NbzBXo4W18iiRxzUKlMX/9Qdf
 Q+RYhwObXjtRB9E85C74C9P6wIQKJ1j6GGz/BxLvSV3lqWyMnulc0/m7dOnhr0Pm/FNa
 maLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e63T25IY0LrfOuX+XUbFrW7daTp0yjRBy27VA81f73c=;
 b=3z7aTr3H1zukGY89l5ehwNEMpv1EYxTH73DRQeKMMAqEjMyFIOZ6ec2vXemo0sP84V
 NNzUoYafao+CfLyZmNeLCj9auvlaCVwzG7yIi2Xxq+V0E6ayo7xSwybLp3agQETyJTk5
 yLkKFEMyG0ylHLz7XA+nFfz9gDRXUVXBf9WWbNkRvu9ZsrDnVdEnowX1aBUoz4tBcnfv
 7APLR02mNus4xbe9kJBsDLwXVZZm4HYlX+NPJSjpTYBMjc6k7iniF4X4bvGYJeSM3aw2
 8eg6ynQnJww4Gs2I8n13WuSveEEew5cBMnngwYfCSf3JEBELBVCKsyHTqjQaVAAavXEd
 GYfg==
X-Gm-Message-State: AOAM533J4LNYZzM/XfMJvizD/z6cbo6Q4Koy8CYrP513KIzXaqYkxrdT
 lJ/YuV/CnfLiRtbirsUrdXU=
X-Google-Smtp-Source: ABdhPJzCJ4a/OeMh5+Vd7ifGWNtNlzms8nsxPhCodTm0c6KSDOhbHpofTWUlQSognE0poa4IEhOEPg==
X-Received: by 2002:a05:6638:2505:: with SMTP id
 v5mr31095831jat.250.1641533396065; 
 Thu, 06 Jan 2022 21:29:56 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:29:55 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 05/19] dyndbg: add desc, dev fields to event record
Date: Thu,  6 Jan 2022 22:29:28 -0700
Message-Id: <20220107052942.1349447-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit:HEAD~1 added pr_debug(), dev_dbg() params to the new events,
but didn't actually capture the params.  Do that now; add the other
TP_* parts: __fields, fast-assign, and printk elements for the
desccriptor and device params.

The message capture part is copied from printk:console, it gets the
whole message, including dyndbg's prefixing: the dev_name() etc, the
optional module:function:line decorations, and the trailing newline
(which is trimmed).

dyndbg->trace-events must be enabled on both sides:

  in tracefs:	echo 1 > /sys/kernel/tracing/events/dyndbg/enable
  in dyndbg:	echo module drm +T > /proc/dynamic_debug/control

This is good; it gives 2 orthogonal cuts at trace traffic, dyndbg can
enable callsites indvidually, tracefs can (in principle) filter and
trigger on the incoming event stream.

ATM, TP_print adds "__entry->desc->{modname,function}", which is
redundant with +Tmf enabled callsites.

RFC

Perhaps the whole decorations/prefix should be excluded from the event
capture ?  Vincent's skip-past-KERN_DEBUG trick could be extended to
skip part or all of the prefix, and leave the "decorating" of events
solely to TP_printk.  Whats the right separation of concerns ?

NB: __entry->desc is a pointer into kernel .data, a pretty stable
reference, at least while the kernel is running.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/trace/events/dyndbg.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/trace/events/dyndbg.h b/include/trace/events/dyndbg.h
index 82620b10e968..2ac296cb451c 100644
--- a/include/trace/events/dyndbg.h
+++ b/include/trace/events/dyndbg.h
@@ -14,10 +14,12 @@ TRACE_EVENT(prdbg,
 	TP_ARGS(desc, text, len),
 
 	TP_STRUCT__entry(
+		__field(const struct _ddebug *, desc)
 		__dynamic_array(char, msg, len + 1)
 	),
 
 	TP_fast_assign(
+		__entry->desc = desc;
 		/*
 		 * Each trace entry is printed in a new line.
 		 * If the msg finishes with '\n', cut it off
@@ -30,8 +32,8 @@ TRACE_EVENT(prdbg,
 		__get_str(msg)[len] = 0;
 	),
 
-	TP_printk("%s", __get_str(msg))
-
+	TP_printk("%s.%s %s", __entry->desc->modname,
+		  __entry->desc->function, __get_str(msg))
 );
 
 /* capture dev_dbg() callsite descriptor, device, and message */
@@ -42,10 +44,14 @@ TRACE_EVENT(devdbg,
 	TP_ARGS(desc, dev, text, len),
 
 	TP_STRUCT__entry(
+		__field(const struct _ddebug *, desc)
+		__field(const struct device *, dev)
 		__dynamic_array(char, msg, len + 1)
 	),
 
 	TP_fast_assign(
+		__entry->desc = desc;
+		__entry->dev = (struct device *) dev;
 		/*
 		 * Each trace entry is printed in a new line.
 		 * If the msg finishes with '\n', cut it off
@@ -58,7 +64,8 @@ TRACE_EVENT(devdbg,
 		__get_str(msg)[len] = 0;
 	),
 
-	TP_printk("%s", __get_str(msg))
+	TP_printk("%s.%s %s", __entry->desc->modname,
+		  __entry->desc->function, __get_str(msg))
 );
 
 #endif /* _TRACE_DYNDBG_H */
-- 
2.33.1

