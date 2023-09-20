Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3117A7786
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 11:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420EF10E473;
	Wed, 20 Sep 2023 09:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaf::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663B510E473
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 09:30:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiDrCBMmvGRBXu2dvYHZ7uUu9aqZnNA92m+y8WK3otNXdnatc8ll66zROMaX8MVw+DdzzglfeczpiiMwWdr4E7FfNE9ivdGSJQf1cCi6+vlmiYggZCHX/f2OAO8yKnk7+itgsAxjERaEoJcsnS4TxPhPjPrHihUXxOmaxMl6BQ9hczA5BgH6AzDmc3IlqsTI04YcSfKJpSJPD8KQpasVBWAk7I47x0/CY9CWwm3XuNe6T24FZkWPbTF0ZsK/4QJMD5r5TO7MZKFqkypNpeq9z7YvVsA6an/quQFs8tIe2iPS7Bc9Ag0S+1FpbVFQ68Vbc/IBOg5rowp9SaCBga1hHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETxwG1C92BPfOZv7FEnEaHasZMmFKdYI8XFzRuLJVyU=;
 b=Oz0wnHADUpq7xbp5olxOq/XiHGk/tVQ4IxLNhWOh9quiLMrAkVPikp1VN+rlpRJDU6FXZ/yXzZo4E5ycIRJrQON07STAGcGiaBJqubX3t3ryC0zNZ5CisSFAP1Eyq8vv8tkHoifd+8g7YwPB6IfVLul8u7ojA31v40sB8SJQnGstgqcGUlEEk9uRwLNzH0prkFhCh0j661/tQTpEwxgEo2wA7885LdDIiVOvc0NUXFnYSSqllCQavuGKUa9N9wr8ROK4qg3aIYdO0LUu0SG53KUlcuSwr3BJhp+KP03huIVLXdqj+U2Rh2E+4I4gb8M+Tf59r01g2E1lZaflgAB8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETxwG1C92BPfOZv7FEnEaHasZMmFKdYI8XFzRuLJVyU=;
 b=JDXqUAkzn61GMnT13adyurF0hefwU7dmmtTATQK98QjrkQqZk9XBbVrX4sTccOg6hbiSsONAD8l21qhwDgZmFTciTjTaoN5boGIm14E72wojZw0vWnN3Vm2FuDR+OaUmLGhFzeQ3bxK1DLsAsbzv25YK0tY4iiM48Ts2F6f/FnI=
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by DB9PR04MB8447.eurprd04.prod.outlook.com (2603:10a6:10:2be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 09:30:02 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::6f5f:4224:1dc1:731a]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::6f5f:4224:1dc1:731a%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 09:30:02 +0000
From: Ying Liu <victor.liu@nxp.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>
Subject: RE: [PATCH v2] drm/bridge: panel: Fix device link for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Thread-Topic: [PATCH v2] drm/bridge: panel: Fix device link for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Thread-Index: AQHZ65xVPwJWT9OuK0+bOARGRXgXgrAjchKA
Date: Wed, 20 Sep 2023 09:30:02 +0000
Message-ID: <DB8PR04MB70513CD4C2C41B1E6865A5DC98F9A@DB8PR04MB7051.eurprd04.prod.outlook.com>
References: <20230920082727.57729-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230920082727.57729-1-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB7051:EE_|DB9PR04MB8447:EE_
x-ms-office365-filtering-correlation-id: 14e605f5-46ca-4f9c-c0d2-08dbb9bc2ab7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2sMSBIZ8L/eBqD6eUq+yHCPkgIGL4tKR666hPsiDb1/eURB+eNMeI01zb1AABOdxEvdm8jGxlVaXeQEg4B6eyv+pk1/pgBNGse7Vf9Dk9S0XNMyw69cu7JziAKkdqTmL9H6kDL6OAxk6b41Fc+rL7ndMOJRkMPL+i6TMfFdz+16WQvvWdvGCwNJHnALXM5/XT2jTE7h3+UjmO8La3qK0kutuW+t5UDjak19l8vmwe7HGhha5KZ3Kq0VQo7NbY3MK+v/aaRikuMSCD6w7DoTPcTls16e6gIL0YvRcYOvNV2pV7zdsKZijWK4rvCsUFpzWp3HE4rc7aJTqYNuh32BJC0d6ViMkgpLc2xuNVjiBsJEevcZQkpKfcJ8zY2n9pJfZV0g+J31kFs/iriUaehYrIZItdT+29B75jtxbV2L458bzPCp/mrcRm3YrsvyiK65aKLBCUtu2kBM/Q0dSpBfitG5bVFcsG3uW/tUMvnPsrZ9Qw3yM8yMNgJxVwT8qNAKuVtcp11S5wU3NNpcR2aXbhOCpVd42GkoRfEoc2TjjEp8tJHZI0LAzwyCpdxod6wcmTo8Pli0sAtxe4ArTrSBWs/StTCJq8kgkGMGwSkfoEYpl/KSt2Xiut7C+4d9mxvmL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199024)(1800799009)(186009)(2906002)(7416002)(52536014)(5660300002)(26005)(55016003)(66556008)(41300700001)(66476007)(66946007)(316002)(64756008)(54906003)(66446008)(110136005)(76116006)(478600001)(8676002)(8936002)(4326008)(7696005)(71200400001)(6506007)(53546011)(9686003)(38070700005)(122000001)(38100700002)(86362001)(33656002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GSYjOiRYnbjnMr9OfPlt7LxdYoV9eVFWHYWCz8xPnUncLnC9b4/ItPUjyHvU?=
 =?us-ascii?Q?myiArBmQeVNeGk/jkDzpcAgrVGVa9uFaAgTjColvnUb0y92Dyea/LJOAk7Qr?=
 =?us-ascii?Q?Bi5N14niOjPl1MySVmh8HBQnuTguxhAYcymcZMyz6GXBfYSZSZNzqzsT262L?=
 =?us-ascii?Q?+jxa9V4ipC3O1oe9kXvpj7Eya29WaAnDvL/2dZKyDWv6TjoI/137dwVU2DG8?=
 =?us-ascii?Q?POz8xEhWtIQfffYkLBpicdjWpky27HBTSP+5g31oEYEUArx+niNN88Q1lCwp?=
 =?us-ascii?Q?JTsPbzT0dvixeJBfvpmaxpyD6OUbXYch7keyHp/pL7rb5C9zMBODn1sQtmWh?=
 =?us-ascii?Q?1rDX7H5K4MoqkOW3TwbRYIfQpjr7x67sNQmLIVzEId9QHnaDqiwr3LWaQs+A?=
 =?us-ascii?Q?89MKnUZD4FA9dYkbNxiD43ECpzc6Rib+fN01kFLIyi++4/6/QHava4V84+o1?=
 =?us-ascii?Q?eb/X4Pd5URGFsYMNiWjLGppAUgWnfkidcbvuTaqUqr0NkbnZAUujiJNr7Peo?=
 =?us-ascii?Q?/AIf61URR243UsnRUrI+iV1Yg4En8IAjX3jynzmCkleeXZl7OcLVw5AzeYSn?=
 =?us-ascii?Q?b8YjlzB/OWhFwXIQDcywgIpWc/j40ANI13nnZ5tfmELPc8fEr34IlgEGCWry?=
 =?us-ascii?Q?BoVlIOleKpuuQe8Lk+C72aGxHaYeY/no5dAeWwh6ilRcRgzKJK/+L8vacuOb?=
 =?us-ascii?Q?02J0RwTrWbSrzCsAXTlqJ3lea04jAP3+AnxoaBV/kdTqQaNKdSzrnsrpI7UL?=
 =?us-ascii?Q?8i1PCwy4Ownh8Igeo9QU6ZIiWm9T/I1n68MvjsmLGKGieBfOaFdo7c3+gIxS?=
 =?us-ascii?Q?68K82tO5KNUxYkkLkWUbNpU46ZmRc4Dc+Q8FTBBxZB9rlyX3p+LpL/Cvsrmd?=
 =?us-ascii?Q?nSOG/6Sa3e+Rz3QnAsKh2k7ryG+cWUEka4VlFBL7D+nG1coup1wxbxh3uw+k?=
 =?us-ascii?Q?08WTuklSrD+xdqLMgr1QKfQeGr+pGJmmI5TlKSvGzrc/8USN+0oIECqt8XaX?=
 =?us-ascii?Q?XhlpuX7GpVp5EbuOUxVupmd6NadRbCO/uHO+SvXqJgNqr+bEG16c0ihcLjQo?=
 =?us-ascii?Q?WGt6+i82meKyqoT11FjaD23DEozgsE4/LO70SgXZDOMPNESg2KL5f5E6kUpX?=
 =?us-ascii?Q?l8Tl4YNnPxLUlv8Uf41RL3DE0gL2RoFTPDOD020zvK1stvn43AhEve5spCju?=
 =?us-ascii?Q?NpPB+JRhxEMi9cZiFub8IaVRlp/ObhzJqQs8klIQwkdx7pXXuC+4WyyVYqf7?=
 =?us-ascii?Q?3j/nYgbV6R4/7YGZx2ZojJfgGGliEJZZfKKjlPa4HsHqeId72PZKO8fC/xfr?=
 =?us-ascii?Q?qSaS8KnOb6h9/ecKm7G1likd5Iz1qEALH6Sa4F3HPq0qjOdn9HInxwQOVqf3?=
 =?us-ascii?Q?+gLJe/gXRHiBR8i6nh22Y1W+khfGB/6gOwi/9M/lJaxV81w2rqC9lz09KUD9?=
 =?us-ascii?Q?COeOXdyNtU524kpce22YA86vZ2CD+yg0CmT0bpzEL76zxcnRNUiaH011ksLJ?=
 =?us-ascii?Q?rqPYIcb13E9CDPNWajMFiIsgFtWRi8pFxui0fMa1kmYys072kz1lmwEGKjPA?=
 =?us-ascii?Q?3rLxZlRfV1grUSad2ro=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e605f5-46ca-4f9c-c0d2-08dbb9bc2ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 09:30:02.4482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RX1SalJxFFSNfdaoEndx9FqF3aSF5LCq6QnT//Xsu2SHyvj5/+a+1dKE47Vz2wX9ezRkDuCh3U50ZgNtkDjA8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8447
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, September 20, 2023 4:27 PM AngeloGioacchino Del Regno <angelo=
gioacchino.delregno@collabora.com> wrote:
> When external bridges are attached with
> DRM_BRIDGE_ATTACH_NO_CONNECTOR,
> the panel bridge may also get the same flag, but in the .attach()
> callback for the panel bridge a device link is added only when this
> flag is not present; To make things worse, the .detach() callback
> tries to delete the device link unconditionally and without checking
> if it was created in the first place, crashing the kernel with a NULL
> pointer kernel panic upon calling panel_bridge_detach().
>=20
> Fix that by moving the device_link_add() call before checking if the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is present.
>=20
> Fixes: 199cf07ebd2b ("drm/bridge: panel: Add a device link between drm
> device and panel device")
> Signed-off-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> ---
>=20
> Changes in v2:
>  - Added device_link_del() for (!bridge->encoder) error condition
>=20
>  drivers/gpu/drm/bridge/panel.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
