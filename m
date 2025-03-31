Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BCDA75E10
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 05:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A258510E0E3;
	Mon, 31 Mar 2025 03:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="bR76uBEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11020111.outbound.protection.outlook.com [52.101.51.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD2210E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 03:04:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8no6IBx0xRULhbvjt+sQTW73StfrqUgG1XaVLLhebEcpVCkGHtKCL9xBp4P37fM0FdP4lOX30RGnK9ySfwSyDDhAGU0lTraT3jT9Vk3+LWAIBJtNTOHUj+cfXu/TFxLYUk7WUbDyMJnN7nQHqcc4ROEYh0eSubIBQtzOvXxHiOxv/f9SkSpAi0DJX0gPE3+Nb3ov/e9Xb9rfK9khEEHqZYdllhwwiz4KPfTj83Do0o4IcKVMZpH6G6DFnEfdlCWaEkFziQh3+uJxDBA0pmTQqVrSPemq+k64kT3cA5ekPtCQwt6ONLJvi3ACfh3FWwDjck11d1BzK4HfmQHOOF3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xSgJw/hjZwXotfaLcDs3IZPg6DJxPOfnceyqjbCLYg=;
 b=P/7nAbaHhXiL/I7WfDD9fbEzATDU5vzM1CMoxmNIPah+/COzSe8PhKq/CREYFOaDW8a1fNsJOhyZKSkScqHFE5g86IpauiHK5XVkzjG0KT0832sGtvrf+/y4oYcLj66ndqZqR03BSIXou1gC5Y8KAADn11Vmp6BD6sCN0pCRVG6lRrkDmaMnGKVJGtVUbcIslGsGVmnc4SDFH1CiKPb3VDoftp2dBp3hxc8BGy+QnPM68VORvs/2Ngm30mJo8TFxJHAzrF+YwnrNqumlmdfZfzKsZUzMcjzmrp/l+Iv7Z70Sis0Q5NI0V0X2ms3aKr0g/Aj9zuNq2RRM6rtOhQXUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xSgJw/hjZwXotfaLcDs3IZPg6DJxPOfnceyqjbCLYg=;
 b=bR76uBEsXWw5AsjVi1n/R+rJ7MaTIUFq7/TqhV/TFVmZbx1EKU9IQF4+KKkI/SQTbfYQC1/X/Zh2dWxYad/bCQ6SEyTCzN793tJzWr20LaxP0JJjctnZVWehKyGsIcOrmdHI0vS3g3wC+fJAScmuBSXf+yp01X5qLImU3f8Xp+M=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BL0PR04MB6530.namprd04.prod.outlook.com (2603:10b6:208:1c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 03:04:07 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%4]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 03:04:07 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bernie Liang <bliang@analogixsemi.com>,
 Qilin Wen <qwen@analogixsemi.com>, "treapking@google.com"
 <treapking@google.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge:anx7625: Enable DSC feature
Thread-Topic: [PATCH] drm/bridge:anx7625: Enable DSC feature
Thread-Index: AQHbfhObtNW0jClvAEuhLVsv/0abp7NFM1wAgAFJ7rCAADLEAIAAAxcAgAAdgACAABDRsIAAFbeAgASMgPCADf400IABNdoAgAAmPJCAAIKHgIABBQaAgAA3TACAKlTuYIAFSCUAgACYH6A=
Date: Mon, 31 Mar 2025 03:04:07 +0000
Message-ID: <BY5PR04MB673907E1BDED253B27C0C71FC7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <BY5PR04MB67393C2835A9B1E2D088EDC1C7FE2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <7eszb6csnmdrswtbvf6cx7wraplcxclnleo7oj35mf624o43ph@yziar2frrero>
 <BY5PR04MB673962A7C78CDE3AE605C4D2C7FB2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <BY5PR04MB673994A9BBEB1E619C7BC2BFC7C22@BY5PR04MB6739.namprd04.prod.outlook.com>
 <7now47ze2aikepvrf66bxogsw65aid4cta7ociqgnptt5nnalk@2dhmbhf5er6a>
 <BY5PR04MB6739C88817766BE8F79DFDB4C7CD2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <27ymk72vgx5nsnkkhj5knzwpcupspkpc67bzoxx7gw35l7rnhg@sfbygptq5bqs>
 <BY5PR04MB67392650EDC863C839779B45C7CC2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <CAA8EJprPfPkZS5Phfz==z3mNuAvZ5p1_4weg1s3k9DT-LkGeQw@mail.gmail.com>
 <BY5PR04MB673967BE07677050E5423502C7A12@BY5PR04MB6739.namprd04.prod.outlook.com>
 <zadaot6b4vmidofrjiboozhqykgqld4opyyaou55fn3d7ty4pc@eo4ewkmaeq5d>
In-Reply-To: <zadaot6b4vmidofrjiboozhqykgqld4opyyaou55fn3d7ty4pc@eo4ewkmaeq5d>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|BL0PR04MB6530:EE_
x-ms-office365-filtering-correlation-id: 3a372def-a77d-44fe-74e9-08dd7000b3b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KaZxH+VcU1pWcZY3vA6srdppwgwIDpgNHnPlg2PEsLQ2n68bhWMeLp2eyHq0?=
 =?us-ascii?Q?mnNKHC7+zSd/hKrEJvuJ0MPwYN6jR2DplBxEFl7hoiP1BrZSJOfpxHZjjtp0?=
 =?us-ascii?Q?s4EICLLWoLRDHAIIgfPSJiRr3lN7wLzluEUOQNYRGKtgH1SrgfOsOfC1+gMP?=
 =?us-ascii?Q?qCDtb0rly7U0WpCRzsQWJJGmZEtyAGGkEOHjngGMcGGAgcJP7CS5WvLY6lp1?=
 =?us-ascii?Q?OukuCmzwfOdYs3HJ539sgF1hEKFVtGUb4dUE4s2omBJP5roz13/Tq5/+Y0Ag?=
 =?us-ascii?Q?4c2yZS2np/CsbeZdJPHCbkD/5tNDWFvzacHW7F+qka+Dr+SWesglKxWUbq/L?=
 =?us-ascii?Q?bUJvWT/CRIZ1JQNzvMYnCT9dpnXKFo4100BYyTkmXuWiXvbshmNDMEpNuJOq?=
 =?us-ascii?Q?F1VRVqpr7tWy2FoBRVziyvosYK9pKqcZVxwV81gqMiT5cfGFa/wW8fDxdHq1?=
 =?us-ascii?Q?ScDJKtGtF6p5LYCz0E4xraGGDokqKCW0zTWs3PCr0wtE/zFQZ5EOXP5qfTZU?=
 =?us-ascii?Q?Rxa3yPo+iE3UNwOWIOQ/mUa2HiGwUYd2SnKYghAf9rfemF1GbfS70Z9fjNLo?=
 =?us-ascii?Q?Zq+N62UR3TU+Ra9VrvpTtiXMWhVK8/6iEU8qw4iKtO1Hy4kANpgKSz8qbsXb?=
 =?us-ascii?Q?T+OCfNH6HqI2tGQcPQSbtiWorfocvAx5MvGWgHdPJ5cxdNAcm+pxUBZwaovP?=
 =?us-ascii?Q?1K3OaKYusRIEoUq2Lfb8rFqXwQ+rMId7tPxjNs1qkIcuKwlbtpCXmE3t69Cd?=
 =?us-ascii?Q?I/te5QV4hcrZiKv8jMrztzAe7Q8ejWIIEEkEw8KwXYUE+qiHAzn+hJeV+DD6?=
 =?us-ascii?Q?qe34u/u72mwLUNF+1U3MAd0wUrVh3sMUnm23ySb0+sD5pAGccPbVMyF74ZVV?=
 =?us-ascii?Q?xRHShrI5yAsI5e48E+kQNSoR+z+TnrJ0XQrGReCc2+zCD9ouagiuId2KxMCG?=
 =?us-ascii?Q?IA+2oB9hdj38vp67ImJP5slpxswAMvmI2LldSu7TZRdLh4DdJUBUhVMqEZCV?=
 =?us-ascii?Q?okbFA+0gm2HieAChBLDAyRKU4GzcnrJPBXGfsvALQheWg7tBb9x5fq6WASIz?=
 =?us-ascii?Q?gJNie2O0v/jGfjwobhT2sROchDqU3IBZVzHLoRjzC2fXR5Et/tOkbb9dulpY?=
 =?us-ascii?Q?lAXIXrkXeCXkH6WOTxAiGRNyR9yUm5vW/sWvTpVupEaa4ZK5hYREFf1phDRH?=
 =?us-ascii?Q?B9R8TKkLAZFUm0+h4gBwa5tpDydBwwe3OEsIp0q2gwutkengcNcl1GB1UaXN?=
 =?us-ascii?Q?j1xvUj8ATZVkHk8TMmKEkq3pTEeVgGYMJlNnL727Zo02UlTrSTM7iEzaebU3?=
 =?us-ascii?Q?E1vjK4M8uyvHIjKfPK4JxmcS57B7PKYJon3CnQSSFufcZ/HkVuFbWyepJrML?=
 =?us-ascii?Q?4qIWqLHrPFFB5ubmYKcmH8vY3lKM5ZVJtKV5Z66ZB9ip+l8SNSrIYdG8t7zY?=
 =?us-ascii?Q?oviQ6+DZWWMn073lTR9TlLB0GsoZ1mnW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3FRz1UIcoqPzs8A7IXtOBrTYAGRxMdGfnz3j0dhG3AKvSs/OW9y+u8k+7M1W?=
 =?us-ascii?Q?ncDW96kUGng7LRuvoHDeJM/jtjq92VpnkByNziGqTw/uAQjZz+ewlwEsqz61?=
 =?us-ascii?Q?p5/hdzaL3ZsTlikxdbLmuddH8d5RueHmIcsEkI2Lk68/RTyE+wK35ATN4P/o?=
 =?us-ascii?Q?snsUppPCSFMVuvQbOCES+Vc4OEwbJh42LD/djWXYfjByZMI4SCV6l0Dz/F0L?=
 =?us-ascii?Q?DiICBhKS9a7w4R1Ut0wdtgJEwLMoDO2ehlfFH/KLO71ZyqxZ2cqqYY8waPAi?=
 =?us-ascii?Q?mPMcX/BNnE/HQeQRo8NAkxDY1MPeN7qfQMlzy13/T8P/IkeGzLn5X3YlRSN/?=
 =?us-ascii?Q?J14N5MJrXzH+dxMWsjbSLIavOqmrMsg51OJdxP3RgY+I40eZzdyvxEiFEmO/?=
 =?us-ascii?Q?nZqoWdbSeKOYm3BpU8yut8PcSNbeb9hNBja/xC74+VGAZ0Z2OgpYi2aLNFZo?=
 =?us-ascii?Q?4w7VZWJ5VwOZaKR2HkTljb3yuYVhZ9k00ac2zjI0p8Gq4NhhdbYbswwk7KrU?=
 =?us-ascii?Q?lY5r3a/qnCpcMdGeb1+LI+RlFmrKspiMHrw/Aasx1774isARjwjsCzJMcuJ8?=
 =?us-ascii?Q?sWshfHIzuSFbknkSWL+K3+7cUAtOYwjw+4hxQmJrBtq5hFJuQjZuSETvoY3k?=
 =?us-ascii?Q?tmmrEH5L5o+vRW2QsyOLEV+WWrRc/5NKY2q5a3yh+x/emwU2PMS6GcrHrQms?=
 =?us-ascii?Q?B9I0gGJV4BVKRaGOTDVrG7plc82TjZu5q5csabOV0K4dMYNSeg7Fq0pcnNMm?=
 =?us-ascii?Q?QEzWVra4fSW6pJme+DMXNjIAaiQ/OHiRyxQZMSj5Rkc0JwrKfuErjiownwxc?=
 =?us-ascii?Q?6Sc7uj0aALx6xb0Vw/q9gM95XnN9J91EiYSwZw1mbI8T1SRmidjO7o83KHrY?=
 =?us-ascii?Q?Jdj+UcfHP4yt3ywZkRJLTDOIKBd1QkfjtcYqg8wp/oFyVVa6BW2/r+I7rthw?=
 =?us-ascii?Q?OV7LxQ0avs+3QzXL8GVxSFQvi7FoYeWAdfnb2WLn7/rhCtN0AnkPPxm4JV3V?=
 =?us-ascii?Q?n4MUBxb7OfhNbVCDdCIgBLLRXiU3Uy/EBphP9O/bnp6jw/x4IR3dxeVHJbLm?=
 =?us-ascii?Q?bPIDTgxhDrH4O10xqdrzWm/IKm3L2Y6Abxgt8U6HxEHOAx0a7kl1LAN3F8P7?=
 =?us-ascii?Q?/PsEE3FxzDqnEKyz9nZKvfB3Atka72/ifhokCDPy2MUjF35ybn12UpPpKUjk?=
 =?us-ascii?Q?nE8gMsLQaUYBS2xqN1xV3gh87nH8V66R5uU2mSFk7PGawo0Z30E9/xQb0pPK?=
 =?us-ascii?Q?efWJH2ObpxV8GAvqgvv34GptGAq2wXb4vVP+37CmpCNeA84gxyl+uY74jrCR?=
 =?us-ascii?Q?BX5Xss0yTt09WMzkuKvjZxTBSgnve1/eX/6swIaFmiM0hd6IhSPYhQpvLB9f?=
 =?us-ascii?Q?wktSV07FPprC/ywon79U1l1yQdpVIqhBAmCJZHgP6/dfmzyBopE2RcZ+CGXh?=
 =?us-ascii?Q?sT/Md7ELnEkIurYmQImKBmWd6/Ua033WRlNn2C99N6RRh7YdT4aD0c3Y+zKO?=
 =?us-ascii?Q?3NrfrTGl4lS0bRF1PwdQiPDDQ9dGLVMIiRnHTS2xPBtPbP4NA2eH+yCyrMGJ?=
 =?us-ascii?Q?jnjB85ncldabhLxGOCsb7phVWuuzdrKuctcj0XAM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a372def-a77d-44fe-74e9-08dd7000b3b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 03:04:07.3539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Afj7OE5bA0eXTIUb5Ryu/wGq0tnLTuz20NWXkd+9obaAdfLGybPsB0BcvdwsSmlFx9LSz9p6pNjruuKom0+OnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6530
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

> > > > > > > > > > > > > > > > From: Dmitry Baryshkov
> > > > > > > > > > > > > > > > <dmitry.baryshkov@linaro.org>
> > > > > > > > > > > > > > > > Sent: Thursday, February 13, 2025 9:04 PM
> > > > > > > > > > > > > > > > To: Xin Ji <xji@analogixsemi.com>
> > > > > > > > > > > > > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>=
; Neil
> > > > > > > > > > > > > > > > Armstrong <neil.armstrong@linaro.org>; Robe=
rt Foss
> > > > > > > > > > > > > > > > <rfoss@kernel.org>; Laurent Pinchart
> > > > > > > > > > > > > > > > <Laurent.pinchart@ideasonboard.com>; Jonas
> Karlman
> > > > > > > > > > > > > > > > <jonas@kwiboo.se>; Jernej Skrabec
> > > > > > > > > > > > > > > > <jernej.skrabec@gmail.com>; Maarten Lankhor=
st
> > > > > > > > > > > > > > > > <maarten.lankhorst@linux.intel.com>; Maxime
> Ripard
> > > > > > > > > > > > > > > > <mripard@kernel.org>; Thomas Zimmermann
> > > > > > > > > > > > > > > > <tzimmermann@suse.de>;
> > > > > > > > > > > > > > David
> > > > > > > > > > > > > > > > Airlie <airlied@gmail.com>; Simona Vetter
> > > > > > > > > > > > > > > > <simona@ffwll.ch>; Bernie Liang
> > > > > > > > > > > > > > > > <bliang@analogixsemi.com>; Qilin Wen
> > > > > > > > > > > > > > > > <qwen@analogixsemi.com>; treapking@google.c=
om;
> > > > > > > > > > > > > > > > dri-devel@lists.freedesktop.org; linux-
> > > > > > > > > > > > > > > > kernel@vger.kernel.org
> > > > > > > > > > > > > > > > Subject: Re: [PATCH] drm/bridge:anx7625: En=
able
> > > > > > > > > > > > > > > > DSC feature
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > PLease remove such splats, use something more s=
ensible.
> > > > > > > > > > > > > OK, I'll change the subject
> > > > > > > > > > > >
> > > > > > > > > > > > It's not about the subject. Compare just "ABC DEF w=
rote:"
> > > > > > > > > > > > and your quatation header.
> > > > > > > > > > > Sorry, these message is automatically added by Outloo=
k, I'll
> > > remove it.
> > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Thu, Feb 13, 2025 at 08:33:30PM +0800, X=
in Ji
> wrote:
> > > > > > > > > > > > > > > > > As anx7625 MIPI RX bandwidth(maximum 1.5G=
bps
> per
> > > > > > > > > > > > > > > > > lane) and internal pixel clock(maximum 30=
0M)
> > > limitation.
> > > > > > > > > > > > > > > > > Anx7625 must enable DSC feature while MIP=
I
> > > > > > > > > > > > > > > > > source want to output 4K30
> > > > > > > > > > resolution.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > This commit message is pretty hard to read =
and
> > > > > > > > > > > > > > > > understand for a non-native speaker. Please
> > > > > > > > > > > > > > > > consider rewriting it so that it is easier =
to
> > > > > > > > > > > > > > understand it.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Thanks for the review, sorry about that, I'll
> > > > > > > > > > > > > > > rewriting the commit message
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.c=
om>
> > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.=
c | 300
> > > > > > > > > > > > > > > > > ++++++++++++++++++----
> > > > > > > > > > > > > > > > >
> > > > > > > ++++++++++++++++++drivers/gpu/drm/bridge/analogix/anx7625.
> > > > > > > > > > > > > > > > > ++++++++++++++++++h
> > > > > > > > > > > > > > > > > ++++++++++++++++++|
> > > > > > > > > > > > > > > > > 32 +++
> > > > > > > > > > > > > > > > >  2 files changed, 284 insertions(+), 48
> > > > > > > > > > > > > > > > > deletions(-)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > > a/drivers/gpu/drm/bridge/analogix/anx7625=
.c
> > > > > > > > > > > > > > > > > b/drivers/gpu/drm/bridge/analogix/anx7625=
.c
> > > > > > > > > > > > > > > > > index 4be34d5c7a3b..7d86ab02f71c 100644
> > > > > > > > > > > > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx=
7625.c
> > > > > > > > > > > > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx=
7625.c
> > > > > > > > > > > > > > > > > @@ -22,6 +22,7 @@
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  #include <drm/display/drm_dp_aux_bus.h>
> > > > > > > > > > > > > > > > > #include <drm/display/drm_dp_helper.h>
> > > > > > > > > > > > > > > > > +#include <drm/display/drm_dsc_helper.h>
> > > > > > > > > > > > > > > > >  #include <drm/display/drm_hdcp_helper.h>
> > > > > > > > > > > > > > > > > #include <drm/drm_atomic_helper.h>  #incl=
ude
> > > > > > > > > > > > > > > > > <drm/drm_bridge.h> @@
> > > > > > > > > > > > > > > > > -476,6
> > > > > > > > > > > > > > > > > +477,138 @@ static int
> > > > > > > > > > > > > > > > > +anx7625_set_k_value(struct anx7625_data
> > > > > > > > > > > > > > > > > +*ctx)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > MIPI_DIGITAL_ADJ_1, 0x3D); }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +static int anx7625_set_dsc_params(struct
> > > > > > > > > > > > > > > > > +anx7625_data *ctx)
> > > > > > > {
> > > > > > > > > > > > > > > > > +     int ret, i;
> > > > > > > > > > > > > > > > > +     u16 htotal, vtotal;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     if (!ctx->dsc_en)
> > > > > > > > > > > > > > > > > +             return 0;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     /* Htotal */
> > > > > > > > > > > > > > > > > +     htotal =3D ctx->dt.hactive.min + ct=
x-
> > > > > >dt.hfront_porch.min +
> > > > > > > > > > > > > > > > > +             ctx->dt.hback_porch.min + c=
tx-
> > > >dt.hsync_len.min;
> > > > > > > > > > > > > > > > > +     ret =3D anx7625_reg_write(ctx, ctx-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +                             HORIZONTAL_=
TOTAL_PIXELS_L,
> > > htotal);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +                              HORIZONTAL=
_TOTAL_PIXELS_H,
> > > htotal >>
> > > > > 8);
> > > > > > > > > > > > > > > > > +     /* Hactive */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +                              HORIZONTAL=
_ACTIVE_PIXELS_L,
> > > > > > > > > > > > > > > > > +                              ctx->dt.ha=
ctive.min);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +                              HORIZONTAL=
_ACTIVE_PIXELS_H,
> > > > > > > > > > > > > > > > > +                              ctx->dt.ha=
ctive.min >> 8);
> > > > > > > > > > > > > > > > > +     /* HFP */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +                              HORIZONTAL=
_FRONT_PORCH_L,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hf=
ront_porch.min);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +                              HORIZONTAL=
_FRONT_PORCH_H,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hf=
ront_porch.min >> 8);
> > > > > > > > > > > > > > > > > +     /* HWS */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +                              HORIZONTAL=
_SYNC_WIDTH_L,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hs=
ync_len.min);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +                              HORIZONTAL=
_SYNC_WIDTH_H,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hs=
ync_len.min >> 8);
> > > > > > > > > > > > > > > > > +     /* HBP */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +                              HORIZONTAL=
_BACK_PORCH_L,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hb=
ack_porch.min);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +                              HORIZONTAL=
_BACK_PORCH_H,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hb=
ack_porch.min >> 8);
> > > > > > > > > > > > > > > > > +     /* Vtotal */
> > > > > > > > > > > > > > > > > +     vtotal =3D ctx->dt.vactive.min + ct=
x-
> > > >dt.vfront_porch.min
> > > > > +
> > > > > > > > > > > > > > > > > +              ctx->dt.vback_porch.min + =
ctx-
> > > >dt.vsync_len.min;
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > + ctx->i2c.tx_p2_client,
> > > > > > > > > > > > TOTAL_LINES_L,
> > > > > > > > > > > > > > > > > +                              vtotal);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > + ctx->i2c.tx_p2_client,
> > > > > > > > > > > > TOTAL_LINES_H,
> > > > > > > > > > > > > > > > > +                              vtotal >> =
8);
> > > > > > > > > > > > > > > > > +     /* Vactive */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > + ctx->i2c.tx_p2_client,
> > > > > > > > > > > > ACTIVE_LINES_L,
> > > > > > > > > > > > > > > > > +                              ctx->dt.va=
ctive.min);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > + ctx->i2c.tx_p2_client,
> > > > > > > > > > > > ACTIVE_LINES_H,
> > > > > > > > > > > > > > > > > +                              ctx->dt.va=
ctive.min >> 8);
> > > > > > > > > > > > > > > > > +     /* VFP */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + VERTICAL_FRONT_PORCH,
> > > > > > > > > > > > > > > > > + ctx-
> > > > > > > > > > >dt.vfront_porch.min);
> > > > > > > > > > > > > > > > > +     /* VWS */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + VERTICAL_SYNC_WIDTH, ctx-
> > > > > > > >dt.vsync_len.min);
> > > > > > > > > > > > > > > > > +     /* VBP */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + VERTICAL_BACK_PORCH,
> > > > > > > > > > > > > > > > > + ctx->dt.vback_porch.min);
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > This code mostly duplicates
> > > > > > > > > > > > > > > > anx7625_dsi_video_timing_config() with the =
I2C
> > > > > > > > > > > > > > > > client being the only difference. Please co=
nsider
> > > > > > > > > > > > > > > > extracting a common helper to
> > > > > > > > > > write the timings.
> > > > > > > > > > > > > > > It is hard to extracting a common helper, the=
y are
> > > > > > > > > > > > > > > used different I2C slave address and timing r=
egister
> > > > > > > > > > > > > > > need divided by 3 if DSC
> > > > > > > > > > enabled.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I2C client can be a parameter. Also please comm=
ent
> > > > > > > > > > > > > > whether
> > > > > > > > > > > > > > /3 is because of bpp/bpc ratio or due to some o=
ther
> reason?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Does anx7625 support any mode other than 8bpp /=
 8bpc?
> > > > > > > > > > > > > I'll try to make a common function, anx7625 mipi =
only
> > > > > > > > > > > > > support RGB888. DSC
> > > > > > > > > > > > 8bpp.
> > > > > > > > > > > > > /3 is because of DSC ration 1:3.
> > > > > > > > > > > >
> > > > > > > > > > > > Please add this to the commit message, add a commen=
t next
> > > > > > > > > > > > to the corresponding #define and use it instead of =
/3 all over
> the
> > > > > place.
> > > > > > > > > > > OK
> > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     /* Htotal */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > + ctx->i2c.rx_p0_client,
> > > > > > > > > > > > > > TOTAL_PIXEL_L_7E,
> > > > > > > > > > > > > > > > > +                              htotal);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > + ctx->i2c.rx_p0_client,
> > > > > > > > > > > > > > TOTAL_PIXEL_H_7E,
> > > > > > > > > > > > > > > > > +                              htotal >> =
8);
> > > > > > > > > > > > > > > > > +     /* Hactive */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > +                              ACTIVE_PIX=
EL_L_7E, ctx-
> > > >dt.hactive.min);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + ACTIVE_PIXEL_H_7E, ctx->dt.hactive.min =
>>
> > > > > > > 8);
> > > > > > > > > > > > > > > > > +     /* HFP */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > +                              HORIZON_FR=
ONT_PORCH_L_7E,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hf=
ront_porch.min);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > +                              HORIZON_FR=
ONT_PORCH_H_7E,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hf=
ront_porch.min >> 8);
> > > > > > > > > > > > > > > > > +     /* HWS */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > +                              HORIZON_SY=
NC_WIDTH_L_7E,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hs=
ync_len.min);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > +                              HORIZON_SY=
NC_WIDTH_H_7E,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hs=
ync_len.min >> 8);
> > > > > > > > > > > > > > > > > +     /* HBP */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > +                              HORIZON_BA=
CK_PORCH_L_7E,
> > > > > > > > > > > > > > > > > +                              ctx->dt.hb=
ack_porch.min);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + HORIZON_BACK_PORCH_H_7E,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + ctx->dt.hback_porch.min
> > > > > > > > > > > > > > > > > + >> 8);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     /* Config DSC decoder internal blan=
k
> > > > > > > > > > > > > > > > > + timing for decoder to start
> > > > > > > > > > */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p1_client,
> > > > > > > > > > > > > > > > > +                              H_BLANK_L,
> > > > > > > > > > > > > > > > > +                              dsc_div(ht=
otal - ctx-
> >dt.hactive.min));
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p1_client,
> > > > > > > > > > > > > > > > > +                              H_BLANK_H,
> > > > > > > > > > > > > > > > > +                              dsc_div(ht=
otal -
> > > > > > > > > > > > > > > > > + ctx->dt.hactive.min)
> > > > > > > > > > > > > > > > > + >> 8);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     /* Compress ratio  RATIO bit[7:6] *=
/
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_write_and(ctx,
> > > > > > > > > > > > > > > > > + ctx->i2c.rx_p0_client, R_I2C_1,
> > > > > > > > > > > > 0x3F);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_write_or(ctx,
> > > > > > > > > > > > > > > > > + ctx->i2c.rx_p0_client,
> > > > > > > R_I2C_1,
> > > > > > > > > > > > > > > > > +                             (5 - DSC_CO=
MPRESS_RATIO) << 6);
> > > > > > > > > > > > > > > > > +     /*PPS table*/
> > > > > > > > > > > > > > > > > +     for (i =3D 0; i < PPS_SIZE; i +=3D =
PPS_BLOCK_SIZE)
> > > > > > > > > > > > > > > > > +             ret |=3D
> > > > > > > > > > > > > > > > > + anx7625_reg_block_write(ctx,
> > > > > > > > > > > > > > > > > + ctx-
> > > > > > > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + R_PPS_REG_0
> > > > > > > > > > > > > > > > > + + i, PPS_BLOCK_SIZE,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + &ctx->pps_table[i]);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     return ret; }
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +static int anx7625_timing_write(struct
> anx7625_data
> > > *ctx,
> > > > > > > > > > > > > > > > > +                             struct i2c_=
client *client,
> > > > > > > > > > > > > > > > > +                             u8 reg_addr=
, u16
> > > > > > > > > > > > > > > > > +reg_val, bool
> > > > > > > > > > > > > > > > > +high_byte) {
> > > > > > > > > > > > > > > > > +     u8 reg_data;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     if (ctx->dsc_en)
> > > > > > > > > > > > > > > > > +             reg_val =3D dsc_div(reg_val=
);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     reg_data =3D (high_byte ? (reg_val =
>> 8) :
> > > > > > > > > > > > > > > > > + reg_val) & 0xFF;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     return anx7625_reg_write(ctx, clien=
t,
> > > > > > > > > > > > > > > > > + reg_addr, reg_data); }
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Ugh, no. Calculate htotal in the calling fu=
nction
> > > > > > > > > > > > > > > > and call
> > > > > > > > > > > > > > > > anx7625_reg_write() as you were doing that =
before.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > anx7625_timing_write() is a common function, =
it was
> > > > > > > > > > > > > > > called many times, so we cannot calculate hto=
tal in it.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On the caller side. I'd suggest to inline
> > > > > > > > > > > > > > anx7625_timing_write() to make the code more ex=
plicit.
> > > > > > > > > > > > > OK.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >  static int
> > > > > > > > > > > > > > > > > anx7625_dsi_video_timing_config(struct
> > > > > > > > > > > > > > > > > anx7625_data
> > > > > > > > > > > > > > > > > *ctx) {
> > > > > > > > > > > > > > > > >       struct device *dev =3D ctx->dev; @@=
 -506,34
> > > > > > > > > > > > > > > > > +639,33 @@ static int
> > > > > > > > > > > > > > > > > anx7625_dsi_video_timing_config(struct
> > > > > > > > > > > > > > > > anx7625_data *ctx)
> > > > > > > > > > > > > > > > >       ret |=3D anx7625_write_or(ctx, ctx-
> >i2c.rx_p1_client,
> > > > > > > > > > > > > > > > >                               MIPI_LANE_C=
TRL_0,
> > > > > > > > > > > > > > > > > ctx->pdata.mipi_lanes
> > > > > > > > > > > > > > > > > - 1);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     /* Htotal */
> > > > > > > > > > > > > > > > >       htotal =3D ctx->dt.hactive.min + ct=
x-
> > > >dt.hfront_porch.min
> > > > > +
> > > > > > > > > > > > > > > > > -             ctx->dt.hback_porch.min + c=
tx-
> > > >dt.hsync_len.min;
> > > > > > > > > > > > > > > > > -     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > -                     HORIZONTAL_TOTAL_PI=
XELS_L, htotal
> &
> > > 0xFF);
> > > > > > > > > > > > > > > > > -     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > -                     HORIZONTAL_TOTAL_PI=
XELS_H,
> htotal >>
> > > 8);
> > > > > > > > > > > > > > > > > +                      ctx->dt.hback_porc=
h.min + ctx-
> > > > > >dt.hsync_len.min;
> > > > > > > > > > > > > > > > > +     /* Htotal */
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_timing_write(ctx, =
ctx-
> > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +                     HORIZONTAL_TOTAL_PI=
XELS_L, htotal,
> > > false);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_timing_write(ctx, =
ctx-
> > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +                     HORIZONTAL_TOTAL_PI=
XELS_H,
> > > > > > > > > > > > > > > > > + htotal, true);
> > > > > > > > > > > > > > > > >       /* Hactive */
> > > > > > > > > > > > > > > > > -     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > -                     HORIZONTAL_ACTIVE_P=
IXELS_L, ctx-
> > > > > > > >dt.hactive.min
> > > > > > > > > &
> > > > > > > > > > > > 0xFF);
> > > > > > > > > > > > > > > > > -     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > -                     HORIZONTAL_ACTIVE_P=
IXELS_H, ctx-
> > > > > > > > > >dt.hactive.min >>
> > > > > > > > > > 8);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_timing_write(ctx, =
ctx-
> > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + HORIZONTAL_ACTIVE_PIXELS_L,
> > > > > > > > > > > > > > > > > + ctx->dt.hactive.min,
> > > > > > > > > > > > false);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_timing_write(ctx, =
ctx-
> > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + HORIZONTAL_ACTIVE_PIXELS_H,
> > > > > > > > > > > > > > > > > + ctx->dt.hactive.min, true);
> > > > > > > > > > > > > > > > >       /* HFP */
> > > > > > > > > > > > > > > > > -     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > -                     HORIZONTAL_FRONT_PO=
RCH_L, ctx-
> > > > > > > > > > > > >dt.hfront_porch.min);
> > > > > > > > > > > > > > > > > -     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > -                     HORIZONTAL_FRONT_PO=
RCH_H,
> > > > > > > > > > > > > > > > > -                     ctx->dt.hfront_porc=
h.min >> 8);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_timing_write(ctx, =
ctx-
> > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +                     HORIZONTAL_FRONT_PO=
RCH_L,
> > > > > > > > > > > > > > > > > + ctx->dt.hfront_porch.min,
> > > > > > > > > > > > > > false);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_timing_write(ctx, =
ctx-
> > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +                     HORIZONTAL_FRONT_PO=
RCH_H,
> > > > > > > > > > > > > > > > > + ctx->dt.hfront_porch.min, true);
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Are porches also compressed? I think blanki=
ng
> > > > > > > > > > > > > > > > signal timings are transferred as is, witho=
ut
> compression.
> > > > > > > > > > > > > > > Porches not be compressed, anx7625 internal d=
igital
> > > > > > > > > > > > > > > block will multiply by 3 while enable DSC fea=
ture,
> > > > > > > > > > > > > > > so the register must
> > > > > > > > > divided by 3.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Ack
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       /* HWS */
> > > > > > > > > > > > > > > > > -     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > -                     HORIZONTAL_SYNC_WID=
TH_L, ctx-
> > > > > > > > > >dt.hsync_len.min);
> > > > > > > > > > > > > > > > > -     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > -                     HORIZONTAL_SYNC_WID=
TH_H, ctx-
> > > > > > > > > > >dt.hsync_len.min >>
> > > > > > > > > > > > 8);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_timing_write(ctx, =
ctx-
> > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +                     HORIZONTAL_SYNC_WID=
TH_L,
> > > > > > > > > > > > > > > > > + ctx->dt.hsync_len.min,
> > > > > > > > > > > > false);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_timing_write(ctx, =
ctx-
> > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +                     HORIZONTAL_SYNC_WID=
TH_H,
> > > > > > > > > > > > > > > > > + ctx->dt.hsync_len.min, true);
> > > > > > > > > > > > > > > > >       /* HBP */
> > > > > > > > > > > > > > > > > -     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > -                     HORIZONTAL_BACK_POR=
CH_L, ctx-
> > > > > > > > > > >dt.hback_porch.min);
> > > > > > > > > > > > > > > > > -     ret |=3D anx7625_reg_write(ctx, ctx=
-
> >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > -                     HORIZONTAL_BACK_POR=
CH_H, ctx-
> > > > > > > > > > >dt.hback_porch.min >>
> > > > > > > > > > > > 8);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_timing_write(ctx, =
ctx-
> > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +                     HORIZONTAL_BACK_POR=
CH_L,
> > > > > > > > > > > > > > > > > + ctx->dt.hback_porch.min,
> > > > > > > > > > > > > > false);
> > > > > > > > > > > > > > > > > +     ret |=3D anx7625_timing_write(ctx, =
ctx-
> > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > +                     HORIZONTAL_BACK_POR=
CH_H,
> > > > > > > > > > > > > > > > > + ctx->dt.hback_porch.min, true);
> > > > > > > > > > > > > > > > >       /* Vactive */
> > > > > > > > > > > > > > > > >       ret |=3D anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > ctx->i2c.rx_p2_client,
> > > > > > > > > > > > ACTIVE_LINES_L,
> > > > > > > > > > > > > > > > >                       ctx->dt.vactive.min=
); @@
> > > > > > > > > > > > > > > > > -663,9
> > > > > > > > > > > > > > > > > +795,15 @@ static int anx7625_dsi_config(=
struct
> > > > > > > > > > > > > > > > > anx7625_data *ctx)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       DRM_DEV_DEBUG_DRIVER(dev, "config
> > > > > > > > > > > > > > > > > dsi.\n");
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     /* DSC disable */
> > > > > > > > > > > > > > > > > -     ret =3D anx7625_write_and(ctx, ctx-
> >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > -                             R_DSC_CTRL_=
0, ~DSC_EN);
> > > > > > > > > > > > > > > > > +     ret =3D anx7625_set_dsc_params(ctx)=
;
> > > > > > > > > > > > > > > > > +     if (ctx->dsc_en)
> > > > > > > > > > > > > > > > > +             /* DSC enable */
> > > > > > > > > > > > > > > > > +             ret |=3D anx7625_write_or(c=
tx, ctx-
> > > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > +                                     R_D=
SC_CTRL_0, DSC_EN);
> > > > > > > > > > > > > > > > > +     else
> > > > > > > > > > > > > > > > > +             /* DSC disable */
> > > > > > > > > > > > > > > > > +             ret |=3D anx7625_write_and(=
ctx, ctx-
> > > > > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + R_DSC_CTRL_0, ~DSC_EN);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       ret |=3D anx7625_api_dsi_config(ctx=
);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > @@ -2083,6 +2221,7 @@ static int
> > > > > > > > > > > > > > > > > anx7625_setup_dsi_device(struct
> > > > > > > > > > > > > > > > anx7625_data *ctx)
> > > > > > > > > > > > > > > > >               MIPI_DSI_MODE_VIDEO_HSE |
> > > > > > > > > > > > > > > > >               MIPI_DSI_HS_PKT_END_ALIGNED=
;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +     dsi->dsc =3D &ctx->dsc;
> > > > > > > > > > > > > > > > >       ctx->dsi =3D dsi;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       return 0;
> > > > > > > > > > > > > > > > > @@ -2186,20 +2325,68 @@
> > > > > > > > > > > > > > > > > anx7625_bridge_mode_valid(struct drm_brid=
ge
> > > > > > > > > > > > > > > > *bridge,
> > > > > > > > > > > > > > > > >       struct anx7625_data *ctx =3D
> > > bridge_to_anx7625(bridge);
> > > > > > > > > > > > > > > > >       struct device *dev =3D ctx->dev;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "drm mode
> > > > > checking\n");
> > > > > > > > > > > > > > > > > +     dev_dbg(dev, "drm mode checking\n")=
;
> > > > > > > > > > > > > > > > > +     if (mode->clock > SUPPORT_PIXEL_CLO=
CK)
> > > > > > > > > > > > > > > > > +             return MODE_CLOCK_HIGH;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     if (mode->clock < SUPPORT_MIN_PIXEL=
_CLOCK)
> > > > > > > > > > > > > > > > > +             return MODE_CLOCK_LOW;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     /* Max 1200p at 5.4 Ghz, one lane, =
pixel clock
> > > 300M */
> > > > > > > > > > > > > > > > > -     if (mode->clock > SUPPORT_PIXEL_CLO=
CK) {
> > > > > > > > > > > > > > > > > -             DRM_DEV_DEBUG_DRIVER(dev,
> > > > > > > > > > > > > > > > > -                                  "drm m=
ode invalid, pixelclock
> too
> > > > > high.\n");
> > > > > > > > > > > > > > > > > +     if (mode->clock > DSC_PIXEL_CLOCK &=
&
> > > > > > > > > > > > > > > > > + (mode->hdisplay % 3 !=3D
> > > > > > > > > > > > > > > > > + 0))
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Magic number 3. Also is it actually require=
d? I
> > > > > > > > > > > > > > > > think DSC standard has no such requirement.
> > > > > > > > > > > > > > > This is anx7625 limitation, if mode->hdisplay=
 cannot
> > > > > > > > > > > > > > > be divided by 3, then display will have overl=
ap/shift
> issue.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Ack, add a comment or extend a commit message p=
lease.
> > > > > > > > > > > > > OK, I'll add a comment
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >               return MODE_CLOCK_HIGH;
> > > > > > > > > > > > > > > > > -     }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "drm mode
> > > valid.\n");
> > > > > > > > > > > > > > > > > +     dev_dbg(dev, "drm mode valid.\n");
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       return MODE_OK;  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +static void anx7625_dsc_enable(struct
> > > > > > > > > > > > > > > > > +anx7625_data *ctx, bool en)
> > > > > > > > > > {
> > > > > > > > > > > > > > > > > +     int ret;
> > > > > > > > > > > > > > > > > +     struct device *dev =3D ctx->dev;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     ctx->dsc_en =3D en;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     if (en) {
> > > > > > > > > > > > > > > > > +             ctx->dsc.dsc_version_major =
=3D 1;
> > > > > > > > > > > > > > > > > +             ctx->dsc.dsc_version_minor =
=3D 1;
> > > > > > > > > > > > > > > > > +             ctx->dsc.slice_height =3D 8=
;
> > > > > > > > > > > > > > > > > +             ctx->dsc.slice_width =3D
> > > > > > > > > > > > > > > > > + ctx->dt.hactive.min /
> > > > > > > > > > DSC_SLICE_NUM;
> > > > > > > > > > > > > > > > > +             ctx->dsc.slice_count =3D DS=
C_SLICE_NUM;
> > > > > > > > > > > > > > > > > +             ctx->dsc.bits_per_component=
 =3D 8;
> > > > > > > > > > > > > > > > > +             ctx->dsc.bits_per_pixel =3D=
 8 << 4; /* 4
> fractional
> > > > > bits */
> > > > > > > > > > > > > > > > > +             ctx->dsc.block_pred_enable =
=3D true;
> > > > > > > > > > > > > > > > > +             ctx->dsc.native_420 =3D fal=
se;
> > > > > > > > > > > > > > > > > +             ctx->dsc.native_422 =3D fal=
se;
> > > > > > > > > > > > > > > > > +             ctx->dsc.simple_422 =3D fal=
se;
> > > > > > > > > > > > > > > > > +             ctx->dsc.vbr_enable =3D fal=
se;
> > > > > > > > > > > > > > > > > +             ctx->dsc.rc_model_size =3D
> > > > > > > > > > > > > > > > > + DSC_RC_MODEL_SIZE_CONST;
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > This one is default, please drop.
> > > > > > > > > > > > > OK
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +             ctx->dsc.pic_width =3D ctx-=
>dt.hactive.min;
> > > > > > > > > > > > > > > > > +             ctx->dsc.pic_height =3D
> > > > > > > > > > > > > > > > > + ctx->dt.vactive.min;
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > These two are set on the DSC encoder side.
> > > > > > > > > > > > > OK, I'll remove it
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +             ctx->dsc.convert_rgb =3D 1;
> > > > > > > > > > > > > > > > > +             ctx->dsc.vbr_enable =3D 0;
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > A lot of this params should be coming from =
the sink
> > > device.
> > > > > > > > > > > > > > > > You have to get them from the DPCD.
> > > > > > > > > > > > > > > These parameter is just MIPI source and anx76=
25 and
> > > > > > > > > > > > > > > used only for DSC feature,
> > > > > > > > > > > > > > > Anx7625 is bridge IC, sink monitor only recei=
ve
> > > > > > > > > > > > > > > normal DP signal from anx7625, sink device di=
dn't
> > > > > > > > > > > > > > > know DSC information, no need read
> > > > > > > > > > > > DPCD.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Thanks. From you commit message it is impossibl=
e to
> > > > > > > > > > > > > > understand whether DSC happens between the host=
 and
> > > > > > > > > > > > > > your bridge or between the bridge and the monit=
or.
> > > > > > > > > > > > > I'll add more detail in commit message
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +             drm_dsc_set_rc_buf_thresh(&=
ctx->dsc);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + drm_dsc_set_const_params(&ctx->dsc);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +             ctx->dsc.initial_scale_valu=
e =3D
> > > > > > > > > > > > > > > > > + drm_dsc_initial_scale_value(&ctx-
> > > > > > > > > > > > > > >dsc);
> > > > > > > > > > > > > > > > > +             ctx->dsc.line_buf_depth =3D
> > > > > > > > > > > > > > > > > + ctx->dsc.bits_per_component +
> > > > > > > > > > 1;
> > > > > > > > > > > > > > > > > +             ret =3D
> > > > > > > > > > > > > > > > > + drm_dsc_setup_rc_params(&ctx->dsc,
> > > > > > > > > > > > DRM_DSC_1_2_444);
> > > > > > > > > > > > > > > > > +             if (ret < 0)
> > > > > > > > > > > > > > > > > +                     dev_warn(dev,
> > > > > > > > > > > > > > > > > + "drm_dsc_setup_rc_params ret %d\n", ret=
);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > + drm_dsc_compute_rc_parameters(&ctx->dsc=
);
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > You have ignored return value. Please handl=
e the
> > > > > > > > > > > > > > > > function returning an
> > > > > > > > > > > > error.
> > > > > > > > > > > > > > > OK
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > All these functions are to be called on the DSC
> > > > > > > > > > > > > > encoder side as it has to be able to infer DSC =
params.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I don't know, we co-work with MTK encoder, they n=
eed us
> > > > > > > > > > > > > to initial dsc data structure
> > > > > > > > > > > >
> > > > > > > > > > > > As I wrote, encoder should be able to influence som=
e of
> > > > > > > > > > > > those params. As such, DSC decoder should provide s=
ome
> > > > > > > > > > > > values, then DSC encoder's .pre_enable should be ab=
le to
> update
> > > > > those values (e.g.
> > > > > > > > > > > > by setting .pic_width and .pic_height and/or disabl=
ing some
> of
> > > flags).
> > > > > > > > > > > > Then the DSC encoder should fill the rest of the pa=
rams by
> > > > > > > > > > > > calling all these
> > > > > > > > > > functions. Consider how drm/msm/dsi handles it.
> > > > > > > > > > > OK, I'll check it.
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +             drm_dsc_pps_payload_pack((s=
truct
> > > > > > > > > > > > > > > > > + drm_dsc_picture_parameter_set
> > > > > > > > > > > > > > > > *)&ctx->pps_table,
> > > > > > > > > > > > > > > > > +                                      &c=
tx->dsc);
> > > > > > > > > > > > > > > > > +             dev_dbg(dev, "anx7625 enabl=
e dsc\n");
> > > > > > > > > > > > > > > > > +     } else {
> > > > > > > > > > > > > > > > > +             ctx->dsc.dsc_version_major =
=3D 0;
> > > > > > > > > > > > > > > > > +             ctx->dsc.dsc_version_minor =
=3D 0;
> > > > > > > > > > > > > > > > > +             dev_dbg(dev, "anx7625 disab=
le dsc\n");
> > > > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >  static void anx7625_bridge_mode_set(stru=
ct
> > > > > > > > > > > > > > > > > drm_bridge
> > > > > > > *bridge,
> > > > > > > > > > > > > > > > >                                   const s=
truct drm_display_mode
> > > > > *old_mode,
> > > > > > > > > > > > > > > > >                                   const s=
truct
> > > > > > > > > > > > > > > > > drm_display_mode
> > > > > > > > > > > > > > > > > *mode) @@ -2244,6 +2431,11 @@ static void
> > > > > > > > > > > > > > > > > anx7625_bridge_mode_set(struct
> > > > > > > > > > > > > > > > drm_bridge *bridge,
> > > > > > > > > > > > > > > > >       DRM_DEV_DEBUG_DRIVER(dev,
> > > > > > > > > "vsync_end(%d),vtotal(%d).\n",
> > > > > > > > > > > > > > > > >                            mode->vsync_en=
d,
> > > > > > > > > > > > > > > > >                            mode->vtotal);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     if (mode->clock > DSC_PIXEL_CLOCK)
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > What if the sink doesn't support DSC? The d=
ecision
> > > > > > > > > > > > > > > > whether to enable DSC or not should be happ=
ening
> > > > > > > > > > > > > > > > in the
> > > > > > > atomic_check().
> > > > > > > > > > > > > > > > Likewise mode_valid should be able to check=
 if
> > > > > > > > > > > > > > > > your bridge and the sink can agree on DSC p=
arams
> > > > > > > > > > > > > > > > and reject modes if they can
> > > > > > > > > > not.
> > > > > > > > > > > > > > > Anx7625 is bridge IC, it receive MIPI data an=
d DP
> > > > > > > > > > > > > > > output, DSC only exist between SOC and Anx762=
5, sink
> > > > > > > > > > > > > > > monitor only receive normal DP signal from an=
x7625,
> > > > > > > > > > > > > > > there is no compression at DP output, so no n=
eed to
> > > > > > > > > > > > > > check sink device.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Well. Then the same question applies in the oth=
er
> direction:
> > > > > > > > > > > > > > what if the host doesnt' support DSC?
> > > > > > > > > > > > > If SOC host doesn't support DSC, then cannot disp=
lay
> > > > > > > > > > > > > 4K30, currently, only debug with MTK DSI encoder.
> > > > > > > > > > > >
> > > > > > > > > > > > The bridge is a generic driver. So while you test w=
ith
> > > > > > > > > > > > Mediatek platforms, you still have to think about a
> > > > > > > > > > > > generic case and add necessary
> > > > > > > > > > checks.
> > > > > > > > > > > OK, I'll check it.
> > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +             anx7625_dsc_enable(ctx, tru=
e);
> > > > > > > > > > > > > > > > > +     else
> > > > > > > > > > > > > > > > > +             anx7625_dsc_enable(ctx, fal=
se);
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  static bool anx7625_bridge_mode_fixup(st=
ruct
> > > > > > > > > > > > > > > > > drm_bridge *bridge, @@
> > > > > > > > > > > > > > > > > -2258,26 +2450,33 @@ static bool
> > > > > > > > > > > > > > > > > anx7625_bridge_mode_fixup(struct drm_brid=
ge
> > > > > > > > > > > > > > > > > *bridge,
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode
> fixup
> > > > > > > > > > > > > > > > > set\n");
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     /* No need fixup for external monit=
or */
> > > > > > > > > > > > > > > > > -     if (!ctx->pdata.panel_bridge)
> > > > > > > > > > > > > > > > > -             return true;
> > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > >       hsync =3D mode->hsync_end - mode->h=
sync_start;
> > > > > > > > > > > > > > > > >       hfp =3D mode->hsync_start - mode->h=
display;
> > > > > > > > > > > > > > > > >       hbp =3D mode->htotal - mode->hsync_=
end;
> > > > > > > > > > > > > > > > >       hblanking =3D mode->htotal - mode->=
hdisplay;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "before m=
ode
> > > > > fixup\n");
> > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d=
),
> > > hfp(%d),
> > > > > > > hbp(%d),
> > > > > > > > > > > > > > > > clock(%d)\n",
> > > > > > > > > > > > > > > > > -                          hsync, hfp, hb=
p, adj->clock);
> > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev,
> "hsync_start(%d),
> > > > > > > > > > hsync_end(%d),
> > > > > > > > > > > > > > > > htot(%d)\n",
> > > > > > > > > > > > > > > > > -                          adj->hsync_sta=
rt, adj->hsync_end,
> adj-
> > > > > >htotal);
> > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > +     dev_dbg(dev, "before mode fixup\n")=
;
> > > > > > > > > > > > > > > > > +     dev_dbg(dev, "hsync(%d), hfp(%d), h=
bp(%d),
> > > > > clock(%d)\n",
> > > > > > > > > > > > > > > > > +             hsync, hfp, hbp, adj->clock=
);
> > > > > > > > > > > > > > > > > +     dev_dbg(dev, "hsync_start(%d),
> > > > > > > > > > > > > > > > > + hsync_end(%d),
> > > > > > > htot(%d)\n",
> > > > > > > > > > > > > > > > > +             adj->hsync_start, adj->hsyn=
c_end,
> > > > > > > > > > > > > > > > > + adj->htotal);
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > No. Please use drm_dbg_driver(), but not de=
v_dbg().
> > > > > > > > > > > > > > > > And anyway, this should go to a separate co=
mmit.
> > > > > > > > > > > > > > > OK, I'll not change it in this patch.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       adj_hfp =3D hfp;
> > > > > > > > > > > > > > > > >       adj_hsync =3D hsync;
> > > > > > > > > > > > > > > > >       adj_hbp =3D hbp;
> > > > > > > > > > > > > > > > >       adj_hblanking =3D hblanking;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +     if (mode->clock > DSC_PIXEL_CLOCK) =
{
> > > > > > > > > > > > > > > > > +             adj_hsync =3D DSC_HSYNC_LEN=
;
> > > > > > > > > > > > > > > > > +             adj_hfp =3D DSC_HFP_LEN;
> > > > > > > > > > > > > > > > > +             adj_hbp =3D DSC_HBP_LEN;
> > > > > > > > > > > > > > > > > +             vref =3D (u64)adj->clock * =
1000 *
> > > > > > > > > > > > > > > > > + 1000 / (adj->htotal * adj-
> > > > > > > > > > > > >vtotal);
> > > > > > > > > > > > > > > > > +             goto calculate_timing;
> > > > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     /* No need fixup for external monit=
or */
> > > > > > > > > > > > > > > > > +     if (!ctx->pdata.panel_bridge)
> > > > > > > > > > > > > > > > > +             return true;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >       /* HFP needs to be even */
> > > > > > > > > > > > > > > > >       if (hfp & 0x1) {
> > > > > > > > > > > > > > > > >               adj_hfp +=3D 1; @@ -2349,16=
 +2548,21
> > > > > > > > > > > > > > > > > @@ static bool anx7625_bridge_mode_fixup(=
struct
> > > > > > > > > > > > > > > > drm_bridge *bridge,
> > > > > > > > > > > > > > > > >                       adj_hfp -=3D delta_=
adj;
> > > > > > > > > > > > > > > > >       }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "after mo=
de
> > > fixup\n");
> > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d=
),
> > > hfp(%d),
> > > > > > > hbp(%d),
> > > > > > > > > > > > > > > > clock(%d)\n",
> > > > > > > > > > > > > > > > > -                          adj_hsync, adj=
_hfp, adj_hbp, adj-
> >clock);
> > > > > > > > > > > > > > > > > +calculate_timing:
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     dev_dbg(dev, "after mode fixup\n");
> > > > > > > > > > > > > > > > > +     dev_dbg(dev, "hsync(%d), hfp(%d), h=
bp(%d),
> > > > > clock(%d)\n",
> > > > > > > > > > > > > > > > > +             adj_hsync, adj_hfp, adj_hbp=
,
> > > > > > > > > > > > > > > > > + adj->clock);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       /* Reconstruct timing */
> > > > > > > > > > > > > > > > >       adj->hsync_start =3D adj->hdisplay =
+ adj_hfp;
> > > > > > > > > > > > > > > > >       adj->hsync_end =3D adj->hsync_start=
 + adj_hsync;
> > > > > > > > > > > > > > > > >       adj->htotal =3D adj->hsync_end + ad=
j_hbp;
> > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev,
> "hsync_start(%d),
> > > > > > > > > > hsync_end(%d),
> > > > > > > > > > > > > > > > htot(%d)\n",
> > > > > > > > > > > > > > > > > -                          adj->hsync_sta=
rt, adj->hsync_end,
> adj-
> > > > > >htotal);
> > > > > > > > > > > > > > > > > +     if (mode->clock > DSC_PIXEL_CLOCK)
> > > > > > > > > > > > > > > > > +             adj->clock =3D (u64)vref *
> > > > > > > > > > > > > > > > > + adj->htotal *
> > > > > > > > > > > > > > > > > + adj->vtotal /
> > > > > > > > > > > > > > > > > + 1000 / 1000;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     dev_dbg(dev, "hsync_start(%d),
> > > > > > > > > > > > > > > > > + hsync_end(%d), htot(%d),
> > > > > > > > > > > > clock(%d)\n",
> > > > > > > > > > > > > > > > > +             adj->hsync_start, adj->hsyn=
c_end,
> > > > > > > > > > > > > > > > > + adj->htotal,
> > > > > > > > > > > > > > > > > + adj->clock);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       return true;  } diff --git
> > > > > > > > > > > > > > > > > a/drivers/gpu/drm/bridge/analogix/anx7625=
.h
> > > > > > > > > > > > > > > > > b/drivers/gpu/drm/bridge/analogix/anx7625=
.h
> > > > > > > > > > > > > > > > > index eb5580f1ab2f..db931f5800b1 100644
> > > > > > > > > > > > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx=
7625.h
> > > > > > > > > > > > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx=
7625.h
> > > > > > > > > > > > > > > > > @@ -149,6 +149,8 @@
> > > > > > > > > > > > > > > > >  #define HFP_HBP_DEF          ((HBLANKING=
_MIN -
> > > > > > > SYNC_LEN_DEF)
> > > > > > > > > /
> > > > > > > > > > 2)
> > > > > > > > > > > > > > > > >  #define VIDEO_CONTROL_0      0x08
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +#define  TOTAL_LINES_L          0x12
> > > > > > > > > > > > > > > > > +#define  TOTAL_LINES_H          0x13
> > > > > > > > > > > > > > > > >  #define  ACTIVE_LINES_L         0x14
> > > > > > > > > > > > > > > > >  #define  ACTIVE_LINES_H         0x15  /*=
 Bit[7:6] are
> > > > > reserved
> > > > > > > */
> > > > > > > > > > > > > > > > >  #define  VERTICAL_FRONT_PORCH   0x16
> > > > > > > > > > > > > > > > > @@ -166,6 +168,32 @@
> > > > > > > > > > > > > > > > >  #define  HORIZONTAL_BACK_PORCH_L      0x=
21
> > > > > > > > > > > > > > > > >  #define  HORIZONTAL_BACK_PORCH_H      0x=
22  /*
> > > Bit[7:4]
> > > > > > > are
> > > > > > > > > > > > reserved
> > > > > > > > > > > > > > */
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +#define  H_BLANK_L                    0x=
3E
> > > > > > > > > > > > > > > > > +#define  H_BLANK_H                    0x=
3F
> > > > > > > > > > > > > > > > > +#define  DSC_COMPRESS_RATIO           3
> > > > > > > > > > > > > > > > > +#define  dsc_div(X)                   ((=
X) /
> > > > > DSC_COMPRESS_RATIO)
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > This assumes 1:3 ratio. Does anx7625 suppor=
t only
> > > > > > > > > > > > > > > > 8bpp / 8bpc
> > > > > > > > > mode?
> > > > > > > > > > > > > > > > Or does
> > > > > > > > > > > > > > > > 1:3 come from some other ratio?
> > > > > > > > > > > > > > > We only tested 1:3 compression ratio, 24bpp c=
ompress
> to
> > > > > 8bpp.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > What are hardware limitations?
> > > > > > > > > > > > > Anx7625 MIPI only support RGB888 24bpp. With DSC =
3:1
> > > > > > > > > > > > > compression, MIPI TX output 8bpp.
> > > > > > > > > > > >
> > > > > > > > > > > > As I wrote, a comment please.
> > > > > > > > > > > OK
> > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +#define  DSC_SLICE_NUM                2
> > > > > > > > > > > > > > > > > +#define  DSC_PIXEL_CLOCK              25=
0000
> > > > > > > > > > > > > > > > > +#define  DSC_HSYNC_LEN                90
> > > > > > > > > > > > > > > > > +#define  DSC_HFP_LEN                  17=
7
> > > > > > > > > > > > > > > > > +#define  DSC_HBP_LEN                  29=
7
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +#define  TOTAL_PIXEL_L_7E             0x=
50
> > > > > > > > > > > > > > > > > +#define  TOTAL_PIXEL_H_7E             0x=
51  /* bit[7:6]
> > > are
> > > > > > > reserved
> > > > > > > > > > */
> > > > > > > > > > > > > > > > > +#define  ACTIVE_PIXEL_L_7E            0x=
52
> > > > > > > > > > > > > > > > > +#define  ACTIVE_PIXEL_H_7E            0x=
53  /* bit[7:6]
> > > are
> > > > > > > reserved
> > > > > > > > > > */
> > > > > > > > > > > > > > > > > +#define  HORIZON_FRONT_PORCH_L_7E     0x=
54
> > > > > > > > > > > > > > > > > +#define  HORIZON_FRONT_PORCH_H_7E     0x=
55
> > > > > > > > > > > > > > > > > +#define  HORIZON_SYNC_WIDTH_L_7E      0x=
56
> > > > > > > > > > > > > > > > > +#define  HORIZON_SYNC_WIDTH_H_7E      0x=
57
> > > > > > > > > > > > > > > > > +#define  HORIZON_BACK_PORCH_L_7E      0x=
58
> > > > > > > > > > > > > > > > > +#define  HORIZON_BACK_PORCH_H_7E      0x=
59
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +#define  PPS_SIZE                     12=
8
> > > > > > > > > > > > > > > > > +#define  PPS_BLOCK_SIZE               32
> > > > > > > > > > > > > > > > > +#define  R_PPS_REG_0                  0x=
80
> > > > > > > > > > > > > > > > > +#define  R_I2C_1                      0x=
81
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >  /******** END of I2C Address 0x72 ******=
***/
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > >
> > >
> /***************************************************************/
> > > > > > > > > > > > > > > > > @@ -415,6 +443,7 @@ enum audio_wd_len {
> > > > > > > > > > > > > > > > >  #define MAX_EDID_BLOCK       3
> > > > > > > > > > > > > > > > >  #define EDID_TRY_CNT 3  #define
> > > > > > > > > > > > > > > > > SUPPORT_PIXEL_CLOCK
> > > > > > > > > > > > > > > > > 300000
> > > > > > > > > > > > > > > > > +#define SUPPORT_MIN_PIXEL_CLOCK      500=
00
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  /***************** Display End
> > > > > > > > > > > > > > > > > *****************/
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > @@ -454,6 +483,7 @@ struct anx7625_data {
> > > > > > > > > > > > > > > > >       int hpd_high_cnt;
> > > > > > > > > > > > > > > > >       int dp_en;
> > > > > > > > > > > > > > > > >       int hdcp_cp;
> > > > > > > > > > > > > > > > > +     bool dsc_en;
> > > > > > > > > > > > > > > > >       /* Lock for work queue */
> > > > > > > > > > > > > > > > >       struct mutex lock;
> > > > > > > > > > > > > > > > >       struct device *dev; @@ -479,6 +509,=
8 @@
> > > > > > > > > > > > > > > > > struct anx7625_data {
> > > > > > > > > > > > > > > > >       struct drm_connector *connector;
> > > > > > > > > > > > > > > > >       struct mipi_dsi_device *dsi;
> > > > > > > > > > > > > > > > >       struct drm_dp_aux aux;
> > > > > > > > > > > > > > > > > +     struct drm_dsc_config dsc;
> > > > > > > > > > > > > > > > > +     char pps_table[PPS_SIZE];
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > pps_table and drm_dsc_config can vary depen=
ding on
> > > > > > > > > > > > > > > > the mode and connected sink. THey should be=
 a part
> > > > > > > > > > > > > > > > of the atomic state rather than a long-livi=
ng
> > > anx7625_data.
> > > > > > > > > > > > > > > > So does
> > > > > > > > > dsc_en.
> > > > > > > > > > > > > > > No need to check sink monitor, because DSC on=
ly
> > > > > > > > > > > > > > > exist between SOC and Anx7625, sink monitor o=
nly
> > > > > > > > > > > > > > > receive normal DP signal from
> > > > > > > > > > anx7625.
> > > > > > > > > > > > > > > Anx7625 is responsible for decompression.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > The same way, they depend on the selected video=
 mode,
> > > don't
> > > > > they?
> > > > > > > > > > > > > Actually it depends on pixel clock, if it is more=
 than
> > > > > > > > > > > > > 250M, then need to do
> > > > > > > > > > DSC.
> > > > > > > > > > > >
> > > > > > > > > > > > Yes. So you should check if you can enable DSC in
> > > > > > > > > > > > .atomic_check() and set dsc_en correspondingly. At =
the
> > > > > > > > > > > > same time in
> > > > > > > > > > > > .atomic_check() you can not modify anx7625_data as =
it is a
> > > > > > > > > > > > check time, commit can be rejected or it can be a t=
est-
> > > > > > > > > > > > only check. So dsc_en should go to
> > > > > > > > > > drm_bridge_state-wrapping structure.
> > > > > > > > > > > >
> > > > > > > > > > > > At the same time I don't see a value in storing the=
 packed
> > > > > > > > > > > > PPS table, it is a short- lived data.
> > > > > > > > > > > Do you mean we can maintain dsc_en flag for each
> > > > > > > > > > > timing/resolution in drm_bridge_state structure, and =
set it
> > > > > > > > > > > in .atomic_check(), and check the drm_bridge_state's =
 dsc_en
> > > > > > > > > > > in .atomic_enable()? I don't know how to
> > > > > > > > > > make a drm_bridge_state-wrapping structure.
> > > > > > > > > >
> > > > > > > > > > Ideally yes. You should define
> > > > > > > > > >   struct anx7625_bridge_state {
> > > > > > > > > >     struct drm_bridge_state base;
> > > > > > > > > >     bool dsc_en;
> > > > > > > > > >   };
> > > > > > > > > >
> > > > > > > > > > Then define your own versions of atomic_reset and
> > > > > > > > > > .atomic_duplicate_state callbacks.
> > > > > > > > > >
> > > > > > > > > > Note, we currently don't have a way to check that the D=
SI host
> > > > > > > > > > actually supports DSC, you have to invent it.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > OK, got it, I'll try it and discuss with related people, =
thanks!
> > > > > > > > >
> > > > > > > >
> > > > > > > > Hi Dmitry,
> > > > > > > > 1. I double confirmed with Mediatek encoder, they didn't ha=
ve such
> > > > > > > > a capability which can tell us whether it can support DSC o=
r not.
> > > > > > >
> > > > > > > I'm not sure, what do you mean here. I'm talking a driver int=
erface,
> > > > > > > not about the Mediatek encoder on its own. The ANX7625 can be
> used
> > > > > > > with any DSI host, including one of the hosts which do not su=
pport
> > > > > > > DSC. The
> > > > > > > ANX7625 driver needs to negotate usage of the DSC with the
> underlying
> > > > > bridge.
> > > > > > >
> > > > > > > > 2. I tried to redefine .atomic_duplicate_state, and driver =
will
> > > > > > > > save dsc_en in new bridge state in .atomic_check(), but I f=
ound 2
> issue
> > > > > > > >   a). As MTK driver need get DSC information before
> > > > > > > > .atomic_pre_enable(), driver must check dsc_en and set DSC
> > > > > > > > parameters in .mode_set(). But I cannot get
> > > > > > >
> > > > > > > By the 'set' do you mean 'calculate' or 'program to the hardw=
are'?
> > > > > > >
> > > > > > > > drm_bridge_state data structure int .mode_set() interface.
> > > > > > >
> > > > > > > Don't use .mode_set() at all. Calculate parameters in
> > > > > > > .atomic_check() and then write them in .atomic_enable(). You =
should
> > > > > > > be able to fold
> > > > > > > .mode_set() into .atomic_enable() anyway.
> > > > > > Hi, MTK DSI encoder check DSC enable flag in DSI's .atomic_enab=
le()
> > > > > > interface, but
> > > > >
> > > > > Could you please provide me with a pointer to the source code?
> > > > >
> > > > > > upper layer call MTK dsi encoder .atomic_enable() is early than
> > > > > > calling bridge's
> > > > > > .atomic_pre_enable() interface. So, anx7625 bridge driver must =
set DSC
> > > > > > en flag in .mode_set().
> > > > > > >
> > > > > > > >
> > > > > > > >   b). Driver cannot get correctly dsc_en value from new bri=
dge
> > > > > > > > state in
> > > > > > > > .atomic_pre_enable() or .atomic_enable().
> > > > > > >
> > > > > > > I don't get this. Why can it not?
> > > > > > I dumped the bridge state's point
> in .atomic_check(), .atomic_pre_enable()
> > > > > and .atomic_enable() as following:
> > > > > >     at atomic_duplicate_state() allocated drm_bridge_state
> > > > > (0x0000000064d3ea49)
> > > > > >     at atomic_check() drm_bridge_state (0x0000000064d3ea49)
> > > > > >     at atomic_duplicate_state() allocated
> > > > > drm_bridge_state(0x00000000e0d6843d)
> > > > > >     at atomic_check() drm_bridge_state (0x00000000e0d6843d)
> > > > > >
> > > > > >     at atomic_pre_enable() drm_bridge_state (0x0000000081a4233a=
)
> > > > > >     at atomic_enable() drm_bridge_state (0x0000000081a4233a) It
> seems
> > > > > > atomic_pre_enable() and atomic_enable() used different
> drm_bridge_state
> > > > > data structure.
> > > > >
> > > > > This should not be happening. Please check the dmesg with
> drm.debug=3D0x16.
> > > It
> > > > > might give you a clue.
> > > >
> > > > Hi Dmitry,  the below is summarized kernel log, it is based on kern=
el v6.6.
> > >
> > > This is a very old kernel. Please don't use it for development. We ar=
e
> > > on the way to 6.14, development targets 6.15. Always use linux-next,
> > > drm-next, drm-misc-next or a similar branch. Using 6.6 means that the
> > > patch is completely untested on the contemporary kernels.
> > >
> >
> > Hi Dmitry, I failed to upgrade kernel to the latest 6.15 on our Chromiu=
m board.
>=20
> Maybe it's because there is no 6.15?

Sorry, I mean 6.14, I tried to porting code to 6.14, but failed.

>=20
> > So I cannot verify this patch on 6.15.
> > As I cannot verify on 6.15, and duplicate bridge state feature not work=
ing on
> v6.6,
> > and dsc_en flag is not necessary, I removed it in next version.
>=20
> I can't understand this comment. Please don't submit code that wasn't
> validated against recent enough kernels. v6.6 was published more than
> two years ago.

OK, so I remove dsc_en flags in next patch, this flag is no need anymore,
Driver always check currently pixel clock to decide whether enable DSC or n=
ot.

>=20
> >
> > >
> > > >
> > > > 1. MTK's DSC patch not upstream yet, so I cannot give a link, as lo=
g show,
> MTK
> > > call crtc atomic_enable
> > > > and will print out message "[drm:mtk_crtc_atomic_enable]
> > > mtk_crtc_atomic_enable 119", in this function,
> > > > MTK probe DSC flag and enable/disable encoder's DSC feature. And it
> called
> > > before
> > > > calling anx7625 bridge .atomic_pre_enable(). So it is too late if w=
e set DSC
> > > parameters in .atomic_enable().
> > >
> > > What is 'probe DSC flag'? You should calculate your params
> in .atomic_check().
> >
> > I don't need to calculate it in .atomic_check(), check it in .mode_set(=
)
>=20
> No. You must reject the mode if it can not be handled. Not being able to
> use DSC because the DSI host can't provide you with the DSC data is one
> of the examples.

I don't know whether the DSI host support DSC feature, and
I confirmed with MTK SOC MIPI develop engineer, there is no flag to tell br=
idge
driver that host support DSC or not.
So, I'll force set DSC parameters if pixel clock over 250M.

>=20
> >
> > >
> > > >
> > > > 2. With drm.debug=3D0x16, based on the below message, the
> drm_bridge_state
> > > in .atomic_enable() is
> > > > "0x00000000f555285e", I cannot find out where allocated it from ker=
nel
> > > message,
> > >
> > > Which state is returned by drm_atomic_helper_bridge_reset()?
> > Removed dsc_en flag, no need to keep this flag any more.
> >
> > >
> > > > seems it is not allocated by .atomic_duplicate_state(), but driver =
will
> > > call .atomic_destroy_state() to destroy it.
> > > > Currently, we verified this patch on kernel v6.6, I'm not sure whet=
her it is a
> bug
> > > on this kernel version.
> > > >
> > > > [ 1441.867169] anx7625: at atomic_duplicate_state() allocated
> > > drm_bridge_state (000000009c41f83d)
> > > > [ 1441.867173] mediatek-drm mediatek-drm.19.auto:
> > > [drm:drm_atomic_get_private_obj_state] Added new private object
> > > 00000000b3365a4b state 000000009c41f83d to 000000008a2c4e47
> > > > [ 1441.867194] anx7625: at atomic_check() drm_bridge_state
> > > (000000009c41f83d), drm_crtc_state(00000000d7a34c7e)
> > > > [ 1441.867204] anx7625: at atomic_destory_state() destroy
> > > state(0x000000009c41f83d)
> > > > [ 1441.875754] anx7625: at atomic_duplicate_state() allocated
> > > drm_bridge_state (000000004d0ab8c9)
> > > > [ 1441.875758] mediatek-drm mediatek-drm.19.auto:
> > > [drm:drm_atomic_get_private_obj_state] Added new private object
> > > 00000000b3365a4b state 000000004d0ab8c9 to 000000005bab791c
> > > > [ 1441.875783] anx7625: at atomic_check() drm_bridge_state
> > > (000000004d0ab8c9), drm_crtc_state(00000000fefeb2dd)
> > > > [ 1441.875805] anx7625 4-0058: [drm:anx7625_bridge_mode_set] drm
> mode
> > > set
> > > > [ 1441.875839] [drm:mtk_crtc_atomic_enable] mtk_crtc_atomic_enable
> 119
> > > > [ 1441.876649] mediatek-drm mediatek-drm.19.auto:
> > > [drm:drm_atomic_helper_commit_modeset_enables] enabling
> > > [ENCODER:41:DSI-41]
> > > > [ 1441.876655] anx7625: at atomic_pre_enable() drm_bridge_state
> > > (00000000f555285e)
> > > > [ 1441.879778] anx7625: at atomic_enable() drm_bridge_state
> > > (00000000f555285e)
> > > > [ 1441.886301] anx7625 4-0058: [drm:anx7625_dp_start] config dsi.
> > > > [ 1441.894841] anx7625 4-0058: [drm:anx7625_dp_start] compute
> > > M(14820608), N(691200), divider(2).
> > > > [ 1441.901921] anx7625 4-0058: [drm:anx7625_dp_start] success to co=
nfig
> > > DSI
> > > > [ 1441.913360] mediatek-drm mediatek-drm.19.auto:
> > > [drm:drm_atomic_state_default_clear] Clearing atomic state
> > > 000000005bab791c
> > > > [ 1441.913383] anx7625: at atomic_destory_state() destroy
> > > state(0x00000000f555285e)
> > >
> > > This looks strange a bit. The driver has programmed the state in
> > > atomic_enable() and then it gets destroyed without .atomic_disable().
>=20
> --
> With best wishes
> Dmitry
