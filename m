Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GXhFEmMlmn+hAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 05:06:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B0115BFBB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 05:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B2C10E673;
	Thu, 19 Feb 2026 04:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A6210E672;
 Thu, 19 Feb 2026 04:06:28 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id E296A3F1F5;
 Thu, 19 Feb 2026 05:06:24 +0100 (CET)
Message-ID: <9f297568-5616-40b6-b401-df1af57d5e14@hogyros.de>
Date: Thu, 19 Feb 2026 13:06:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Bridges without VGA support
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260218175111.GA3434382@bhelgaas>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20260218175111.GA3434382@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_THREE(0.00)[3];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Simon.Richter@hogyros.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[hogyros.de];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_THREE(0.00)[4]
X-Rspamd-Queue-Id: D4B0115BFBB
X-Rspamd-Action: no action

Hi Bjorn,

On 2/19/26 2:51 AM, Bjorn Helgaas wrote:

> I'm not sure if you also fixed the kernel test robot warnings
> (https://lore.kernel.org/all/202602180912.N7IZbIal-lkp@intel.com,
> https://lore.kernel.org/all/202602181332.NDKD0g1P-lkp@intel.com).

I think I did, but the () are still missing, will do another round.

> I assume this series fixes some problem where VGA isn't enabled
> correctly in some topology?  It wasn't obvious to me from the commit
> logs, but it would be good to include that if so.

It's the missing error handling if VGA cannot be enabled because a 
bridge on the way doesn't support VGA forwarding and hardwires the VGA 
bit to zero.

The i915 driver has a workaround for two internal state machines that go 
out of sync when voltage regulators are reprogrammed, so it needs to 
perform a few VGA accesses on initialization, or there is a risk of a 
bus error later when control is returned to vgacon.

This isn't a concern if VGA accesses *never* work, so we can simply skip 
it in this case, but we need to know that there was an error.

The i915 counterpart to this is

     https://patchwork.freedesktop.org/series/161721/

which changes code introduced in December, so if the pci/vgaarb patches 
are backported, that one also needs to be backported manually.

That's what the __must_check are for, the warnings they generate go away 
when the i915 patch is applied, so it probably makes sense to do that first.

So, for v3:

  - expand commit messages with the text above
  - recheck commit message style

Does it make sense to Cc stable on these?

    Simon
