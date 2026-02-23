Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIO3BmBinWk8PQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BED183C4A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A36310E4FB;
	Tue, 24 Feb 2026 08:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="WPWbjnnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32116.qiye.163.com (mail-m32116.qiye.163.com
 [220.197.32.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6B410E167
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:21:03 +0000 (UTC)
Received: from [172.16.12.14] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 34b44f50a;
 Tue, 24 Feb 2026 00:15:57 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <phasta@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH 25/37] accel/qaic: Replace pci_alloc_irq_vectors() with
 pcim_alloc_irq_vectors()
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771862143-89507-1-git-send-email-shawn.lin@rock-chips.com>
 <41d7d63f-bcda-4182-9340-54d480473586@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <6f0932f0-1e08-62a8-eb92-2380bb9f6928@rock-chips.com>
Date: Tue, 24 Feb 2026 00:15:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <41d7d63f-bcda-4182-9340-54d480473586@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c8b4937c409cckunm8f51f82c98962b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlLGlZPQkJLT0tCGh5MTkhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=WPWbjnnjbzLg8XQAO7EVzoV3katKKHr6FzaB+u7EmNlbQTAWBq3qz9Ui8TQFJF2BRvSp0oOyu6Z+tx0Rol0o6YMXNIrZG3fDIPln8nNOGTVwulXzaejRTvZCqoJQPZksFTSFs1q6TDVWUjsYl1bQOauLxPjS4c/Z3y59FHvpvnw=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=6sDnERtWKN0yo+2JS4OKnCU7q/x1fS633xTB1pvqPtk=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:shawn.lin@rock-chips.com,m:linux-arm-msm@vger.kernel.org,m:bhelgaas@google.com,m:phasta@kernel.org,m:linux-pci@vger.kernel.org,m:jeff.hugo@oss.qualcomm.com,m:ogabbay@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[shawn.lin@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:mid,rock-chips.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E2BED183C4A
X-Rspamd-Action: no action

Hi Jeff

在 2026/02/24 星期二 0:01, Jeff Hugo 写道:
> On 2/23/2026 8:55 AM, Shawn Lin wrote:
>> pcim_enable_device() no longer automatically manages IRQ vectors via 
>> devres.
>> Drivers must now manually call pci_free_irq_vectors() for cleanup. 
>> Alternatively,
>> pcim_alloc_irq_vectors() should be used.
> 
> This seems to break bisect.  Surely you should update drivers before you 
> go changing behavior.

Patch 1 introduces pcim_alloc_irq_vectors() and then convert all needed
users to it. Then the final patch(37) remove the implict IRQ vector
management in pci_alloc_irq_vectors(). So the individual patch for each
driver should be safe IMO. And if these patches go via a single
tree with acks, it seems unlikely to break bisect.

> 
> -Jeff
> 
