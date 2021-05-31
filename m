Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BCA3966BB
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 19:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD846E947;
	Mon, 31 May 2021 17:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312276E947
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 17:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 5CB053F91D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 19:17:38 +0200 (CEST)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="Jk8gXgZX";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.717
X-Spam-Level: 
X-Spam-Status: No, score=-2.717 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.618,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1kGUfG_cEsT for <dri-devel@lists.freedesktop.org>;
 Mon, 31 May 2021 19:17:36 +0200 (CEST)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 7E2CE3F820
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 19:17:36 +0200 (CEST)
Received: from [192.168.0.209] (irdmzpr01-ext.ir.intel.com [192.198.151.36])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 99F0D3600DD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 19:17:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622481455; bh=Jp/dDJX6OR22eVXJNeMWLTU0E9wMfeJW7rnGV+q15NE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Jk8gXgZXWu1c1+BUe6G1wjR4ED4ZoNCzqJH6hrHT7K0ioGXPR7mJ9mcbYDdLmWLCy
 bHSyKfLLsleNfxHmmKiDNFmVX8xEvSzZxgqceI+eTHViUsSUtEUFjIqLL34e6/rUJX
 S7+/H3DLFQsuix/BybiW/6GU3ozirYfhn/4GHZiQ=
Subject: Re: [PATCH v7 15/15] drm/i915: Use ttm mmap handling for ttm bo's.
To: dri-devel@lists.freedesktop.org
References: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
 <20210531121940.267032-16-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <bbef47d0-e465-9cab-a68f-818431fca868@shipmail.org>
Date: Mon, 31 May 2021 19:17:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210531121940.267032-16-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 5/31/21 2:19 PM, Thomas Hellström wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> Use the ttm handlers for servicing page faults, and vm_access.
>
> We do our own validation of read-only access, otherwise use the
> ttm handlers as much as possible.
>
> Because the ttm handlers expect the vma_node at vma->base, we slightly
> need to massage the mmap handlers to look at vma_node->driver_private
> to fetch the bo, if it's NULL, we assume i915's normal mmap_offset uapi
> is used.
>
> This is the easiest way to achieve compatibility without changing ttm's
> semantics.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


