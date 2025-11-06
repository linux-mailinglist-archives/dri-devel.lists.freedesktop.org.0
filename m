Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8A8C3BE92
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA7710E914;
	Thu,  6 Nov 2025 14:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S0cxmtmR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BAC10E908;
 Thu,  6 Nov 2025 14:58:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 33DF44165A;
 Thu,  6 Nov 2025 14:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6199C4CEF7;
 Thu,  6 Nov 2025 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762441084;
 bh=3MzzI7eda1HcBKQQLuDs92NFebxA65nvy9xo/gSXejE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S0cxmtmRiyLuJnpNgUqFMrYRYHP/Sn3IgwSPXA8zVNJ27uJVauSMUd3DujH71CqqQ
 FT3LlbX89aDaiTBvzk0ucsearN8iQvLDJgZTogLtm+FBd8IYX5rCKzq4ogBK+t57eN
 0/JFB7NXK0SKQs3mkT+qRI4K5VsW/vx0SxLbc3wkUor4L3aBB/ASw4HbPgFa94ssjB
 Q3RsecprggSAaQMRQJju9/TzV/dUo6iOfjP+8JJQnluWV4LzUqcanJ7oibMmd5fhxN
 CTn/6n/TfbDuTjs8i2OUjKFRf4x504KwZwRe4fXlpH241YkgORAn0vKMM1ZBVrkkvg
 CYEtvZSJUynWA==
Date: Thu, 6 Nov 2025 06:58:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 "Zack McKevitt" <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner
 <lukas@wunner.de>, Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
Message-ID: <20251106065802.76d8ac77@kernel.org>
In-Reply-To: <aQyi_VL5AzzXsYtT@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <20250929214415.326414-5-rodrigo.vivi@intel.com>
 <20251030183254.10d64ee1@kernel.org> <aQyi_VL5AzzXsYtT@intel.com>
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

On Thu, 6 Nov 2025 08:30:37 -0500 Rodrigo Vivi wrote:
> > If you're using Fedora or another good distro ynl CLI is packaged (for
> > Fedora in kernel-tools). The in-tree syntax is a bit verbose.  
> 
> I didn't know this tool was getting package with the kernel-tools
> I thought it was only helping for debug during the development.
> 
> Now I'm even wondering if we really need to code a user-space tool
> for this drm-ras, or simply recommending the kernel-tools/ynl as
> the official consumer of this API.

Right, depends on the intended use of the API. In many cases,
especially for configuration interfaces we no longer write separate 
CLI tools. But for certain things typing in the JSON gets a bit
tedious, and other cases need some sort of summarization if the kernel
output is too verbose. So YMMV.

> > Separate handling of -EMSGSIZE and returning skb->len is not necessary
> > as of a few releases ago. Just return ret; core will do the right thing
> > if ret == -EMSGSIZE and skb->len != 0  
> 
> Any good modern example that I could get the right inspiration from?

It's a moving target but:

net/core/netdev-genl.c
net/psp/psp_nl.c
