Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83414BC0ECA
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 11:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9C710E5C0;
	Tue,  7 Oct 2025 09:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BZWLmcJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266D610E5BF;
 Tue,  7 Oct 2025 09:51:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B048E43CA4;
 Tue,  7 Oct 2025 09:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EC3C4CEF1;
 Tue,  7 Oct 2025 09:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759830710;
 bh=+F+WB7SfIjeyyoWM7d4P0rGj/MP4s8/FSBTcJ/LmQFM=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=BZWLmcJFlRgLT8EklsUDGJeK9cg1sUOOkLgtg06SCcs6Cx6Xpo657P1rrw5sYALsn
 eaWRuI/+3t0qpCgr5+g/WzaD2ShUF7xvbFG0OIweeIhSP9cAIcdwehynIUNws1NFBA
 rr8FlJnjW2uhCN50VrUDtyZE+UvurFFE+yCCzFByygKakfUpewYcfMlr2UXSl0IX7l
 iZXHwWLbog05lDwsmObNR0z66px1DcC5tHVxPtpHvze0GZyqd4S7LLql+pyRjmfYfH
 33Ry58NEsfuGMG5nEBukEfOB454PvufwjLQvSevwfK5pXesi4iIKgg5MJaBmqQ5MtD
 oPQiqluUjsl6w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 11:51:47 +0200
Message-Id: <DDBZX652KAXI.22E6JCVD9FZ1F@kernel.org>
Subject: Re: [RFC PATCH 1/4] drm/sched: Add pending job list iterator
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <alexdeucher@gmail.com>, <pstanner@redhat.com>, "Philipp Stanner"
 <phasta@kernel.org>
To: "Matthew Brost" <matthew.brost@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251002051604.1865322-1-matthew.brost@intel.com>
 <20251002051604.1865322-2-matthew.brost@intel.com>
 <be806a5e-75c9-45da-962f-2c1db75b4a07@amd.com>
 <aOTKvgqYFk8kw6Tm@lstrano-desk.jf.intel.com>
 <aOTPMlBMHK/c5KBh@lstrano-desk.jf.intel.com>
 <43628878-d414-459c-acad-fe7bf1afa332@amd.com>
 <aOTg47xjxt6cFnIF@lstrano-desk.jf.intel.com>
In-Reply-To: <aOTg47xjxt6cFnIF@lstrano-desk.jf.intel.com>
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

On Tue Oct 7, 2025 at 11:44 AM CEST, Matthew Brost wrote:
> Honestly I'd just lean towards dropping the debug version then. It is
> basically useless information in Xe as the number of pending jobs can
> dervived from the ring's seqnos which is also printed.

Yes, either do that or provide a dedicated debugfs layer in the scheduler
itself.

For printing driver specific job information we can easily add a callback.
