Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29966E5B1B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD7210E6C2;
	Tue, 18 Apr 2023 08:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6B810E6B8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:00:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02B52623A8;
 Tue, 18 Apr 2023 08:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A44DC433D2;
 Tue, 18 Apr 2023 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681804804;
 bh=s60CVmIII2Y0/UiFhD2Gk75AqSi4Ndp6RwEByH1gFpc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SOzUZ4nk0TBp9MMijNlh6Pbw55PQVlaLmg8Bg+4JlUXrqtNE7D8WceZkiP6RMXwpp
 HysXBOvRm6VLgLv9OCK4+m6XYX5bVZeXG5vB6QVADoswsOzhjsdApsPSjWOhSbtZf4
 2T3o2C10uyGZt1VpWV0yuDqQIR/jLRQoUEwGGu+vSFTjapVMt2uKRCE3wNXzqjmYmL
 iXQFE0F0MlVZNcZS83Puc41mNJVOtHon8/c70Q6U4aO5TcX2malrU/OdQzpZXKrqdG
 +y3SupcJFs7zWKwd+60uwjHYv7oEuA/I0H3DmO85CvygO3Mh6eltx7+cdkDFJDTLg8
 w3sYs1fhdgHmQ==
Message-ID: <ff7547c1-450d-7dea-1c11-e55dc77cae76@kernel.org>
Date: Tue, 18 Apr 2023 17:00:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] ata: libata-core: Apply ATI NCQ horkage to ASPEED as
 well
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>, Patrick McLean <chutzpah@gentoo.org>
References: <20230418011720.3900090-1-chutzpah@gentoo.org>
 <20230418011720.3900090-3-chutzpah@gentoo.org>
 <ZD4pg7EMgGU2yjLM@infradead.org>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <ZD4pg7EMgGU2yjLM@infradead.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/23 14:24, Christoph Hellwig wrote:
> On Mon, Apr 17, 2023 at 06:17:20PM -0700, Patrick McLean wrote:
>> We have some machines with ASPEED SATA controllers, and are seeing the same NCQ
>> issues that ATI controllers (I am not sure if it's a rebranded ATI controller,
>> or they both have some faulty implementation). This NCQ breakage is consistent
>> across a few different types of drives.
>>
>> Instead of maintaining a list of drives that are broken with ASPEED controllers
> 
> Are these ASPEED controllers all the same or a wide variety?
> Quirking all controllers from the same vendor seems like an overly
> broad approach to me.

Indeed. If you checked only one adapter model from ASPEED, then all that is
needed is define it with "board_ahci_noncq" in drivers/ata/ahci.c (see
ahci_pci_tbl array). NCQ support will be turned off for that particular adapter
with that.
