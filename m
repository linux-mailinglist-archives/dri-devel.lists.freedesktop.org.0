Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355FA7BF75E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 11:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E5A10E03F;
	Tue, 10 Oct 2023 09:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313AB10E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 09:32:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C171FB81975;
 Tue, 10 Oct 2023 09:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92338C433C7;
 Tue, 10 Oct 2023 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696930324;
 bh=RI4PKFKZirN9lXwh+R0Gc+kBsD9aM9F0KDe9jwrQRh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r1A0ZUD435XGZf7Tq/wvizauSlKFROKpQiXdfZdJYqDlNkwrEOP6xjPCSRpHjkCl6
 6kxmoPQq4Q7/fXCbvpno0v2m+j2NK7cLUmpzDILoJ2yjaTgz4hiEuDv05+/rRr+sSq
 0Ju2cilIMUOb6a41l/oR/PC0ERiS+bH4QcWcQNJZQVY6+q2W1FAJtyRS8FE7lXBof7
 iZB+B4pHzDebMf4vcqV6qPVwaJahlVd46ioUffYdmbfYJfiIepdV+/vFpIZ+a+qoaB
 alrs/K8E8W4CH4zQXMrbS46C8IRScPVWZw7yVkhXMLMOfBEwx1uRLdRvjXroBRq7hc
 uPS4MBgmi0U5g==
Date: Tue, 10 Oct 2023 11:31:56 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
Subject: Re: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
Message-ID: <ZSUaDIfWmEn5edrE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, linux@roeck-us.net,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 jdelvare@suse.com, joel@jms.id.au, andrew@aj.id.au,
 eajames@linux.ibm.com, ninad@linux.ibm.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EIXGnQky11Paxv1b"
Content-Disposition: inline
In-Reply-To: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, andrew@aj.id.au,
 eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com, ninad@linux.ibm.com,
 joel@jms.id.au, linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux@roeck-us.net, linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--EIXGnQky11Paxv1b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

thanks for this series!

> Reference to Andrew's previous proposal:
> https://lore.kernel.org/all/20200914122811.3295678-1-andrew@aj.id.au/

I do totally agree with Guenter's comment[1], though. This just affects
a few drivers and this patch is way too intrusive for the I2C core. The
later suggested prepare_device() callback[2] sounds better to me. I
still haven't fully understood why this all cannot be handled in the
driver's probe. Could someone give me a small summary about that?

All the best,

   Wolfram


[1] https://lore.kernel.org/all/e7a64983-fe1d-1ba2-b0c3-ae4a791f7a75@roeck-us.net/
[2] https://lore.kernel.org/all/120342ec-f44a-4550-8c54-45b97db41024@www.fastmail.com/


--EIXGnQky11Paxv1b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUlGggACgkQFA3kzBSg
KbajcA//T55K8TsNJtLGqupsxrbujaZlGGmtYUPg71R123SnljP7NL27nCVsszFD
ADZ7LHBj726el8TDBz9kEO9laIk7MtBjZrAdsaxHziTq9349D382MEwFyEGzVDRE
cOQWfrdmYP64Q0/OK02wIfr4sZcRo7ruMsOt2/GRRX+SBy6zWSy7p4l1LOyPUbjx
Xx9RHKSPUQ5rGvSyrl02MYKX9Ny6yI61bQt1SYtv0wHI8NWL26uN9p/K3mT3LYYw
VjPHz3PNGbmz2FAY5ldzertNJV8TxVt5hBMG6T8nBOZYoVx7wrXSjzsc0UWfghwr
n8z2dP55p5o8oxXcucnUX/PvEJSfWT/J3jUUa2iWmCtakIb7yapNXFRZmLlvj4bf
wgXVaoymv0GlTtB1EZKIJlYMLSLfmSQXW1kvscYC2EzFu7SshkpDB6hsvHNtR42J
5QIl3fuKOoFlO+iSR2qQz5paQ7OkDdUh6+b0zWBAfpQ5a2NV3F9esqneB4bYcgDw
YAwt66KW2bW9X/I2G4mt45DHJC3OyQ7EgnYcE0gYtFOoAPHUqTt2wHJKIN+KBQ4q
EPCYz+8EybZ5KfHsM04M0HSlzMysIWmkF7yLKUbucU82hVgU9x/AGRO0oZSRQLof
bCHZ4nTmXnfKTqwQcqHdwjJJj4mT3dEqie13PzzveC8iuUJqvn0=
=F3AD
-----END PGP SIGNATURE-----

--EIXGnQky11Paxv1b--
