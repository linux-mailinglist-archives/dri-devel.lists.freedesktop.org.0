Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A499A87370
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 21:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D932110E29E;
	Sun, 13 Apr 2025 19:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 561 seconds by postgrey-1.36 at gabe;
 Sun, 13 Apr 2025 19:02:14 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2178210E2BC
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 19:02:14 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 637F32C06E2F;
 Sun, 13 Apr 2025 20:52:10 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 307474555F; Sun, 13 Apr 2025 20:52:46 +0200 (CEST)
Date: Sun, 13 Apr 2025 20:52:46 +0200
From: Lukas Wunner <lukas@wunner.de>
To: "Gupta, Nipun" <nipun.gupta@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, herbert@gondor.apana.org.au,
 davem@davemloft.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
 conor+dt@kernel.org, ogabbay@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de,
 praveen.jain@amd.com, harpreet.anand@amd.com,
 nikhil.agarwal@amd.com, srivatsa@csail.mit.edu, code@tyhicks.com,
 ptsm@linux.microsoft.com, linux-crypto@vger.kernel.org,
 Ignat Korchagin <ignat@cloudflare.com>, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Message-ID: <Z_wH_uCx558T0__c@wunner.de>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
 <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
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

On Fri, Apr 11, 2025 at 10:21:03AM +0530, Gupta, Nipun wrote:
> On 10-04-2025 13:06, Krzysztof Kozlowski wrote:
> > On Wed, Apr 09, 2025 at 11:00:32PM GMT, Nipun Gupta wrote:
> > > The AMD PKI accelerator driver provides a accel interface to interact
> > > with the device for offloading and accelerating asymmetric crypto
> > > operations.
> > > 
> > 
> > For me this is clearly a crypto driver and you are supposed to:
> > 1. Cc crypto maintaners,
> > 2. Put it actually into crypto and use crypto API.
> 
> added crypto maintainers for comments.
> IMO, as accel framework is designed to support any type of compute
> accelerators, the PKI crypto accelerator in accel framework is not
> completely out of place here, as also suggested at:
> https://lore.kernel.org/all/2025031352-gyration-deceit-5563@gregkh/

To be fair, Greg did suggest drivers/crypto/ as an alternative... :)

  "Great, then why isn't this in drivers/accel/ or drivers/crypto/ ?"
  https://lore.kernel.org/r/2025031236-siamese-graffiti-5b98@gregkh/

There are already six drivers for crypto accelerators in drivers/crypto/,
so that would seem to be a natural fit for your driver:

  aspeed/aspeed-acry.c
  caam/caampkc.c
  ccp/ccp-crypto-rsa.c                 <-- from AMD no less!
  hisilicon/hpre/hpre_crypto.c
  intel/qat/qat_common/qat_asym_algs.c
  starfive/jh7110-rsa.c

You can find these in the tree with:

  git grep 'cra_name = "rsa"'

So far there are only drivers to accelerate RSA encryption/decryption.
The kernel supports a single padding scheme, PKCS1, which is implemented
by crypto/rsa-pkcs1pad.c.  There is no support yet for OAEP.

So the padding of the hash (which is cheap) happens in software and then
crypto/rsa-pkcs1pad.c performs an RSA encrypt/decrypt operation which is
either performed in software by crypto/rsa.c, or in hardware if a crypto
accelerator is present.  Drivers for crypto accelerators register the
"rsa" algorithm with a higher cra_priority than the software
implementation, hence are generally preferred.

One benefit that you get from implementing a proper akcipher_alg in your
driver is that virtual machines may take advantage of the hardware
accelerator through the virtio support implemented by:
drivers/crypto/virtio/virtio_crypto_akcipher_algs.c

Note that the crypto subsystem currently does not support hardware
acceleration of signature generation/verification (crypto_sig),
but only encryption/decryption (crypto_akcipher).  One reason is
that signature generation/verification is generally a synchronous
operation and doesn't benefit as much from hardware acceleration
due to the overhead of interacting with the hardware.

So there's no support e.g. for generating or verifying ECDSA signatures
in hardware.  I think that would only really make sense if private keys
are kept in hardware and cannot be retrieved.  So the use case wouldn't
be acceleration, but security of private keys.

That said, for RSA specifically, signature generation/verification does
involve an encrypt/decrypt operation internally.  The padding is once
again done in software (by crypto/rsassa-pkcs1.c -- no PSS support yet).
But the actual encrypt/decrypt operation will be performed in
hardware if a crypto accelerator is present.

The user space interface Herbert referred to is a set of system calls
which are usable e.g. via the keyutils library and command line utility:
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/

HTH,

Lukas
