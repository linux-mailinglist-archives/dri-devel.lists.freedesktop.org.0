Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D5EB101F1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB33510E89A;
	Thu, 24 Jul 2025 07:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="Z9QwdqXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013066.outbound.protection.outlook.com
 [52.101.83.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774A4895EE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 17:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4fUUvVtAT4R2zKqqEaLzRLc1pJipaVfbxJtXnqNcyEvZ0Tly0W/a2JHj0/x83jCU6B8ZmdycK/LS5V6Ia+AH+Lvf+VO+RRvwqA4zl2vNJ0tb0LTrGNfoirHgXFwLY4adHORmRZYpXtb8xQC0e0MKP13N0D4lGc45+8OKL6rREFvTFMibnWNKlzEiYi5Jx1P5JZvtSy/Bel7AkytVXdndqLMmekHQ7Fnl7bietrp9s6djT0DcUgN96vNtFmXw/CU0El/aWZgW/qezP5QiKVssnllGpTZJkhHIa8vstcvXiuVBg3tl/OGOqKs19OYoMZQIi0+YvABDjG015DBViQPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyYXxEHkG3Irdik1y5zo+7uZ0j5aq0KeKduwKgVgpQg=;
 b=cZqCYOlKIHB8DBk4vIewHgUzbULnBp90IBmf1SCtsb8WcR6U9iR5N0f7UdVYS7Wt7EnpEmOLhqFxNmRqvz/57Tj1hFedPFM7hjcIvdaVyafDK6jFol538fN8rClGqLSkrlAz0ASZEtKHU3VbGZvifv37AG9LRpcU5dvN8t0UNqcBVpfOnYtJ2olD2UD7o68NX6yJQPVM9+5zg+a/g+g8kwVgYp3jefPv8kqZUO5F1brusMzw/8BDYKVeBtW3GNgb/1Ki9yvwZm6r5Poau+Ml3tEEQOGNB7Y8aGKiivErMNjvZp8Yl3vXfpPa8SpDRoNUB1Dz5luYedhGHQZtOrF4uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyYXxEHkG3Irdik1y5zo+7uZ0j5aq0KeKduwKgVgpQg=;
 b=Z9QwdqXTucauJ3u9I4yQ9LEJL7KtVwWiHEIWQbO1tZXANE7CxSE9U+8p5fe27N8x00ifZPvel382NeLxc2OF09zeFBLO17FW+Ztr3oTLR1NO2iemQg255MJTYsMFz8fXA4GhJhdE6bWxqLn0YuJBXa9PM+RSr9UJe6g5yDTo6YMoZIcE8ll3HhKkZ5NdR1gi1gZwQ1tO8+016madzlSrWTjeS9OLW8l54RL1UHsfq+fH6ijmJAjO/3o2WZCR1UmBWbyait5zuMngXgtQrg7DY8ivzgj/Gj9aEKxTVuvgYamYNf2mVix0ePlnKlzpkVB4XSORKnVctboDGpjqVYNd/Q==
Received: from AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b4::10)
 by DB9PR10MB7994.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 17:18:27 +0000
Received: from AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a592:35b:541a:77c6]) by AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a592:35b:541a:77c6%6]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 17:18:27 +0000
From: "nicusor.huhulea@siemens.com" <nicusor.huhulea@siemens.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "cip-dev@lists.cip-project.org" <cip-dev@lists.cip-project.org>, Imre Deak
 <imre.deak@intel.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?iso-8859-1?Q?Jouni_H=F6gander?= <jouni.hogander@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 6.1.y-cip 2/5] [PARTIAL BACKPORT]drm: Add an HPD poll
 helper to reschedule the poll work
Thread-Topic: [PATCH 6.1.y-cip 2/5] [PARTIAL BACKPORT]drm: Add an HPD poll
 helper to reschedule the poll work
Thread-Index: AQHb+9D5MgNiBKgSaUqotwZvvZR4AbQ/tmoAgAAZxD8=
Date: Wed, 23 Jul 2025 17:18:27 +0000
Message-ID: <AS8PR10MB6890711B61B02EB495E7337EE65FA@AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM>
References: <20250723125427.59324-1-nicusor.huhulea@siemens.com>
 <20250723125427.59324-3-nicusor.huhulea@siemens.com>
 <2025072342-handpick-geriatric-ce9a@gregkh>
In-Reply-To: <2025072342-handpick-geriatric-ce9a@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-23T17:18:27.027Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1 -
 Restricted; MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6890:EE_|DB9PR10MB7994:EE_
x-ms-office365-filtering-correlation-id: 9fccd785-500f-4db6-4346-08ddca0cf01c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?jTzO3xvgECaAxUbzFIMWzmkU7EbsprMinZv0urZKDiC4ILAU/p6Ol5K9Zn?=
 =?iso-8859-1?Q?JVae6GfTNN9vkbZjxT2lO3NUwvSClB7b6d2wfsRYnRWWM05eEsZh729ShF?=
 =?iso-8859-1?Q?foRz3UcBIBEtGoGTOdKmfmSosIncw+GdXrYIUZcleblFnXnimW9sCqE+cv?=
 =?iso-8859-1?Q?w5UlzsPIbse66rTzxyJtjG0iHZj5FwiIFYjYc4zJAl8wYhDy9AEVC7YxYJ?=
 =?iso-8859-1?Q?YN5WVSPtqiPDyNn2koU4zzfM4MzPy9NckYLdCGsP5Fv7qHRZpZ7TnuN5lH?=
 =?iso-8859-1?Q?PTi9nEqbAy+0XadHKzLsvYHQ9sH5D8d+06D/zPkPVxJQr93kGM6OGuWBI9?=
 =?iso-8859-1?Q?2M4VeG7ECuqQkBqhIB/boySLfRODOiGmL7kyG6d5FMXKL935GlSPNL3gok?=
 =?iso-8859-1?Q?UvwUb+GW4DA/vohL/FH30r3e93mquTnmrlSy/yLjV+qisIOsxL2Vtngg+G?=
 =?iso-8859-1?Q?+GHSA38tqEt6LuVQ+CXXlUOS/Z+6KxA4oVECKG0BSeDTiBvKK4BXLc25Np?=
 =?iso-8859-1?Q?lhaI9nn3fr7FUR87ROXGEQBM8KRtLxo2UHWmoTRUYgHq7ki3a/NOnKfyYM?=
 =?iso-8859-1?Q?aJZxh+46x/ZJywE/Yn5h5iy8TkJYOub/+0uyHo9uZa23XlrkEuo+UZx+1c?=
 =?iso-8859-1?Q?xmqY0u9PbAYIQ77IqVCrwPZ0zrmc5zv8073uOm8s8xxr0OyN5/8J4c6f6s?=
 =?iso-8859-1?Q?gJAowAMi9+QdhFU4Iofv91/B5+6a0un8+VFLRQzzrFiGs4C7QsQuBbWFeD?=
 =?iso-8859-1?Q?kD8r6XLPbUviR5Vh/Yg/+B4VZZ+QPuvjf5JLe46Q/LJC0CdyMkqm6ye4bz?=
 =?iso-8859-1?Q?HE0rIDDClm3A7qFCLKe654u1NyKtZIiWH7S/Na33kIvKdKw8w0RisXmcZR?=
 =?iso-8859-1?Q?Q4ndSyX1Q280WUsU0fUCdI0zofN3WZeR9VqDcWS0ngJAzMB8xsooDoARgQ?=
 =?iso-8859-1?Q?XP978To6g40XiB4nwLnxCnphq/iBK7v6/BNgCDCsCkXTcQNPGwYXBo09jx?=
 =?iso-8859-1?Q?2GJgODoFinTQcqdDGZPOMFJ3D4JMgHuJk/d60BnDep2QF/2KnyeXqM67df?=
 =?iso-8859-1?Q?2pf/QaJI33AMRVbkfe8pkv4wDwWs7SnceUX2hb7b4frT/ZH1zeqwDcrSNQ?=
 =?iso-8859-1?Q?aU3jOmgdNQkpza/V7s60MkR8l+JMAoBgCsfMcaP+z719ENNrV3sO+EsA0b?=
 =?iso-8859-1?Q?xXmyeSv1CFV0XCl7YmqkdqQbi1kgXfhxXfSDEBV1WlGNAJAgl/NzvJztyy?=
 =?iso-8859-1?Q?sVSfN2EcH2vT9t1++PEo85BwTDmZd5tnuOtQqh0SqZuV7K5h7FHnzgoOm/?=
 =?iso-8859-1?Q?eFujAKQSKsayDg2GSdUrhp8ZLbA3QVjxo0Wenq3+XPJHF8VhN+La024KpB?=
 =?iso-8859-1?Q?KLVL6Tu7+FgmBvZliiCTUN8bTcecQ8E4fna7u/iiw3x/7ZI50hUQ4wN8+K?=
 =?iso-8859-1?Q?K/Qpe82nLUdB8vz24Bd/7d2g7/NKuGhORXOZibwnBkx4uwdya7vX4+Q7S1?=
 =?iso-8859-1?Q?o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?raJIDOq/ImpXWwdezzQx7YsW7L0Xfq3PKa4GlWrFm3dSnX+bjJXABd1hbi?=
 =?iso-8859-1?Q?RZh3GI15CMI3h9xqGH5kuexjnNedLFQu1zY+CBjB50KZ85fXQovj/fyANK?=
 =?iso-8859-1?Q?JwJWr+r4iE4lYrfFkZC8sEBgNY7RPWwIMyWMF7lc6HRP9+8E8DpR6+Sj9I?=
 =?iso-8859-1?Q?+xpoDLbgfXK+0HjLAdbXf1NBqU6XIW61vnalQlIAaFHpzcTfocLkp9PctV?=
 =?iso-8859-1?Q?t/R8MrWCvC84HUepLTj/x3SmusOFupFH9Xxvy46r4aNcdS2jprv6BolxtM?=
 =?iso-8859-1?Q?6V153ReOxU1E9VJbv6TQ3DJN+sXhhnJcHNkgADU9JHnbp5f2Ou0nE1mmsi?=
 =?iso-8859-1?Q?SoRdFtJlvdUiPsQ+SO9sMoUeJ/NKjsj5NZFbtBglsIzJBh2FHj+9y9SAtL?=
 =?iso-8859-1?Q?fTtKUZNyUdNk+JdrBde9aeIJGl5a1uAxC0iqEtR5slS3J0+ulfTMOauuEN?=
 =?iso-8859-1?Q?d41LI+PFhaKmX8uB1s3giIsIC+2SES7q0KVE1OumC9Hfkmn+rRKwA9Mz9h?=
 =?iso-8859-1?Q?nStOydrdRqMEFACvge6GrGPN4iMKBeH3N+DgdhYWDUoWsLYAn6a5VFmIR2?=
 =?iso-8859-1?Q?kkVWWLBU8waHqfoPe37IHWNOSd0QqSshATBrVJLqawmfrSLOu/f6CK5IJm?=
 =?iso-8859-1?Q?w5Il1RACzXpAsM8Nku1HozjjWM09AKHREND5oDNtbhbrnXLeAC0eCVsqJB?=
 =?iso-8859-1?Q?zxgpY0NMLQiuDnNJmW+XcV5zoMj+MlOMLML0V80NTHwpFIzNrKYVpn3cDZ?=
 =?iso-8859-1?Q?MotDtbtdT6oVAdL27ciVIEPTEMVvrQuWZS8IJyHUZP0vtq45C4z5ujlguE?=
 =?iso-8859-1?Q?l0ARnpiGxKtzYllVUBLTFIAKloLU2EhhzVvBdEhIVQhRs+Hixdj/trz4kl?=
 =?iso-8859-1?Q?KXbCQ+v/Uqr+gmWT16DdvdBYYGi/wJo0xhKc8X7quwL/LRfRwhuyH7dbfx?=
 =?iso-8859-1?Q?U6eixvQ9oHBu6RM7PEUG0PlR5ZPuG1YBBf7VwRc3KLz5l7TGFewrNjlt0n?=
 =?iso-8859-1?Q?fyUswzFWO55m+lmlbMY7cstD0nSFgErsuH0owqc4DaE6IKWgvzp8jj0MDr?=
 =?iso-8859-1?Q?3iQM+saKBZVnqgfKSWW3GRNi+KKFbRn0PVsONue5xln6gyAXsQBNWKKSwN?=
 =?iso-8859-1?Q?L22JXh0kNuc67334oMYQHzn7ECxeS+V+kFKfXO+/dwXY8LTg0o9PaDg7F1?=
 =?iso-8859-1?Q?tX4H1bJVg2r0BUInqEVy4fcEjn1gF/L5AVxVnxYfVoHMkYfxy9xTQKXLls?=
 =?iso-8859-1?Q?wlEu3ptEKSL9X4CX8o4m7tCJE4JNViHaTPGhnu+dpoxUot4dEW/HZ1Obi+?=
 =?iso-8859-1?Q?M26+LS4ClQ/+bTAtV+n3LczZjWZpQCr38iFJD7TWLrv8uNfFp2aTsrmOgx?=
 =?iso-8859-1?Q?52Kr8lGIenMU0gU4DtWyNCLqwCOPh/x36PjpWR2kwGCj7RwB6lgqMezt8n?=
 =?iso-8859-1?Q?55g4XXoDnJ5V9l3aggXNvihJqUF4k/MjgSANEkVSuUEqz1iBOu2EXOgLar?=
 =?iso-8859-1?Q?ecDOKPZmnbYUp583HYGSUUNUOeXJZDufQ5mYp1V4A/JfWRHOeB7k37t7Bv?=
 =?iso-8859-1?Q?b8J5gJceISLeQaajMDZYHTRuHebsZD+FHyu0OIGX0sjBcNV/Y4AxRPz8CD?=
 =?iso-8859-1?Q?If7xXWnH1XPBr9aCchuvih/XxU+JKPCGsQ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fccd785-500f-4db6-4346-08ddca0cf01c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 17:18:27.3025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iO0aeFwGIOd0P1wuzt5d3Z3w2kQAeq+l5wd1oMjt68nsv9jef72wuUsXT/pd3ysMzzCsxDd7XNpuYCHq0xRZ+0HXX78bEfpoOuroXoY/BcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7994
X-Mailman-Approved-At: Thu, 24 Jul 2025 07:35:09 +0000
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

thank you for your review! :)

I'll refine the series as I forgot to add all the authors/participants, the=
refore the confusion on the context/issue


Nicu

________________________________________
From: Greg KH <gregkh@linuxfoundation.org>
Sent: Wednesday, July 23, 2025 4:38 PM
To: Huhulea, Nicusor Liviu (FT FDS CES LX PBU 1)
Cc: cip-dev@lists.cip-project.org; Imre Deak; stable@vger.kernel.org; Dmitr=
y Baryshkov; dri-devel@lists.freedesktop.org; Jouni H=F6gander; Rodrigo Viv=
i
Subject: Re: [PATCH 6.1.y-cip 2/5] [PARTIAL BACKPORT]drm: Add an HPD poll h=
elper to reschedule the poll work

On Wed, Jul 23, 2025 at 03:54:24PM +0300, Nicusor Huhulea wrote:
> From: Imre Deak <imre.deak@intel.com>
>
> Add a helper to reschedule drm_mode_config::output_poll_work after
> polling has been enabled for a connector (and needing a reschedule,
> since previously polling was disabled for all connectors and hence
> output_poll_work was not running).
>
> This is needed by the next patch fixing HPD polling on i915.
>
> CC: stable@vger.kernel.org # 6.4+
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Jouni H=F6gander <jouni.hogander@intel.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20230822113015.41224-=
1-imre.deak@intel.com
> (cherry picked from commit fe2352fd64029918174de4b460dfe6df0c6911cd)
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Partial-Backport-by: Nicusor Huhulea <nicusor.huhulea@siemens.com>

What does "Partial-Backport-by:" mean?  I don't see that in the
documentation files as a valid tag to put in kernel commits :(

confused,

greg k-h
