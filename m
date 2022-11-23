Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CB5635296
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F6810E50B;
	Wed, 23 Nov 2022 08:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B0A10E50B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:28:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odk1JPa0AgF+iCFjVXRd6qitQw8W9zntZlwc7F5u4DBysQJLF4zK4WPccUVeLgy1GVbhxx2Zw0jCjLV7klZ/zjOawb/dTcnDanPIplJLqFFzOIFS8pzJqbEzQxqT+w+7OGDxcNRQkUVpWWxGGzNJ8pM+Sdmp595rxY2JYf8a39KosW3bGsmvr/ILn1r4b3+3Nj96bGC1TlcAXptcRYbAlrpcG6Q6vtzuw62v3bQ7xDiVSCWGSL9CIicDz1pQN05WRtF50x2yhuPhyTJ+1b9OVwQrZMFbG/tUdldjpi+aATeGApgz1mCqFrhlV3YDa6/NEkEsxJ1m+6AMDa6dqFhhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2lTorZ0JlpTanTWsrAzX/JSZT84mBygRwcR+I6W0kk=;
 b=djOQPyP4QvzQI+quHgcTFmIvLD/LdCHbwTjGnaCXx5rgZ8vRVzyKEwvrZorECLT+F4cOqXhxteJwX9BD/N36HreAwiNV1W/d8zuMO0AEKEZOdAknJ0TtuzifbZcNkliDVBmnNokrW3e6dYr1XqtLiatpgOTWdIfU95WCuvhrb0BWdxhZTbnJUbmkmP5vudOTW30JYuGwrAePQ37qx4h1Vz34SUtlE7lg3wFcg76Fbu9X8Gs7CnM90kWrpRGMg5NioTE3gz8Vhc8oRh59ID8N0mScXjX7k3PP9MW8k5xxieV67gAicryex4wyT09l0aqEAy5fh/CVz1SIb3Nlv9etJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2lTorZ0JlpTanTWsrAzX/JSZT84mBygRwcR+I6W0kk=;
 b=FZ45AGbFdxEh699r2xLEmYUdW8Jq2IRgoLtihHebPni4SI1UUyarVk/mjMrCb42hj8Ki3sKLSxrPSmD6u5wXhSTdpMyae2Q9NGlf1HCRurY1JWT6X6kRZX7uD71ZolZt+/Tw6MTCqHcCqm9vAijS3t97xN2ekYQ/CT9wvgQESt0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB9873.jpnprd01.prod.outlook.com (2603:1096:400:22b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 08:28:51 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 08:28:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Thread-Topic: Re: [PATCH v2 5/6] drm/fb-helper: Schedule deferred-I/O worker
 after writing to framebuffer
Thread-Index: Adj/Ego4F6mti9kBRqOBoe7Z1q73qw==
Date: Wed, 23 Nov 2022 08:28:51 +0000
Message-ID: <OS0PR01MB592225470AD263665B0E8647860C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB9873:EE_
x-ms-office365-filtering-correlation-id: 7adf1d29-9f61-4c00-d98f-08dacd2cc053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9yGMNp6Ar+sZ0MWm/maqryc/N0AgIdVhyKdkPgLu+EnL5Dp1+Ym/ZUC/wqPw86TPbM4MJlkVMRYINb3V+vyr9cExTqvShqxA1vTyzNzqJDFZxpgoc6+rsUNFA3wuDc8pa0MAXvLo/JbPDVU391YOijiBTXBn8BEHB95ZpoAWVDR3q0vJjhHhfok23Woz4MMVCocy/mu6CdfcJEVKmg57OdD7wHXHkHwV4G+9+fbP3s5zBTplX0Ylki331Lywv37uwf+W6LMmlboOk4ibJlydf5JXqf9htEAVpRp0LOkwUvS0I501gerSFVo8HB6c9FVZfLcHwniS+UcRbOqZAD6EJcLG+q97vQpGraHGFAef/Spw4JhLxmPxxPzKKSoKSBtLnQh2x5Ggnfi55TsUj/vyX8ln2THHAvRbW/+nKDTsjbI4j8kWMkSMcpE1zIcbGZGHJM2xGkyLJh0jw1YS0QaM7b/TyLtiQx7CM9NNqoz/wYVyObe+gyMSVE+kCrWuaWtWXSevqK04xipiOYoeRGfEfLqugDGYKXRZe5J/AqWsSp/5g5sTLh+xcU3thoANARAf1hdmttSZm4K3KsbmRc1VZt15JaV2zMZwy/XHfG5kkfbeheZFVDkH/936lqjskIMW+PIplWcdEzJ7mwZ3e2FCN1SfLGfswLGoW/+JaZiuQqFp3295mC2Ve6+ZnNCS7p/CQr1c2i8MV9SkaeYPE/Za6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(33656002)(52536014)(38070700005)(41300700001)(38100700002)(2906002)(86362001)(66476007)(83380400001)(122000001)(9686003)(66556008)(8676002)(66946007)(316002)(66446008)(4326008)(76116006)(186003)(71200400001)(45080400002)(64756008)(54906003)(26005)(8936002)(55016003)(478600001)(7416002)(6916009)(5660300002)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cp4ucFWG8o256GLz81hrJVGrbI50qUK4phlbgNtbrCy9mFilB9wbzUzotnqF?=
 =?us-ascii?Q?JZ93cnM9RVIAFv/dE8FwEuwo3kIx/8YIBc5u9AL6qZOVtOK7cT/3k4neE2ht?=
 =?us-ascii?Q?cUjGbIa3T984vYwwRF6hLX9dL91CHhT3tuKp7WMdqf9YYpNnhC9QMuqpIFgZ?=
 =?us-ascii?Q?3r6qV8KeSBqcs5CWsEGmLRsi1TmDbMGpMBymulVuT5TNHouESr4IRIfZ5h2p?=
 =?us-ascii?Q?bMGNCk2V+QrUQYzSIuonvJ2wjlS+k+5KAdFJHATOSWGdZMIxpu+Wcl7Bi5uz?=
 =?us-ascii?Q?hQGPQ9QbeztfhQM8JyXiyZUG47gUiviuuX9hcr4fJGdXuoTAHVAuLFqFqI7C?=
 =?us-ascii?Q?nOh2bgkHn/tE//6nhkm01e+ss/vLQ6o2fr8QpTiu1fd6+Lkm/SN7VpMviGcF?=
 =?us-ascii?Q?K8t4Ciq1NZtVjOM5l/o/qBvnxlNxNTiz/CcNzZeZilVCYvwFItdkIZWcPZnF?=
 =?us-ascii?Q?UTqeAJR953ciYJZpiYtEnX/LBEPzAWU5qHdrMsyesbHtfz94VZy0QiRPuJwH?=
 =?us-ascii?Q?dGhalsiz71dmusUn+gJTdU037whQw62olh8BzfVkxJITJNH+5o8J3RdUL2TK?=
 =?us-ascii?Q?bYFZboEjKE4qDleQZ4A/gtEzmSOyhLnbiubgooXfjNrAOfR7J6F7l++ugJMA?=
 =?us-ascii?Q?QjvbJWKmkisaKGKzQjJ0qMwLKCgSSllcpCGEVUg+JoYj6ywpCcexnoQ9ccIN?=
 =?us-ascii?Q?FgUFLvyDloXMH4R1EVINphZLX3PE8NXIBTX1AQ0+3eB9gzL9i8KwN0nKeRDu?=
 =?us-ascii?Q?iN3G6HiOgOJl6VTKrq1HBVLbUPhZGhNgEZQcgFErg9WxrEtg18a9vmT5pAYA?=
 =?us-ascii?Q?52aeNOd6SapoKzeZpkPMyKaD1pJgZgXZ1JYJeuvq4o1lgNPudkR4p4oQU3Gb?=
 =?us-ascii?Q?gw+lkPxXdM+u41kzBMje8WUX/HOn9T2rXf17RXlcFRkcVmYlUFS3eESYxdBl?=
 =?us-ascii?Q?waZySLfsHczCrGyDLT+5MYHV9DLUjzcLsymbasJzxyEvkLkv4/j2EljpD2Kj?=
 =?us-ascii?Q?JOPFqTTZJ56O7GM0Stp/8EKm78Jm7kGNT4uiZMiFTM8BFSqkfe7m17qAqI7W?=
 =?us-ascii?Q?D6zrMOg1E3pMKI6zFoV3s7V+tr4t94SALTHpWbaEYRPt8VXv+W172EUjeV+o?=
 =?us-ascii?Q?cqh9wX74u086SHb+42vs4M35u2v5+j2zTMYMVdkgBUFoiZx9/sxyD+42W4YY?=
 =?us-ascii?Q?K5UHBvnjWi0jDh7x9BAm6HPJ+i5AdeLxbRnCmU29TLmjcbmHtphxcw0qPwEd?=
 =?us-ascii?Q?jl02Xkd6kLpbd+k01wBN8+JMq9FNwjzMQhuEtCu8bnPSIofc0ZPYEkc3Eo/l?=
 =?us-ascii?Q?6MZ5hduK5BlPtI6oRSom985rYZ91iyTZxfP2gqVQA6lsHjlJq7EOVxewGXQX?=
 =?us-ascii?Q?uUHaFYO9QfbTWUEiXqaJ4hjTsrnNE2n0wtl4K5fgvfr3qFK4dC/BnnRAqGpM?=
 =?us-ascii?Q?7Vo5TutaX2AH8mwR+L6iI9zGiPuzZJMOWrNpL0S5VQk2NQX4BPiXnILjQY2y?=
 =?us-ascii?Q?gmki0hnZbXtmZX3O0grCZKZ15J0tnPdlnuOvlRz4LDc2y0PxTZkTR2Rvo3BX?=
 =?us-ascii?Q?YiJVQuoT27UTJk5IebvPZur3kJpWUXNChzJ7dHrEP2HdZz/Ru84zpHqDLoWc?=
 =?us-ascii?Q?Rg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adf1d29-9f61-4c00-d98f-08dacd2cc053
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 08:28:51.5166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jpPqh4OGsIyJL7KoVv/4SNe5HFTiGcYw/10vxYfqPLR5uZnjunCHpbTjCRpbzCNMrZhzmwVImxsdbjFzqvTFgHoYp/905nWPqV0g4ZJK0eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9873
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

The below patch in Linux-next 20221123 is causing regression on Renesas {RZ=
/G2M, R-Car Gen-3}
Platforms.

Steps to reproduce:

Use the arm64 defconfig to build the kernel and then boot the board.

Is there any patch to fix the problem? I am happy to test.

Logs:-

[   23.762999] Console: switching to colour frame buffer device 240x67
[   23.763128] ------------[ cut here ]------------
[   23.763133] WARNING: CPU: 3 PID: 278 at drivers/video/fbdev/core/fb_defi=
o.c:340 fb_deferred_io_schedule_flush+0x38/0x40
[   23.763164] Modules linked in: cfg80211(+) rcar_du_drm(+) rcar_mipi_dsi =
rcar_cmm rcar_lvds snd_soc_hdmi_codec vsp1 dw_hdmi_cec dw_hdmi_i2s_audio rc=
ar_fdp1 v4l2_mem2mem videobuf2_vmalloc rcar_dw_hdmi videobuf2_dma_contig dw=
_hdmi videobuf2_memops hci_uart videobuf2_v4l2 cec videobuf2_common crct10d=
if_ce btqca drm_display_helper snd_soc_audio_graph_card drm_dma_helper vide=
odev snd_soc_simple_card_utils btbcm wlcore_sdio mc rcar_fcp display_connec=
tor bluetooth rcar_can drm_kms_helper ecdh_generic renesas_usb3 ecc snd_soc=
_rcar drm rfkill can_dev pwm_rcar usb_dmac renesas_usbhs phy_rcar_gen3_usb3=
 ipv6
[   23.763314] CPU: 3 PID: 278 Comm: systemd-udevd Not tainted 6.1.0-rc6-ne=
xt-20221123-10432-g736b6d81d93c #314
[   23.763323] Hardware name: HopeRun HiHope RZ/G2M with sub board (DT)
[   23.763329] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   23.763337] pc : fb_deferred_io_schedule_flush+0x38/0x40
[   23.763344] lr : drm_fb_helper_sys_imageblit+0xa8/0xc4 [drm_kms_helper]
[   23.763474] sp : ffff80000ac5b3c0
[   23.763478] x29: ffff80000ac5b3c0 x28: 00000000ffffffff x27: 00000000000=
00010
[   23.763489] x26: ffff0005c1356000 x25: ffff0005c3a80800 x24: ffff0005c02=
528cc
[   23.763499] x23: 0000000000000000 x22: 0000000000000180 x21: 00000000000=
00008
[   23.763509] x20: 0000000000000010 x19: ffff0005c0252800 x18: 00000000000=
00001
[   23.763519] x17: 0000000000000004 x16: 0000000000000000 x15: 00000000000=
00000
[   23.763529] x14: 0000000000000020 x13: 0000000000000000 x12: 00000000000=
00020
[   23.763539] x11: 00000000ffffffff x10: 0000000000000001 x9 : 00000000000=
00001
[   23.763549] x8 : ffff0005c1356010 x7 : 0000000000000008 x6 : 00000000000=
00000
[   23.763559] x5 : 0000000000000190 x4 : 0000000000000180 x3 : 00000000000=
00008
[   23.763569] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0005c3a=
80800
[   23.763580] Call trace:
[   23.763585]  fb_deferred_io_schedule_flush+0x38/0x40
[   23.763594]  drm_fbdev_fb_imageblit+0x38/0x70 [drm_kms_helper]
[   23.763671]  soft_cursor+0x15c/0x200
[   23.763680]  bit_cursor+0x3ac/0x500
[   23.763687]  fbcon_cursor+0xec/0x11c
[   23.763694]  hide_cursor+0x3c/0xc0
[   23.763708]  redraw_screen+0x128/0x240
[   23.763717]  do_bind_con_driver.isra.0+0x2c8/0x39c
[   23.763726]  do_take_over_console+0x140/0x200
[   23.763736]  do_fbcon_takeover+0x6c/0xe4
[   23.763742]  fbcon_fb_registered+0x1e4/0x1f0
[   23.763749]  register_framebuffer+0x214/0x310
[   23.763761]  __drm_fb_helper_initial_config_and_unlock+0x33c/0x534 [drm_=
kms_helper]
[   23.763837]  drm_fb_helper_initial_config+0x4c/0x60 [drm_kms_helper]
[   23.763912]  drm_fbdev_client_hotplug+0xc4/0x150 [drm_kms_helper]
[   23.763987]  drm_fbdev_generic_setup+0x90/0x154 [drm_kms_helper]
[   23.764061]  rcar_du_probe+0x154/0x184 [rcar_du_drm]
[   23.764103]  platform_probe+0x68/0xe0
[   23.764115]  really_probe+0xbc/0x2e0
[   23.764122]  __driver_probe_device+0x78/0xe0
[   23.764129]  driver_probe_device+0xd8/0x15c
[   23.764136]  __driver_attach+0x94/0x19c
[   23.764143]  bus_for_each_dev+0x70/0xd0
[   23.764149]  driver_attach+0x24/0x30
[   23.764155]  bus_add_driver+0x154/0x20c
[   23.764161]  driver_register+0x78/0x130
[   23.764168]  __platform_driver_register+0x28/0x34
[   23.764176]  rcar_du_platform_driver_init+0x20/0x1000 [rcar_du_drm]

Cheers,
Biju

> Subject: [PATCH v2 5/6] drm/fb-helper: Schedule deferred-I/O worker after
> writing to framebuffer

> Schedule the deferred-I/O worker instead of the damage worker after
> writing to the fbdev framebuffer. The deferred-I/O worker then performs
> the dirty-fb update. The fbdev emulation will initialize deferred I/O
> for all drivers that require damage updates. It is therefore a valid
> assumption that the deferred-I/O worker is present.

> It would be possible to perform the damage handling directly from within
> the write operation. But doing this could increase the overhead of the
> write or interfere with a concurrently scheduled deferred-I/O worker.
> Instead, scheduling the deferred-I/O worker with its regular delay of
> 50 ms removes load off the write operation and allows the deferred-I/O
> worker to handle multiple write operations that arrived during the delay
> time window.

> v2:
> 	* keep drm_fb_helper_damage() (Daniel)
>	* use fb_deferred_io_schedule_flush() (Daniel)
>	* clarify comments (Daniel)

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
