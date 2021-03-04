Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A132CDD9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 08:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EA16E9FF;
	Thu,  4 Mar 2021 07:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17216E9FF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 07:42:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 004ADAAC5;
 Thu,  4 Mar 2021 07:42:56 +0000 (UTC)
Subject: Re: drm/ttm: ttm_bo_release called without lock
To: Petr Mladek <pmladek@suse.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <YD+eYcMMcdlXB8PY@alley> <YD+mGFJ5KYWwrJHH@alley>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a53377ae-9b33-9030-f9a6-0b620a9cc71f@suse.de>
Date: Thu, 4 Mar 2021 08:42:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD+mGFJ5KYWwrJHH@alley>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============1684711231=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1684711231==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iQRcrfuf26u3qYVWW6X9eRHuHnCH7fX8H"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iQRcrfuf26u3qYVWW6X9eRHuHnCH7fX8H
Content-Type: multipart/mixed; boundary="jGjoDVEYYgdS4gu89Aj7w8unBUuryqcxn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Petr Mladek <pmladek@suse.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <a53377ae-9b33-9030-f9a6-0b620a9cc71f@suse.de>
Subject: Re: drm/ttm: ttm_bo_release called without lock
References: <YD+eYcMMcdlXB8PY@alley> <YD+mGFJ5KYWwrJHH@alley>
In-Reply-To: <YD+mGFJ5KYWwrJHH@alley>

--jGjoDVEYYgdS4gu89Aj7w8unBUuryqcxn
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

(cc'ing Gerd)

This might be related to the recent clean-up patches for the BO handling =

in qxl.

Am 03.03.21 um 16:07 schrieb Petr Mladek:
> On Wed 2021-03-03 15:34:09, Petr Mladek wrote:
>> Hi,
>>
>> the following warning is filling my kernel log buffer
>> with 5.12-rc1+ kernels:
>>
>> [  941.070598] WARNING: CPU: 0 PID: 11 at drivers/gpu/drm/ttm/ttm_bo.c=
:139 ttm_bo_move_to_lru_tail+0x1ba/0x210
>> [  941.070601] Modules linked in:
>> [  941.070603] CPU: 0 PID: 11 Comm: kworker/0:1 Kdump: loaded Tainted:=
 G        W         5.12.0-rc1-default+ #81
>> [  941.070605] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIO=
S rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
>> [  941.070606] Workqueue: events qxl_gc_work
>> [  941.070609] RIP: 0010:ttm_bo_move_to_lru_tail+0x1ba/0x210
>> [  941.070610] Code: 93 e8 02 00 00 48 89 0a e9 00 ff ff ff 48 8b 87 3=
8 01 00 00 be ff ff ff ff 48 8d 78 70 e8 8e 7d 46 00 85 c0 0f 85 6f fe ff=
 ff <0f> 0b 8b 93 fc 02 00 00 85 d2 0f 84 6d fe ff ff 48 89 df 5b 5d 41
>> [  941.070612] RSP: 0018:ffffbddf4008fd38 EFLAGS: 00010246
>> [  941.070614] RAX: 0000000000000000 RBX: ffff95ae485bac00 RCX: 000000=
0000000002
>> [  941.070615] RDX: 0000000000000000 RSI: ffff95ae485badb0 RDI: ffff95=
ae40305108
>> [  941.070616] RBP: 0000000000000000 R08: 0000000000000001 R09: 000000=
0000000001
>> [  941.070617] R10: ffffbddf4008fc10 R11: ffffffffa5401580 R12: ffff95=
ae42a94e90
>> [  941.070618] R13: ffff95ae485bae70 R14: ffff95ae485bac00 R15: ffff95=
ae455d1800
>> [  941.070620] FS:  0000000000000000(0000) GS:ffff95aebf600000(0000) k=
nlGS:0000000000000000
>> [  941.070621] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  941.070622] CR2: 00007f8ffb2f8000 CR3: 0000000102c5e005 CR4: 000000=
0000370ef0
>> [  941.070624] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000=
0000000000
>> [  941.070626] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000=
0000000400
>> [  941.070627] Call Trace:
>> [  941.070630]  ttm_bo_release+0x551/0x600
>> [  941.070635]  qxl_bo_unref+0x3a/0x50
>> [  941.070638]  qxl_release_free_list+0x62/0xc0
>> [  941.070643]  qxl_release_free+0x76/0xe0
>> [  941.070646]  qxl_garbage_collect+0xd9/0x190
>> [  941.080241]  process_one_work+0x2b0/0x630
>> [  941.080249]  ? process_one_work+0x630/0x630
>> [  941.080251]  worker_thread+0x39/0x3f0
>> [  941.080255]  ? process_one_work+0x630/0x630
>> [  941.080257]  kthread+0x13a/0x150
>> [  941.080260]  ? kthread_create_worker_on_cpu+0x70/0x70
>> [  941.080265]  ret_from_fork+0x1f/0x30
>> [  941.080277] irq event stamp: 757191
>> [  941.080278] hardirqs last  enabled at (757197): [<ffffffffa217431f>=
] vprintk_emit+0x27f/0x2c0
>> [  941.080280] hardirqs last disabled at (757202): [<ffffffffa21742dc>=
] vprintk_emit+0x23c/0x2c0
>> [  941.080281] softirqs last  enabled at (755768): [<ffffffffa300030f>=
] __do_softirq+0x30f/0x432
>> [  941.080284] softirqs last disabled at (755763): [<ffffffffa20eb0aa>=
] irq_exit_rcu+0xea/0xf0
>=20
> I have just realized that it actually prints two warnings over and
> over again. The 2nd one is:
>=20
> [  186.078790] WARNING: CPU: 0 PID: 146 at drivers/gpu/drm/ttm/ttm_bo.c=
:512 ttm_bo_release+0x533/0x600
> [  186.078794] Modules linked in:
> [  186.078795] CPU: 0 PID: 146 Comm: kworker/0:2 Kdump: loaded Tainted:=
 G        W         5.12.0-rc1-default+ #81
> [  186.078797] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS=
 rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
> [  186.078799] Workqueue: events qxl_gc_work
> [  186.078801] RIP: 0010:ttm_bo_release+0x533/0x600
> [  186.078803] Code: e9 c6 fb ff ff 4c 8b 7d d0 b9 4c 1d 00 00 31 d2 be=
 01 00 00 00 49 8b bf d0 fe ff ff e8 86 f1 04 00 49 8b
> 47 e0 e9 2b ff ff ff <0f> 0b 48 8b 45 d0 31 d2 4c 89 f7 48 8d 70 08 c7 =
80 94 00 00 00 00
> [  186.078805] RSP: 0018:ffffa22a402e3d60 EFLAGS: 00010202
> [  186.078807] RAX: 0000000000000001 RBX: ffff9334cd8f5668 RCX: 0000000=
000001180
> [  186.078808] RDX: ffff93353f61a7c0 RSI: ffffffffa6401580 RDI: ffff933=
4c44f9588
> [  186.078810] RBP: ffffa22a402e3d90 R08: 0000000000000001 R09: 0000000=
000000001
> [  186.078811] R10: ffffa22a402e3c10 R11: ffffffffa6401580 R12: ffff933=
4c48fa300
> [  186.078812] R13: ffff9334c0f24e90 R14: ffff9334cd8f5400 R15: ffff933=
4c4528000
> [  186.078813] FS:  0000000000000000(0000) GS:ffff93353f600000(0000) kn=
lGS:0000000000000000
> [  186.078814] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  186.078816] CR2: 00007f1908079860 CR3: 0000000021824004 CR4: 0000000=
000370ef0
> [  186.078818] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000=
000000000
> [  186.078819] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000=
000000400
> [  186.078821] Call Trace:
> [  186.078826]  qxl_bo_unref+0x3a/0x50
> [  186.078829]  qxl_release_free_list+0x62/0xc0
> [  186.078834]  qxl_release_free+0x76/0xe0
> [  186.078837]  qxl_garbage_collect+0xd9/0x190
> [  186.078843]  process_one_work+0x2b0/0x630
> [  186.078850]  ? process_one_work+0x630/0x630
> [  186.078853]  worker_thread+0x39/0x3f0
> [  186.078857]  ? process_one_work+0x630/0x630
> [  186.078859]  kthread+0x13a/0x150
> [  186.078861]  ? kthread_create_worker_on_cpu+0x70/0x70
> [  186.078866]  ret_from_fork+0x1f/0x30
> [  186.078879] irq event stamp: 619687
> [  186.091417] hardirqs last  enabled at (619761): [<ffffffffa317293b>]=
 console_unlock+0x45b/0x570
> [  186.091421] hardirqs last disabled at (619766): [<ffffffffa31742dc>]=
 vprintk_emit+0x23c/0x2c0
> [  186.091423] softirqs last  enabled at (617742): [<ffffffffa400030f>]=
 __do_softirq+0x30f/0x432
> [  186.091425] softirqs last disabled at (617737): [<ffffffffa30eb0aa>]=
 irq_exit_rcu+0xea/0xf0
> [  186.091427] ---[ end trace ac74376b06d2036c ]---
>=20
>=20
> Tke kernel is based on Linus' tree and the last commit
> f69d02e37a85645aa90d1 ("Merge tag 'misc-5.12-2021-03-02' of
> git://git.kernel.dk/linux-block").
>=20
> Best Regards,
> Petr
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--jGjoDVEYYgdS4gu89Aj7w8unBUuryqcxn--

--iQRcrfuf26u3qYVWW6X9eRHuHnCH7fX8H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBAj38FAwAAAAAACgkQlh/E3EQov+D2
GBAAvv1ZzUBzKGy/8j5Jb/qCRPC4neMQpGYdPF19DtoxUQ/oykdoRP05H/PEBSQecTPXZaPV/2ZT
AwHUtgHu5ib+XxNAHQ08YyuUxsfsE5oD2TOH2DTzyJYGYd2c/kffSux5v/xFGZQqqsyRtA7KPEyM
eF2MjaNZqggBy+YY692YIH5BP2plu+7HGPp/jxMsZSQ28HQ4qkF8u8FEQabe2+XRre8RFc5LM4kk
AEXu1KeKTyQ+0cvNBli1qaRLbo11gn9cCK6bjYke5J+GajITVWRq4VrPq6lUVO1LbCuVj/JV1Mo/
PvRAzN2Gm4/ajotI0kyJs1N7XOQqF3dTrczp9D17r9qVfXyU/Qzr+7fi91JbdKU7b7qQlpyjoeDo
RBHmQincLNd5flXTBjrjikgeDOxvw6ja2U7XVI49U+zqfmsfGFweBErMT0mQ+OAe9CheOrY0poZd
nX17su26YB3P061Kb3B03vqtHQQcNsm7zr+IIDaokAH8DJfLlsqHKDFZ4YqSXC3EXRJFrS1mMwbW
xB+7LD1DgQJlf7l9ItXeyvWK/Gq+Rx4Yi5m4aszLfk9HXyqcGN0wc4St1KvCbhwXzVhC8B+bv9qV
hhL278wnsoPo+GWSP5ME/jQqDne5q2mz5V9HmZy8BMb+fF/re/X8fpQhIfMVrYlE43SeGrRy4s97
8qA=
=jCOQ
-----END PGP SIGNATURE-----

--iQRcrfuf26u3qYVWW6X9eRHuHnCH7fX8H--

--===============1684711231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1684711231==--
