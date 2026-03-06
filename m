Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP9YAgDQqmnVXQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:00:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D7221391
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B48210E244;
	Fri,  6 Mar 2026 13:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="n1He0NyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD36F10E244
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PijfBQuSCU1Ef9um2FHKmn03A4LNcDE6+jIE2iEyzTyAnhfim1ZLw3Vckfuhsrv+LBFyZ4s6TGtbcszlrGXMtSYM61zWG4ObkPp5kxyfRFm7SjGch6/SwO91Glzky5jaPJjPKWlUoAdmKhKxO18ea6P/F6+KuNCp+YIhaLV38OKgtOttrzVqVEwkjvzh9FvBvk/AaGsOX5itC2vebxFyOKzZ3qDHDBVymeHSl6H/hCpi4FsO+WJTKq4g1irt9UMQ9X+Dtvl6SGZeih0Lo/6s4klUB/wwBUFgkGE6CZwLmPANQghG6k73/VXKsUS2bw7GUczkYOBCG5vMKq97mqaLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EG/ZUwnVjZ1AmFMHPZOCEHkfhLQzjzDNo3VNS/oAUKA=;
 b=OUZTNSi+Chx0f2oVFipiTllTdv8sTR+BAWBAwEgFMffI1t7E0sjUTSI8/7EzEIEwvSFOwZyrNGlLu5YhQ1z2SDDi7fRM8Y5aszGZ3sfnvmonDsnR6HfaX/QgRHM2Gv3MM+iSTmtn9Ql0dMHEiy1MaQ7xZiL5q6MXhVw99uler9WXMry0wQEJAWrSji1eGUVADFjFjVaUORrw6ulyXh3CD6aOIYG0Pe1XCURONbcNQSXkf7hmt5Uz4FWHPLdWECZGOdyRlkc+l8rC9r2maSe6AFwaAd/hGJhelUtNGtlHH2V8Yck1OUgwEvaiSqqnbcX34x2plv+itEWpLizHjKD2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EG/ZUwnVjZ1AmFMHPZOCEHkfhLQzjzDNo3VNS/oAUKA=;
 b=n1He0NyYmYdE3Jn+G0cDp/Cth3bvTm4/fXbOIwI/jC/BtPvZ6HS3lmWdHwL2tibgU31QbXt0ttWyKs3UrUUH3XUJAWncO+TSL1Kq1ZY/IQPdDQy1ZPUtiTHiG2Z+e2E69hD3gso9rLTYW09psc2tncVKM7F/e3mxnCRNCQaJhlo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10104.jpnprd01.prod.outlook.com (2603:1096:604:1e5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 13:00:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 13:00:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to FIELD_MODIFY()
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to FIELD_MODIFY()
Thread-Index: AQHcrIizZEg6kWXm70WOPq6jFSwKM7WheOMw
Date: Fri, 6 Mar 2026 13:00:31 +0000
Message-ID: <TY3PR01MB11346954FB0F91C78E5473ACD867AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <da7709d50894d422442401e6e3ff4c4715a33fa5.1772705564.git.geert+renesas@glider.be>
In-Reply-To: <da7709d50894d422442401e6e3ff4c4715a33fa5.1772705564.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10104:EE_
x-ms-office365-filtering-correlation-id: 978bbd8d-04b9-438b-f266-08de7b80596b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: B9LqSitsS2rHzn5b0DR397bdlcspXy/TcxhV67PKghPUyHTb9R+6iNy2Z0MW3a8evDq92iqy6iZwKGaIbwHOr/FYgqYsKYV+Ic/qPhjk77h/D15RP8I9GPTyoPxL7Ir0Xmu3LPMltew3aXC/k4JSxx3sG4ViaeWzGP05lL0Y2ZnMREQRxezGPouVaQDMSKCG86FKA1WKcjaf6b/oFZ0rJJo7w8ZfVd7DcBXKSktEte/qBcW+NQPENKlpWuaQS2WlupwG6R3LpFZrEtSjkRSFWUxjpdk7vD6hQ8NDASch33NHSzPoU0A3Ld5vE6yUqtlKoV29fWFBCBxuaY0fmYv6RaH7fwZNB+fqpaj4e5Rr395NU9A1ljVKeEglgvngjBcrrAWAMnBTS5HBSGbliQtq0orlqWZeClyeJYD3q1MigZbI3vjNkGDv+348RymknsPy1IHKgtCmaw5n1Ah7PPMtuOpYLte1Sa+ytcQhqBWPA+2wpm9vEKZ7IZsPSmEErdYbSH9MH99MPJbguT+iBXuxT3XNjaXW7Q2e7ERimZV1Mm5I4RKQX30/xzJw4nGCjDp+EwtP+P2ozwI4dIMkRzP/3/j7nYE54B/rkEemZ3E3YttZthVX5gCzlVQsQI7YrNVIrk4cx2hQX1F+YCgT5KFbBECA4tEmOAAOCueiGaOJw83ohsyVZN1BoSBTK8UVdp5yTae0jCx+4TyY//TPPiqJQWy19VeV6Llh+W2pG2LxTntH9vWDog6kywn308wjLAKwT9e80YjCwtNIUfg6LTcdLL1p9++ClzQ/GwVhQ1c7JtQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4hHNogKhsqauu/umIq4uSRxZNCIBRnD7a9NW9TdWzcVR+q8d0KDjau1eyAab?=
 =?us-ascii?Q?wZwxqpniFkuMxvltUSgGFZp5CmzbNvoE3I1/2wwjJzCKdUX+a+drYAdXr+Cw?=
 =?us-ascii?Q?YOxls909N7srBGeeHL2c8F0ueI7q+na//bh0TQlDyN836u7TZwkxNSU342mJ?=
 =?us-ascii?Q?gIBpwvX1InQMzPAicqwDAMp+66aQpix9uTvXyaGBQCqesqOUcbW9E+3sqjad?=
 =?us-ascii?Q?GHSfxj6A2laZhVhXeROVMlqHzRpe6H4OTDXcV/mxT9l+26e/HswVC5nXXy1v?=
 =?us-ascii?Q?FNmx37mLzX9q2ofkGHEMh22c4/6Q23hYUgFpp+f0GkSUPAzLC87c7eHzhbol?=
 =?us-ascii?Q?mQQpCpyE9k0jCUQndIIPqCX5eHT/YP0j3QbFMhCBKN0X9jX8qmSCr+QENZeT?=
 =?us-ascii?Q?0a8eeOnl1FOiwdM+krz9SlnpM75sAjy1E54tiwF4Buir359Jb9OK3XUoQiYh?=
 =?us-ascii?Q?RHW0K172h3iZYnPt5HRic7pIBRNmYmF9zE13t5dRGrLMFf0gg6ESd9bEiotI?=
 =?us-ascii?Q?Pj/SmmjnHdODBXxzyv2kbdA6BbwcANpvlfxcgCt3aLMNomi0Jn2dmvNpzbxc?=
 =?us-ascii?Q?wtoSfmRMZZda7GZZb3ugqaxN7DxaPmdRzVLnVdbXuNNWD+HGPb/z47T55vCo?=
 =?us-ascii?Q?fS3QmcRPWub+s25c//NC+mZ8p04NdkLinhmmcIvmDFFyI+LqxYV9481ZUNhn?=
 =?us-ascii?Q?qkFRRFrA30KsR7fwQ3nn2DKE92PSycheNJdwxDPunD3fFR5elnV03bTnZvjA?=
 =?us-ascii?Q?GeN975I9UQiqJcvhNpe7s4+nW6+9u88plE7nCi0ErG0+4dJYU/VdalC9ron5?=
 =?us-ascii?Q?LcZbcTVECmxJK/4w8AL6XMilC5SRycTUqCOJk7aRABnCjB/vc4fUyufDUdX7?=
 =?us-ascii?Q?aYJnFUOHvplBAgegDTQp2EcvrYt6qKa/nyoOyMEQMK4bodlPxdk38ykQDUIv?=
 =?us-ascii?Q?b50hY2mtYknA9KHaiqBzojB+K0wOSZyzJi7jf1SUST6Z1oUunoqla7exAVn3?=
 =?us-ascii?Q?E1ZmqvCSRZhyuM5vbNWU5NHRy8dT/NhQfUPhilnQaOimeYPz29TeK6ajZ8ym?=
 =?us-ascii?Q?n4ua5hnJRfkik2I37PtfBmCuwMYBptGNOrJuwHbpHRlL7mY7dSc0dy/KifGw?=
 =?us-ascii?Q?DOSLjh0Y5vkO2mOeyEGbBg9LMWLSmyaloO2F7pSrTt2/8sUh8YqRb4Oi+N1B?=
 =?us-ascii?Q?BOBHp31BLdGZeFoMH4iiuOr+XwgFHCreYv8GHmw9jpkJsWZD7Vmqo/kCQT/8?=
 =?us-ascii?Q?QbU3Gho/E4gR6iq8twYfMAqzry4goSlvgsVXNJzobS17PklKeUhX2iP06Qfc?=
 =?us-ascii?Q?RVmHh8jKP/tXqn4UHtWcJ411k6ypSaCC+SJXsr6ThiqzeLCPgd6K1grGbKYf?=
 =?us-ascii?Q?x4f8Bso4g94cdIBH+TtM94vYMOs+j6uGQS6nyNnmokPCp0pZftjQOUaW/MBy?=
 =?us-ascii?Q?v2EVMCKomyJ2Eha3Gin9mVxCjJ4m7YU0kVY5jXdZdDSI6FxYcCkTb8o4teG7?=
 =?us-ascii?Q?OnBdwxn0fA70S4VrAMOuRjeTW2dkrXn7DA9cSjy5SitzCEd/GdCcRgRJUnhR?=
 =?us-ascii?Q?3gElEo8Id46Hb3P+FC662opT72x7XW8RQWLnBRV/7QxRcT5MaWeUGePS6im6?=
 =?us-ascii?Q?3URR9/MAtP51CVxElZyCvBjIN8/FkN7I4P5ab1mteE7zikNBY1C0dyA35vp3?=
 =?us-ascii?Q?SPC6h6WDHnWA5UIlvxKGYY8+JcrAF9WYaAeP8sJ+tSeP8Rea6YhWZrRrCNYT?=
 =?us-ascii?Q?3qaEtZHbMQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978bbd8d-04b9-438b-f266-08de7b80596b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 13:00:31.8857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b1A17KKYeQeNz8Tp18ss0PEt/CoHtjWzaOchB1Zols84w0I4T7IN4TI1B1BZcy7IJRIDwyP9/XpsESAsEVskK95ovP8FXOXbZPOB2ZeSW9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10104
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
X-Rspamd-Queue-Id: 221D7221391
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[glider.be,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:query timed out];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Action: no action

Hi Geert,

Thanks for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 05 March 2026 10:13
> Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to FIELD_MODIFY()
>=20
> Use the FIELD_MODIFY() helper instead of open-coding the same operation.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> No changes in generated code.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 29f2b7d24fe59717..a87a301326c7aa43 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -808,8 +808,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  	 * commands payload not being saved to memory.
>  	 */
>  	dsisetr =3D rzg2l_mipi_dsi_link_read(dsi, DSISETR);
> -	dsisetr &=3D ~DSISETR_MRPSZ;
> -	dsisetr |=3D FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
> +	FIELD_MODIFY(DSISETR_MRPSZ, &dsisetr, RZG2L_DCS_BUF_SIZE);
>  	rzg2l_mipi_dsi_link_write(dsi, DSISETR, dsisetr);
>=20
>  	return 0;
> --
> 2.43.0

