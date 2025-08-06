Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87005B1C580
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 14:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D0E10E758;
	Wed,  6 Aug 2025 12:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="SrT0DEcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013036.outbound.protection.outlook.com
 [40.107.162.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC2210E756;
 Wed,  6 Aug 2025 12:02:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABgXoMSYSsx1BNW7RqVbWsdSr2TORd70o53fQTD6oOwrfLb2ezKXr8r3Bx8Uu5PcV8oXTyVKvC7LiP8sXwdzzGuRM8tuGEeuJMRFF6IihKIhYmCBbnqAazE3MdNzYl4f1CwqAzl9/t6XBIRLRGp188FDISKAn6Xqvr+iLB+tNPJsEKjGbm8M10ECdOU7h4OPVgNpvxNxC09M7rIJ0ePUtoYkXNUsYowbz6fpYnbM3H7iI0XbfpzO9FoJS4U7YwwrApqqA5vnL8Sp8gRAv5wcfWLn8FUxJgNZWHttSAEPRymFHGiTnLYMFXc5u6RTLv+orlIeCCZuLY8DWrISTtGz2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuAbzlkwrNtBMHp6NNELXcTrLjD7efpTUPV/4F/vJq0=;
 b=B5O1B/Amaew55ZvwYbJ0oep0DSpGljSolUy9YMxtFw00oVUErjvpfqD1r8BDkcBZCMMO89odrEHwEyiDGgtTtdgaQgLL8Qix4LywJzTu76Pu7+rpDmEreKdvqc319syx0zjpIhQGhS0N2v1mWbVpGEjoQEr4NW5gzrPtS+xU2Ef9gjD9EkBNmfmKoboSA+quSzzISqZtUTXFrGxbkOy6SC7zDEm9MQsL3+FrYPh5uDoL6q/6FnkpR1hmMqaoO7DAR/APW1vYIQWTpOYe+jA5AIj9FRSGMGj2Mo+0PqSOxs3k+hVtN/d+kkSj9v6zoyk58LXh3Fp4/7eiKV5dU13cRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuAbzlkwrNtBMHp6NNELXcTrLjD7efpTUPV/4F/vJq0=;
 b=SrT0DEcgK2G2uL1RJrwuA/Sj2/e179LSyG0VduwT/bV4OecLp+zB+9c0Qo+ZADxxOXInVbD3sIPq3tVjGYrQHpdJnltPoA/SIgXjTNmi4b8G/HnMK4lOAYNiu99xeQDE3PvhphvDTXRipD4bN990TiziPk4jwlZUKjHMFBmMf0nMdnVCFq8cWT462RwvpJbtKPvUyMRvRyGFwbJ0rKHMFO7JJJR8/jTRpql+nM1nrePdx1yfLga7JGS/k9QCYT/rvccl21YGOrOhy4/r8pcnojgcgI4WVxufi7UuuD4/i776Dw4iBFzkSkaJZhoteaUz6jmmHGvzArk9dQa1bEF1ig==
Received: from DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:431::21)
 by AS1PR10MB5368.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Wed, 6 Aug
 2025 12:02:02 +0000
Received: from DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e1ee:257:5282:cad0]) by DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e1ee:257:5282:cad0%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 12:02:02 +0000
From: "nicusor.huhulea@siemens.com" <nicusor.huhulea@siemens.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "cip-dev@lists.cip-project.org" <cip-dev@lists.cip-project.org>,
 "shradhagupta@linux.microsoft.com" <shradhagupta@linux.microsoft.com>,
 "jouni.hogander@intel.com" <jouni.hogander@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "rodrigo.vivi@intel.com"
 <rodrigo.vivi@intel.com>, "laurentiu.palcu@oss.nxp.com"
 <laurentiu.palcu@oss.nxp.com>, "cedric.hombourger@siemens.com"
 <cedric.hombourger@siemens.com>, "shrikant.bobade@siemens.com"
 <shrikant.bobade@siemens.com>
Subject: RE: [PATCH] drm/probe-helper: fix output polling not resuming after
 HPD IRQ storm
Thread-Topic: [PATCH] drm/probe-helper: fix output polling not resuming after
 HPD IRQ storm
Thread-Index: AQHcBXxdKRF6MYF9cUCK3BRks+j23bRT4YeAgABMOICAAVikEA==
Date: Wed, 6 Aug 2025 12:02:02 +0000
Message-ID: <DB3PR10MB69081B925B54BB906DAD0D20E62DA@DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM>
References: <20250804201359.112764-1-nicusor.huhulea@siemens.com>
 <z4jxkrseavbeblgji4cnbyeohkjv4ar3mbbdvothao6abfu6nf@nqlhcegwtwzf>
 <aJIhCyP2mwaaiS22@ideak-desk>
In-Reply-To: <aJIhCyP2mwaaiS22@ideak-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=81c2d151-86e1-4bf5-9926-d23bc8ef2367;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-06T11:53:10Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR10MB6908:EE_|AS1PR10MB5368:EE_
x-ms-office365-filtering-correlation-id: 6c7cc93b-2662-498d-edfb-08ddd4e10e28
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SY7KUrixesCzqQE2h8il6S+YvWmYG0zrZE96zWa4FRjYbHAwJrhR3rW2wg9x?=
 =?us-ascii?Q?ScyhDcI3slRtuMMMvqaFld226IJ3fkV1dLJ+ffY7kHBgg5H8PJEZINciZTbG?=
 =?us-ascii?Q?hhV/y0WTmNzmXXZ62PTWgNW4MVoJ31bfTL3nkxQghx4bs0EWwADNoHaYjp6L?=
 =?us-ascii?Q?XRMS/KgUqTniIy+RsvMRhC6XmRfpovWsY+brqViU2pgkoTpINZ70TxZIieP5?=
 =?us-ascii?Q?2esNzGWUai3qb+jNPGrLdq2ccpMWUmxTU86h++wxzB/8m/twxfx+C03QUhVj?=
 =?us-ascii?Q?6rapuwsaJaQr0Ff25aHsPzazNJy9I0qpLm04FTjE0YZXjI5E0tEYpy8mCoee?=
 =?us-ascii?Q?Inxu358y2BK3tltVHQm9hPcIVhKQr5RPNqlTwSDsOzRLhOoszr8HOCUEjyc2?=
 =?us-ascii?Q?WiaHhcLB3+V41QKVWUSeIYSAKoNzAHLKYJ83M/jkwEE8qBoFJKqJuyCgKTT+?=
 =?us-ascii?Q?v6/sohfZ+gszY7Ajil9XB4Agj7C645knauN/Dd3hh4GdxYLvI+85sGfnuH2p?=
 =?us-ascii?Q?6kZ0tFuLxnPyDDRhx4XLfRVlijcuH3LA+UTtOsEV2uPcie/oRA73ly1vPfvT?=
 =?us-ascii?Q?VqQR3krbEW2Tv4Qutodajmk7do6aIg91/h5AflsnuGBLiewZfzaiwStL1Erd?=
 =?us-ascii?Q?Fb2MBcmJnf3bJX0INaxM7bFqhh+oSaQ8lsm3+6V0NM35nbvc1Qjmk5GaCdu7?=
 =?us-ascii?Q?cHf0tp/GKlkbU48a2Nj43RXjJIMVBL7q14t9EZJ+7LyCmFnVA98EcbxA3qyN?=
 =?us-ascii?Q?/NuQgTdIKl8u0NZ4egywoHLmVa7B7dZHKbGEswKzWKqsvbmMWEdRL1QqsDMY?=
 =?us-ascii?Q?enRMy8Xy63jBG6HxPdH5nrxV4FRc6cY6Lq3hJrfrS3/72lMDdnEYJdmm4oYK?=
 =?us-ascii?Q?NpwgbAn1T0l7r53pWG+yo8q1sEJLVjEDYNtkO7pNn2bZIOr+nRvf6B3H0EYQ?=
 =?us-ascii?Q?7QzHbawtKryQt/+4BzU9bycoPvnicrccR6Sd5wm6eTgUIfp9Aj6endC3eMpX?=
 =?us-ascii?Q?gmz2XOC26zyABfB09NwCB7b2861afHnYHAws+vnzPKrtmbKYQaX0yuYZrRlj?=
 =?us-ascii?Q?1RrWqAPQYKI+VX7XYHnC/y1aGwmOh9hmPxONATQUabX/BZz/boHXJZHHPAZu?=
 =?us-ascii?Q?Si5Djw00W5yuVpzP+JApMVHL1xp4q5xucM30GrbAg0Q3OH3CNN7UdnQccUmy?=
 =?us-ascii?Q?OcU+IK6NzljkWjrbeMsi1Q79SvznqyXTC+hAkXELroJe754X/bVFdzMes9AA?=
 =?us-ascii?Q?1fhekTHWG4nQF+eCMHE+xOU/bqP02ub/6+CKuczUVSfPMgfEe8mV5YteKCN4?=
 =?us-ascii?Q?sYDd3IluuZNnIn9Vn6MOMYewfY4z5bJW7te3UCJd05KtqFngYz+iaEoswUPw?=
 =?us-ascii?Q?3I/GIV4jEgU5wvQKswN/4JdDQYVITk3Av+HbUSOXWpetKUeWLucxyXSkxFEM?=
 =?us-ascii?Q?ZUs0vuq77xDxeb2kcSu55MHiOOW/8vcEpm06WgbTA1bMepmoM/2ucw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PsRWdPgwp9tTj5vur9b12HXA4xA98DqryC2F0QmUvVW0ASx/H5q6CLudm7VT?=
 =?us-ascii?Q?5p++7zks7+JNWiQ+Z0taYtCogsDewv+A7tZx+fT8Pk4gS3kz0DHHhnnShq90?=
 =?us-ascii?Q?j3G75WNh9P8eYbzs8xRf/AHEqGKDvZ++DqplRN9d3PdusN777S2HJnTj5qtU?=
 =?us-ascii?Q?NyywytldqdTzXJpkBWv1PKXQwGez0taPZz6keQYKo8n1G0W85nxAcBRcPwcN?=
 =?us-ascii?Q?JQ8rDu0fUywPms1Ak1bsUSNER/8Y9yEA5AXALnaYsHdQnmpe3UBnQgSE5zJX?=
 =?us-ascii?Q?qHR9nbMlFqoZBB2kZNAZ8sPNzqU4bxhaqEuHUJJHmNLG3Qeati0aRLNZVP8h?=
 =?us-ascii?Q?TS+5tiWub3pFxmXs/xWE4aZg3ExK+PjYtMDb5TxFa5gQvuN6w9AQTjPTfh5L?=
 =?us-ascii?Q?1uNCdQLkab/08Bty06HCbgQVEpqZ5opMiHtr5fGbYi/6mdlPgxB9cwuOHXTt?=
 =?us-ascii?Q?BeeiIJ2JSqGPRiIklw12ym1uoR9fqdzbv+y4S3JacHMoCIP8rtdpD7Bb+1Bo?=
 =?us-ascii?Q?0ypYU/J83EvMYehuFF/JM0s2u6mhlua+MOIHU8i9IWmgYr1nC2MYkg7xXIvB?=
 =?us-ascii?Q?91f9ZhdTxoWKKgDhqtnmpiskXxZzrVytQZlMHJuPCasa6/Rx94NZFDVt8OVJ?=
 =?us-ascii?Q?on00NgunB76A14s3ftfyEaM9+RcXETJOW8IZX+/ClyXQA9xpaA/d5e1ZSznl?=
 =?us-ascii?Q?6qtLVPyyFiuw4W3S/Fur1dIecj6WCeJ31nYMQeXApsMmEdR1o8wZecpFnmLB?=
 =?us-ascii?Q?aYNO277u7RdxN1iUhKj43v5UaKCVCVBaQEbqpnYdvcofSsS38C7xgdCXZOhx?=
 =?us-ascii?Q?hkvLxEsA/Mtmh9C/ykmSv+2ORRWD44RTbFpg1SJyBY6rFplKs8SbVAYvFMzB?=
 =?us-ascii?Q?4CydMddTF3CsdSS1EqU6Y0D/KrebHNEl6+Am/FfwGVyzN3Cg7fF0FtT91oHk?=
 =?us-ascii?Q?oUk7984sv1BG5YrTL3k8yj7qHiiRaJkaVPpEByTl/hyBlR/JEvOToK6qY+7Z?=
 =?us-ascii?Q?MDovDQbnhgmNkYMxNaukw/cEGi/EO0YUN/bd/cYWXXldNeJy3Lcz9Rk+gN3a?=
 =?us-ascii?Q?Yszy74q7dfbYyTNpS9x8u8a7mHYxysNBmxP6L/J9jVfGSg43XTOkPNGzbWZq?=
 =?us-ascii?Q?VCLDOaSDeh4GmnoOVpmKgGZvf7q7H9QbP8umzWlDshaNWNQcI9Wd+rMUa8Yu?=
 =?us-ascii?Q?xRR9JTN640eGPccK1f8mcHDNPXEKgqeydUrpykgR3ns3Siag5q8lwmfODdGY?=
 =?us-ascii?Q?obAsi8XfPJJAHxL2gywzReT2Q39uvdS2QqcuruvfbIthY6WtxX5RbYrGL/r2?=
 =?us-ascii?Q?hOqRYRx07PGVgyDqfk7qsilYA/ZbvpgOMOLAkfWnJpHkopbJDGiqnvcttP8y?=
 =?us-ascii?Q?7BkMYxkU62zR73dZaYDYQbkjFIHQYYuwui/Fh+NNpXEH2grp5jzHX5MEOQeU?=
 =?us-ascii?Q?OSNDp1ByS84zlrJVgGDriO3/HElICZ+O62tZ0DsSO/FJdCsd8ZhaerF0joYm?=
 =?us-ascii?Q?/wz2nTYhwHaTQ+U+Wd6tL2yi28Vfv/QNtSupg4cVvOZfjypJngUZMtQ8bsoV?=
 =?us-ascii?Q?rUHjtTvDBDsdyjOrA3D2+fdQxkJH09ds1pUBUzM/sezPz41c+JeZuwNT879r?=
 =?us-ascii?Q?SA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7cc93b-2662-498d-edfb-08ddd4e10e28
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 12:02:02.6418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GeXG/laPP9kCgQ/n5c5GwgEa5IPeV7kGvw4yNHnPCXR5267WfyVL9l35fRzklLPeeANOeYbpgnm29zxSNBH/mxd01tL7npqZmg5HgF6oMno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5368
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



>>-----Original Message-----
>>From: Imre Deak <imre.deak@intel.com>
>>Sent: Tuesday, August 5, 2025 6:20 PM
>>To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>Cc: Huhulea, Nicusor Liviu (FT FDS CES LX PBU 1)
>><nicusor.huhulea@siemens.com>; stable@vger.kernel.org; dri-
>>devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; cip-dev@lis=
ts.cip-
>>project.org; shradhagupta@linux.microsoft.com; jouni.hogander@intel.com;
>>neil.armstrong@linaro.org; jani.nikula@linux.intel.com;
>>maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse.d=
e;
>>airlied@gmail.com; daniel@ffwll.ch; joonas.lahtinen@linux.intel.com;
>>rodrigo.vivi@intel.com; laurentiu.palcu@oss.nxp.com; Hombourger, Cedric (=
FT
>>FDS CES LX) <cedric.hombourger@siemens.com>; Bobade, Shrikant Krishnarao
>>(FT FDS CES LX PBU 1) <shrikant.bobade@siemens.com>
>>Subject: Re: [PATCH] drm/probe-helper: fix output polling not resuming af=
ter HPD
>>IRQ storm
>>
>>On Tue, Aug 05, 2025 at 01:46:51PM +0300, Dmitry Baryshkov wrote:
>>> On Mon, Aug 04, 2025 at 11:13:59PM +0300, Nicusor Huhulea wrote:
>>> > A regression in output polling was introduced by commit
>>> > 4ad8d57d902fbc7c82507cfc1b031f3a07c3de6e
>>> > ("drm: Check output polling initialized before disabling") in the 6.1=
.y stable
>>tree.
>>> > As a result, when the i915 driver detects an HPD IRQ storm and
>>> > attempts to switch from IRQ-based hotplug detection to polling, outpu=
t polling
>>fails to resume.
>>> >
>>> > The root cause is the use of dev->mode_config.poll_running. Once
>>> > poll_running is set (during the first connector detection) the calls
>>> > to drm_kms_helper_poll_enable(), such as
>>> > intel_hpd_irq_storm_switch_to_polling() fails to schedule output_poll=
_work as
>>expected.
>>> > Therefore, after an IRQ storm disables HPD IRQs, polling does not sta=
rt,
>>breaking hotplug detection.
>>>
>>> Why doesn't disable path use drm_kms_helper_poll_disable() ?
>>
>>In general i915 doesn't disable polling as a whole after an IRQ storm and=
 a 2
>>minute delay (or runtime resuming), since on some other connectors the po=
lling
>>may be still required.
>>
>>Also, in the 6.1.y stable tree drm_kms_helper_poll_disable() is:
>>
>>        if (drm_WARN_ON(dev, !dev->mode_config.poll_enabled))
>>                return;
>>
>>        cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
>>
>>so calling that wouldn't really fix the problem, which is clearly just an=
 incorrect
>>backport of the upstream commit 5abffb66d12bcac8 ("drm:
>>Check output polling initialized before disabling") to the v6.1.y stable =
tree by
>>commit 4ad8d57d902f ("drm: Check output polling initialized before disabl=
ing") in
>>v6.1.y.
>>
>>The upstream commit did not add the check for
>>dev->mode_config.poll_running in drm_kms_helper_poll_enable(), the
>>condition was only part of the diff context in the commit. Hence adding t=
he
>>condition in the 4ad8d57d902f backport commit was incorrect.
>>
>>> > The fix is to remove the dev->mode_config.poll_running in the check
>>> > condition, ensuring polling is always scheduled as requested.
I'm not a full-time kernel developer, but I spent some time trying to reall=
y understand both the rationale and the effects of commit "Check output pol=
ling initialized before disabling."
Here's how I see the issue:
That commit was introduced mainly as a defensive measure, to protect driver=
s such as hyperv-drm that do not initialize connector polling. In those dri=
vers, calling drm_kms_helper_poll_disable() without proper polling setup co=
uld trigger warnings or even stack traces, since there are no outputs to po=
ll and the polling helpers don't apply.
From what I understand, the poll_running variable was added to prevent case=
s where polling was accidentally disabled for drivers that were never set u=
p for it. However, this fix ended up creating a new class of breakage, whic=
h I have observed and describe here.

To me, the core logic should be simple: if polling is needed, then we shoul=
d allow it to proceed (regardless of whether it's been scheduled previously=
).

Looking at the  drm_kms_helper_poll_disable()
if (drm_WARN_ON(dev, !dev->mode_config.poll_enabled))
    return;

If the driver never enabled polling (that is, drm_kms_helper_poll_enable() =
was never called), then the disable operation is effectively a no-op-totall=
y safe for drivers like hyperv-drm.

And in the enable function drm_kms_helper_poll_enable(..):
        if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
-           !drm_kms_helper_poll || dev->mode_config.poll_running)
+           !drm_kms_helper_poll)
                return;
The main thing being guarded here is whether polling has actually been init=
ialized:
1.For polling drivers like i915, removing poll_running from the enable path=
 is both safe and necessary: it fixes the regression with HPD polling after=
 IRQ storms
2.For non-polling drivers like hyperv-drm, the existing checks on poll_enab=
led in both enable and disable functions are sufficient. Removing poll_runn=
ing doesn't affect these drivers-they don't go through the polling code pat=
hs, so no polling gets scheduled or canceled by mistake

Therefore based on my understanding and testing removing poll_running guard=
 not only fixes a real bug but also does not introduce new regressions for =
drivers that don't use output polling.


Nicu
>>> >
>>> > Notes:
>>> >  Initial analysis, assumptions, device testing details, the correct
>>> > fix and detailed rationale  were discussed here
>>> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
o
>>> > re.kernel.org%2Fstable%2FaI32HUzrT95nS_H9%40ideak-
>>desk%2F&data=3D05%7C
>>> >
>>02%7Cnicusor.huhulea%40siemens.com%7Ca68c32efd9a044f7f86308ddd4338f8
>>> >
>>8%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638900040113270385
>>%7C
>>> >
>>Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwM
>>CIsIl
>>> >
>>AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
>>mH
>>> > ublqHV5x2K%2BLZ3ylYHsQhtLbcQSwSwZxiqBl2KohM%3D&reserved=3D0
>>> >
>>>
>>> --
>>> With best wishes
>>> Dmitry
