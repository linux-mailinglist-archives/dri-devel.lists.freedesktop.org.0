Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2B5B4A00B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 05:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF9D10E3D1;
	Tue,  9 Sep 2025 03:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="ZiMR22zL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2073.outbound.protection.outlook.com [40.92.21.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9112C10E3D1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 03:29:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgQ4OYmvOfzquK7nII1wrfSFKFfc8m3uvZpSzVXlNVL8jpekuF7t2563lTJZeYxDgTmdR+5lMYHoovLYPRQaGl6BIZCHnCqm9INxs1qGCb0DoCIDhn+8cnkGhV9vAXjmVLPv4tsSpPtxwRzDBE87Zsh+Ws+M7ciAS/PTyYKNZJnAW6dfeTDyR2sewUDzgqWvJEt4ByTfTDf2XSNWFNBko3CBGIdSxFDidJvRp7Zc3II6GnKcHvz8OiFXaRea52K/3PEVxj8tcdk05ZFdGS9YWvFNsF7dXHLaQqpPUV6bsvTmDM8BYB7+bZilL8LZTi5IyBZcEBDnm3yL2BBDa8qJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbZjLUKtzbCa37ICqJCVUfarpT+QPqqYI3swZRbRClI=;
 b=vl9AYcyxn6HwoP1nOagx6DJ1HLLBMtexL4iNdzpZkekFZ8pWCcl3cOMluWZNbdybQWFyyKudDB57fHPqxx7bcZDffiImKLKcqCWIpWm0jYeowBDJVIBGJlMivyz+ly9JGH+0bv9LbwvicjoWli4czlcQsLScw8v4WmQOMn0CDAnK/8CkGLe7PxwZSZct5AEGKTClr+MUS7HOTmlRvNf474azxD/7546vfBFiigzEG4nZVXidcH5S2JNjjmINVzUDx5Z91RdKuHwQeymZCp5fMktEZexvr+pUt05i50wGT4F/+SndcynbRmHoaNVuz67PZ8hw/SGiyEBzsYJFw6vHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbZjLUKtzbCa37ICqJCVUfarpT+QPqqYI3swZRbRClI=;
 b=ZiMR22zLknGHRLX5KspDHiEXCky4pwhLeXENOAaljfeIKXFm8HyLbHzhkngp0OS+//dLtq8qD6LT+I2xuNdcigDGFV7Ze1Q+FP9JPhw6XMyy+OJENJ8+LFFPEiJqqiGChfkTPkuSNcT4b3b5+xpJvLAWcJK/B0R2YW0VroyLMUmmLydaa2xMSHlzPs1tH4yhKx5Ke2sb10hsfghD6cQ2Kyy5kBByJhAuetv9EtCFpMafIzmN8izizjgi6uLNqhAwommKxpl6UdK++/l7dwqpdSMW+S1vHOp/6NdESElhV2W1y/9NmkmSzwGVGrPO+OLXK7RnQ+E2qYjYAV2AKisaYw==
Received: from BN7PR02MB4148.namprd02.prod.outlook.com (2603:10b6:406:f6::17)
 by CO1PR02MB8856.namprd02.prod.outlook.com (2603:10b6:303:15b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.30; Tue, 9 Sep
 2025 03:29:23 +0000
Received: from BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::6007:d1a1:bcf9:58ef]) by BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::6007:d1a1:bcf9:58ef%4]) with mapi id 15.20.9094.018; Tue, 9 Sep 2025
 03:29:23 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>, "drawat.floss@gmail.com"
 <drawat.floss@gmail.com>, "hamohammed.sa@gmail.com"
 <hamohammed.sa@gmail.com>, "melissa.srw@gmail.com" <melissa.srw@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "lyude@redhat.com" <lyude@redhat.com>, "javierm@redhat.com"
 <javierm@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v3 0/4] drm: Add vblank timers for devices without
 interrupts
Thread-Topic: [PATCH v3 0/4] drm: Add vblank timers for devices without
 interrupts
Thread-Index: AQHcHay/1LhJS9Qt20a/N81nkOUA8bSED7IAgAYnyGA=
Date: Tue, 9 Sep 2025 03:29:23 +0000
Message-ID: <BN7PR02MB4148E80C13605F6EAD2B0A03D40FA@BN7PR02MB4148.namprd02.prod.outlook.com>
References: <20250904145806.430568-1-tzimmermann@suse.de>
 <SN6PR02MB4157E793515BE2B63615AD92D403A@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4157E793515BE2B63615AD92D403A@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR02MB4148:EE_|CO1PR02MB8856:EE_
x-ms-office365-filtering-correlation-id: 529bd116-7402-4e4f-8292-08ddef51123a
x-microsoft-antispam: BCL:0;
 ARA:14566002|31061999003|19110799012|15080799012|8062599012|8060799015|461199028|13091999003|1602099012|10035399007|40105399003|3412199025|53005399003|4302099013|440099028|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?QxAjhd3BD3laAd0x9SQplXXl11xmi05YbC3oUdqAMcsqwRYQjxMfnWzoYpYL?=
 =?us-ascii?Q?ioKbJbTdZiNOVlj3S179kKicdP8Q/4mZU3yEHzbWBd5MZexJtsTCu0kpMQdU?=
 =?us-ascii?Q?a8YSsJH5Ojuyj1IS2m3rAB3nwUkvfaURu2bD1ZeOsrHMa5bZtkQfhP1h2O+y?=
 =?us-ascii?Q?j4QPphY2hLS9BWLQBGvprNw+tAQbritl+WR46BKEMzofSLr9eHLTu1KugYwm?=
 =?us-ascii?Q?arczZsG6/lXVsCByNtUzo7GvdzZ70WsU52ZljPg3rFlOL/LQAE1v2K9o6EHq?=
 =?us-ascii?Q?xds1e5xziDA1QSQJpZa6mRz8XeuN/Xw0Z7DvkG5oChVi3waZmaFUqJaiFLN2?=
 =?us-ascii?Q?3d4c4pxebDFyyLvi15xXExB/USj2W0asLBM8zW5I/O7/v0Mn7dRaT5cNRMvQ?=
 =?us-ascii?Q?gHO0WAhatqE0U4BvcQuA0Nvlf3Z6PObZuiFq4YJ0BzlAw659j2UDsiEV9Rzn?=
 =?us-ascii?Q?R2pMRjEO5BGb4v0x8BTYi830r8LI7ISXgEcQlDoXkMQpmrbix5b5qRMyXa8I?=
 =?us-ascii?Q?H7iY09ZMz4Xg8PVyC6F1Z53bI/gWG3yomFcL/gdWzxmegAihGIUkrw9D1GNp?=
 =?us-ascii?Q?gGPI6ZAYg3FimFgY9uPaofUAB45wUxPIwsyBvkBXJ+K2jsLtzVuIBVbzZ4E5?=
 =?us-ascii?Q?c4Q/s+Xfos9u4Q/KKtu2Lmiw6ZhYRk6cNXWCoUVibMq2ph4PIutppTra8BBC?=
 =?us-ascii?Q?Tj0aYRlVggpVdVdOr9OWYl830KCGGJJdShe+g2K3gRE2XHD/oDdvqXc/XH3S?=
 =?us-ascii?Q?W0YF5Q6SSOQ/5Bi6PS5qxSeumG07N+DgDUrz6RxCqr0+4wPlN2u+R67kz9pA?=
 =?us-ascii?Q?bXnBq5NgVdTBquBofvKazF5p4AOpGWkrhBsdPEt4UPRmYfWzzkq9fDQE8SDW?=
 =?us-ascii?Q?H0iowvlMWTesx5auUJpqfBaoWWc28YyAIybGktZZkiWylv8Rr62m/T+3SNr6?=
 =?us-ascii?Q?2p9qCc+g3xJtZ3/dFccQB/UnIu3daWRGLsyAPJX3NwoRYL/d14eKnlxZz6CQ?=
 =?us-ascii?Q?auGI+mM7snQRtWJJPs58Usgnns67TR0eTSjRBS3gDn1c5icBz14Hcs90Td+R?=
 =?us-ascii?Q?z/lpRwjQobp9j6rmWWNKhVZVPpxdpEvJumxNVM6oQzS2eGQa007t4eOmY5cH?=
 =?us-ascii?Q?voa7u9bRlTjpnRfb2feikgpH/+5ImL96BPv9rSz5fioefc1IYN6UyL1C3Ha3?=
 =?us-ascii?Q?F9pyvK7sv/BLrPMTyw02XC+cWRDsdmMwhrT1bOLe2xQY5E5qGCfksoQ/+dRi?=
 =?us-ascii?Q?bbvIUgp2mexHASTpHyrdor+cC6jafxvbRLa6bo6zEui4VAz+yAXdpJ4OX1Zy?=
 =?us-ascii?Q?PMA=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qn31BnIlVnasVTM3t6JW+Em/wncn7jAkMyJPvHA9PhHYxLXJfxozptC94KCG?=
 =?us-ascii?Q?CbyOtFvR9wCS9KDtHcJjrlGiQL+QA4t1nZzFw4oA9ylCIpB7vu4qTjshaH3J?=
 =?us-ascii?Q?v2cG2XKSoJKVwqLw5S95Ytol4quBt8ykErLP1wonCUMSV7U8NdEpvlnE9CL+?=
 =?us-ascii?Q?PkjFzABbO4/+98t6tAeK1dNmVXOV30isoPWMQAHfEGSKRpkTQdWOZ0Lt26Eu?=
 =?us-ascii?Q?o0OXVaT/S2MV7yiKHJYZtO19UcE38s9/4gLKvCKgL1Xh8a63O70tHohgdCAb?=
 =?us-ascii?Q?b7oBb0Sj5xMBBh8m0hTjrBpAiyYNZ4ll+OcphO2awrhZEfQk8dhZAWbQfuG0?=
 =?us-ascii?Q?j6dQhQ8YOy67ZQ4nKcbiJ865JpOeSmIPZcF2yJrYtbxUX+NzhAFkT/+EHKzH?=
 =?us-ascii?Q?pym2SUlcBPtblpqSn+SY79f+lBQ2+cnFcfHf7CGlydaEG1P9G6izyj2M26wi?=
 =?us-ascii?Q?5WbZFEokemO2x4+iRDuEc4+/nsb8mzmwCdB4Et0ffGccksoEIkkXvKuBYmvw?=
 =?us-ascii?Q?f31F2RCS2ymsy8dQuBNtdrU919MjWwwxXasiSMIt1RQgdQzpoaBAZ4RnD59g?=
 =?us-ascii?Q?0BQrPhuXBVys5bv7U4wp0H9/dvdoTVW+frqJ2BwfvQvwFrjDe7L2mIAtnTvr?=
 =?us-ascii?Q?tTdMGy6gyId1WaNY1gCBgYQBIjqimbb6JGhI8Us1j2id3uQ8/9m6I/GqFyxu?=
 =?us-ascii?Q?tKYJpLqmbXFgw9nur5P0d7OsBFahODtMfRyyO3ImyWkbhaPkrfGvH9lFQWYB?=
 =?us-ascii?Q?VtReKQEckpKuRPMkt+CrPt9OWTLUJKFLA8ej/hOCgWkVU61O5U2TSCpb07qQ?=
 =?us-ascii?Q?VTivVUKXbniGlM2niL5yIQanFzAzmGa+fD3Wqy+fCL7CftYB5AdogQTLRYjq?=
 =?us-ascii?Q?7HpivuvaeA0CyLhs7x5XMeSLrqdg0+y5pmyz1g6893V9cxKKs+xHpoC1+JzC?=
 =?us-ascii?Q?NoUwbi9fJBWI9dyc4x73JLlzXGgmA/HAQifZ72D3sLc7DeEctyeg09pNxHyz?=
 =?us-ascii?Q?blug+Hi6QnC/7A1YYL8V4t92GDvv0QAn/wH7/BwwPngFojw3ETnonOrXIk/N?=
 =?us-ascii?Q?hagJTcZqy27jmjzPGcE39Kk9GlQSvKFw8naHgwnPj6d7iZeW8KNfUkKe4ICE?=
 =?us-ascii?Q?tniylf6VAMsweoTFGlsyWBScPPKwo3BCKFZctitOvpJrWQQHr/Jb7Mj45Djf?=
 =?us-ascii?Q?l9AeAh+PT7XG3+Pmx81d3sgHTllnmLGZC1Iv18sYjDMQ2abSwd1PHTnnKJU?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 529bd116-7402-4e4f-8292-08ddef51123a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 03:29:23.3641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8856
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

From: Michael Kelley Sent: Thursday, September 4, 2025 10:36 PM
>=20
> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, September 4=
, 2025 7:56 AM
> >
> > Compositors often depend on vblanks to limit their display-update
> > rate. Without, they see vblank events ASAP, which breaks the rate-
> > limit feature. This creates high CPU overhead. It is especially a
> > problem with virtual devices with fast framebuffer access.
> >
> > The series moves vkms' vblank timer to DRM and converts the hyperv
> > DRM driver. An earlier version of this series contains examples of
> > other updated drivers. In principle, any DRM driver without vblank
> > hardware can use the timer.
>=20
> I've tested this patch set in a Hyper-V guest against the linux-next20250=
829
> kernel. All looks good. Results and perf are the same as reported here [4=
].
> So far I haven't seen the "vblank timer overrun" error, which is consiste=
nt
> with the changes you made since my earlier testing. I'll keep running thi=
s
> test kernel for a while to see if anything anomalous occurs.

As I continued to run with this patch set, I got a single occurrence of thi=
s
WARN_ON. I can't associate it with any particular action as I didn't notice
it until well after it occurred.

[213730.719364] ------------[ cut here ]------------
[213730.719423] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] drm_=
WARN_ON(!ktime_compare(*vblank_time, vblank->time))
[213730.719522] WARNING: drivers/gpu/drm/drm_vblank.c:2309 at drm_crtc_vbla=
nk_get_vblank_timeout+0x90/0xb0 [drm], CPU#4: kworker/4:0/7172
[213730.719871] Modules linked in: nls_iso8859_1(E) dm_multipath(E) scsi_dh=
_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) binfmt_misc(E) intel_rapl_msr(E) in=
tel_rapl_common(E) rapl(E) hyperv_fb(E) cfbfillrect(E) cfbimgblt(E) fb_io_f=
ops(E) serio_raw(E) cfbcopyarea(E) hv_balloon(E) joydev(E) mac_hid(E) sch_f=
q_codel(E) msr(E) ramoops(E) reed_solomon(E) efi_pstore(E) autofs4(E) btrfs=
(E) blake2b_generic(E) raid10(E) raid456(E) async_raid6_recov(E) async_memc=
py(E) async_pq(E) async_xor(E) async_tx(E) xor(E) raid6_pq(E) raid1(E) raid=
0(E) hyperv_drm(E) drm_client_lib(E) drm_shmem_helper(E) syscopyarea(E) sys=
fillrect(E) sysimgblt(E) fb_sys_fops(E) drm_kms_helper(E) drm(E) drm_panel_=
orientation_quirks(E) fb(E) hid_generic(E) hid_hyperv(E) lcd(E) hid(E) hv_s=
torvsc(E) ledtrig_backlight(E) hyperv_keyboard(E) hv_netvsc(E) hv_utils(E) =
scsi_transport_fc(E) ghash_clmulni_intel(E) hv_vmbus(E) aesni_intel(E)
[213730.720514] CPU: 4 UID: 0 PID: 7172 Comm: kworker/4:0 Kdump: loaded Tai=
nted: G            E       6.17.0-rc3-next-20250829+ #3 PREEMPT(voluntary)
[213730.723220] Tainted: [E]=3DUNSIGNED_MODULE
[213730.724452] Hardware name: Microsoft Corporation Virtual Machine/Virtua=
l Machine, BIOS Hyper-V UEFI Release v4.1 11/21/2024
[213730.724993] Workqueue: events drm_fb_helper_damage_work [drm_kms_helper=
]
[213730.725491] RIP: 0010:drm_crtc_vblank_get_vblank_timeout+0x90/0xb0 [drm=
]
[213730.726082] Code: 8b 7f 08 4c 8b 67 50 4d 85 e4 74 33 e8 99 b6 7f c7 48=
 c7 c1 60 e8 93 c0 4c 89 e2 48 c7 c7 b5 25 94 c0 48 89 c6 e8 00 06 e3 c6 <0=
f> 0b eb c0 e8 07 f6 f1 c6 48 89 03 5b 41 5c 5d c3 cc cc cc cc 4c
[213730.726506] RSP: 0018:ffffbba54e0efc00 EFLAGS: 00010282
[213730.726692] RAX: 0000000000000000 RBX: ffffbba54e0efc78 RCX: 0000000000=
000027
[213730.726899] RDX: ffff954f07d1cec8 RSI: 0000000000000001 RDI: ffff954f07=
d1cec0
[213730.727094] RBP: ffffbba54e0efc10 R08: 0000000000000000 R09: ffffbba54e=
0efa70
[213730.727280] R10: ffffbba54e0efa68 R11: ffffffff88d4c748 R12: ffff954e01=
0a4cc0
[213730.727456] R13: 0000000000000000 R14: ffff954e20070d80 R15: ffff954e25=
1002c8
[213730.727636] FS:  0000000000000000(0000) GS:ffff954f7e938000(0000) knlGS=
:0000000000000000
[213730.727834] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[213730.728009] CR2: 00007fe11629d010 CR3: 000000011f843004 CR4: 0000000000=
b70ef0
[213730.728186] Call Trace:
[213730.728359]  <TASK>
[213730.728511]  drm_crtc_vblank_helper_get_vblank_timestamp_from_timer+0x1=
5/0x20 [drm_kms_helper]
[213730.728674]  drm_crtc_get_last_vbltimestamp+0x55/0x90 [drm]
[213730.728864]  drm_crtc_next_vblank_start+0x4e/0x90 [drm]
[213730.729043]  drm_atomic_helper_wait_for_fences+0x7c/0x1e0 [drm_kms_help=
er]
[213730.729196]  drm_atomic_helper_commit+0xa1/0x160 [drm_kms_helper]
[213730.729335]  drm_atomic_commit+0xb0/0xe0 [drm]
[213730.729481]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
[213730.729643]  drm_atomic_helper_dirtyfb+0x1aa/0x280 [drm_kms_helper]
[213730.729800]  drm_fbdev_shmem_helper_fb_dirty+0x4c/0xb0 [drm_shmem_helpe=
r]
[213730.729939]  drm_fb_helper_damage_work+0x8d/0x170 [drm_kms_helper]
[213730.730071]  process_one_work+0x19c/0x3f0
[213730.730204]  worker_thread+0x2c3/0x3d0
[213730.730332]  kthread+0x116/0x230
[213730.730459]  ? __pfx_worker_thread+0x10/0x10
[213730.730580]  ? _raw_spin_unlock_irq+0x12/0x40
[213730.730744]  ? __pfx_kthread+0x10/0x10
[213730.730898]  ret_from_fork+0xec/0x130
[213730.731027]  ? __pfx_kthread+0x10/0x10
[213730.731152]  ret_from_fork_asm+0x1a/0x30
[213730.731277]  </TASK>
[213730.731396] ---[ end trace 0000000000000000 ]---

>=20
> For Patches 1, 2, and 4 of the series on a Hyper-V guest,
>=20
> Tested-by: Michael Kelley <mhklinux@outlook.com>
>=20
> [4] https://lore.kernel.org/dri-devel/20250523161522.409504-1-
> mhklinux@outlook.com/T/#m2e288dddaf7b3c025bbbf88da4b4c39e7aa950a7
>=20
> >
> > The series has been motivated by a recent discussion about hypervdrm [1=
]
> > and other long-standing bug reports. [2][3]
> >
> > v3:
> > - fix deadlock (Ville, Lyude)
> > v2:
> > - rework interfaces
> >
> > [1] https://lore.kernel.org/dri-devel/20250523161522.409504-1-
> mhklinux@outlook.com/T/#ma2ebb52b60bfb0325879349377738fadcd7cb7ef
> > [2] https://bugzilla.suse.com/show_bug.cgi?id=3D1189174
> > [3] https://invent.kde.org/plasma/kwin/-/merge_requests/1229#note_28460=
6
> >
> > Thomas Zimmermann (4):
> >   drm/vblank: Add vblank timer
> >   drm/vblank: Add CRTC helpers for simple use cases
> >   drm/vkms: Convert to DRM's vblank timer
> >   drm/hypervdrm: Use vblank timer
> >
> >  Documentation/gpu/drm-kms-helpers.rst       |  12 ++
> >  drivers/gpu/drm/Makefile                    |   3 +-
> >  drivers/gpu/drm/drm_vblank.c                | 161 +++++++++++++++++-
> >  drivers/gpu/drm/drm_vblank_helper.c         | 176 ++++++++++++++++++++
> >  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  11 ++
> >  drivers/gpu/drm/vkms/vkms_crtc.c            |  83 +--------
> >  drivers/gpu/drm/vkms/vkms_drv.h             |   2 -
> >  include/drm/drm_modeset_helper_vtables.h    |  12 ++
> >  include/drm/drm_vblank.h                    |  32 ++++
> >  include/drm/drm_vblank_helper.h             |  56 +++++++
> >  10 files changed, 467 insertions(+), 81 deletions(-)
> >  create mode 100644 drivers/gpu/drm/drm_vblank_helper.c
> >  create mode 100644 include/drm/drm_vblank_helper.h
> >
> > --
> > 2.50.1

