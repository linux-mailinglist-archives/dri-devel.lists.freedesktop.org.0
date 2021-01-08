Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9232EEAA4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 02:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE886E5BF;
	Fri,  8 Jan 2021 01:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89AD6E5BF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 01:01:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 333DC2076E;
 Fri,  8 Jan 2021 01:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610067708;
 bh=NKUggXfpZoH7IqHHRR5QWltRsKDmLmNJObXFp2AwbFo=;
 h=Date:From:To:Subject:In-Reply-To:From;
 b=VuCwcsfw4hNEoFWpQvShhDEdJOP2jxhdhRXxpy+okQ8igZXRURzvPk7SOFL7A7//E
 DoBxvwAdQCRQJnaLkozQTHr9H0OiP5VD0DN69mPRGFCyJn0TqTaeKVZ4dBdvhIQTXF
 m8rF8geu//PDwVYhistGUA8bmxYpyX2piyyIHgG8AAbzgRmelSlCKPrQCpm2qqsbmv
 rBO0UwdUcsZ2e3rXwhc1cO4VzXFv0OK1D2aEFMck7aYJDlJigQxVPbn+MdzFJ4un6F
 9+kOKQkSJ8yfsUJhrD3TmkwUQWbuUQvwqgVTS0z0iRnh1xTGPcQs0ShxkqSdyHFgLv
 uVA7SQjfnstEg==
Date: Thu, 7 Jan 2021 19:01:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: nirmoy.das@amd.com, bhelgaas@google.com,
 ckoenig.leichtzumerken@gmail.com, linux-pci@vger.kernel.org,
 christian.koenig@amd.com, devspam@moreofthesa.me.uk,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/4] PCI: Add pci_rebar_bytes_to_size()
Message-ID: <20210108010147.GA1406822@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58F0BFBCD0%devspam@moreofthesa.me.uk>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 11:31:36PM +0000, Darren Salt wrote:
> I demand that Bjorn Helgaas may or may not have written...

?

> >> +static inline int pci_rebar_bytes_to_size(u64 bytes)
> >> +{
> >> +	bytes = roundup_pow_of_two(bytes);
> >> +	return max(ilog2(bytes), 20) - 20;
> 
> > This isn't returning a "size", is it?  It looks like it's returning the
> > log2 of the number of MB the BAR will be, i.e., the encoding used by the
> > Resizable BAR Control register "BAR Size" field.  Needs a brief comment to
> > that effect and/or a different function name.
> 
> Given that, it seems to me that pci_rebar_size_to_bytes should be similarly
> commented and/or renamed.

Makes sense.  Something like this is sufficient:

  return 1ULL << (size + 20);  /* Convert PCI_REBAR_CTRL "BAR Size" */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
