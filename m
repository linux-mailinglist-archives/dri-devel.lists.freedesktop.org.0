Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785249EC51C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA7D10E3F6;
	Wed, 11 Dec 2024 06:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="XYyqBTIh";
	dkim=pass (2048-bit key; secure) header.d=sapience.com header.i=@sapience.com header.b="AfPod0ZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AFA10E3A2;
 Tue, 10 Dec 2024 11:16:28 +0000 (UTC)
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
 signature) header.d=sapience.com header.i=@sapience.com 
 header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
 header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by s1.sapience.com (Postfix) with ESMTPS id BD7B3480525;
 Tue, 10 Dec 2024 06:16:27 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1733829387;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=vhKMx+j4Oi0hlXt2utJ2x7QiGaDUXzciAI+c9jXIkIw=;
 b=XYyqBTIhqS6ah7Gf1yVNy+yHRk3iGc1ZmlAGsvE6lensXHIUgsWLYKHw6c+mrKY3RU9sE
 3mTqy6L7SlyXoKMCw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1733829387; 
 cv=none;
 b=GWpiPzb4XL/1OWmhhH9b7kl1nnC94EcgUUk/JORh2D6Voih9vQM1ptkXyKdFg7kpTyYeYoLjfshnU8WZKj5IcGmTCQWWkSjwTyChuPnw5R6BAr8EVO7aXBhOSe/mUd3mjZ0gZBHdqIXAlVq67UXzBcxDPjnS7fgctMF0bGWwqQ9Y11RLwDWeJ/BpooWSFXlwWHUBCEozWS578KePKJMDEuyxtWekWsXNmDm7hKEyZyj5CVAqREuk/hheF89P8gQVK6i/XnOUkQYwr0lvCGVJC29h++0JMJ4+HNnJzr0NZ9qLjv45BmUEGx3nig+kKtWNvEOaFtLuN6vRMOSpYolvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
 t=1733829387; c=relaxed/simple;
 bh=cWF1mkC7T0R9vgRVwvTx1HbqOINdxa9Vgk35Rpt7GDQ=;
 h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
 MIME-Version;
 b=EU+THIu45ap799E/qZjc+ZizJcfcKsWXr8kGHIJkvDtOHizwmyHLoaX/OEGRxcXGRxjfgw+Pl+gnaVH/hzEBlAo0EHei/a4KgBkadUx6q6FEOy86Qh37er7Y1IulMMgIRJwnsUiGBO0YOrRXGWy9/h9cUkat907DJLsHdh6NBlzUM0O9wyxqH0+QM8wwTxst006b2g9gQQXBSQtsQDf8brCyKNMvXslsjCIiKLJXf7nodnBZ3GIPcbUD9SgrR38/4sdtwlELlVciQCs204gh3o49z7WTG62fAmvnZYe8mAkYtRw9dtSKFzVn+VoLuFIItIMshpXgbU3drjBWEhgmRA==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1733829387;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=vhKMx+j4Oi0hlXt2utJ2x7QiGaDUXzciAI+c9jXIkIw=;
 b=AfPod0ZGnZUXic1K1pWl3XZkE1/sVVtpx0zX3atwsBkrMkMzYg3AIcF6JxCm6v79JRCQ1
 F3bw7RQf1eRY0l9alXU/xX+gRNfOT7OsN/bBqsx/ZXISsWv8wWGqo/Raue7EmPkcN9RZpIi
 ib6jj2rc0Czs4yCO3Ci2Fzs/9p+FPhYJH4+OH+wBXfzf/FURatcsywp8lkCezvYfd9Ktrce
 KUKqj72/S8cr9J+tzc8PS+56uVM67mNvQyWa3QCV1mpikuljk1pvm+fXelQVf04alrCM4db
 X+HOJAA+B2PlyCXJzxnfchsWt1S3MVPBdHJf5guqOxF54vsVC2XVEePkdBkQ==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by srv8.sapience.com (Postfix) with ESMTPS id 5607F280015;
 Tue, 10 Dec 2024 06:16:27 -0500 (EST)
Message-ID: <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
From: Genes Lists <lists@sapience.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
 torvalds@linux-foundation.org, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, bingbu.cao@intel.com, Rodrigo Vivi	
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Tue, 10 Dec 2024 06:16:26 -0500
In-Reply-To: <87seqvzzg6.fsf@intel.com>
References: <2024120917-vision-outcast-85f2@gregkh>
 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
 <Z1fqitbWlmELb5pj@kekkonen.localdomain> <87seqvzzg6.fsf@intel.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
 protocol="application/pgp-signature"; boundary="=-avh/+DlCgXmdUpZzNj15"
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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


--=-avh/+DlCgXmdUpZzNj15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-12-10 at 10:58 +0200, Jani Nikula wrote:
> On Tue, 10 Dec 2024, Sakari Ailus <sakari.ailus@linux.intel.com>
> wrote:
> > Hi,
> >=20
> > > ...
> > > FYI 6.12.4 got a crash shortly after booting in dma_alloc_attrs -
> > > maybe
> > > triggered in ipu6_probe. Crash only happened on laptop with ipu6.
> > > All
> > > other machines are running fine.
> >=20
> > Have you read the dmesg further than the IPU6 related warning? The
> > IPU6
> > driver won't work (maybe not even probe?) but if the system
> > crashes, it
> > appears unlikely the IPU6 drivers would have something to do with
> > that.
> > Look for warnings on linked list corruption later, they seem to be
> > coming
> > from the i915 driver.
>=20
> And the list corruption is actually happening in
> cpu_latency_qos_update_request(). I don't see any i915 changes in
> 6.12.4
> that could cause it.
>=20
> I guess the question is, when did it work? Did 6.12.3 work?
>=20
>=20
> BR,
> Jani.


 - 6.12.1 worked

 - mainline - works (but only with i915 patch set [1] otherwise there
are no graphics at all)

    [1] https://patchwork.freedesktop.org/series/141911/

- 6.12.3 - crashed (i see i915 not ipu6) and again it has      =C2=A0
    cpu_latency_qos_update_request+0x61/0xc0

 CPU: 3 UID: 0 PID: 233674 Comm: kworker/3:1 Tainted: G        W     =20
6.12.3-stable-1 #2 b13471ff40a4c707f51ed6741af496b8675e3b0f
 Tainted: [W]=3DWARN
 Hardware name: Dell Inc. XPS 9320/0CR6NC, BIOS 2.16.1 09/11/2024
 Workqueue: events output_poll_execute
 RIP: 0010:__list_add_valid_or_report+0x83/0xa0
 Code: eb e9 48 89 c1 48 c7 c7 18 61 b3 ac e8 76 26 a0 ff 0f 0b eb d6
48 89 d1 48 89 c6 4c 89 c2 48 c7 c7 68 61 b3 ac e8 5d 26 a0 ff <0f> 0b
eb bd 48 89 f2 48 89 c1 48 89 fe 48 c7 c7 b8 61 b3 ac e8 44
 RSP: 0018:ffffa903b1a3f8a8 EFLAGS: 00010086
 RAX: 0000000000000000 RBX: ffff8ac28751a0a8 RCX: 0000000000000027
 RDX: ffff8ac9ef3a18c8 RSI: 0000000000000001 RDI: ffff8ac9ef3a18c0
 RBP: ffff8ac283fc6ea8 R08: 0000000000000000 R09: ffffa903b1a3f728
 R10: ffffffffad2a67f0 R11: 0000000000000003 R12: ffffffffad25e960
 R13: ffff8ac283fc6ec0 R14: ffff8ac283fc6eb0 R15: 0000000000000000
 FS:  0000000000000000(0000) GS:ffff8ac9ef380000(0000)
knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 00002d641a8cd000 CR3: 00000006afa24000 CR4: 0000000000f52ef0
 PKRU: 55555554
 Call Trace:
  <TASK>
  ? __list_add_valid_or_report+0x83/0xa0
  ? __warn.cold+0x93/0xf6
  ? __list_add_valid_or_report+0x83/0xa0
  ? report_bug+0xff/0x140
  ? console_unlock+0x9d/0x140
  ? handle_bug+0x58/0x90
  ? exc_invalid_op+0x17/0x70
  ? asm_exc_invalid_op+0x1a/0x20
  ? __list_add_valid_or_report+0x83/0xa0
  ? __list_add_valid_or_report+0x83/0xa0
  plist_add+0xdd/0x140
  pm_qos_update_target+0xa0/0x1f0
  cpu_latency_qos_update_request+0x61/0xc0
  intel_dp_aux_xfer+0x4c7/0x6e0 [i915
130aa22568da4be1bf6a8f4b926f812e9a4460d0]
  intel_dp_aux_transfer+0x10e/0x3b0 [i915
130aa22568da4be1bf6a8f4b926f812e9a4460d0]
  drm_dp_i2c_do_msg+0x81/0x300 [drm_display_helper
f34443fa650f4fdc86a0e4b3a7e8f7fa67570a48]
  drm_dp_i2c_xfer+0xe4/0x2f0 [drm_display_helper
f34443fa650f4fdc86a0e4b3a7e8f7fa67570a48]
  __i2c_transfer+0x1d5/0x540
  i2c_transfer+0x5c/0xd0
  drm_do_probe_ddc_edid+0xc0/0x140
  ? __pfx_drm_do_probe_ddc_edid+0x10/0x10
  edid_block_read+0x38/0x100
  _drm_do_get_edid+0xb6/0x3a0=20
  ? __pfx_drm_do_probe_ddc_edid+0x10/0x10
  drm_edid_read_custom+0x32/0xc0
  intel_dp_set_edid+0x3d4/0x3f0 [i915
130aa22568da4be1bf6a8f4b926f812e9a4460d0]
  intel_dp_detect+0x502/0x7b0 [i915
130aa22568da4be1bf6a8f4b926f812e9a4460d0]
  drm_helper_probe_detect_ctx+0x52/0x110
  output_poll_execute+0x13d/0x2d0
  process_one_work+0x174/0x330
  worker_thread+0x252/0x390
  ? __pfx_worker_thread+0x10/0x10
  kthread+0xcf/0x100
  ? __pfx_kthread+0x10/0x10
  ret_from_fork+0x31/0x50
  ? __pfx_kthread+0x10/0x10
  ret_from_fork_asm+0x1a/0x30
  </TASK>
 ---[ end trace 0000000000000000 ]---
 ------------[ cut here ]------------





--=-avh/+DlCgXmdUpZzNj15
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ1gjCgAKCRA5BdB0L6Ze
25vHAQCnR9NmwK4EpL3QFZnfr2sIxDtzMJIWHDYvXsP5MMoULQD/ZFpQKygOMSys
tOEd0b80dMNuZq7nKENA49onAZpHTQE=
=ZMGK
-----END PGP SIGNATURE-----

--=-avh/+DlCgXmdUpZzNj15--
