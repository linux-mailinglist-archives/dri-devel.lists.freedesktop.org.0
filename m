Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDBEB1C797
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 16:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E74810E789;
	Wed,  6 Aug 2025 14:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="H9X8A1ga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013026.outbound.protection.outlook.com
 [40.107.162.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E09E10E188;
 Wed,  6 Aug 2025 14:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFRyIt9M+G0o78+cSIqNmZdTl+NoutSvf9OrQJ9+0X8CFROF9NjkQUkXvJPQuT5ZuAkDMU9cf17r3m29ZnNb12NSX46UKsNIDROJXznNSK28/k6jFKOEB+DrAlg7QVV80zlbVA+o2sZ6MUNtpmey0YKszlDko2bGpTguwcU9VqiQQcQhm7DiarXBVQLz1uyK+rjw92aLOSXmtBOoQ+EwJrdmsWe/Fn5uiwCoKJX0u6PCRdrF96wl2cogC6DK3ZyzQdHvq6Oz3MkndmNACrXormqzMgg8LJkQxwi/l91TcbGMHaTm2EzveS9CvhxDTFJ5ZNqOP6xMpAlISFbUpXy8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwfHnovIRYUGIQg037rMw1VgZ1+8Y00arX7uD929TIE=;
 b=H3RiFp4VPwlFzaqsky9e7ICPyG/hTzkP22KOAiLC1czRfajmAWDq0D1Pru2rMYDdFXBXlrkJWsx4/LOq7xEfRlosGr3Zn9yFsVd76EdGtkS3q7JWfN1+Tbv3ps4a2/1QzVzj7+vcXqJZrv4sL8svmS2usx7kz3B2uDQIFBTUN7/H7mlLmmUQU81V/9XJyDFy0XWhtj+eOACV1y+n7nB+HC+pde6EQFwGL1wKz32ZET5950sEhK/pNukiAIyxdIGS+MOlFfu0qvNNC/oLygiH1EbEHnxYQEiIaEOTHA27tnllHwWTtmfDokGhEQlhCO2qKAmDRAfg6BuvZRhYqtTkdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwfHnovIRYUGIQg037rMw1VgZ1+8Y00arX7uD929TIE=;
 b=H9X8A1ga4MHgdi/v/oU/zZuqUjbcQ3LvIZmqE1lDMbvbO2mwN2u7RyXIcrWLsG6Ek81mTtcodfpxzMRVh6l8OqMOiYS4H3IP0p0+T7LjsC+LI6cHj/L6xEgnd/hqlqpyBqivAWIagJ+8kcLpByJL3MeY8V0I8dKVYLGsVVXj42eHgdeDFBGpe/cnCAkCWXxAUT/WyHHD7G9r1Awz+nIZIjrgiVFp++9bH8ulXHL0Fenp82AvPMlEa/eEBK6ZSyo1lOqk/pFhm/02EUaTRAdApzctuM7T+DKtCoHXnaDfFsfOdWj6Skx9udmSqKJhbIFH+WQtk+bDhQAtltr6l9pzqg==
Received: from DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:431::21)
 by AM8PR10MB4019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 14:27:13 +0000
Received: from DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e1ee:257:5282:cad0]) by DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e1ee:257:5282:cad0%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 14:27:13 +0000
From: "nicusor.huhulea@siemens.com" <nicusor.huhulea@siemens.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "imre.deak@intel.com" <imre.deak@intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "cip-dev@lists.cip-project.org"
 <cip-dev@lists.cip-project.org>, "shradhagupta@linux.microsoft.com"
 <shradhagupta@linux.microsoft.com>, "jouni.hogander@intel.com"
 <jouni.hogander@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "laurentiu.palcu@oss.nxp.com" <laurentiu.palcu@oss.nxp.com>,
 "cedric.hombourger@siemens.com" <cedric.hombourger@siemens.com>,
 "shrikant.bobade@siemens.com" <shrikant.bobade@siemens.com>
Subject: RE: [PATCH] drm/probe-helper: fix output polling not resuming after
 HPD IRQ storm
Thread-Topic: [PATCH] drm/probe-helper: fix output polling not resuming after
 HPD IRQ storm
Thread-Index: AQHcBXxdKRF6MYF9cUCK3BRks+j23bRT4YeAgABMOICAAVikEIAAC16AgAAcBPA=
Date: Wed, 6 Aug 2025 14:27:13 +0000
Message-ID: <DB3PR10MB69088A51A83E5E0E88C07A81E62DA@DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM>
References: <20250804201359.112764-1-nicusor.huhulea@siemens.com>
 <z4jxkrseavbeblgji4cnbyeohkjv4ar3mbbdvothao6abfu6nf@nqlhcegwtwzf>
 <aJIhCyP2mwaaiS22@ideak-desk>
 <DB3PR10MB69081B925B54BB906DAD0D20E62DA@DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM>
 <n5qe3zmeekirddlt7hff2tgdyhe5bysaubwpndtmsqmkgyc4lq@2agvowbjuvuo>
In-Reply-To: <n5qe3zmeekirddlt7hff2tgdyhe5bysaubwpndtmsqmkgyc4lq@2agvowbjuvuo>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=98c54365-ebcc-45fe-879c-4be650c7633f;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-06T14:14:06Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR10MB6908:EE_|AM8PR10MB4019:EE_
x-ms-office365-filtering-correlation-id: 5e3040ab-5044-42a6-96f2-08ddd4f55653
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ncqa1vyyhC39jqzc+02Gm4RMmlqJz7A/SCrQrRSIo2pYbRiJMXbl61T9LrRu?=
 =?us-ascii?Q?JicWAwo8rN8zcKRBRUMmja/INPbpT5GHM+EkiHXx0S+ZvD+0RlVPQOq5lx8j?=
 =?us-ascii?Q?0ZqR3fZE6RXdi6nc03qg5kZ7+0MNUVMAyB8m8LOAq8Zk6KRzQgki86R7a1Xz?=
 =?us-ascii?Q?id9X84qmRPKyez032PfKvHqypaDe9AoQh3irz4KCgoHYlbnZje0Hem9GKTZm?=
 =?us-ascii?Q?5irsJtKDodrIym/x32tOQ9LTDosf1P2+TiyBXW55/mrFico0N5/904agxQSA?=
 =?us-ascii?Q?EOhHBYaX8/6Qw0F/VoJFNO+GsgX1AHooPrECYHKIlD9dylrkdI3ka5s80DCG?=
 =?us-ascii?Q?j3Leq3ilApoqx/UgRPJXC8oJ/K5w2xEivhte8JZ/MKJuVQWx4OSM900vUfAs?=
 =?us-ascii?Q?oYdR0ja07BkaPY9z3pfVar2hrAZcpWfbMEglgwAh0tSZG0q9XFpFq3h35lr9?=
 =?us-ascii?Q?MCl+BuXsVwssYbCuEzrlhRpusBtPySHCqDNJjEt6FSdjlza/jO2v1pnp+b24?=
 =?us-ascii?Q?S1gOrSsIbemZUrM5HocZLLTmiaikbMn/nk7fPkCzHhEUHFsWQP6J0lGnazrk?=
 =?us-ascii?Q?fqfQgCZ5OmkH35YakXsmzittcMekIe9X9ESKGgV8Dd6Q5lWS2JbGmhyfM5Hg?=
 =?us-ascii?Q?4oQFlxvPz+kwiuQNlMHk8FQHdfkZT/KUVL047MPLpp13TTOc0QwcTkU6Kupr?=
 =?us-ascii?Q?3bCoW1Z6tWkEVch/1kxTHZF9irvVa62pyvSUTl8Sd2XwKiczLlM0S+ZXGr9D?=
 =?us-ascii?Q?mPMEo1IPjMIA4pBZAsn8nqYezHZT198pvQikxqA/xf9Fr1OED7BGpvOMib28?=
 =?us-ascii?Q?BLec5JHpR9OBzDFZmsJKgQ9MfWHu+d/Lgt+hLBt00NLAyPcfqIFI9tuq0mR6?=
 =?us-ascii?Q?s7RrB+ghDhxfqStc1RricZDpo9UZgkDjAYqnqNm3SQF/R6WhlaJzEuIWmmZx?=
 =?us-ascii?Q?2EegclTtBuuGa2mOAvWKK+VvPIrJ6+w6WnNWClTuQTIp7nbZ/NXf3eKHdrld?=
 =?us-ascii?Q?FkUZ2hekcA7dguG6VtTAZrSGv0uO9VKSU7hLmwk/Aund+CU+XHIxYaSnDBkk?=
 =?us-ascii?Q?JgAa+K6zuiZ8meYQtfManctgoLgXzmpKAcFfUloLvhwidbFCBMTihVhz4uJ5?=
 =?us-ascii?Q?rBR6hTeBzmia/STErBj8/+8bzLPC6vvrxlBJTA/0vJYZdMMAqw3Ym+sPP7ic?=
 =?us-ascii?Q?UXACm0rzsRbV1xY2a5rcuB/IQ+Iw1EolsP69efOL83ehg2jV3Tm7ZE13h13B?=
 =?us-ascii?Q?G5Em4FZ7SYLhMW8DvXjUbBPTxYBIiwhGmV2Vy3RgtZSOKEOWGiKe4Pe/wl9Y?=
 =?us-ascii?Q?MGZdU9O0fqT/kDqxNYA8ckkDmWkMU8ia48LXh1/Z1z7GNohkbmVLCwy5TSvy?=
 =?us-ascii?Q?XTBiPvCh8jPgYsfYMeCUt9NG9WRZt9Qd/RHz1d0HfbaVhk4mcVI2h5QDXv++?=
 =?us-ascii?Q?0Ptlv2p7Nvis4X1MrFFm0GiJbJNUL+hx9prtqS9ZVwhSd4l/oScdSA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MTdCP9kB0SkxCL6eZ14LxiLW002lSxgt9wLbYsG4NTyStqhwgiCFTBhf27SZ?=
 =?us-ascii?Q?hjxv7eVHEghQ5htKyaHIT3J03rwvp9s48X0D1QH7MVPXBYypfHyP+ewOb9gh?=
 =?us-ascii?Q?BhNuU/fQ6FSd1BsjwGeDF2XtsHYmLD90bnEV0x/j7XbW4KY8hWmFu+7ZgJrp?=
 =?us-ascii?Q?js0gkW23MyaXGTXDLlxhZ0+og6Rcj2lTmiQwiesj289U5MzruTy1n9P+tTYx?=
 =?us-ascii?Q?s1aI4SUIT60WWlFnYlucrRmSvFXagxU+c9EBtC/m/w0gf3qnErkP5BmPt7Dx?=
 =?us-ascii?Q?tKET9EkJPDv2nI+gkojRMPUyedKAkGFaPKeoarqF77RTCHUs8VcGEK4cahOV?=
 =?us-ascii?Q?Zs5SclyORVBl0tVewG4ObiG/7uT3w9o6nPXW12AmSZSfdqBBCTZhSg+0IAyp?=
 =?us-ascii?Q?XTJ0vVGhEbycTb8ABBeV9MVWukbJLEUrigvRc1T1eEMhWQt+gwnBRUP3CMKr?=
 =?us-ascii?Q?wjtxWe+wgHha0kmhXoTq4QK9Z93NERbXy2RxKx4LgjLdtyzE/S/4hAhwlODr?=
 =?us-ascii?Q?QFA1kDwuFFS/VpDYAxhkgTSDpr0NZ74fRNRAPfWqOF3TCsJsVAPfqNS3mcDJ?=
 =?us-ascii?Q?NutLytcTWAGJZw34Hy3q6lb7Z0h9ZZAfULWkHVK5TmnL4jqHNxnNyrzrjQAw?=
 =?us-ascii?Q?3AcEMLfnaJeCPTTH8IAVAn32k0aMjk/xXQeIpW5Gb8K2h6TfXIVbCLw7yVW2?=
 =?us-ascii?Q?LC3gMcUVl+zWQSZgMQJAiUxv4Pjf8qVB6yClVn9k+MJMIEUPWjWnejwZnQSn?=
 =?us-ascii?Q?l49U24n+Zb286tpCdbrxfSr3rtfhAXCTSISlXel2NdaePj/bGXUYNItsMlb2?=
 =?us-ascii?Q?LSgJ9fUrDYuYWHS3GDtSMcp8J2kNu74eq0w4QFsHdhWmBk8IRx50GcqHBdyT?=
 =?us-ascii?Q?074KkzBmxZB7lXhMLxs5obwSc6lGRBnc/1wTj92JDxAH51sycNw38rDECODk?=
 =?us-ascii?Q?Ne7NNSTsnw4XYeAGmjrT3l2GYJT2CaDRDET5FSBSM3zoOq+L+ezldE/jiVxK?=
 =?us-ascii?Q?l7DO3S/uuZl9lntt6SyP6rq8IDjO0S+E5AQLRFrWcPEH9XQk5Ht9+JBbxmu2?=
 =?us-ascii?Q?m6Zo39mO+NZpM1Xs5sENzKXx3mqWZBEhwXy73Lio1W0aoLXwAoMWB6ZOIpCx?=
 =?us-ascii?Q?XLBM82VaPh8JbJzwvHfqRooA87pQX3WFS+wOda+z09/+bycPJT4plv1RCqQ1?=
 =?us-ascii?Q?X0h5lqMt557NXEqQ9gAclxIT/y5mcMNdex+q5z96kIOdC/kFAMLWP1TnjYkF?=
 =?us-ascii?Q?D+S5qMIVxrvk0MjnMe1mWApoE/L+5H1hQw3k3DBbcj5GbVCJhT88dd/rkv37?=
 =?us-ascii?Q?CXW1JaXpKtAiKnoPA0OihKGMFvUNL6C2x2r/42qkjBXXSNuk2DwJkY4Ay1Gx?=
 =?us-ascii?Q?S/HY111sEC1qf5HpZ+ILsYD9rwHS6ylXZ6aWZaZO/q5G5uIhMbFC61sDTA8m?=
 =?us-ascii?Q?SNKQf1h8vXhU2Q44le6ko0pfgDXptxtx4+vMZ9QjE+sT80GQgaMoTQv5xzsZ?=
 =?us-ascii?Q?YgE64793HE1FKAogoX8xLLaqXSo3yfZenji4NspPUiZEwTqaEL3x4ivH8J2U?=
 =?us-ascii?Q?1VTQm5eiZWa3U3QRNSY+6iSQ+1A5Ty/4ltUCGXhedlz6D990osvUGNZg9rWD?=
 =?us-ascii?Q?rQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3040ab-5044-42a6-96f2-08ddd4f55653
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 14:27:13.6238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8uvnlupM0pb10qTGycvY/laOaKOiGW9I4L+ayckWn65EwGkLgJ2v/HK2UCUAVULEdAcqGNZrMVYiIOEEc8qGX85XgUO8Lo3Cv50j0Z7HAig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4019
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
>>From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>Sent: Wednesday, August 6, 2025 3:34 PM
>>To: Huhulea, Nicusor Liviu (FT FDS CES LX PBU 1)
>><nicusor.huhulea@siemens.com>
>>Cc: imre.deak@intel.com; stable@vger.kernel.org; dri-
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
>>On Wed, Aug 06, 2025 at 12:02:02PM +0000, nicusor.huhulea@siemens.com
>>wrote:
>>>
>>>
>>> >>-----Original Message-----
>>> >>From: Imre Deak <imre.deak@intel.com>
>>> >>Sent: Tuesday, August 5, 2025 6:20 PM
>>> >>To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> >>Cc: Huhulea, Nicusor Liviu (FT FDS CES LX PBU 1)
>>> >><nicusor.huhulea@siemens.com>; stable@vger.kernel.org; dri-
>>> >>devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
>>> >>cip-dev@lists.cip- project.org; shradhagupta@linux.microsoft.com;
>>> >>jouni.hogander@intel.com; neil.armstrong@linaro.org;
>>> >>jani.nikula@linux.intel.com; maarten.lankhorst@linux.intel.com;
>>> >>mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com;
>>> >>daniel@ffwll.ch; joonas.lahtinen@linux.intel.com;
>>> >>rodrigo.vivi@intel.com; laurentiu.palcu@oss.nxp.com; Hombourger,
>>> >>Cedric (FT FDS CES LX) <cedric.hombourger@siemens.com>; Bobade,
>>> >>Shrikant Krishnarao (FT FDS CES LX PBU 1)
>>> >><shrikant.bobade@siemens.com>
>>> >>Subject: Re: [PATCH] drm/probe-helper: fix output polling not
>>> >>resuming after HPD IRQ storm
>>> >>
>>> >>On Tue, Aug 05, 2025 at 01:46:51PM +0300, Dmitry Baryshkov wrote:
>>> >>> On Mon, Aug 04, 2025 at 11:13:59PM +0300, Nicusor Huhulea wrote:
>>> >>> > A regression in output polling was introduced by commit
>>> >>> > 4ad8d57d902fbc7c82507cfc1b031f3a07c3de6e
>>> >>> > ("drm: Check output polling initialized before disabling") in
>>> >>> > the 6.1.y stable
>>> >>tree.
>>> >>> > As a result, when the i915 driver detects an HPD IRQ storm and
>>> >>> > attempts to switch from IRQ-based hotplug detection to polling,
>>> >>> > output polling
>>> >>fails to resume.
>>> >>> >
>>> >>> > The root cause is the use of dev->mode_config.poll_running. Once
>>> >>> > poll_running is set (during the first connector detection) the
>>> >>> > calls to drm_kms_helper_poll_enable(), such as
>>> >>> > intel_hpd_irq_storm_switch_to_polling() fails to schedule
>>> >>> > output_poll_work as
>>> >>expected.
>>> >>> > Therefore, after an IRQ storm disables HPD IRQs, polling does
>>> >>> > not start,
>>> >>breaking hotplug detection.
>>> >>>
>>> >>> Why doesn't disable path use drm_kms_helper_poll_disable() ?
>>> >>
>>> >>In general i915 doesn't disable polling as a whole after an IRQ
>>> >>storm and a 2 minute delay (or runtime resuming), since on some
>>> >>other connectors the polling may be still required.
>>> >>
>>> >>Also, in the 6.1.y stable tree drm_kms_helper_poll_disable() is:
>>> >>
>>> >>        if (drm_WARN_ON(dev, !dev->mode_config.poll_enabled))
>>> >>                return;
>>> >>
>>> >>
>>> >> cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
>>> >>
>>> >>so calling that wouldn't really fix the problem, which is clearly
>>> >>just an incorrect backport of the upstream commit 5abffb66d12bcac8 ("=
drm:
>>> >>Check output polling initialized before disabling") to the v6.1.y
>>> >>stable tree by commit 4ad8d57d902f ("drm: Check output polling
>>> >>initialized before disabling") in v6.1.y.
>>> >>
>>> >>The upstream commit did not add the check for
>>> >>dev->mode_config.poll_running in drm_kms_helper_poll_enable(), the
>>> >>condition was only part of the diff context in the commit. Hence
>>> >>adding the condition in the 4ad8d57d902f backport commit was incorrec=
t.
>>> >>
>>> >>> > The fix is to remove the dev->mode_config.poll_running in the
>>> >>> > check condition, ensuring polling is always scheduled as requeste=
d.
>>> I'm not a full-time kernel developer, but I spent some time trying to r=
eally
>>understand both the rationale and the effects of commit "Check output pol=
ling
>>initialized before disabling."
>>> Here's how I see the issue:
>>> That commit was introduced mainly as a defensive measure, to protect
>>> drivers such as hyperv-drm that do not initialize connector polling.
>>> In those drivers, calling drm_kms_helper_poll_disable() without proper
>>> polling setup could trigger warnings or even stack traces, since there
>>> are no outputs to poll and the polling helpers don't apply.  From what
>>> I understand, the poll_running variable was added to prevent cases
>>> where polling was accidentally disabled for drivers that were never
>>> set up for it. However, this fix ended up creating a new class of
>>> breakage, which I have observed and describe here.
>>
>>
>>It was added to implement the very simple logic: If something isn't initi=
alized,
>>enabling or disabling it is an error. If something isn't enabled, disabli=
ng it is an
>>error. If something isn't disabled, enabling it is an error.
>>
>>>
>>> To me, the core logic should be simple: if polling is needed, then we s=
hould
>>allow it to proceed (regardless of whether it's been scheduled previously=
).
>>>
>>> Looking at the  drm_kms_helper_poll_disable() if (drm_WARN_ON(dev,
>>> !dev->mode_config.poll_enabled))
>>>     return;
>>>
>>> If the driver never enabled polling (that is, drm_kms_helper_poll_enabl=
e() was
>>never called), then the disable operation is effectively a no-op-totally =
safe for
>>drivers like hyperv-drm.
>>>
>>> And in the enable function drm_kms_helper_poll_enable(..):
>>>         if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
>>> -           !drm_kms_helper_poll || dev->mode_config.poll_running)
>>> +           !drm_kms_helper_poll)
>>>                 return;
>>
>>Why?
Then we have two perspectives/views and I acknowledge them both:
A: My view is that "if pooling is needed, then just poll" and I consider to=
 be the pragmatic way and robust in the face of the hardware. If the state =
needs to be active, ensure it's active regardless of previous state.
>>
>>> The main thing being guarded here is whether polling has actually been =
initialized:
>>> 1.For polling drivers like i915, removing poll_running from the enable
>>> path is both safe and necessary: it fixes the regression with HPD
>>> polling after IRQ storms
>>
>>I believe in paired calls. If you want to use drm_kms_helper_poll_enable(=
), it should
>>be previously drm_kms_helper_poll_disable()d. If you have manually disabl=
ed the
>>IRQ, it should also be manually enabled.
>>
>>Pairing the calls makes life much much easier.
B: Totally agree with you that strict pairing of enable/disable calls has m=
any advantages.

This brings us to the key question: What should change - the API, or i915?
And based on what Imre described regarding i915's design, and as much as I =
reviewed and understood myself, i915 by design purposefully triggers pollin=
g dynamically in response to disabling
IRQs, reflecting the real hardware behavior. I believe that requiring stric=
t paring of enable/disable calls would complicate i915's hotplug logic and =
as this bug demonstrates could lead to real regressions in production syste=
ms.

My option would be the pragmatic behavior. For LTS and stable kernels I fav=
or fixing the immediately observed regression, even if that means relaxing =
the strictness of the DRM helper. And later LTS should have a fuller upstre=
am refactor (such as with drm_kms_helper_poll_reschedule(),  other improvem=
ents, etc) can be safely backported.


Nicu
>>
>>> 2.For non-polling drivers like hyperv-drm, the existing checks on
>>> poll_enabled in both enable and disable functions are sufficient.
>>> Removing poll_running doesn't affect these drivers-they don't go
>>> through the polling code paths, so no polling gets scheduled or
>>> canceled by mistake
>>>
>>> Therefore based on my understanding and testing removing poll_running g=
uard
>>not only fixes a real bug but also does not introduce new regressions for=
 drivers
>>that don't use output polling.
>>
>>--
>>With best wishes
>>Dmitry
