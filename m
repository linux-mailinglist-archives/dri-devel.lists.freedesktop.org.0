Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76F4854F2C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 17:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D5810E013;
	Wed, 14 Feb 2024 16:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="bom7zw32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.damsy.net (mail.damsy.net [85.90.245.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0DA10E013;
 Wed, 14 Feb 2024 16:54:50 +0000 (UTC)
Message-ID: <645c241d-21ae-4b03-82e0-84eac1355269@damsy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=damsy.net; s=201803;
 t=1707929689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nboMYgNDy9pIH3TJ4ZbKU0pYFKnkSMT1bkJGnsLyAY=;
 b=bom7zw32pw8EoI/diDAPtBDqNqg2+pOmnom/tAJUIZQtXdqMGASvlqnKbRkkb+4uHVjMJw
 PRr/eUK6Z2pHq5QDVv4IKWUMpH/SY0kzZpxVizw1eNnc7VAbimrcU9a9gYYBCFy6aAAyB9
 JQZ7fnBX6zI7Bcwymv4EdUOsRI2ar6rpLpu2GiqDQu8aEo5y0P01idDCmYDDMkfDt+PHrG
 eT+hV8GUX2Wv568vs7TJ7NHpmyjGXy4Ja+/8dRG9ryLHFvHx+vucwoGM5OE1eyjNobZGNf
 9HRTFIhbdUAdNdFyqb9kS95IXv2PQVW0O95GfXmlPyW5QNDU7fmX1FT4A2mdRg==
Date: Wed, 14 Feb 2024 17:54:48 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/6] tracing, dma-buf: add a trace_dma_fence_sync_to
 event
Content-Language: fr
To: Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
 <137e8d79-bf19-4782-918e-0c09b029e3aa@amd.com>
 <20240214101041.2fbf9b87@gandalf.local.home>
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20240214101041.2fbf9b87@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 14/02/2024 à 16:10, Steven Rostedt a écrit :
> On Wed, 14 Feb 2024 13:00:16 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
>>> +DEFINE_EVENT(dma_fence_from, dma_fence_sync_to,
>>
>> For a single event you should probably use TRACE_EVENT() instead of
>> declaring a class. A class is only used if you have multiple events with
>> the same parameters.
> 
> FYI, TRACE_EVENT() is actually defined as:
> 
> #define TRACE_EVENT(name, proto, args, tstruct, assign, print) \
> 	DECLARE_EVENT_CLASS(name,			       \
> 			     PARAMS(proto),		       \
> 			     PARAMS(args),		       \
> 			     PARAMS(tstruct),		       \
> 			     PARAMS(assign),		       \
> 			     PARAMS(print));		       \
> 	DEFINE_EVENT(name, name, PARAMS(proto), PARAMS(args));
> 
> So basically, you could really just declare one TRACE_EVENT() and add
> DEFINE_EVENT()s on top of it ;)
> 
> I never recommended that because I thought it would be confusing.


Thanks Steve and Christian for your feedback.

I'm integrating your suggestions in my branch and will re-send the series
after more testing.


Pierre-Eric


> 
> -- Steve
