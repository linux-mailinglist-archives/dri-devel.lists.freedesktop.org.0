Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TEg9J1KIj2nURQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 21:23:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B1139612
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 21:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DE410E298;
	Fri, 13 Feb 2026 20:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="W9nDAbet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazolkn19012083.outbound.protection.outlook.com
 [52.103.20.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BDC10E298
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 20:23:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIv6JKhhsWEw8ujne3L1mdjxjKx82oORJOHL9g5ya0G/98LKrV1EcoteD6J4w4r/MOLg16JC9abx2HIHnuqEjoSYE7utJoXvxpVRxznG7f5g7hb8XX10rUYNsdOTGiZ/zWpAGYFdOf8G+jlvdaqvYY00dNWafW3xalR2yd/G7IC2ADFzFODlZk18nTd1X+nWPGltU1Zi+79T/ZKQEArPy7RHWTwUHRIrug6amNaCBsbcoihfylW7ITPmfiynkF1z6GNtqIvg38ab9CgGzRY3G0QjB2AMpvqOWjZlDr9vQQ5w9A1+djBMwvKwQepUMBSCCCwRxqnAHmtb1RmfXgRHLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkd7nTh8v6b3Ke0LJs/ggyAhRF5oKVaLF3gl+AiP/HY=;
 b=hVJK5EyqyPgK5LjbvxJdJU7gyekCb19QHVm8quuvnwH0ZONbGbya5pMmmvpSk7dTTxUH6rGTFhm9Hc6OpNhfcZUrbwxaC7gLvdfb3ZrDX5w/1Ltbc6VfQ43qEscRbVEt6kEIaK5dY15YnOkhM8KWH2BsZavWZbWZiuWLD9ZiKvs7/mGrUAEpZu4v9lOM/6cARkZlc9Sz/qrLqdgiRo9+KSo8CRjOLwlMFfb6MNp10UiOWToU5IXDaWVc9IavzoNyB/db+eI10arxMKDdS5QwRtZcbnwMj/IDMQiBGYcl4/r/dkOE8eDxfpUyY0+bEFa5uJOI0WxmIaUTC5wKMpt0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkd7nTh8v6b3Ke0LJs/ggyAhRF5oKVaLF3gl+AiP/HY=;
 b=W9nDAbetY092jzTz0BtlX81sgJ79Mrikb7RxJSZ1c1UCz5uLM/CxbVdb6qMGZk/xI6hB7ANGdcfwKeDe+4k8r3KVPrs8uSD0t2/ic+kaeFEo4NQTRNo9RLX0SL27uy3lFEYWATHyEbdxo4zw8BktEN5pdRlMr2i7AfBKBqj+iy1tzcBCqPTRbMhcesgfK9OYbX/pbgpbjIYpBk4xcqY/rwkGLhecjsVY6MMSxUdM5znfjLvTfvMBs5A7nqiyONmMLH94jl8NihHxAnP15EUx7yKL1xDcWk4sUlU+vPlzDz7ISOKGfvUlVXOgaUYj6MSpluAyfSrhYUxlGInzqz9hEw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH2PR02MB6936.namprd02.prod.outlook.com (2603:10b6:610:5e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 20:23:37 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 20:23:37 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/panic: depends on PRINTK
Thread-Topic: [PATCH] drm/panic: depends on PRINTK
Thread-Index: AQHcnAdM+3ClrjNE2UqxRiw8+HiGArWBFLCg
Date: Fri, 13 Feb 2026 20:23:37 +0000
Message-ID: <SN6PR02MB4157FEE172013AA2A03A5809D461A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260212100615.989957-1-jfalempe@redhat.com>
In-Reply-To: <20260212100615.989957-1-jfalempe@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH2PR02MB6936:EE_
x-ms-office365-filtering-correlation-id: 27ad19c0-b7de-4226-5fd3-08de6b3dc4f1
x-ms-exchange-slblob-mailprops: igNrEvV8uhEvpyeJ/Jdph30uiRXy5wZPkBeAQUz7UqQqS0B8rDq43xFUHEt6iWYFSeAzBoAYMBFjERF06HtOLGCCglaj24t2Ol4TbP+nuSw4u2ogYAgexp48KIaXVlMlnBTdsbBg1gnE/fGlHsKDWqKMBkhUYEGO6vGxmcPobG4rxPUbGyCW/NlIn9Kd70smWxaeH8BWiOVUe09X/vRrQzHycDbPY9oJuRbUvz8+cx+6saUuBUFEPJkl5MxhrgIjwwtB0twzZo5rqrPEfXcdt0+jvIKAz/W6gIavyavO821D7IgKRoGjjtjkSM5VhiYIoeD/grytoVbp4Ip0lVpgLNn/UbvU24W+2hC5Y5msXIGIi58o1uYLP+V6cr2T7Rbar3h87pbG3mo5o+L/AAvrWZeseaGuX98WDRvusIaLOOWJoBWEdJIw9BZ5qoiQsBW6pyAtLVl1NpriSAXHmr4gICujqGMsE8grC7lG4yVF3WQFAhTQbQluZKYmW7rtVi18EdZnDIjJrGoE25Rdt034x4m2jcmnIOz60WkWashX7AFkGxc5eYNb2w7j079Caabwq8CZy3uJVm+CHxNEToO4GtkxB6LSEjPdOFcL8X3CC/m/L+t/GetF4xDMbK/dnYPK7Te9QHRLFi5K5Dyhu73Ghc2ek1w4o29k3MDPgvnq93UZEVfz6jNIw61CrL5gikq3AIocMQzCyVo=
x-microsoft-antispam: BCL:0;
 ARA:14566002|51005399006|31061999003|13091999003|19110799012|15080799012|8062599012|8060799015|461199028|40105399003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?PmAidZn5kJhqA7THBTys7Mz2j9kVSpbpGei88pHmx7UO9+d8YXlqTBZlGg1w?=
 =?us-ascii?Q?Qu/Y2ml4cVR8y1hwSBiyhsi0olScThjq4PXk2xlLf+xqKePW7uvqZkg5w/LX?=
 =?us-ascii?Q?uX60Ck2YPC03jvdx/JYZPRGQ58yOPId0+u8A7sZpv9cD4mEFb27156/PU9Gn?=
 =?us-ascii?Q?9Vx3rXSu7uzzaphz6IwiBG4EUac2+eFYtVWiPy9bazyi0iYfbeaxxcqLuNWA?=
 =?us-ascii?Q?jaOBBnpHDytOEnzyDZJD7kyjfD7yZjQ57fgIazBveGC4V/6Kdt7kse7iaCi7?=
 =?us-ascii?Q?Pn+E7MjgmOCIWF75Pjx4FYARmfBL8McOfNEuOfvpx0FwQPrJK+HzD9xicGeV?=
 =?us-ascii?Q?nxx5HL/ecSSY7PIl1/JEI4DEQgcVFJF/SPJESmiTPTYgftV31oO9YdAt0f6B?=
 =?us-ascii?Q?C+u4KpVfhDeOgEXtVWEGw5M5IGfth9R+1mOaM/1aTJ+3aIohWCwIye58EWZ4?=
 =?us-ascii?Q?4RjQLijhdESUbcF5YDvmw0JlLmr4/Yh9laU9Sy4KR3cM2hZfVf0JpSP1GutK?=
 =?us-ascii?Q?tvbcSmxW7LDTVbFr8scl/5whTNd4nGWTWQ0epYzbXFTSwPTtHOpKfY0YNZ4p?=
 =?us-ascii?Q?gICef5uyK/5FRyjhVimB80JZD9PT8/F1Msw+2U+TLmP3HGvpIlw73LC3XOEG?=
 =?us-ascii?Q?T4NCtKIVyuCRleptw72seTLSqlWxMQ8lY485dbgGE+KJ34b5w/yV99fu67i5?=
 =?us-ascii?Q?jQLiH58qjCvucE9igDvUItOXMc4h2Rd3ItqYvoc2e7OASI0Mq1ZSqSyoGyjY?=
 =?us-ascii?Q?yHrjaAobIpdLQ8ysljAcCf/Sla8f2wLepg8m3pieav43ETne3fEzWZfiDT8h?=
 =?us-ascii?Q?wzTXCkxERGlyCZebOgdaQK7ZkISULJ61p3GGgjR+EA/Y2olxanC+XDWcozWC?=
 =?us-ascii?Q?eQZ9FCoTFTps+h0MY5ZwyX2ggHO8utfGDvuGtzZOLqNwrsEPeMdi/Al0AP6I?=
 =?us-ascii?Q?wTZkakDvCILKwwyKRfFMnawsygZoWdZVZTFDVrBUCABJTOSEBiqBPiXAMqAd?=
 =?us-ascii?Q?TWPDBvL1ttRe23ZY07v1ffX5eKvO1gTWMQACzsX56WiML/vNL64ps9hGPtzN?=
 =?us-ascii?Q?/gS1zzUOo/tRn6ObvGGienHAt4pH59HOfbcglnfB3Z5uGT5fSQQKOB7aoUIg?=
 =?us-ascii?Q?X82Lr0kr9QY7fLaR/veuv05ERTsM+A44MWGIjNm6PQT6TottBfq31xb/DvK6?=
 =?us-ascii?Q?wAda0s8wngeukguMBt0MboC7mVfMKPaoXkHpjQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OvB7mFhyvtemIF3AynFV8VtRkrOxIf6Dxs4u/Z0hHkHklanWtHSgzezKQZic?=
 =?us-ascii?Q?xsGMUd0p5qiic2cJfocP00z/dM7GIgqX2fMUFQ6H9r+/9In6ZejEP8wJPs3a?=
 =?us-ascii?Q?ohILenOal1ICylsSrQvwdjiSZEjuzcglCzX65Svz00Msdix/3EUnagIoSpmA?=
 =?us-ascii?Q?v26SplE/0IKK49BojfdeN6rhp9KUau8i2zlVx3qIBL8S5Z0oIMiKUfkMl40F?=
 =?us-ascii?Q?Wj6oFAonFQpQSAfM9qhAxmWiIKEWjrOzXulMA5qHphq7jNFCfobIEiWs8n1x?=
 =?us-ascii?Q?RIcaN4NWGs/WXas4hRQ3sWunBaG5jv2Vuvv2jLKPUlKoqEfI9Rnel8ACvZnF?=
 =?us-ascii?Q?+8HPkEExMqSv0ZgEMwXauUIErYx1zf4w2fsbWeyetIJ/TH5F6RFco8SMsWvG?=
 =?us-ascii?Q?1qQvcTlCTzBbbNNEKXkgzCBP9dJ+9af3RZDokTC9Hxas5CZtzNKUeF7vr40i?=
 =?us-ascii?Q?Wqy8RjXY8+Mhj24uOqbABcjreddOCH++Z5fHghylNsFkEPsv64BCgiQe/ijJ?=
 =?us-ascii?Q?uVYlePHOOZgGnPEFXLqSh/ByW2P+o9r3ILpAS9mbMkKUImhWOXdbTNuPMFyr?=
 =?us-ascii?Q?4T5cFxHwyKgw97kEUIdWG6dqgULkgqHaC2Dgy2P7H/zXWDMi2gym0rIB51jW?=
 =?us-ascii?Q?gSgAmEarP7o+I/CAfBClL/uvmV5zDbE3zLJFPOqdJnrxb9OmfXYM2CBjqGZv?=
 =?us-ascii?Q?R0ftbhhdgAGehtkFyCyIcMGiSGYlheFYkRf/bql2UsfHEdJadLNNSftCj5T3?=
 =?us-ascii?Q?beaQBlNp8EUbJoHdadrdCnQ4swKES/GDjONOAHqjRCDKyGYVFQa6ekgNAEGE?=
 =?us-ascii?Q?1hAaD59S2fQf5DZpiO+CkezVH8NSgEjcjIBWCKupeb2xgZZu9x3yoHtWEu/l?=
 =?us-ascii?Q?Hv6ksbaG7Lqi9uXF4VzmhM44NIgp0aqXrXPg3kb3J42rXCK6usUzuGfGtwP9?=
 =?us-ascii?Q?jOjEGOouJtSFswwC+/301PlQsuUkXScTa1tWwKQRj3P5Nam3QqMHlam5JeQS?=
 =?us-ascii?Q?MiCvKYNaZViRQF4bz2IlqbeBJLUQXzorvSuQC1HnPzfP98mY/dLM8mXd91HU?=
 =?us-ascii?Q?NN8bH4C9HhwAEtoNRiLJ2Ul7Wxc1tI1PYZ3jVXFR9jFTZaO/zfhJkavg/EgL?=
 =?us-ascii?Q?XB+gn1KnvFK2pnq/EXVvlqGYGbaTWFjG+dMjdifGmaSSaFu2nOFjJRJyfj+I?=
 =?us-ascii?Q?jtVf/T9QN2y6v5sPwueSTqYal26XZwyuEBo5BPIZ4wjANn/KMkjI12tc2z76?=
 =?us-ascii?Q?Qbhvlqc/ZGLbUnwpz84zIjqxh2WFnylaKSgcLN6sXz9wVhdgHrGEfVthpNzV?=
 =?us-ascii?Q?z+w9FL2FJ/ciNN01XwL7RRtuhfsCgN8N3754NwOiYHjhpKK+bCvZfuAZvBlo?=
 =?us-ascii?Q?81oCQLg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ad19c0-b7de-4226-5fd3-08de6b3dc4f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 20:23:37.4434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6936
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jfalempe@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[mhklinux@outlook.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhklinux@outlook.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,outlook.com:email,outlook.com:dkim,SN6PR02MB4157.namprd02.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 568B1139612
X-Rspamd-Action: no action

From: Jocelyn Falempe <jfalempe@redhat.com> Sent: Thursday, February 12, 20=
26 2:06 AM
>=20
> drm_panic uses kmsg_dump_register() to register its panic handler, so
> it won't work if CONFIG_PRINTK is not enabled.
> Let's not pretend it could work without PRINTK, and depends
> explicitely on it.

s/explicitely/explicitly/

>=20
> Suggested-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 758f2eb3d588..0d0657dd1b41 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -55,7 +55,7 @@ config DRM_DRAW
>=20
>  config DRM_PANIC
>  	bool "Display a user-friendly message when a kernel panic occurs"
> -	depends on DRM
> +	depends on DRM && PRINTK
>  	select FONT_SUPPORT
>  	select DRM_DRAW
>  	help
>=20
> base-commit: df4dc947c46bb9f80038f52c6e38cb2d40c10e50
> --
> 2.52.0

Reviewed-by: Michael Kelley <mhklinux@outlook.com>

