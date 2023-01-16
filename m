Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7676B66BC62
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935BB10E3DD;
	Mon, 16 Jan 2023 11:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839E510E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:05:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 71F3566029A5;
 Mon, 16 Jan 2023 11:05:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673867118;
 bh=htf5m+dEajh/x4v4FDRIVjzEfi52bY5gVKw3SN72TMo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PO1DVpfTQLEHpJ47AVAbFQbQLSdJI6dJjCXVKff6i1h5RRWaSKuqJe0xKawaEO7Wg
 Fyqir+E5+ahoQLDGfHRYeSmxD5Ny/Zurzgz6A/hyY0L+W6i4UTEW9tnjpyb+S8HJ6P
 q9URxNgMs+grpW1QO6UoBNnTb32iULlVBNgWGW3zrGb6VXyjckKircCoeBmxKAGPXV
 LSI6QUKl/vJgzonIiPWCTGkUYBf/TswTJgHuU5lChjCa30/aC3+llcHkPKan8ptbO2
 39V8fucbdl9LObDrORODKNJN8yl08IlZ5SkiOOkoAijdbOfRyWjhNtC70gsbT+kdYn
 ndNJMgvl7nzKA==
Date: Mon, 16 Jan 2023 12:05:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH RFC 0/4] drm/panfrost: Expose memory usage stats through
 fdinfo
Message-ID: <20230116120515.1cd3243d@collabora.com>
In-Reply-To: <5b4f73a1-60bf-7da6-e94d-fca9f6ec7c3a@arm.com>
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
 <5b4f73a1-60bf-7da6-e94d-fca9f6ec7c3a@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

On Mon, 16 Jan 2023 10:30:21 +0000
Steven Price <steven.price@arm.com> wrote:

> On 04/01/2023 13:03, Boris Brezillon wrote:
> > Hello,
> > 
> > Here's an attempt at exposing some memory usage stats through fdinfo,
> > which recently proved useful in debugging a memory leak. Not entirely
> > sure the name I chose are accurate, so feel free to propose
> > alternatives, and let me know if you see any other mem-related stuff
> > that would be interesting to expose.  
> 
> Sorry it's taken me a while to look at this - I'm still working through
> the holiday backlog.
> 
> The names look reasonable to me, and I gave this a quick spin and it
> seemed to work (the numbers reported looks reasonable). As Daniel
> suggested it would be good if some of the boiler plate fdinfo code could
> be moved to generic code (although to be fair there's not much here).
> 
> Of course what we're missing is the 'engine' usage information for
> gputop - it's been on my todo list of a while, but I'm more than happy
> for you to do it for me ;) It's somewhat more tricky because of the
> whole 'queuing' on slots mechanism that Mali has. But we obviously
> shouldn't block this memory implementation on that, it can be added
> afterwards.

Yeah, we've been discussing this drm-engine-xxx feature with Chris, and
I was telling him there's no easy way to get accurate numbers when
_NEXT queuing is involved. It all depends on whether we're able to
process the first job DONE interrupt before the second one kicks in, and
even then, we can't tell for sure for how long the second job has been
running when we get to process the first job interrupt. Inserting
WRITE_JOB(CYCLE_COUNT) before a job chain is doable, but inserting it
after isn't, and I'm not sure we want to add such tricks to the kernel
driver anyway. Don't know if you have any better ideas. If not, I guess
we can leave with this inaccuracy and still expose drm-engine-xxx...

Regards,

Boris
