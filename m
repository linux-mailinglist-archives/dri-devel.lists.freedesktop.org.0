Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2A32D0C2E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5DB89EA6;
	Mon,  7 Dec 2020 08:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E16689E19;
 Sun,  6 Dec 2020 23:38:31 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607297908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bjqz+hjJciJbCQnVpiDKgr3Q9Y+jnybckoiwihl3Fcw=;
 b=adp/GKZCMZB6IC8fVFDIjpVFc+NIWzBbrXAvVBM3Odi9ixgNP/7nY9iRsLQN2oeHHSUug+
 IXEcqwuA6ApaFy5+0nutlp/1yqfzn5jUtEX1J9wQVB8zYOkNi0PWcpNlTBI+A0hL1ES75L
 tw6LVg482B4oO714qA45CXzifLXXBO1nDnmamsu4kdlVSFw2RNXDkyw37rm+fVFbr/uxZw
 wnXMK/GRmctfIITDAbYx8ZHrbflHFp+uS5Vh2GMjaMlXZGyy1Jjdo2Ogqrg3vI8W8NqTaa
 cJiQnxiIlejjh99QBZaIZWw8PqmQqm3urNznsyNFTPdYcOJ957mP5nPtGWj5yA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607297908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bjqz+hjJciJbCQnVpiDKgr3Q9Y+jnybckoiwihl3Fcw=;
 b=hlJXpVRtWU+ZUH6w367giSLOzLiSRWaIHANcf2mEt885O1uQNeFIxATYOZxF/rkH0IxGTq
 2ts4xQm5vnLQYkAQ==
To: Jerry Snitselaar <jsnitsel@redhat.com>
Subject: Re: [PATCH v3 2/4] drm/i915/pmu: Use kstat_irqs to get interrupt count
In-Reply-To: <87im9ehaim.fsf@redhat.com>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-3-jsnitsel@redhat.com>
 <875z5e99ez.fsf@nanos.tec.linutronix.de> <87im9ehaim.fsf@redhat.com>
Date: Mon, 07 Dec 2020 00:38:28 +0100
Message-ID: <87im9e7bez.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: Peter Zijlstra <peterz@infradead.org>, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@linux.ie>, Matthew Garrett <mjg59@google.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 06 2020 at 14:47, Jerry Snitselaar wrote:
> Thomas Gleixner @ 2020-12-06 09:38 MST:
>
> I don't know the history behind this bit. I stumbled across it in cscope
> when looking for places using kstat_irqs.

I'm not ranting at you. The i915 people are on Cc.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
