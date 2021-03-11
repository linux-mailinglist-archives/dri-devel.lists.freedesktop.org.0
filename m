Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD287337169
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 12:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F6B88130;
	Thu, 11 Mar 2021 11:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2F388130
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 11:32:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGT/qNFPWETh/lCp1VMQ7+IhqhiZzBxF+uWhCYXbdWsilYGgC03vrbhbODW/FanXS8rZi2Xl5T0v87lJ/fWDg9PVmBG1OlF2xqxvpCR/lM82nC7p51VeRcvCdU+SSwBLXanaXdRdxFGbv+nua7byUJ51X0c2KFAb76xIn78QMpe+bn8ALrxB1g/OdXFlrb6oPUO8lXUE/5KZJPuCP2XT0uv5vKIsuPZrpqsWre5giYS1uS9ZiB3Zd350H0zSbgE5BT17D1Cb4ay6zSnX9NxO/rmAMuL+gcOHPujsodc060E7RlXRf5eq5BM5rvA0imtSPvqyTNph7bYuPpLUUJ/EZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njnk8lZpxRlbEfzmMrlsFogF+cs81+AJLenYcrgIxNA=;
 b=AOVTeJaoahw2yibNolUKrFa09wFMKd+pdKS6tdbGoiAwmMtJmqD8pNh/oHpQq4/1gHNPk6tVLqinmam/ATgKOio0D8wDoPZPvAPUeIiQkR3Dbna1DK4BrOY++ri/sruOuCciN5ROlsGdhsZemzh9zFkcpsWvKV0s5Ts7kIFqlpmSlxxtJqxx6OGx6V/5O+RE09PcMYm6wF4F4FcSMzGLXDZJ/KYk6o6ukIomTO98iwtNQcJWwMGAMr5YIQIE0bCbQ/ZT0rrcW5X+17GJu8vPAWgiKk8aLE6M9sanpTb24wH717+l/Ou5rhKoOSvTTXU7uwHhrbqx7bUQmTQS80A4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njnk8lZpxRlbEfzmMrlsFogF+cs81+AJLenYcrgIxNA=;
 b=vE6Lb0pFrwyhAzL/WqAPaDIQQLJROTqy4nEY1odgI/Fa+8tb1TwJfrIjQV/67j2co1QhgDIvPmIlM/WnucJiH7R4PpHUjVfMivb+MqKNkp/SA5SCcsqmh2N9Y0qVou02yxv0uAafL4ozkoL69vZ7ANhKu3pVviOnQNyfGeSssNE=
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 11:32:29 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3933.031; Thu, 11 Mar 2021
 11:32:29 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?iso-8859-1?Q?Thomas_Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-graphics-maintainer@vmware.com" <linux-graphics-maintainer@vmware.com>
Subject: AW: vmwgfx leaking bo pins?
Thread-Topic: vmwgfx leaking bo pins?
Thread-Index: AQHXFmPGhOir81SOf0G7a9qT2xW4cqp+pxoP
Date: Thu, 11 Mar 2021 11:32:29 +0000
Message-ID: <MN2PR12MB3775316F45FA7329F375D5F483909@MN2PR12MB3775.namprd12.prod.outlook.com>
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
In-Reply-To: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2a01:598:91b0:db8a:8549:e251:5673:4f7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2e1df949-42e3-4af0-2d6c-08d8e4815abc
x-ms-traffictypediagnostic: MN2PR12MB4253:
x-microsoft-antispam-prvs: <MN2PR12MB425353CDA916D4C91A24674F83909@MN2PR12MB4253.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v7n4xCqQHPuUUsHZrJq2NbsydVzYUOTQAKcU1tsSlV4INxgjCv1kLxEvigltUS/cmTSmavX4vt2ToqniH0p2kZeoRhnvVdwOKA5jEF2nSHJ4e5TMlqN0SchnUa1wAihV6VJzCfyICWk/0y0p9GoG0ed1+XKVJX2oswawXq9tYCi549Ikj/hre7xDyr0moJ3ZEAJh0otF+W8OAI9GzuBH/vUIHFo6VjP6UiSsU6e4JHgheo8vEVPHK2XTsj4SB0oMJrq/aGYMNOAI8LsNn/D7X0GDMWTlC+1R/GoZbZoo0YZpY0bhLNohzpCSZ7U5lwOp3naDP2nJ0Oe7jlL8S6hzDO8sBxruAWM720y+2v2jA0wgHipyEldN05lAJydMeQuOZ0tNnRCvE0PVYmhxtEwZLvoGpawRGJRagX5sLFU5nj6a3NioknZbesznNjFPcHTceZzAb3l4txagXB580DZD0bXuSwRG7x8ggpyJeNOScoTZExst+SKLurl3A0AUQWkVDgRWtrYe2L+yODubhIuGJWRDqhMekOCA3ND6Uua2tqwZ/vWLa+T2yK9u504ONvAB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(110136005)(71200400001)(91956017)(55016002)(316002)(76116006)(86362001)(7696005)(66574015)(52536014)(64756008)(186003)(4326008)(8936002)(6506007)(5660300002)(33656002)(66476007)(66946007)(478600001)(8676002)(2906002)(45080400002)(66446008)(66556008)(9686003)(83380400001)(40753002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?+2PtnihPIeGXVxE7oi0oAQGO2N6Bgqu8ERi3TnVLQfvjy/2lcS7SmxdxvK?=
 =?iso-8859-1?Q?41La9M7nMCJl+MgJ1fIkHZxtqoxOC86YeUvYn/TLGCvcSaIEU015O9YYJg?=
 =?iso-8859-1?Q?HNLu9050oLv2cQzethjhcwHKiGDQlCa2EOzIY9+K4+8SHHAMB9eHWWGu+P?=
 =?iso-8859-1?Q?s2LCWe5gCMnzSCMuZ62BY9E3WmtXfgo6QZUfE5bghn5L+WLyse+XmCyeQ6?=
 =?iso-8859-1?Q?I3RmzrADvsq0mu8gXGYB0N4C/NTZyxsJ2z0X84VvrupSWOT4rZ1Vn7dg58?=
 =?iso-8859-1?Q?+jFnJ9AKzH/Qge1H54ZM5jsU4iX6/GDe48Ph2E0teEYyvXbPHyNulZgXYT?=
 =?iso-8859-1?Q?ezdRYaPiBi4X7IdHH0PhtXHdXaBQoeusi/i6WEdf3b1DrbT67OFR2UQm/y?=
 =?iso-8859-1?Q?Vek53vZ7DVWiNDEcphz5L2FNXT5/kcOpDKg1+/p1J+lqiQbN4r8qJ4wLSz?=
 =?iso-8859-1?Q?CRXvohp2ohoFujh5d/tDYn1jItTD5HWOvsI5T9Kskhng+xWkiYERNEXilt?=
 =?iso-8859-1?Q?icdJDci+NXmjedx5+0BtdsriLCJaLsojAl8vUsH1QQMizGbnfQ1ZNuN4Ys?=
 =?iso-8859-1?Q?UivLBHD/+Ew1rprcrCFijxYmlYMoJ8Lvxvzf3iC9hGbJoVMslPNn37NfYG?=
 =?iso-8859-1?Q?v8tNjuWEvUCpYks0ewvwXjDtuHJXdQ/hZ6scpvelh8Le7W6CkG1qnvknzN?=
 =?iso-8859-1?Q?wS0tCKK0YBzr0JH8VEX588oStQsOdzNsoG2mvAJqKRC823tY9GFyEuVxbM?=
 =?iso-8859-1?Q?EYPY3hcthfhXX8gNfx8U2UA5yn44WOx5SH+bhx9R2ppJdRu7bq1tQDdgia?=
 =?iso-8859-1?Q?9wnabjY2bjFzxvnGNxY5+lw2hkIaPZoaoZRx8tNy2vMkQcek22Kp8uqctG?=
 =?iso-8859-1?Q?1fKsdo1VZxmOSpEynNKMUZY/hFYX+0Th8SYnx7T6Gy4BlY2NkORccaf65n?=
 =?iso-8859-1?Q?RgQWumILdQBgi8QMUvZv6ojEmYCpPmmRJJWojyxweexPx8nPwls93zNvb9?=
 =?iso-8859-1?Q?gIYbiVeS1E775g3phUDb1yA9vgZJxVTvvsrsYWkUc85KZ3o0/aV0wSS3ib?=
 =?iso-8859-1?Q?ESkba/odyrfDS4ur4AmhRPMcWJFsR38jviWe8k/DHu4UNKckYvvxUKPI7P?=
 =?iso-8859-1?Q?4TQSef3j3w7youxgCNNQMxR5FlohBHoR9auWM9GtCB/AfEtDL5qINyep+D?=
 =?iso-8859-1?Q?RLm7Zva/9+oLsf2HW0i/KhiNmNxmfqaxi+u5W67p2uI3l2fKDBlRQwDNcx?=
 =?iso-8859-1?Q?wCkIJB19NC78nuaDC6B8iWAH6IdW8vXts3PGEXSDSrk8If/79wzWZa8SgU?=
 =?iso-8859-1?Q?40IkXGYsu9uVN9FaAp/f4IaLBpanuVxNJg7iaTgA/LLtj2VjsFgV712XFH?=
 =?iso-8859-1?Q?glgDWOpMeJNzkg0o+Ww6VZ60t9gJL+BgmbmWapv1pByaUCtCpters=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1df949-42e3-4af0-2d6c-08d8e4815abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 11:32:29.5102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MztruyLi22y/YtTKBI5YlaTqiJgqMTNeUR4nWj/0GWcOQ8pbK+VwM6y/IzUHI2U3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0857998118=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0857998118==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3775316F45FA7329F375D5F483909MN2PR12MB3775namp_"

--_000_MN2PR12MB3775316F45FA7329F375D5F483909MN2PR12MB3775namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

We are investigating a similar problem with radeon.

So far no idea what's going wrong since it doesn't seem to happen with amdg=
pu.

If you have an idea please speak up :)

Thanks,
Christian.
________________________________
Von: Thomas Hellstr=F6m (Intel) <thomas_os@shipmail.org>
Gesendet: Donnerstag, 11. M=E4rz 2021 11:46
An: Daniel Vetter <daniel.vetter@ffwll.ch>; Koenig, Christian <Christian.Ko=
enig@amd.com>; linux-graphics-maintainer@vmware.com <linux-graphics-maintai=
ner@vmware.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Betreff: vmwgfx leaking bo pins?

Hi,

I tried latest drm-fixes today and saw a lot of these: Fallout from ttm
rework?

/Thomas

[  298.404788] WARNING: CPU: 1 PID: 3839 at
drivers/gpu/drm/ttm/ttm_bo.c:512 ttm_bo_release+0x2b5/0x300 [ttm]
[  298.404795] Modules linked in: nls_utf8 isofs rfcomm tun bridge stp
llc ip6table_nat ip6table_mangle ip6table_raw ip6table_security
iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 libcrc32c nf_defrag_ipv4
iptable_mangle iptable_raw iptable_security ip_set nfnetlink
ip6table_filter ip6_tables iptable_filter cmac bnep vsock_loopback
vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock
snd_seq_midi snd_seq_midi_event intel_rapl_msr snd_ens1371
snd_ac97_codec ac97_bus vmw_balloon intel_rapl_common snd_seq rapl
snd_pcm btusb btrtl btbcm btintel bluetooth joydev gameport snd_timer
snd_rawmidi snd_seq_device rfkill snd ecdh_generic vmw_vmci ecc
soundcore i2c_piix4 auth_rpcgss sunrpc ip_tables vmwgfx drm_kms_helper
cec ttm e1000 crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel drm mptspi serio_raw scsi_transport_spi mptscsih
mptbase ata_generic pata_acpi uas usb_storage fuse
[  298.404837] CPU: 1 PID: 3839 Comm: thunderbird Tainted: G
W         5.12.0-rc2+ #42
[  298.404839] Hardware name: VMware, Inc. VMware Virtual Platform/440BX
Desktop Reference Platform, BIOS 6.00 07/29/2019
[  298.404840] RIP: 0010:ttm_bo_release+0x2b5/0x300 [ttm]
[  298.404845] Code: e8 a0 f3 35 ce e9 da fd ff ff 49 8b 7e 90 b9 30 75
00 00 31 d2 be 01 00 00 00 e8 c6 17 36 ce 49 8b 46 e0 eb 9e 48 89 e8 eb
99 <0f> 0b 41 c7 86 94 00 00 00 00 00 00 00 49 8d 76 08 31 d2 4c 89 ef
[  298.404847] RSP: 0018:ffffb24a43ef3bd0 EFLAGS: 00010202
[  298.404848] RAX: 0000000000000001 RBX: 0000000000000000 RCX:
0000000000000001
[  298.404850] RDX: 0000000000000001 RSI: 0000000000000246 RDI:
ffffffffc03c50e8
[  298.404851] RBP: ffff9ad4429f2620 R08: 0000000000000001 R09:
ffff9ad4429f2000
[  298.404852] R10: ffff9ad48664e090 R11: 0000000000000000 R12:
ffff9ad4e71371d0
[  298.404852] R13: ffff9ad4e7137000 R14: ffff9ad4e7137168 R15:
ffff9ad48710f4c0
[  298.404854] FS:  00007fc6d9ae4780(0000) GS:ffff9ad576e40000(0000)
knlGS:0000000000000000
[  298.404855] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  298.404857] CR2: 00007fc6c6740000 CR3: 00000001a4eac004 CR4:
00000000003706e0
[  298.404864] Call Trace:
[  298.404866]  vmw_resource_release+0x131/0x1f0 [vmwgfx]
[  298.404878]  vmw_context_cotables_unref.isra.0+0x6f/0xa0 [vmwgfx]
[  298.404891]  vmw_resource_release+0x16a/0x1f0 [vmwgfx]
[  298.404901]  vmw_user_context_base_release+0x31/0x50 [vmwgfx]
[  298.404912]  ttm_release_base+0x7f/0xc0 [vmwgfx]
[  298.404922]  ttm_ref_object_release+0xde/0xf0 [vmwgfx]
[  298.404931]  ttm_ref_object_base_unref+0x8e/0xb0 [vmwgfx]
[  298.404940]  ? vmw_dx_context_unbind+0x1e0/0x1e0 [vmwgfx]
[  298.404951]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[  298.404974]  drm_ioctl+0x20f/0x3a0 [drm]
[  298.404991]  ? vmw_dx_context_unbind+0x1e0/0x1e0 [vmwgfx]
[  298.405003]  ? selinux_file_ioctl+0x135/0x230
[  298.405006]  ? drm_version+0x90/0x90 [drm]
[  298.405023]  vmw_generic_ioctl+0xab/0x150 [vmwgfx]
[  298.405033]  __x64_sys_ioctl+0x83/0xb0
[  298.405035]  do_syscall_64+0x33/0x40
[  298.405038]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  298.405041] RIP: 0033:0x7fc6d9be15db
[  298.405042] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b5 e8 1c ff
ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6d b8 0c 00 f7 d8 64 89 01 48
[  298.405044] RSP: 002b:00007ffc8ce6de98 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  298.405046] RAX: ffffffffffffffda RBX: 00007ffc8ce6dee0 RCX:
00007fc6d9be15db
[  298.405048] RDX: 00007ffc8ce6dee0 RSI: 0000000040086448 RDI:
0000000000000007
[  298.405049] RBP: 0000000040086448 R08: 0000000000000000 R09:
0000000000000000
[  298.405050] R10: 0000000000000000 R11: 0000000000000246 R12:
00007fc6d98e0000
[  298.405051] R13: 0000000000000007 R14: 00007fc6d98ea3b0 R15:
00007fc6c671f800
[  298.405053] ---[ end trace c628fb3ea8b5aa96 ]---


--_000_MN2PR12MB3775316F45FA7329F375D5F483909MN2PR12MB3775namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
We are investigating a similar problem with radeon.</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
<br>
</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
So far no idea what's going wrong since it doesn't seem to happen with amdg=
pu.</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
<br>
</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
If you have an idea please speak up :)</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
<br>
</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
Thanks,</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
Christian.</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> Thomas Hellstr=F6m (In=
tel) &lt;thomas_os@shipmail.org&gt;<br>
<b>Gesendet:</b> Donnerstag, 11. M=E4rz 2021 11:46<br>
<b>An:</b> Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;; Koenig, Christian =
&lt;Christian.Koenig@amd.com&gt;; linux-graphics-maintainer@vmware.com &lt;=
linux-graphics-maintainer@vmware.com&gt;<br>
<b>Cc:</b> DRI Development &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Betreff:</b> vmwgfx leaking bo pins?</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
I tried latest drm-fixes today and saw a lot of these: Fallout from ttm <br=
>
rework?<br>
<br>
/Thomas<br>
<br>
[&nbsp; 298.404788] WARNING: CPU: 1 PID: 3839 at <br>
drivers/gpu/drm/ttm/ttm_bo.c:512 ttm_bo_release+0x2b5/0x300 [ttm]<br>
[&nbsp; 298.404795] Modules linked in: nls_utf8 isofs rfcomm tun bridge stp=
 <br>
llc ip6table_nat ip6table_mangle ip6table_raw ip6table_security <br>
iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 libcrc32c nf_defrag_ipv4 <br=
>
iptable_mangle iptable_raw iptable_security ip_set nfnetlink <br>
ip6table_filter ip6_tables iptable_filter cmac bnep vsock_loopback <br>
vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock <br>
snd_seq_midi snd_seq_midi_event intel_rapl_msr snd_ens1371 <br>
snd_ac97_codec ac97_bus vmw_balloon intel_rapl_common snd_seq rapl <br>
snd_pcm btusb btrtl btbcm btintel bluetooth joydev gameport snd_timer <br>
snd_rawmidi snd_seq_device rfkill snd ecdh_generic vmw_vmci ecc <br>
soundcore i2c_piix4 auth_rpcgss sunrpc ip_tables vmwgfx drm_kms_helper <br>
cec ttm e1000 crct10dif_pclmul crc32_pclmul crc32c_intel <br>
ghash_clmulni_intel drm mptspi serio_raw scsi_transport_spi mptscsih <br>
mptbase ata_generic pata_acpi uas usb_storage fuse<br>
[&nbsp; 298.404837] CPU: 1 PID: 3839 Comm: thunderbird Tainted: G&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
W&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.12.0-rc2+ #42<br>
[&nbsp; 298.404839] Hardware name: VMware, Inc. VMware Virtual Platform/440=
BX <br>
Desktop Reference Platform, BIOS 6.00 07/29/2019<br>
[&nbsp; 298.404840] RIP: 0010:ttm_bo_release+0x2b5/0x300 [ttm]<br>
[&nbsp; 298.404845] Code: e8 a0 f3 35 ce e9 da fd ff ff 49 8b 7e 90 b9 30 7=
5 <br>
00 00 31 d2 be 01 00 00 00 e8 c6 17 36 ce 49 8b 46 e0 eb 9e 48 89 e8 eb <br=
>
99 &lt;0f&gt; 0b 41 c7 86 94 00 00 00 00 00 00 00 49 8d 76 08 31 d2 4c 89 e=
f<br>
[&nbsp; 298.404847] RSP: 0018:ffffb24a43ef3bd0 EFLAGS: 00010202<br>
[&nbsp; 298.404848] RAX: 0000000000000001 RBX: 0000000000000000 RCX: <br>
0000000000000001<br>
[&nbsp; 298.404850] RDX: 0000000000000001 RSI: 0000000000000246 RDI: <br>
ffffffffc03c50e8<br>
[&nbsp; 298.404851] RBP: ffff9ad4429f2620 R08: 0000000000000001 R09: <br>
ffff9ad4429f2000<br>
[&nbsp; 298.404852] R10: ffff9ad48664e090 R11: 0000000000000000 R12: <br>
ffff9ad4e71371d0<br>
[&nbsp; 298.404852] R13: ffff9ad4e7137000 R14: ffff9ad4e7137168 R15: <br>
ffff9ad48710f4c0<br>
[&nbsp; 298.404854] FS:&nbsp; 00007fc6d9ae4780(0000) GS:ffff9ad576e40000(00=
00) <br>
knlGS:0000000000000000<br>
[&nbsp; 298.404855] CS:&nbsp; 0010 DS: 0000 ES: 0000 CR0: 0000000080050033<=
br>
[&nbsp; 298.404857] CR2: 00007fc6c6740000 CR3: 00000001a4eac004 CR4: <br>
00000000003706e0<br>
[&nbsp; 298.404864] Call Trace:<br>
[&nbsp; 298.404866]&nbsp; vmw_resource_release+0x131/0x1f0 [vmwgfx]<br>
[&nbsp; 298.404878]&nbsp; vmw_context_cotables_unref.isra.0+0x6f/0xa0 [vmwg=
fx]<br>
[&nbsp; 298.404891]&nbsp; vmw_resource_release+0x16a/0x1f0 [vmwgfx]<br>
[&nbsp; 298.404901]&nbsp; vmw_user_context_base_release+0x31/0x50 [vmwgfx]<=
br>
[&nbsp; 298.404912]&nbsp; ttm_release_base+0x7f/0xc0 [vmwgfx]<br>
[&nbsp; 298.404922]&nbsp; ttm_ref_object_release+0xde/0xf0 [vmwgfx]<br>
[&nbsp; 298.404931]&nbsp; ttm_ref_object_base_unref+0x8e/0xb0 [vmwgfx]<br>
[&nbsp; 298.404940]&nbsp; ? vmw_dx_context_unbind+0x1e0/0x1e0 [vmwgfx]<br>
[&nbsp; 298.404951]&nbsp; drm_ioctl_kernel+0xaa/0xf0 [drm]<br>
[&nbsp; 298.404974]&nbsp; drm_ioctl+0x20f/0x3a0 [drm]<br>
[&nbsp; 298.404991]&nbsp; ? vmw_dx_context_unbind+0x1e0/0x1e0 [vmwgfx]<br>
[&nbsp; 298.405003]&nbsp; ? selinux_file_ioctl+0x135/0x230<br>
[&nbsp; 298.405006]&nbsp; ? drm_version+0x90/0x90 [drm]<br>
[&nbsp; 298.405023]&nbsp; vmw_generic_ioctl+0xab/0x150 [vmwgfx]<br>
[&nbsp; 298.405033]&nbsp; __x64_sys_ioctl+0x83/0xb0<br>
[&nbsp; 298.405035]&nbsp; do_syscall_64+0x33/0x40<br>
[&nbsp; 298.405038]&nbsp; entry_SYSCALL_64_after_hwframe+0x44/0xae<br>
[&nbsp; 298.405041] RIP: 0033:0x7fc6d9be15db<br>
[&nbsp; 298.405042] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b5 e8 1c f=
f <br>
ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 00 00 0f <br=
>
05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6d b8 0c 00 f7 d8 64 89 01 4=
8<br>
[&nbsp; 298.405044] RSP: 002b:00007ffc8ce6de98 EFLAGS: 00000246 ORIG_RAX: <=
br>
0000000000000010<br>
[&nbsp; 298.405046] RAX: ffffffffffffffda RBX: 00007ffc8ce6dee0 RCX: <br>
00007fc6d9be15db<br>
[&nbsp; 298.405048] RDX: 00007ffc8ce6dee0 RSI: 0000000040086448 RDI: <br>
0000000000000007<br>
[&nbsp; 298.405049] RBP: 0000000040086448 R08: 0000000000000000 R09: <br>
0000000000000000<br>
[&nbsp; 298.405050] R10: 0000000000000000 R11: 0000000000000246 R12: <br>
00007fc6d98e0000<br>
[&nbsp; 298.405051] R13: 0000000000000007 R14: 00007fc6d98ea3b0 R15: <br>
00007fc6c671f800<br>
[&nbsp; 298.405053] ---[ end trace c628fb3ea8b5aa96 ]---<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3775316F45FA7329F375D5F483909MN2PR12MB3775namp_--

--===============0857998118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0857998118==--
