Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47405B1D615
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 12:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B9910E0AE;
	Thu,  7 Aug 2025 10:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kontron.de header.i=@kontron.de header.b="X9CjfAyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023108.outbound.protection.outlook.com
 [52.101.83.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4EF10E7F0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 07:24:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPS9LEhjii4b8vg3WHCZzS37x742maq5WOyD4qTIu9pxXBauSElG6Fn3q3MsmXe2xwOM22uSxrM8/aWVRKHYL4CEnemA/cBHfEGgVBO2zXw/iEoLLziDsOXD7WRAh/aBmmoZjTvc6vTXgPGGJx1rLm8LePba6H4rs/fbLURk+KatZBp3iZO7gC1X1Szmfa/SMJkstBzFayPDubxcpZuhtPVcr2YgzI9InZavtwxexZHPMNNs/ZNniZ4FuskNnCZS7QihsBMYExURRipFXRZG8HdLQJoTvTPd+IcgTVNhhwQB/ZoNvr8Uw9ZBH4cLPINRpr9AgOCRYAudRkXgoASBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EElRkK2TcVfpETJpgmIgjN+8jgPLhKMJ2B1/i98mls8=;
 b=e7+jDcm0KgZ79u02SVltkeyklETb3aZL+vjoFC1YurO21FO60O3cheOX0XNclxg4ROgYxYnrfFwBD0GOf9bAw2WVN/Rd4yC+/ImNsYg+KbqJm70T/wasiY1DUso15XwlAIvF/TJQp6c266UeIxwhxLgSXKYJvxsHN/9zwRdHgw6nbWyEOlc8xC00A8ESYBu3sH/cNJIWG94Yi5ap4+QLb06Xg1yH/0EQF49a8F09zNYf5GVGxfXvqVQylZzM4Cb3bKsWItSczLwxqPZEj6//eLl96blaRksz0lEp1VPU1NkB+MArNFfwqbKNBtAsQ+uvF9YgMZ1Hj3aMNEHuEKmgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EElRkK2TcVfpETJpgmIgjN+8jgPLhKMJ2B1/i98mls8=;
 b=X9CjfAyE1F2zj+4jrK6rr4n0GXAOjbNIyKikBiMzWQ6VcIA97ZfLyq+f88dRy8nr3Wxn/jDZydfTBAOs0t6GWjGaONj4YpjEDW7zytizEashVukUAcCue9vyWZlQRqDjAxWWCNJjZHbrXGntof7e7YDMN70QYm9jAJuiqyJspH0N0ACJa76/LBvQiB37m6XfEOJeCk+fOgAItkgtzsazaTUPh2jzUn4vF5zubdmqiEA5firko65TX/diXDwa7/5p+M3fS/gT/ApBeMMjsbCqjHL0glKbUOcNnO/QzqG5PFuaDECbnxPjd8BBXQlx50ZJCGjfjXFd2Rnc85EZPTMA5g==
Received: from AM7PR10MB3892.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14c::14)
 by PAVPR10MB7235.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 07:24:46 +0000
Received: from AM7PR10MB3892.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b15:ae1a:e52b:1c39]) by AM7PR10MB3892.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b15:ae1a:e52b:1c39%7]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 07:24:45 +0000
From: "Derouiche, Oualid" <oualid.derouiche@kontron.de>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Schrempf, Frieder" <frieder.schrempf@kontron.de>
Subject: drm/bridge/dw-hdmi: HDMI Hotplug Detection Issue on i.MX8MP
Thread-Topic: drm/bridge/dw-hdmi: HDMI Hotplug Detection Issue on i.MX8MP
Thread-Index: AdwHa9pm2kxQGcu1SGGkDLru1ZfxRA==
Date: Thu, 7 Aug 2025 07:24:45 +0000
Message-ID: <AM7PR10MB3892B5B53D78CAD354EEFE24E22CA@AM7PR10MB3892.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3892:EE_|PAVPR10MB7235:EE_
x-ms-office365-filtering-correlation-id: c3c9a93a-8abe-4375-c306-08ddd5837c12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|42112799006|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?I84azM2RiDElBoz3NBKj8W+RfqmRpJTfIBBRzvLDPN3SDacywi9LshTdWh?=
 =?iso-8859-1?Q?puBaUjELNPkOHULbtfrdjktdrvyt6MWjNMBl1yxu/mA3onJPMQ1ZMy4yMQ?=
 =?iso-8859-1?Q?mEChtJchkBnLen/Ew8Y1Nuynr8lZBlMxnUEfCmzXmi+9Rk3xiYtpkxCAZM?=
 =?iso-8859-1?Q?38j3l29N+4HOq7zAnU3VvwqLbsmc1P/8srgEu+6Ia5paKuQ8FwuRGnkw5s?=
 =?iso-8859-1?Q?Cnz+aGBi7/+hVOGlA2FUiBUPSZM3jTwVgQrViKyy89faybd5LJG3uUudtJ?=
 =?iso-8859-1?Q?1TY2j7CSzXLewheqtazIIJZG28H1fYh29kTXNBmuCEMXXipYYnYGvubyLQ?=
 =?iso-8859-1?Q?XZRTAYI4Xjml5yelqezucO8d9mIzUyrqpLmiMM0DSb4HSGsasN8CQ6oG4B?=
 =?iso-8859-1?Q?YDp2nSHaRAsnDRKUtBHD18IeROtJTnSkI3XT7rSLE3rpqRkm4+lm0uai59?=
 =?iso-8859-1?Q?2VxQWpeSRWGQc4dUpNBiEhMiBzuZ8tDlEc2SRMD2J6Bpq1uoo9MEXOF2z4?=
 =?iso-8859-1?Q?8aE5toLK/jBtE63Ek2vytVWrjrSl4I9yN6/ZhGWihWFC57aFYsSfXv3xwa?=
 =?iso-8859-1?Q?ocKyGtHO9AwFjsFDRGuZ/G7nKdACOzOcfpOsAGnPlOdZs7zlvjC0uYpO+L?=
 =?iso-8859-1?Q?8rTs9rEr2c9pNfJ2V9aQlcPkqDDUnoouoTj1ChYFMNnbbCKT4Dwbx3a6wd?=
 =?iso-8859-1?Q?3Wi3zzdLBHJljSbJ5xQFO1w2CjXlxCrtOixTzH5PSgpJMDTXS5N+FGBsik?=
 =?iso-8859-1?Q?Yhg6e4SuHasLtO9adAnzfDrjKQACO+0FiVKfsjokxBDeDhGQ0cbGZYsDvf?=
 =?iso-8859-1?Q?s7fqhKUvomHEPan6bsURoHTV6jM/IkZ9Cv7D4BD8PzhfX2LbGgD5GycvR4?=
 =?iso-8859-1?Q?ZR1TOV9/iqlb7HRmmeCRZAM1c5Z2q8SMDLz9cECESiLcb6VwjLZBFbvMUm?=
 =?iso-8859-1?Q?xotaOJ1+aTuet70ih/hc9fS3pXA+6e11hnppbBB/yDOr6S8gSF2Kh5J5DF?=
 =?iso-8859-1?Q?zq8BVBexTXmy6RpJtpEeZFNoQXtvyhLy6TQJtB8iUHPekxCEVIgSfOsoXZ?=
 =?iso-8859-1?Q?CmDeEGCzttbnhM1N/OXkXY3rWiy8RxlCTy1BUGHPcIYo1i5F1mKVMA0TRK?=
 =?iso-8859-1?Q?V9thxMRebff1ZYbpOKaLBTInqzMbiEJE6LamgtYUCHcBHIda5CyGPd+3mK?=
 =?iso-8859-1?Q?lIcDR5eAgb1G39dxKLAEnm1HmzcJmRj1um40Wm8IEOtDxVTM5sJh6wmkyO?=
 =?iso-8859-1?Q?BKPjL5hQZeIp4xQfdtATiph2b/x6epwLAuLz1L2VHitWEMF0Wm9+YJ++qt?=
 =?iso-8859-1?Q?kribZD9XytRVH1kjlenVCQUSiQB5qR/t0WUZ1nPNaykLbhw/86DypVNEKc?=
 =?iso-8859-1?Q?FEKnYnhMacu0MDrqbgfJ1YXDgf5QWffKn0/YfnBksGBoPfy+mSTx8Sd4wL?=
 =?iso-8859-1?Q?n5mXfStjavy9sQ3BXtc1Y0NSfnWpFeCkkE71pOkgICWq6qYKQPgrTEZmc0?=
 =?iso-8859-1?Q?5lxLRlzhOZbhGtFaY03Z1evJesZueUNmUTXnBuMz05Q9XHJWkEeBZe7v5q?=
 =?iso-8859-1?Q?kgLUj14=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR10MB3892.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oTpn/uJe+X31lhlzK0HdllvZtdPmknwnKDJBLdVOcqVXqRsdRVWBzetJbj?=
 =?iso-8859-1?Q?Yg5KbLncaFjqsswqRzYVCtLbLSCQICCZ/3W41gRQZIGMpRrv3jZOworzvv?=
 =?iso-8859-1?Q?MBI6T3obX4Rh1SZJoabIAQmFuHKClvgn7M5gkJltMo7IA66+RUO0seXwtW?=
 =?iso-8859-1?Q?hZ5HfLACOD8YAdQrTSpfm3JGO/A57DJzfVf3QW1keVvva3XXeWj5Q8faOs?=
 =?iso-8859-1?Q?fQVF5cYUcF8eduOXKMEjeEQMZCjbkslpNSSCtF3aS8SVGjfNOuSQYKvFJG?=
 =?iso-8859-1?Q?WVyQrWDeQxe1G+wL0vZeUezxlyeXDkSo9v2l0vDJvRRot7pK/MsFaGjp38?=
 =?iso-8859-1?Q?f9k7bJnsW5VJI3kyI2pXlAR69ClIyHYge5efsxajyd+vpgOj1szV1Jmdfv?=
 =?iso-8859-1?Q?oIPX6a9rD/Ia8YwJ/Jvcqvb1+NLCqnMDMIkZ8er5hVxffqynmqV0MOqixk?=
 =?iso-8859-1?Q?Mke6Ol3Ex77dNnH3Nx3oCr+qHt6XgtyOEoHeXjkx6rJJpG2fufazvM+PCK?=
 =?iso-8859-1?Q?hG7mXySm4NA/UMvcYSmAxIkfV00uC8l/zxZujzWuez0dzkBoW+FCCRHJj+?=
 =?iso-8859-1?Q?520T0P0aokxs9FWHTdxyMgMfjtBHqhuFeLSjLTRr4VMe/bGqBSpq9JAn7o?=
 =?iso-8859-1?Q?AcpdPHAm+pskclYhSf8IhJiFDvISgbwGHIxfklIv32CEbYrV1qkefE46Hp?=
 =?iso-8859-1?Q?VdlKXyWkJGBOPWwiy77uHTWADQTbxRBmhVJaM71j3jHUHIOlmZxhwfupCZ?=
 =?iso-8859-1?Q?Kz9CyvB46Ls0lbs6OVoNaXR6e9AkJE4M/zv8QTMIbg2oJWhZZNCUCq6Fzs?=
 =?iso-8859-1?Q?hTt/IYZm8HlL1mwATn5JUOPkgAlP8hM5FNyLudmAt7LocQV/Gz9qPHXr7z?=
 =?iso-8859-1?Q?3qe5fEoPHBuaIhxsH3qzxcaT/wcLNFZE92aM5qKHUZhpY1601qXnKHz5dt?=
 =?iso-8859-1?Q?nvKY8JnDD4U8EdSyG6B/wGY5m4mZGTs1c2rxzi4p7Di8dRFMrCX93FIfcJ?=
 =?iso-8859-1?Q?ZAnCq/bNgMDZTvnrokByQWj2TbHzMTjNooS0eoxzdEoauCyb5KZ2DMSdRp?=
 =?iso-8859-1?Q?hvZpFCP2HAlgfFYegTCRgDtwUx5FjT8kH6NvwVfvJWm51i0QbKMRHG+UE0?=
 =?iso-8859-1?Q?TGEw2JMvTjKQsTcxMJJ5MxvSOlIv1Lbjn23tUzFWs3e6SHs7a6w2lXHhbM?=
 =?iso-8859-1?Q?paZUkjcvHCqLvzTh4kXpHVCMg2iDefuw2cvS4BQcfnstJiQaijMpunwqaE?=
 =?iso-8859-1?Q?RE3BDlHQ2gJSMxUBA6/BRdsm7d05CGA/bU7jSr4CplgUzkH8Dvhe3vXvnZ?=
 =?iso-8859-1?Q?OGLBKu0WHqD71e1MToLDtf28kurPjML55Z9znc1uLz8FLPzsTC04Zulkeq?=
 =?iso-8859-1?Q?MFwwXwB7v3SutYFyhAWMSzALfviG99FlJeA0pH0bhkhztLfQL5Zih1mHM/?=
 =?iso-8859-1?Q?zLzgy+atrdl7zlk8LdOx7J/xFnHP54C5tmHnGsRGfvXDz8HFszkUlo8HrK?=
 =?iso-8859-1?Q?qT2QwqU9K0fGcvOJAPAsQ3q+dy/P48WRhhs0jbRcb7uRulj2kUoS1RHJhP?=
 =?iso-8859-1?Q?rfLs2dQA7XentJTW2O2M38nL4VJ20UTmG46E0vJLf0ctx3hJmgg736GNre?=
 =?iso-8859-1?Q?L1kkXVXGtXLWY3J/2E9XDLPmBbi7hywCIp30qxj3U/N/wgzkVJdHblsQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3892.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c9a93a-8abe-4375-c306-08ddd5837c12
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 07:24:45.5333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mrCT4TdecwIuiowXvNmSJUE//r/NoeaCC58aa58TUQQxUBtuQxSFAXb9S3Y+m//Q8maPi5q8NUg8Q4hLHahjW8tlEO08k/Ln6HDFB8m7ouI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7235
X-Mailman-Approved-At: Thu, 07 Aug 2025 10:53:55 +0000
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


Dear Linux DRM Maintainers,

I hope this message finds you well.

I'm currently troubleshooting an HDMI hot-plug detection issue and would gr=
eatly appreciate any insights or suggestions you might have. Below is a bri=
ef description of the problem:

Platform: i.MX8MP=20
Driver: fsl,imx8mp-hdmi

We're experiencing a bad behavior with certain monitors (specifically Terra=
 monitors). On initial boot, when the HDMI cable is already connected, the =
correct resolution is applied. However, if the cable is unplugged and then =
reconnected, the resolution is incorrect, and EDID is not being read. (plea=
se see attached Log). After several reconnection attempts, the correct reso=
lution is eventually applied.

Log1 - With Failure

imx8mp-dw-hdmi 32fd8000.hdmi: EVENT=3Dplugin
[ 2602.231703] imx8mp-dw-hdmi 32fd8000.hdmi: read_hpd result: 1
[ 2602.231714] imx-lcdif 32fc6000.display-controller: [drm:check_connector_=
changed] [CONNECTOR:35:HDMI-A-1] status updated from disconnected to connec=
ted
[ 2602.231735] imx-lcdif 32fc6000.display-controller: [drm:check_connector_=
changed] [CONNECTOR:35:HDMI-A-1] Changed epoch counter 37 =3D> 38
[ 2602.231751] [drm:drm_mode_object_get] OBJ ID: 35 (2)
[ 2602.231765] imx-lcdif 32fc6000.display-controller: [drm:drm_sysfs_connec=
tor_hotplug_event] [CONNECTOR:35:HDMI-A-1] generating connector hotplug eve=
nt
[ 2602.231815] imx-lcdif 32fc6000.display-controller: [drm:drm_fb_helper_ho=
tplug_event.part.0]=20
[ 2602.231827] [drm:drm_client_modeset_probe]=20
[ 2602.231836] [drm:drm_mode_object_get] OBJ ID: 35 (3)
[ 2602.231848] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:35:=
HDMI-A-1]
[ 2602.231942] i2c i2c-1: <i2c_imx_xfer_common> transfer message: 0
[ 2602.231951] i2c i2c-1: <i2c_imx_write> write slave address: addr=3D0xa0
[ 2602.231996] i2c i2c-1: <i2c_imx_trx_complete> TRX complete
[ 2602.232004] i2c i2c-1: <i2c_imx_acked> No ACK
[ 2602.232015] i2c i2c-1: <i2c_imx_xfer_common> exit with: error: -6
[ 2602.232025] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent adapt=
er 30a30000.i2c
[ 2602.232037] imx8mp-dw-hdmi 32fd8000.hdmi: failed to get edid
[ 2602.232043] drm_add_override_edid_modes
[ 2602.232057] drm_add_modes_noedid

Log2 - work correctly

[=A0 209.462094] imx8mp-dw-hdmi 32fd8000.hdmi: EVENT=3Dplugin
[=A0 209.464913] imx8mp-dw-hdmi 32fd8000.hdmi: read_hpd result: 1
[=A0 209.464927] imx-lcdif 32fc6000.display-controller: [drm:check_connecto=
r_changed] [CONNECTOR:35:HDMI-A-1] status updated from disconnected to conn=
ected
[=A0 209.472468] imx-lcdif 32fc6000.display-controller: [drm:check_connecto=
r_changed] [CONNECTOR:35:HDMI-A-1] Changed epoch counter 15 =3D> 16
[=A0 209.472484] [drm:drm_mode_object_get] OBJ ID: 35 (2)
[=A0 209.472516] imx-lcdif 32fc6000.display-controller: [drm:drm_sysfs_conn=
ector_hotplug_event] [CONNECTOR:35:HDMI-A-1] generating connector hotplug e=
vent
[=A0 209.472577] imx-lcdif 32fc6000.display-controller: [drm:drm_fb_helper_=
hotplug_event.part.0]=20
[=A0 209.472588] [drm:drm_client_modeset_probe]=20
[=A0 209.472597] [drm:drm_mode_object_get] OBJ ID: 35 (3)
[=A0 209.472608] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:3=
5:HDMI-A-1]
[=A0 209.472711] i2c i2c-1: <i2c_imx_xfer_common> transfer message: 0
[=A0 209.482814] i2c i2c-1: <i2c_imx_write> write slave address: addr=3D0xa=
0
[=A0 209.482881] i2c i2c-1: <i2c_imx_trx_complete> TRX complete
[=A0 209.482890] i2c i2c-1: <i2c_imx_acked> ACK received
[=A0 209.482896] i2c i2c-1: <i2c_imx_write> write data
[=A0 209.482902] i2c i2c-1: <i2c_imx_write> write byte: B0=3D0x0
[=A0 209.482946] i2c i2c-1: <i2c_imx_trx_complete> TRX complete
[=A0 209.482953] i2c i2c-1: <i2c_imx_acked> ACK received
[=A0 209.482959] i2c i2c-1: <i2c_imx_xfer_common> repeated start


It seems to be a timing-related problem between the EDID read via ddc and H=
PD signal handling, a workaround by adding a 100 ms delay to the dw_hdmi_ph=
y_read_hpd() function resolves the issue (please see attached).

Patch1

--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1686,8 +1686,13 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi=
, void *data)
enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 void *data)
{
-=A0=A0=A0=A0=A0=A0 return hdmi_readb(hdmi, HDMI_PHY_STAT0) & HDMI_PHY_HPD =
?
+=A0=A0=A0=A0=A0=A0 enum drm_connector_status stat =3D hdmi_readb(hdmi, HDM=
I_PHY_STAT0) & HDMI_PHY_HPD ?
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 connector_status_connected : =
connector_status_disconnected;
+
+=A0=A0=A0=A0=A0=A0 if (stat =3D=3D connector_status_connected)
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 msleep(100);
+
+=A0=A0=A0=A0=A0=A0 return stat;
}
EXPORT_SYMBOL_GPL(dw_hdmi_phy_read_hpd);

it work also with the following :=20

Patch2

--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -587,6 +587,10 @@ int drm_helper_probe_single_connector_modes(struct drm=
_connector *connector,
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 drm_mode_prune_invalid(dev, &connector->modes, false);
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 goto exit;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*need some delay before reading the =
EDID somehow the I2C sink slave controller in same monitor are late */
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_current_state(TASK_INTERRUPTIBLE)=
;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 schedule_timeout(msecs_to_jiffies(10)=
);

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 count =3D drm_helper_probe_ge=
t_modes(connector);

--=20

I've also tried applying different patches from the following series (https=
://patchwork.kernel.org/project/dri-devel/cover/20240908132823.3308029-1-jo=
nas@kwiboo.se/), but unfortunately it did not resolve the issue.

I'd appreciate any hint or any guidance on what a proper, upstream-compatib=
le solution might look like , I don't think this workaround will be a prope=
r one.
Thank you in advance for your time and support. I look forward to your feed=
back.

Best Regards
Oualid

